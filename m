Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4396CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Sep 2025 13:51:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=; b=1PfjjXeJsItcUTCnI7o7/M7ncy
	JQ2rRr2J9gHJpvXWc/WyygQM2vrct22MmB7G8thqyeJu3nN1No1wGlAqSivW2etBcKMhx/Ddr/cpu
	FWZ/0gswal6mhkl8g+sanMTgUYRJvWSMvxEMstsKYTzjVIje3pPfik9Y/cVJmTXJytdFP7iYip+Aa
	XNZa1d1JHi6XvJvUoav+4xLMTiQjmJJQw7Aqu+vgDw+wwAKzL0ghguSZEmeD3Qp+VNGMsjRhLhUED
	a/Rw4tkvC7ZAjhehJhk+6pIekblSXVxh2LaJACIpPQAJECuPqPv2slhu+DS8bH74aMM+sEvhT3G+E
	WKbCv40Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhT-00000003Meh-0rzG;
	Thu, 11 Sep 2025 13:50:59 +0000
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwhhO-00000003MXF-1QqT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 11 Sep 2025 13:50:57 +0000
Received: by mail-yx1-xb12a.google.com with SMTP id 956f58d0204a3-60f476e97c3so421435d50.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Sep 2025 06:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1757598653; x=1758203453; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=;
        b=nSGMMpFUlXFtqUJ9s3/Cs2egqzpD8NhN5kpfDmxngzZRuGDL/1fdPhrdmJLy6sovKj
         ULj8hJA2LyUcoHK0oHZUpABNGTpNlVMb6lqX4woUmd/6yUXDQOpzgm0DGv/a6OXSZpBX
         oPG/MJ3aZIAq0yiN1bDA0TmMEUHuEbXVTAqMTmp/GwmhgYkm+mWeVihCS37UehYU8eQx
         W+oIOnvgg0ee1BB9qSiWm05xNjpBD3gpV9F4Uabc1iBRr2lgiSNyL6b7wKauoX+Lhom0
         bPh4rjQFdfkAlTNTHftZeZmMUgebV5IKpE4QIOe2Sn2QtmAGfbvy4vtpAvTo8DKX6J2v
         df+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757598653; x=1758203453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vA8l0L1pnbhQj/VVM6tv+d6BLx7uJN5MQdkMqAYWy2o=;
        b=l8qCJaiYNHeRUoQQPUubp98ZOP1g6+1di5C6ptZ839q6FWj5Ek9xZBwlXhZ6rDFDSX
         Pbnt3qJCjQ/6lYgxowNhSBJ+o0b64OrTIq1bzZtWLeXPhbCo20v+1NFIKM5Yk/I1FOBS
         9YE+tuT3C0Shrx7ljraYaKMBTL/Otlv8hnX3N+5CKn8FMHYv7C4vNt0zP0BmI/DLd0j8
         lDJxH4QdKbpLdbDSlsA09rk+y40KnYfnB/ZHNzRiMCP6GfcXHU7bmRFvqx6zmqbgwRH2
         Puf14cegXyJ7i6PFwzyYHB3xDkHLJComZFRhS9p0mB84Jl9H/P/fU3ikIjITiaTCbda/
         2DoQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkEF6SkKSEPOlzqeyETvmOtYjMzYtoW1VJvL+c2ADS6ufmObYyfGd8Y5B4Iq/OyuGhTcq4LqXJ1g36QgMHA9Vu@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4qISGu3AxrfoD5uhqY/eL6/S4DmfquNgl5GyC5fhgT7rYh519
	JM7p/C7K2tIihiyE6QEAdK5R/ENXGMl0YCpsItHaQJXPt25DRrQMqjm/n6RJBXGYdfI=
X-Gm-Gg: ASbGnctcu1s5w4t6xH23iuFoX8UVm//O2e6agbY8cUSVoKHnY9mxWcaE5+K0mVw/ft1
	MoYz+40Aw+8P0XkP6bADxDmwyWfroVAoj9DyMOUTtX7gXXTWkAf4G3LbW9EduQaYlLk3UFRC3G5
	vdUNqoli4LCs5o3CZvAzrk5vAk62d+yVAlTAF1hngbUPLZ8e/Qdfa27v2WahoHhX24XbGqsNOQP
	WK2ud2c7BgMAu2Uv4a6q1IYGD3BwN0FFdHWO6NbCFZNxFVEdI+KrQtu+SumxLQWnBfR6l0u63EI
	curSagvoxT73C1noGNDuM0DnM8pAnSDoD1K+RkUIsTIacFQSfEG7cHOCwciIMMaALPsRvz1pS7E
	dd+IbNoIRDaMRp9LT23HKThD7v+1Q6GQ5A/KB486FXM7DdKsTjHD1dJceUbsWP5lkPqZNYpiUhM
	I=
X-Google-Smtp-Source: AGHT+IFmdm+Po0P1++N5LtyQw+r4rWBFNbbkWpZkWUC8+P6AqlV0PH43L8/Dr0h9kNUYe7HQBV7meg==
X-Received: by 2002:a05:690c:9692:b0:724:bd2d:ac97 with SMTP id 00721157ae682-727f4d6270amr177781537b3.32.1757598652962;
        Thu, 11 Sep 2025 06:50:52 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-72f7623434csm3526257b3.11.2025.09.11.06.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 06:50:51 -0700 (PDT)
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
Subject: [PATCH v12 7/9] optee: support protected memory allocation
Date: Thu, 11 Sep 2025 15:49:48 +0200
Message-ID: <20250911135007.1275833-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250911135007.1275833-1-jens.wiklander@linaro.org>
References: <20250911135007.1275833-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_065054_659125_DA40DD98 
X-CRM114-Status: GOOD (  22.39  )
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

Add support in the OP-TEE backend driver for protected memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of protected physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/Kconfig         |  5 +++
 drivers/tee/optee/core.c          |  7 ++++
 drivers/tee/optee/optee_private.h |  2 +
 drivers/tee/optee/smc_abi.c       | 69 ++++++++++++++++++++++++++++++-
 4 files changed, 81 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/Kconfig b/drivers/tee/optee/Kconfig
index 7bb7990d0b07..50d2051f7f20 100644
--- a/drivers/tee/optee/Kconfig
+++ b/drivers/tee/optee/Kconfig
@@ -25,3 +25,8 @@ config OPTEE_INSECURE_LOAD_IMAGE
 
 	  Additional documentation on kernel security risks are at
 	  Documentation/tee/op-tee.rst.
+
+config OPTEE_STATIC_PROTMEM_POOL
+	bool
+	depends on HAS_IOMEM && TEE_DMABUF_HEAPS
+	default y
diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..49ccfe6f6583 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -56,6 +56,13 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
 	return 0;
 }
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width)
+{
+	u64 mask = DMA_BIT_MASK(min(64, pa_width));
+
+	return dma_coerce_mask_and_coherent(&optee->teedev->dev, mask);
+}
+
 static void optee_bus_scan(struct work_struct *work)
 {
 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index 9526087f0e68..4969b83a9851 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -274,6 +274,8 @@ struct optee_call_ctx {
 
 extern struct blocking_notifier_head optee_rpmb_intf_added;
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width);
+
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 26f8f7bbbe56..b4c007ed3b94 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1583,6 +1583,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
+{
+#if IS_ENABLED(CONFIG_OPTEE_STATIC_PROTMEM_POOL)
+	union {
+		struct arm_smccc_res smccc;
+		struct optee_smc_get_protmem_config_result result;
+	} res;
+	struct tee_protmem_pool *pool;
+	void *p;
+	int rc;
+
+	optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+			     0, 0, 0, &res.smccc);
+	if (res.result.status != OPTEE_SMC_RETURN_OK)
+		return ERR_PTR(-EINVAL);
+
+	rc = optee_set_dma_mask(optee, res.result.pa_width);
+	if (rc)
+		return ERR_PTR(rc);
+
+	/*
+	 * Map the memory as uncached to make sure the kernel can work with
+	 * __pfn_to_page() and friends since that's needed when passing the
+	 * protected DMA-buf to a device. The memory should otherwise not
+	 * be touched by the kernel since it's likely to cause an external
+	 * abort due to the protection status.
+	 */
+	p = devm_memremap(&optee->teedev->dev, res.result.start,
+			  res.result.size, MEMREMAP_WC);
+	if (IS_ERR(p))
+		return p;
+
+	pool = tee_protmem_static_pool_alloc(res.result.start, res.result.size);
+	if (IS_ERR(pool))
+		devm_memunmap(&optee->teedev->dev, p);
+
+	return pool;
+#else
+	return ERR_PTR(-EINVAL);
+#endif
+}
+
+static int optee_protmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc;
+
+	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+		return 0;
+
+	pool = static_protmem_pool_init(optee);
+	if (IS_ERR(pool))
+		return PTR_ERR(pool);
+
+	rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+	if (rc)
+		pool->ops->destroy_pool(pool);
+
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1678,7 +1740,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1751,6 +1813,9 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1802,7 +1867,7 @@ static int optee_probe(struct platform_device *pdev)
 	tee_device_unregister(optee->teedev);
 err_free_optee:
 	kfree(optee);
-err_free_pool:
+err_free_shm_pool:
 	tee_shm_pool_free(pool);
 	if (memremaped_shm)
 		memunmap(memremaped_shm);
-- 
2.43.0


