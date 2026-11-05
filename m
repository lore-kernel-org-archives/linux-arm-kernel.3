Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FF0606A326
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 22:48:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szkx6Cl/;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=zTAUDSAR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FFHWlej+HfzyWeLma4rwcxzLYA1cmN6XfZOTnHYl8RM=; b=szkx6Cl/gYR4p4I1W0lh0oM2QD
	TFDzuJFOmY0y87Fi9w+WaDj++Ssdg1jfPdL4QvAdMsbHM3pDu8Q7dnBEhtFmmhS1Xk6zmAVFzOynG
	A+RcnrZCMxWzYZxP+yQ9+meYcqr82tvWGDHSnf2+8Ol4M2CCQTSRugPKSahJw4El3TnCbGMIF57PZ
	oP1Z5SeaI0WgufPi8bgoh5MluFf2iu7cmG76qB31ORjW6im42/TA9QAEJt0K1GwUhLY9w3ls4PJq3
	hbQjVyFnTR7zHEYdiChDZAbKp5hOcv8Cx4tNBoji1SYPbeRs5w1nJ96p2w1A9UeaXsV67jmFHYNUR
	pNtwIzvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6FN-0000000AprZ-1IrY;
	Thu, 05 Nov 2026 22:47:55 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xP6FI-0000000Apr3-1yeZ;
	Thu, 05 Nov 2026 22:47:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=FFHWlej+HfzyWeLma4rwcxzLYA1cmN6XfZOTnHYl8RM=; b=zTAUDSARYr3btC4ZHgGn1mHjlT
	cEVE6q+Nc2TD5QALl1EMaP+i+rgEDEAT0BYENTpRd+22KPA3mkjCisCnQf2Ly04d4omi+gj1mtKjA
	EqFjY2sz6njTbEcMm+ZtiTM5PsDQgZSNytRhSmJC6l3jS2PYVu8HUPsy3RvX0M1DpZNs=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xP6Ew-00EeMF-Dt; Thu, 05 Nov 2026 23:47:26 +0100
Date: Thu, 5 Nov 2026 23:47:26 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH net-next v4 5/6] net: phy: mediatek: add calibration
 logic for AN7581
Message-ID: <028a75a3-b69c-4ae8-8f15-3ef855346a0f@lunn.ch>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
 <20261103221439.30502-6-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261103221439.30502-6-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_144750_097526_B9BA5F9A 
X-CRM114-Status: GOOD (  14.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

> +static int airoha_cal_cycle(struct phy_device *phydev, int devad,
> +			    u32 regnum, u16 mask, u16 cal_val)
> +{
> +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> +	struct phy_device *phydev_p0;
> +	int ret;
> +
> +	phydev_p0 = shared->phydev_p0;
> +
> +	phy_modify_mmd(phydev, devad, regnum, mask, cal_val);
> +
> +	ret = mtk_cal_cycle_wait(phydev_p0);


> +static int airoha_rext_cal_sw(struct phy_device *phydev)
> +{

...

> +	phydev_dbg(phydev, "Start REXT SW cal.\n");
> +	first_calib = airoha_cal_cycle(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG5,
> +				       MTK_PHY_RG_REXT_ZCAL_CTRL_MASK, zcal_ctrl);
> +

> +static int airoha_cal_sw(struct phy_device *phydev, enum CAL_ITEM cal_item,
> +			 u8 start_pair, u8 end_pair)
> +{
> +	u8 pair_n;
> +	int ret;
> +
> +	for (pair_n = start_pair; pair_n <= end_pair; pair_n++) {
> +		switch (cal_item) {
> +		case REXT:
> +			ret = airoha_rext_cal_sw(phydev);
> +			break;

> +static int airoha_start_cal(struct phy_device *phydev, enum CAL_ITEM cal_item,
> +			    enum CAL_MODE cal_mode, u8 start_pair,
> +			    u8 end_pair, u32 *buf)
> +{
> +	int ret;
> +
> +	switch (cal_mode) {
> +	case SW_M:
> +		ret = airoha_cal_sw(phydev, cal_item, start_pair, end_pair);


> +static int airoha_phy_calib(struct phy_device *phydev)
> +{
> +	phy_package_lock(phydev);
> +	if (!shared->rext_sw_calib_done) {
> +		ret = airoha_start_cal(phydev, REXT, SW_M, NO_PAIR, NO_PAIR, NULL);
> +		if (ret) {
> +			phy_package_unlock(phydev);
> +			return ret;
> +		}
> +
> +		shared->rext_sw_calib_done = true;
> +	}
> +	phy_package_unlock(phydev);
> +
> +	ret = airoha_start_cal(phydev, TX_R50, SW_M, PAIR_A, PAIR_D, NULL);


> +static int an7581_phy_config_init(struct phy_device *phydev)
> +{
> +	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
> +	struct phy_device *phydev_p0;
> +	u8 phy_offset;
> +	int oldpage;
> +	int ret;
> +
> +	phydev_p0 = shared->phydev_p0;
> +	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
> +
> +	if (phy_package_init_once(phydev)) {
> +		ret = an7581_phy_package_config_init_once(phydev);
> +		if (ret)
> +			return ret;
> +	}
> +
> +	ret = airoha_phy_calib(phydev);

> @@ -88,6 +1610,7 @@ static struct phy_driver mtk_socphy_driver[] = {
>  	{
>  		PHY_ID_MATCH_EXACT(AIROHA_GPHY_ID_AN7581),
>  		.name		= "Airoha AN7581 PHY",
> +		.config_init	= an7581_phy_config_init,

> > There are 4 phys in total, only the phy with mdio address 9 has the
> > calibration capability. Thus only one phy at the time can perform
> > the calibration sequence.

config_init -> airoha_phy_calib -> airoha_start_cal -> airoha_cal_sw
-> airoha_cal_cycle

I cannot say i looked at all the details closely, maybe i missed an ==
9 somewhere, but to me, it looks like two config_init can run in
parallel.

	Andrew

