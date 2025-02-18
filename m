Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE21BC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 14:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=; b=mHMrMcJ4ewij8OV7atd38J3YlD
	7yJvgdAlCIS1cT092HFKuClr3uatFSRGP/Up+q7CUdChOZqrjQQ14TDtFW2HoD76fsI+fGILMMXe2
	cMOwKfTsJ5J9RgPJ/r105CrAX8VKJ4vPIs5b9XqRK7KMIQz78yU+XQyLM/KnN/EQl8Lbx5XPMXTE0
	+be6L333WNHqtFOoL3zLmrdvWo1dLLH1ywEDjXRjUeq+ZKoZ3Ud4DcUmZY5jXXh3QWe1qSK1rs4li
	y3/UxMXIIDlKPOtNm9MDLkOz76Hz4JYMfVAf2UXtHnGllSuxPNJekw3vZtUosOuHQBzRe/8htfOGH
	mJRerggg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOss-00000008ce3-1qC2;
	Tue, 18 Feb 2025 14:47:38 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkOhV-00000008ZRh-3rot
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 14:35:55 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-5452efeb87aso4241386e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Feb 2025 06:35:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1739889352; x=1740494152; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=;
        b=kNcqLVXQlK2Fz8DJ5If6fOPk7ewOhjcKB+y8JxNxXl/vE4aQPDSP+EGrjNFb+hAUZo
         FbXxjtB3vhTdwd5bA3Y2HYL+BdQvGqtKRttvQ7okuN9wCb/we9lOy7rSfLlD0MF3E03Y
         8zgN1zX0DkV5kdPCQ6htKCSGP1TxWH/Todqv90G1VF1y+sQlanCnVC4C7EgZ99rEbWHs
         qvKccptenZEBu7rJWTmVEOenh3sCMdR+X/N6yRN1F7tHmvA6hqYY8WDBmryh4ZNYnIet
         TF294wGaT8ghl2XwHynKDjsDCsUuXnridXGY398a4bf0V91Lrvf9DJUaDNS+XfTuBuBE
         F5Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739889352; x=1740494152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8kowqzBNNR30VBKvjQTsvLxpaN4SxkdbGASJgFBpcA=;
        b=YyvWQzfv7Bw6XrCqjFdqs3uB5aDWcHRe5ZzNQGHW/6nqHfQxVy26hvdrVG0NJ8YVRW
         3e+F8QsZkzfDqxaMVYKRn7Udixi2gXvtVsm+oZHfHhdjvTxA3eg8zu9bhTVTHeBADt6+
         jD1U7qcQFtkBp01mV/ElY/fN5qBny1XmTFy2qFpD+T6kXHy8WzLvObtAEXWuCHMBHIHd
         Wz9Nm0SFLVn3XFU7KaS0QJj+SI3pAsK77b4y95xyPNseGkaTvdsyr80aGydh4w5PJ0AG
         xmD/Ho8IzX7UCyKoRQfnleio/lXQ86I2p46SXT/3/aXj38Oxlp16X23fCwNFZdOrdz3f
         Lbww==
X-Forwarded-Encrypted: i=1; AJvYcCVwJmCVAcFiz8GkI1Hw+iSOtJ/RglJk4fB+yALOARGpPH+eYqjyLNyPUzD3UNJ+V2vDkzMBH13kgZJVESWghHtc@lists.infradead.org
X-Gm-Message-State: AOJu0YyTwAveRRxJvB1faG0hUO5uuyOh/ADS4WASzCLgBE4CwtvvyzSB
	x95p9Oklwd66wK3T45x5j1zOSH50Cg7/ZJg5XQ6MfS9dPEuCMIzUsDVhM1Z0XA0=
X-Gm-Gg: ASbGncscOhE3VjP+ViyAVjnNtydKIkGTAsuGfWSKpc6+HJZ0xaZJYisScaNOilbcwT5
	0QcM/gK++OR+7DM+ZvEi8c6ECuStR14/SFuyi3Ub1wD/X4/jbNuTMXUgkWs1pjpeHVfIUgG526g
	T+yzx6qkKdq8TDbglKou4aKPuuzk6yolu+SdiKScrY2nFImZPqgyykBLJYNCjC1dfEnTxO08SCS
	dzpA7GtfzWB+BqAaF8TWXqgBbmNOqww8ck/XaaAiSysaP858HNsmCx8h/8yjNn5DXMnp3CU1vnX
	ErIizowtwXE7jqvfSLUH2Old64xjIPCt2eXoicFO2BES3FqMaXHC0omh2irC5PjH5xa0
X-Google-Smtp-Source: AGHT+IG2QSia+pqq7pQb/RgZH7dPW4LfCNk4j/lwNSmjg+mmOj+PY1NlVhF5Eyeo9wfiKu01ckwckA==
X-Received: by 2002:a05:6512:ba6:b0:545:2fa7:5a8b with SMTP id 2adb3069b0e04-5452fe3aaafmr5144347e87.27.1739889351902;
        Tue, 18 Feb 2025 06:35:51 -0800 (PST)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-309311777a8sm12360831fa.25.2025.02.18.06.35.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Feb 2025 06:35:50 -0800 (PST)
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
	Jens Wiklander <jens.wiklander@linaro.org>
Subject: [PATCH v5 7/7] optee: smc abi: dynamic restricted memory allocation
Date: Tue, 18 Feb 2025 15:34:56 +0100
Message-ID: <20250218143527.1236668-8-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250218143527.1236668-1-jens.wiklander@linaro.org>
References: <20250218143527.1236668-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_063553_962300_0E257635 
X-CRM114-Status: GOOD (  17.37  )
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
 drivers/tee/optee/smc_abi.c | 76 +++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index 11589e5120c9..ca0cb5045f5b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1001,6 +1001,67 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_rstmem(struct optee *optee, struct tee_shm *rstmem,
+				 u16 *end_points, unsigned int ep_count)
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
+	msg_arg->params[0].u.value.a = OPTEE_MSG_RSTMEM_SECURE_VIDEO_PLAY;
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
@@ -1258,6 +1319,8 @@ static const struct optee_ops optee_ops = {
 	.do_call_with_arg = optee_smc_do_call_with_arg,
 	.to_msg_param = optee_to_msg_param,
 	.from_msg_param = optee_from_msg_param,
+	.lend_rstmem = optee_smc_lend_rstmem,
+	.reclaim_rstmem = optee_smc_reclaim_rstmem,
 };
 
 static int enable_async_notif(optee_invoke_fn *invoke_fn)
@@ -1628,6 +1691,9 @@ static inline int optee_load_fw(struct platform_device *pdev,
 
 static int optee_sdp_pool_init(struct optee *optee)
 {
+	bool dyn_sdp = (optee->smc.sec_caps &
+			OPTEE_SMC_SEC_CAP_DYNAMIC_RSTMEM) &&
+		       IS_ENABLED(CONFIG_CMA) && !IS_MODULE(CONFIG_OPTEE);
 	bool sdp = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_SDP;
 	struct tee_shm_pool *pool;
 	int rc;
@@ -1635,9 +1701,11 @@ static int optee_sdp_pool_init(struct optee *optee)
 	/*
 	 * optee_sdp_pools_init() must be called if secure world has any
 	 * SDP capability. If the static carvout is available initialize
-	 * and add a pool for that.
+	 * and add a pool for that. If there's an error from secure world
+	 * we complain but don't call optee_sdp_pools_uninit() unless we
+	 * know that there is no SDP capability left.
 	 */
-	if (!sdp)
+	if (!dyn_sdp && !sdp)
 		return 0;
 
 	rc = optee_rstmem_pools_init(optee);
@@ -1654,7 +1722,9 @@ static int optee_sdp_pool_init(struct optee *optee)
 				     0, &res.smccc);
 		if (res.result.status != OPTEE_SMC_RETURN_OK) {
 			pr_err("Secure Data Path service not available\n");
-			goto err;
+			if (!dyn_sdp)
+				goto err;
+			return 0;
 		}
 
 		pool = tee_rstmem_gen_pool_alloc(res.result.start,
-- 
2.43.0


