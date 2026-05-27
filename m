Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26B59CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 19:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VEXrEgQOj4YY+Lnsrc4y61tSJT6X+D5o07tAaEt61D0=; b=aehaLKnnWaFgjiUZlPE5vFUplw
	lotUWxkis7afNXEoWcLhJ5s+nPDLhXGx8uQY6rAbAzHrVScjlab0oCbUkokLvvNhuEtu0jIQQn/g1
	DV81TpmAzNTQHzBJZo9NgmCVvu5TsuvOhwIWQRD00XKGP4T38zndLYC4Dhgm8K/oK+Q6nltpEZCNu
	23ShrsVK9H2EPJE4XNEKAF4PpvxMUic4/1glG3rYuVqCbbUz4XmyGjsoD0I+EfTxXsfKEyo6XshTl
	hc+zHTlbBCspmPg9XFdvgVdlU74m7e1yDAzRs4Q6bRu29AQyQIYm2i53Xf4UlQuzkRia2WxPfOOxA
	yiewoNGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKC6-00000004g5d-3WU2;
	Wed, 27 May 2026 19:45:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSKC5-00000004g5X-3Q6w
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 19:45:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EAF1B6057B;
	Wed, 27 May 2026 19:45:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2CF1F000E9;
	Wed, 27 May 2026 19:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779911131;
	bh=VEXrEgQOj4YY+Lnsrc4y61tSJT6X+D5o07tAaEt61D0=;
	h=From:To:Cc:Subject:Date;
	b=b8IFwv5Ai+txihlJgwlqu12gYLmg8TX0mxUE4T4ysYKm8Tllc5zV3o2ICG/JFkm9P
	 QY25aqK9ciSVxn0PIppWVm48fTGiaN6eAyQDRc1gJ45xYjkDj5COiQajUe1Ugpayu+
	 K3zpCJB8x07rSiFTGsK7Mm+rig6r1gytivolAM5sRPCYPRCaZU6FIQ5XAhhPGmgxbZ
	 XozANXFe3lwlEPxUdOTnFE23En8vgt+OMBMmkcDoL2OeTcDlR/LuSIF7l759GurykQ
	 lGqU9Qut4WegZz8tw9e7pLUsOxWxDb9XEqfumeIx+m0JFZA7s7r90oG0Yi2nUV9fC+
	 yATW1OTVm3Fiw==
From: Arnd Bergmann <arnd@kernel.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/exynos: fix size_t format string
Date: Wed, 27 May 2026 21:45:07 +0200
Message-Id: <20260527194525.45762-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Arnd Bergmann <arnd@arndb.de>

The exynos_gem->base.size argument is a size_t rather than an
unsigned long, so adapt the printk() format string accordingly:

In file included from drivers/gpu/drm/exynos/exynos_drm_gem.c:16:
drivers/gpu/drm/exynos/exynos_drm_gem.c: In function 'exynos_drm_alloc_buf':
drivers/gpu/drm/exynos/exynos_drm_gem.c:69:49: error: format '%lx' expects argument of type 'long unsigned int', but argument 6 has type 'size_t' {aka 'unsigned int'} [-Werror=format=]
   69 |         DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
      |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   70 |                         (unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
      |                                                              ~~~~~~~~~~~~~~~~~~~~~
      |                                                                              |
      |                                                                              size_t {aka unsigned int}

The dma_addr in the same line is already printed using a cast
to unsigned long, so change that similarly to use the correct
%pad format.

Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 297a93b087cd..8e357f2beb9e 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 	if (kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
-	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 	return 0;
 }
 
@@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 		return;
 	}
 
-	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
+	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%pad), size(0x%zx)\n",
+			  &exynos_gem->dma_addr, exynos_gem->base.size);
 
 	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
-- 
2.39.5


