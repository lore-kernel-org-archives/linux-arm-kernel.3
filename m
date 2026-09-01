Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1A72C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 16:57:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EIjF6irFWof5iYX8mJ+DqBBduW8CEQHKF360pseUiV0=; b=Qu1NE07kVuS2eQ3eV8ujwEfrJY
	jUpNKofGtrYA7XqnlKSu1WcZpags9GB6F+dZ0ciZAmfM80sb25IVWJI/qSo1R+2hePg5Olsu+kw5g
	9MLob37zC2rkAta5Y9cVHYRN/UBEWh2qtKhyGP4WyPNjUI8sEzNXYz/azQAtstYjurLEEol2/S0DS
	aZQfDjmLxAZ0mI/oojNWNTXIzESM1S1lkpX3Ggp6VJ33v+ZkNgucPJPggxfZD16acIstd5Qwizrgk
	dRJuGXpr50HkIsysXjmKpkM40IBs09qHI77ym+TeOQZOi5vDsKFGf4EaXDNHw4IIqY/337TZPvvDK
	E28EjE8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RnI-0000000CjR9-2TOl;
	Tue, 01 Sep 2026 16:57:11 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1RnF-0000000CjQT-22lh
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Sep 2026 16:57:07 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788281795; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YxlD8eKZdzvGSCqLTBceHoCcn8xAgVPXM/40YpkDNQdDqYbBZI5p4jgIaZIoiqm8wA6vL7alnU6p4zQk3PB1DxcP6jbAXmDbkgtwu3FWROr0Iigg9y2hOd12OIv3hf4CI1GdjJFJVP5Ex6xmIIrlTGQyX/oucYfGT6poobskD94=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788281795; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=EIjF6irFWof5iYX8mJ+DqBBduW8CEQHKF360pseUiV0=; 
	b=IqS4WrCY3h/7bfvUq2WivzRAAquuGJzHGfEpVpT/XcAlvJXDoMN/fSKCfPfa3ybzutv68teVg2lKQMD2GcbjN4aBI3yyi08NC4iVDCH+A/MzqbmPsezP9jclGkVJIj4nxHo9F2+ocxGr48ZIKsm5x515CGhy8sxxkTGEXpMji6s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=ziyao.cc;
	spf=pass  smtp.mailfrom=me@ziyao.cc;
	dmarc=pass header.from=<me@ziyao.cc>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788281795;
	s=zmail; d=ziyao.cc; i=me@ziyao.cc;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=EIjF6irFWof5iYX8mJ+DqBBduW8CEQHKF360pseUiV0=;
	b=bd4mBydR/1IVcYtyruTb9J+DesuhtHF1J1VU+wP8TkFSFTZdkLSjKxSlwwjffUW8
	qP4x8W2yRwyQaYxMN+PhciVIZoiZtkZuTESGwliZWFgkvVE1hSIYV3M6MffgM+gYYI+
	ROmd0NqRHgujNwBHDp0mUzfGsU/qfPD46DPH/fO4=
Received: by mx.zohomail.com with SMTPS id 1788281791276114.8959116523572;
	Tue, 1 Sep 2026 09:56:31 -0700 (PDT)
Date: Tue, 1 Sep 2026 16:56:16 +0000
From: Yao Zi <me@ziyao.cc>
To: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
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
Subject: Re: [PATCH net-next 3/3] net: phy: motorcomm: Enable analog frontend
 on YT8531S
Message-ID: <apcDsF_P9fDDiOn6@pie>
References: <20260831073747.361482-1-maxime.chevallier@bootlin.com>
 <20260831073747.361482-4-maxime.chevallier@bootlin.com>
 <17e50070-46c9-46dd-8109-95007a4f681f@redhat.com>
 <3053bd10-50c0-4a4e-bfe3-7c2479bad560@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3053bd10-50c0-4a4e-bfe3-7c2479bad560@bootlin.com>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.256.78
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_095705_551289_47D9B854 
X-CRM114-Status: GOOD (  31.20  )
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

On Tue, Sep 01, 2026 at 04:21:36PM +0200, Maxime Chevallier wrote:
> 
> 
> On 9/1/26 15:59, Paolo Abeni wrote:
> > On 8/31/26 9:37 AM, Maxime Chevallier wrote:
> >> The YT6801 PCIe NIC includes the dwmac-motorcomm IP for the MAC part, as
> >> well as a YT8531S PHY, configured in GMII mode.
> >>
> >> It seems this PHY requires the Analog Front-end (AFE) DAC clock to be
> >> enabled for link to reliably establish, otherwise the link just doesn't
> >> come up.
> >>
> >> Let's enable it at config_init().
> >>
> >> This logic has been extracted from the vendor driver provided by
> >> Motorcomm.
> >>
> >> It's really unclear if this is specific to the integrated version of
> >> that PHY, and how this potentially interacts with the fiber mode this
> >> PHY supports, so this configuration is only enabled when the interface
> >> is GMII, i.e. the PHY is integrated.
> >>
> >> With this, the PHY reliably establishes link and the YT6801 PCIe card
> >> becomes fully functional.
> >>
> >> Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
> >> ---
> >>  drivers/net/phy/motorcomm.c | 14 +++++++++++++-
> >>  1 file changed, 13 insertions(+), 1 deletion(-)
> >>
> >> diff --git a/drivers/net/phy/motorcomm.c b/drivers/net/phy/motorcomm.c
> >> index 36c229460a77..90a4f86f2758 100644
> >> --- a/drivers/net/phy/motorcomm.c
> >> +++ b/drivers/net/phy/motorcomm.c
> >> @@ -144,6 +144,11 @@
> >>  #define YT8521_CLOCK_GATING_REG			0xC
> >>  #define YT8521_CGR_RX_CLK_EN			BIT(12)
> >>  
> >> +/* Analog front-end control register 3 */
> >> +#define YT8531S_EXT_AFE_CTRL3			0x12
> >> +/* Analog front-end DAC clock enable */
> >> +#define YT8531S_AFE_CTRL3_CLKDAC_AON		BIT(13)
> >> +
> >>  #define YT8521_EXTREG_SLEEP_CONTROL1_REG	0x27
> >>  #define YT8521_ESC1R_SLEEP_SW			BIT(15)
> >>  #define YT8521_ESC1R_PLLON_SLP			BIT(14)
> >> @@ -1740,8 +1745,15 @@ static int yt8531s_config_init(struct phy_device *phydev)
> >>  	if (ret)
> >>  		goto err_restore_page;
> >>  
> >> -	if (phy_interface_is_rgmii(phydev))
> >> +	if (phy_interface_is_rgmii(phydev)) {
> >>  		ret = yt8531_set_ds(phydev);
> >> +		if (ret)
> >> +			goto err_restore_page;
> >> +	}
> >> +
> >> +	if (phydev->interface == PHY_INTERFACE_MODE_GMII)
> >> +		ret = ytphy_modify_ext(phydev, YT8531S_EXT_AFE_CTRL3,
> >> +				       0, YT8531S_AFE_CTRL3_CLKDAC_AON);
> > 
> > Sashiko suspects this will not survive a suspend/resume:
> > 
> > https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260831073747.361482-1-maxime.chevallier%40bootlin.com
> 
> hmm sashiko may be right, worth adding right now as it seems there are
> some discussions already on motorcomm suspend/resume issues, let me spin
> a V2
> 
> Thanks !

Yes, suspend/resume already works for some time on devices unaffected
by the issue under discussion. It looks good to me apart from this.
I'll call some guys to test for regressions on devices proven to work
before.

> Maxime
> 

Best regards,
Yao Zi

