Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 354B2CAC593
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r7AlbrbWF01PAGMb+n5yznNoBl+a3KG2eoPDEibc0TE=; b=Y1qZ5ebQq4puzgSWj1eVQZjkv1
	psnKfSYbg/dSRrvXimfr5UCvlI0b7qN3L+Oi7Sn6rx+Tj5rcfNVJ8DZGy59/UqrNdRlT4sWH0LudK
	mBimRcfUGzfB/OQuTSUfAJYrFaQRkIrLOcKrwveDANLto0B8ITz8K5H1txFJiozZZcOX8cO85yCcu
	ePOpZumMpGoPbKOOBIMAs/6jl/GTB8gVqnMu6I9Mmd1fEuZQFGxgdiVO3mkkhqvE1N70C00ulxJvR
	KUkVX818kNL2+IK1d/CmndTS1kEngWbaa9VeJAMfHp5kSU9oCvQql1Qh2cR9U1pDGyrj4SOB7hGS9
	7BNpmjPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhL-00000003MV9-40Nx;
	Thu, 11 Sep 2025 13:50:52 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhI-00000003MQ0-3IF9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:51 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-71d6014810fso5857297b3.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598648; x=1758203448; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r7AlbrbWF01PAGMb+n5yznNoBl+a3KG2eoPDEibc0TE=;
        b=kLpc1Q+9+tIizD72979zTFyJmlsKJgUOrpkyHkiYuex/Gz3oBl0T86TA7yVFemK01r
         QC1xrNTJYzT5eflBNrNBJ5xNNnyOOosd2Z8axjBvmOyeyLdLublR3CVeqHFK5PBBb+BV
         8a+ImToR1sjbFiTEhUWOOSlrcq7NpsjONgQNDhRKo0inzeUPNRY2+qbYPCW48pv4j5B1
         gT/nVzPD8hK3UtphHYnGbOmBpkNo33ujJ1o2KIa7zxva0h7errHEshSPH7t03vVEKUk0
         Cxjsz+lVhDdhydCuBXTTGOZ4TO/fLvlVzjQp4BF1DbXfx1NVqSE5ZZmY4rMhHg75bBCY
         Lfsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598648; x=1758203448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7AlbrbWF01PAGMb+n5yznNoBl+a3KG2eoPDEibc0TE=;
        b=XRYzOG2uWTLtQkQURYptvuz3bn77qQeOaBEHGXHUjzyoSsbOqG19x2B7s4QlZVGj72
         brdK0pO9jYZcCPut1L2o32oalxdNLKncY1v1FWJx0ZqWn1Jyb16rFbob6+YJg7aTfrqS
         HPm0A44/F5vevPPGnFLeacxTYCh7NFHh2/PRDxdlAkjzXnMRnhuhtp5GSUUxGHaPAMHb
         /Qc5sCsmtCP52s3WyZDg8qlFlcJ3nZCBRbOntHJzxrzz8oJ2hyOrJT35ZDjvihllZ6Vn
         hjZgE4sIPjqHy4Yt5beUkmzASU1XLI9FnBSRMc45h4MyMc3v5Y8VllXhckYhjTgB8qJb
         /UiA==
X-Forwarded-Encrypted: i=1; AJvYcCUyHZxcRP/cqWH2ly/n+eRWV0YE8Gq9Ni/hpGjxkU0Og1xF96j3EkwAkU74wpShFMhkuDVWr0I0gVqDJobZ2SCr@lists.infradead.org
X-Gm-Message-State: AOJu0YzSryX0ORb78n1jI1KPrvcNC8VRlZrTv0PuirNPrRLK0v/LQhRb
	pXRVO/jX4su6m/fHAe7us5ukWkKPU2QZC92QSh33m+xFKZr8YWDZJJiIwu8shqLB1o4=
X-Gm-Gg: ASbGncsKHz2Th0tb8KKOBXQHeBI/LiW/BQx0Z0wI7fg1Aqlf3dVkKTz7dah+BL/3e+i
	owe7f3Y7nTll7MWaBumcoeoffWd/9SFm3pRHrC6DAAn8CX6ACq2LljyHg7m2kRLLhYYcnv3srUp
	giEd7/RHTbsp7Cygc9Az8u6CcU0g2zA0/E2KjvPm+X6c3saUxVfE+4mzZX7QJ2jnnxltLNlvkLw
	QBXe/o5CoRy/M/fm8/UXsf12og7gGb7QotDPHXhjx6ZPgNEgNpF3zNSgJFHS8b9T4MFumWyy5jZ
	Haaca3Y5KpxoWNkcv35LPlxcGwin+cUbdAiUrjTosXMRukKRe/M8MmnoR3sOJEe5+OTS8Yn9UJy
	XYWfrWzjeFkLQqM76ugN10zMXVxn8yXptOGjibzw2afoygdhZS8wYe1JpNeDBQOkJp0GU7BJ+j/
	K5Q4uh4g2OIw==
X-Google-Smtp-Source: AGHT+IENGIldq5JqNWVYj879nv5c12Hu2gAcLXkQcT4am7WHRztg/K9ENUf9gRzRFcua+CJvdep3gQ==
X-Received: by 2002:a05:690c:4d88:b0:724:2cad:8df6 with SMTP id 00721157ae682-727f2ebd695mr176268437b3.16.1757598647587;
        Thu, 11 Sep 2025 06:50:47 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:45 -0700 (PDT)
From: Jens Wiklander <jens.wiklander@linaro.org>
To: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linaro-mm-sig@lists.linaro.org,
	op-tee@lists.trustedfirmware.org,
	linux-arm-kernel@lists.infradead.org
Cc: Olivier Masse <olivier.masse@nxp.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Yong Wu <yong.wu@mediatek.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T . J . Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Sumit Garg <sumit.garg@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Rouven Czerwinski <rouven.czerwinski@linaro.org>,
	robin.murphy@arm.com,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Sumit Garg <sumit.garg@oss.qualcomm.com>
Subject: [PATCH v12 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Thu, 11 Sep 2025 15:49:47 +0200
Message-ID: <20250911135007.1275833-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065049_285594_FD335ABE 
X-CRM114-Status: GOOD (  20.92  )
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

Add tee_shm_alloc_dma_mem() to allocate DMA memory. The memory is
represented by a tee_shm object using the new flag TEE_SHM_DMA_MEM to
identify it as DMA memory. The allocated memory will later be lent to
the TEE to be used as protected memory.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 85 +++++++++++++++++++++++++++++++++++++++-
 include/linux/tee_core.h |  5 +++
 2 files changed, 88 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index 76195a398c89..e195c892431d 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -5,6 +5,8 @@
 #include <linux/anon_inodes.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-mapping.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,9 +15,14 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
+struct tee_shm_dma_mem {
+	struct tee_shm shm;
+	dma_addr_t dma_addr;
+	struct page *page;
+};
+
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
 {
 	size_t n;
@@ -48,7 +55,16 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 {
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_DMA_MEM) {
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+		struct tee_shm_dma_mem *dma_mem;
+
+		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
+		p = dma_mem;
+		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
+			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -268,6 +284,71 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+#if IS_ENABLED(CONFIG_TEE_DMABUF_HEAPS)
+/**
+ * tee_shm_alloc_dma_mem() - Allocate DMA memory as shared memory object
+ * @ctx:	Context that allocates the shared memory
+ * @page_count:	Number of pages
+ *
+ * The allocated memory is expected to be lent (made inaccessible to the
+ * kernel) to the TEE while it's used and returned (accessible to the
+ * kernel again) before it's freed.
+ *
+ * This function should normally only be used internally in the TEE
+ * drivers.
+ *
+ * @returns a pointer to 'struct tee_shm'
+ */
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	struct tee_device *teedev = ctx->teedev;
+	struct tee_shm_dma_mem *dma_mem;
+	dma_addr_t dma_addr;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = dma_alloc_pages(&teedev->dev, page_count * PAGE_SIZE,
+			       &dma_addr, DMA_BIDIRECTIONAL, GFP_KERNEL);
+	if (!page)
+		goto err_put_teedev;
+
+	dma_mem = kzalloc(sizeof(*dma_mem), GFP_KERNEL);
+	if (!dma_mem)
+		goto err_free_pages;
+
+	refcount_set(&dma_mem->shm.refcount, 1);
+	dma_mem->shm.ctx = ctx;
+	dma_mem->shm.paddr = page_to_phys(page);
+	dma_mem->dma_addr = dma_addr;
+	dma_mem->page = page;
+	dma_mem->shm.size = page_count * PAGE_SIZE;
+	dma_mem->shm.flags = TEE_SHM_DMA_MEM;
+
+	teedev_ctx_get(ctx);
+
+	return &dma_mem->shm;
+
+err_free_pages:
+	dma_free_pages(&teedev->dev, page_count * PAGE_SIZE, page, dma_addr,
+		       DMA_BIDIRECTIONAL);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#else
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count)
+{
+	return ERR_PTR(-EINVAL);
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_dma_mem);
+#endif
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index b6c54b34a8b5..7b0c1da2ca6c 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,8 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_DMA_MEM		BIT(5)	/* Memory allocated with */
+					/* dma_alloc_pages() */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -298,6 +300,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_dma_mem(struct tee_context *ctx,
+				      size_t page_count);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0


