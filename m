Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF9E5C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:39:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=; b=Fwj9Tu4GOhb9FpVGB20IT+0Rju
	+QWDA4EzCwDA/C+rWoF41kgQ5DBaqQKdDWj1TE6POqu7qJGOi1hTaOcjXogkNRQQpuiozRqLMAgvL
	dZ+mPMpSe4oLiT/iZX6fLi8YH9HJNBSXBZ03LsY3E2IDftS7KKN9QHko/7PM32Pq6uwnFkFyqpQby
	2auH/Tpmq2jYF85ZFsZyi7SmTfH1W/0/AEuWTQdXzoQ6R9kS3Bpqsh/Ot3hH76CPaJ7166Bg1W+LO
	eG3Ql3VrEJnweMInZOLe2N5nUFvKrzcm6sepX1/uw99Hl8P2z8mII6gVzYAf2UCgbfum0MZov7Olo
	q+ZETs0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoxx-00000008DIF-30GD;
	Wed, 05 Mar 2025 13:39:17 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSo-000000087v7-2eQR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 13:07:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=; b=I1B+OU+ZvspPmXZVra1hjsZjBd
	Jf6H+bUZJ+fCycO/MvW2r28N6BBOQn2/i3av72aTQAWyw6OnfHsoy0Z2VhU8sBpWTU+i94oM8esw8
	9z9xpbjeubBIgXO2JCylPrNZ/cofgYkg+ifIDR97iKe8mKkvTYHDXIobQ14yFIlGiTft6V7vyw0Rg
	ff1RuTQZZvh0l3BvxGmHwJMkiy4CHCJ4xedbmPZc0rZS8RYL2epyCo2o0265w3Pf4f4XsGvB9yFIM
	n0QdEbi7tCTZAYpz84uI51HxYwh5M0hnogJ1ePpUOv/8T//jL1yT6jlM9+6wzP/qBjV/v0YLe+fRm
	pQCR9QsA==;
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSl-00000005Xh3-3Vj8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:07:05 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5e4d3f92250so9365302a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180021; x=1741784821; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=;
        b=YG0B9k242Z+6pUlUZ/sf4Z1q50e0/anpdWsZwn5TKbV0OeMxLyg9MlHPyExTO8H/sR
         qBq+YFUnZe31mj5Mp6nEuHVwy/wGHtsokR1PD4S2oqYuf3bIAgBmw2ybzjhOfBGVvbcN
         rtWuv7cQx2kNYi/+HUkHDuY2Ld130sAMVGiNUQgLfE8lIWGTE8tAUKtnI0rFafsZOo9t
         HoLarjmhPat6rSPMGnPj6j1AQvUoItxv7qhurg5SjuxRWILApjbC5/U67c+5uV9ncqyq
         uX53x+jV9QTHFxE/ccJwql559M6GS2wu08eWHybIPUKvt1M/G3jR0vUwKNQtnvOZ/YUO
         CZxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180021; x=1741784821;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GV+1CN9mTm6W0e8GwrPdwh4pOa9jooWXILMnvo8a19M=;
        b=MyEyRiIAo4uwv+cIuaEJ53IudE7BusRkgPBMYv8dgRBjWaV1wu2j5kl1MPCnmIzoO6
         P1PBUXVeYuIo+Ypkaye4zNtlP4/IENlshb948tRlDRBTfiex3wYc9uR0FkDKha0k7/H8
         mDZh7tadm/oJePYiorcsFIvEzEumoRfd8B3jv48mtag9qWLmGuHXW3Y66JTXLfIA7eKe
         +Y4mF6yQwNptprjLbz7rmGUqs5x+i3ik4VD6hy+xISTN6jLqk4ETwwb6463gQCfsiJa8
         xX80HrfzSQK9NHxlIapLbSpllFoX9/O7QgRhYQTD3RR6dGo6g0B8UfhS95UAeBRxLFm1
         7Xfg==
X-Forwarded-Encrypted: i=1; AJvYcCXjVoMnEngO+WV6IK4gmMECkVa2l4dn56ERo5G8Y5ql+uZIF14PfFJUS85Vtq3qvlEg3KHBkmmg8sKrEv7vCWQR@lists.infradead.org
X-Gm-Message-State: AOJu0Yz5MqIQbuirHQhmchbWNeqGa8JxKfk1huIDehmOgFhyrmsZQ0en
	5XU90eO60L1Hr39KoidulP9KcdWMSa3fo7VQBWjCPCjsDpSsezGALH1Juv9Ae3s=
X-Gm-Gg: ASbGncvyuKpobAWrTLAOwN4Kps+CvIcCcndYoTOJ91kVzaX3XtMldHbpgk7xTub+G8t
	5xAkvmM9eBMZx9QgV6so0CrU3E9qklJaTt7FsvqLixombBGyuuoydNmEDJtS+Vtbz0aRvBl3eMH
	mLt0WqPoIorI++boRQeJtwPwxOIQaLolRwcX3mFigLHzMpGvsc5/Z/HWI0C+2putDTNzSAIeayx
	j+g1KISCq0ylYC8mikdQGDKd0S+MmrVUNf0ubeuQKo/hi5b/W+ZBN5cWqusUdgC4qEEdUp8MtPf
	IwFC3gwel8rY9E3HvUdAPWcJhnC8QkE3AKv8iICjn73jCb14n0nOX+R8ks2V9JvqUucZOuDO8Et
	Kfp2kJN1Tz/cXD97VsEh3QA==
X-Google-Smtp-Source: AGHT+IFZCxWXYzGPaJ+Fpyr5pD44xJg3mO/vEGV3TFHnOgghMwA++b6wko/XdNnqusONUByGqiK4lg==
X-Received: by 2002:a05:6402:4302:b0:5de:dc08:9cc5 with SMTP id 4fb4d7f45d1cf-5e59f35eab4mr2661989a12.7.1741180021272;
        Wed, 05 Mar 2025 05:07:01 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:07:00 -0800 (PST)
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
Subject: [PATCH v6 08/10] optee: support restricted memory allocation
Date: Wed,  5 Mar 2025 14:04:14 +0100
Message-ID: <20250305130634.1850178-9-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_130703_907016_0CE2A0CA 
X-CRM114-Status: GOOD (  18.41  )
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

Add support in the OP-TEE backend driver for restricted memory
allocation. The support is limited to only the SMC ABI and for secure
video buffers.

OP-TEE is probed for the range of restricted physical memory and a
memory pool allocator is initialized if OP-TEE have support for such
memory.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/core.c    |  1 +
 drivers/tee/optee/smc_abi.c | 44 +++++++++++++++++++++++++++++++++++--
 2 files changed, 43 insertions(+), 2 deletions(-)

diff --git a/drivers/tee/optee/core.c b/drivers/tee/optee/core.c
index c75fddc83576..c7fd8040480e 100644
--- a/drivers/tee/optee/core.c
+++ b/drivers/tee/optee/core.c
@@ -181,6 +181,7 @@ void optee_remove_common(struct optee *optee)
 	tee_device_unregister(optee->supp_teedev);
 	tee_device_unregister(optee->teedev);
 
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 	tee_shm_pool_free(optee->pool);
 	optee_supp_uninit(&optee->supp);
 	mutex_destroy(&optee->call_queue.mutex);
diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index cfdae266548b..a14ff0b7d3b3 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_sdp_pool_init(struct optee *optee)
+{
+	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
+	struct tee_rstmem_pool *pool;
+	int rc;
+
+	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
+		union {
+			struct arm_smccc_res smccc;
+			struct optee_smc_get_sdp_config_result result;
+		} res;
+
+		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
+				     0, &res.smccc);
+		if (res.result.status != OPTEE_SMC_RETURN_OK) {
+			pr_err("Secure Data Path service not available\n");
+			return 0;
+		}
+
+		pool = tee_rstmem_static_pool_alloc(res.result.start,
+						    res.result.size);
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
@@ -1715,7 +1750,7 @@ static int optee_probe(struct platform_device *pdev)
 	optee = kzalloc(sizeof(*optee), GFP_KERNEL);
 	if (!optee) {
 		rc = -ENOMEM;
-		goto err_free_pool;
+		goto err_free_shm_pool;
 	}
 
 	optee->ops = &optee_ops;
@@ -1788,6 +1823,10 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
+	rc = optee_sdp_pool_init(optee);
+	if (rc)
+		goto err_notif_uninit;
+
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
 	 * the shm cache so that there's no chance of receiving an invalid
@@ -1823,6 +1862,7 @@ static int optee_probe(struct platform_device *pdev)
 		optee_disable_shm_cache(optee);
 	optee_smc_notif_uninit_irq(optee);
 	optee_unregister_devices();
+	tee_device_unregister_all_dma_heaps(optee->teedev);
 err_notif_uninit:
 	optee_notif_uninit(optee);
 err_close_ctx:
@@ -1839,7 +1879,7 @@ static int optee_probe(struct platform_device *pdev)
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


