Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D579C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aSzSwKdiOyhfRAmkgtryOTqsNj7Y6W/yZ2lJoe+sm1s=; b=NinpwCveRI3dWlGA87W/mOtjGp
	MFbw+2BFTLZr4F618BzDVWuYHYYzBzLG6Z78FFV4zztpazE4V2IBLCLBaFy0x0g+c8izTzFWTtHQA
	2QwhteuIcwvbMt/fIdxkqkw8n1UOOIV5K+fj8aDI2GHJ+0eW9l76QPaV0eC67r9ELQWeVT1Dh0Jme
	DcmakCN5h/1Zr5RHANfiEFn7gXBfGOhkEpMCyhPDSYxJVYb0wTNjmfoT5XmRtSlShK3vJsnwfnd8r
	jh6YO42tyJXSiJFrdFJIrSOjiD1hie8j68QQiVBueo8SEFSQRNSFjl2n0Ju79aogasvb8ZEk85tl0
	0q77ZG2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRY-0000000Cfqx-3Baa;
	Tue, 01 Sep 2026 16:34:40 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RRU-0000000CfpD-2VK9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:34:38 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788280429; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=jDxfWGQAvL0qTaX362S0GAKT1dNbUHBBeVr8edgQonH6NEK46AXLtAHx0aiOwZzyXXab+Qm44TuU7Fxi9eLpNJTEapcbWmsVYjnFqC5KXx9s6cU2F0H9y/FRmv7Uzh3iYQCKIrz+aNgkAkMlMcKarlWawh/TBDbq9MnhOgevCsQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788280429; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aSzSwKdiOyhfRAmkgtryOTqsNj7Y6W/yZ2lJoe+sm1s=; 
	b=XmIgUJoS9mL+tg5zPsiBaeM9U5A6lvUkShybZDACb5DraepsMdvMch2O4vsHu8G3u0qEnPMELnIICJd4u+hvkhcWEiGLPexv24QHCdCcOaOxleXjrdi0hxh1dc6kSEupv+dJwIGBC2jkekV9ALTQNLl4kZLxqOe+4mBgRbXyyDo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788280429;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=aSzSwKdiOyhfRAmkgtryOTqsNj7Y6W/yZ2lJoe+sm1s=;
	b=izm7AwEwUZ6Ix97/NfYMiLDMn1TgHl0z2BKTdbaFqJVSrDmvqMjesw+YuMC75pFY
	g6QPLjkL9oCTyynjVdUyNoLzhubLv2jaBeKS0OqCTrLeG7++9JVzX3x+s7UC4zNgCKk
	dbTFGmVe377NH04L7EHEMb0/SxXlzpaCMOOpQHXM=
Received: by mx.zohomail.com with SMTPS id 1788280425896668.4069042560614;
	Tue, 1 Sep 2026 09:33:45 -0700 (PDT)
Date: Tue, 1 Sep 2026 16:33:22 +0000
From: Yao Zi <me@ziyao.cc>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Russell King <linux@armlinux.org.uk>,
	Heiner Kallweit <hkallweit1@gmail.com>, Yao Zi <me@ziyao.cc>,
	Frank <Frank.Sae@motor-comm.com>
Cc: thomas.petazzoni@bootlin.com,
	Alexis =?iso-8859-1?Q?Lothor=E9?= <alexis.lothore@bootlin.com>,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH net-next 0/3] net: phy: motorcomm: Enable analog frontend
 DAC on yt8531S
Message-ID: <apb-UvaZYQljYJ5I@pie>
References: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.256.78
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_093436_720692_2F46015D 
X-CRM114-Status: GOOD (  21.06  )
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

On Mon, Aug 31, 2026 at 09:37:42AM +0200, Maxime Chevallier wrote:
> In the process of getting more stmmac boards to run tests on, I've
> acquired a nice and inexpensive YT6801 PCIe card, that can do
> 10/100/1000BaseT. It uses stmmac's PCI variant dwmac-motorcomm, as well
> as an integrated Motorcomm PHY (the YT8531S).
> 
> However while testing the card, I had link-up maybe once every 10
> reboots, and no traffic whatsoever. Comparing with the out-of-tree
> driver provided by Motorcomm, it was found that some Analog Frontend DAC
> needs a clock to be enabled, and indeed it fixed the issue.

As a side note, this operation was added between v1.0.30 and v1.031 of
the vendor driver, and we haven't observed similar issues with the
current YT8531S driver, so maybe this is a silicon issue only present in
later revisions of the chip.

If interested, you could find v1.028, v1.029, and v1.031 of the YT6801
driver here[1]. And REG_MII_EXT_AFE_CONTROL_CLKDAC_AON_POS was
introduced in this commit[2].

> As I don't know much about this device, this series implements the DAC
> CLK configuration in the YT8531S driver only for the integrated version,
> that uses the GMII interface.
> 
> I split that into 3 commits, the first 2 are splitting-out the YT8521
> and YT8531S config_init(). The third commit adds the DAC configuration.
> 
> This was tested on YT6801, which now reliably reports link up.
> 
> Maxime Chevallier (3):
>   net: phy: motorcomm: Split yt8521_config_init() page management
>   net: phy: motorcomm: Add a dedicated .config_init for YT8531S
>   net: phy: motorcomm: Enable analog frontend on YT8531S
> 
>  drivers/net/phy/motorcomm.c | 76 ++++++++++++++++++++++++++-----------
>  1 file changed, 54 insertions(+), 22 deletions(-)
> 
> -- 
> 2.55.0
> 

Regards,
Yao Zi

[1]: https://github.com/deepin-community/kernel/blob/linux-6.6.y/drivers/net/ethernet/motorcomm/yt6801/
[2]: https://github.com/deepin-community/kernel/commit/721c505713d104fe48a817e703936dfe583b8ae4

