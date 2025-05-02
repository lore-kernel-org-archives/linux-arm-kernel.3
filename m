Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA96CC3ABB6
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=; b=R9NE35YVxXpqETVWVvT8dD+rp1
	LLe1uzjNbbeC9E6vJkCwENkS6uv8WWirs1VyTT14kSP7/WvlUYyUxSu7HJlyZ075cLtE66Qg8wpj7
	Of8U5fPoKBlfZfXohek4ct+JivIAkaID+jHYpUIcV3ldqdnZC+hSOd81FjknlZg6FmZ3LoN9EShne
	mjtlfVJZ6y4A2qLYsYVSMVy0urh3s7YJ0FGDFmOLZJwoO766QVPHkpRqHFu3CReovg5eUqtNiTzOR
	cn3BUKBhZJdRPBER3GpnoBpiloJaXNSrCfKxHiM9I3EqvpKbqlzERQfWaJwhwASiljw/wAnh70pG0
	JDau4PvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfb-00000001a3A-1RkN;
	Fri, 02 May 2025 10:31:03 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCn-00000001St5-0JLs
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:18 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-aca99fc253bso286718766b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180076; x=1746784876; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
        b=YsZvLoAg/G+Aj2az/0NdkuK2Xa2waWbWwMKEfaLdOdAKZb0prowZ/zcW7Y6LF2JiOu
         v+UeN2BWnS1LpYibx36pfmRTCN9l/uiP2sp+1sJx8a4FCJGjBG/8Sp//4oww5iTLdxyL
         MsjGH3pHQi41VdUZNuNRC06T+GhqoCJlgYSgwlQg/e+WYVxsnSQFXWXKLrC2VXg/L7YZ
         ha8GyilWCpWah6+auBWwk3WdS2gsa49IGE7pvUvslzKUuavIEzJpT2W0Occ6TSODM1EB
         htyr1dJKCvAQVPoca6F15T6xi4j0gXc5mtqS00Uejp49y9fBRo85zSTr58A3qukT6xTW
         pWGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180076; x=1746784876;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aeQOjVkq3EBC9GxZGgQiApE4KnUvSm/cM8uXSgvbEb0=;
        b=wgq+CpzZZ7MTIixxnUZUg5J13N1Uho4V/nbYy796oZoxA6IMQ5u2mQI1zVZntjezAp
         73uokFJtXWW/XiqqgPGIzWwAKm89xUdcfrrhOPxj3r9+R27o6kJslhxmb2YPq70gITiR
         DojWtz24vIJlr/bBYnIbrf0QA3alNP96/UXqrMI/b4I21yBgNMWgXbh5E8cqPeCJTxE1
         1vkydOYP0liaUdV8j22tGNrOQZguOywv+4V3JV0weCBZlWeeKgrD/Tvjr1RfRp3YI91+
         Q3uJpwnyDDfTIN3UMbY6Ztl/KB0Pi6AuzZi5OrAoyhwqhTckMk5lzDFQBtbe3CUtSID0
         oa/g==
X-Forwarded-Encrypted: i=1; AJvYcCWL1PpMVUtlNd1DthiKL2T8MH3qf+dafPcITRpNblHdydmwTUEcW09b0kFcsROWsdUOKNKDE3xS1YTEaYDoD1hT@lists.infradead.org
X-Gm-Message-State: AOJu0YxEj4ccB5g/U95fTgh5tUmsP9pD8hO9AoWQgvaSCRUcsSS3iLEo
	dCCb/DrBFlDGpXYT+nR3WZMdKcuz7a1bnv1ERFvBawK77FflqzLGtP5bIeqISDc=
X-Gm-Gg: ASbGncuubMlRF2uTvG6fGZFjGvnXeDKVrQY/7EKjUe1CuGp0N6ACYlSIX0pYNPlvQQj
	T8vVUB5tx0N172VSmR+Uf/xjrIGn0qFUpBhfZJOPfpu+sHaw+Pdj8m7NwMTlWEkMLoPBRjk0B18
	O6cz/aU/Y76rDWoVKPLVjKGk7p+TGY9UTuXE5Pa8nSYGslT4MSmp41zLUbIHuMh5sYI0qhzRoRo
	COja1s9jbEVpzNt4v0xvmMyJJJ7SiXf6EVQEY2PERHK8QxV2gB52kkzsAkJJPtM7s/GTz73DHEP
	x1K9ujsLS0kcWNLtFrcyE7945BOruBnmsUr1eOpb2tUDcYUsQvmC3JEFW/kB9dI+oMwD0WNaBWy
	pLoPJYhbAGmIftgXkEw==
X-Google-Smtp-Source: AGHT+IFF9zknIP+dqaL1V+FMTT0LVPgHDeyr+aipRO30IcpUVrj2BVxgOIBN2MQg2BYB/rbfAelPxg==
X-Received: by 2002:a17:907:96a2:b0:ace:3c0b:1947 with SMTP id a640c23a62f3a-ad17ad39db1mr215652166b.4.1746180075654;
        Fri, 02 May 2025 03:01:15 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:15 -0700 (PDT)
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
Subject: [PATCH v8 12/14] optee: support protected memory allocation
Date: Fri,  2 May 2025 11:59:26 +0200
Message-ID: <20250502100049.1746335-13-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030117_122997_F18066F4 
X-CRM114-Status: GOOD (  18.26  )
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
index cfdae266548b..7acb43852c4b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
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
+
+		pool = tee_protmem_static_pool_alloc(res.result.start,
+						     res.result.size);
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
 
+	rc = optee_protmem_pool_init(optee);
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


