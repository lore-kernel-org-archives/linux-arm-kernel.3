Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037A7C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 08:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aDtFutQMsGwXAc6r9HZYW6gZZa5JXHLbzHQIxh+3PxQ=; b=2SE5pUYxPE/3HubXAZ+/g2hUzS
	rzbDY9cJB4ny7CLhW/6baM4saBRA/9+2dsmamhMQhZkTHTWyhR5sGPRnKYs/ydKP3cMzikEvhhz3w
	A4s7Gmdv9e3ehNmKe0+7KAS7EfWR+r1Wh2JK0BHi+wTC6//TmTRdRMPicXBXsTmYYNnl2szc67Aey
	UWviaXc3DVxn3RW3OM/EGs7FQTLHeN7JpX3i1pEkSpMG81/j1bR9bDXK9dxmXG/HXCJjg4UKD2544
	uQZ92kHledAAb5EWtTcbu97sVmbD/TyUqG6Rw3Lit1OcrXYN6GlNaMtvVM0RORfKXPJoQ19RRy4Ci
	BhtSfrdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztdt-00000005Z1K-2TAU;
	Wed, 02 Apr 2025 08:40:13 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tztaQ-00000005YFA-2zQ8;
	Wed, 02 Apr 2025 08:36:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743582996;
	bh=YZUtbjwKJlLT4AAX1HhNOnQe3l9uM8E/KDQX5DNBPxA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jJtvjzkePrE3epTcErtzsKwNRoKXKPqi0GzubbneLO0lXD+G0T0zrYumHCzrbvSp2
	 4dijltftRVe8YVvbuJhPqedyAR2PQAiJZ5WnFvRXAsrNP31wzotEJ8F3Z66TYHXpoZ
	 mHMJGpHOU9ilJO1dSTktrelmfojd2TUJL0yFsUSaoFzUas5+ilZvXhZD5H8zN/EkWs
	 IlziPlUAYAYBKFIvwASwNdOBRLVfU8PKqW5OPxYEosRJ8HfSeFpRVpfnzJukA20z8I
	 vytk3+H7Hj2ifGDeE1pSBw02qBRrG+1SW2+cfzIG2DU6uTUxmQSV9lkGhqk0+ckKjL
	 eIljs44uywTWw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 762B317E0B0B;
	Wed,  2 Apr 2025 10:36:35 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: chunkuang.hu@kernel.org
Cc: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	nancy.lin@mediatek.com,
	ck.hu@mediatek.com,
	djkurtz@chromium.org,
	littlecvr@chromium.org,
	bibby.hsieh@mediatek.com,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	wenst@chromium.org,
	kernel@collabora.com
Subject: [PATCH v1 1/5] drm/mediatek: mtk_drm_drv: Fix kobject put for mtk_mutex device ptr
Date: Wed,  2 Apr 2025 10:36:24 +0200
Message-ID: <20250402083628.20111-2-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
References: <20250402083628.20111-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_013638_894875_69FDF5CF 
X-CRM114-Status: GOOD (  16.08  )
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

This driver is taking a kobject for mtk_mutex only once per mmsys
device for each drm-mediatek driver instance, differently from the
behavior with other components, but it is decrementing the kobj's
refcount in a loop and once per mmsys: this is not right and will
result in a refcount_t underflow warning when mediatek-drm returns
multiple probe deferrals in one boot (or when manually bound and
unbound).

Besides that, the refcount for mutex_dev was not decremented for
error cases in mtk_drm_bind(), causing another refcount_t warning
but this time for overflow, when the failure happens not during
driver bind but during component bind.

In order to fix one of the reasons why this is happening, remove
the put_device(xx->mutex_dev) loop from the mtk_drm_kms_init()'s
put_mutex_dev label (and drop the label) and add a single call to
correctly free the single incremented refcount of mutex_dev to
the mtk_drm_unbind() function to fix the refcount_t underflow.

Moreover, add the same call to the error cases in mtk_drm_bind()
to fix the refcount_t overflow.

Fixes: 1ef7ed48356c ("drm/mediatek: Modify mediatek-drm for mt8195 multi mmsys support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/gpu/drm/mediatek/mtk_drm_drv.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index e09578756de0..a8fbccb50c74 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -464,7 +464,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 
 	ret = drmm_mode_config_init(drm);
 	if (ret)
-		goto put_mutex_dev;
+		return ret;
 
 	drm->mode_config.min_width = 64;
 	drm->mode_config.min_height = 64;
@@ -483,7 +483,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		drm->dev_private = private->all_drm_private[i];
 		ret = component_bind_all(private->all_drm_private[i]->dev, drm);
 		if (ret)
-			goto put_mutex_dev;
+			return ret;
 	}
 
 	/*
@@ -576,9 +576,6 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 err_component_unbind:
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		component_unbind_all(private->all_drm_private[i]->dev, drm);
-put_mutex_dev:
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		put_device(private->all_drm_private[i]->mutex_dev);
 
 	return ret;
 }
@@ -649,8 +646,10 @@ static int mtk_drm_bind(struct device *dev)
 		return 0;
 
 	drm = drm_dev_alloc(&mtk_drm_driver, dev);
-	if (IS_ERR(drm))
-		return PTR_ERR(drm);
+	if (IS_ERR(drm)) {
+		ret = PTR_ERR(drm);
+		goto err_put_dev;
+	}
 
 	private->drm_master = true;
 	drm->dev_private = private;
@@ -676,6 +675,8 @@ static int mtk_drm_bind(struct device *dev)
 	drm_dev_put(drm);
 	for (i = 0; i < private->data->mmsys_dev_num; i++)
 		private->all_drm_private[i]->drm = NULL;
+err_put_dev:
+	put_device(private->mutex_dev);
 	return ret;
 }
 
@@ -688,6 +689,8 @@ static void mtk_drm_unbind(struct device *dev)
 		drm_dev_unregister(private->drm);
 		mtk_drm_kms_deinit(private->drm);
 		drm_dev_put(private->drm);
+
+		put_device(private->mutex_dev);
 	}
 	private->mtk_drm_bound = false;
 	private->drm_master = false;
-- 
2.48.1


