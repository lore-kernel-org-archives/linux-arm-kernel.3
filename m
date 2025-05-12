Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B6EC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 May 2025 13:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RdOWcONIWGiQ9RZqn7m2XKomabJdF8R6wWcjytIlO4s=; b=4/ABG5oVO+IOBqUulfdBqPX682
	ASpBZiwt47mdIKF3yeIo7ZDIUyYvYW/lkbUUv8nJlGa/mQ4doG3mX2oBjQPCIlDdluzejkpPg/yxy
	JJN4XnRSx7jo4IsXd9RBBr8pppkwr37d4vWhzNv04B41V4HdQnOWOtDRoe2N1OJfqZjbM4xJENRsR
	D1fYDPRRTwTFijH7KDrXSohEIW50u8nKaZ8Fq14wTAA+vcT91ixyhwuRHE73tljn/wbRvnldKS547
	1xk1TRtd3paEUYB6O1XfLWgaym8qqldMP2LF8l66r5zWP0FauwgdWT3G4m/1hvylRRma2FMYacyvV
	09/Qfy3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uETCP-00000009YGX-2Ea9;
	Mon, 12 May 2025 13:28:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uESen-00000009RzS-3PRV;
	Mon, 12 May 2025 12:53:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEFF544FEC;
	Mon, 12 May 2025 12:53:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F74CC4CEE7;
	Mon, 12 May 2025 12:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747054400;
	bh=bGEl/N/Mj0l0P5OgWd/MVZto+HVhtJO0kIfC1NcF2TE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a3fRCOyLPT0vjKRO5zR3VuRX900CG3fKPgscz7YdQspH2GDbSo3AYbupGLL8zQFqL
	 3m+b7CxaUycY5DapAxsIgnmn/UwywUPYkN4qYNQWFmnFXgT3KEoDZYD9iCdmh26/Ms
	 PPxj4I3EYeoSxnCv1zD61T/Aik0T0c5cPb5xi8WRqPoePZZ/Z+DFRGT/ud0ZDrbY5l
	 S0rMfC04JTcp4qh+aYv5n+AkIUe5fIWoNfmR4LFuvgP5h2ce6pLDyU+ySdOvEb5eJk
	 mRBmHURhaRMZ7sZK6efFPXOjND4wZxNOpmvkjD9z2XP4Z4uV8wcheCQoVRQshxozuU
	 dUyajsHSr/8kA==
Date: Mon, 12 May 2025 14:53:18 +0200
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
Subject: Re: [net-next PATCH v4 11/11] net: airoha: add phylink support for
 GDM2/3/4
Message-ID: <aCHvPoZDGUrCVif1@lore-desk>
References: <20250511201250.3789083-1-ansuelsmth@gmail.com>
 <20250511201250.3789083-12-ansuelsmth@gmail.com>
 <aCG9q6i7HomgilI6@lore-desk>
 <6821bef5.5d0a0220.319347.d533@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qLFnU5peW7PO9M+h"
Content-Disposition: inline
In-Reply-To: <6821bef5.5d0a0220.319347.d533@mx.google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250512_055321_895787_D26CE99D 
X-CRM114-Status: GOOD (  29.74  )
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


--qLFnU5peW7PO9M+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

[...]
> >=20
> > I guess you can use devm_kcalloc() and get rid of kfree() here.
> >
>=20
> I forgot to answer to this in the previous revision. No devm can't be
> used there available_pcs is just an array allocated for phylink_config.
>=20
> Phylink then copy the data in it and doesn't use it anymore hence it
> just needs to be allocated here and doesn't need to stay till the driver
> gets removed.

I guess this is exactly the point. Since available_pcs is used just here and
this is not a hot-path, I think the code would be simpler, but I do not have
a strong opinion about it.

>=20
> > > +	if (!available_pcs)
> > > +		return -ENOMEM;
> > > +
> > > +	err =3D fwnode_phylink_pcs_parse(dev_fwnode(&dev->dev), available_p=
cs,
> > > +				       &num_pcs);
> > > +	if (err)
> > > +		goto out;
> > > +
> > > +	port->phylink_config.available_pcs =3D available_pcs;
> > > +	port->phylink_config.num_available_pcs =3D num_pcs;
> > > +
> > > +	__set_bit(PHY_INTERFACE_MODE_SGMII,
> > > +		  port->phylink_config.supported_interfaces);
> > > +	__set_bit(PHY_INTERFACE_MODE_1000BASEX,
> > > +		  port->phylink_config.supported_interfaces);
> > > +	__set_bit(PHY_INTERFACE_MODE_2500BASEX,
> > > +		  port->phylink_config.supported_interfaces);
> > > +	__set_bit(PHY_INTERFACE_MODE_USXGMII,
> > > +		  port->phylink_config.supported_interfaces);
> > > +
> > > +	phy_interface_copy(port->phylink_config.pcs_interfaces,
> > > +			   port->phylink_config.supported_interfaces);
> > > +
> > > +	phylink =3D phylink_create(&port->phylink_config,
> > > +				 of_fwnode_handle(np),
> > > +				 phy_mode, &airoha_phylink_ops);
> > > +	if (IS_ERR(phylink)) {
> > > +		err =3D PTR_ERR(phylink);
> > > +		goto out;
> > > +	}
> > > +
> > > +	port->phylink =3D phylink;
> > > +out:
> > > +	kfree(available_pcs);
> > > +
> > > +	return err;
> > > +}
> > > +
> > >  static int airoha_alloc_gdm_port(struct airoha_eth *eth,
> > >  				 struct device_node *np, int index)
> > >  {
> > > @@ -2873,7 +3004,23 @@ static int airoha_alloc_gdm_port(struct airoha=
_eth *eth,
> > >  	if (err)
> > >  		return err;
> > > =20
> > > -	return register_netdev(dev);
> > > +	if (airhoa_is_phy_external(port)) {
> > > +		err =3D airoha_setup_phylink(dev);
> >=20
> > This will re-introduce the issue reported here:
> > https://lore.kernel.org/netdev/5c94b9b3850f7f29ed653e2205325620df28c3ff=
=2E1746715755.git.christophe.jaillet@wanadoo.fr/
> >=20
>=20
> I'm confused about this. The suggestion wasn't that register_netdev
> might fail and I need to destroy phylink? Or the linked patch was merged
> and I need to rebase on top of net-next?

what I mean here is if register_netdev() or airoha_setup_phylink() fails, we
should free metadata_dst running airoha_metadata_dst_free() as pointed out =
by
Christophe. I think this path depends on Christophe's one.

Regards,
Lorenzo

>=20
> I didn't include that change to not cause conflicts but once it's merged
> I will rebase and include that fix.
>=20
> > > +		if (err)
> > > +			return err;
> > > +	}
> > > +
> > > +	err =3D register_netdev(dev);
> > > +	if (err)
> > > +		goto free_phylink;
> > > +
> > > +	return 0;
> > > +
> > > +free_phylink:
> > > +	if (airhoa_is_phy_external(port))
> > > +		phylink_destroy(port->phylink);
> > > +
> > > +	return err;
> > >  }
> > > =20
> > >  static int airoha_probe(struct platform_device *pdev)
> > > @@ -2967,6 +3114,9 @@ static int airoha_probe(struct platform_device =
*pdev)
> > >  		struct airoha_gdm_port *port =3D eth->ports[i];
> > > =20
> > >  		if (port && port->dev->reg_state =3D=3D NETREG_REGISTERED) {
> > > +			if (airhoa_is_phy_external(port))
> > > +				phylink_destroy(port->phylink);
> > > +
> > >  			unregister_netdev(port->dev);
> > >  			airoha_metadata_dst_free(port);
> > >  		}
> > > @@ -2994,6 +3144,9 @@ static void airoha_remove(struct platform_devic=
e *pdev)
> > >  			continue;
> > > =20
> > >  		airoha_dev_stop(port->dev);
> > > +		if (airhoa_is_phy_external(port))
> > > +			phylink_destroy(port->phylink);
> > > +
> > >  		unregister_netdev(port->dev);
> > >  		airoha_metadata_dst_free(port);
> > >  	}
> > > diff --git a/drivers/net/ethernet/airoha/airoha_eth.h b/drivers/net/e=
thernet/airoha/airoha_eth.h
> > > index 53f39083a8b0..73a500474076 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_eth.h
> > > +++ b/drivers/net/ethernet/airoha/airoha_eth.h
> > > @@ -498,6 +498,9 @@ struct airoha_gdm_port {
> > >  	struct net_device *dev;
> > >  	int id;
> > > =20
> > > +	struct phylink *phylink;
> > > +	struct phylink_config phylink_config;
> > > +
> > >  	struct airoha_hw_stats stats;
> > > =20
> > >  	DECLARE_BITMAP(qos_sq_bmap, AIROHA_NUM_QOS_CHANNELS);
> > > diff --git a/drivers/net/ethernet/airoha/airoha_regs.h b/drivers/net/=
ethernet/airoha/airoha_regs.h
> > > index d931530fc96f..54f7079b28b0 100644
> > > --- a/drivers/net/ethernet/airoha/airoha_regs.h
> > > +++ b/drivers/net/ethernet/airoha/airoha_regs.h
> > > @@ -357,6 +357,18 @@
> > >  #define IP_FRAGMENT_PORT_MASK		GENMASK(8, 5)
> > >  #define IP_FRAGMENT_NBQ_MASK		GENMASK(4, 0)
> > > =20
> > > +#define REG_GDMA4_TMBI_FRAG		0x2028
> > > +#define GDMA4_SGMII1_TX_WEIGHT_MASK	GENMASK(31, 26)
> > > +#define GDMA4_SGMII1_TX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > > +#define GDMA4_SGMII0_TX_WEIGHT_MASK	GENMASK(15, 10)
> > > +#define GDMA4_SGMII0_TX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > > +
> > > +#define REG_GDMA4_RMBI_FRAG		0x202c
> > > +#define GDMA4_SGMII1_RX_WEIGHT_MASK	GENMASK(31, 26)
> > > +#define GDMA4_SGMII1_RX_FRAG_SIZE_MASK	GENMASK(25, 16)
> > > +#define GDMA4_SGMII0_RX_WEIGHT_MASK	GENMASK(15, 10)
> > > +#define GDMA4_SGMII0_RX_FRAG_SIZE_MASK	GENMASK(9, 0)
> > > +
> > >  #define REG_MC_VLAN_EN			0x2100
> > >  #define MC_VLAN_EN_MASK			BIT(0)
> > > =20
> > > --=20
> > > 2.48.1
> > >=20
>=20
>=20
>=20
> --=20
> 	Ansuel

--qLFnU5peW7PO9M+h
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaCHvPQAKCRA6cBh0uS2t
rCKKAQDoo1Ic7QM4rc/5oU7UWhtoTcWdR7rS8tHWdV+0UgkdMgEA3gSouVvqUpuL
PLyVAXcTL1u29P6WuHKZvkQmExHFyAU=
=1tGU
-----END PGP SIGNATURE-----

--qLFnU5peW7PO9M+h--

