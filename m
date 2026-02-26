Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3571DFCE07F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 13:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONIwadZ2qG7PajkmyRgzJ0uShP4MWT4rY4qY3wiwxqI=; b=VS4FYa93iIOMnh1w5uNwPwUkbq
	V9xaBxWCSkWNRvLad0/hsi8YcVwxkJ5pJ49+oL5la4lG07xhrGlyKvKrqXCy12qNJfNMuitXWLGwM
	AdgBx9XgbGuFksIVq9LVVcLErxf3VTR6/Lzj/W2Y16sZFCnbNTmmQRShPvUJVoYY2k5fxi341ttS+
	fsRqZx2xoxUa9yg+bwn94syYIlumD++wAiTcXZ4E/SYPq7o8tvXh0jEK01Vztc1ZzOOsZw7vuhSpf
	h/hc1Q+maX95aRPiJFCgrQrWrLjcSAl6Yr2WnRVSxP01gnF+iIB2DNIOuVY64Yr/JDPEQr5ZOMRKt
	jWAmY1yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbcA-00000006EvE-2Cbh;
	Thu, 26 Feb 2026 13:41:14 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvbby-00000006El5-2ReR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 13:41:04 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 32821201553;
	Thu, 26 Feb 2026 14:40:59 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 101AA201509;
	Thu, 26 Feb 2026 14:40:59 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 56D7A2035B;
	Thu, 26 Feb 2026 14:40:57 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Thu, 26 Feb 2026 15:40:40 +0200
Subject: [PATCH 1/9] drm/gem-dma: Add flag for bidirectional mapping of
 non-coherent GEM DMA buffers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-neutron-v1-1-46eccb3bb50a@nxp.com>
References: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
In-Reply-To: <20260226-neutron-v1-0-46eccb3bb50a@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772113256; l=2892;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=t5jOCwYs4a0qJx+g0j9jr/ql5g59uodTYfBmURX7TLI=;
 b=FuK2EVogBLiKqAWSpQj/VvRmlxkqGBRQdPtOI6DDSNPrrj8FO4pZ0CErQ51iQLLpeRvWIydJH
 0NCLiSNBTUhBnS9S4+7LuX+o93vLCiofdPsrriBRdgeEv0BJykkTJWe
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_054102_917887_DA32D809 
X-CRM114-Status: GOOD (  12.96  )
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

Introduce a flag that allows a user to request non-coherent buffers
allocated via the GEM DMA helper for bidirectional use.

Keep current behaviour (DMA_TO_DEVICE mapping) as default, with no change
required for existing GEM DMA users.

While it hasn't been the case until now, some devices like NXP's Neutron
Neural Processing Unit (NPU) require contiguous, non-coherent DMA buffers
they can both read from and write to. Unlike traditional DRM devices,
Neutron uses the same DMA buffer both for reading model data and for
writing inference output.

Neutron's usage scenario is a good match for the GEM DMA helpers, except
for the fact that current implementation only considers the DMA_TO_DEVICE
direction.

Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 6 ++++--
 include/drm/drm_gem_dma_helper.h     | 3 +++
 2 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index ecb9746f4da8..dbf5ad4426d3 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -148,7 +148,8 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	if (dma_obj->map_noncoherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm->dev, size,
 						       &dma_obj->dma_addr,
-						       DMA_TO_DEVICE,
+						       dma_obj->map_bidirectional ?
+						       DMA_BIDIRECTIONAL : DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
 		dma_obj->vaddr = dma_alloc_wc(drm->dev, size,
@@ -238,7 +239,8 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 		if (dma_obj->map_noncoherent)
 			dma_free_noncoherent(gem_obj->dev->dev, dma_obj->base.size,
 					     dma_obj->vaddr, dma_obj->dma_addr,
-					     DMA_TO_DEVICE);
+					     dma_obj->map_bidirectional ?
+					     DMA_BIDIRECTIONAL : DMA_TO_DEVICE);
 		else
 			dma_free_wc(gem_obj->dev->dev, dma_obj->base.size,
 				    dma_obj->vaddr, dma_obj->dma_addr);
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..e0022f2fdfef 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -17,6 +17,8 @@ struct drm_mode_create_dumb;
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
  * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
+ * @map_bidirectional: valid only if map_noncoherent flag is set. If true, allow
+ *                     bidirectional use of the non-coherent memory buffer
  */
 struct drm_gem_dma_object {
 	struct drm_gem_object base;
@@ -27,6 +29,7 @@ struct drm_gem_dma_object {
 	void *vaddr;
 
 	bool map_noncoherent;
+	bool map_bidirectional;
 };
 
 #define to_drm_gem_dma_obj(gem_obj) \

-- 
2.34.1


