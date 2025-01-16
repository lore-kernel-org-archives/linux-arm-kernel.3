Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C865C02187
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jan 2025 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMMO4I+XOjicEs5GOnQABU5X5tsmLYQ+6VrW28JvHQM=; b=X3/qHFIHOtIP/Hbwo+Os0fzUXz
	PsVTzPhx5LUdqW51PLDz7zcaySYxjs1qYI4ex51nwKUJ1LHN9jBEunqMyOoUmJGsl4unECPZQq8xn
	YQ+wjwr6tKi2SYJpahxFyU7aFdVYNrnk1pt14YvR6g5uMTmrfoz2TzfE9F1j9sT0M1VuuaQq7y303
	YLm3m/CVEbPODLj01wHZWBBaiEhXUymkp8pjYxDgX7Hi+i4ulvXmBCNOlXqpP4XRDTjQVjPzC5sop
	/RRLNau00LYNpENkAMK74+YjWRmPse5jNaC42+qMej9h0/bE3bpG4tSQwXGm1nJyRpAJheSPlsw6J
	eWCxBCUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLFa-0000000EDEX-3PDl;
	Thu, 16 Jan 2025 08:29:14 +0000
Received: from relay9-d.mail.gandi.net ([2001:4b98:dc4:8::229])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYLEK-0000000ED52-3XX4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jan 2025 08:27:58 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id E9213FF804;
	Thu, 16 Jan 2025 08:27:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737016073;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CMMO4I+XOjicEs5GOnQABU5X5tsmLYQ+6VrW28JvHQM=;
	b=h4cuNtj2wuZBJ25fhPMZnM2MQBVVazS1TWD82c/CYS/Z8CDdBBb2/LIjQwokQdG5kpiBY1
	sx0hPsvV0uFsTD6zMzIpb0MgMXjLQ5fohkPFWaqbawQWndJ/7UfjfXH43vXpqyZb6CGYh7
	Y/hmmduxAphLn1XA6AAo1oaPRhdAIk2Fd5emW1LK+QV7fM1Wy/O2AwEVrcZds2SHxltBkW
	XIBrremK6YGd1wT5kQBC9sn9zQUDxvU7pMl4p6gaHnEFW3Zf19Qgy6zlCuZ2lCJWStHYRb
	8LjX029NzekFIAcGyiuDZS+L2sDoLBKp1ECYHlideH3+0OUJ6cAOeQXYpoXsXQ==
Date: Thu, 16 Jan 2025 09:27:43 +0100
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, Bryan Whitehead <bryan.whitehead@microchip.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, Marcin Wojtas
 <marcin.s.wojtas@gmail.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 netdev@vger.kernel.org, Paolo Abeni <pabeni@redhat.com>,
 UNGLinuxDriver@microchip.com
Subject: Re: [PATCH net-next 6/9] net: mvpp2: add EEE implementation
Message-ID: <20250116092743.34ae7dad@2a02-8440-d117-22fd-0cfc-7753-7eff-f472.rev.sfr.net>
In-Reply-To: <E1tYAE0-0014Pz-R9@rmk-PC.armlinux.org.uk>
References: <Z4gdtOaGsBhQCZXn@shell.armlinux.org.uk>
	<E1tYAE0-0014Pz-R9@rmk-PC.armlinux.org.uk>
Organization: Bootlin
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-GND-Sasl: maxime.chevallier@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250116_002757_193670_414A0349 
X-CRM114-Status: UNSURE (   9.54  )
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

Hi Russell,

On Wed, 15 Jan 2025 20:42:52 +0000
"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk> wrote:

> Add EEE support for mvpp2, using phylink's EEE implementation, which
> means we just need to implement the two methods for LPI control, and
> with the initial configuration. Only SGMII mode is supported, so only
> 100M and 1G speeds.
> 
> Disabling LPI requires clearing a single bit. Enabling LPI needs a full
> configuration of several values, as the timer values are dependent on
> the MAC operating speed.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Thank you,

Maxime

