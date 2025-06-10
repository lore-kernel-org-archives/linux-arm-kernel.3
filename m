Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB5CC71130
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=; b=XP2sDo+IRXnQZNXslrZ2GFSAXo
	T4m/QZI58OtPSO/itNEXw9GuX6LNh0aXEblC0Ip0lEnvOpxwIeCGa9xxm98O+tKrsRdio9h/CNzej
	PZfvUyL4R3zaIrIlKlBetMBSUL4FnhikOZHMYV8BJqjsH44dWokA9SW/xKgN6ntTpGYRwrHrXkvgs
	viiNMU+fVCYBn25xpCdpJ6TBSOUHn6vGzSqgCZTnXXLbo7aETquFDP98gK45/akcMCVk7oE88dqf4
	sPDCvgNKK8mlTgS3vVKLSvZZqITmYYKPMDXO4c9/+f4s83XLK1SQW7/kd/iymR047onxOsx6FG55e
	MJIEaAdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Lj-00000007OU8-1Hhq;
	Tue, 10 Jun 2025 15:57:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyq4-00000006vVt-2XmM
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 13:16:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=; b=IvbL1aYSvj4s7DKxOLHXosb/g9
	khg8DvZptSVA/KgPZ3iKwH5ipvxsuygYNQbS9rHFpzjfhwEA9m9J0k1gnljss91tIg+xRYVbhwvsU
	lCRfML9201h+MwnqUQv0saU1WxM3sZtl2KXKgfc7DddIalVKDNc/E1r8LaYs0bgsQcTzOsybif/i/
	oHR4vIxImwD/qQcfIOwDTZm5kuEPmeKGTZh905qYq0NjaOeLsYmDDoHIQZ7nprMLCneRhInQsLVhN
	oZTrYbVKLT43o8kmMHnspSp//kmFrStrfVQwIreYzYwEsAV9J+ktdaMH9JRTuutWhOYksboQz8Utv
	hv8v7Aaw==;
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyq2-00000001qNa-0pvK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:16:28 +0000
Received: by mail-ed1-x532.google.com with SMTP id 4fb4d7f45d1cf-60497d07279so10997265a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561383; x=1750166183; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=;
        b=IoNKWmX694ISslu57oMRttXtY9hIBAfJEk21a9uGoGj871yfWGB4XugdylXdoM+fZD
         emIlg7YtXsYmwoK7ZEv+3hTG3VU3zmEL4B686lABvwBxgcojXwLwEYo3iGRLUZz6HLFz
         YY9/jr4Nqb+eQ6IKGUEzCeHGvE9F2fLXIFKlMEwUTnnle9lW+/YnwcGu1OblgEbwz290
         2aNKd9F2//epC3Io5QAPUUZiT9FtGL5+sqK6/IsyGzMfBDI8xj7jrMYYhS582Cqt9tbc
         GUOtSjGXU4Fc/4UBgm6s84XE1hdRDhV6FwQGBWyPL20knsMTPZ/8br8Vqj+a+TteIz8D
         ww/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561383; x=1750166183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eLopRTDSnVY9U0JoSkY1CPfa4nNPv8DwxUkmGK1mPDY=;
        b=cJARZNEyGKUaEa3KbnsAlL2G9BYg7FoG9J1dPLc/DvdWdzXENGLd/8q2oehjSi1+nr
         O/UkXlwFaQYpX6NaqjwZTZRfEdmfoyOgbN0GI06miGkpMmpRpvhLjsrN43sn2RUUEoR/
         VhQwVvfJL7CrUMHyie6TGfsG/5/z3v/bl14hZSxBmJrzaeXTX3TtlQCg5IvvY7cOl35D
         h58mWBH4tmWw4xyHlS9IGxGQWqqWOtE4ru3BSaYXfBDUJZImv41H/vNszK2ftI6ykEks
         Ut6u504bB5ooqGKAZeC5eRBc/B78l1CVYXiTvYxvLpJe1bxo/U19rhVIB6hz8iSbc0Gz
         Kdzg==
X-Forwarded-Encrypted: i=1; AJvYcCXBjbyAlt3Muu+Z5IKbJe8yGbyYg4aF0UeH2Dk8qOqvSkEgSLi1DXwxJ2EHojKzXhrRS1KVITkVYP2fOlPFa70r@lists.infradead.org
X-Gm-Message-State: AOJu0Ywja9db+u64v7CSU7VPUbuiqRz+WRFVkx+lWIkoDvewCj7Nz1cx
	eAQVPNjEBOzyxTq+tan37UgYcbPNZh8CKls3q/5oDaM+5AUkGTA7OGph14Ma+e4QV0w=
X-Gm-Gg: ASbGncvqa6o20o1SKx1NnByjeybTopR+OcLYeq2+2tEuLVeND6pSf527u9LBgHJBqIB
	Cgj1579abdKoLJUV2ebst8mRGe9cjvKPJHou9T4wRAbL73DjgMTZJ8t3MSh0S2Bomk//tqZ4Udd
	GhgAV/XARpz03Vk3zxLW9hLOrHH2EZ8ISTtQV8PcE9wU296GIKnyKcv2LrWLzwyMYQU9v2/DhD0
	/gB2FlKYWz5E9IvtHo9DyOTKPJJKO7jQfwkNHgJF4ei1RnZWAb6DeLbKpKkL7CDGoI9ENGPM39g
	xULsyTRPDuPS89lJtfSjPjrVbmaYJXHoDFv0siebD6uJKwo8fXtea78aWHlDV6Uq/2mXYhRXCAJ
	yr/K/yQ6xtj5B5JhJ48KcyQoD01IDIvELDlFk0KA=
X-Google-Smtp-Source: AGHT+IFyL5VC1uzluSvFg2VJoydHPgfSnA6phexiqPEMkd8jHiXUwY4vJhu2YNpEpylX50vqAtDFrQ==
X-Received: by 2002:a17:907:7fa2:b0:ad2:3f9a:649f with SMTP id a640c23a62f3a-ade1a9c8022mr1430120666b.42.1749561382805;
        Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:22 -0700 (PDT)
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
Subject: [PATCH v10 7/9] optee: support protected memory allocation
Date: Tue, 10 Jun 2025 15:13:51 +0200
Message-ID: <20250610131600.2972232-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141626_349018_FDC89017 
X-CRM114-Status: GOOD (  23.41  )
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
---
 drivers/tee/optee/Kconfig         |  5 +++
 drivers/tee/optee/core.c          | 10 +++++
 drivers/tee/optee/optee_private.h |  2 +
 drivers/tee/optee/smc_abi.c       | 70 ++++++++++++++++++++++++++++++-
 4 files changed, 85 insertions(+), 2 deletions(-)

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
index c75fddc83576..4b14a7ac56f9 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -56,6 +56,15 @@ int optee_rpmb_intf_rdev(struct notifier_block *intf, unsigned long action,
 	return 0;
 }
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width)
+{
+	u64 mask = DMA_BIT_MASK(min(64, pa_width));
+
+	optee->teedev->dev.dma_mask = &optee->teedev->dev.coherent_dma_mask;
+
+	return dma_set_mask_and_coherent(&optee->teedev->dev, mask);
+}
+
 static void optee_bus_scan(struct work_struct *work)
 {
 	WARN_ON(optee_enumerate_devices(PTA_CMD_GET_DEVICES_SUPP));
@@ -181,6 +190,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/optee_private.h b/drivers/tee/optee/optee_private.h
index dc0f355ef72a..5e3c34802121 100644
--- a/drivers/tee/optee/optee_private.h
+++ b/drivers/tee/optee/optee_private.h
@@ -272,6 +272,8 @@ struct optee_call_ctx {
 
 extern struct blocking_notifier_head optee_rpmb_intf_added;
 
+int optee_set_dma_mask(struct optee *optee, u_int pa_width);
+
 int optee_notif_init(struct optee *optee, u_int max_key);
 void optee_notif_uninit(struct optee *optee);
 int optee_notif_wait(struct optee *optee, u_int key, u32 timeout);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index f0c3ac1103bb..cf106d15e64e 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1584,6 +1584,68 @@ static inline int optee_load_fw(struct platform_device *pdev,
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
@@ -1679,7 +1741,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1752,6 +1814,9 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1787,6 +1852,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1803,7 +1869,7 @@ static int optee_probe(struct platform_device *pdev)
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


