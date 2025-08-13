Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3858FCA0EE0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=; b=HLb1iS/va1QRaitANSpyhlOCZr
	Z6e0uQ9exQwuW5sPJV1W4NFNDegXhdMlYllS/eUf3munZYigi8hMXTolcv6ijJ1pYZKwVn/0tMMzY
	SQai1BJKbr4Uc/R5Up813hIWf9g89F0Fg6KoHLLLrbvneG9ItTWLNwJNYqJiyYIYYPHf8BNpBSyqm
	PZgKroCEzcXnPoWyDT/WhjMshhGr5oL+35Kw3TTCz2yRVoD58rqTNA6x9EG3nvZnkdn0Mpp85/WIT
	gDQq5+LAW+knCjvWhdtuwjMu0hKeXXqnspQfV4BSkVsz/oIxXbRBNofzE446OiOqbFanxFvef5SBX
	+ZI8Z4xA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4xl-0000000Cmgs-1Hyy;
	Wed, 13 Aug 2025 06:27:53 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4aj-0000000CjWV-1vtT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:04:06 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6154655c8aeso8684519a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065044; x=1755669844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=;
        b=VPRZqkWHiigvLj3bNshNi5hWkhx4PBaJv2pTzaRgRpVADc/XKvUB3BYchj1Z3TfaXW
         dwqLHdpYshYK1mgD7p2jSPhi3JHbm6KFpVlzpEv4zipwpVl74zZFV3maHApDz3/PVvoI
         ftIKW47naD19/0RbRPPgJknjT4NAGhyWC31xEn/PnUC6deWpVptmddXG/KsrKLvzKpeK
         Uc3L4iDI8AI4XGj8uWEwTwq2bcUfhs3bSNewSPesVEPeWo0SZfCXLcyTX76qIqeTcpoD
         Bg/TjlSNildzs7iRhx9NkgYTTAKM23lkuqwLvNaN8yNMIHuLNaqz7eHpW4ypq66I3Re+
         uRsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065044; x=1755669844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mlsk/bAk7ySrKDp6zbKeV5kpDxvVSbwlV8t4Q8Bml4k=;
        b=XDtxdM40MQKixKX4gxMhcwuwtnQMi9ndjEaTL0/Ka0oxJUf4gwLwmVa3ts4CnZrJ/j
         oP94feV46DHXpZsjivi43Y2jMTpzJ/TMpyO96Pb2zBO5ozjFvmfiH4BiTj0HZY6XLiZu
         Ebm00vXc4AYubr7q3sikoDS+wY+7EsGnKRbbRfYk6hilBkOTuJ0Wqrp800d/HLRfyBRX
         o4IBPZYfMiW7M2nMX8cp2PGI3KdOFFq66XfUBBADBE13BKAPi3fFt/rFs4PTf+M4GcmS
         qTxkxCo5hrAdSAnNqS4KgTCgBsnqBBS9p5H44dUIbAyjVx7M2qi0enPQt4Ggci3y8zwD
         3/KQ==
X-Forwarded-Encrypted: i=1; AJvYcCWkTPPZQbNhB7AzgHStjaOmAG/KAj/oB5W96sMZEYVvZR5U3ZNJGKluBiQ3/jvxQ+QNtAe33/uYEcOxfL1Ma7+D@lists.infradead.org
X-Gm-Message-State: AOJu0YyhH/a/4YVeYFalucPwYj5U+I1L98xSw1cAS01TlF5p3Zi9cDuf
	swNzMCR2DQZmTxT3nc8b0crTenF70sQ8onPucAF0St5Jc8zFGj/zyGXTd/il/CABZG8=
X-Gm-Gg: ASbGncsM63pJ3CLOroCcKcscplHdE9F4Zs0l4XNYcgWFiuQKi/Kxd4VH6UaBKP0QXeX
	vFpZXrTjypwGPki72lX01o3mTqNES69o3xbg/CU1ch3gL5TifLEHfIAih116g6FkZ4wv5DBKyIM
	LlSNYs5S+e+Yb17JgptV2nqrOhXPfMoaaWmpypiTz/2NtlVhfsxUYkNEmk93DvsdGgQOwwXhEOn
	nWMcSZ08Z8utH1kNEmUXbtRU0hSyVAMYoRxJgHfWUJR4qB1T+DqC6SXFor9K3YVC13qGXZTE5LG
	L4UIQ0heToAwS9zjDQ71wIHpZNwKZO39uovhOm4ZKBdZpMMlepIrPZbBY0NpjWXmJKnyFezRise
	y5jt0YdAho/OsH3DSvOh5Er7wysU1+SwjVi7HkuJ8/mVKI1VrR77gZD8xkNY2MUOzFs+RfXQ/ev
	w=
X-Google-Smtp-Source: AGHT+IGPP3R6N4Dt8iwgkksibZ5tUqdsMY5R2I3knc3e7zzNRFbaVSRs5R96bdCj/pA/8Zc73+XZ0w==
X-Received: by 2002:a50:8710:0:b0:608:50ab:7e38 with SMTP id 4fb4d7f45d1cf-6186bf92a89mr984962a12.14.1755065043966;
        Tue, 12 Aug 2025 23:04:03 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:03 -0700 (PDT)
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
Subject: [PATCH v11 7/9] optee: support protected memory allocation
Date: Wed, 13 Aug 2025 08:02:56 +0200
Message-ID: <20250813060339.2977604-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_230405_507995_A63E6854 
X-CRM114-Status: GOOD (  22.88  )
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

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
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


