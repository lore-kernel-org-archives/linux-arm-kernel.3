Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B383AD29C3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EF+qQZyPT/qsuzg53k1VSKJV+VsSYDYEvH4LG0YqI48=; b=qAsI/0PX03iCMK95Sroazuke99
	YFJWvNYiWrON3W4RtL7LwxHOlMLZs6lVw0P6tNkL6FfR3EPJ1iJUbjxz+V9VIOMMDbrJ4zZBKO/Si
	ya/xP5Vw3f+rxPKplN4Mj7sVtRZVa+QBtnoFUtQPCJ1PJUdTdinwRGFeITEHGwxBbV/u4Z9akgnX7
	J8yyXphW6FNKNdext2A1p+3bjSTJiezE7ijjhe3vOmwqtdq1FwvE0kLMYjrPLUxqLRmHL544/uHDB
	6Q9RG0ZiRDTGC1BbixRTh6vT8erJqn98kfMtB39mfRuQqr2r22wZXfnvq3XXt3y8gNCHSnLIu+kBI
	BXo104Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqyp-00000002KLf-1ZZ1;
	Mon, 19 Jan 2026 15:15:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhqyZ-00000002KJx-03x7
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 15:15:45 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id B20194E4217C;
	Mon, 19 Jan 2026 15:15:28 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7ACB760731;
	Mon, 19 Jan 2026 15:15:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89BF110B6B111;
	Mon, 19 Jan 2026 16:15:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768835727; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=EF+qQZyPT/qsuzg53k1VSKJV+VsSYDYEvH4LG0YqI48=;
	b=F7y+vxrZtCX69fbEjwMcHPuD0RLxU6ivMa1qTosvLSpgg9mwFqhZgm9WHwXgjLVku1yHUX
	DYFzW2p2jUZWa3ISEVED51wynIRvI6sWLl5QmCT+RA1iJ3bUF4DcsTUlvmv8ASP9iYCDEn
	tXkAwfnbZKWQ/2R29T3nKnbh3Lpl4BToUzWWpcHs99vqT7Dnf3Mh5nkdziZe7aXEku/B87
	QiJMf0zc0yA2+tobwRQOELPlavSoiTTPMusy6qqbnFTzDq5ctis1vh3+H8jDvEywrNfHhg
	oyqI52a0kn2wXpExfC9q8czWQvXrYXcud/SXOFdjyXXmvr6IZFXkEXfwUWVrFA==
Message-ID: <821723dc-387c-4d57-aa73-1e5556fed0bc@bootlin.com>
Date: Mon, 19 Jan 2026 16:15:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC net-next] net: stmmac: enable RPS and RBU interrupts
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <E1vgtBc-00000005D6v-040n@rmk-PC.armlinux.org.uk>
 <33b06fd6-3eb3-4eb7-8091-7ebe8a8373ba@bootlin.com>
Content-Language: en-US
In-Reply-To: <33b06fd6-3eb3-4eb7-8091-7ebe8a8373ba@bootlin.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_071538_129896_CC9F0018 
X-CRM114-Status: UNSURE (   7.19  )
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


>> I'm not sure why we publish these statistic counters if we don't
>> enable the interrupts to allow them to ever be non-zero.

 [...]

> I personnaly find the stat useful,

Just to elaborate a bit more, I'd say I find it even harmful to have the
stat stay stuck at 0, which would be misleading when debugging while
relying on these counter values, especially if other stmmac flavours
make proper use of it.

Maxime

