Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B9B7C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Aug 2025 06:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=; b=eXk13Uxpo7q9CV0LUN6urH5LSE
	8a+Yt+O0F4MPByl50WXNTfZiixIHSDtWQ7QnubeComAUie33sbguegs3/4bRCXMGGkMgzTZfmToKI
	WtRLzpETVXZn+l7Sw9/rGHuqz8MrrGhwETNQ9WBEy0KopyJdMDtJIsoVFNrYyNdTh4bAcqKkuYP7p
	7O3yRvcqkatTpls5UD+91BycLAnNWMeMbfJBISQwmxxN59XLNX5kACWEC72OAfoUpd4qDakQRFcYm
	LTeWWNoy39pbzPMS2DzJVKDCQEe3AbwpnvIkbs7f1ljiQisby83pPoKuxo8UOR1fyKwjKz2oPigsi
	hHCfayYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um52p-0000000Cniw-3lX0;
	Wed, 13 Aug 2025 06:33:07 +0000
Received: from mail-ed1-x530.google.com ([2a00:1450:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1um4ap-0000000CjZZ-0BCE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Aug 2025 06:04:12 +0000
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-61592ff5df8so7819454a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 12 Aug 2025 23:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755065050; x=1755669850; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=;
        b=uY8KiQXq5MGtS5kO9vj/K8vcnrUFhWbLEz/6tilF8x1bl05OpSCg28GGiAF+mFmZFF
         sq9ANwSYjV0ApLwMP8a1rwPUH15vqllZHOm7x2EDJzGNdzBR0ZxH4CVQpDyZZAO8da9E
         /sW5Y6quDyZV/m87gAQz7MkIsPQlZUjq95izK3gUdmNuOtU0mGWsKIjkpfQMznLI2QSt
         QNKvylm69joQ3gtpY6Jl4AU8OdDp5VRwm7hEh55oAeXLq/RxJEsvkDtqn5+eV3Dc0rZi
         0XMI+Y2EPDq8MAhIpGkWYaauVXZ+DcamcbNglT+sLyMgYTrOS4DLQmwqs8JUKr+1wGQC
         YSiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755065050; x=1755669850;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YMyd1M5LZgFUuwfgUjsWaWr5cxJRx+F31yZrIJB0d8c=;
        b=Deu31xLogE7D6wv4fSa4y+XR9BXowoVIRXTBz8hpp8iqdAZEN941HfsXNkxZ6W8esw
         0PSIFUG220sc8Eb/ScRsYwMy65VGe8OTHx2q85GJ+hE3xy9EvA4jjHJ4JY0OzFjJ7QnN
         gZKRMK5pHSlq5V8wNfSO8QsrQIfo+oe5pkG6fVQOgkEdA8KsK69xwVNoJYKOV1piFe/b
         PfEcRl12rwjE88863KnMx7z5JvaeVH6ADpvZoPmY1ZA+yKvNDvtQcFnao24PzELJc118
         IL/0ynX64EBR+77/2SE6erUnodPFceltcFBZ5MLYcHkqP7pT+KO47ZHx4WSIGExTHaKg
         O5cw==
X-Forwarded-Encrypted: i=1; AJvYcCV4JlJJerPs9pXB5Hs3V+EuPXOo4inXorxjeDVqNNl4jjeyDwVuXfufRTD+FpMEyyrcg3tGdH0GNGvGZCTSsm5V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyl2TCgVAS6T1FU5J090MxUtvHih1ucOk18dHQQgHIT1JelYF9k
	Nql03/ceUtLPuv2pt/g9tlPFKsjxCrpoU1fN4ImvV5Po1iTKGFz79mRkU8G4sfypaxo=
X-Gm-Gg: ASbGncuUsov2BQKXvVONsut4z//PXCPYZ5iGh/eRVSSqaX/OJG7f9JUbqpBTUTAQZNE
	yGawl1z5BzrGvUSoJVOf053DhObunGdOfGzYegvgTBbG7yBKgK3TOnE81XlpD6Uhdjxvs4Y394I
	zXxtW/Ll29FLn+HiXpr5tUfj61y2644vIpLLqbnz45NGppGCNOfACFEixcR3k/iaGKvIG9WW4l5
	y7G/x1ruX4XVGsJyTbGTL8/KbufI/r4aK/TWGQZpCVwD6Wtbm/LmjxfLenQBARN2gqHj+MqClGl
	J3TX6QBe2ylUp/Dm2q81saGF6DV57ex+I8dnmHXWwg44fsAGHaBZfI94mGvERZUvAAn5q7qx7BO
	X07qUjhnx5gGq9nx3PZ0r/2Jmd6/dHDYoDDo1w4mdua6DiNC7M/xl30EjAnPX+Oji55Op0A6x23
	w=
X-Google-Smtp-Source: AGHT+IGl+zk2kZ7dGtXoXvUAogPksLb/KD4WUBLmDCFuz3Yjsb2gUsdZ4PxNJjaVjkahgiQaR0qEBw==
X-Received: by 2002:a05:6402:2753:b0:615:38e6:b739 with SMTP id 4fb4d7f45d1cf-6186bb8e5damr1297264a12.10.1755065049472;
        Tue, 12 Aug 2025 23:04:09 -0700 (PDT)
Received: from rayden.urgonet (h-37-123-177-177.A175.priv.bahnhof.se. [37.123.177.177])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-615a8f2b892sm21498679a12.25.2025.08.12.23.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Aug 2025 23:04:08 -0700 (PDT)
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
Subject: [PATCH v11 9/9] optee: smc abi: dynamic protected memory allocation
Date: Wed, 13 Aug 2025 08:02:58 +0200
Message-ID: <20250813060339.2977604-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250813060339.2977604-1-jens.wiklander@linaro.org>
References: <20250813060339.2977604-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_230411_083945_79A80468 
X-CRM114-Status: GOOD (  15.73  )
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
Reviewed-by: Sumit Garg <sumit.garg@oss.qualcomm.com>
---
 drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index b4c007ed3b94..0be663fcd52b 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -965,6 +965,70 @@ static int optee_smc_do_call_with_arg(struct tee_context *ctx,
 	return rc;
 }
 
+static int optee_smc_lend_protmem(struct optee *optee, struct tee_shm *protmem,
+				  u32 *mem_attrs, unsigned int ma_count,
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
@@ -1627,14 +1693,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
 
 static int optee_protmem_pool_init(struct optee *optee)
 {
+	bool protm = optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM;
+	bool dyn_protm = optee->smc.sec_caps &
+			 OPTEE_SMC_SEC_CAP_DYNAMIC_PROTMEM;
 	enum tee_dma_heap_id heap_id = TEE_DMA_HEAP_SECURE_VIDEO_PLAY;
 	struct tee_protmem_pool *pool = ERR_PTR(-EINVAL);
-	int rc;
+	int rc = -EINVAL;
 
-	if (!(optee->smc.sec_caps & OPTEE_SMC_SEC_CAP_PROTMEM))
+	if (!protm && !dyn_protm)
 		return 0;
 
-	pool = static_protmem_pool_init(optee);
+	if (protm)
+		pool = static_protmem_pool_init(optee);
+	if (dyn_protm && IS_ERR(pool))
+		pool = optee_protmem_alloc_dyn_pool(optee, heap_id);
 	if (IS_ERR(pool))
 		return PTR_ERR(pool);
 
-- 
2.43.0


