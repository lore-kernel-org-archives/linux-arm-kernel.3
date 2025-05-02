Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD650C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=; b=1AMLaWpuQMrE7dqC4V1p2UP9G2
	aPTkKhCR4ls8vU/t2DdnPRratFbGsDnVfEwJtJE4FoNGgs3Z7YmtIdyHS5//D8m3XgkaOm+reNWJT
	1Xez1nEV0hglhkWhEYa5RkL/j9OQneEiiodrrF+OG+rKB8hfQ46lURaq1gOCL8Rw4/6DEnt5zmGEM
	Vk194RgQ2mX8Y+bz14y9YBV7UN5WgZZQL/mjGuqWj6mkPCHncXm4+TobY1WoahTDsF5pXqD87lyer
	lRjW6U8ECRNEjIlkFQG+uFlSa0gKV9Y9AaJYdFkJ6gnJP78zZDfoRY9wAE0LKXQM+5UkPH8JmpzmT
	uM3p+mqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfa-00000001a2T-3L9g;
	Fri, 02 May 2025 10:31:02 +0000
Received: from mail-ed1-x52c.google.com ([2a00:1450:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCl-00000001SrA-2dSK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:16 +0000
Received: by mail-ed1-x52c.google.com with SMTP id 4fb4d7f45d1cf-5f7ec0e4978so3558328a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180074; x=1746784874; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=;
        b=EejpfvmVPRyUPa5WSLMUcwIWO3QfcjkI+TVP35SgN9O32e2oWK7yYl49VWQTIkNPLZ
         xsm0fwMX9eAfk07jfg1MZ+vXvzI4AqbwgxJ4si/6Pul/OklqH6I0nbqUH2Qk29qWf9q8
         olH4qVV4vBDqJvfG+39islrIWbxv7f20KD0dcit2tJLThmjbkjNQUvrs2MkUgwa5RBQT
         BlQHh0kpKwXlvf0bYLr2SJDqWeQoEQrcEKeN5+hq/Sdv4nY3SuW5vDnkttdk5S/ClBle
         +u+NiiCtlEkZ1Ig5g8Drjn6l4JLePwIDYe/Mq2aCPS1CX4cvkLf3RcC0b2gNNDd536LQ
         Uj/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180074; x=1746784874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JHc/i2uVCttA+F6G/pvXVydhhQiLzwlzjcfTEmJaCtI=;
        b=ZZTcYTK/8u+l5lmDcd4bps88GTmccdbY25hKNTNQmm0z7uheBusXzGZWxiLBaaHi0Q
         pSemY/v6ql2YKSFeA1eSi2mxDOb1nzpqz4hJVg52fQGDdVJzWtdjNRqVd4UKASg3kcc4
         Ec6zeD+pkSBhiya4DMjyHGi5Pq7F0ZQSBR6hbJC6fk+mRAO3PRNaOx6PqWKImdSTiHOC
         pYFVNouUvd43ISd1NkYtOwCk7IY96UF/IofzZwXbyZv+iGpoEoGquBW8spci/GgWWPJ+
         NpC68bP5u+o1PA60wxkY2p/AZ9bDqEHT4T8kjq3uMT6feF/S1mGPcAF0LhOwgVB/nKwa
         dKKw==
X-Forwarded-Encrypted: i=1; AJvYcCWs9QW9mthOtI4fDjOtJYvYy7q+jKUXNhV+Qw5X4LUiqf18hYUGG3SpvvT4q7PUqjvp0O29+qtTwvr3Vli2NSts@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq4Pi5Snvlv1N57TWdKcDKyOaSUc3ooXK2F6Pb80H2Ne8GWgoc
	Aj0YiJP2xHPOpJHzIvDesYSIpwWLlRH5m5Abq1kBE7qKz6685DuwVSp3x3yIJPmmuO+f0nEi7en
	Y/BE=
X-Gm-Gg: ASbGncs9zJwPyAokE2xFVRUW6UTchnotIMaR6NTZ4+7izoLFoBCI8vTVGK5/5A8ybN+
	Zc4CAvDI7CnNO58Q6FGXAwWkCll4H65ycOMA+UPNb9cV2B19Nc0pusGUc1E8V+enIxk6S+VHpDg
	i7yzcPlqjb1x8gr9OBCVxlgWzS+p6EVnXmjGPMMbM5Hpn1bN+Umz524ZZT4O5QPoVR0YjE2dQjD
	U1Gi/g2pXzlzp+jUEsi+wv6opXdc1eOxHMsHwDm8+2QUrRT8m9xoeVXblFQGMDwRUwFt0nEYKRS
	3keGUdGww9PTr/Bs9e5AVIxi8e+oSqz3NHsqZHlc/RaLO+rq+8H8X+8kTxsf0Nndt3C6il02Ubo
	lHvFCjoD3PSf8a6TqFA==
X-Google-Smtp-Source: AGHT+IFOsgLF6Acl3Dnu+kY+8WzAAhOB09Jk1srS30TZnn+BAtVaux5M4/L7RxPQOkhdypP2FHq2bw==
X-Received: by 2002:a17:907:da7:b0:abf:749f:f719 with SMTP id a640c23a62f3a-ad17ad17aa7mr211271466b.7.1746180073795;
        Fri, 02 May 2025 03:01:13 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:13 -0700 (PDT)
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
Subject: [PATCH v8 11/14] tee: add tee_shm_alloc_cma_phys_mem()
Date: Fri,  2 May 2025 11:59:25 +0200
Message-ID: <20250502100049.1746335-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030115_669947_20F43678 
X-CRM114-Status: GOOD (  19.16  )
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

Add tee_shm_alloc_cma_phys_mem() to allocate a physical memory using
from the default CMA pool. The memory is represented by a tee_shm object
using the new flag TEE_SHM_CMA_BUF to identify it as physical memory
from CMA.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  4 +++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..faaa0a87bb18 100644
--- a/drivers/tee/tee_shm.c
+++ b/drivers/tee/tee_shm.c
@@ -3,8 +3,11 @@
  * Copyright (c) 2015-2017, 2019-2021 Linaro Limited
  */
 #include <linux/anon_inodes.h>
+#include <linux/cma.h>
 #include <linux/device.h>
 #include <linux/dma-buf.h>
+#include <linux/dma-map-ops.h>
+#include <linux/highmem.h>
 #include <linux/idr.h>
 #include <linux/io.h>
 #include <linux/mm.h>
@@ -13,7 +16,6 @@
 #include <linux/tee_core.h>
 #include <linux/uaccess.h>
 #include <linux/uio.h>
-#include <linux/highmem.h>
 #include "tee_private.h"
 
 static void shm_put_kernel_pages(struct page **pages, size_t page_count)
@@ -49,7 +51,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_CMA_BUF) {
+#if IS_ENABLED(CONFIG_CMA)
+		struct page *page = phys_to_page(shm->paddr);
+		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
+
+		cma_release(cma, page, shm->size / PAGE_SIZE);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -306,6 +315,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align)
+{
+#if IS_ENABLED(CONFIG_CMA)
+	struct tee_device *teedev = ctx->teedev;
+	struct cma *cma = dev_get_cma_area(&teedev->dev);
+	struct tee_shm *shm;
+	struct page *page;
+
+	if (!tee_device_get(teedev))
+		return ERR_PTR(-EINVAL);
+
+	page = cma_alloc(cma, page_count, align, true/*no_warn*/);
+	if (!page)
+		goto err_put_teedev;
+
+	shm = kzalloc(sizeof(*shm), GFP_KERNEL);
+	if (!shm)
+		goto err_cma_crelease;
+
+	refcount_set(&shm->refcount, 1);
+	shm->ctx = ctx;
+	shm->paddr = page_to_phys(page);
+	shm->size = page_count * PAGE_SIZE;
+	shm->flags = TEE_SHM_CMA_BUF;
+
+	teedev_ctx_get(ctx);
+
+	return shm;
+
+err_cma_crelease:
+	cma_release(cma, page, page_count);
+err_put_teedev:
+	tee_device_put(teedev);
+
+	return ERR_PTR(-ENOMEM);
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+EXPORT_SYMBOL_GPL(tee_shm_alloc_cma_phys_mem);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
diff --git a/include/linux/tee_core.h b/include/linux/tee_core.h
index 02c07f661349..3a4e1b00fcc7 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,7 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -310,6 +311,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
  */
 struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align);
+
 int tee_dyn_shm_alloc_helper(struct tee_shm *shm, size_t size, size_t align,
 			     int (*shm_register)(struct tee_context *ctx,
 						 struct tee_shm *shm,
-- 
2.43.0


