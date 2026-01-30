Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CC4E6BF30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 19:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4FPRRHG65/7gK1cs/oNVTykKIz42PNB3W+KzByRE1A=; b=bNFC8gbPF8B6+QYaRX6LmrqZ1E
	MiiwycjWsIUhjlYxIMsxkUit3gFgsJZA1Dep0mE6o5b8+TIyI6h/HIIqUWmRAoTBAwzbcaYrwiVs6
	R+p6Fccsl2smE71xHrYw7cUAQMZw2dCJpZvUALZkjX1R2pebQMG+EAyX9OeajloQTXsxGvY5Iiqdu
	ePvIP/npjkbGy7LvMcYT9l0EL1VsnnP35n7ZTQmlICLTZqVkvXIfRAMOY86GRXPzPy/WAtcxha0dH
	5LeRwok1z0ivkoQXgfYdraKFtV+2dRvq4Oof+/U4qZt7AHaFTducKaqEbN74KSuBXqurPx6QQnnxc
	w9dqFWjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlu1E-00000001sMx-48mw;
	Fri, 30 Jan 2026 19:19:01 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlu1B-00000001sMc-1L0R
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 19:18:59 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DCD151A2B42
	for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Jan 2026 19:18:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A3C8E6075A;
	Fri, 30 Jan 2026 19:18:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9CF06119A885C;
	Fri, 30 Jan 2026 20:18:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769800731; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Y4FPRRHG65/7gK1cs/oNVTykKIz42PNB3W+KzByRE1A=;
	b=NpZRguy8oaVdBEFrYrzUp16bYHyPP/N9L0XrejaRHGf3l3cNE/RsxCf7qX2IErg3JBOa9/
	L8OS1+gaSoEYt4BnHzcbFCSlpwnTSFZnw+2jFBiYhvTi77ZyhqRBBFTB0DGlM6+V0nDGyk
	mFF9+9DzhZCzliXBJ9GUnZIBHohfHJJ9FuukEuYqVfeurYbBteFLOHabFijM5hmD2+96jp
	OTl5YxhgJjtjJDnPXkyj/HjGopuZRXOHONy05Qc8jxEVrJiydrwUVZk8Q7laI2qY0Jz4Cz
	Z13S2xykO/dwa9BrBTHCaRmwiWiyrWMKxp3BaEAx0Ws+Hw1s6qHznp2cQN6+Bg==
Message-ID: <ee26c05c-a7dd-4334-b359-353449e50662@bootlin.com>
Date: Fri, 30 Jan 2026 20:18:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/3] net: stmmac: clear half-duplex caps where
 unsupported
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: Andrew Lunn <andrew@lunn.ch>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, netdev@vger.kernel.org,
 Paolo Abeni <pabeni@redhat.com>
References: <aXyRlFw7ZuhRPiKo@shell.armlinux.org.uk>
 <E1vlmOQ-00000006zuz-0ffN@rmk-PC.armlinux.org.uk>
 <9dfdeee0-7758-439b-a2a5-a7f243427cf4@bootlin.com>
 <aXzzxeRsbnF8-nAq@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aXzzxeRsbnF8-nAq@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_111857_501093_D0B706C6 
X-CRM114-Status: UNSURE (   7.63  )
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

On 30/01/2026 19:09, Russell King (Oracle) wrote:

> If you look at /sys/kernel/debug/stmmaceth/ethX/dma_cap, it should
> say whether half duplex is supported (I guess in your case it will
> be, it's probably very unlikely not to be.) However, would be worth
> knowing whether the if() is taken or not!
> 

Just rebuilt a kernel w/ debugfs support, and indeed I have :
[...]
	10/100 Mbps: Y
	1000 Mbps: Y
	Half duplex: Y
[...]

So looks like the if() isn't taken :)

Maxime

