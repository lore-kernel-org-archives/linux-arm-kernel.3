Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E8AC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 15:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xHIqhioRnhNt4aLsaniXn+7U4R/QZgWIuNSgSngcP8Y=; b=NQ6JBESLZavd3SnKXhxYb98g+s
	xWk2JhAtJynWJ2LHJbYXpcLw/e5RcWEAqCENMbdPlupsFB97Jx8DI4wt17MQkY84FNA5TXSRwo4u/
	qwNOwACkjCYSZrdiG+6JEX7Q9EkSu08HGlKJ7ZLQoayvTPeylfkatPitPNXuSoPQZJfjjRcNHcZrp
	GhiR3J4GIf+bQH67ssRNjlvMiyTpgSKlOrcuXpHgGiuUorPGL+bmYfOHDrKfVersfupCbcvUOV2uN
	VA/ofYb0cWC3cX30mxR2nkYgjpCbTf969Wfz1hETI8e8ipF1P5Yt5q9w5wdnhrN3fA02d5V8S3Ved
	LkjoNwQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Nr-00000007OhW-0M6b;
	Tue, 10 Jun 2025 15:59:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyq7-00000006vWU-269I
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 13:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=xHIqhioRnhNt4aLsaniXn+7U4R/QZgWIuNSgSngcP8Y=; b=FkK3tTOX27UAH8qlkUxbG+JQOQ
	PdS15u3tP5bX6wewM4IfpZEydvbTWYsFCt2qmG+qbi2TodqGfSGU3U2LCtyAkPTUqWzauwx2x1VjF
	Ey/iTD27eWJ1JEnD/33FnfxMZE5nxhA5yQRu1BobuyEMccZOnaaBEfILmSiZgSbKEtb/pG6I+eP6d
	+fKHsQJZ0ztlHFwTyc6WRQ04wpb+sDdQCesjN7uhX5mMCBRFPtKnWTub/fAEcPGp/6dco94N+C5IO
	9C1nhLUVW3C3j9jDxs+FIYE5f6+VxI3X4W7FCxBIblbKP5692cYVNqLf0kL9ZYYfrWG8XZXKrQhR/
	eDgXqBzw==;
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOyq5-00000001qNw-0sdC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 13:16:30 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-adb2bd27c7bso874085066b.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 06:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749561387; x=1750166187; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xHIqhioRnhNt4aLsaniXn+7U4R/QZgWIuNSgSngcP8Y=;
        b=X0iM2kCFtCcR4y74PqjHAWotnfwGXzNqqL9JSpJRxjstKEnV7OYf2g8dTK6aST3Pog
         ZQgl2vsnXtCAjUmG8sdMBJox2dilN7iSrCYJYV4joyzTYzCchw/icDn7pxOPnxxhEqTJ
         kiYW6kByzYnOVO7iWvh7seQKQ9M3ikbxuP0mOZzvn+MWOVfIv201iX2P5o+7z2XxnLGZ
         P5oqX+fe8QrYMdm3PqfDGnG1VXXgjwESck1ooHhp4zW4BTmE8Q9HkA9kzeKxBqfZDSfL
         cNa0najBioafd5dvmijStMlEp91TgW1hxDGtvt4uZnYrvTtTLpbZhxSaqXHMnYtCWvmT
         wX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749561387; x=1750166187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xHIqhioRnhNt4aLsaniXn+7U4R/QZgWIuNSgSngcP8Y=;
        b=wDRlFqxlusBnUhQ1jdFDOk4KmelzFLOU1UmXjFjfEbhc1JWfO6yKq/sPQpNSe9Rl9L
         QYhVg5b5Sy/nrAYwobxbIKwPZA9XBPE+gh/gAKt3rgxzey0+xbUT9TFsu6aDqoG/wtrU
         MhwKK+y46GcA/ZtMR9um1Rb8ng09TIWIMjgAAJVlSAYs/3NbrSOpPZxX5PsokDYDLRAu
         ftw2Xc3Czp+z7LHTYRFGZMHQVEFhAi+EOSjsegNQV04T0KN4VKi6B1wKPAZ6p+CNt/+I
         gz9igTiT3SPnlZqIHBClbqgg5WUlZD9N/oJfKx+XbGst2Dsu1wXeV/9tEZTyNTHdO7FE
         rxxg==
X-Forwarded-Encrypted: i=1; AJvYcCVZz6EfIeYCwDrTaR05dZxSRWHJ4fGPwEuGdvIP1QhC5SXEcUBAkICAxBEw2bV7klfXo3rXQiWkRIo44mqAqWyR@lists.infradead.org
X-Gm-Message-State: AOJu0YzJNDAL/WvXOiaOmEdSphA7RkXF/0f58IdqCVb3To6xkQYVejRn
	SN2WKNnaDzUCIlKe9W8m66+lwKAfdAcdQy0NVfcKt7sJ9/TZWHjVTZeavppoXh3FncQ=
X-Gm-Gg: ASbGncsVPBxySGpB/SHJvan1GlWyls61VlkuqKoCg05xdyAUEMLZuRKF0uPdzqrKj7o
	yzRLqU7DjsBBDZQzKYYjji3kQj9fyPudO29gzr8YUOWZXALiBgxiHj2mwypl1az3lXDswowFhSc
	VDBpAI/UpNEMlaIHX9W+0zS4P4nFeNZsbfNu+Hi5YEcvLLKG5GYro1v3Heu9y9Q/lOTRjdh7sz0
	cTkGYlZu1Uvl1zspFIcJ0cbJLMzVNXafhEykcAQL22W4rRCQPqzb/NWO05qUBYJ36QzqtPkN+9g
	aFCKA6e1GtqtjbUPhNvsA+c6aXTrQBM+yf6wHtAX22Q3biWbDDr8QYx0mxX7HhpzFaUzmJhpfc4
	9ljtqw5UVC/nwVsMLia5tuzyUENlcT0L20ctJQ7M=
X-Google-Smtp-Source: AGHT+IFRIlvxt0K3SM6xhnBaF7S6vn8tyjGnih1oB83ay9sZPd3eAVoEgV9w1AjoIqTxnsVFcfN65g==
X-Received: by 2002:a17:907:8690:b0:ad8:9466:3348 with SMTP id a640c23a62f3a-ade1a978de5mr1630006366b.36.1749561386585;
        Tue, 10 Jun 2025 06:16:26 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ade3206a1efsm643651666b.67.2025.06.10.06.16.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 06:16:25 -0700 (PDT)
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
Subject: [PATCH v10 9/9] optee: smc abi: dynamic protected memory allocation
Date: Tue, 10 Jun 2025 15:13:53 +0200
Message-ID: <20250610131600.2972232-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250610131600.2972232-1-jens.wiklander@linaro.org>
References: <20250610131600.2972232-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_141629_398100_9F5C0FA7 
X-CRM114-Status: GOOD (  15.53  )
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
 drivers/tee/optee/smc_abi.c | 78 +++++++++++++++++++++++++++++++++++--
 1 file changed, 75 insertions(+), 3 deletions(-)

diff --git a/drivers/tee/optee/smc_abi.c b/drivers/tee/optee/smc_abi.c
index cf106d15e64e..fd1d873de941 100644
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
@@ -1628,14 +1694,20 @@ static struct tee_protmem_pool *static_protmem_pool_init(struct optee *optee)
 
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


