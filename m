Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12564C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 00:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BT+cecgcNjbVR7I2Q6p5AdYr9Ocl1W16ZvyXVTG3eqE=; b=oZg+mOkitNPImvAa3gI32qlI4G
	9BpEnP+Rm0NxndmilC0EL6udtmm4LCzwj3XvJ3/9iBW5bAMdjVvqPozq6yGdQRb6GCCdacqs1LW3b
	yIBStwJ5qelYQWCNl14z427JtRAQm57hzLR3ckCO021J/7IZXNwsEZbwLhTGyR5rJcEvXKiTydLgA
	L76wZwQlMyBvW/HaHDrt0112+s6XVLN6TeiEqhpKZCYLaerRrSd2fJpat/azmC7AgfVRgFZI3cFXD
	zuIXyUUyPOJ/7Lo8Bh4MTRzABOGVVgSSpEz7EaoZJFPp1PkdzE5VAJJjKRrd/4Yf1+lr1tlb8+XTJ
	opUFG7QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz14d-00000001h1D-0Ael;
	Wed, 26 Aug 2026 00:00:59 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz14b-00000001h0r-1yyQ;
	Wed, 26 Aug 2026 00:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=BT+cecgcNjbVR7I2Q6p5AdYr9Ocl1W16ZvyXVTG3eqE=; b=B4x+OnjxkiaofaZ3y8mFKXvSGh
	NBGAyEMoto4kBMslvsYJp/DWC7I5tMCpdB3KYWgR792J+1QPIrbpGDJgSgZWH6xbnxI7zrnkOZkF7
	uTuFNivYuT8spgqkFWdmP9bemtffuaco90nUzQHE5cZp8G1384+bHClkByE+Hf522CAo=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1wz140-001RNK-DQ; Wed, 26 Aug 2026 02:00:20 +0200
Date: Wed, 26 Aug 2026 02:00:20 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, ansuelsmth@gmail.com, hkallweit1@gmail.com,
	linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
	kuba@kernel.org, pabeni@redhat.com, daniel@makrotopia.org,
	dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next 3/3] net: phy: mediatek: support EcoNet EN751221
 gbit SoC PHY
Message-ID: <d7d86078-8a29-4e7f-a62e-91f6b266bea1@lunn.ch>
References: <20260825193456.1823985-1-cjd@cjdns.fr>
 <20260825193456.1823985-4-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260825193456.1823985-4-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_170057_517221_8D604FB7 
X-CRM114-Status: UNSURE (   8.85  )
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

> +static int en751221_tx_amp_compensation_tbl[2][TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {

const?

> +static u8 en751221_zcal_to_r50ohm[64] = {

const?

> +	125, 125, 125, 125, 125, 125, 124, 121, 118, 115, 112, 110, 108, 105, 103, 101,
> +	 99,  97,  95,  77,  75,  73,  72,  70,  68,  67,  65,  64,  63,  45,  44,  43,
> +	 41,  40,  39,  38,  37,  36,  35,  34,  32,  32,  31,  30,  13,  12,  11,  10,
> +	  9,   8,   8,   7,   6,   5,   5,   4,   3,   2,   2,   1,   0,   0,   0,   0
> +};

> +/* EN751221 also mirrors RG_BG_RASEL into CHIP SCU register 0x16c. */
> +static void en751221_gphy_mirror_rext(struct phy_device *phydev, u8 zcal)
> +{
> +	struct regmap *chip_scu;
> +
> +	chip_scu = syscon_regmap_lookup_by_compatible("econet,en751221-chip-scu");

Does this need a change to the binding document?

> +static int en751221_gphy_config_init(struct phy_device *phydev)
> +{
> +	phy_write_mmd(phydev, MDIO_MMD_AN, MDIO_AN_EEE_ADV, 0);

Why is the EEE register being cleared?

> +
> +	phy_select_page(phydev, MTK_PHY_PAGE_EXTENDED_52B5);
> +	__mtk_tr_write(phydev, 0x1, 0xf, 0x00, 0x00002b);
> +	__mtk_tr_write(phydev, 0x1, 0xf, 0x03, 0x082422);
> +	phy_restore_page(phydev, MTK_PHY_PAGE_STANDARD, 0);
> +
> +	ret = phy_write(phydev, MII_CTRL1000,
> +			ADVERTISE_1000FULL | CTL1000_PREFER_MASTER |
> +			CTL1000_AS_MASTER | CTL1000_ENABLE_MASTER);

What does this default to?

> +
> +	phy_set_bits(phydev, MII_BMCR, BMCR_ANRESTART | BMCR_ANENABLE);

Why? config_aneg() will do this, if needed.

     Andrew

