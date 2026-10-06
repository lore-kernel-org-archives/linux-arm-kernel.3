Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9719ACA5FED
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 06:24:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Message-ID:References:In-Reply-To:Subject:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YHZgo3sn5Xx8vFkJv9zQzlxXblhckwZQx4petbN8ulM=; b=DXesy+Wk8qMwcZ7L5wQBsfVUfX
	rU4iLmUPau5csG9/t14qIgj19SgLGgqlUbwPJO9CEa7aOw7wTAOBhMvACw3Z/+Ek9hKCndd7Y1NWm
	GVBAOjQFaNiHwm08l2MOe8QGfwEqtTKW94G2Xhl628+RjHRK9EwVokS6reGSbc6e59DBmgo+aF216
	qS26lz3xD/os44TtBlyrFqfqrvWc0FtkakDq8H7HOwp4UtBI8cW9KlxLWR3ySQcYeLXPskSgAS1Xq
	Y5KH93uZHgZ8n1iBnnznUyy/DPDGw9WxuvFZruR13vv1dA5PuzJycIyJsjC26aXib9gpdBAOwaaM3
	eEqv02Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyam-000000007JW-16jP;
	Tue, 06 Oct 2026 06:24:00 +0000
Received: from mail.tipi-net.de ([2a03:4000:43:185::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDyak-000000007Ir-0UpP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Oct 2026 06:23:59 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2B066A0572;
	Tue,  6 Oct 2026 08:23:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tipi-net.de; s=dkim;
	t=1791267834; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=YHZgo3sn5Xx8vFkJv9zQzlxXblhckwZQx4petbN8ulM=;
	b=qqBP1BQVcPP5COwO+K7Z/jJx1NW64LtDbsISWQRo4vPSX2tuQnWjIaV8U3GA7B/Qtp8Mma
	7SKtJaaTyI9N7SVeBnN+b+U3pOB8xL4oXu0TS+n8YlvzRyZux7xn2ndsOKzIKrmaLVhDgr
	PSoDYS4F0MHxXkzYyyUnK3aZZfV/XVVHQ0DM8Yk+R3RlZyZ/Erp5CC4Dng3fmbto08Cf0z
	Q2ZjCLyt8y/5EvSk2av6YTiLgIhANJ+WJyjsMLANXO0NQFwVLXjVVT/Vl/1HO4CgXJoY6M
	wnZdLQAFE6ZxnPwlhI4CrwmkXxgUSyYqZ6TfrnRwQ394qLHK6fwM3/Su1Dl2UQ==
MIME-Version: 1.0
Date: Tue, 06 Oct 2026 08:23:52 +0200
From: Nicolai Buchwitz <nb@tipi-net.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>, Jakub Kicinski
 <kuba@kernel.org>, Maxime Chevallier <maxime.chevallier@bootlin.com>, Andrew
 Lunn <andrew+netdev@lunn.ch>, Eric Dumazet <edumazet@kernel.org>, Maxime
 Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>, Serge Semin <fancer.lancer@gmail.com>,
 "David S. Miller" <davem@davemloft.net>,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: stmmac: unwind the WoL IRQ after a safety IRQ
 request failure
In-Reply-To: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com>
References: <20260930-stmmac-irq-unwind-v1-1-0c8a053761c7@gmail.com>
Message-ID: <22a4dbf4a758adf10237dbf7681a57cf@tipi-net.de>
X-Sender: nb@tipi-net.de
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261005_232358_339608_20C07543 
X-CRM114-Status: UNSURE (   6.68  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

Hi James

On 1.10.2026 06:31, James Hilliard wrote:
> The safety IRQ is requested after the MAC and optional WoL IRQs. If its
> request fails, stmmac_free_irq() frees the unregistered safety IRQ and
> leaks the WoL handler. This can warn about an already-free IRQ and make
> the next open fail.
> 
> Move the safety and WoL cleanup labels into reverse acquisition order.
> This also fixes unwind after later per-queue IRQ request failures.

Does it? AFAIU those cases already fell through both the WoL and safety
free_irq() calls before? Only the free order changes, which makes
REQ_IRQ_ERR_SFTY the only broken case?

> [...]

With that sentence above dropped or reworded:

Reviewed-by: Nicolai Buchwitz <nb@tipi-net.de>

Thanks,
Nicolai

