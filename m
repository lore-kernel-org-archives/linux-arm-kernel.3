Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 134C6C3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 15:52:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=; b=BnRWALJL59PcvcMALuLwYVhTdQ
	HphHNRX2+WzEU2538pWU/sTR7/NLnzb7xiPUSDHss6tRTI+BTNc1Nrbhkz+ObRtXdk0R6eA69x5p4
	hezApjGl0o+jY0mIIZoO4ROWyD/ANAHBfg4i6JrVf3gO3hMW0LycspGysxt/D3j6apGmiDQ/s6eYG
	0ZA5Q9CwQwg/3+exVpzHgJnodA+lXnUHZReq8mgw/I2dUvnD93RLlF/M0td7oouk4d3lV2oNKD0oc
	gfw3cm9a/g48QI2MZd70pZ2toJ4Orb/z4U3FBd3QHcIQA/YBYjBwi9ilxqfujJt5uehv8lH03LYqw
	bxvt3TUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHPGk-0000000DPd8-1q2D;
	Tue, 20 May 2025 15:52:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHOpv-0000000DKUN-0O2h
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 15:25:00 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-ad572ba1347so301444266b.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 May 2025 08:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747754697; x=1748359497; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=;
        b=bCzCeAwVuzRNdIJu4ean2G3IBTgwyUemlGeD9dcRvhfBdgHR2aMBU7qbff/Dbb0DEx
         bwMNyGn3MmLZ0UugklDyvi9thRp/VlbbZ516q3jvY5gBBPBbvJJwzFTa38y7k8519mlN
         Pqn2Y6PHHv5Vx2qQOzUzgr/Lh2UIALqG7C3L9jhfuq/RLQPdGsvHHAEQMSwQC5LUNJkt
         SrCGZWXEzn+ftu65mTFTbJrScaeuZN36wNacLuoZIEj2AfOXyUc2Y5O8i/Y5fDoqeQ5z
         eGfB8yw+9qLtueEG4roX2hHH3Zt0mS9BXcYbOueXJOHjsTrKw2sYFF/AgL6TBOVkx6iE
         hRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747754698; x=1748359498;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Sws8LggPb3Nr4WEIwk49/i4GQcd2qsiJjDBUK0g1c0s=;
        b=VG4A0q9i9Z/iaqv37XPt/Irx4ZJG9QgcI5o/qKAXRoV154mgZrgoy2Sizbq2IcBxPD
         I1yjSRO5SVe9bSdNgCUPDUsmASxhAtwF1muZ/6c3zjHk0NIYNz91PqjRLiU8o0ZhllZc
         pt0GrVpHevVbLSA33Ed1IAjhC989jIbiqgc/qgRxA7TGrprfVgG6i2fyC8Ec1eH/kaEQ
         QwEu5Dcga4kfOP0UiwDAINLopDJTjrAhT0nfQfiYCwcXTjtvv67stwRv632VKiJZm58I
         msbkznsxtqQerguSQJu6i8EP+UjVhpHOzMXaRKmbLN3zIMXGu2l7tBRwmKnEgeKpO1WM
         T6qg==
X-Forwarded-Encrypted: i=1; AJvYcCXgbhdAfoP+TZLDJ2vU5EYCT0QrL3wIVylJdq7783eXSis6aFoRXI2GEqlyliAbE+NCP4UwpX7UPgKTrfgcqWqV@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf7/m3jI9D7v+r8tsY0ML0heujOJjm9WxY/J173YDAej5xD0eq
	hOAxI5nhXxx/zEtXfew5YmA4gtx+2wtR+FAPGmH/brFBbCwHRuGjzFWQr86+93rO/2g=
X-Gm-Gg: ASbGncuyKnVdZhQBt37pdwtKq5rxmp0D0jHXs9zOpsJ8XWbYpxVcbdu3F3WOSP1+Glq
	+/xspTENgWyR7kI05NOy9/gb6Lzg6Hz7VxmESoGJb1vZVWvLbcEcLxCJEg53lvSVE0cS1EG0WC/
	/LJCwd1RQic5kCUsK/Z+QJv8DAVtcQbsF+C0+4+Y0GWNrqXJn8ygmCsJpKL/XNTjYMNhl94Phrm
	VaGbo7IF4w8nCVjX0ho1VC3WENxK8uFrsjtZ1nraHiKxTBr552/YpE/DzT25wEhhR5EIAKvLY26
	6IKMhcItbKAc3ZhFWG0R7spl9oKsEgDICNAsgBFyp0DdruZGrasaiefpLwdBCsU51IaKXcf9GuN
	4zN5a4Ysz5nndaV6BLBLDnB7fOIcCRDGUD46Uao0=
X-Google-Smtp-Source: AGHT+IFajjrVIsC7kJISaAObbiybAYfu3AaUSsn1KJ4AT03AxVtsB+czB4nAf85bGG6wnrUQQg0qnQ==
X-Received: by 2002:a17:907:7f08:b0:ac7:3817:d8da with SMTP id a640c23a62f3a-ad52d609170mr1346626366b.52.1747754697525;
        Tue, 20 May 2025 08:24:57 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad52d278257sm742608766b.82.2025.05.20.08.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 08:24:56 -0700 (PDT)
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
Subject: [PATCH v9 9/9] optee: smc abi: dynamic protected memory allocation
Date: Tue, 20 May 2025 17:16:52 +0200
Message-ID: <20250520152436.474778-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250520152436.474778-1-jens.wiklander@linaro.org>
References: <20250520152436.474778-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_082459_137867_248BAD70 
X-CRM114-Status: GOOD (  17.35  )
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
index f3cae8243785..6b3fbe7f0909 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
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
@@ -1216,6 +1280,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_protmem = optee_smc_lend_protmem,
+	.reclaim_protmem = optee_smc_reclaim_protmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1586,11 +1652,14 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
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
@@ -1598,26 +1667,26 @@ static int optee_protmem_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_PROTMEM_CONFIG, 0, 0, 0, 0,
 				     0, 0, 0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
-		rc = optee_set_dma_mask(optee, res.result.pa_width);
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			rc = optee_set_dma_mask(optee, res.result.pa_width);
 		if (!rc)
 			pool = tee_protmem_static_pool_alloc(res.result.start,
 							     res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	}
 
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
+
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
@@ -1788,9 +1857,8 @@ static int optee_probe(struct platform_device *pdev)
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


