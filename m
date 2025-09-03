Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16901CA0FF2
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 15:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=El/Xm4jDg9HBHpVGHlt56E3MYyMc4lLjk5+B4z84LHQ=; b=vzZ4TdJK/2E61nEmJOKQuk+vGz
	2g1c3hYAv/hCf4NqnvSa5+C63eXZjgOw2aSWFYdM1gz0I1L8w2OAHFNMG1AbCkm//hImJuT1xj6LV
	HZOTdKKTMVjqy+Q6ZrP2wiM5f4FKxXBGeejEhtubkRYWmHo5Xk6oAfkNEYQZ8aYsCFQwCicRtG1ye
	N4TRVN+9JPFA1Mq7trfy91GcEooHdcfloF6JnZfVT/dDWEHIgoK9aRCY1rCi3HWuhSsgu9F8u/keq
	pTsB/J2o1glzTtUXuQ2D7BAi58Zyrwvf+WQNFu6MzxkdNxVPMPZ6BkQazybdjmK340QSLz/lPYzi7
	5YGw3jJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utpeQ-00000006xIk-0VbX;
	Wed, 03 Sep 2025 15:43:58 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utnAc-00000006VqJ-2xp3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Sep 2025 13:05:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=El/Xm4jDg9HBHpVGHlt56E3MYyMc4lLjk5+B4z84LHQ=; b=aXhrCKnwDwPyqgIkyh8xbWumNA
	bPACdkz1r6AIkAK/Zw40Q5DBIp/z2qW3NoY1WxV9QUemaGBM64DbKolPC/zl4T5gQAXj1BR7FXYGq
	7KKUgn7U4EKE6m9A/fqCvttpXv+Yii43tk6MAc1K67AK/WYD6KMQW58Yyjuoi/iU9fdiW4qdR35w9
	MJGI+6T5ZsDs5lza0HmSvHrlqeCzFrLIbQNn02SQvwa2IVYbLzLCdQDkoO8IoMhKjVhRLpF1P/+bw
	aAIRnjDCRAQPrARjfSIXjoXtqih5XId4N1802+vC/XO9ItWlijCoYwyyv3BTYDOU05qRXZdmyocGG
	dxBLcRIg==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:57812)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <linux@armlinux.org.uk>)
	id 1utnAW-000000000Z2-3nVw;
	Wed, 03 Sep 2025 14:04:57 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.98.2)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1utnAU-000000000YK-22jm;
	Wed, 03 Sep 2025 14:04:54 +0100
Date: Wed, 3 Sep 2025 14:04:54 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>
Cc: Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, netdev@vger.kernel.org,
	Paolo Abeni <pabeni@redhat.com>
Subject: Re: [PATCH net-next 00/11] net: stmmac: mdio cleanups
Message-ID: <aLg89lkAiC_JxYP0@shell.armlinux.org.uk>
References: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aLg24RZ6hodr711j@shell.armlinux.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_060502_749235_CE102472 
X-CRM114-Status: GOOD (  12.85  )
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

On Wed, Sep 03, 2025 at 01:38:57PM +0100, Russell King (Oracle) wrote:
> Hi,
> 
> Clean up the stmmac MDIO code:
> - provide an address register formatter to avoid repeated code
> - provide a common function to wait for the busy bit to clear
> - pre-compute the CR field (mdio clock divider)
> - move address formatter into read/write functions
> - combine the read/write functions into a common accessor function
> - move runtime PM handling into common accessor function
> - rename register constants to better reflect manufacturer names
> - move stmmac_clk_csr_set() into stmmac_mdio
> - make stmmac_clk_csr_set() return the CR field value and remove
>   priv->clk_csr
> - clean up if() range tests in stmmac_clk_csr_set()
> - use STMMAC_CSR_xxx definitions in initialisers

It would be great if someone can test this series please.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

