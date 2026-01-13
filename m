Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2109DD2F34D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 17:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v2l8wIBjsApl5lsjMAOqlkMIbLPfjDWiLseIy2qbcjU=; b=UkvvLXadC6zQp8z1/9+wrR8Xm3
	FqurqJzhQdg/PX+64ZZD5FRHghes6ssATcgrC78q0gEdTyifEUFOSjASTm+m+Gz6gvqwyvkxkv4Q2
	Jg/YQLe1Q8KMMNwCou+Sd/1xldq9PcHvaIP+yHTl8yen2lq08D04qa3yPKOBljSeaY9BI/bzhz+G3
	yYAvEZqzxulsKQ+p8uBZnM5bF6qlSYWa7CryndNeiD3p++/cTSpBNziy+5J0PieXjvmMdjgJS82JR
	4ZRWblZMIsfDdFlxiLCJtuoY3GLKnOjGYs9Z1Ev74WoRUPM/dlMX7CM+mQsTbUTu2Si+gn9tn5lyv
	NNdkEr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRv-00000007YDC-1NH0;
	Tue, 13 Jan 2026 17:44:59 +0000
Received: from mail-ed1-f44.google.com ([209.85.208.44])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfiRq-00000007Y9o-3uVb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Jan 2026 17:44:56 +0000
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-64b9b0b4d5dso16480727a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 13 Jan 2026 09:44:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768326293; x=1768931093;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=v2l8wIBjsApl5lsjMAOqlkMIbLPfjDWiLseIy2qbcjU=;
        b=nPWWunKoHWHVi4Zq20ACdY9pWAODcyPIOs2gs0b5hk9+UBFy5Pa5R2iieM50OlIYt3
         nSv7ZLqwyqklzei3/5qSmbnzoQTfItPu1CNI2oZDqI/40ukLsofrSmoVQlfpXGM2sl7d
         OVsC4xyjJz42MRoSkrn3Pwp1Z9X+qJ7cwfLU3TRVjoXl6G43hjAwsysI9BrVkZSkOIHf
         QhW1WxZOZ8xovV7jdjiIJbJEg7lmhApPsvRYdLo9jUAgrujBb9uwZ+hKUEowKRL2HR5y
         ek3j2s4GRUL5KGVxc8Qhj75XbRufmzRmyy1W7eWbakqH+YHP9swWIRQpREgYpcNrX/t0
         gkNw==
X-Gm-Message-State: AOJu0Ywo/R7a8yc/lrbhSsEWbLPLhsRN7KSnlWbqKsvRZbH1Rm8cg2En
	GJhtaC9vDnxZi0xF7RXF+VWz9T+bgwIxqWe2wg1dUg28CK661pQl2RHp
X-Gm-Gg: AY/fxX75d/SbD7AEeH4cjuRldGWCW4d+DUGLioCzCcx3CeIHOxIbiIRGSe6qAp5stue
	Y/GnXJ4sSqD9I7QrmhX8yWZtqskgfnudCEsOJDX/b/5osIJcrrit1UlSuMwgCuHviGfTVl7PLOF
	4C2DUZBP6dXWHB+TmRoYhtI8QkW37HqIW25Y++ZyA2ABdwdXOA+53zvQ5ehhtJ8EyoGzwRU+m40
	eoKqot1rjGC5ZIm55xYll5JWqKqiH+5NrxCC+wEPDS9f7/h9SYaFp6XBOcWeqeT0LwIVKNq//FY
	aqEzjIILiv4ucH7eDSxbCoPgxHlVndd4qPhlJOPTNNqRcwQhD3fj8Vs1Gb6FX0vwAeV3iAsgHqV
	G6WbH/rVgfvFunJN6D13DVm43BRfDg1KVYCZG2B2msD3HgwHwRsgGFUZb3Q4I7VBBbp+xhcko+r
	RNom1BpjKybXfAuPjCgpezdo7BJuQ679yJQisu5sRRTHAa0Q==
X-Google-Smtp-Source: AGHT+IGYYREEN/5lBbERJSEIoYk6+xX8TKQHB6V6QK9t02Hm3hex4r4o0KRxPxU4VDxzdmDeNKmVmQ==
X-Received: by 2002:a05:6402:1e92:b0:653:9cd7:2004 with SMTP id 4fb4d7f45d1cf-6539cd72323mr1132657a12.28.1768326292719;
        Tue, 13 Jan 2026 09:44:52 -0800 (PST)
Received: from [10.42.0.1] (cst-prg-36-231.cust.vodafone.cz. [46.135.36.231])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6507be655aesm20873259a12.17.2026.01.13.09.44.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 09:44:52 -0800 (PST)
From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Tue, 13 Jan 2026 18:44:37 +0100
Subject: [PATCH 3/5] accel/thames: Add IOCTLs for BO creation and mapping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-thames-v1-3-99390026937c@tomeuvizoso.net>
References: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
In-Reply-To: <20260113-thames-v1-0-99390026937c@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_094455_051734_E180F502 
X-CRM114-Status: GOOD (  26.93  )
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

Uses the SHMEM DRM helpers, mapping on creation to the device as all
created buffers are expected to be accessed by the DSPs. We map to all
DSPs because we cannot know upfront what DSP cores will run a given job.

Buffers are mapped for the device by the DSPs themselves, as each
contains a MMU.

Buffers belong to a context, which is used by the DSP to switch to the
page table that mapped the buffers for the user of the job to execute.

Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/Makefile       |   1 +
 drivers/accel/thames/thames_drv.c   |   5 +-
 drivers/accel/thames/thames_gem.c   | 355 ++++++++++++++++++++++++++++++++++++
 drivers/accel/thames/thames_gem.h   |  41 +++++
 drivers/accel/thames/thames_rpmsg.c |  69 +++++++
 5 files changed, 470 insertions(+), 1 deletion(-)

diff --git a/drivers/accel/thames/Makefile b/drivers/accel/thames/Makefile
index 7ccd8204f0f5ea800f30e84b319f355be948109d..0051e319f2e4966de72bc342d5b6e40b2890c006 100644
--- a/drivers/accel/thames/Makefile
+++ b/drivers/accel/thames/Makefile
@@ -6,4 +6,5 @@ thames-y := \
 	thames_core.o \
 	thames_device.o \
 	thames_drv.o \
+	thames_gem.o \
 	thames_rpmsg.o
diff --git a/drivers/accel/thames/thames_drv.c b/drivers/accel/thames/thames_drv.c
index a288e6ef05d7b1a21741ac0ca9cc8981f33969e4..29a80b9747ae84778b09f5dbd5b8d6d596f1947a 100644
--- a/drivers/accel/thames/thames_drv.c
+++ b/drivers/accel/thames/thames_drv.c
@@ -13,6 +13,7 @@
 
 #include "thames_drv.h"
 #include "thames_core.h"
+#include "thames_gem.h"
 #include "thames_ipc.h"
 
 static struct platform_device *drm_dev;
@@ -54,7 +55,8 @@ static void thames_postclose(struct drm_device *dev, struct drm_file *file)
 
 static const struct drm_ioctl_desc thames_drm_driver_ioctls[] = {
 #define THAMES_IOCTL(n, func) DRM_IOCTL_DEF_DRV(THAMES_##n, thames_ioctl_##func, 0)
-
+	THAMES_IOCTL(BO_CREATE, bo_create),
+	THAMES_IOCTL(BO_MMAP_OFFSET, bo_mmap_offset),
 };
 
 DEFINE_DRM_ACCEL_FOPS(thames_accel_driver_fops);
@@ -63,6 +65,7 @@ static const struct drm_driver thames_drm_driver = {
 	.driver_features = DRIVER_COMPUTE_ACCEL | DRIVER_GEM,
 	.open = thames_open,
 	.postclose = thames_postclose,
+	.gem_create_object = thames_gem_create_object,
 	.ioctls = thames_drm_driver_ioctls,
 	.num_ioctls = ARRAY_SIZE(thames_drm_driver_ioctls),
 	.fops = &thames_accel_driver_fops,
diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
new file mode 100644
index 0000000000000000000000000000000000000000..a153e73a15253e0f955d74020b4765a1fa833fc4
--- /dev/null
+++ b/drivers/accel/thames/thames_gem.c
@@ -0,0 +1,355 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#include "drm/drm_gem_shmem_helper.h"
+#include <drm/drm_device.h>
+#include <drm/drm_drv.h>
+#include <drm/drm_print.h>
+#include <drm/drm_utils.h>
+#include <drm/thames_accel.h>
+#include <linux/dma-mapping.h>
+#include <linux/idr.h>
+
+#include "thames_gem.h"
+#include "thames_device.h"
+#include "thames_drv.h"
+#include "thames_rpmsg.h"
+
+#define THAMES_BO_FLAGS DRM_THAMES_BO_NO_MMAP
+
+/*
+ * DSP MMU permission flags for buffer object mappings.
+ * These control read/write/execute permissions in the DSP's address space.
+ */
+#define THAMES_BO_PERM_READ (1 << 0)
+#define THAMES_BO_PERM_WRITE (1 << 1)
+#define THAMES_BO_PERM_EXEC (1 << 2)
+#define THAMES_BO_PERM_RWX (THAMES_BO_PERM_READ | THAMES_BO_PERM_WRITE | THAMES_BO_PERM_EXEC)
+
+static u64 thames_alloc_vaddr(struct thames_device *tdev, struct thames_gem_object *bo, size_t size)
+{
+	int ret;
+
+	size = ALIGN(size, SZ_1M);
+
+	mutex_lock(&tdev->mm_lock);
+	ret = drm_mm_insert_node(&tdev->mm, &bo->mm, size);
+	mutex_unlock(&tdev->mm_lock);
+
+	if (ret)
+		return 0;
+
+	return bo->mm.start;
+}
+
+static void thames_free_vaddr(struct thames_device *tdev, struct thames_gem_object *bo)
+{
+	if (!drm_mm_node_allocated(&bo->mm))
+		return;
+
+	mutex_lock(&tdev->mm_lock);
+	drm_mm_remove_node(&bo->mm);
+	mutex_unlock(&tdev->mm_lock);
+}
+
+static int thames_context_destroy_on_core(struct thames_file_priv *priv, struct thames_core *core)
+{
+	struct thames_device *tdev = priv->tdev;
+	int ret;
+
+	ret = thames_rpmsg_send_destroy_context(core, priv->context_id);
+	if (ret)
+		dev_warn(tdev->ddev.dev, "Failed to destroy context on core %d: %d", core->index,
+			 ret);
+
+	return ret;
+}
+
+static int thames_context_create_on_core(struct thames_file_priv *priv, struct thames_core *core)
+{
+	struct thames_device *tdev = priv->tdev;
+	int ret;
+
+	ret = thames_rpmsg_send_create_context(core, priv->context_id);
+	if (ret)
+		dev_warn(tdev->ddev.dev, "Failed to create context on core %d: %d", core->index,
+			 ret);
+
+	return ret;
+}
+
+int thames_context_create(struct thames_file_priv *priv)
+{
+	struct thames_device *tdev = priv->tdev;
+	int i, ret;
+
+	ret = ida_alloc_min(&tdev->ctx_ida, 1, GFP_KERNEL);
+	if (ret < 0)
+		return ret;
+
+	priv->context_id = ret;
+	priv->context_valid = false;
+
+	if (!tdev->num_cores) {
+		dev_err(tdev->ddev.dev, "No cores available\n");
+		ret = -ENODEV;
+		goto err_free_id;
+	}
+
+	for (i = 0; i < tdev->num_cores; i++) {
+		ret = thames_context_create_on_core(priv, &tdev->cores[i]);
+		if (ret) {
+			dev_err(tdev->ddev.dev, "Failed to create context on core %d: %d\n", i,
+				ret);
+			goto err_destroy_contexts;
+		}
+	}
+
+	priv->context_valid = true;
+	return 0;
+
+err_destroy_contexts:
+	for (i = i - 1; i >= 0; i--)
+		thames_context_destroy_on_core(priv, &tdev->cores[i]);
+err_free_id:
+	ida_free(&tdev->ctx_ida, priv->context_id);
+	return ret;
+}
+
+void thames_context_destroy(struct thames_file_priv *priv)
+{
+	struct thames_device *tdev = priv->tdev;
+	int i;
+
+	if (!priv->context_valid)
+		return;
+
+	for (i = 0; i < tdev->num_cores; i++)
+		thames_context_destroy_on_core(priv, &tdev->cores[i]);
+
+	ida_free(&tdev->ctx_ida, priv->context_id);
+	priv->context_valid = false;
+}
+
+static int thames_bo_map_to_core(struct thames_gem_object *bo, struct thames_file_priv *file_priv,
+				 struct thames_core *core, u64 vaddr, u64 paddr, u64 size,
+				 u32 flags)
+{
+	struct thames_device *tdev = file_priv->tdev;
+	int ret;
+
+	ret = thames_rpmsg_send_map_bo(core, file_priv->context_id, bo->id, vaddr, paddr, size);
+	if (ret)
+		dev_warn(tdev->ddev.dev, "Failed to map buffer on core %d: %d", core->index, ret);
+
+	return ret;
+}
+
+static int thames_bo_map_to_device(struct thames_gem_object *bo, struct thames_file_priv *file_priv)
+{
+	struct thames_device *tdev = file_priv->tdev;
+	struct sg_table *sgt;
+	dma_addr_t dma_addr;
+	int i, ret;
+
+	if (bo->iova)
+		return 0;
+
+	if (!file_priv->context_valid)
+		return -EINVAL;
+
+	if (!tdev->num_cores)
+		return -ENODEV;
+
+	sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
+	if (IS_ERR(sgt))
+		return PTR_ERR(sgt);
+
+	dma_addr = sg_dma_address(sgt->sgl);
+	if (!dma_addr) {
+		ret = -EINVAL;
+		goto err_put_pages;
+	}
+
+	bo->iova = thames_alloc_vaddr(tdev, bo, bo->base.base.size);
+	if (!bo->iova) {
+		ret = -ENOMEM;
+		goto err_put_pages;
+	}
+
+	bo->context_id = file_priv->context_id;
+
+	for (i = 0; i < tdev->num_cores; i++) {
+		ret = thames_bo_map_to_core(bo, file_priv, &tdev->cores[i], bo->iova, dma_addr,
+					    bo->base.base.size, THAMES_BO_PERM_RWX);
+		if (ret) {
+			while (--i >= 0)
+				thames_rpmsg_send_unmap_bo(&tdev->cores[i], bo->context_id, bo->id);
+			goto err_free_vaddr;
+		}
+	}
+
+	return 0;
+
+err_free_vaddr:
+	thames_free_vaddr(tdev, bo);
+	bo->iova = 0;
+err_put_pages:
+	dma_resv_lock(bo->base.base.resv, NULL);
+	drm_gem_shmem_put_pages_locked(&bo->base);
+	dma_resv_unlock(bo->base.base.resv);
+	return ret;
+}
+
+static void thames_bo_unmap_from_device(struct thames_gem_object *bo, struct thames_device *tdev)
+{
+	int i, ret, failed_unmaps = 0;
+
+	if (!bo->iova)
+		return;
+
+	for (i = 0; i < tdev->num_cores; i++) {
+		ret = thames_rpmsg_send_unmap_bo(&tdev->cores[i], bo->context_id, bo->id);
+		if (ret) {
+			dev_err(tdev->ddev.dev, "Failed to unmap BO %u from core %d: %d\n", bo->id,
+				i, ret);
+			failed_unmaps++;
+		}
+	}
+
+	if (failed_unmaps)
+		drm_WARN(&tdev->ddev, failed_unmaps > 0,
+			 "BO %u: %d core(s) failed unmap, potential DSP-side leak\n", bo->id,
+			 failed_unmaps);
+
+	thames_free_vaddr(tdev, bo);
+	bo->iova = 0;
+
+	dma_resv_lock(bo->base.base.resv, NULL);
+	drm_gem_shmem_put_pages_locked(&bo->base);
+	dma_resv_unlock(bo->base.base.resv);
+}
+
+static void thames_gem_bo_free(struct drm_gem_object *obj)
+{
+	struct thames_gem_object *bo = to_thames_bo(obj);
+	struct thames_device *tdev = to_thames_device(obj->dev);
+
+	drm_WARN_ON(obj->dev, refcount_read(&bo->base.pages_use_count) > 1);
+
+	if (bo->iova)
+		thames_bo_unmap_from_device(bo, tdev);
+
+	ida_free(&tdev->bo_ida, bo->id);
+
+	drm_gem_free_mmap_offset(&bo->base.base);
+	drm_gem_shmem_free(&bo->base);
+}
+
+static const struct drm_gem_object_funcs thames_gem_funcs = {
+	.free = thames_gem_bo_free,
+	.print_info = drm_gem_shmem_object_print_info,
+	.pin = drm_gem_shmem_object_pin,
+	.unpin = drm_gem_shmem_object_unpin,
+	.get_sg_table = drm_gem_shmem_object_get_sg_table,
+	.vmap = drm_gem_shmem_object_vmap,
+	.vunmap = drm_gem_shmem_object_vunmap,
+	.mmap = drm_gem_shmem_object_mmap,
+	.vm_ops = &drm_gem_shmem_vm_ops,
+};
+
+struct drm_gem_object *thames_gem_create_object(struct drm_device *dev, size_t size)
+{
+	struct thames_device *tdev = to_thames_device(dev);
+	struct thames_gem_object *obj;
+	int bo_id;
+
+	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
+	if (!obj)
+		return ERR_PTR(-ENOMEM);
+
+	obj->base.base.funcs = &thames_gem_funcs;
+
+	bo_id = ida_alloc_min(&tdev->bo_ida, 1, GFP_KERNEL);
+	if (bo_id < 0) {
+		kfree(obj);
+		return ERR_PTR(bo_id);
+	}
+	obj->id = bo_id;
+
+	return &obj->base.base;
+}
+
+int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct thames_file_priv *file_priv = file->driver_priv;
+	struct drm_thames_bo_create *args = data;
+	struct drm_gem_shmem_object *mem;
+	struct thames_gem_object *bo;
+	int cookie, ret;
+
+	if (!drm_dev_enter(ddev, &cookie))
+		return -ENODEV;
+
+	if (args->handle || args->iova) {
+		ret = -EINVAL;
+		goto err_exit;
+	}
+
+	if (!args->size || (args->flags & ~THAMES_BO_FLAGS)) {
+		ret = -EINVAL;
+		goto err_exit;
+	}
+
+	mem = drm_gem_shmem_create(ddev, args->size);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	bo = to_thames_bo(&mem->base);
+
+	ret = drm_gem_handle_create(file, &mem->base, &args->handle);
+	drm_gem_object_put(&mem->base);
+	if (ret) {
+		dev_err(ddev->dev, "Failed to create gem handle: %d", ret);
+		goto err_free;
+	}
+
+	ret = thames_bo_map_to_device(bo, file_priv);
+	if (ret) {
+		dev_err(ddev->dev, "Failed to map buffer to DSP on creation: %d", ret);
+		goto err_free;
+	}
+
+	args->size = bo->base.base.size;
+	args->iova = bo->iova;
+
+	drm_dev_exit(cookie);
+
+	return 0;
+
+err_free:
+	drm_gem_shmem_object_free(&mem->base);
+
+err_exit:
+	drm_dev_exit(cookie);
+
+	return ret;
+}
+
+int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file)
+{
+	struct drm_thames_bo_mmap_offset *args = data;
+	struct drm_gem_object *obj;
+
+	if (args->pad)
+		return -EINVAL;
+
+	obj = drm_gem_object_lookup(file, args->handle);
+	if (!obj)
+		return -ENOENT;
+
+	args->offset = drm_vma_node_offset_addr(&obj->vma_node);
+	drm_gem_object_put(obj);
+
+	return 0;
+}
diff --git a/drivers/accel/thames/thames_gem.h b/drivers/accel/thames/thames_gem.h
new file mode 100644
index 0000000000000000000000000000000000000000..785843c40a89a9e84ab634aad77e9ec46111693e
--- /dev/null
+++ b/drivers/accel/thames/thames_gem.h
@@ -0,0 +1,41 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/* Copyright 2026 Texas Instruments Incorporated - https://www.ti.com/ */
+
+#ifndef __THAMES_GEM_H__
+#define __THAMES_GEM_H__
+
+#include <drm/drm_gem_shmem_helper.h>
+#include <drm/drm_mm.h>
+
+struct thames_device;
+
+struct thames_gem_object {
+	struct drm_gem_shmem_object base;
+
+	struct thames_file_priv *driver_priv;
+
+	struct drm_mm_node mm;
+
+	u32 id;
+	u32 context_id;
+	u64 iova;
+	size_t size;
+	size_t offset;
+};
+
+struct drm_gem_object *thames_gem_create_object(struct drm_device *dev, size_t size);
+
+int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_ioctl_bo_mmap_offset(struct drm_device *ddev, void *data, struct drm_file *file);
+
+int thames_context_create(struct thames_file_priv *priv);
+
+void thames_context_destroy(struct thames_file_priv *priv);
+
+static inline struct thames_gem_object *to_thames_bo(struct drm_gem_object *obj)
+{
+	return container_of(to_drm_gem_shmem_obj(obj), struct thames_gem_object, base);
+}
+
+#endif
diff --git a/drivers/accel/thames/thames_rpmsg.c b/drivers/accel/thames/thames_rpmsg.c
index ebc34f49353e5e7959734da8e8a935573c130e79..a25465295a177877c5ca2b3c93f52d8288863797 100644
--- a/drivers/accel/thames/thames_rpmsg.c
+++ b/drivers/accel/thames/thames_rpmsg.c
@@ -63,6 +63,14 @@ static int thames_rpmsg_callback(struct rpmsg_device *rpdev, void *data, int len
 		break;
 	}
 
+	case THAMES_MSG_CONTEXT_OP_RESPONSE:
+		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+		break;
+
+	case THAMES_MSG_BO_OP_RESPONSE:
+		ida_free(&core->tdev->ipc_seq_ida, hdr->seq);
+		break;
+
 	default:
 		dev_warn(&rpdev->dev, "Unknown message type: %u\n", hdr->type);
 		break;
@@ -122,6 +130,67 @@ int thames_rpmsg_send_ping(struct thames_core *core, u32 ping_data, u32 *sequenc
 	return thames_rpmsg_send_raw(core, &ping_msg, sizeof(ping_msg));
 }
 
+int thames_rpmsg_send_create_context(struct thames_core *core, u32 context_id)
+{
+	struct thames_msg_context_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_CONTEXT_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_CONTEXT_CREATE;
+	msg.context_id = context_id;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
+int thames_rpmsg_send_destroy_context(struct thames_core *core, u32 context_id)
+{
+	struct thames_msg_context_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_CONTEXT_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_CONTEXT_DESTROY;
+	msg.context_id = context_id;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
+int thames_rpmsg_send_map_bo(struct thames_core *core, u32 context_id, u32 bo_id, u64 vaddr,
+			     u64 paddr, u64 size)
+{
+	struct thames_msg_bo_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_BO_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_BO_MAP;
+	msg.context_id = context_id;
+	msg.bo_id = bo_id;
+	msg.vaddr = vaddr;
+	msg.paddr = paddr;
+	msg.size = size;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
+int thames_rpmsg_send_unmap_bo(struct thames_core *core, u32 context_id, u32 bo_id)
+{
+	struct thames_msg_bo_op msg = {};
+
+	msg.hdr.type = THAMES_MSG_BO_OP;
+	msg.hdr.seq = ida_alloc(&core->tdev->ipc_seq_ida, GFP_KERNEL);
+	msg.hdr.len = sizeof(msg);
+	msg.op = THAMES_BO_UNMAP;
+	msg.context_id = context_id;
+	msg.bo_id = bo_id;
+	msg.vaddr = 0;
+	msg.paddr = 0;
+	msg.size = 0;
+
+	return thames_rpmsg_send_raw(core, &msg, sizeof(msg));
+}
+
 int thames_rpmsg_ping_test(struct thames_core *core)
 {
 	const u32 test_data = THAMES_PING_TEST_PATTERN;

-- 
2.52.0


