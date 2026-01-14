Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94391D31A2F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 09:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=; b=UJDDVjjv/0NEWyM5sofw/lGzmR
	6A1uFQ9ydZ+qEu2NKllapdkiBadbsXzKxUkCqOPap0236+05VHZgg/34Tnf/qzKgiUABz1/qp+tls
	VAv/jOq6GOEBQif/MJiPT6ZZ6M+1j0Pguch220t3hC5NvjErHUpfjfPmWR+X3YrW1XbruQoGGQfI+
	/UWIOdbuk0z7uuMDOPQHuS77O9vzjQE2tEZOC5TLfgPUGc2FiIg8fY3hK1Z+yWlnAH2YeVp83OO67
	VURRd8cjucmu7ls5xTMcEhq8mznRpjWGPkKOOsUqdySEAgOl33PR9nZCydEqUrjaTbTaDBN/XQKYE
	hPiABzlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx5r-00000008Wm9-0jGv;
	Wed, 14 Jan 2026 09:23:11 +0000
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfx5m-00000008Wk6-3vGd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Jan 2026 09:23:09 +0000
Received: by mail-pf1-x442.google.com with SMTP id d2e1a72fcca58-81df6a302b1so4552954b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 14 Jan 2026 01:23:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1768382585; x=1768987385; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=;
        b=ZJqgw87H4zjxSm0J+E00nN96VbjOQv25hBZ7fpXJmLNMJzPl/b9/kMfj/qmnf2Ciuf
         RGiL+fs0KrerKsHwJm9jcSwONUXQa2jvjptEZTV5spe8YmynkK/4dVJI+8r/QR6l/o7g
         K19IUre3eVBPYCY28DDZ37TyV4I9a6heoUwBk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768382585; x=1768987385;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jBri2FSO9ova+6N8irDgqT8faDyY4fKEpF2RXzIi/cc=;
        b=h9MYQ6gFbjHQeUvklS2ffpAzLT/4J1xSOn7ZSv9bDM77IbJ4oA22mVcKRGRKWMCMGD
         zwEpjW6igApmfgfM6FF4pVr1fW1UFtlXkdy4pk3N2BMSjZhg07w1G2QCISvyMoj7pWSj
         J0Vlk4QTkgxCtjIQBA6ck77RqH5vsY9nbmH08OfUZ4AnBHAREgMTsDTFZ8219yPLk31o
         PcjEGAipjQfAuMbRXxSSJv0i3HKtHBG2xoLQEq5uxO6IePiUaGHYqgNQfTmCqJsqN7x/
         KCzgiBrpRqydHDqfKDi4psiHaFUFR9THpAqpNxWLXYK0dEMqiKNxL+GK+s5DqtjjKu/a
         yfCg==
X-Forwarded-Encrypted: i=1; AJvYcCVy57RqLaRUVg+lzYUp+bK2wADbuAKjqyDWS/+M3vuEueJj1zVc1uV4+8sUL/f7yYLPiSZf3j3nA/5EjC7HZRNE@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh+z8705TRKokTAsToJf3W/KhTfHgFro37GOoFovzgEj5ohaE0
	fkQWjOLmukOhlt+w7AHJMqpLqF0vwsWk8/FOTj+zkbZeSyyueNnBW1eWmFsHFfIu6w==
X-Gm-Gg: AY/fxX5f76DY9k5++GLfF3hZGirP9Fkdm1Pg1Kj+dsfWgB4oICAOQlg7koUD8I+6sYn
	QGf5SiQwe4qdwUKwRJIxWWvrzdHwGJqtXQh8Z4aaZi9lAPMvw8R6v8pHOWJg8Qvnfpvjr9nJ1kG
	0Kb8x3BoJOn7OXZdMgIonuWa+Gwb3aMdIRlaCp0O3NksBS3qOEyP26OCZ9U0SY9cA2/jhxxD0h7
	J4vleiVpC9N8PoEJXX8SdeCyBR6Zj6CIIZKU4qbnvemrQGviyPkm5XapEBegqw0yQ9wRf8YQ8wE
	+Ht75IzZNK57YNFMGJ3d+4wq8oS/zu/blUMdZG5nJ7SAgRTskMfD1Cwxgs+0JNXeSsqfoyywDI6
	KyfnItYsRLZOwPJwxNdtXrsCBu0BGthZx1JYGzQJEP8rWVwfVrAjXkSrt1k/smlLtTXPzxTHkdz
	7YCopl1l5GTbh6bFEubTPSjYA193WYUp7+cKJ+3rHv+2tqABy4v2IabC8WsnN5uzyyvT7p
X-Received: by 2002:a05:6a20:c525:b0:38d:e87c:48d5 with SMTP id adf61e73a8af0-38de88b96c6mr144807637.21.1768382585505;
        Wed, 14 Jan 2026 01:23:05 -0800 (PST)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:c346:2298:451a:a3f3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c4cc8d29516sm22099403a12.19.2026.01.14.01.23.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jan 2026 01:23:04 -0800 (PST)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] drm/mediatek: dpi: Find next bridge during probe
Date: Wed, 14 Jan 2026 17:22:42 +0800
Message-ID: <20260114092243.3914836-1-wenst@chromium.org>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_012308_491630_4E816222 
X-CRM114-Status: GOOD (  18.19  )
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

Trying to find the next bridge and deferring probe in the bridge attach
callback is much too late. At this point the driver has already finished
probing and is now running the component bind code path. What's even
worse is that in the specific case of the DSI host being the last
component to be added as part of the dsi_host_attach callback, the code
path that this is in:

 -> devm_drm_of_get_bridge()
    mtk_dpi_bridge_attach()
    drm_bridge_attach()
    mtk_dpi_bind()
    ...
    component_add()
    mtk_dsi_host_attach()
    anx7625_attach_dsi()
    anx7625_link_bridge() - done_probing callback for of_dp_aux_populate_bus()
    of_dp_aux_populate_bus()
    anx7625_i2c_probe()

_cannot_ return probe defer:

    anx7625 4-0058: [drm:anx7625_bridge_attach] drm attach
    mediatek-drm mediatek-drm.15.auto: bound 14014000.dsi (ops mtk_dsi_component_ops)
    mediatek-drm mediatek-drm.15.auto: error -EPROBE_DEFER: failed to attach bridge /soc/dpi@14015000 to encoder TMDS-37
    [drm:mtk_dsi_host_attach] *ERROR* failed to add dsi_host component: -517
    anx7625 4-0058: [drm:anx7625_link_bridge] *ERROR* fail to attach dsi to host.
    panel-simple-dp-aux aux-4-0058: DP AUX done_probing() can't defer
    panel-simple-dp-aux aux-4-0058: probe with driver panel-simple-dp-aux failed with error -22
    anx7625 4-0058: [drm:anx7625_i2c_probe] probe done

This results in the whole display driver failing to probe.

Perhaps this was an attempt to mirror the structure in the DSI driver;
but in the DSI driver the next bridge is retrieved in the DSI attach
callback, not the bridge attach callback.

Move the code finding the next bridge back to the probe function so that
deferred probing works correctly. Also rework the fallback to the old OF
graph endpoint numbering scheme so that deferred probing logs in both
cases.

This issue was found on an MT8183 Jacuzzi device with an extra patch
enabling the DPI-based external display pipeline. Also tested on an
MT8192 Hayato device with both DSI and DPI display pipelines enabled.

Fixes: 4c932840db1d ("drm/mediatek: Implement OF graphs support for display paths")
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/mediatek/mtk_dpi.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dpi.c b/drivers/gpu/drm/mediatek/mtk_dpi.c
index 61cab32e213a..53360b5d12ba 100644
--- a/drivers/gpu/drm/mediatek/mtk_dpi.c
+++ b/drivers/gpu/drm/mediatek/mtk_dpi.c
@@ -836,20 +836,6 @@ static int mtk_dpi_bridge_attach(struct drm_bridge *bridge,
 				 enum drm_bridge_attach_flags flags)
 {
 	struct mtk_dpi *dpi = bridge_to_dpi(bridge);
-	int ret;
-
-	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
-	if (IS_ERR(dpi->next_bridge)) {
-		ret = PTR_ERR(dpi->next_bridge);
-		if (ret == -EPROBE_DEFER)
-			return ret;
-
-		/* Old devicetree has only one endpoint */
-		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
-		if (IS_ERR(dpi->next_bridge))
-			return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
-					     "Failed to get bridge\n");
-	}
 
 	return drm_bridge_attach(encoder, dpi->next_bridge,
 				 &dpi->bridge, flags);
@@ -1319,6 +1305,15 @@ static int mtk_dpi_probe(struct platform_device *pdev)
 	if (dpi->irq < 0)
 		return dpi->irq;
 
+	dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 1, -1);
+	if (IS_ERR(dpi->next_bridge) && PTR_ERR(dpi->next_bridge) == -ENODEV) {
+		/* Old devicetree has only one endpoint */
+		dpi->next_bridge = devm_drm_of_get_bridge(dpi->dev, dpi->dev->of_node, 0, 0);
+	}
+	if (IS_ERR(dpi->next_bridge))
+		return dev_err_probe(dpi->dev, PTR_ERR(dpi->next_bridge),
+				     "Failed to get bridge\n");
+
 	platform_set_drvdata(pdev, dpi);
 
 	dpi->bridge.of_node = dev->of_node;
-- 
2.52.0.457.g6b5491de43-goog


