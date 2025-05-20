Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AEB8C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H9bqG9+FY1UYb3Wsp/cT6aYcX71LorBFFGZU3csZ2OI=; b=A6/jNISCtSpv1i1TykM7dYktxS
	uibhResB+SP7YVoCkIiQzVgszcaV7WmwXOEc1u2X2IlnNytZxisSZy/3tULm+oX4EzTiY0iqxOBhR
	Vsvatqh/6dC/WdTGrIO6zk7y8VEBbNxDx3xGHEM7mVIJnrOajEyT/FZ9jxcM8k6uY+tN/Ihyjcw9t
	z6BPZEpDl8xqEoaQ72tJjKljyBRQkImyu0Hsny8vwS0JLt16ib5627syA/zxQxEqbVVwBPRXOLeB0
	YLbgabec7sA12/krqQkySXVTxJn8BQ/n7LcX4dteOthGxoccUfN+psXF23BbNhH2cvCadMH7+Cu/P
	N+RVyRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPAT-0000000DOk1-0Gje;
	Tue, 20 May 2025 15:46:13 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOpp-0000000DKPc-2knW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:24:55 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-601ab204085so4987086a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:24:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754692; x=1748359492; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H9bqG9+FY1UYb3Wsp/cT6aYcX71LorBFFGZU3csZ2OI=;
        b=QdsKP/gmcN2eDIPlIau7lPWSfRg7n1NR8eM+ja/4ZWt01PnxZRoYX95NwWIijzhIIw
         cUuuSm59k/J9QnqT7BP3nDJjS82z8zyVTnSnSqAp2DlSnH8vCaFabqSfBfipuvjijIJz
         vuf58yrcPk9eLp7EGsPx8WRkoG2dFJQIskEiixzyMYX6i2bOB+QQeF9iqAXkafWdfyPv
         Au3FKCkrHc54UC+lq/b+e3WERnM/YlcjxXdpeoUlsml/6IcSHclmdwfmSAD2uqQ3bV4R
         yhJ8kuvdG34E0eyEzXkyGqM7MBAJFfmoKgcv5E/PFRx4WDagaGVwg0WKiT5ujaXvFZxE
         SYuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754692; x=1748359492;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9bqG9+FY1UYb3Wsp/cT6aYcX71LorBFFGZU3csZ2OI=;
        b=UmB4mf+8Pa2P01UKQDluPi2gfAybNgCTQZUySeSsnJ0cAR3mZFoYxU/chFnrNxJ0Uy
         iTf6PleQGr7DXQUpO842xRMsHc8s5fLWSBw/PSh8T9ANz4DiBXarYUzKJfKqFgrFHW0C
         vvDyeREzBxoCJnOGfoFI7DAE/qZ1QvvHvyk6aFnzwZ6DxvvgJU0TQDMX5Oag+d3+nSVo
         pIY2iUNIfQh/1c12BwVifg8vJ8VlXz5r2N+aMuKMPliE3jomD9I1o1M0GKXHkl/6Yct2
         u4pbYgvLZPLyt57wRihf7as5Q/M14y+bAY/nmWIkd+5/JfUUzn74X1tUjBljxg/FJ+jn
         pzcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWfVm5mLqi+j98DrnvVEYrZXkmbbxHTpxUeRQ5U14WGbJr1DLr1LVZyFEG89lC48qwKtmrFbrGEjlZJDXo1m5Hs@lists.infradead.org
X-Gm-Message-State: AOJu0YzR8E8tcJBA8p7f+x88cfmHC67oh3Ek4fF0JVbYyv41lOPCIj5h
	EXDzaJuk6wy7jPbDZ5ySs24Qdn7l8xjibqvzl8Rmo2Fzd0DC7QGywUVW9eqdd8SHadE=
X-Gm-Gg: ASbGncsazcdhZX7ufZhkCmtE7eAK38tcVgqEjpU9qRu8JTe2rvzIpf6zQwH3kLWIEZH
	Ak8HHxXm5Uh9dumGxy7sqaVJkcIgnLqGGb7/QVJBctAN8xCrVaSOe5R86xEMUzGTvOyHWOev0AZ
	b+lc+3gftp95QuzmwNoxVBDXDDe0+K+V9lHsdRXd/y6sxhNjKo5Grvy/V1ifPwPMObhSak8cJr/
	8P6f9pnglpAgLz8quUAUkOnl+iflvFtnVnNV2ZRR1Wh+neHQQKF1PGt2mTWVljoKBMay8fPdmxH
	axvtt5j1aEyviLyHE3zWjG2aSM+GyeAeQvhRcKvIiLeT9uXKGBXG1z3NAy1JyLJ1Ag3AD12u4+p
	qweeALB3cj4a4YLRW9EkBtBKvHu9K
X-Google-Smtp-Source: AGHT+IEay0lpNaMna8ydFORY0Ydz8qe2TYsU808eSaVF10SOGUbOLj9dQy57Mjj/FmGfKZnazPsAlQ==
X-Received: by 2002:a17:907:c21:b0:ad5:1b14:15f4 with SMTP id a640c23a62f3a-ad52fbfa34fmr1326687566b.25.1747754691997;
        Tue, 20 May 2025 08:24:51 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:51 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v9 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Tue, 20 May 2025 17:16:49 +0200
Message-ID: <20250520152436.474778-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_082453_737221_D059164E 
X-CRM114-Status: GOOD (  21.56  )
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

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 74 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  5 +++
 2 files changed, 77 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..92a6a35e1a1e 100644
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
@@ -49,7 +56,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_DMA_MEM) {
+		struct tee_shm_dma_mem *dma_mem;
+
+		dma_mem = container_of(shm, struct tee_shm_dma_mem, shm);
+		p = dma_mem;
+		dma_free_pages(&teedev->dev, shm->size, dma_mem->page,
+			       dma_mem->dma_addr, DMA_BIDIRECTIONAL);
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -306,6 +320,62 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
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
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 02c07f661349..925690e1020b 100644
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
@@ -310,6 +312,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
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


