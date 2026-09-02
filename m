Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 141FDC624D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 10:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w1wC9u3twhPNjqquLWPyT5Y0R6x/ILvd7DMTdNgZ19s=; b=a7rU8CrFO8V7+zpWUS8DWwW35Q
	JCPNF9DXDp6lYyABAzbRJJ9NIdseER9iGI8s+Cc96AU7lCmDI0zGB1BU0KpT96E4fc9zsESMdngU6
	h/n4Zm0jKPXVPq5r/Skn7ImI6CN9GBVVy2JdXCEoIkPhaGwDyNIwd+358NXxL1grc1AtRjV7Y1+uC
	knNPCRhiYtGzd0hiqTnjQTgMcUUi9uwIamG0qx1MqWIdCBUkfQLuUdmpeJXXa/yBN1v6K5DCPqbU9
	mhnZgSY4lqZf4UxS/FWGPqA2XdVPciYXVfaU4OZdhjtZdYeHGxeh/jL2zsnksBG0eNeTbYs+ZbIic
	N7PWRBnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYt-0000000EP6G-43KH;
	Wed, 02 Sep 2026 10:51:23 +0000
Received: from mail-wm1-x345.google.com ([2a00:1450:4864:20::345])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1iYq-0000000EP0E-497V
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 10:51:22 +0000
Received: by mail-wm1-x345.google.com with SMTP id 5b1f17b1804b1-4994cf6cdb9so6533845e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Sep 2026 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788346279; x=1788951079; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=w1wC9u3twhPNjqquLWPyT5Y0R6x/ILvd7DMTdNgZ19s=;
        b=SPwwb4WDe3O6slpG6N/oWTmhvlU4nOG4LsbT7x6PoG1Da9cHbg2aqunImeLoIV4c6I
         jH340USVrmy2yFur2lm5grmPcO4TzZ6tFnB/HpHBNVNz1jzVwbu1D6hw10olO1GRPrXC
         2GbVEYxIruo0b7tgaVsvKYmNdLCW/ckajASwS4LwSqbu8RhrHMVlRsHpjpN7av5Zsq5L
         VaphUIV0jN7lMbKC/IR4T5yzaLqWUDCH5T5H5C95MeejGGGT/zU+sr8WLx76Qz8RUn7q
         RvBN9joangNKECbpwsWMfqGMKMJinwSmGsFYhKzJ5PkZ4iI8zLcmxf9ipfyta4W63Xfb
         wJTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788346279; x=1788951079;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w1wC9u3twhPNjqquLWPyT5Y0R6x/ILvd7DMTdNgZ19s=;
        b=mkhXtwH1q8rBasilGtwbbi3dnukkXj5sWCTSptMhvDpb27uSxLcmUOvyQbqguYpK8b
         5kHVvpMFreXamU1iuRqczVQ8qAxc2tnLYMGcg/9PXOlxdha4Fl736YtUTDt7q1X1KfHi
         en/f1yEiI1MultrExsC2zu/bxk7CGjqL+mUeIE0vE9zRZdiIwTWpeVNq9pRz2J0sf0W4
         WsAOhU+tY6/D2H/1s4p1yoQ1Wr8KPk+E7bpg/iPS8LQP61HMnGIEkTRXRUOMaPxuBi2P
         ikftiWIi5mZlujQE7ETl9PMFvI7y/ZZFPQbxDQUkSOKQ+ax7cY5HygHHL1VB3hRyILb6
         zP7Q==
X-Forwarded-Encrypted: i=1; AHgh+RqLSZllLa8g4IvpYem/p/JZbEbAYByBXuZf8KlBbe6UrRiYW/iii9jGhcU1jiGujYJ/TIiS/TxdCk56KlAgbQh2@lists.infradead.org
X-Gm-Message-State: AFuF++nmIRsG4RPBiHCRlg8YJm/yQdbey2jqTmIJXem1pr6KLaRBlzpb
	OvZbvhVD/iBXvloPVhVt/6REY6hzSBIvq3zGU5jcCTnyWY0I90fXpMdEV702Ns3xJbalg/vSJUX
	UCgjhBhDYDpFxYjZEtEHXKg==
X-Received: from wmqy14.prod.google.com ([2002:a05:600c:364e:b0:49c:ca29:c0ed])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:5653:b0:49c:eb17:cf3b with SMTP id 5b1f17b1804b1-49ceb17cff4mr15337645e9.8.1788346278647;
 Wed, 02 Sep 2026 03:51:18 -0700 (PDT)
Date: Wed,  2 Sep 2026 11:47:12 +0100
In-Reply-To: <20260902104712.2399797-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20260902104712.2399797-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.55.0.970.g62bdec98f9-goog
Message-ID: <20260902104712.2399797-11-vdonnefort@google.com>
Subject: [PATCH v9 10/10] optee: Add support for arm,ffa-lend-pool
From: Vincent Donnefort <vdonnefort@google.com>
To: catalin.marinas@arm.com, will@kernel.org, rppt@kernel.org, 
	akpm@linux-foundation.org, sudeep.holla@kernel.org, jenswi@kernel.org, 
	robh@kernel.org
Cc: mark.rutland@arm.com, sumit.garg@kernel.org, ardb@kernel.org, 
	thierry.reding@kernel.org, david@kernel.org, danielmentz@google.com, 
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, 
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_035121_056382_605AF43E 
X-CRM114-Status: GOOD (  17.17  )
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

Hook OP-TEE dynamically allocated protected memory pools to the
"arm,ffa-lend-pool" driver. While the SMC transport platform device
resolves the pool through its DT "memory-region" property, the FF-A
transport lacks a device tree node and binds via ffa_lend_pool_attach().

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/drivers/tee/optee/ffa_abi.c b/drivers/tee/optee/ffa_abi.c
index 633715b98625..4d6555171918 100644
--- a/drivers/tee/optee/ffa_abi.c
+++ b/drivers/tee/optee/ffa_abi.c
@@ -979,6 +979,7 @@ static void optee_ffa_remove(struct ffa_device *ffa_dev)
 
 	mutex_destroy(&optee->ffa.mutex);
 	rhashtable_free_and_destroy(&optee->ffa.global_ids, rh_free_fn, NULL);
+	ffa_lend_pool_detach(&optee->teedev->dev);
 
 	kfree(optee);
 }
@@ -1042,13 +1043,21 @@ static int optee_ffa_protmem_pool_init(struct optee *optee, u32 sec_caps)
 	int rc = 0;
 
 	if (sec_caps & OPTEE_FFA_SEC_CAP_PROTMEM) {
+		rc = ffa_lend_pool_attach(&optee->teedev->dev);
+		if (rc && rc != -ENODEV)
+			return rc;
+
 		pool = optee_protmem_alloc_dyn_pool(optee, id);
-		if (IS_ERR(pool))
+		if (IS_ERR(pool)) {
+			ffa_lend_pool_detach(&optee->teedev->dev);
 			return PTR_ERR(pool);
+		}
 
 		rc = tee_device_register_dma_heap(optee->teedev, id, pool);
-		if (rc)
+		if (rc) {
 			pool->ops->destroy_pool(pool);
+			ffa_lend_pool_detach(&optee->teedev->dev);
+		}
 	}
 
 	return rc;
diff --git a/drivers/tee/optee/protmem.c b/drivers/tee/optee/protmem.c
index be3abf6e8aa6..9b64db9b4e64 100644
--- a/drivers/tee/optee/protmem.c
+++ b/drivers/tee/optee/protmem.c
@@ -42,14 +42,6 @@ static int init_dyn_protmem(struct optee_protmem_dyn_pool *rp)
 		goto err_null_protmem;
 	}
 
-	/*
-	 * TODO unmap the memory range since the physical memory will
-	 * become inaccesible after the lend_protmem() call.
-	 *
-	 * If the platform supports a hypervisor at EL2, it will unmap the
-	 * intermediate physical memory for us and stop cache pre-fetch of
-	 * the memory.
-	 */
 	rc = rp->optee->ops->lend_protmem(rp->optee, rp->protmem,
 					  rp->mem_attrs,
 					  rp->mem_attr_count, rp->use_case);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b8a2bdac3208..5949aa717cad 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -19,6 +19,7 @@
 #include <linux/of.h>
 #include <linux/of_irq.h>
 #include <linux/of_platform.h>
+#include <linux/of_reserved_mem.h>
 #include <linux/platform_device.h>
 #include <linux/rpmb.h>
 #include <linux/sched.h>
@@ -1528,6 +1529,8 @@ static void optee_smc_remove(struct platform_device *pdev)
 	if (optee->smc.memremaped_shm)
 		memunmap(optee->smc.memremaped_shm);
 
+	of_reserved_mem_device_release(&optee->teedev->dev);
+
 	kfree(optee);
 }
 
@@ -1712,16 +1715,22 @@ static int optee_protmem_pool_init(struct optee *optee)
 	if (!protm && !dyn_protm)
 		return 0;
 
+	of_reserved_mem_device_init_by_idx(&optee->teedev->dev,
+					   dev_of_node(optee->teedev->dev.parent), 0);
 	if (protm)
 		pool = static_protmem_pool_init(optee);
 	if (dyn_protm && IS_ERR(pool))
 		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
-	if (IS_ERR(pool))
+	if (IS_ERR(pool)) {
+		of_reserved_mem_device_release(&optee->teedev->dev);
 		return PTR_ERR(pool);
+	}
 
 	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
-	if (rc)
+	if (rc) {
 		pool->ops->destroy_pool(pool);
+		of_reserved_mem_device_release(&optee->teedev->dev);
+	}
 
 	return rc;
 }
@@ -1833,14 +1842,14 @@ static int optee_probe(struct platform_device *pdev)
 	    (sec_caps & OPTEE_SMC_SEC_CAP_RPMB_PROBE))
 		optee->in_kernel_rpmb_routing = true;
 
-	teedev = tee_device_alloc(&optee_clnt_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_clnt_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_free_optee;
 	}
 	optee->teedev = teedev;
 
-	teedev = tee_device_alloc(&optee_supp_desc, NULL, pool, optee);
+	teedev = tee_device_alloc(&optee_supp_desc, &pdev->dev, pool, optee);
 	if (IS_ERR(teedev)) {
 		rc = PTR_ERR(teedev);
 		goto err_unreg_teedev;
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 6742b3579c86..49a9b2993c83 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
  */
 #include <linux/anon_inodes.h>
+#include <linux/arm_ffa.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-mapping.h>
@@ -43,6 +44,7 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 
 		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
 		p = dma_mem;
+		ffa_lend_reclaimed(&teedev->dev, shm->paddr, shm->size);
 		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
 			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
 #endif
@@ -288,6 +290,7 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 	struct tee_shm_dma_mem *dma_mem;
 	dma_addr_t dma_addr;
 	struct page *page;
+	int ret;
 
 	if (!tee_device_get(teedev))
 		return ERR_PTR(-EINVAL);
@@ -297,9 +300,13 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 	if (!page)
 		goto err_put_teedev;
 
+	ret = ffa_prepare_lend(&teedev->dev, page_to_phys(page), page_count * PAGE_SIZE);
+	if (ret && ret != -ENODEV)
+		goto err_free_pages;
+
 	dma_mem = kzalloc_obj(*dma_mem);
 	if (!dma_mem)
-		goto err_free_pages;
+		goto err_map_pages;
 
 	refcount_set(&dma_mem->shm.refcount, 1);
 	dma_mem->shm.ctx = ctx;
@@ -313,6 +320,8 @@ struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
 
 	return &dma_mem->shm;
 
+err_map_pages:
+	ffa_lend_reclaimed(&teedev->dev, page_to_phys(page), page_count * PAGE_SIZE);
 err_free_pages:
 	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
 		       DMA_BIDIRECTIONAL);
-- 
2.55.0.970.g62bdec98f9-goog


