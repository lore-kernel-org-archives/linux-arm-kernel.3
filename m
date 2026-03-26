Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C06106F315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Tnye1hFVkDQbpAqnmBxIM5Wp/Kh6grPEcXAIeFfMKE=; b=wcQ5SJ2kXfKaZKuQ8v5Xdb+iT0
	AsaH6YIdp4qsAF/AIfxFzf1krzrU+8NzQlgoyqeb2MEJl1/ZGkRDLVbumsURmXCJVeXQvvPs1N+De
	7f5g8FmVTrDrmIniei2TOE6246+7j+doQWKskyWMdgN0PWe+n/bqlMkvMAhZow4t5snQ2yga8+vpx
	HbNl+auZPD2uIKyf/gDZJnafI7ULXk22hzezEIfWBvVbcV37I6I6TxTScaqGsKs78ytjOiu03BlGz
	2XWp7plBdWSh7xliZ7El9uCcSC/EvAkV+HeT5D7XhZtTF9FLM5QB1QFVGDcnk1Ljxs2lYxiF71t3v
	c6+xUVGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFR-00000005AeU-43ga;
	Thu, 26 Mar 2026 09:43:29 +0000
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hFO-00000005Act-38Or
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 09:43:28 +0000
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-c6dd5b01e14so343422a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 02:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774518206; x=1775123006; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7Tnye1hFVkDQbpAqnmBxIM5Wp/Kh6grPEcXAIeFfMKE=;
        b=XqOQSlpHmf7H682xPiv5vg6vGQGn2YkrAwxlm9NNh+x2Yan4Lh1CTkGOow+Ur3t2Z/
         2tFoJFzcRwWntFRyUL+q3Q/FS0RHVk9KlZwMIt7Po47IGPerFIB+eHXCq11lH3TbC1fL
         tJbXWVmBGYXr0XM/ylFYdufMyZAinfBiaaTIA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774518206; x=1775123006;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7Tnye1hFVkDQbpAqnmBxIM5Wp/Kh6grPEcXAIeFfMKE=;
        b=EpN8/gxDahUyMhYU7Bbnl/EYg9h4+RUCiAusDJ9LrkvvChOiE9YbrfXVC15Av0GJDS
         T/uJianrrmBTUoRmEHYOxDoPK5rIjl73KBdHSJ7JFw9O5kwd9AGj4I7Eds9p3QwUo8Tz
         h1EUqusYOn5ZMJD6csHOmC4hTaxqBWP8RpY7QcSsTnDGC1+3cJ/p3m/udQG2DhI2R5/F
         zEQCDlHREb6ixPIp6Ljpo9U0xm2e3d59X5vwZy3wZtPKZLFTxGW7A0MjJQNFQPk141sk
         3Z7Uyo254xJNoD7lJKuDuYhMoLmNhTyRJ9O7pPokaRLAyO/WVJWq4F+MOD1Aszo1tRM3
         Uecw==
X-Forwarded-Encrypted: i=1; AJvYcCV9uvvQwb8T0BVR1xsrKNxMR3TtL+aqAq+TCwoM9y/KHIjD7Wyg5J9eeF9K2Wj2paBb3dFjpBa5WgQ7f6jcxgdi@lists.infradead.org
X-Gm-Message-State: AOJu0YwpBo7W7KIzkfOR6GdDrNcmO3chymHw6LXX9ejqNeHqA4F4ZeuW
	zEcXlu0s+/eAw+RYevPoO/0FzIgVJ8qT2ZIaUW9ZFGr0rROqwTob26bwLYv82HHzZg==
X-Gm-Gg: ATEYQzyNJeHK4DZZWswrFhu0czdIZoSWyHN95tS9YK6PZqKbFVNz59qZsAmCPKTyhvU
	k7mkjy1nWoSEj9d3wI0V9zKmqY8+GLucrOHadz55UDuVwssbczVIFtXqbmto4/teKF9EMU2Of4J
	NZPH7ljHZp6bH3Z3s5NYEi3atF+5NHKPuHIJkymbEaH5Jt2TURs3ien7sm5w11++5sFecnbK18/
	Oh5WwqO29ecvFCNpUqSg+CBYUv3QdUNXmmhM5kpLYY+RBPpfQjcpFXMPGlSr1bVHQnkbkNrTZEX
	uEJfAtrJDi0c73TbXxB6y5GcEMbWV7AY7gA5PT41JMC2SbsSL6SK57vKQQWdTkHlsrIR7xcpGGI
	LJyLGYLen3p9zb8ZwIYoMAQH/oCZtZUvF1aHHJUtb+F9yUzYn4dzK2XSf7QkW2l7to1rfsveoml
	37rWl3EyvHrhmKS07nJ+jQPOD9wORUNtbeX6Gd5Qrz4bBxP8t3wveIHZ3rFoLJD7tUZuiyMHchZ
	QpCRUhrNeBI2b/TADA=
X-Received: by 2002:a05:6a20:7f99:b0:39c:39de:3cd2 with SMTP id adf61e73a8af0-39c4ab9159fmr7150534637.22.1774518205761;
        Thu, 26 Mar 2026 02:43:25 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c76737f28fasm1673312a12.7.2026.03.26.02.43.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 02:43:25 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/4] drm/exynos: Drop exynos_drm_gem.size field
Date: Thu, 26 Mar 2026 17:43:05 +0800
Message-ID: <20260326094308.1161335-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326094308.1161335-1-wenst@chromium.org>
References: <20260326094308.1161335-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_024326_814120_1133BF51 
X-CRM114-Status: GOOD (  19.49  )
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

A size field is already included in the base GEM object, and is
initialized through drm_gem_object_init() with the same value.

Drop the field in the subclass to save some space. More changes to
make exynos_drm_gem a subclass of drm_gem_dma_object will follow.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fb.c  |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_g2d.c |  2 +-
 drivers/gpu/drm/exynos/exynos_drm_gem.c | 17 ++++++++---------
 drivers/gpu/drm/exynos/exynos_drm_gem.h |  3 ---
 drivers/gpu/drm/exynos/exynos_drm_ipp.c |  2 +-
 5 files changed, 11 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/exynos/exynos_drm_fb.c b/drivers/gpu/drm/exynos/exynos_drm_fb.c
index ab0e0c74ec47..125b87adfdc4 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_fb.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fb.c
@@ -119,7 +119,7 @@ exynos_user_fb_create(struct drm_device *dev, struct drm_file *file_priv,
 			goto err;
 		}
 
-		if (size > exynos_gem[i]->size) {
+		if (size > exynos_gem[i]->base.size) {
 			i++;
 			ret = -EINVAL;
 			goto err;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_g2d.c b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
index 85a3a247dfca..e92a4d872c41 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_g2d.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_g2d.c
@@ -720,7 +720,7 @@ static int g2d_map_cmdlist_gem(struct g2d_data *g2d,
 			}
 
 			if (!g2d_check_buf_desc_is_valid(g2d, buf_desc,
-							 reg_type, exynos_gem->size)) {
+							 reg_type, exynos_gem->base.size)) {
 				exynos_drm_gem_put(exynos_gem);
 				ret = -EFAULT;
 				goto err;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
index 9ec76163609f..d9d42809a1a9 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
@@ -55,7 +55,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 		attr |= DMA_ATTR_NO_KERNEL_MAPPING;
 
 	exynos_gem->dma_attrs = attr;
-	exynos_gem->cookie = dma_alloc_attrs(drm_dev_dma_dev(dev), exynos_gem->size,
+	exynos_gem->cookie = dma_alloc_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size,
 					     &exynos_gem->dma_addr, GFP_KERNEL,
 					     exynos_gem->dma_attrs);
 	if (!exynos_gem->cookie) {
@@ -67,7 +67,7 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
 		exynos_gem->kvaddr = exynos_gem->cookie;
 
 	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
+			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
 	return 0;
 }
 
@@ -81,9 +81,9 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
 	}
 
 	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
-			(unsigned long)exynos_gem->dma_addr, exynos_gem->size);
+			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
 
-	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->size, exynos_gem->cookie,
+	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
 			(dma_addr_t)exynos_gem->dma_addr,
 			exynos_gem->dma_attrs);
 }
@@ -162,7 +162,6 @@ static struct exynos_drm_gem *exynos_drm_gem_init(struct drm_device *dev,
 	if (!exynos_gem)
 		return ERR_PTR(-ENOMEM);
 
-	exynos_gem->size = size;
 	obj = &exynos_gem->base;
 
 	obj->funcs = &exynos_drm_gem_object_funcs;
@@ -287,11 +286,11 @@ static int exynos_drm_gem_mmap_buffer(struct exynos_drm_gem *exynos_gem,
 	vm_size = vma->vm_end - vma->vm_start;
 
 	/* check if user-requested size is valid. */
-	if (vm_size > exynos_gem->size)
+	if (vm_size > exynos_gem->base.size)
 		return -EINVAL;
 
 	ret = dma_mmap_attrs(drm_dev_dma_dev(drm_dev), vma, exynos_gem->cookie,
-			     exynos_gem->dma_addr, exynos_gem->size,
+			     exynos_gem->dma_addr, exynos_gem->base.size,
 			     exynos_gem->dma_attrs);
 	if (ret < 0) {
 		DRM_ERROR("failed to mmap.\n");
@@ -317,7 +316,7 @@ int exynos_drm_gem_get_ioctl(struct drm_device *dev, void *data,
 	exynos_gem = to_exynos_gem(obj);
 
 	args->flags = exynos_gem->flags;
-	args->size = exynos_gem->size;
+	args->size = obj->size;
 
 	drm_gem_object_put(obj);
 
@@ -411,7 +410,7 @@ struct sg_table *exynos_drm_gem_prime_get_sg_table(struct drm_gem_object *obj)
 		return ERR_PTR(-ENOMEM);
 
 	ret = dma_get_sgtable_attrs(drm_dev_dma_dev(drm_dev), sgt, exynos_gem->cookie,
-				    exynos_gem->dma_addr, exynos_gem->size,
+				    exynos_gem->dma_addr, obj->size,
 				    exynos_gem->dma_attrs);
 	if (ret) {
 		DRM_ERROR("failed to get sgtable, %d\n", ret);
diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.h b/drivers/gpu/drm/exynos/exynos_drm_gem.h
index b6785f1136ab..3ff9fa9955ea 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_gem.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_gem.h
@@ -22,8 +22,6 @@
  *	- a new handle to this gem object would be created
  *	by drm_gem_handle_create().
  * @flags: indicate memory type to allocated buffer and cache attruibute.
- * @size: size requested from user, in bytes and this size is aligned
- *	in page unit.
  * @cookie: cookie returned by dma_alloc_attrs
  * @kvaddr: kernel virtual address to allocated memory region (for fbdev)
  * @dma_addr: bus address(accessed by dma) to allocated memory region.
@@ -38,7 +36,6 @@
 struct exynos_drm_gem {
 	struct drm_gem_object	base;
 	unsigned int		flags;
-	unsigned long		size;
 	void			*cookie;
 	void			*kvaddr;
 	dma_addr_t		dma_addr;
diff --git a/drivers/gpu/drm/exynos/exynos_drm_ipp.c b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
index ee3d61345a66..43bc4f63bb84 100644
--- a/drivers/gpu/drm/exynos/exynos_drm_ipp.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_ipp.c
@@ -364,7 +364,7 @@ static int exynos_drm_ipp_task_setup_buffer(struct exynos_drm_ipp_buffer *buf,
 		}
 		buf->exynos_gem[i] = gem;
 
-		if (size + buf->buf.offset[i] > buf->exynos_gem[i]->size) {
+		if (size + buf->buf.offset[i] > buf->exynos_gem[i]->base.size) {
 			i++;
 			ret = -EINVAL;
 			goto gem_free;
-- 
2.53.0.1018.g2bb0e51243-goog


