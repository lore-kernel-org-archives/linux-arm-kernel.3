Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3411BC02185
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IzKU10bagC8QLYBmLhpwVe32MCxBcC146OOm5NeHEiM=; b=Otk4esesr/J99rLVNTsDurWP6K
	ghgYGh8j7WUwSM77wL4yNmAMixIJWiQW6E/d+UoNRxehByolx7Ey4ylqA82+AnTv+Rllv/A91legX
	A4yi28cCCgooJXEn2W86jVoerVjkLWBu/5TKbWs/5d7Km7rYrufjfRhN0MjWJCJjInZ5V7NTv4Vva
	gZEZl1pA5tBxGZwQ8a4wOl4U7qbSgWooAma0O8InI7NU8tjyW2+FxfLF+EEq9GIo4MkbwPIIrEtTC
	M28cb41G40lxQFFdQlrcnLZ363xu+0VDFu5zJwHMD5e9n5re7iMKcuh+ZDGxJyO0jfVkmZjDxADzc
	Qt8pDY6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taA4J-00000007Kv8-3RA0;
	Tue, 21 Jan 2025 08:57:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taA1F-00000007K6E-0QZG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:53:58 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1taA14-00051k-IY; Tue, 21 Jan 2025 09:53:46 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1taA12-0014uC-2o;
	Tue, 21 Jan 2025 09:53:44 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1taA12-00026M-2Z;
	Tue, 21 Jan 2025 09:53:44 +0100
Message-ID: <98d064a635467dcc3937d1ec9c5b1659bd71eb91.camel@pengutronix.de>
Subject: Re: [PATCH v3 2/2] memory: mtk-smi: mt8188: Add SMI reset and clamp
 for MT8188
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Friday Yang <friday.yang@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
	Krzysztof Kozlowski
	 <krzk@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley
	 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Tue, 21 Jan 2025 09:53:44 +0100
In-Reply-To: <20250121064934.13482-3-friday.yang@mediatek.com>
References: <20250121064934.13482-1-friday.yang@mediatek.com>
	 <20250121064934.13482-3-friday.yang@mediatek.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_005357_138015_828BBFD7 
X-CRM114-Status: GOOD (  23.17  )
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

On Di, 2025-01-21 at 14:49 +0800, Friday Yang wrote:
> From: "friday.yang" <friday.yang@mediatek.com>
>=20
> To prevent handling glitch signals during MTCMOS on/off transitions,
> SMI requires clamp and reset operations. Parse the reset settings for
> SMI LARBs and the clamp settings for the SMI Sub-Common. Register
> genpd callback for the SMI LARBs located in image, camera and IPE
> subsystems, and apply reset and clamp operations within the callback.
>=20
> Signed-off-by: Friday Yang <friday.yang@mediatek.com>
> ---
>  drivers/memory/mtk-smi.c | 141 +++++++++++++++++++++++++++++++++++++--
>  1 file changed, 137 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/memory/mtk-smi.c b/drivers/memory/mtk-smi.c
> index 5710348f72f6..aaeb80379ec1 100644
> --- a/drivers/memory/mtk-smi.c
> +++ b/drivers/memory/mtk-smi.c
[...]
> @@ -528,6 +598,53 @@ static int mtk_smi_dts_clk_init(struct device *dev, =
struct mtk_smi *smi,
>  	return ret;
>  }
>=20
> +static int mtk_smi_larb_parse_clamp_optional(struct mtk_smi_larb *larb)
> +{
> +	struct device *dev =3D larb->dev;
> +	const struct mtk_smi_larb_gen *larb_gen =3D larb->larb_gen;
> +	u32 larb_id;
> +	int ret;
> +
> +	/**
> +	 * Only SMI LARBs in camera, image and IPE subsys need to
> +	 * apply clamp and reset operations, others can be skipped.
> +	 */
> +	ret =3D of_property_read_u32(dev->of_node, "mediatek,larb-id", &larb_id=
);
> +	if (ret)
> +		return -EINVAL;
> +	if (!larb_gen->clamp_port || !larb_gen->clamp_port[larb_id])
> +		return 0;
> +
> +	larb->sub_comm_inport =3D larb_gen->clamp_port[larb_id];
> +	larb->sub_comm_syscon =3D syscon_regmap_lookup_by_phandle(dev->of_node,=
 "mediatek,smi");
> +	if (IS_ERR(larb->sub_comm_syscon)) {
> +		larb->sub_comm_syscon =3D NULL;
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
> +	larb->rst_con =3D devm_reset_control_get(dev, "larb");

Please use devm_reset_control_get_exclusive() directly.
Or use devm_reset_control_get_optional_exclusive(), which returns NULL
instead of -ENOENT. That way you can ...

> +	if (IS_ERR(larb->rst_con))
> +		return dev_err_probe(dev, PTR_ERR(larb->rst_con),
> +				     "Failed to get larb reset controller\n");

... suppress this error message in case of -ENOENT and return with:

	if (!larb->rst_con)
		return 0;

here.

> +
> +	larb->nb.notifier_call =3D mtk_smi_genpd_callback;
> +	ret =3D dev_pm_genpd_add_notifier(dev, &larb->nb);
> +	if (ret)
> +		return dev_err_probe(dev, -EINVAL,
> +				     "Failed to add genpd callback %d\n", ret);
> +
> +	return 0;
> +}
> +
>  static int mtk_smi_larb_probe(struct platform_device *pdev)
>  {
>  	struct mtk_smi_larb *larb;
> @@ -538,6 +655,7 @@ static int mtk_smi_larb_probe(struct platform_device =
*pdev)
>  	if (!larb)
>  		return -ENOMEM;
>=20
> +	larb->dev =3D dev;
>  	larb->larb_gen =3D of_device_get_match_data(dev);
>  	larb->base =3D devm_platform_ioremap_resource(pdev, 0);
>  	if (IS_ERR(larb->base))
> @@ -554,15 +672,24 @@ static int mtk_smi_larb_probe(struct platform_devic=
e *pdev)
>  	if (ret < 0)
>  		return ret;
>=20
> -	pm_runtime_enable(dev);
> +	ret =3D mtk_smi_larb_parse_clamp_optional(larb);
> +	if (ret)
> +		goto err_link_remove;
> +
> +	ret =3D mtk_smi_larb_parse_reset_optional(larb);
> +	if (ret && ret !=3D -ENOENT)

The ret !=3D -ENOENT check could be dropped if you use
devm_reset_control_get_optional_exclusive() above.


regards
Philipp

