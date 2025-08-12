Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55D6C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 16:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WwiZ/U3pbnFYKJL5LpxoEKwFSJFJlvnnEd0wUSXJVMU=; b=29vodIs34zFhL3X0meO/m09+UK
	+o6jO4MBAsfzfKa4bnqo4zZLh0WKoYZW2Uvuk17HT/iZwr/m+go4fT1Oj4epMrTG3O6RU0rR4wddt
	VCng+4Lc3rYNTPRDTU14C43mzSGex0rcYrPuOHLYq9EDE3XGtkRhZJh9dFQ7Ko5+sf3AxVnsA3tvc
	u6Gsu5e858W/qDzjZzv6QltZSaaKYyM14Bln2Uyl0TfjCUu6Zbi5woStTg9XhIUQmD7RbczTejFqY
	KNf693uqL3fWKRDRZMiVcA9/SHR5HYty/fjZ+fEODWGcRQLKI55FuoZH0T0KrlKuTBOkINhGHJBu9
	xWfDcv/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulrkl-0000000BLY4-1cUR;
	Tue, 12 Aug 2025 16:21:35 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulnZ7-0000000Adkm-2HYU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 11:53:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ulnYf-0001BT-Ce; Tue, 12 Aug 2025 13:52:49 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ulnYd-00DBuR-16;
	Tue, 12 Aug 2025 13:52:47 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1ulnYd-000Fv3-0q;
	Tue, 12 Aug 2025 13:52:47 +0200
Message-ID: <cad00fbcb5dc69bb76358d495cef08dad56306a5.camel@pengutronix.de>
Subject: Re: [PATCH v10 2/2] memory: mtk-smi: mt8188: Add SMI reset and
 clamp for MT8188
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Friday Yang <friday.yang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
	Krzysztof Kozlowski
	 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 12 Aug 2025 13:52:47 +0200
In-Reply-To: <20250806085946.11383-3-friday.yang@mediatek.com>
References: <20250806085946.11383-1-friday.yang@mediatek.com>
	 <20250806085946.11383-3-friday.yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_045317_734049_DB597ECD 
X-CRM114-Status: GOOD (  25.93  )
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

On Mi, 2025-08-06 at 16:59 +0800, Friday Yang wrote:
> To prevent handling glitch signals during MTCMOS on/off transitions,
> SMI requires clamp and reset operations. Parse the reset settings for
> SMI LARBs and the clamp settings for the SMI Sub-Common. Register
> genpd callback for the SMI LARBs located in image, camera and IPE
> subsystems, and apply reset and clamp operations within the callback.
>=20
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 129 +++++++++++++++++++++++++++++++++++++++
>  1 file changed, 129 insertions(+)
>=20
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 733e22f695ab..acc8904dd117 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
> @@ -10,11 +10,15 @@
>  #include <linux/err.h>
>  #include <linux/io.h>
>  #include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> +#include <linux/pm_domain.h>
>  #include <linux/pm_runtime.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <linux/soc/mediatek/mtk_sip_svc.h>
>  #include <soc/mediatek/smi.h>
>  #include <dt-bindings/memory/mt2701-larb-port.h>
> @@ -34,6 +38,8 @@
>  #define SMI_FIFO_TH1			0x238
>  #define SMI_FIFO_TH2			0x23c
>  #define SMI_DCM				0x300
> +#define SMI_COMMON_CLAMP_EN_SET		0x3c4
> +#define SMI_COMMON_CLAMP_EN_CLR		0x3c8
>  #define SMI_DUMMY			0x444
> =20
>  /* SMI LARB */
> @@ -134,6 +140,7 @@ struct mtk_smi_larb_gen {
>  	unsigned int			larb_direct_to_common_mask;
>  	unsigned int			flags_general;
>  	const u8			(*ostd)[SMI_LARB_PORT_NR_MAX];
> +	const u8			*clamp_port;
>  };
> =20
>  struct mtk_smi {
> @@ -150,6 +157,7 @@ struct mtk_smi {
>  };
> =20
>  struct mtk_smi_larb { /* larb: local arbiter */
> +	struct device			*dev;
>  	struct mtk_smi			smi;
>  	void __iomem			*base;
>  	struct device			*smi_common_dev; /* common or sub-common dev */
> @@ -157,6 +165,10 @@ struct mtk_smi_larb { /* larb: local arbiter */
>  	int				larbid;
>  	u32				*mmu;
>  	unsigned char			*bank;
> +	struct regmap			*smi_comm_syscon; /* smi-comm or sub-comm */
> +	u8				smi_comm_in_port_id; /* smi-comm or sub-comm */
> +	struct notifier_block		nb;
> +	struct reset_control		*rst_con;
>  };
> =20
>  static int
> @@ -478,6 +490,19 @@ static const u8 mtk_smi_larb_mt8195_ostd[][SMI_LARB_=
PORT_NR_MAX] =3D {
>  	[28] =3D {0x1a, 0x0e, 0x0a, 0x0a, 0x0c, 0x0e, 0x10,},
>  };
> =20
> +static const u8 mtk_smi_larb_clamp_port_mt8188[MTK_LARB_NR_MAX] =3D {
> +	[9]	=3D BIT(1), /* larb10 */
> +	[10]	=3D BIT(2), /* larb11a */
> +	[11]	=3D BIT(2), /* larb11b */
> +	[12]	=3D BIT(3), /* larb11c */
> +	[13]	=3D BIT(0), /* larb12 */
> +	[16]	=3D BIT(1), /* larb15 */
> +	[17]	=3D BIT(2), /* larb16a */
> +	[18]	=3D BIT(2), /* larb16b */
> +	[19]	=3D BIT(3), /* larb17a */
> +	[20]	=3D BIT(3), /* larb17b */
> +};
> +
>  static const struct mtk_smi_larb_gen mtk_smi_larb_mt2701 =3D {
>  	.port_in_larb =3D {
>  		LARB0_PORT_OFFSET, LARB1_PORT_OFFSET,
> @@ -531,6 +556,7 @@ static const struct mtk_smi_larb_gen mtk_smi_larb_mt8=
188 =3D {
>  	.flags_general	            =3D MTK_SMI_FLAG_THRT_UPDATE | MTK_SMI_FLAG_=
SW_FLAG |
>  				      MTK_SMI_FLAG_SLEEP_CTL | MTK_SMI_FLAG_CFG_PORT_SEC_CTL,
>  	.ostd		            =3D mtk_smi_larb_mt8188_ostd,
> +	.clamp_port                 =3D mtk_smi_larb_clamp_port_mt8188,
>  };
> =20
>  static const struct mtk_smi_larb_gen mtk_smi_larb_mt8192 =3D {
> @@ -582,6 +608,45 @@ static void mtk_smi_larb_sleep_ctrl_disable(struct m=
tk_smi_larb *larb)
>  	writel_relaxed(0, larb->base + SMI_LARB_SLP_CON);
>  }
> =20
> +static int mtk_smi_larb_clamp_protect_enable(struct device *dev, bool en=
able)
> +{
> +	struct mtk_smi_larb *larb =3D dev_get_drvdata(dev);
> +	u32 reg;
> +	int ret;
> +
> +	/* smi_comm_syscon may be NULL if the subsys doesn't have bus glitch is=
sues */
> +	if (!larb->smi_comm_syscon)
> +		return -EINVAL;
> +
> +	reg =3D enable ? SMI_COMMON_CLAMP_EN_SET : SMI_COMMON_CLAMP_EN_CLR;
> +
> +	ret =3D regmap_write(larb->smi_comm_syscon, reg, larb->smi_comm_in_port=
_id);
> +	if (ret)
> +		dev_err(dev, "Unable to %s clamp for input port %d: %d\n",
> +			enable ? "enable" : "disable",
> +			larb->smi_comm_in_port_id, ret);
> +
> +	return ret;
> +}
> +
> +static int mtk_smi_genpd_callback(struct notifier_block *nb,
> +				  unsigned long flags, void *data)
> +{
> +	struct mtk_smi_larb *larb =3D container_of(nb, struct mtk_smi_larb, nb)=
;
> +	struct device *dev =3D larb->dev;
> +
> +	if (flags =3D=3D GENPD_NOTIFY_PRE_ON || flags =3D=3D GENPD_NOTIFY_PRE_O=
FF) {
> +		/* disable related SMI sub-common port */
> +		mtk_smi_larb_clamp_protect_enable(dev, true);
> +	} else if (flags =3D=3D GENPD_NOTIFY_ON) {
> +		/* enable related SMI sub-common port */
> +		reset_control_reset(larb->rst_con);
> +		mtk_smi_larb_clamp_protect_enable(dev, false);
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
>  static int mtk_smi_device_link_common(struct device *dev, struct device =
**com_dev)
>  {
>  	struct platform_device *smi_com_pdev;
> @@ -638,6 +703,51 @@ static int mtk_smi_dts_clk_init(struct device *dev, =
struct mtk_smi *smi,
>  	return ret;
>  }
> =20
> +static int mtk_smi_larb_parse_clamp_optional(struct mtk_smi_larb *larb)
> +{
> +	struct device *dev =3D larb->dev;
> +	const struct mtk_smi_larb_gen *larb_gen =3D larb->larb_gen;
> +	u32 larb_id;
> +	int ret;
> +
> +	/*
> +	 * Only SMI LARBs in camera, image and IPE subsys need to
> +	 * apply clamp and reset operations, others can be skipped.
> +	 */
> +	ret =3D of_property_read_u32(dev->of_node, "mediatek,larb-id", &larb_id=
);
> +	if (ret || !larb_gen->clamp_port || !larb_gen->clamp_port[larb_id])
> +		return 0;
> +
> +	larb->smi_comm_in_port_id =3D larb_gen->clamp_port[larb_id];
> +	larb->smi_comm_syscon =3D syscon_regmap_lookup_by_phandle(dev->of_node,
> +								"mediatek,smi");
> +	if (IS_ERR(larb->smi_comm_syscon)) {
> +		larb->smi_comm_syscon =3D NULL;
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Unknown clamp port for larb %d\n", larb_id);
> +	}
> +
> +	return 0;
> +}
> +
> +static int mtk_smi_larb_parse_reset_optional(struct mtk_smi_larb *larb)
> +{
> +	struct device *dev =3D larb->dev;
> +	int ret;
> +
> +	larb->rst_con =3D devm_reset_control_get_optional_exclusive(dev, "larb"=
);
> +	if (!larb->rst_con)
> +		return 0;

Please don't ignore errors.

regards
Philipp

