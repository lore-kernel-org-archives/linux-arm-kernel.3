Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 285C9C3ABB8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 10:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=; b=bwbMFJpK4fq1ecN+xStKsmfb7c
	HyIR9MYCbi2ujPVifIPo6QxEVxEb2ygIhokg39eShKCriTDiKc6e9719hOANsSx54BFvUkfFvtVbb
	xlj3kcFPfDMnRuyqfDfJiGzNa0fSS7CBB7O3Kw+EqraA0UHneL6San25KbCujw/5SrkvgGxdSSCZT
	+R0E2X38YwYjnwY7pgUmJ1EyLpabXfAADer9iCwcJku2DlIRNzgO3Q3P3X/pXBuUsugrUcR9TNJ44
	dOe807K92DtElNsoAQDo9d2pABZ6pHFJpsaMR/PWEstbq+VmaM1KeG6IgRx1xiX8d91AiN5U8ex7E
	Wh8AyHbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnfc-00000001a44-1vko;
	Fri, 02 May 2025 10:31:04 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAnCr-00000001Svy-21DK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 10:01:22 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-acbb48bad09so323449266b.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 02 May 2025 03:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746180080; x=1746784880; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=;
        b=UYWmNvEceMSlBTzT+0jOPxoVPoR/EEECSHeaJh5pq0HEEpNtvXMKRQKhu3MBMsuKBL
         28tsGf5zTUPrx4EZPjGMBX/wXA0Haxk2aRu3Ztm+LFQHktCH3g6FRydB4AgOlXphKtdZ
         QRVDoTphvwfYO0WBPCDTOI+11uLSW2LxO4c4jRqbokN7HD7wxrpgnZ5bqDs0NmMurBC1
         C5SYEay/psEyFP8YIzl0FoX5uQhUFPU/jq8xZmOHYlk2IxBg9Jht1H126tFd15BwMZ4I
         4oDjBMG8pDJTAlzy7fyEQylQ1WDCGHBQ9yA/Nsuu/Aq7xRq05IPRgzTTUZ0GyHS4InEq
         RDoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746180080; x=1746784880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlmCXINH+dafzBgYNqgq0wXLz20MQsNU7TGuhsodLww=;
        b=YU8cSY5pohlNA4lsUuRKiaQAooqi6YNExjhawQWesnFHj6+LprtblLoYHoe5840ZnC
         G4qP/KQt13Yr5J3rgy/5s4hQxTax8mkvsDfK85cBQA78spHqLpcrLImxu1d8x9zsyYZs
         jSN5PomDMQEkduYcteTUrvhfN3sqIVKeDfip0adut7Ddhnsxer1VeduU8LqGnqNH0nWE
         h+Jdu25Q/oJ5ll7VAcZjhNL0UnUitQcnOpIAwIjTaeyDbgiX637ByCIIpKQ1uLQOWORj
         S035vi8+MjnIoWNXmWjAjTGu/8wUj0SVqIvOuft1/RsPH3/soZ4chRuds7J03HEbuBJO
         vHCA==
X-Forwarded-Encrypted: i=1; AJvYcCXi5bmkNXPyeGvGyCtfJmJRGdShiUpi7I8pVesnxH+sOlRzfgKEigZkLMkTTut+HhNi7LacTduG6jJjpSB3RnCT@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5rFxE3y7JHMNZUymfCjif+LgzxDVLw8eNc2uWgaD+bHeMb9+g
	D5Y4+8zwsIER5BWCiOz7QUMKrP92TNUynh3iZRwJnZAEsX2CpdiXZF9/uhJb9Js=
X-Gm-Gg: ASbGnctJyT/pdVM9p1WxTmR7PhIsxvGCKjtxV7ZkTMwRMcVhsGhq/6tahrAa8ZDZugb
	U8wP9NtX/dZu8RncGDcpCLjpIVCNmnZOjtK75AHN+lvtdjDvWiWxyVW0iwiRSdeRNHy+DsvoY81
	99YYzUVjUsVHt3WksXjL7VU0gU//SU21o4zK6VIakyzieZUGO87U1goTMoNdJNaQdSK1nFqggof
	IX/iyz/oF7p1r5Hjd+BnUF7E6X5OlGhvy2txxB6kFqTP70zxIPZb0iIIqVLwMGv/fq0hLl+PCo1
	dT0DnXDy1oSecX3QjmECpFixUA4Ozf+L0uTKlcTj8zWY8z5zjbwytDoPJehi/n4737gO1cWMtHI
	8XpU1mYL227qH6+hHwA==
X-Google-Smtp-Source: AGHT+IEYfv3P+wsN6CjsHEtvD+7RxYmI0A0Zuh0sF27ecW7PLXPxnJ4H/XpyhrWak3QZy6czVPn/hg==
X-Received: by 2002:a17:907:728a:b0:ace:5461:81dd with SMTP id a640c23a62f3a-ad17acfda03mr249587766b.3.1746180079442;
        Fri, 02 May 2025 03:01:19 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad1891473a1sm26030566b.4.2025.05.02.03.01.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 03:01:18 -0700 (PDT)
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
Subject: [PATCH v8 14/14] optee: smc abi: dynamic protected memory allocation
Date: Fri,  2 May 2025 11:59:28 +0200
Message-ID: <20250502100049.1746335-15-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250502100049.1746335-1-jens.wiklander@linaro.org>
References: <20250502100049.1746335-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_030121_539197_2E0FE257 
X-CRM114-Status: GOOD (  16.90  )
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

Add support in the OP-TEE backend driver for dynamic protected memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 103 +++++++++++++++++++++++++++++-------
 1 file changed, 85 insertions(+), 18 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 7acb43852c4b..766e7f5a3953 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u16 *end_points, unsigned int ep_count,
+				  u32 use_case)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 2, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = protmem->paddr;
+	msg_arg->params[1].u.tmem.size = protmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	protmem->sec_world_id = (u_long)protmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_protmem(struct optee *optee,
+				     struct tee_shm *protmem)
+{
+	struct optee_shm_arg_entry *entry;
+	struct optee_msg_arg *msg_arg;
+	struct tee_shm *shm;
+	u_int offs;
+	int rc;
+
+	msg_arg = optee_get_msg_arg(optee->ctx, 1, &entry, &shm, &offs);
+	if (IS_ERR(msg_arg))
+		return PTR_ERR(msg_arg);
+
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_PROTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)protmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS)
+		rc = -EINVAL;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
 /*
  * 5. Asynchronous notification
  */
@@ -1252,6 +1316,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1622,11 +1688,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
-	struct tee_protmem_pool *pool;
-	int rc;
+	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc = -EINVAL;
 
-	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM) {
+	if (protm) {
 		union {
 			struct arm_smccc_res smccc;
 			struct optee_smc_get_protmem_config_result result;
@@ -1634,25 +1703,24 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			pool = tee_protmem_static_pool_alloc(res.result.start,
+							     res.result.size);
+	}
 
-		pool = tee_protmem_static_pool_alloc(res.result.start,
-						     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_cma_pool(optee, heap_id);
 
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (protm || dyn_protm)
+		return rc;
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1823,9 +1891,8 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_protmem_pool_init(optee);
-	if (rc)
-		goto err_notif_uninit;
+	if (optee_protmem_pool_init(optee))
+		pr_info("Protected memory service not available\n");
 
 	/*
 	 * Ensure that there are no pre-existing shm objects before enabling
-- 
2.43.0


