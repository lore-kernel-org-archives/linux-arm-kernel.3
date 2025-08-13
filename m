Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDE02CA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Twd7GfdaaubIhr0igmVjXFbwxXSCknyV61sXbYgmYh4=; b=YbG+dlr0FZb4Ou1OWLu4ZUwxnG
	baJWQCQwJ6J41eekVg7P404pgUM9jrH5dH+F6cVIqQbzjU10/7/NvKcSPMyJ6n4/po8cYvzkR/U5W
	tJ6jsOUR3Ow6fj469W/AnNNZ2awKMx6TglhHA15iRN98+Ofn9pcPkaV4X+e31FagurCbr/N7TAJ17
	wHlTH3VikcY41TckRTa48NCCelXCelOcPAPq3dPdtG9JAGmiF+FG/45iW6a2r6WLisN+m6dOjl57u
	K1BwE6CSJrGhRrro3ZMAC3wZPi7pa97SmvJSpvzJY4AcDyZs4sF4KX+uD3nPjjWKDeFAFI/jC8wHs
	RobexpnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4vF-0000000CmGl-1q0s;
	Wed, 13 Aug 2025 06:25:17 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4ah-0000000CjUi-0KS1
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:04:04 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-afca523e810so67193966b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:04:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065041; x=1755669841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Twd7GfdaaubIhr0igmVjXFbwxXSCknyV61sXbYgmYh4=;
        b=pz06t4j832pkxzES6iWSSwE11QIh5pdVTkwKKDWIaEcQIr5q0tImchYOZzymJOVJjI
         LYqpsQGVo5uKMswuVcoxBiJ0zFpgxWneuZfrfiSHR1PIQ6IMRLL7pDqJymv3YH7COZT8
         Cf4q6oPhTZyWN1gbJuKU/G1qHjjOxq7jULUcRAL8gsuJygPVuUq6O39UzokkVtBvhYbB
         QR0VpZXn6yt6NtIweebJKAzikK4uILbQdkFfiNNqrst+3wxTHptX1iby6f3xZNgXvePu
         2S5oiFpboInOBGNdzoNA4d0r2/0uZi4sczQrKodrFKACBCfySqJr+eAS3NWOQkzwrx1Z
         X1BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065041; x=1755669841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Twd7GfdaaubIhr0igmVjXFbwxXSCknyV61sXbYgmYh4=;
        b=oq3neFiXMqan0oh1Fo38XOSAGNWhQeuhLq3NoQ89UlMVGq674OlXJgyZ768lX83Vs9
         ua8q71x2nkSAfzByWiuKgmYWtpQTnBBxOuZj6pO3SQUjCD0lqO7S9AQs9I9Dzub6UKtH
         cBy3Hr0fIsSD30TPxyOaeyRBxBd96b+gEdtZQQLL53HYKFzhXfab0rmyYP8Cuo+P8txD
         1hR+X4R6/ZGDZUuByJRzez9YZqd2riXTOJ13MoacgYG4PgPTG0jA0e1A+Pl/hYa3N2N0
         CgeyNoBU+6xMcPkefSBKcevUoG2KR2yK+xlV9ZmEWmQIDIpRWkrUGKt82GSSrW3f/oj0
         sVSQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEugXr9GcMRXGwAnwqBLQhMD5Glob2TefMPHLNk+Q3tgPy1uToVoQXD6xXEmEylUxkvS7900hD0PcyyxS99XHL@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5DehXRK1eX906D/K8Zjydd4Dq/0REbhNp3iCweGishlXqdw47
	gqtEfvF5OgexHTa6Y3r60jIWP1evgGS8pTGrH/MTGwVizIf25z2wVxJV/YhHg8/gdMs=
X-Gm-Gg: ASbGnct+l+m0uRqHVDLcHnFnqu818f3rEx1NXE6R6Xu8aBsU7mA4vA71Dt8gukfkEsx
	D4uwEfK/Ueav3k5RZpO3PAND2uha6wY64rCOvHJDwzm2vYxDWY0ofkkkLXKat01wEBqPyvFARi6
	Rfc+o/oFBChv9gzpPQ8iXxYcor+OSB7pnYb5BwDORRK4UKSVaqORlmTFrUsrUU/P1u/dH63jg4O
	3ww2MCyOPASeZtW7dVISKmx+rhuirjL1SI1cVPGPtg+1n4wSEvCMA5kLx8ZnlMLjEfamf4FEKVD
	aU5QKFUYECT8kFD9+zzO+SlupB0pUwEECtdO8Hou3mYe5itm3mVtOwQpHaUGi3MgnVeG8Ap3281
	Dx8WU9pcrqh9WMYu43IboYoDSeRGS2rwDg0gkUCBsjyJ9h75Tt6aZElhrqdSgKwAyjFUnAo+r4T
	Q=
X-Google-Smtp-Source: AGHT+IEgbRmeLzHygurQ8GrbNyHN6Kt0VXzSY9aLiaH8bdOGe6I40zVx+CJbKLm6X6f5LwY4hBf41g==
X-Received: by 2002:a17:907:9629:b0:ae3:c6a3:f855 with SMTP id a640c23a62f3a-afca4dff310mr182406266b.31.1755065041198;
        Tue, 12 Aug 2025 23:04:01 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.03.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:00 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v11 6/9] tee: add tee_shm_alloc_dma_mem()
Date: Wed, 13 Aug 2025 08:02:55 +0200
Message-ID: <20250813060339.2977604-7-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_230403_121865_D0531421 
X-CRM114-Status: GOOD (  21.37  )
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


