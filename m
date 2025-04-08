Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7537C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 07:37:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0vudajCT6hMxHq+xPKa/rCpS1I8bFxkJSDk4YcXU62o=; b=vR3mcG9xjprDVHEomQOy2vZoXW
	uBvdXSnub6y/lHgtduEqDC+p8HPTAyN03J3Cck2XGvb8yCEWBfB0ZX2nNs/1AUcA9JXoFA0kOrr+4
	F91Fn9XEhdrH7vcHRzC06AExcJyrw2xo6H7MXYyaP+tWrtlxzRAtlah8VyJsbnCOWf+mKMqVm4y5k
	/kQ5sHlUmHKpRVlGVsiW6hqoHuGobA4n1YeK6yPuCjc96iC31+PS1Mu94JROl/Hs7GlNdIXMv4K5m
	IDhhAQxxB9WAtYHQYYoSLCRBtLmZ1jc+okWTRLxQHXgGgYMBr1yFkELSX5WHSSA7HCMfTKARUhWz+
	gE13JJuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Wb-000000036NS-3E8w;
	Tue, 08 Apr 2025 07:37:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u23Oe-000000034Fz-3oEd;
	Tue, 08 Apr 2025 07:29:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 62A5943D8F;
	Tue,  8 Apr 2025 07:29:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 704D4C4CEE5;
	Tue,  8 Apr 2025 07:29:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744097364;
	bh=Ckf5evGzzSA24OVxp5igOfL9k+cH+xIn2o2pz40R4SI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=im5tIV+cO6FjNr0HBCwhh1fyzxRdZ8EowauARd2uhx5E43BbhoPG3G6O9X7h1xra7
	 bwTExrURDpEj49wryRXSFFJws7yOL5TzvwRkezGiBOvJrr4qseKDC40Hv+7l5IbLCo
	 Fr4jOQF5/T7ZJN9PBTXFnaqSzduJFFz+iEGBgUarWUnMEqiuwyzUZE5mVe0jYjxzxX
	 8K3o4oaJUE2z4D+mmCCZr0mKwXffQ+CPKCsbs/JxiD0LpYkNcx5wRkCij/opVjj8EZ
	 ENO2YcpcGgOMbQDKtRpo5eS0J43hF8861tv5MVHhX9Kfe+KdjCh5zSumyYbnC464dn
	 SMJR3RMxlK+5g==
Date: Tue, 8 Apr 2025 09:29:21 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Daniel Golle <daniel@makrotopia.org>,
	"Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	"Lei Wei (QUIC)" <quic_leiwei@quicinc.com>
Subject: Re: [RFC PATCH net-next v2 11/11] net: airoha: add phylink support
 for GDM2/3/4
Message-ID: <Z_TQURKSb7rOY9NF@lore-desk>
References: <20250406221423.9723-1-ansuelsmth@gmail.com>
 <20250406221423.9723-12-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OGbBDibJTakze8F1"
Content-Disposition: inline
In-Reply-To: <20250406221423.9723-12-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_002924_994667_EE4B625F 
X-CRM114-Status: GOOD (  31.85  )
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


--OGbBDibJTakze8F1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Add phylink support for GDM2/3/4 port that require configuration of the
> PCS to make the external PHY or attached SFP cage work.
>=20
> These needs to be defined in the GDM port node using the pcs-handle
> property.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>

Hi Christian,

the patch looks fine to me, just few nits inline.

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/airoha/airoha_eth.c  | 266 +++++++++++++++++++++-
>  drivers/net/ethernet/airoha/airoha_eth.h  |   4 +
>  drivers/net/ethernet/airoha/airoha_regs.h |  12 +
>  include/linux/pcs/pcs-airoha.h            |  15 ++
>  4 files changed, 296 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index c0a642568ac1..40d5d7cb1410 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -5,9 +5,13 @@
>   */
>  #include <linux/of.h>
>  #include <linux/of_net.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/tcp.h>
> +#include <linux/pcs/pcs.h>
> +#include <linux/pcs/pcs-airoha.h>

can you please put includes in alphabetical order?

>  #include <linux/u64_stats_sync.h>
> +#include <linux/regmap.h>
>  #include <net/dst_metadata.h>
>  #include <net/page_pool/helpers.h>
>  #include <net/pkt_cls.h>
> @@ -76,6 +80,11 @@ static bool airhoa_is_lan_gdm_port(struct airoha_gdm_p=
ort *port)
>  	return port->id =3D=3D 1;
>  }
> =20
> +static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
> +{

I guess you can add a comment here.

> +	return port->id !=3D 1;
> +}
> +
>  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *a=
ddr)
>  {
>  	struct airoha_eth *eth =3D port->qdma->eth;
> @@ -1535,6 +1544,17 @@ static int airoha_dev_open(struct net_device *dev)
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);
>  	struct airoha_qdma *qdma =3D port->qdma;
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		err =3D phylink_of_phy_connect(port->phylink, dev->dev.of_node, 0);
> +		if (err) {
> +			netdev_err(dev, "%s: could not attach PHY: %d\n", __func__,
> +				   err);
> +			return err;
> +		}
> +
> +		phylink_start(port->phylink);
> +	}
> +
>  	netif_tx_start_all_queues(dev);
>  	err =3D airoha_set_vip_for_gdm_port(port, true);
>  	if (err)
> @@ -1587,19 +1607,36 @@ static int airoha_dev_stop(struct net_device *dev)
>  		}
>  	}
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		phylink_stop(port->phylink);
> +		phylink_disconnect_phy(port->phylink);
> +	}
> +
>  	return 0;
>  }
> =20
>  static int airoha_dev_set_macaddr(struct net_device *dev, void *p)
>  {
>  	struct airoha_gdm_port *port =3D netdev_priv(dev);
> +	const u8 *mac_addr =3D dev->dev_addr;
>  	int err;
> =20
>  	err =3D eth_mac_addr(dev, p);
>  	if (err)
>  		return err;
> =20
> -	airoha_set_macaddr(port, dev->dev_addr);
> +	airoha_set_macaddr(port, mac_addr);

this is not required.

> +
> +	/* Update XFI mac address */
> +	if (airhoa_is_phy_external(port)) {
> +		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRL,
> +			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRL,
> +					mac_addr[0] << 24 | mac_addr[1] << 16 |
> +					mac_addr[2] << 8 | mac_addr[3]));
> +		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRH,
> +			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRH,
> +					mac_addr[4] << 8 | mac_addr[5]));
> +	}
> =20
>  	return 0;
>  }
> @@ -2454,6 +2491,210 @@ static void airoha_metadata_dst_free(struct airoh=
a_gdm_port *port)
>  	}
>  }
> =20
> +static void airoha_mac_config(struct phylink_config *config, unsigned in=
t mode,
> +			      const struct phylink_link_state *state)
> +{
> +	struct airoha_gdm_port *port =3D container_of(config, struct airoha_gdm=
_port,
> +						    phylink_config);
> +
> +	/* Frag disable */
> +	regmap_update_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			   AIROHA_PCS_XFI_RX_FRAG_LEN,
> +			   FIELD_PREP(AIROHA_PCS_XFI_RX_FRAG_LEN, 31));
> +	regmap_update_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			   AIROHA_PCS_XFI_TX_FRAG_LEN,
> +			   FIELD_PREP(AIROHA_PCS_XFI_TX_FRAG_LEN, 31));
> +
> +	/* IPG NUM */
> +	regmap_update_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			   AIROHA_PCS_XFI_IPG_NUM,
> +			   FIELD_PREP(AIROHA_PCS_XFI_IPG_NUM, 10));
> +
> +	/* Enable TX/RX flow control */
> +	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_TX_FC_EN);
> +	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_RX_FC_EN);

I guess you can squash all the regmap_update_bits here.

> +}
> +
> +static int airoha_mac_prepare(struct phylink_config *config, unsigned in=
t mode,
> +			      phy_interface_t iface)
> +{
> +	struct airoha_gdm_port *port =3D container_of(config, struct airoha_gdm=
_port,
> +						    phylink_config);
> +
> +	/* MPI MBI disable */
> +	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_RXMPI_STOP |
> +			AIROHA_PCS_XFI_RXMBI_STOP |
> +			AIROHA_PCS_XFI_TXMPI_STOP |
> +			AIROHA_PCS_XFI_TXMBI_STOP);
> +
> +	/* Write 1 to trigger reset and clear */
> +	regmap_clear_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_LOGIC_RST,
> +			  AIROHA_PCS_XFI_MAC_LOGIC_RST);
> +	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_LOGIC_RST,
> +			AIROHA_PCS_XFI_MAC_LOGIC_RST);
> +
> +	usleep_range(1000, 2000);
> +
> +	/* Clear XFI MAC counter */
> +	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_CNT_CLR,
> +			AIROHA_PCS_XFI_GLB_CNT_CLR);
> +
> +	return 0;
> +}
> +
> +static void airoha_mac_link_down(struct phylink_config *config, unsigned=
 int mode,
> +				 phy_interface_t interface)
> +{
> +	struct airoha_gdm_port *port =3D container_of(config, struct airoha_gdm=
_port,
> +						    phylink_config);
> +
> +	/* MPI MBI disable */
> +	regmap_set_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			AIROHA_PCS_XFI_RXMPI_STOP |
> +			AIROHA_PCS_XFI_RXMBI_STOP |
> +			AIROHA_PCS_XFI_TXMPI_STOP |
> +			AIROHA_PCS_XFI_TXMBI_STOP);
> +}
> +
> +static void airoha_mac_link_up(struct phylink_config *config, struct phy=
_device *phy,
> +			       unsigned int mode, phy_interface_t interface,
> +			       int speed, int duplex, bool tx_pause, bool rx_pause)
> +{
> +	struct airoha_gdm_port *port =3D container_of(config, struct airoha_gdm=
_port,
> +						    phylink_config);
> +	struct airoha_qdma *qdma =3D port->qdma;
> +	struct airoha_eth *eth =3D qdma->eth;
> +	u32 frag_size_tx, frag_size_rx;
> +
> +	switch (speed) {
> +	case SPEED_10000:
> +	case SPEED_5000:
> +		frag_size_tx =3D 8;
> +		frag_size_rx =3D 8;
> +		break;
> +	case SPEED_2500:
> +		frag_size_tx =3D 2;
> +		frag_size_rx =3D 1;
> +		break;
> +	default:
> +		frag_size_tx =3D 1;
> +		frag_size_rx =3D 0;

missing break

> +	}
> +
> +	/* Configure TX/RX frag based on speed */
> +	if (port->id =3D=3D 4) {
> +		airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG, GDMA4_SGMII0_TX_FRAG_SIZE,
> +			      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE, frag_size_tx));
> +
> +		airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG, GDMA4_SGMII0_RX_FRAG_SIZE,
> +			      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE, frag_size_rx));
> +	}
> +
> +	/* BPI BMI enable */
> +	regmap_clear_bits(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_GIB_CFG,
> +			  AIROHA_PCS_XFI_RXMPI_STOP |
> +			  AIROHA_PCS_XFI_RXMBI_STOP |
> +			  AIROHA_PCS_XFI_TXMPI_STOP |
> +			  AIROHA_PCS_XFI_TXMBI_STOP);
> +}
> +
> +static const struct phylink_mac_ops airoha_phylink_ops =3D {
> +	.mac_config =3D airoha_mac_config,
> +	.mac_prepare =3D airoha_mac_prepare,
> +	.mac_link_down =3D airoha_mac_link_down,
> +	.mac_link_up =3D airoha_mac_link_up,
> +};
> +
> +static int airoha_setup_phylink(struct net_device *dev)
> +{
> +	struct device_node *pcs_np, *np =3D dev->dev.of_node;
> +	struct airoha_gdm_port *port =3D netdev_priv(dev);
> +	struct phylink_pcs **available_pcs;
> +	struct platform_device *pdev;
> +	phy_interface_t phy_mode;
> +	struct phylink *phylink;
> +	unsigned int num_pcs;
> +	int err;
> +
> +	err =3D of_get_phy_mode(np, &phy_mode);
> +	if (err) {
> +		dev_err(&dev->dev, "incorrect phy-mode\n");
> +		return err;
> +	}
> +
> +	pcs_np =3D of_parse_phandle(np, "pcs-handle", 0);

I guess you need to update airoha,en7581-eth.yaml, don't you?

> +	if (!pcs_np)
> +		return -ENODEV;
> +
> +	if (!of_device_is_available(pcs_np)) {
> +		of_node_put(pcs_np);
> +		return -ENODEV;
> +	}
> +
> +	pdev =3D of_find_device_by_node(pcs_np);
> +	of_node_put(pcs_np);
> +	if (!pdev || !platform_get_drvdata(pdev)) {
> +		if (pdev)
> +			put_device(&pdev->dev);
> +		return -EPROBE_DEFER;
> +	}
> +
> +	port->xfi_mac =3D dev_get_regmap(&pdev->dev, "xfi_mac");
> +	if (IS_ERR(port->xfi_mac))
> +		return PTR_ERR(port->xfi_mac);
> +
> +	port->phylink_config.dev =3D &dev->dev;
> +	port->phylink_config.type =3D PHYLINK_NETDEV;
> +	port->phylink_config.mac_capabilities =3D MAC_ASYM_PAUSE | MAC_SYM_PAUS=
E |
> +						MAC_10 | MAC_100 | MAC_1000 | MAC_2500FD |
> +						MAC_5000FD | MAC_10000FD;
> +
> +	err =3D fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), NULL, &num_pcs);
> +	if (err)
> +		return err;
> +
> +	available_pcs =3D kcalloc(num_pcs, sizeof(*available_pcs), GFP_KERNEL);

you can use devm_kcalloc() here.

> +	if (!available_pcs)
> +		return -ENOMEM;
> +
> +	err =3D fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_pcs,
> +				       &num_pcs);
> +	if (err)
> +		goto out;
> +
> +	port->phylink_config.available_pcs =3D available_pcs;
> +	port->phylink_config.num_available_pcs =3D num_pcs;
> +
> +	__set_bit(PHY_INTERFACE_MODE_SGMII,
> +		  port->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> +		  port->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> +		  port->phylink_config.supported_interfaces);
> +	__set_bit(PHY_INTERFACE_MODE_USXGMII,
> +		  port->phylink_config.supported_interfaces);
> +
> +	phy_interface_copy(port->phylink_config.pcs_interfaces,
> +			   port->phylink_config.supported_interfaces);
> +
> +	phylink =3D phylink_create(&port->phylink_config,
> +				 of_fwnode_handle(np),
> +				 phy_mode, &airoha_phylink_ops);
> +	if (IS_ERR(phylink)) {
> +		err =3D PTR_ERR(phylink);
> +		goto out;
> +	}
> +
> +	port->phylink =3D phylink;
> +out:
> +	kfree(available_pcs);
> +
> +	return err;
> +}
> +
>  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
>  				 struct device_node *np, int index)
>  {
> @@ -2532,6 +2773,23 @@ static int airoha_alloc_gdm_port(struct airoha_eth=
 *eth,
>  	if (err)
>  		return err;
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		const u8 *mac_addr =3D dev->dev_addr;
> +
> +		err =3D airoha_setup_phylink(dev);
> +		if (err)
> +			return err;
> +
> +		/* Setup XFI mac address */
> +		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRL,
> +			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRL,
> +					mac_addr[0] << 24 | mac_addr[1] << 16 |
> +					mac_addr[2] << 8 | mac_addr[3]));
> +		regmap_write(port->xfi_mac, AIROHA_PCS_XFI_MAC_XFI_MACADDRH,
> +			     FIELD_PREP(AIROHA_PCS_XFI_MAC_MACADDRH,
> +					mac_addr[4] << 8 | mac_addr[5]));
> +	}
> +
>  	return register_netdev(dev);
>  }
> =20
> @@ -2626,6 +2884,9 @@ static int airoha_probe(struct platform_device *pde=
v)
>  		struct airoha_gdm_port *port =3D eth->ports[i];
> =20
>  		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
> +			if (airhoa_is_phy_external(port))
> +				phylink_destroy(port->phylink);
> +
>  			unregister_netdev(port->dev);
>  			airoha_metadata_dst_free(port);
>  		}
> @@ -2653,6 +2914,9 @@ static void airoha_remove(struct platform_device *p=
dev)
>  			continue;
> =20
>  		airoha_dev_stop(port->dev);
> +		if (airhoa_is_phy_external(port))
> +			phylink_destroy(port->phylink);
> +
>  		unregister_netdev(port->dev);
>  		airoha_metadata_dst_free(port);
>  	}
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index 60690b685710..bc0cbeb6bd6d 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -460,6 +460,10 @@ struct airoha_gdm_port {
>  	struct net_device *dev;
>  	int id;
> =20
> +	struct phylink *phylink;
> +	struct phylink_config phylink_config;
> +	struct regmap *xfi_mac;
> +
>  	struct airoha_hw_stats stats;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethe=
rnet/airoha/airoha_regs.h
> index 8146cde4e8ba..72f7824fcc2e 100644
> --- a/drivers/net/ethernet/airoha/airoha_regs.h
> +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> @@ -356,6 +356,18 @@
>  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
>  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> =20
> +#define REG_GDMA4_TMBI_FRAG		0x2028
> +#define GDMA4_SGMII1_TX_WEIGHT		GENMASK(31, 26)
> +#define GDMA4_SGMII1_TX_FRAG_SIZE	GENMASK(25, 16)
> +#define GDMA4_SGMII0_TX_WEIGHT		GENMASK(15, 10)
> +#define GDMA4_SGMII0_TX_FRAG_SIZE	GENMASK(9, 0)
> +
> +#define REG_GDMA4_RMBI_FRAG		0x202c
> +#define GDMA4_SGMII1_RX_WEIGHT		GENMASK(31, 26)
> +#define GDMA4_SGMII1_RX_FRAG_SIZE	GENMASK(25, 16)
> +#define GDMA4_SGMII0_RX_WEIGHT		GENMASK(15, 10)
> +#define GDMA4_SGMII0_RX_FRAG_SIZE	GENMASK(9, 0)
> +
>  #define REG_MC_VLAN_EN			0x2100
>  #define MC_VLAN_EN_MASK			BIT(0)
> =20
> diff --git a/include/linux/pcs/pcs-airoha.h b/include/linux/pcs/pcs-airoh=
a.h
> index 07797645ff15..947dbcbc5206 100644
> --- a/include/linux/pcs/pcs-airoha.h
> +++ b/include/linux/pcs/pcs-airoha.h
> @@ -5,7 +5,22 @@
> =20
>  /* XFI_MAC */
>  #define AIROHA_PCS_XFI_MAC_XFI_GIB_CFG		0x0
> +#define   AIROHA_PCS_XFI_RX_FRAG_LEN		GENMASK(26, 22)
> +#define   AIROHA_PCS_XFI_TX_FRAG_LEN		GENMASK(21, 17)
> +#define   AIROHA_PCS_XFI_IPG_NUM		GENMASK(15, 10)
>  #define   AIROHA_PCS_XFI_TX_FC_EN		BIT(5)
>  #define   AIROHA_PCS_XFI_RX_FC_EN		BIT(4)
> +#define   AIROHA_PCS_XFI_RXMPI_STOP		BIT(3)
> +#define   AIROHA_PCS_XFI_RXMBI_STOP		BIT(2)
> +#define   AIROHA_PCS_XFI_TXMPI_STOP		BIT(1)
> +#define   AIROHA_PCS_XFI_TXMBI_STOP		BIT(0)
> +#define AIROHA_PCS_XFI_MAC_XFI_LOGIC_RST	0x10
> +#define   AIROHA_PCS_XFI_MAC_LOGIC_RST		BIT(0)
> +#define AIROHA_PCS_XFI_MAC_XFI_MACADDRH		0x60
> +#define   AIROHA_PCS_XFI_MAC_MACADDRH		GENMASK(15, 0)
> +#define AIROHA_PCS_XFI_MAC_XFI_MACADDRL		0x64
> +#define   AIROHA_PCS_XFI_MAC_MACADDRL		GENMASK(31, 0)
> +#define AIROHA_PCS_XFI_MAC_XFI_CNT_CLR		0x100
> +#define   AIROHA_PCS_XFI_GLB_CNT_CLR		BIT(0)
> =20
>  #endif /* __LINUX_PCS_AIROHA_H */
> --=20
> 2.48.1
>=20

--OGbBDibJTakze8F1
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/TQUQAKCRA6cBh0uS2t
rHzjAP4n24uJQMCV8CN0gv8PiZmIavEx5R38OtpevHdA8VShfAD/ZQlW+LyETXAo
9ytiCAn1YPhFpygRPvsuhfx1eGeqjAU=
=/5aH
-----END PGP SIGNATURE-----

--OGbBDibJTakze8F1--

