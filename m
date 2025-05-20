Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F32BC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:48:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bld2F8yZ54kGs1+iy6D0HdLuVG17oYynXY/XfJVpzy4=; b=oN4pdhHkJ5L5uuDx7NSlzIWSPy
	nHtKDp+aia8bL3HZpVFhNta1uak5rvAHESu1Sfwc555R/zNTnfw/zH8MUoFXrJS0F4cByYCkBAA5z
	HdO/YI1eAmORNyB4E8EyGq6EDsLzqNGeTAf3I3DDhXz/0ZkPRtm2ks1wfsbpKgKrviBkJGKXO/JkX
	SOiWzPLDSv7yb14NNfRjxIs9Lw2LU63912DacdtzFe6sWmexlXSXvoAofg1Bb65vWU4Ib2uKJiV8a
	s0s0UPO1erRmRT4Yqk36/nNVPTaUXTh4XVYWJiS3vzRwGF+2n8CqqZCddIpLsHk6w1yW6YIslzML/
	n5z7r9pA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPCX-0000000DP1W-3W2Z;
	Tue, 20 May 2025 15:48:21 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOpr-0000000DKRH-2H5O
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:24:56 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-acacb8743a7so952947766b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754694; x=1748359494; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bld2F8yZ54kGs1+iy6D0HdLuVG17oYynXY/XfJVpzy4=;
        b=FX1ONjvsvynWTkmeZ4tfRl7tS29YdanmRoLpOjVY2LT0JRPKp7KidgYJQ2C3JULc0R
         TqNdaMXrMHzgdDUCPNqAeB0ohy7TSfxaw1xR0I4kdXgnguPTcFPWwhoctnW7UOvji8A1
         EStvlAPPkCpmBDzltQ92PvLVmiBpFmm2Syu0U7qrGrRgHpfYGFImjmHyfPeyKu52gSgr
         6lxuYP8Dtif7Hs0/Iudejps8kdyiaDBxsRVUmrXxDv+FHtJ9G/E3Qmgprwe4LtOfMLbN
         Iab5M5ftVRVT5455YTYDCg3WlM+1+e+6QmMfx+zvnq7N0e6fRdMUSJPrm4kKLwhpuiX+
         7crQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754694; x=1748359494;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bld2F8yZ54kGs1+iy6D0HdLuVG17oYynXY/XfJVpzy4=;
        b=pLpmhTZOVp7I7ypsBUT+L7tSLOsOvx2g24mQThf9Zb27L/t+ObhvebqUJg6U7v08AX
         cn4GuEqnCTAYCFVyDyPNO3xj/zbBWV+XfidVS/KDCT3TUKk78Txxzl16q/JVdWxdR9C4
         ffPhnz+k7lml9ePVgyzkAhP8O1CRsDiUE3JoVnDoBC3e+8Q1TuXlm5gUZ0SgBdQij9J3
         Tkmwm1ynsRwV+kRg6Q62BZJE0JR/FU3bWcUICw625Q8qx3PdXfbo5luqaGJGHoMwTGN2
         x3crVpYb3Vrax9PAcRhaCJbUHC273TXwoQiB5imX061GqZ4eyXHXJ1a7fgLuIVjemobR
         yqhw==
X-Forwarded-Encrypted: i=1; AJvYcCW0riJ+iC7pVRy/lpOjXVl2f7mgakS0aCAoS/62d7a4xWROtd4laco3WjD7Hbu7NHLX2d09NpYytcCOs5dBeDtV@lists.infradead.org
X-Gm-Message-State: AOJu0Ywd6+Tx+QWqm3L1BOziv2+0xMEWVmfBi0kuu+1Toyx9nq/hRJhj
	Ib8BTBTtkzi18a46Th+Twc/1jmKvyzbqAELnAeo3/0r7RD+5zCPcv3f931ifUMKyF6I=
X-Gm-Gg: ASbGnctMWpgYhu3L7ThTxNsMzeugXh2cDIFUAnv49WhxTv44roplnsn0lwxg4tzBNSb
	piIpk/96/v7owrhwzdkM/L7dQt4cGt5oWdicllRTFvbAOK1Vmrl3ujeCngigz6uIPfXOs+rFSpC
	cqygLUyGlORaqDFh6V9Skw5NDmlBH+6ycz9WbOC0F+ct70UXE1Y338sOo2PtBBwg56RKGkUTXa5
	5AeogT1gEh/stYzsC7DWIB5KYbOVrbWrj1FFFl49yZ7GQc6Ho6w5V58D40VtOnToBcBs6R1ueeg
	aijWJOMfGEVulP52ySF195PJa3TetnDy7y77GUgrtolt0AIpJ/7aE1KbacqcNZvYYkno1g5UtnH
	qC5mD99X83eqWU6PIRJbPjo2RANPa
X-Google-Smtp-Source: AGHT+IE+oU//7EkaWaSVnBEAmENTiykO6EjOUBrIKYl9jX9zjcRr0m/0LP96+ZckH975FqdkGFgQKA==
X-Received: by 2002:a17:907:3e28:b0:ad5:2d5d:206f with SMTP id a640c23a62f3a-ad52fa567ccmr1750869866b.19.1747754693784;
        Tue, 20 May 2025 08:24:53 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:53 -0700 (PDT)
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
Subject: [PATCH v9 7/9] optee: support protected memory allocation
Date: Tue, 20 May 2025 17:16:50 +0200
Message-ID: <20250520152436.474778-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_082455_585346_9B02FAB2 
X-CRM114-Status: GOOD (  19.50  )
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
 drivers/tee/optee/core.c          | 10 +++++++
 drivers/tee/optee/optee_private.h |  2 ++
 drivers/tee/optee/smc_abi.c       | 45 +++++++++++++++++++++++++++++--
 3 files changed, 55 insertions(+), 2 deletions(-)

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
index f0c3ac1103bb..f3cae8243785 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1584,6 +1584,42 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_protmem_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_protmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_protmem_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
+				     0, 0, 0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+		rc = optee_set_dma_mask(optee, res.result.pa_width);
+		if (!rc)
+			pool = tee_protmem_static_pool_alloc(res.result.start,
+							     res.result.size);
+		if (IS_ERR(pool))
+			return PTR_ERR(pool);
+
+		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
+		if (rc)
+			goto err;
+	}
+
+	return 0;
+err:
+	pool->ops->destroy_pool(pool);
+	return rc;
+}
+
 static int optee_probe(struct platform_device *pdev)
 {
 	optee_invoke_fn *invoke_fn;
@@ -1679,7 +1715,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1752,6 +1788,10 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	rc = optee_protmem_pool_init(optee);
+	if (rc)
+		goto err_notif_uninit;
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1787,6 +1827,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1803,7 +1844,7 @@ static int optee_probe(struct platform_device *pdev)
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


