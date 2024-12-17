Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 369BAE77187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 13:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Kd3IGr2V/i3QibsHAOuhQzdc631DeRvaF4HW0sqEduU=; b=eRbz4GtbYZ2iFiiDR3HXp3XOiL
	GX18geTcJwPGqVC+Qx99yh0wiBarYPXG3E0bKVXKtPqo0eGKjMJ5I7R7psaux4zMcgtKCYB7yvu1X
	UYj82NB9j+gfy0P/EPxI14cltfoSCQxlCC0czlATF9fqEC0gtjpwaaz5OsWyInoGbb8JALJxzLhfE
	TqebF1Mli5Lt1fQGsw7ksknCv38cj2RSZrPwK+dh2mhx3hHblnrd5Qb372kpWrrTtdJ5+I8gC80hv
	7jYyd0ZvtpdDkMPNoICAlR0LZox28QyzeR8jcw8e13dC8dHD17vhWjo8DU9ptXKzuCUL08B8YfvQA
	PyC8ZMmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXTp-0000000DXj5-3S9f;
	Tue, 17 Dec 2024 13:19:17 +0000
Received: from relay5-d.mail.gandi.net ([2001:4b98:dc4:8::225])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNXSk-0000000DXZT-1sOh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 13:18:11 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0E0091C0003;
	Tue, 17 Dec 2024 13:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1734441488;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Kd3IGr2V/i3QibsHAOuhQzdc631DeRvaF4HW0sqEduU=;
	b=al8BK7E2vHr/Dm3yUxFxnfQiHaN4/I5+qErruTpojlLNU/xCWEWsK4wytoRPFVK9ShwuwW
	+VACykAtQfs51b0Cl5BpikGyuUusr+0ckSEsOOI21yss47v9txcQnFnsYTvV6dwC0Hy85a
	rySjiIKZnB1BtIx9U4Z/a9JMQP/h9yAyLMBHvU5c2uQzrFshkLlyx3pnTHZglaryyHZZn+
	bC+qXNlMGuJoRaT15SxaSWC/cePRHTFfHv0goQX4roXaDMfUhJygC3RqQC4zu+s3Qs6f0L
	07RHH9lHZf4GFYjJY5DDEPzn1VCxPKmgvoDyPTRbp/XIO6AH/SfV7+xNRJv4sQ==
Date: Tue, 17 Dec 2024 14:18:07 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>, Jose Abreu
 <joabreu@synopsys.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 davem@davemloft.net, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Maxime Coquelin
 <mcoquelin.stm32@gmail.com>, Alexis =?UTF-8?B?TG90aG9yw6k=?=
 <alexis.lothore@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 4/5] net: pcs: lynx: fill in PCS
 supported_interfaces
Message-ID: <20241217141807.6b1ed05a@fedora.home>
In-Reply-To: <E1tMBRL-006van-3c@rmk-PC.armlinux.org.uk>
References: <Z1yJQikqneoFNJT4@shell.armlinux.org.uk>
	<E1tMBRL-006van-3c@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_051810_634999_6F8D027A 
X-CRM114-Status: UNSURE (   6.42  )
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

On Fri, 13 Dec 2024 19:35:07 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Fill in the new PCS supported_interfaces member with the interfaces
> that Lynx supports.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thanks,

Maxime

