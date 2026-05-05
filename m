Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01757FF8855
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 21:56:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VAYdumUjmfLJSw50WWvAALS9vqUR+RFFS6coY+f28X0=; b=mrXxMauMieWcdv3feBx+jrlkNu
	IT/1fBtsmLvbFSs/2iYpH6kVT+aphJ7ii5MidfB+8mqL91jrp6HX0IdxNYSofymIRSIoHE8kKqgGz
	hMC1rAFzxefX6G5AHm7oW7lDVB6elaF4QkTCS5yza9o/4S8dgCcHgNTm6MZ002AhsnMK7wSY/ehk0
	paUgFsSy2Cu2z8jZp2V+5D53oOoc8cTkUwLdO009k4a9Zu5E6HNMFG4+/1EPXeX3VM/seFMyT+tSc
	qYeioPtFlEBCXSmvrOJR/b1SdDhlDqluH2FY9eyBlstaA1fyEUvFkbkjj8V991csoS0okFrHmR6Pa
	rMdeF+wQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNkt-0000000Ham6-11aF;
	Tue, 05 May 2026 21:56:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKNkq-0000000Hala-1TRH;
	Tue, 05 May 2026 21:56:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 828DB42DA3;
	Tue,  5 May 2026 21:56:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD074C2BCB4;
	Tue,  5 May 2026 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778018195;
	bh=wwMuuzd51t0icpFlqoDSmekia7uNIIVs1VcdyJzta9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r94pbH1i6A3uhDe/f6VF/68E9diSIqOsk+ZZG8FDyGvAg3QC1yBXHRIJBkzBj7V3D
	 +LESprMh8CCmh+UCryggH31M/f/yjmG7RMVnpziuJ63c6ZW5eOxcQ6G1U16ICGzgJn
	 xZ3XFEHMdB5PMiAh9c0s629aPR3cvSOPjaAaruCapxrActH/i/UXSz/mwB/0FcKsdm
	 6JsNIc9zlRX/eKCt2BQL7zD0TP5uQh9mqt4RUfQjt/PTDIzdBq06DX0vQ1cZ9x8FUn
	 ZqtKoYdu31OnhnQSuEK3FoffiCGw5g0w1NihuJ4xXLCy3iOPkwanuoYvJqGL89mEXz
	 tOA+FsL8hebGA==
Date: Tue, 5 May 2026 23:56:32 +0200
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
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Daniel Golle <daniel@makrotopia.org>, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, llvm@lists.linux.dev
Subject: Re: [net-next RFC PATCH v5 10/10] net: airoha: add phylink support
 for GDM2/3/4
Message-ID: <afpnkL3Wr29DCTXh@lore-desk>
References: <20260505182713.27644-1-ansuelsmth@gmail.com>
 <20260505182713.27644-11-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gjld7L1f2FZXqLNi"
Content-Disposition: inline
In-Reply-To: <20260505182713.27644-11-ansuelsmth@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_145636_435487_6D6FC329 
X-CRM114-Status: GOOD (  29.73  )
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


--gjld7L1f2FZXqLNi
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

just a couple of nits inline.

Regards,
Lorenzo

> ---
>  drivers/net/ethernet/airoha/Kconfig       |   1 +
>  drivers/net/ethernet/airoha/airoha_eth.c  | 144 +++++++++++++++++++++-
>  drivers/net/ethernet/airoha/airoha_eth.h  |   3 +
>  drivers/net/ethernet/airoha/airoha_regs.h |  12 ++
>  4 files changed, 159 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/net/ethernet/airoha/Kconfig b/drivers/net/ethernet/a=
iroha/Kconfig
> index ad3ce501e7a5..38dcc76e5998 100644
> --- a/drivers/net/ethernet/airoha/Kconfig
> +++ b/drivers/net/ethernet/airoha/Kconfig
> @@ -20,6 +20,7 @@ config NET_AIROHA
>  	depends on NET_DSA || !NET_DSA
>  	select NET_AIROHA_NPU
>  	select PAGE_POOL
> +	select PHYLINK
>  	help
>  	  This driver supports the gigabit ethernet MACs in the
>  	  Airoha SoC family.
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ether=
net/airoha/airoha_eth.c
> index 2bd79da70934..ad0328a25422 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.c
> +++ b/drivers/net/ethernet/airoha/airoha_eth.c
> @@ -8,6 +8,7 @@
>  #include <linux/of_reserved_mem.h>
>  #include <linux/platform_device.h>
>  #include <linux/tcp.h>
> +#include <linux/pcs/pcs.h>
>  #include <linux/u64_stats_sync.h>
>  #include <net/dst_metadata.h>
>  #include <net/page_pool/helpers.h>
> @@ -71,6 +72,11 @@ static void airoha_qdma_irq_disable(struct airoha_irq_=
bank *irq_bank,
>  	airoha_qdma_set_irqmask(irq_bank, index, mask, 0);
>  }
> =20
> +static bool airhoa_is_phy_external(struct airoha_gdm_port *port)
> +{
> +	return port->id !=3D 1;

I guess you can use AIROHA_GDM1_IDX here.

> +}
> +
>  static void airoha_set_macaddr(struct airoha_gdm_port *port, const u8 *a=
ddr)
>  {
>  	struct airoha_eth *eth =3D port->qdma->eth;
> @@ -1644,6 +1650,17 @@ static int airoha_dev_open(struct net_device *dev)
>  	struct airoha_qdma *qdma =3D port->qdma;
>  	u32 pse_port =3D FE_PSE_PORT_PPE1;
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
> @@ -1707,6 +1724,11 @@ static int airoha_dev_stop(struct net_device *dev)
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
> @@ -2883,6 +2905,115 @@ bool airoha_is_valid_gdm_port(struct airoha_eth *=
eth,
>  	return false;
>  }
> =20
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

since you do not need qdma pointer here, you can just do port->eth here.

> +	u32 frag_size_tx, frag_size_rx;
> +
> +	if (port->id !=3D 4)

same here, AIROHA_GDM4_IDX

> +		return;
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
> +	}
> +
> +	/* Configure TX/RX frag based on speed */
> +	airoha_fe_rmw(eth, REG_GDMA4_TMBI_FRAG,
> +		      GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> +		      FIELD_PREP(GDMA4_SGMII0_TX_FRAG_SIZE_MASK,
> +				 frag_size_tx));
> +
> +	airoha_fe_rmw(eth, REG_GDMA4_RMBI_FRAG,
> +		      GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> +		      FIELD_PREP(GDMA4_SGMII0_RX_FRAG_SIZE_MASK,
> +				 frag_size_rx));
> +}
> +
> +static const struct phylink_mac_ops airoha_phylink_ops =3D {
> +	.mac_link_up =3D airoha_mac_link_up,
> +};
> +
> +static int airoha_setup_phylink(struct net_device *dev)
> +{
> +	struct airoha_gdm_port *port =3D netdev_priv(dev);
> +	struct device_node *np =3D dev->dev.of_node;
> +	struct phylink_pcs **available_pcs;
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
>  				 struct device_node *np)
>  {
> @@ -2954,6 +3085,12 @@ static int airoha_alloc_gdm_port(struct airoha_eth=
 *eth,
>  	port->id =3D id;
>  	eth->ports[p] =3D port;
> =20
> +	if (airhoa_is_phy_external(port)) {
> +		err =3D airoha_setup_phylink(dev);

should it be in airoha_register_gdm_devices()?

> +		if (err)
> +			return err;
> +	}
> +
>  	return airoha_metadata_dst_alloc(port);
>  }
> =20
> @@ -3081,8 +3218,11 @@ static int airoha_probe(struct platform_device *pd=
ev)
>  		if (!port)
>  			continue;
> =20
> -		if (port->dev->reg_state =3D=3D NETREG_REGISTERED)
> +		if (port->dev->reg_state =3D=3D NETREG_REGISTERED) {
> +			if (airhoa_is_phy_external(port))
> +				phylink_destroy(port->phylink);
>  			unregister_netdev(port->dev);
> +		}
>  		airoha_metadata_dst_free(port);
>  	}
>  	airoha_hw_cleanup(eth);
> @@ -3107,6 +3247,8 @@ static void airoha_remove(struct platform_device *p=
dev)
>  		if (!port)
>  			continue;
> =20
> +		if (airhoa_is_phy_external(port))
> +			phylink_destroy(port->phylink);
>  		unregister_netdev(port->dev);
>  		airoha_metadata_dst_free(port);
>  	}
> diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/ether=
net/airoha/airoha_eth.h
> index af29fc74165b..e5c70f1fa4f1 100644
> --- a/drivers/net/ethernet/airoha/airoha_eth.h
> +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> @@ -538,6 +538,9 @@ struct airoha_gdm_port {
>  	struct net_device *dev;
>  	int id;
> =20
> +	struct phylink *phylink;
> +	struct phylink_config phylink_config;
> +
>  	struct airoha_hw_stats stats;
> =20
>  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/ethe=
rnet/airoha/airoha_regs.h
> index 436f3c8779c1..27f2583e143a 100644
> --- a/drivers/net/ethernet/airoha/airoha_regs.h
> +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> @@ -358,6 +358,18 @@
>  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
>  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> =20
> +#define REG_GDMA4_TMBI_FRAG		0x2028
> +#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> +#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> +#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> +#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> +
> +#define REG_GDMA4_RMBI_FRAG		0x202c
> +#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> +#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> +#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> +#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> +
>  #define REG_MC_VLAN_EN			0x2100
>  #define MC_VLAN_EN_MASK			BIT(0)
> =20
> --=20
> 2.53.0
>=20

--gjld7L1f2FZXqLNi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafpnkAAKCRA6cBh0uS2t
rG23AP4z6k0t03pQSlLL4ng0cu4nV3iCGXr8FDaQSFEssgzd6gD/QG5RwkqZhGOc
+oWUO8ZWmqmn9PGz+FrCvG3PiCgDTAI=
=mQlb
-----END PGP SIGNATURE-----

--gjld7L1f2FZXqLNi--

