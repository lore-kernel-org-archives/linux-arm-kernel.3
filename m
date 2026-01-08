Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FE37CF6ABB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 09:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qIhgIeQrfxHoSwY6/8Qg78ZyXWur/EQhKlbMMeWRoFE=; b=MG8eLc1DIlIByyYS12lwlnm2K/
	RQZaEr5cvMUS2HduwU5uT93cHVL9/JLaR+7PnHcTJLIpxXFEPg96zYPHlheS/jHc2AAOmBHmV2u5R
	OWlNF52vt6IWKBvL0X5VaUjyeEPTxYp22ghNS7rfUdp9EuLmWkzwE7VWTLTZVu+te3IW/89fZFqSw
	tlwqhz+tsvFE3CVlMdp3Hs1DVJ4nPUQnMCzQ4r7rYqg1Bhwkld+vAqjDyTvacgmCfq0H1IaNRlEz2
	4njc98Tsa1W9k08g8Ajs7RkGv4mVog85A8/ppsl2TqSE1jZEbZgwrOU4po2tw8KjYsz2X1dC7bIQO
	uwlBKY3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmfw-0000000GWXD-42Zb;
	Thu, 08 Jan 2026 09:51:28 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdmfr-0000000GWVK-2zOe;
	Thu, 08 Jan 2026 09:51:26 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260108095119euoutp012e7ad1462b8b6546e4cff164dba8ea55~IuKaJVawL1372713727euoutp01r;
	Thu,  8 Jan 2026 09:51:19 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260108095119euoutp012e7ad1462b8b6546e4cff164dba8ea55~IuKaJVawL1372713727euoutp01r
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767865879;
	bh=qIhgIeQrfxHoSwY6/8Qg78ZyXWur/EQhKlbMMeWRoFE=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=UTRxRKAkfvHrYXb9uuCmebd05iS7yvKrvvnJwRrRGhnYTQOLlD9QO1+EdwnMJ+ehI
	 u+g5bCtH0fF1cWkIawNRR2L1XBWHErXWwnjERy/ax6OfO/jSXefKZQPQG4zziy4O0D
	 g+iU8AvXlmt/VOaAS6kHTAjcr9t0XASl+sQYc+ow=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260108095118eucas1p1a2ae95ae60fa870c35c955b087ba4649~IuKZz7bdM1725517255eucas1p1B;
	Thu,  8 Jan 2026 09:51:18 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260108095116eusmtip22f2b99fa0f4ed0d118e1c4afbe18750f~IuKXrldR10240202402eusmtip2j;
	Thu,  8 Jan 2026 09:51:16 +0000 (GMT)
Message-ID: <af154ebb-53b9-40eb-8ff9-089ed8bc3f04@samsung.com>
Date: Thu, 8 Jan 2026 10:51:15 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 5/6] drm/exynos: hdmi: convert to
 of_drm_find_and_get_bridge()
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Andrzej Hajda
	<andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>, Laurent Pinchart
	<Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, Jernej
	Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Kevin Hilman <khilman@baylibre.com>, Jerome
	Brunet <jbrunet@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, Philipp Zabel
	<p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
	<s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>, Laurent Pinchart
	<laurent.pinchart+renesas@ideasonboard.com>, Tomi Valkeinen
	<tomi.valkeinen+renesas@ideasonboard.com>, Kieran Bingham
	<kieran.bingham+renesas@ideasonboard.com>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev,
	linux-mediatek@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260108095118eucas1p1a2ae95ae60fa870c35c955b087ba4649
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107164213eucas1p21ed81372d4acebdf02a825b66b0e75de
X-EPHeader: CA
X-CMS-RootMailID: 20260107164213eucas1p21ed81372d4acebdf02a825b66b0e75de
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-0-ef48a517828e@bootlin.com>
	<CGME20260107164213eucas1p21ed81372d4acebdf02a825b66b0e75de@eucas1p2.samsung.com>
	<20260107-drm-bridge-alloc-getput-drm_of_find_bridge-3-v1-5-ef48a517828e@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_015124_356032_5E52A67D 
X-CRM114-Status: GOOD (  16.98  )
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

On 07.01.2026 17:22, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>   drivers/gpu/drm/exynos/exynos_hdmi.c | 4 +++-

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

>   1 file changed, 3 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_hdmi.c b/drivers/gpu/drm/exynos/exynos_hdmi.c
> index 01813e11e6c6..bfcf2fa62fe1 100644
> --- a/drivers/gpu/drm/exynos/exynos_hdmi.c
> +++ b/drivers/gpu/drm/exynos/exynos_hdmi.c
> @@ -1779,7 +1779,7 @@ static int hdmi_bridge_init(struct hdmi_context *hdata)
>   		return -EINVAL;
>   	}
>   
> -	hdata->bridge = of_drm_find_bridge(np);
> +	hdata->bridge = of_drm_find_and_get_bridge(np);
>   	of_node_put(np);
>   
>   	if (!hdata->bridge)
> @@ -2096,6 +2096,8 @@ static void hdmi_remove(struct platform_device *pdev)
>   
>   	put_device(&hdata->ddc_adpt->dev);
>   
> +	drm_bridge_put(hdata->bridge);
> +
>   	mutex_destroy(&hdata->mutex);
>   }
>   
>
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


