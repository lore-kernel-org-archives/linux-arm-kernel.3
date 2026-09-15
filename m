Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA0FC88E75
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 10:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xD2v7/e5UVAUCLwAAfsPF39K7P2gR01vc2ghB2zal98=; b=rBQNffzvfxm6sjrGPCWtNb1qHc
	f2r5t38qqFaJf+JrBLO87/TjQw4+WWgv10yuTlEMzL00s9q0qYKkS1QIy4D+IPESoaAlNdxCigpkg
	58CrvH5SDUletnt7+VhXkE/N9VI8mX8dxllTDTBDUDpkAxOZwsdAvxNwp5N84y7UxLYtoBY+2nWNe
	C0AszxENDLXucm3FpRlnDbOSUylzEeN4EVPDKhJSmPy1/VTbTG7lclxcT7zAH4DH1YK28P1vU/jHP
	+eM1rLCGwCTSp9Sp6kgY3svhfj+utI53qXVAVwipHcUE9VXyrjTSSVTKMSZ4haDQ2h2TsFIuhFRUq
	/MWaETYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qj9-000000060ms-0ig7;
	Tue, 15 Sep 2026 10:49:27 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Qj2-000000060lj-13Ia;
	Tue, 15 Sep 2026 10:49:24 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256:X25519MLKEM768)
	 (Exim 4.100)
	(envelope-from <daniel@makrotopia.org>)
	id 1x6Qii-000000007Dm-46Qy;
	Tue, 15 Sep 2026 10:49:01 +0000
Date: Tue, 15 Sep 2026 11:48:53 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: netdev@vger.kernel.org, dqfext@gmail.com, SkyLake.Huang@mediatek.com,
	andrew@lunn.ch, hkallweit1@gmail.com, linux@armlinux.org.uk,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Matheus Sampaio Queiroga <srherobrine20@gmail.com>
Subject: Re: [PATCH v4 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
Message-ID: <aqkilcQAs-GERF3x@makrotopia.org>
References: <20260915103550.79957-1-cjd@cjdns.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915103550.79957-1-cjd@cjdns.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_034920_292527_70667682 
X-CRM114-Status: GOOD (  23.72  )
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

On Tue, Sep 15, 2026 at 10:35:50AM +0000, Caleb James DeLisle wrote:
> The EcoNet EN751221 multi-chip module implementation of the MT7530
> requires some additional configuration of the PHYs on startup.
> The reason for this is not known, but it is possible that it has
> to do with the fact that the EN751221 MCM implementation of the
> MT7530 runs at an abnormal PLL frequency (362.5Mhz).
> 
> Detect whether the MT7530 PHY is attached to the MDIO bus of an
> EcoNet EN751221 switch and if so, apply the necessary register
> updates. Additionally, never attempt to configure an MT7530
> identified PHY which does not have gigabit support because the same
> ID is used for another (FE) PHY.
> 
> Co-developed-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
> Signed-off-by: Matheus Sampaio Queiroga <srherobrine20@gmail.com>
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>

> [...]
> +static bool en751221_is_mcm_phy(struct phy_device *phydev)
> +{
> +	struct device *parent = phydev->mdio.bus->parent;
> +
> +	return parent && parent->of_node &&
> +	       of_device_is_compatible(parent->of_node, "econet,en751221");

I thought you had found better options than using the parent of_node...?

> +}
> +
> +/*
> + * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
> + * does not advertise ESTATUS_1000_TFULL.
> + */
> +static int mt7530_phy_match(struct phy_device *phydev,
> +			    const struct phy_driver *phydrv)
> +{

You miss the check for the PHY ID, see also below.

I'd suggest something like
	int ret;

	ret = genphy_match_phy_device(phydev, phydrv);
	if (!ret)
		return 0;

> +	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0 &&

The above should be helper function used by both .match_phy_device ops.

> +		!en751221_is_mcm_phy(phydev);
> +}
> +
> +static int en751221_phy_match(struct phy_device *phydev,
> +			      const struct phy_driver *phydrv)
> +{
> +	return (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0 &&
> +		en751221_is_mcm_phy(phydev);
> +}
> +
>  static int mt7531_phy_config_init(struct phy_device *phydev)
>  {
>  	mtk_gephy_config_init(phydev);
> @@ -135,6 +195,23 @@ static struct phy_driver mtk_gephy_driver[] = {
>  		 */
>  		.config_intr	= genphy_no_config_intr,
>  		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.match_phy_device = mt7530_phy_match,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= mtk_phy_read_page,
> +		.write_page	= mtk_phy_write_page,
> +	},
> +	{
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),

This assigns phy_id and phy_id_mask, which are used by
genphy_match_phy_device(). However, you are setting a .match_phy_device
op which doesn't call genphy_match_phy_device(), so this is ignored.

> +		.name		= "EcoNet EN751221 MCM PHY",
> +		.probe		= mt7530_phy_probe,
> +		.config_init	= en751221_mcm_phy_config_init,
> +		/* Interrupts are handled by the switch, not the PHY
> +		 * itself.
> +		 */
> +		.config_intr	= genphy_no_config_intr,
> +		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.match_phy_device = en751221_phy_match,
>  		.suspend	= genphy_suspend,
>  		.resume		= genphy_resume,
>  		.read_page	= mtk_phy_read_page,
> -- 
> 2.39.5
> 

