Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE9A9C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 13:42:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SZWcwQgxJYl5xqresVhiMdi9+ZPx9Y4Kk8m/1lcEjeM=; b=BrVpCDIqkZVv2nyc0RXUJ6Tvfa
	waqHY88iKr7GmepXojm08m36XAeyAIH03DHEi94nYVoCiqiTNCJk4cbQxwlGVKFItaGlLLl3OAbf0
	UN7eP32waLnKfwiAZ1J2Ed12gdzJBHdvGTFaNsVfyEs7UBjF+DlHQMZoEWMsr4XGPoOq/HvDSTpre
	bmzRSSefOpT1W+1AMg3mYl7y1sKPx5NC9flqhLO/BVK63lP3HmFmFcySzK3ZFVixnj4vIf52Wpm6c
	KVJvNf7//CDSxG+ZuOYQAlbH3fXmxvTNRMTias7+zsyk2GtK7TaAoeQ30KWgUUlboExzumesRmK9k
	ILf4r3hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpp16-00000008DhV-07Pu;
	Wed, 05 Mar 2025 13:42:32 +0000
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoSr-000000087vp-2TZb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 13:07:10 +0000
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-5e4bed34bccso9604975a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 05:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741180028; x=1741784828; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SZWcwQgxJYl5xqresVhiMdi9+ZPx9Y4Kk8m/1lcEjeM=;
        b=mMv4yaa3t8YpLQj2ZWvOUJYEZeYG7MD/o95j8CubY+Uk8apv0Wwv1iqwO8gdJucaFw
         9/VALg0m540lav/cKydcc8ysSi5ogcEk8vGJ9Fmaz5VOrJCNBq9cF9Gvpg0hUKHbK4DJ
         bLc8b2FAm2ANiKmm4KmKHVfu7KBHeYLU4HLwZgebWJN2BFrfIPRmYbzCdIUXv9/fK5U8
         PLc8lrKt4wlK5KGb7XAVKxFz78DF1seDMJIyImMp/BTyDX9L2PL0hUiUhUn3yF/KD3jg
         CFQAQrUfEefv6DjuxigukTOHEiL/jUp+wQbcykSEfmD0tnwUWZ3FYkxQNcpWxlYEGMym
         yQ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741180028; x=1741784828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SZWcwQgxJYl5xqresVhiMdi9+ZPx9Y4Kk8m/1lcEjeM=;
        b=HnJ5X7kHukoWhRwsZfoeUgfwTl3a+QiOEq/G6TO4y3ult3tiuApH3aAs28mCuZ8mKT
         TKXAP/e+fDxQ6Xj6yHy3hCb9LJLUfxm64RuuLwx+dyk4Zgpv/sQLd+PkrJnCXZffsRdd
         BsBwWsFP5Fuzj8qmhiXfpp72hThlZBecCRm6DZZrv2OjXlfT1uXSXn/pZ6mH/mscJlUe
         Q+P35hSwR73KwE+N59s1W0Gzn7oWykFEwPvUZa89V/Rd69Dz3NWhq0EroUzJhpXfgfSh
         VSxbi15zRT0nqLvsH3dLhdI6TwPE6S757GPaN0K0ixzjH8b9z8tIdezflIIpouTdAM4B
         jJ7w==
X-Forwarded-Encrypted: i=1; AJvYcCVrySrDZRa/g3MwVAR30zojN9Z/ot22174mWNG7HIMpjjZg08iC5R3YfCZfqNnVXIz5cEYpdeU7wNBZIDtm3XCU@lists.infradead.org
X-Gm-Message-State: AOJu0YxFZ6dpEbHdfjqyWOkyg5gH6VtWJ2XHr3w5AZq3JUijpKp867m+
	C5Dhx6K3Fq1c6Ffp/T9PteBCxxBpgOBC7JaRTUV8Crfugh2Hfz6YEbMfLryAVd4=
X-Gm-Gg: ASbGncuIaA0YRDpv0SP7uk0PAgD8rrF8tpl6CWaX20Cocm5uVtz4HvvnGlV9/XW5VwF
	DI7eaWHAwelJBYtVk4fansNKbrN5dburs7YPF3uhFz4gV4AP+u839lXPfDOvc+sGJQMuRER933S
	IwmC0PNJrXso7Y81D8B/XFPi+6oR9wDJ70DKCNT8PJC0YlloEEVkE557lAjbgoNdGx4R8p+S7a4
	/Zii6/+DEz0r0wta0Z0hUBxAO1TSxUzJOwbnvNsIiOy7dGSQPVb+4N90h2PGBlmSOhTh7+7DN/g
	Zb4xoPBCL4/zdueEoDDq0r3/BvtiQ/0Ul5o0zyY4rlDihv/ohDhFXqyXzztaI9skv8bpKWuZzq+
	f1oXOvcCXqtHnOXaAz/eUsQ==
X-Google-Smtp-Source: AGHT+IEU8qhj3jZr5pC33H3BKUPYoPOJwyx39WdATtL+5/RDhfCQ1+ckzcmgDPihiiWE9zWeUGcUMw==
X-Received: by 2002:a05:6402:13d1:b0:5e4:99af:b7c with SMTP id 4fb4d7f45d1cf-5e59f384aebmr3091724a12.9.1741180027839;
        Wed, 05 Mar 2025 05:07:07 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5e5bcd1595bsm65714a12.42.2025.03.05.05.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 05:07:06 -0800 (PST)
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
Subject: [PATCH v6 10/10] optee: smc abi: dynamic restricted memory allocation
Date: Wed,  5 Mar 2025 14:04:16 +0100
Message-ID: <20250305130634.1850178-11-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250305130634.1850178-1-jens.wiklander@linaro.org>
References: <20250305130634.1850178-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_050709_628882_934E3B44 
X-CRM114-Status: GOOD (  17.01  )
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

Add support in the OP-TEE backend driver for dynamic restricted memory
allocation using the SMC ABI.

Signed-off-by: Jens Wiklander <jens.wiklander@linaro.org>
---
 drivers/tee/optee/smc_abi.c | 96 +++++++++++++++++++++++++++++++------
 1 file changed, 81 insertions(+), 15 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index a14ff0b7d3b3..aa574ee6e277 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,69 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count,
+				 u32 use_case)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_LEND_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_VALUE_INPUT;
+	msg_arg->params[0].u.value.a = use_case;
+	msg_arg->params[1].attr = OPTEE_MSG_ATTR_TYPE_TMEM_INPUT;
+	msg_arg->params[1].u.tmem.buf_ptr = rstmem->paddr;
+	msg_arg->params[1].u.tmem.size = rstmem->size;
+	msg_arg->params[1].u.tmem.shm_ref = (u_long)rstmem;
+
+	rc = optee->ops->do_call_with_arg(optee->ctx, shm, offs, false);
+	if (rc)
+		goto out;
+	if (msg_arg->ret != TEEC_SUCCESS) {
+		rc = -EINVAL;
+		goto out;
+	}
+	rstmem->sec_world_id = (u_long)rstmem;
+
+out:
+	optee_free_msg_arg(optee->ctx, entry, offs);
+	return rc;
+}
+
+static int optee_smc_reclaim_rstmem(struct optee *optee, struct tee_shm *rstmem)
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
+	msg_arg->cmd = OPTEE_MSG_CMD_RECLAIM_RSTMEM;
+	msg_arg->params[0].attr = OPTEE_MSG_ATTR_TYPE_RMEM_INPUT;
+	msg_arg->params[0].u.rmem.shm_ref = (u_long)rstmem;
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
@@ -1252,6 +1315,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1622,11 +1687,13 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
+	bool dyn_sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
-	struct tee_rstmem_pool *pool;
-	int rc;
+	struct tee_rstmem_pool *pool = ERR_PTR(-EINVAL);
+	int rc = -EINVAL;
 
-	if (optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP) {
+	if (sdp) {
 		union {
 			struct arm_smccc_res smccc;
 			struct optee_smc_get_sdp_config_result result;
@@ -1634,25 +1701,24 @@ static int optee_sdp_pool_init(struct optee *optee)
 
 		optee->smc.invoke_fn(OPTEE_SMC_GET_SDP_CONFIG, 0, 0, 0, 0, 0, 0,
 				     0, &res.smccc);
-		if (res.result.status != OPTEE_SMC_RETURN_OK) {
-			pr_err("Secure Data Path service not available\n");
-			return 0;
-		}
+		if (res.result.status == OPTEE_SMC_RETURN_OK)
+			pool = tee_rstmem_static_pool_alloc(res.result.start,
+							    res.result.size);
+	}
 
-		pool = tee_rstmem_static_pool_alloc(res.result.start,
-						    res.result.size);
-		if (IS_ERR(pool))
-			return PTR_ERR(pool);
+	if (dyn_sdp && IS_ERR(pool))
+		pool = optee_rstmem_alloc_cma_pool(optee, heap_id);
 
+	if (!IS_ERR(pool)) {
 		rc = tee_device_register_dma_heap(optee->teedev, heap_id, pool);
 		if (rc)
-			goto err;
+			pool->ops->destroy_pool(pool);
 	}
 
+	if (rc && (sdp || dyn_sdp))
+		pr_err("Secure Data Path service not available\n");
+
 	return 0;
-err:
-	pool->ops->destroy_pool(pool);
-	return rc;
 }
 
 static int optee_probe(struct platform_device *pdev)
-- 
2.43.0


