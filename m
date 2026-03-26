Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2DF5106F317
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 10:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i9KkAzXq0JR8TGkENovBJsntvxWB2injAP7fSinZoPY=; b=PJGFjhV3wZm9L/tXPLp0PHRMMd
	NKvVgaAtdyRuY+HzZCb0YuNbRmYqik1CzHw/XTqn6qETVPxL6GwWaz5B2Wfc1fK0EMq89LI9DW/lk
	3PTqOkD5si1WgIE5jbKkNltuRhgPZhJ/Tral39F1KcMLzTp9ZvLQKJSPVtxAfalZFmc2coos/IX42
	qnuV+oDmw06S+pIaNAFh/6eG8d1wsYzYmYPjkC7j1urUkAg6UaZW72ZP0InPRIuwLW3BAXsDKS0Az
	DVeO/YotQAkrUyOePdv424i+qUExAxkNDiGjd25frB63cMoHDeXU9bT2Q31NSdUzu7Xan9XqKDSpM
	3WMFZHkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYe-00000005Dp5-2vca;
	Thu, 26 Mar 2026 10:03:20 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5hYT-00000005Diz-0R33
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 10:03:18 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2b0afa0210bso4024485ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 26 Mar 2026 03:03:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1774519388; x=1775124188; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i9KkAzXq0JR8TGkENovBJsntvxWB2injAP7fSinZoPY=;
        b=n75H7YkIv/mxV0ExcqY5YQxun+pBBFpkophKNC4Js/is61ZA6ngFMmFc7BQOR3eoMW
         6fvZZbT63U5mnx3Lh4vcg+M1ZghfWLDKSCUDTrFjw4hlMktWsOSuA1Q2qKzLXShun9uc
         mxZD5syEY07+Mq9tAMbXbDSWubd+Z7A+nrI4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774519388; x=1775124188;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i9KkAzXq0JR8TGkENovBJsntvxWB2injAP7fSinZoPY=;
        b=GLOmWHYSVmfqDUVqRKJnQyerb+9K/93JEdf47KzGGMqeqfroQllt0HNcvrcyVw6Cs7
         AJGhQ4LNfvlC3QrDrM9SQKD+GiuhORCUOe9o5mzJK0pWfuw3QoVySdQC6eR3f3+3VxF+
         FCaRP+pJ5dezdCGGu07i7eWW7sEt6PcJiyEtu/mxmEv4bpSAFF89G/zJu7IlU+ekdBhi
         apoY1/z7rEQVLZgfO/Kn5jKSp/o1q5TzY53NBwk7/X6MqNbN4F3MGCTfQrY9IwgI+5jc
         sVjrF62V6KM56tcTtlohkFeH0ZZjCynmisAWOEdF1VC38isxSIbrbhLLltXHxZdOuIKF
         RrYA==
X-Forwarded-Encrypted: i=1; AJvYcCVqzDzE8jWng2LxYWYHc0oJ9yzaVdjFtsqeQeiXNIWYfVNM762H/TWQivqwaNbpW1g+UZxzWYnIS6ycWLM0T7tn@lists.infradead.org
X-Gm-Message-State: AOJu0Yz0Q6LntqrP0jykgwPJygdHQkhWs5A4OCd5c3T34uBqb2s60MoS
	ASpPpRLwRShP3Ys/YNG8vzB5FuujHsDFyeI8Fagr+n+rTWDjcDHfpi9okNiv2DUTGA==
X-Gm-Gg: ATEYQzzn8i9yXdbDRhV5vjoFiNEz5r6/DNP3e23T0wT0j5/fiQBc9e4qJ+mZevbkA2T
	smebyuQW4nI6PItdEVx9qVgdP2UvIHf0tRQsIbuJxhelYP9RP09G1eaPqMt6e8webaFGTiEFL4z
	MPnrxhIbTGKNmpj/PfhW+WAZmN9mC9DOgpfr9tXyWL6M9ki4/KMpSeRmCxxDR31s7B3SEKi13Ua
	7OZG8cnHyu3K5qJUUzC+LSKAKakpJSKVGpHdVQbvPnpYcaNyt6k9vk7SHPDORC6T8VJ+bY0EykT
	Rk2IIU8sTnKMVoSOn/aiZMtTSVlpY93K/PNu1F072peWHGZ6YPa7NVeDU84ClMYtAFscvFRMDL1
	7dyyJPAt2dZCVe+QZaIp4u3FZl7+lyA7XTBobm1Txg1EAqhEH9Moiu2CauvH5oPNABCAbtINY8M
	XCm6aNNGe8kYOjlItrUAx68NGvRCzMzyAkOoF5FUZz4/R8bN6WowA1i/wsWmx5Lt8Vjy5zLXfVr
	Fu8ouEx
X-Received: by 2002:a17:902:cec1:b0:2b0:b290:f2f4 with SMTP id d9443c01a7336-2b0b2910099mr70615975ad.32.1774519387930;
        Thu, 26 Mar 2026 03:03:07 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3ed5:7e63:b37c:a7d7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b0bc7c2942sm23339435ad.36.2026.03.26.03.03.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Mar 2026 03:03:07 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v3 2/3] drm/gem-dma: Use the dma_*_attr API variant
Date: Thu, 26 Mar 2026 18:01:44 +0800
Message-ID: <20260326100248.1171828-3-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
In-Reply-To: <20260326100248.1171828-1-wenst@chromium.org>
References: <20260326100248.1171828-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_030312_740737_497E8909 
X-CRM114-Status: GOOD (  19.76  )
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

From: Rob Herring <robh@kernel.org>

In preparation to allow DRM DMA users to adjust the DMA_ATTR_* flags,
convert the DMA helper code to use the dma_*_attr APIs instead of the
dma_*_wc variants.

Only the DMA_ATTR_WRITE_COMBINE and DMA_ATTR_NO_WARN attributes are set
in this commit, so there's no functional change.

Update rcar_du_vsp_map_fb() to use dma_get_sgtable_attrs() instead of
dma_get_sgtable().

Also change the dma_free_wc() call in vc4_bo_purge() in the vc4 driver
to use dma_free_attrs() to match. vc4_bo is a sub-class of
drm_gem_dma_object.

Sub-classes of |struct drm_gem_dma_object| can also set additional
DMA_ATTR_* flags if they choose so. For example a sub-class could
set DMA_ATTR_FORCE_CONTIGUOUS in certain cases.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Rebase onto renamed DMA helpers]
[wenst@chromium.org: Make vc4_bo_purge() use matching dma_free_attrs()]
[wenst@chromium.org: Make rcar_du_vsp_map_fb() use dma_get_sgtable_attrs()]
[wenst@chromium.org: Expand commit message to mention that sub-classes
                     can set extra DMA_ATTR_* flags]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v2:
- rcar-du: Change dma_get_sgtable() to dma_get_sgtable_attrs()

Changes since v1:
- Rebased onto renamed DMA helpers
- Made vc4_bo_purge() use matching dma_free_attrs()
- Expanded commit message to mention that sub-classes can set extra
  DMA_ATTR_* flags
---
 drivers/gpu/drm/drm_gem_dma_helper.c          | 26 +++++++++++--------
 drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c |  5 ++--
 drivers/gpu/drm/vc4/vc4_bo.c                  |  2 +-
 include/drm/drm_gem_dma_helper.h              |  3 +++
 4 files changed, 22 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1c00a71ab3c9..9722c9fc86f3 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -108,6 +108,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 		goto error;
 	}
 
+	dma_obj->dma_attrs |= DMA_ATTR_NO_WARN | DMA_ATTR_WRITE_COMBINE;
 	return dma_obj;
 
 error:
@@ -152,9 +153,10 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
-					      &dma_obj->dma_addr,
-					      GFP_KERNEL | __GFP_NOWARN);
+		dma_obj->vaddr = dma_alloc_attrs(drm_dev_dma_dev(drm), size,
+						 &dma_obj->dma_addr,
+						 GFP_KERNEL | __GFP_NOWARN,
+						 dma_obj->dma_attrs);
 	}
 	if (!dma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
@@ -242,9 +244,9 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
-				    dma_obj->base.size, dma_obj->vaddr,
-				    dma_obj->dma_addr);
+			dma_free_attrs(drm_dev_dma_dev(gem_obj->dev),
+				       dma_obj->base.size, dma_obj->vaddr,
+				       dma_obj->dma_addr, dma_obj->dma_attrs);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -435,8 +437,9 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
-			      dma_obj->dma_addr, obj->size);
+	ret = dma_get_sgtable_attrs(drm_dev_dma_dev(obj->dev), sgt,
+				    dma_obj->vaddr, dma_obj->dma_addr,
+				    obj->size, dma_obj->dma_attrs);
 	if (ret < 0)
 		goto out;
 
@@ -546,9 +549,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
-				  dma_obj->vaddr, dma_obj->dma_addr,
-				  vma->vm_end - vma->vm_start);
+		ret = dma_mmap_attrs(drm_dev_dma_dev(dma_obj->base.dev), vma,
+				     dma_obj->vaddr, dma_obj->dma_addr,
+				     vma->vm_end - vma->vm_start,
+				     dma_obj->dma_attrs);
 	}
 	if (ret)
 		drm_gem_vm_close(vma);
diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
index 94c22d2db197..a4896096e3bc 100644
--- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
+++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
@@ -291,8 +291,9 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
 				dst = sg_next(dst);
 			}
 		} else {
-			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
-					      gem->dma_addr, gem->base.size);
+			ret = dma_get_sgtable_attrs(rcdu->dev, sgt, gem->vaddr,
+						    gem->dma_addr, gem->base.size
+						    gem->dma_attrs);
 			if (ret)
 				goto fail;
 		}
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index f45ba47b4ba8..981593739a0f 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -304,7 +304,7 @@ static void vc4_bo_purge(struct drm_gem_object *obj)
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
-	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr);
+	dma_free_attrs(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr, bo->base.dma_attrs);
 	bo->base.vaddr = NULL;
 	bo->madv = __VC4_MADV_PURGED;
 }
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..e815ff121e23 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -16,6 +16,8 @@ struct drm_mode_create_dumb;
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
+ * @dma_attrs: DMA attributes used when allocating backing memory.
+ *             Only applies to coherent memory.
  * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
  */
 struct drm_gem_dma_object {
@@ -25,6 +27,7 @@ struct drm_gem_dma_object {
 
 	/* For objects with DMA memory allocated by GEM DMA */
 	void *vaddr;
+	unsigned long dma_attrs;
 
 	bool map_noncoherent;
 };
-- 
2.53.0.1018.g2bb0e51243-goog


