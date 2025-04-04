Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F32C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=; b=peZeIU6tt/3lMs7V1g/cE5vJMR
	3rn/aQAXuFJcL4rNd/5jvaGRBjngO7BGQUr6Nl+pjOAEYWbBgcpvSMCVctDnliaa6ifAMloTmoeFf
	vY7OBddGmHrMozrId9m27tyGI1+jHiNBcd/6WP7QEC9+79b7KIwG1r/lFukKGQn9v+9GkZJPNUZQg
	ojYoreqtpByG/L0cpLvKwOTWgU0BOnOINlQiCjOnFdXckvVMghUQyfw4h7Pyb6mbWoY0uRjuqsW7Q
	8eAFwIQg23kGRIbd6IgTg8sMKjtC4keru/DhU87bLAXXaP7ppCDqzXtkpcZ0mpJU1q1CA27VhMrIy
	bimgljxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iLP-0000000C2Jm-3V8Z;
	Fri, 04 Apr 2025 14:48:31 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i65-0000000BzN0-1BLZ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:32:42 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5f0c8448f99so1201051a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777160; x=1744381960; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=;
        b=gRjJlsqmHnQGpvif967PvQv4L9BDjjA1wwPWRHWiAb5o9UTxyOevyO1eDDYCFsyevU
         q9fzFj0yevAKIRmBWjfRfe3GUxzSIOj5HLOjBm+niqkB8T9dtQsPCr05yBo3HPtLZZQr
         jRixuolaesr8agaPVfb8OTAJZEy0XFDVDiI7wWnvflv9AtS/3sXrjRV2ohOsj86BnK1+
         yNMzjvW/um8VIXvzsQQVlmgzM9tnzlZMuXhLZf0GcuNZbF0+ShoImUTtxuAv+hiYNmqU
         xtasnvS6fvNP2ehNLcS/H/Pml4nu6nKUffMEri8Nks0JhgQP9leorERYrOf0W18JCxzS
         r9Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777160; x=1744381960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5qo2YyNIySD0VmMNIZFqRKusBLbWYGLyvGHeWkP+bg=;
        b=Orr0ciec+extpLP2QP9d3yxRcb1goHIB1f0sXvHkpH2BIz8CguCcRISCHfvcdBH7dx
         lNXAY07J/jTllyTE1CSONC2Qo5tBekwJtUimB08hBd77ia1kBNJJPqgFlAQOVFiYXi2B
         KLqN47wDz68RL3H+fzt22aX7I8OA2H73ITbftIS7Tds6I7SxpUq2y5elC8I9GqygIHCr
         P1qo+Sm76gsGFO6Nn1vI8oy2w0rA06OrUK9HCiCrmKjKypF0IXHIK0uzHiLXwTnMRDat
         W1Lng7LD3D/CVP/E8bZQP0WjJH13MMwxS5qjqMQMrFqXdcOltZrE/Qg8j/XntfTecADI
         FIJg==
X-Forwarded-Encrypted: i=1; AJvYcCVxr2f+2npbvo9ySJzj+vxvpoffnQ3RPIsxSJRNLiuzjymLSNmmLSHSBOHfLlpKgGcQQhrbDNCmafqah/WeNPdn@lists.infradead.org
X-Gm-Message-State: AOJu0YzZKKkDNOYCAP31rVVBk41FsGAfh/RiHsmE2JZeE2RqzT20bl0r
	99k1GztfZAx9T7oCDmZPtnOxiRrNQmgKxB4PFbXCQr8VyUITX2nooAHBl7R9fSk=
X-Gm-Gg: ASbGncvqOrCFMNNApHyXFUJfz/n8Mcy+4s/hLLfkj5yHM5HGcNqSNQis/nJLaCTE9Wf
	gbp2z9J9hSg2UYjL4EJmjcnyDJApHPOUcjjUePbp854npbukRfj1VBQex9pVSeucEv4foda8dCR
	MOmJvTzSNsU1ab+hsZu43gdA/REuHlI8iw9tt96di5nqlK19IglJwig3/QxKD5Ip7qvJAIn5rDf
	gxx8NOgpe/4AwaC5G39Iqmjyiyr9o6VAREnwqp69LcHS1Q5RCO4yH1k202aQ48DFS37Epjngt+B
	CiBYCimMK2abOY3bRSNMS4uLqw/PGvp2EjSyDAq0j2Bssdtb2NJJyUjilGLkvkxNxa30lOaMRe/
	EyxYEyNHaiKOnS7kuZoeRVQ==
X-Google-Smtp-Source: AGHT+IEM2hKGK5BPtUOQZ2C93jlWGXwVhi6Jdx1BijC2kUctXxlRef+Ez6JQ6wrB5PbeK6VU5VkWDQ==
X-Received: by 2002:a05:6402:2347:b0:5e4:be64:b562 with SMTP id 4fb4d7f45d1cf-5f0b3b658ecmr2441621a12.1.1743777159861;
        Fri, 04 Apr 2025 07:32:39 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:39 -0700 (PDT)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v7 08/11] tee: add tee_shm_alloc_cma_phys_mem()
Date: Fri,  4 Apr 2025 16:31:31 +0200
Message-ID: <20250404143215.2281034-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073241_318894_A91242EE 
X-CRM114-Status: GOOD (  19.58  )
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
 drivers/tee/Kconfig      |  5 ++++
 drivers/tee/tee_shm.c    | 55 ++++++++++++++++++++++++++++++++++++++--
 include/linux/tee_core.h |  4 +++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/Kconfig b/drivers/tee/Kconfig
index 084bd794374d..53514cccd1c9 100644
--- a/drivers/tee/Kconfig
+++ b/drivers/tee/Kconfig
@@ -16,6 +16,11 @@ config TEE_DMABUF_HEAP
 	depends on TEE = y && DMABUF_HEAPS
 	default y
 
+config TEE_CMA
+	bool
+	depends on TEE = y && CMA
+	default y
+
 if TEE
 
 source "drivers/tee/optee/Kconfig"
diff --git a/drivers/tee/tee_shm.c b/drivers/tee/tee_shm.c
index e1ed52ee0a16..d6b310b4a5fc 100644
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
+#if IS_ENABLED(CONFIG_TEE_CMA)
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
+#if IS_ENABLED(CONFIG_TEE_CMA)
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


