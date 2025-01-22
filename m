Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8F8C02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 06:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9u/crJESfYgfLnXAEoVjLnp6VMMTVpiHqislLKaWtYY=; b=fYnAAwicoTY6Zo29gbfObMOXTC
	u2jC07mftef3O+5MK9LWz0yxsnv3Nu5MahfIqRpMypCH8m53BvoMeu7hJpJwFA7iuhhPBy90WHZPG
	rEZAwE7U2wj+BbLkKgwaAUG96Uh/WWJ32ir5Q79eWKVVfvzU40pz5I/ddmSeiFVjI2PkWLIHXmGxp
	pbdBMI5ru5J2iaA0R0ebUxWDcPWHVg02qS5z65TI1G+6+kmWv+0698yuLGAPAfrXiybdwIMb5P7Vr
	tQ8nPGSCw153SajaYG65AATbPBsoN70v7Ent99JXs+uH+WaaR8BoW3e9UzyeJouP08g8B5pLy9yHT
	I0na5+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUDK-00000009Udv-14F8;
	Wed, 22 Jan 2025 06:27:46 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUC1-00000009UO1-2TfJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:26:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1737527185; x=1769063185;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=9u/crJESfYgfLnXAEoVjLnp6VMMTVpiHqislLKaWtYY=;
  b=cz9pvCn3M9qkTzrVJHeKSpdd9NxmVI4YMJ+NxSHnDGIX95k5er1C91Hy
   njpGNUvtN+ONc+e3UixAxpg3tlevVJNpSz12IKCWsVzzKRRTddSLIK6+W
   cT2IR81feF9waiseJcG9xkTDX7+IGmcDvh8sQ/gVhRoR6Fvbp1zfEyvB/
   owQeDQzzdvE8rRd3qWG32p10T+Tbvy9Y8Z37RDipZ3zLkBh6jEX2bBoKf
   bsGLOIOfq0gjgwyJ/kMFh2XyLBGPoLGMG56CuY/RzAtnbzN82R9CDZBOR
   SY4VQsrdSVUok5uwMDbgpzu34csDFUAywI/L7BeQrcEymKCzjljRUN1bq
   Q==;
X-CSE-ConnectionGUID: n49MubZSTLyQQ9kP5gNPIg==
X-CSE-MsgGUID: JsBfTRQJSNi3llUWQOwZQg==
X-IronPort-AV: E=Sophos;i="6.13,224,1732575600"; 
   d="scan'208";a="41212545"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 22 Jan 2025 07:26:23 +0100
X-CheckPoint: {67908F8F-A-C6D8D88D-F91F9E6B}
X-MAIL-CPID: 2403587D2B52F075A1AD542859DADCF7_2
X-Control-Analysis: str=0001.0A682F22.67908F8F.0099,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D9A411645A8;
	Wed, 22 Jan 2025 07:26:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1737527179;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9u/crJESfYgfLnXAEoVjLnp6VMMTVpiHqislLKaWtYY=;
	b=ABum1UYuNNuF22azowes+x3IreIIxCHVRoi51q/OUa9Vb36cGigulimz8DMtZdHJwz5g+2
	HGJbagJvbN+5ByCTqhQnwwaO7THduL5oIkVPm0u70XaiTr2ZTHubTiInfeszzh1yQ85v6M
	SuNe/HbjZls8ypN7B84X66xx0FuPOQOHRMHnqAoTWL+/tNZ3+UkIYMqrwGuyZlyrby9aMh
	TMqfUetaLtlOaIuc0GmY+P+mYt6GGvT8SWeeBCbz/6NAx8eJRkbVIFhGVH2mqS7+tRtwYj
	c50OVyMrIOPmTxDPCQIr9nyAZJ0hy/YN2qTEOd+mFMImpqJK1yF7s1KqQjuBJQ==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, Peng Fan <peng.fan@nxp.com>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing controller for i.MX9
Date: Wed, 22 Jan 2025 07:26:16 +0100
Message-ID: <3890686.kQq0lBPeGt@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <PAXPR04MB8459845E7D949680044E203188E12@PAXPR04MB8459.eurprd04.prod.outlook.com>
References: <20250121-imx-ocotp-v6-0-76dab40e13db@nxp.com> <8513553.T7Z3S40VBb@steina-w> <PAXPR04MB8459845E7D949680044E203188E12@PAXPR04MB8459.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_222625_974718_5A9427F9 
X-CRM114-Status: GOOD (  34.31  )
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

Am Mittwoch, 22. Januar 2025, 04:36:33 CET schrieb Peng Fan:
> > Subject: Re: [PATCH v6 2/2] nvmem: imx-ocotp-ele: Support accessing
> > controller for i.MX9
> >=20
> > Hi,
> >=20
> > Am Dienstag, 21. Januar 2025, 16:05:32 CET schrieb Peng Fan (OSS):
> > > From: Peng Fan <peng.fan@nxp.com>
> > >
> > > i.MX9 OCOTP supports a specific peripheral or function being fused
> > > which means disabled, so
> > >  - Introduce ocotp_access_gates to be container of efuse gate info
> > >  - Iterate all nodes to check accessing permission. If not
> > >    allowed to be accessed, detach the node
> > >
> > > Signed-off-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/nvmem/Kconfig         |   3 +
> > >  drivers/nvmem/imx-ocotp-ele.c | 172
> > > +++++++++++++++++++++++++++++++++++++++++-
> > >  2 files changed, 174 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/nvmem/Kconfig b/drivers/nvmem/Kconfig index
> > >
> > 8671b7c974b933e147154bb40b5d41b5730518d2..77cc496fd5e0e1af
> > d753534b56fe
> > > 1f5ef3e3ec55 100644
> > > --- a/drivers/nvmem/Kconfig
> > > +++ b/drivers/nvmem/Kconfig
> > > @@ -93,6 +93,9 @@ config NVMEM_IMX_OCOTP_ELE
> > >  	  This is a driver for the On-Chip OTP Controller (OCOTP)
> > >  	  available on i.MX SoCs which has ELE.
> > >
> > > +	  If built as modules, any other driver relying on this working
> > > +	  as access controller also needs to be a module as well.
> > > +
> > >  config NVMEM_IMX_OCOTP_SCU
> > >  	tristate "i.MX8 SCU On-Chip OTP Controller support"
> > >  	depends on IMX_SCU
> > > diff --git a/drivers/nvmem/imx-ocotp-ele.c
> > > b/drivers/nvmem/imx-ocotp-ele.c index
> > >
> > ca6dd71d8a2e29888c6e556aaea116c1a967cb5f..5ea6d959ce38760ee
> > ed44a989992
> > > fb35c462c0b4 100644
> > > --- a/drivers/nvmem/imx-ocotp-ele.c
> > > +++ b/drivers/nvmem/imx-ocotp-ele.c
> > > @@ -5,6 +5,8 @@
> > >   * Copyright 2023 NXP
> > >   */
> > >
> > > +#include <dt-bindings/nvmem/fsl,imx93-ocotp.h>
> > > +#include <dt-bindings/nvmem/fsl,imx95-ocotp.h>
> > >  #include <linux/device.h>
> > >  #include <linux/io.h>
> > >  #include <linux/module.h>
> > > @@ -27,6 +29,7 @@ struct ocotp_map_entry {  };
> > >
> > >  struct ocotp_devtype_data {
> > > +	const struct ocotp_access_gates *access_gates;
> > >  	u32 reg_off;
> > >  	char *name;
> > >  	u32 size;
> > > @@ -36,6 +39,20 @@ struct ocotp_devtype_data {
> > >  	struct ocotp_map_entry entry[];
> > >  };
> > >
> > > +#define OCOTP_MAX_NUM_GATE_WORDS 4
> > > +
> > > +struct access_gate {
> > > +	u32 word;
> > > +	u32 mask;
> > > +};
> > > +
> > > +struct ocotp_access_gates {
> > > +	u32 num_words;
> > > +	u32 words[OCOTP_MAX_NUM_GATE_WORDS];
> > > +	u32 num_gates;
> > > +	struct access_gate *gates;
> > > +};
> > > +
> > >  struct imx_ocotp_priv {
> > >  	struct device *dev;
> > >  	void __iomem *base;
> > > @@ -131,6 +148,82 @@ static void
> > imx_ocotp_fixup_dt_cell_info(struct nvmem_device *nvmem,
> > >  	cell->read_post_process =3D imx_ocotp_cell_pp;  }
> > >
> > > +static int imx_ele_ocotp_check_access(struct imx_ocotp_priv *priv,
> > > +u32 id) {
> > > +	const struct ocotp_access_gates *access_gates =3D priv->data-
> > >access_gates;
> > > +	void __iomem *reg =3D priv->base + priv->data->reg_off;
> > > +	u32 word, mask, val;
> > > +
> > > +	if (id >=3D access_gates->num_gates) {
> > > +		dev_err(priv->config.dev, "Index %d too large\n", id);
> > > +		return -EACCES;
> > > +	}
> > > +
> > > +	word =3D access_gates->gates[id].word;
> > > +	mask =3D access_gates->gates[id].mask;
> > > +
> > > +	reg =3D priv->base + priv->data->reg_off + (word << 2);
> > > +	val =3D readl(reg);
> > > +
> > > +	dev_dbg(priv->config.dev, "id:%d word:%d mask:0x%08x\n",
> > id, word, mask);
> > > +	/* true means not allow access */
> > > +	if (val & mask)
> > > +		return -EACCES;
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int imx_ele_ocotp_grant_access(struct imx_ocotp_priv *priv,
> > > +struct device_node *parent) {
> > > +	struct device *dev =3D priv->config.dev;
> > > +
> > > +	for_each_available_child_of_node_scoped(parent, child) {
> > > +		struct of_phandle_args args;
> > > +		u32 id, idx =3D 0;
> > > +
> > > +		while (!of_parse_phandle_with_args(child, "access-
> > controllers",
> > > +						   "#access-
> > controller-cells",
> > > +						   idx++, &args)) {
> > > +			of_node_put(args.np);
> > > +			if (args.np !=3D dev->of_node)
> > > +				continue;
> > > +
> > > +			/* Only support one cell */
> > > +			if (args.args_count !=3D 1) {
> > > +				dev_err(dev, "wrong args count\n");
> > > +				continue;
> > > +			}
> > > +
> > > +			id =3D args.args[0];
> > > +
> > > +			dev_dbg(dev, "Checking node: %pOF
> > gate: %d\n", child, id);
> > > +
> > > +			if (imx_ele_ocotp_check_access(priv, id)) {
> > > +				of_detach_node(child);
> > > +				dev_info(dev, "%pOF: Not granted,
> > device driver will not be probed\n",
> > > +					 child);
> > > +			}
> > > +		}
> > > +
> > > +		imx_ele_ocotp_grant_access(priv, child);
> > > +	}
> > > +
> > > +	return 0;
> > > +}
> > > +
> > > +static int imx_ele_ocotp_access_control(struct imx_ocotp_priv *priv)
> > > +{
> > > +	struct device_node *root __free(device_node) =3D
> > > +of_find_node_by_path("/");
> > > +
> > > +	if (!priv->data->access_gates)
> > > +		return 0;
> > > +
> > > +	/* This should never happen */
> > > +	WARN_ON(!root);
> >=20
> > Even if you warning something is wrong, aka root =3D=3D NULL, you are s=
till
> > using it on imx_ele_ocotp_grant_access(). Just return early.
> >=20
> > if (WARN_ON(!))
> > 	return -EINVAL;
>=20
> Hmm, If this really happens, return early or not does not make much sense.
> Does it really matter here?

Why does it not make much sense? You already know something is wrong, aka
you have a NULL pointer, so it makes even less sense to continue.
I've skipped through the sources and looked for 'WARN_ON(!<pointer>)',
most of the times it is actually checked for early returns.

Best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/



