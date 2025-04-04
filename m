Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FA5DC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=; b=RlyLnmtzxw1FrVF9Ss4wEgY/eh
	MUYRUzHKTBjg7tHxLBX+KIwCdLhtPWb3xEpxt+Mo+x/4ZobDupgic53ODMWZ1Mh8EHaXNCFvvX7zv
	eJSCRClCi5CI/A/0XGAYPb2aPQQLM+a+cRzzU+s3KZqafH4ZqfP+M+ELHqs0Yr28IzeF/tN4ZbzZy
	uXOEPyarhK8B6Rzs0rlHowHLb/psW/FXzpKRfzH8KE7QQoA14SrTIWksuEDCC09dAatzsw453gGBH
	Nx1bBxATiFoMhdm7hWQxVeslC2fF5RURRlkXNywr1+i7UFIxCsI/ivXKcKZ9cNIREZ4ebuAu98Hij
	GUaV/DBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iQZ-0000000C3Wp-44BF;
	Fri, 04 Apr 2025 14:53:51 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i6B-0000000BzQa-0gCY
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:32:48 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e6c18e2c7dso4077324a12.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777166; x=1744381966; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=;
        b=LXZ+wM1MS4EUjFZeBXcGtEfYdY4BnCtFzClGHjT7a/VLVLi9q7LaE1sCf2C6H0r1QA
         jPU25tsXv9wUPFYotFnsLGPPOhb3Llg6PSPeq/wAv1ZuD+VIZ6xYYKRqzGc7SpJebeIx
         YYcNRdOy+A5Sx7x51/o+KpOmxCCs/3sCONhO81bQDa+s6Z0EbWlaH/dg1s6EJApY2WXZ
         /7uBp8aS1sa3heLvEtN4Nm6E1uu98BUU3LY/zoJjDWDNqVS7NJGY5KS3gSjTChYwVkjc
         69OBxCTxw/M6fzP3tcRow+RYyy22zUTfzFdFNXGQs/a9wzj2V5s3Gf0cgJ9iUdrSISR4
         GfdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777166; x=1744381966;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vPfYhkbEaDQyvItBPqD6f0Sef9tTAM/sN3gZBFbfI4Q=;
        b=iHr3QfCL6C62swDTLf1ha06TtDDhodhyAKbYn01Vh33DF6jiyEGtl/aodPdcRq17As
         IasOSo+QaCzuVy/WYRQXc1lnCRe9xkLUy6CYxI04GhOGs0/wA//PTuvKAcuXOXIvfBvx
         biAqYBezQ84ld9PGgys9BXBmMtK7Ty2prewoev8vOvaZKVGuodyjTymDazIONziIePTL
         Lt8p/b5faPJ0cuUcE7wrEF/dMKiMtFc368A92G2LIr6I4nIUaNO8bQFiU6xVudejsKpc
         rSo0FY4xm008072JjFzK2D6YEgsNPE4tPl1xqdu+2Jn1GCt0Sd+2OHp19rfVUVYIEJae
         Ra9g==
X-Forwarded-Encrypted: i=1; AJvYcCUbDPQtJU1Hh881bFus4UEUlj96XOXQIufCGVjucUGR6PilpBj7AugNRMYJXVtcsSJuiCLufLLTAf25LFIanF35@lists.infradead.org
X-Gm-Message-State: AOJu0YwXsA5YgYujXD/sHfgnucTY5D3XJ88mS66exsHm9UrpMKTYATTY
	tAlD3v0d2E+MHzCmkOwoXLYZIlObFzhacXf3uCi4N4Nw1J/iqDrMbBMOOBxR6dE=
X-Gm-Gg: ASbGnctizuVwvuU7Iq9btSZNqdYzu6ghv62NHOZAAHqOxnkNKcN59KiPlcz7GN6FAI8
	esAC7/jHheCt1PP2C+wzhOBf/R7QY6SsxPHzgQFcZKmogX2zEniGL/9yTkriSp4Dgy82tyeaQTU
	vBXhQ8eMJLdAlF/4xTUEMcLX5ruqhzM6D5IIm0Ko+OlbIaQONywD1vpQ/NvQiqipZyitT676ixc
	SVs4jfObW2VT0wbPaiu5/tKIRmceMDhDgsRCdMQel94VTOkBzgwvUazwW7946FV7f+5S4njngHz
	m9uqruRn0wi8Zr6E2smQMIKtWQ5ta0YR+pBWZcXowgEKIZfVDzDd6yzjdfACNaMundE2XfUkTmx
	lVy8JIT0OA+5x0vCarMxr4g==
X-Google-Smtp-Source: AGHT+IExyXHbOf2taNxw2yz+3CcX0NYoBCdJtwB6sr0Vv5nuFXnktNWKFMtHaLzI32Tb9SdvBjUavw==
X-Received: by 2002:a05:6402:380c:b0:5f0:8551:9790 with SMTP id 4fb4d7f45d1cf-5f0b3bcd2c0mr2481680a12.16.1743777165747;
        Fri, 04 Apr 2025 07:32:45 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:45 -0700 (PDT)
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
Subject: [PATCH v7 11/11] optee: smc abi: dynamic protected memory allocation
Date: Fri,  4 Apr 2025 16:31:34 +0200
Message-ID: <20250404143215.2281034-12-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073247_216799_72EA17F4 
X-CRM114-Status: GOOD (  16.97  )
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
 drivers/tee/optee/smc_abi.c | 102 ++++++++++++++++++++++++++++++------
 1 file changed, 85 insertions(+), 17 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index c10b38b23586..dd9887826590 100644
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
@@ -1620,13 +1686,16 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
-static int optee_rstmem_pool_init(struct optee *optee)
+static int optee_protmem_pool_init(struct optee *optee)
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
@@ -1634,25 +1703,24 @@ static int optee_rstmem_pool_init(struct optee *optee)
 
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
 
+	if (rc && (protm || dyn_protm))
+		pr_info("Protected memory service not available\n");
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
@@ -1823,7 +1891,7 @@ static int optee_probe(struct platform_device *pdev)
 		pr_info("Asynchronous notifications enabled\n");
 	}
 
-	rc = optee_rstmem_pool_init(optee);
+	rc = optee_protmem_pool_init(optee);
 	if (rc)
 		goto err_notif_uninit;
 
-- 
2.43.0


