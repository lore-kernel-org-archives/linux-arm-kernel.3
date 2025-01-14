Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19689C02180
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 02:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1SIEN3E6aqrThhxwat3Nx/SdisRq4J3tMD+nuJgrUc=; b=mMRmVtcN629lCS+aLIqf9g8J72
	8jAD/J5bFD8ZvpPyWLMEGAGdGYUz09zPQdih9LSrpTwQmL/At5ksLxp8sPMrQdBI3b3wV1Q0wSqt1
	aHIxGbLoEAfL24pb0DysczqPr8lF/SajqVvOT+BftuX6cEncanw0hiDc29hDDkONn9v7r2aUm3fHE
	FSF8BihYTeu/tAVkO45CF1BqRGJq2nbTMTnwZxOnISBo4PlSTpy5sLWuG+LrtnkfQM5hW7Buwy9XA
	e7KWba1dkYh4upPoelXsmcGMRWeIvKS3Ce+9Wb5VoeDOtJeg+CR4u8ZZPsqHPGqNDiIAN5vxNCeeI
	Sso2Apxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWX1-00000007E6e-0aNk;
	Tue, 14 Jan 2025 02:19:51 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXWUg-00000007DhB-2ikQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 02:17:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=P1SIEN3E6aqrThhxwat3Nx/SdisRq4J3tMD+nuJgrUc=; b=ig1VG/JvMUnpVn3G1nBjH7GmvJ
	zoLv1nz0dIwYHbMWp7Z9UvXr/HpAd2Ze/y9+Di+8jRDXjo+sLl4ShiK2e81vMUX8yZE8X4V4rQ0NH
	C6ShuctKHa25uulz+afqGQTrob6TnSSLEQForwvpbl8KGrFEgSKsrhevMK0toA77jBts=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tXWUD-004Im6-Bo; Tue, 14 Jan 2025 03:16:57 +0100
Date: Tue, 14 Jan 2025 03:16:57 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mcoquelin.stm32@gmail.com,
	richardcochran@gmail.com, devicetree@vger.kernel.org,
	ychuang3@nuvoton.com, netdev@vger.kernel.org,
	openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
	linux-kernel@vger.kernel.org, joabreu@synopsys.com,
	schung@nuvoton.com, peppe.cavallaro@st.com, yclu4@nuvoton.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
Message-ID: <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_181726_683312_0EE61183 
X-CRM114-Status: GOOD (  10.45  )
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

> > +#define NVT_MISCR_RMII          BIT(0)
> > +
> > +/* 2000ps is mapped to 0x0 ~ 0xF */
> 
> Excuse my ignorance: What is ps?

picoseconds. An RGMII link needs a 2ns delay between the clock line
and the data lines. Some MACs allow you to tune the delay they can
insert, in this case in steps of 2ns / 16.

> > +#define NVT_PATH_DELAY_DEC      134
> > +#define NVT_TX_DELAY_MASK       GENMASK(19, 16)
> > +#define NVT_RX_DELAY_MASK       GENMASK(23, 20)
> > +
> > +struct nvt_priv_data {
> > +	struct platform_device *pdev;
> > +	struct regmap *regmap;
> > +};
> > +
> > +static struct nvt_priv_data *
> > +nvt_gmac_setup(struct platform_device *pdev, struct plat_stmmacenet_data *plat)
> > +{
> > +	struct device *dev = &pdev->dev;
> > +	struct nvt_priv_data *bsp_priv;
> > +	phy_interface_t phy_mode;
> > +	u32 tx_delay, rx_delay;
> 
> Please append the unit to the variable name.

Which is trick, because they are in units of 2000/16 of a picosecond.

	Andrew

