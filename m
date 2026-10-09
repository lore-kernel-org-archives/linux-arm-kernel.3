Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98716CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 00:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kIz/qZTA1DVdo8Wv1KvtH0Jov9NyNDxXYjGr4vU3wa4=; b=RQjRFuipRwH5Q33dSpLF+e5BnQ
	vQ/HKD/atRvCo6KY/MhjxV8R+wTkjrTc3rc8W/+kpgLDzSwjVRx9kICY1dAWKPwLyRzzand2J2TXt
	4OJXg5mDYy0jF3952plgX/UlF2FfBNJCvSz3IbowwJP8CZaLL+IAiR63s5aQEU1Z9+pXfU7lhtu39
	ofdgS+zFo1YLnly3CjMO9UaWkTGtDFmfOvmVBaQFURmIvndGfOFziRlDe41RaNO8XRXuiS9NsINl4
	7nx26pKSFYU0Yo7gxL7IboX6aLPsdzy+PJ92Eu1zrG0+33e9zdsXqn3SrsqOKZqn8T2mwK4+MvYDH
	kQYOchvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyMh-00000005BiM-2wR9;
	Fri, 09 Oct 2026 00:21:35 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEyMf-00000005BfD-0zaK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 00:21:34 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-4a161d9b8c7so26269425e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 17:21:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791505291; x=1792110091; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIz/qZTA1DVdo8Wv1KvtH0Jov9NyNDxXYjGr4vU3wa4=;
        b=q6BT2J58oPuTWevnzfBWoXJm0pcWn94PwTgW7Vx5MQcE5O38vxYuvnVguSK4KYWzAu
         z3iHuTQssAqtf/IZiqdKVu+NXc+IE4QFUV+vmOGdHUeFQFBJxzZHeTNvDm9TqjuNvKZx
         DDPZUUdGynWFLJ2kvGAnEArUG/09UUgWuig/mIX9jrhF5L7xv6h0MhAboQorILACX2XB
         jmZCC84FWUJIR8Fx28ae/MBFpHBQiDYX4uK/dEgxL2y1mZwO5ktvsJoh1KA8r8vbgJ9t
         w/MncISRuGWmNnN5uLv6mpdGeUr9Bwnl5xPZkbsaFirCDjNM58Nm8AfmP5QfWOUGheX9
         bdIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791505291; x=1792110091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIz/qZTA1DVdo8Wv1KvtH0Jov9NyNDxXYjGr4vU3wa4=;
        b=tZdx73aYYzVHSpQXIHofbbRmqEJoUas4T68mGR39Ak/fxbZKMLLWDSZkin32GKmHAx
         G5S9QuStJ7ih3Dom4i/GzIv4mvvn03m30A3mF3DxFPNLzsZZD2rE3L+15ATXc9hiigqM
         CCAjZAbTAbeVhnILRkpKD4Yz5e1iGVTAErRCsqIE6QcZ+Xs+YZsLaSMpYG3HkBZXyH1V
         cem6F2h6MLGPse61dod9tA//z9MtVQ5vmKRTgdmkhkuR4qYKOEmtfJkw7wOkkcODiHba
         TuZIKe5hGZlILznfg1wNwNnvCJFXj8Pu/VRGL1ZNJ/ngt+tl/cwomZT1XatWX1z0eylA
         0GpQ==
X-Forwarded-Encrypted: i=1; AKwUvBzwBaaV7ePloCrdDK9CoOTegxRCiXpd10RPcYvCoGqEh+g4j77Nxt6fNHQf71F3F9xjWmoSadcKE4S1V4hvRsDJ@lists.infradead.org
X-Gm-Message-State: AFuF++mTUv46s1wIluMGeM8a4J85n7IP5S8JrTpO6U9lZLyX3pyQQS54
	E85ymDdGkvipHguzkIOtp7MyUAECuQXs1D4BViR0ckWY2c/qhMdmlEEx
X-Gm-Gg: AYBFou0DtT1QMQxei6WibxP2zyY/Uu9weH+ppVKhs+tA5DKaXtwU8CnVlKoSxYATRU5
	hNT2TdqBPukGIfJJFHViByevBxpT8BLTQLMubiqa59LaWd1kRkHd7ieC+7sHfIe58GIDUbZKTC+
	XeN52KFnygGe70+zYKLDS7HVkb5SxvX//Cve2Tf9YhFUqo/9ibY6yRXbeb0z8dYVoeLtouViOSR
	Z8SkfaATMgtRKMdwKENSDNOgTXJ0vR2Gma1cE3HY9SlcFLLAwy7sjHTDeHbr07C1n9c9mtVBZ+I
	yZD34uIeKeT2mhJzE3NCF7DZL6Mv6O9BGN1s+FheT2qej4VIP+UqEKKyQSfErwIojywny6SOw5u
	lnRKvO9QMUGOBmPtjNDVbeOs33Ut8EQDqHDU2nUL7qDYHLMk9b/50sJ5TinGiQvtVwly8Dv0Gpm
	ZQQ55PnWXsOzzI1auN/6oPGYePhMP4xo+AR4oAoIijufKjzJ2dNR0Yn7mCIB5dYwHnAg52v4zX/
	lurmSKmIvzkd+SNQT0vqXotTPCF6XyJ36zymQ3c8tSWFy01mADdNNo3DPN3jMVMlMF+0GxdnIRA
	/aaNpvNPL8YxUdYuQQBrtQM+Kz4SkXhZxiKAMDL9FWGgxRT66c29etBRSXRL1uF1HWKpwC7n4tD
	Onw9D43c=
X-Received: by 2002:a05:600c:6990:b0:4a0:1ea1:477a with SMTP id 5b1f17b1804b1-4a18e4d8bbamr2152055e9.27.1791505291199;
        Thu, 08 Oct 2026 17:21:31 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad61-5a01-743c-891f-b33c-cae7.310.pool.telefonica.de. [2a02:3100:ad61:5a01:743c:891f:b33c:cae7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e4987casm3364605e9.1.2026.10.08.17.21.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 08 Oct 2026 17:21:30 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: iommu@lists.linux.dev,
	dri-devel@lists.freedesktop.org
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andyshrk@163.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Rob Clark <robin.clark@oss.qualcomm.com>,
	Jason Gunthorpe <jgg@nvidia.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Jianfeng Liu <liujianfeng1994@gmail.com>,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 2/2] drm/rockchip: Map imported buffers from DMA addresses
Date: Fri,  9 Oct 2026 02:21:14 +0200
Message-Id: <20261009002114.67851-3-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261009002114.67851-1-kmehltretter@gmail.com>
References: <20261009002114.67851-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_172133_310913_24EC24FE 
X-CRM114-Status: GOOD (  15.29  )
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

rockchip_gem_prime_import_sg_table() uses iommu_map_sgtable(), which reads
CPU-side pages and lengths. DMABUF_DEBUG clears these fields, causing
the RK3588 import failures reported by Diederik de Haas.

The attachment's DMA addresses belong to the VOP's default domain,
while scanout uses a separate DRM domain. Use iommu_map_sgtable_dma()
to copy the live mapping into that domain.

Keep native allocations unchanged. Unsupported imports still use the
old page-based path and remain unfixed under strict DMABUF_DEBUG.
This RFC retains reverse translation rather than sharing the DMA domain.

Reported-by: Diederik de Haas <diederik@cknow-tech.com>
Link: https://lore.kernel.org/r/DLR74W1U9YPC.375IK0HOYHDIG@cknow-tech.com/
Link: https://lore.kernel.org/r/DLYLA3WQNN3X.3FB9MO8ZWBQ5@cknow-tech.com/
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_gem.c | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
index 9a1dc9f12072..501c94cb921a 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_gem.c
@@ -20,7 +20,8 @@
 #include "rockchip_drm_drv.h"
 #include "rockchip_drm_gem.h"
 
-static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
+static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj,
+				  struct device *dma_dev)
 {
 	struct drm_device *drm = rk_obj->base.dev;
 	struct rockchip_drm_private *private = drm->dev_private;
@@ -40,8 +41,16 @@ static int rockchip_gem_iommu_map(struct rockchip_gem_object *rk_obj)
 
 	rk_obj->dma_addr = rk_obj->mm.start;
 
-	ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr, rk_obj->sgt,
-				prot);
+	if (dma_dev) {
+		ret = iommu_map_sgtable_dma(private->domain, rk_obj->dma_addr,
+					    dma_dev, rk_obj->sgt, prot);
+		if (ret == -EOPNOTSUPP)
+			ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr,
+						rk_obj->sgt, prot);
+	} else {
+		ret = iommu_map_sgtable(private->domain, rk_obj->dma_addr,
+					rk_obj->sgt, prot);
+	}
 	if (ret < (ssize_t)rk_obj->base.size) {
 		DRM_ERROR("failed to map buffer: size=%zd request_size=%zd\n",
 			  ret, rk_obj->base.size);
@@ -131,7 +140,7 @@ static int rockchip_gem_alloc_iommu(struct rockchip_gem_object *rk_obj,
 	if (ret < 0)
 		return ret;
 
-	ret = rockchip_gem_iommu_map(rk_obj);
+	ret = rockchip_gem_iommu_map(rk_obj, NULL);
 	if (ret < 0)
 		goto err_free;
 
@@ -457,7 +466,7 @@ rockchip_gem_iommu_map_sg(struct drm_device *drm,
 			  struct rockchip_gem_object *rk_obj)
 {
 	rk_obj->sgt = sg;
-	return rockchip_gem_iommu_map(rk_obj);
+	return rockchip_gem_iommu_map(rk_obj, attach->dev);
 }
 
 static int
-- 
2.53.0


