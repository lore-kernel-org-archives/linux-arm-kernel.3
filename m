Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7999C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 14:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=; b=sh+Xn2iXRyQ2vihlza01wSunDf
	roEdEvClQiPggIVTsLp3Hxdb7+9YhjRBX5WfWa8WnA+ilGbcu1ZOMH3ZK7BbYzFeA786BFeSJEGrV
	jhN5gSDGoVoqia3hEKPqxpapanMYO/V27iEg0sGXEUEV14voY6iX3yTDo++r9C5R7B9j8anjb8+lG
	l0D7qREART3drktQ+25eMsRI5HpCL0SV7JTijdGHGE7DL6GdJGqAlLOz9gDC2guSBJR+Khk0WSf9Q
	EA2OFVSmt6uV7yAcFNdrXpFB+CbKlm6V0hxFTTJFjdHy7J/mCDAI/027EiPlWrXYs6Lbb0pzXFErz
	J8scYLXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0iN8-0000000C2lr-27zU;
	Fri, 04 Apr 2025 14:50:18 +0000
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0i67-0000000BzOf-2DRS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 14:32:44 +0000
Received: by mail-ed1-x52f.google.com with SMTP id 4fb4d7f45d1cf-5e8be1c6ff8so3974467a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Apr 2025 07:32:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743777162; x=1744381962; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
        b=PdYf3vyhAC9MnN9xRssK9ufN+zmflrXbC/fv5cuXGrToeblG9rKTNdZCGmyqxLxw67
         0k+s7yyR4vltlYjT53gazztUL9Hm8xEYeLWD+V3wuCqTbwcauuN43pMyAPL5LWmz6Buu
         rFWZ+0/M9xTiUENNSwpqlfBhIgdTIPlyk4v+JL9umrtSGN5Yumy9FAZGlAsS1dBFWjW7
         3jNrLiUUqPBHNbP8XjxA+mDUGiEL0BTJ+xQwkIzJ9GGVGTsybB0RV4JQf6Kir2hdwZLw
         et1XGl+sr+3hbWSvZUTUKPlQl7oaWO48fjnR8wWxi88yNgXWYGmCiRbONe6DlJBdJP04
         b5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743777162; x=1744381962;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqVUo9839x0Dz2BO0CX+S7eZwnYbMhFJhNNlz9OFNHU=;
        b=bhh0vWPBC+agJS5urT5Bf/13Mm/2iqaSt9lIKCiVklnqH9OUZUD2DrxYGfJDcwhZZF
         zJjGWr+cV0LjGWLJcBqRT6AnDTkFwlZeuzL02gS6pqV4Q4bVSARWmcWr5414OUCIXuOw
         vb3zInYw2PFeGm8SDTxUkl8O53G2TZEbSt3eucTqnU7+VqJtVvvGVtAZLCMRcyRwkJW+
         4Q7iF8Ey5Q1NRrbAQMo3F4P1F3uh6Pi+DICFPhCw8yA/e4eomuFo0LrByHeDho6J0Qsq
         V9dA0rEHNDWyfAmQt0Y3hweV7zGYWzgDrFVB+4l8mTgn5pREJ/DAy24/bjgCQ1XtpIbw
         bqHQ==
X-Forwarded-Encrypted: i=1; AJvYcCX7IKavg/57DwWt1JeEJ++QffpF0wFjzVn10V3RV+5SpUjY+Emw4Sg8UxpO6dxp1IvqzZkiN49mAG84hTOr59d7@lists.infradead.org
X-Gm-Message-State: AOJu0YxXw8WQcYbwDlV/owzxKvVlIfqlbQ6bHDP/4bujIppSv36CCI0z
	b5hFo4pOcgG97g/yYqTru4b1/vz9b7iON3WI0yjdZFYDpvwHefWsE9wWY/w2QKY=
X-Gm-Gg: ASbGncsbMgvZOGJxrLtc4dANrfADlWslhwjR4thN1TY+50XrobTcddgu8Ib9daZPRQN
	E+WoJUUoXmhMbvHjwUC1Xa/YDuH62nmE798DIxLpb1d9u5JWpQ1S4RDS2yPFVqkoboii6btjP5P
	hZFzW9ESFVaeveW1BngVWGuKbt0F1UISm7RmJUjU4nh+7OICHpswcFl6+59idVvGPbQgtBKrxad
	8Xxj/Ed8yBnl0h6hi5DeHv/wbkNsgdbHqob3XH2h7WYqUEbMUzSem9C9FO+euIxL0rF+t2MkKDx
	LXvfLD79lPWCg4AoJOZV3JFD+BlN4t5Ez4PoLhns0AYuhE7FQISoUEEBFFM9xt6kJo0CwRVQHKr
	R1XlwdLXSgMHX+d+3ds5Geg==
X-Google-Smtp-Source: AGHT+IGI4VswEXbkr8wvPcpZqZzKqeC9kMo0saIbDftZfl+T9cBHd+BN83SFjwOfSSTztOoIdlkUdw==
X-Received: by 2002:a05:6402:5cb:b0:5ec:cc28:1a78 with SMTP id 4fb4d7f45d1cf-5f0b657a59dmr2556677a12.20.1743777161950;
        Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
Received: from rayden.urgonet (h-98-128-140-123.A175.priv.bahnhof.se. [98.128.140.123])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f087f0a0f3sm2567450a12.43.2025.04.04.07.32.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 07:32:41 -0700 (PDT)
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
Subject: [PATCH v7 09/11] optee: support protected memory allocation
Date: Fri,  4 Apr 2025 16:31:32 +0200
Message-ID: <20250404143215.2281034-10-jens.wiklander@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250404143215.2281034-1-jens.wiklander@linaro.org>
References: <20250404143215.2281034-1-jens.wiklander@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_073243_565724_822C77A7 
X-CRM114-Status: GOOD (  17.73  )
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
index cfdae266548b..c10b38b23586 100644
--- a/drivers/tee/optee/smc_abi.c
+++ b/drivers/tee/optee/smc_abi.c
@@ -1620,6 +1620,41 @@ static inline int optee_load_fw(struct platform_device *pdev,
 }
 #endif
 
+static int optee_rstmem_pool_init(struct optee *optee)
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
 
+	rc = optee_rstmem_pool_init(optee);
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


