Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A2C0C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=; b=JqFtfBHzEt6Iuc8zh3wnONUbmW
	Z6RmbKIlQKrRJ7/p2FHfk9fZnid0ge92B1Is779mvV3qFlFrTMYVnCboa1r4CB1jFHQv6QeKAahPV
	f+6zmJB8OtRoYGUiyY8lTCmIGMKUGQwlz03u+KCSPStLzL1hBUx1o3qUheMI0DrWLrlJQmMnuPmdw
	YH2KlszHLP9TnKM/ytBTWyXR+Js6Bmnz4/dVtICidZECszwkBGVtpwYNtPHHC5+Bkl2vJKtKH9Eod
	SG+ek+lLvLkmACOfNAr9dqbsfIY2Pvb5FaAzfO3BirBc8lCliDRw/UccmCwj1tC+iSKUIiO8QBN7n
	xLb0JqLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq3A-00000008P8D-3k9C;
	Wed, 05 Mar 2025 14:48:44 +0000
Received: from mail-ed1-f50.google.com ([209.85.208.50])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSj-000000087to-1NRw
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:07:02 +0000
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5e4ce6e3b8cso1311685a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:07:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180019; x=1741784819; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=;
        b=LyRUUiT8qpEbHz3wWp44CnXZ87VdXozZTB4OaNOtwkkf1GpiPgAZKYMAPxVFbftkmw
         Ss1YjtbUVHVjU3L+gjKcaqXk64NkCyZkGt45XgZDd+RIA8hNgJliDo56zdamKCsLaFU2
         vOrv+/XW9HcuDtH2Cu3DYtAb8/6BFYrRgHVy+hJ6I80vSY4Zhz4GgjYEM8OcaqsepAKc
         +O4GotTj+IBAGyHGlblS1R5qhnLGUbL9Vx/CKTQeIKgJye4/X1Hbw3E225u0aB2i0tOX
         U0gywClyzZOr77XZY9ReSdzAEPtaFw22h6XjXgukBJum3WOLMRfAwMISC/YxdiLXadOU
         5nOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180019; x=1741784819;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+6L88VawgT5clB6S0hOB/yQKL6Af309OnWxwlD6cmBU=;
        b=OAi1ipOiivXGlx6EzZLII5Vg9ROXa+iKRfzTpxUxY7Z5OBSQdCzHVmjgz1W1qWwzhn
         CPcx8XA3OdAyccIQDZEU7GknXgoz0sFTVZc6IbCdrU1qE7jM2UG2pvc0pVeXzYXgjZwV
         ZZRRl/LAJzg6PujX+8x25inK509J4e7pu4aMZqFl2kZDIWrFI0BIH2ThmmuYYhRYRJ3s
         Gdty+Xw64OVz9wUmXZ5jajgpA/2ypgqn6qnmSGKrutpONUWZffyHgiQMZBG0jO1/LVdM
         SXGO8NLfvbVEnYVLUIZyToKcN5wNxDY9f8H7ggLBNrk8abI5HZTvvQcvp6oJ5tDm9bWd
         YScw==
X-Forwarded-Encrypted: i=1; AJvYcCUXqR4YJzZsii+iO2Z7oSeQIRzgS3hzS16Z10SbnHR4IKyXALlvOoAQ6u2P6F5cF8GzYRbH9MAeoVB1JpCgwmcE@lists.infradead.org
X-Gm-Message-State: AOJu0YwB1Rj4N/mQtnY8mq0pHxvnz96OfzjG2eLtbFG/Q4EJVWn83jLt
	nHh5A/gai4FYK8eVZqZvvCO1RrzVgDf1vh0arqhoh/kQvz3Utj6z2PPgz4nh9h4=
X-Gm-Gg: ASbGncvVwM+mvsYbmsY0IxLeyarYvu/JIKL5hZ+91n/cHkFM6IQHCyOfKK1vXvlQ8vE
	+8Ei/yAT/W2w675TSi53AXLx5gr+jPxLBwVk13vjeWvHcuycV0eFOFqivsE5fg2sxbk1WyQs9gJ
	A9luXV9uDApEFKAkb6Giv7fDqxSEqrAc4nKD5QhsqtMw9z4cdlxOdwH5aieRCatlXK198Jfad0s
	+5N6cVuJyJuz6IjWuOI9d7tBbqMpXVECO6h7NHQqZ13tM2UqG5YCQ5KwEhWMtRnMBkKOoJL1UDQ
	lKRcAhFI1ogIwUPorfLhpenOPL9EuqaQIl7E/yFlupJCVW84dAgOO99c42NkDYWYCMqw6Jh2aa0
	m4W9TV5U34gVgM6OOkNfJug==
X-Google-Smtp-Source: AGHT+IEAmgkcE8RyjO1pJJHrKqdAmUGw9vFkZJI7+m0/4SoKqcFz7yQm/3SS6AjKMMHXW07x446SxQ==
X-Received: by 2002:a05:6402:4309:b0:5e4:d52b:78a2 with SMTP id 4fb4d7f45d1cf-5e584f51077mr7080244a12.15.1741180019316;
        Wed, 05 Mar 2025 05:06:59 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:06:57 -0800 (PST)
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
	Sumit Garg <sumit.garg@linaro.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	azarrabi@qti.qualcomm.com,
	Simona Vetter <simona.vetter@ffwll.ch>,
	Daniel Stone <daniel@fooishbar.org>,
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v6 07/10] tee: add tee_shm_alloc_cma_phys_mem()
Date: Wed,  5 Mar 2025 14:04:13 +0100
Message-ID: <20250305130634.1850178-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_050701_367298_775CE202 
X-CRM114-Status: GOOD (  19.07  )
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
index 8b79918468b5..8d8341f8ebd7 100644
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
 
 /* extra references appended to shm object for registered shared memory */
@@ -59,7 +61,14 @@ static void tee_shm_release(struct tee_device *teedev, struct tee_shm *shm)
 	struct tee_shm *parent_shm = NULL;
 	void *p = shm;
 
-	if (shm->flags & TEE_SHM_DMA_BUF) {
+	if (shm->flags & TEE_SHM_CMA_BUF) {
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)
+		struct page *page = phys_to_page(shm->paddr);
+		struct cma *cma = dev_get_cma_area(&shm->ctx->teedev->dev);
+
+		cma_release(cma, page, shm->size / PAGE_SIZE);
+#endif
+	} else if (shm->flags & TEE_SHM_DMA_BUF) {
 		struct tee_shm_dmabuf_ref *ref;
 
 		ref = container_of(shm, struct tee_shm_dmabuf_ref, shm);
@@ -341,6 +350,48 @@ struct tee_shm *tee_shm_alloc_priv_buf(struct tee_context *ctx, size_t size)
 }
 EXPORT_SYMBOL_GPL(tee_shm_alloc_priv_buf);
 
+struct tee_shm *tee_shm_alloc_cma_phys_mem(struct tee_context *ctx,
+					   size_t page_count, size_t align)
+{
+#if !IS_MODULE(CONFIG_TEE) && IS_ENABLED(CONFIG_CMA)
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
index 6bd833b6d0e1..b6727d9a3556 100644
--- a/include/linux/tee_core.h
+++ b/include/linux/tee_core.h
@@ -29,6 +29,7 @@
 #define TEE_SHM_POOL		BIT(2)  /* Memory allocated from pool */
 #define TEE_SHM_PRIV		BIT(3)  /* Memory private to TEE driver */
 #define TEE_SHM_DMA_BUF		BIT(4)	/* Memory with dma-buf handle */
+#define TEE_SHM_CMA_BUF		BIT(5)	/* CMA allocated memory */
 
 #define TEE_DEVICE_FLAG_REGISTERED	0x1
 #define TEE_MAX_DEV_NAME_LEN		32
@@ -307,6 +308,9 @@ void *tee_get_drvdata(struct tee_device *teedev);
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


