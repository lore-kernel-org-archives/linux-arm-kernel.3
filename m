Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBC6DC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 11:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bQ5YkObDJn3q5yEXBMbpydhpxp/loGCG/PfQF+sLSPI=; b=rubSfp5tgOSLzBrToYC36zioQo
	anm06iQA0sKbrsHvrQLR+u8Y6Q79ocxF9Y6OdI51eJvb7KbZYPFyk6Wb8W10Cm56R4CDyZ2tREleU
	GJ1x40jEfAwb401VdLOoaHm5cG8tZh64kK+2cVOUmO545Soov8ubR9yPQE/5c1EQ7NZ8dr5Qnbe7O
	/0V4rVCXs/NRAWUO/KkHVOEjTFjyHTskm5rQBIEeJ1cXw6Mm7swGIZQ6R42h4fg7oOgCWf4i0VRg5
	v2mDXfVthBsrQJsArL+58OebNu1aFpTfLhWB0Qi1NzasyZavx0TKBHj8taSB34t5RqbW5MXIahCtQ
	gNL60UXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEtZ-000000090Zv-0PHP;
	Mon, 13 Jul 2026 11:32:21 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjEtW-000000090ZC-08QN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 11:32:19 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-84536ecfc5bso3261181b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 13 Jul 2026 04:32:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783942337; x=1784547137; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQ5YkObDJn3q5yEXBMbpydhpxp/loGCG/PfQF+sLSPI=;
        b=XoXAP9Ntowznpe6WxQvPMaPQJcSGDsvSa17ghPQ+KfLM5YC54GJZAge9yV3Ys+ROUo
         gjC262otb7IQ3lcfKd7Z7v+p9fpv1PVyY+rNl41BeXAN22nFBO5COTG09wZ7fCa8P8UV
         1B3nyucpo/EaQ4f6a+uvejFSxkOgTeW3vN/4iCj+3UpoKUWhZ9gvv+J+32G4Rfy04dyb
         swTHn+gJpOXmd8fwKW4gLLUAwtHATAirVGW6a98lrjB7bnRj0TMEaS5G2gsQSp+yk1fI
         vH2extFkBRhlRHRkGo/+7sS9nRtmaG7oi2eq3FzwsJT/XpnrLl4hMZ1wXjbNWsImD8vA
         uWuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783942337; x=1784547137;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQ5YkObDJn3q5yEXBMbpydhpxp/loGCG/PfQF+sLSPI=;
        b=fGzbnDsHTpI+kF4nv77xcuqSyICz7AObxRqFwXECir7bLcc+/kOm+fhgYGS+Y2vKvL
         Dfv3JlOhPw7tiSDR2dj0TZQi9oc3p+wWiY8AIWoW16ifr7dtL5E+PYo774zwSRbbxLOA
         Q1ZxEKtD1jV88f9/7MUKvygdEM45vUE3LrkRjnNjKUKJ5NMcjP1Cqr2xT2cdTGyNfmq6
         IVxNzsRVBC0yPAqCsGXd4qy/EsDcmnMMkAcOGZY57zM9ZO5E+eD6xIusKaHju6Z+WbXn
         SPHH3X0CgxMebuIdjyXOUhivJ9J060W5uhBE5B+UVrqChQ+9BvD9X0v6V+/2Q1fFPdva
         KPSg==
X-Forwarded-Encrypted: i=1; AHgh+RrVMbpHSHDzAXUpkHfKVghBvc0uUawEMmvYN8SMNzvH5U0x50wKn/mIDu6bX97O9y/kfC8CpiQNvQZlU+HNTYw+@lists.infradead.org
X-Gm-Message-State: AOJu0YyC62/XvvgHG/a4OOJYJgEYw8Guo8lcoDbcA6mWifWlg1adtFg4
	qzV0LZnD/MiBwUwOcfqHKAT+zu31GXTu8cZ6srybTMu6Vag+g+nLd9s7
X-Gm-Gg: AfdE7ckNfYHU5tbnxLSVtLQuK5SEVX/oc1bFEZX7hAIj0dfOQyzowdFjdxLdbZW4iYM
	rZeXVnT1PuEWu2i2yS0kJrPkHxCW28G8grmTs+dwSRY4mxKGlhkpyY/xuBw+Klxw5zBoN2mw0MP
	ROIJCy5CaepEDNbKDwzILhEZ2/xkS07yRRiahztaBMvPocI5snl9SPSCUWzygcQN6o7EMJ5vCBU
	y5syN5uxELpQim/oRru6RTFoCYfILdYxeLitwkx7nhgd4GSGbXysZpZHUOx9iDZ+2/uU4h/FsHZ
	g1B1QHDpa7hms4pgaWEB22UKaSWKxPnNSHIUn77+rO0HCHEcmz3ISCd/GGqZ0twSmOxeQhCGiYu
	0+G57NN0OtHzFXJWCnu4Ue4EeHQ3/52uNsjlzlREUFtJNZx+lCo/9PljDzi6LcHZ4isPv5mg=
X-Received: by 2002:a05:6a00:18aa:b0:845:d286:1fa8 with SMTP id d2e1a72fcca58-84889768958mr8641367b3a.55.1783942336528;
        Mon, 13 Jul 2026 04:32:16 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::f280])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84880a4abf1sm4318802b3a.16.2026.07.13.04.32.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Jul 2026 04:32:16 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	CK Hu <ck.hu@mediatek.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Johan Hovold <johan@kernel.org>,
	Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] drm/mediatek: mtk_hdmi: Fix DDC adapter double put in v2
Date: Mon, 13 Jul 2026 19:29:57 +0800
Message-ID: <20260713112957.884640-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_043218_088318_188141C0 
X-CRM114-Status: GOOD (  14.52  )
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

mtk_hdmi_common_probe() gets the DDC adapter with
of_find_i2c_adapter_by_node() and registers a devm action to release the
adapter device reference with put_device().

The HDMI v2 remove callback also calls i2c_put_adapter() on the same DDC
adapter. This is not paired with of_find_i2c_adapter_by_node(): it drops
the adapter device reference before the devm action drops it again, and
it also puts a module reference that was never taken.

Remove the extra i2c_put_adapter() call and drop the now-empty HDMI v2
remove callback. The common devm action releases the adapter device
reference.

Fixes: 8d0f79886273 ("drm/mediatek: Introduce HDMI/DDC v2 for MT8195/MT8188")
Cc: stable@vger.kernel.org
Reviewed-by: Johan Hovold <johan@kernel.org>
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Add Reviewed-by tag from Johan Hovold.
  - No code changes.

v2:
  - Drop the empty remove callback, as suggested by Johan Hovold.
  - Mention that i2c_put_adapter() also drops a module reference that was
    never taken.
  - Fix the Fixes tag.
  - Add Cc stable.

 drivers/gpu/drm/mediatek/mtk_hdmi_v2.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
index 7bbf463056c9..ffe456238a2b 100644
--- a/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
+++ b/drivers/gpu/drm/mediatek/mtk_hdmi_v2.c
@@ -1499,13 +1499,6 @@ static int mtk_hdmi_v2_probe(struct platform_device *pdev)
 	return 0;
 }
 
-static void mtk_hdmi_v2_remove(struct platform_device *pdev)
-{
-	struct mtk_hdmi *hdmi = platform_get_drvdata(pdev);
-
-	i2c_put_adapter(hdmi->ddc_adpt);
-}
-
 static const struct of_device_id mtk_drm_hdmi_v2_of_ids[] = {
 	{ .compatible = "mediatek,mt8188-hdmi-tx", .data = &mtk_hdmi_conf_mt8188 },
 	{ .compatible = "mediatek,mt8195-hdmi-tx", .data = &mtk_hdmi_conf_mt8195 },
@@ -1515,7 +1508,6 @@ MODULE_DEVICE_TABLE(of, mtk_drm_hdmi_v2_of_ids);
 
 static struct platform_driver mtk_hdmi_v2_driver = {
 	.probe = mtk_hdmi_v2_probe,
-	.remove = mtk_hdmi_v2_remove,
 	.driver = {
 		.name = "mediatek-drm-hdmi-v2",
 		.of_match_table = mtk_drm_hdmi_v2_of_ids,
-- 
2.43.0


