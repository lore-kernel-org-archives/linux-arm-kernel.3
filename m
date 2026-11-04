Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCA10606D4C6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 19:23:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=kORnHRez;
	dkim=temperror header.d=protonmail.com header.i=@protonmail.com header.a=rsa-sha256 header.s=protonmail3 header.b=qGr2NKGN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PoEnk5w0FeXgmUszIA38mVTO0/9NRJVsUtjtCXZXtvk=; b=kORnHRezpsfT1q
	xeiJX/amis/ZQK5Hewqs6tU7VlEo0bbjhS6M3C+nR553t677aWK1BcuHKLfzscuqtE9I46QZlAMk7
	ytoDyQHLH2Qm2pzDfsjsyCBbZMw+L2xgwi8O7myP0AU7pPuMQm2urq0SHMIWQ/rs/JoXBUD6zMoTd
	4Bm83LsEC6L87efvK7faE0B/BIOXj2oXSyud80DWNJ7+41n30A6T77wgdgN4pvxtmbFWjtFE96SWE
	kcRFhYg2QksM9FOIYJ874n1IyeDN+JtTR7fzffneFosvB8FwE09Ak8aNqlnjKWIyoMPWNPf/55Yvf
	6Ay87ItF9RXqok41PvHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg9l-00000006T3p-3xio;
	Wed, 04 Nov 2026 18:56:21 +0000
Received: from mail-4322.protonmail.ch ([185.70.43.22])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOg9j-00000006T2P-2pRs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 18:56:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1793818576; x=1794077776;
	bh=PoEnk5w0FeXgmUszIA38mVTO0/9NRJVsUtjtCXZXtvk=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=qGr2NKGNyA8oQsQN5aT4QbA2ipKJFBAk8gaR7VbT56KzBAQptM3M/5H80lBsj1Z6y
	 st0Heiowa4h9BebEodOu+qHAiYNvhldpzxLdsK25Znd6fzCkoYv2HflgHYT2ALeb5S
	 KfMc19qLA2Ryo1oPN4cI9zmoOSpiLCC0edOufl2dfT4JD+lalPs66QLXzlg//+EZ4w
	 sPUK0j1IYsw17fZ3ghLls+jifpHIM9woX2ZgFi7X84+DHRuGfiBQ22AZN26xuQjaIP
	 j6RtAb6MW/4H6BMwrV1oisuevt3F2ZPdGKJOHESBKDo9wSWnRkQKp6bC9bhM2p99R/
	 +zZ5hAWz9jNsg==
Date: Wed, 04 Nov 2026 18:56:12 +0000
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
From: Roman Vivchar <rva333@protonmail.com>
Cc: chunkuang.hu@kernel.org, p.zabel@pengutronix.de, maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com, jitao.shi@mediatek.com, dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, kernel@collabora.com, justin.yeh@mediatek.com, jason-jh.lin@mediatek.com, CK Hu <ck.hu@mediatek.com>
Subject: Re: [PATCH v9 05/13] drm/mediatek: mtk_dsi: Enable interrupt at component bind time
Message-ID: <hXDHNenOxP_1Fjv3k-eSNDIFG2yGsdvlxFOCpn0SMdRImzGWQfDVFE-0px1K0-Z472dL3IuLWE5BWIQeOo_U12SjzZOeJ3FNLIxus-KoGNE=@protonmail.com>
In-Reply-To: <20260916110825.102631-6-angelogioacchino.delregno@collabora.com>
References: <20260916110825.102631-1-angelogioacchino.delregno@collabora.com> <20260916110825.102631-6-angelogioacchino.delregno@collabora.com>
Feedback-ID: 173184497:user:proton
X-Pm-Message-ID: 1252c7109e566e88ba7843d515915c4f14738510
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261104_105619_866390_82D55A71 
X-CRM114-Status: GOOD (  19.68  )
X-Spam-Score: -2.5 (--)
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
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Wednesday, September 16th, 2026 at 2:08 PM, AngeloGioacchino Del Regno <=
angelogioacchino.delregno@collabora.com> wrote:

> Having the DSI interrupt enabled before actually binding the DSI
> component to the display controller driver is both useless and
> dangerous: the main purpose of this interrupt is to signal CMD
> done, LP RX data ready, or VideoMode done, or to reset the HW
> engine if this doesn't come.
>=20
> Should this interrupt come too late (during probe), the HW will
> be reset only at the next occurrence of a timeout, which slows
> down boot and may render artifacts to the DSI display.
>=20
> Moreover, clearing the DSI interrupt while the display controller
> is not ready yet, may result in an interrupt storm.
>=20
> In order to prevent this from happening, request the interrupt
> with IRQF_NO_AUTOEN, and enable it only when binding DSI to its
> display controller component master.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>
> Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@coll=
abora.com>

This was necessary on mt6595, otherwise it would get stuck.

Acked-by: Roman Vivchar <rva333@protonmail.com>
Tested-by: Roman Vivchar <rva333@protonmail.com> # mt6595, mt6768

> ---
>  drivers/gpu/drm/mediatek/mtk_dsi.c | 24 +++++++++++++-----------
>  1 file changed, 13 insertions(+), 11 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/mediatek/mtk_dsi.c b/drivers/gpu/drm/mediate=
k/mtk_dsi.c
> index 28ba532210ff..6ac6daa61e68 100644
> --- a/drivers/gpu/drm/mediatek/mtk_dsi.c
> +++ b/drivers/gpu/drm/mediatek/mtk_dsi.c
> @@ -225,6 +225,7 @@ struct mtk_dsi {
>  =09int refcount;
>  =09bool enabled;
>  =09bool lanes_ready;
> +=09int irq;
>  =09u32 irq_data;
>  =09wait_queue_head_t irq_wait_queue;
>  =09const struct mtk_dsi_driver_data *driver_data;
> @@ -1101,6 +1102,8 @@ static int mtk_dsi_bind(struct device *dev, struct =
device *master, void *data)
>  =09=09return ret;
>  =09}
>=20
> +=09enable_irq(dsi->irq);
> +
>  =09return 0;
>  }
>=20
> @@ -1109,6 +1112,8 @@ static void mtk_dsi_unbind(struct device *dev, stru=
ct device *master,
>  {
>  =09struct mtk_dsi *dsi =3D dev_get_drvdata(dev);
>=20
> +=09disable_irq(dsi->irq);
> +
>  =09drm_encoder_cleanup(&dsi->encoder);
>  }
>=20
> @@ -1342,7 +1347,6 @@ static int mtk_dsi_probe(struct platform_device *pd=
ev)
>  {
>  =09struct mtk_dsi *dsi;
>  =09struct device *dev =3D &pdev->dev;
> -=09int irq_num;
>  =09int ret;
>=20
>  =09dsi =3D devm_drm_bridge_alloc(dev, struct mtk_dsi, bridge,
> @@ -1375,9 +1379,9 @@ static int mtk_dsi_probe(struct platform_device *pd=
ev)
>  =09if (IS_ERR(dsi->phy))
>  =09=09return dev_err_probe(dev, PTR_ERR(dsi->phy), "Failed to get MIPI-D=
PHY\n");
>=20
> -=09irq_num =3D platform_get_irq(pdev, 0);
> -=09if (irq_num < 0)
> -=09=09return irq_num;
> +=09dsi->irq =3D platform_get_irq(pdev, 0);
> +=09if (dsi->irq < 0)
> +=09=09return dsi->irq;
>=20
>  =09dsi->host.ops =3D &mtk_dsi_ops;
>  =09dsi->host.dev =3D dev;
> @@ -1386,17 +1390,15 @@ static int mtk_dsi_probe(struct platform_device *=
pdev)
>=20
>  =09platform_set_drvdata(pdev, dsi);
>=20
> +=09ret =3D devm_request_irq(&pdev->dev, dsi->irq, mtk_dsi_irq,
> +=09=09=09       IRQF_NO_AUTOEN, dev_name(&pdev->dev), dsi);
> +=09if (ret)
> +=09=09return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n=
");
> +
>  =09ret =3D mipi_dsi_host_register(&dsi->host);
>  =09if (ret < 0)
>  =09=09return dev_err_probe(dev, ret, "Failed to register DSI host\n");
>=20
> -=09ret =3D devm_request_irq(&pdev->dev, irq_num, mtk_dsi_irq,
> -=09=09=09       IRQF_TRIGGER_NONE, dev_name(&pdev->dev), dsi);
> -=09if (ret) {
> -=09=09mipi_dsi_host_unregister(&dsi->host);
> -=09=09return dev_err_probe(&pdev->dev, ret, "Failed to request DSI irq\n=
");
> -=09}
> -
>  =09dsi->bridge.of_node =3D dev->of_node;
>  =09dsi->bridge.type =3D DRM_MODE_CONNECTOR_DSI;
>=20
> --
> 2.55.0
>=20
>=20
> 

