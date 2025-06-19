Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F149C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5Gpu+13nPGCVHqZg30hcatcad880Sim9iFcp3f23U4=; b=I/OurZS1hV9a8paDaqQmN8Bmk8
	gqmnKw5Sri7l+sRxDICKJ55dE/dlO5iPDkKadHxHb8TEnmS9ooLTm3sSE0t1TvYaYpMt6yFrUjIbr
	+WLWkvWijQzZPqhhBgk8CxsqvJT3gz+7Q1ktO4Z+FebF66U0KPXGZLPakrN3S9XC1swOraLNKA2XZ
	/Wl0rCi6wONtzDLu05Qwu6nYZPQLShVZR6qCzHTtQtyb3EAD1Tdr/KB00XgWqJCOzOAB5hvjyjs/s
	jcUSYagkJtGAYd/3W0jMSNCcEViwC5LmlESNzS8UrEzDZvveYvpXwDaQYJ4LzFiZ8cbTM/3sl/tmg
	P1aJ5RlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSHUL-0000000DVwg-09DH;
	Thu, 19 Jun 2025 15:47:41 +0000
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSEJb-0000000D2b2-3C1x
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 12:24:25 +0000
Received: by mail-ej1-x629.google.com with SMTP id a640c23a62f3a-ad883afdf0cso146755866b.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 05:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750335862; x=1750940662; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5Gpu+13nPGCVHqZg30hcatcad880Sim9iFcp3f23U4=;
        b=FrNIItbpK5griG0uhCJM2NAItR/SCwpHaeQ8SoKUMlINGRX6orjgt1TkoITaAlJdOY
         4hH5EkIkgxTHwXlSR0yppmoqdaFxBKU8YuI4ByEKeU0J5PEg0xfziRajWLIr7NZDYQL0
         Ti7vWYCoYUX1InhkCgkCu4ECmA6JbK7CGjix85bKyhyAs4h9R61j0cdAYsazfvrsawOe
         mt27cpjNfkf3RlPL69IMLK6aV9iK3M2NlysOHX7nuY47L0ECSPw8JV+iJjuL7c1kEMla
         KnF6Y+ctgUenmSO8McEToSDVoHrfHY1Kov/AB+JP7CBXwuv+7b3my8FYYgdUZD/otatu
         iVqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750335862; x=1750940662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5Gpu+13nPGCVHqZg30hcatcad880Sim9iFcp3f23U4=;
        b=TrydPxMLPbC2qjXipG7GEBCT4C4VF/n1bS4WWpScXKpKJwp4SGNghjZV4vNwBlJE+W
         clOmAHWzZx+4WiFcLAF5WAQyADMl18qvyGvIGwjfbu+X6/+o7uODuDZVkOGB133YOoGf
         HVSqIWAIXUlsetmVadqM5Qn5DWSfztGzUhD4cxjIqdc3wWFseVSy1VxYIlDYXX4Pdapb
         pv8KTn6aS+AuyvATChT93x4xH5F8mNQI4mGWL4eP+5UYSvQghhrp/dHjPSzLdiZI4puN
         mJ7YWKSwNNJU2y/GQdDCqQrxJSAYPiJXazydPqSpHogTLXyHgViyZV7uTIEvN/c06LUv
         YzWg==
X-Forwarded-Encrypted: i=1; AJvYcCVfUtzTUY2j8TClX9J/zlr/QNLyw3W1GGM1qt0M9NFhCwc8V+D00Z4KRYaZXv1KGpV0Nz1TmsRLaLuGI5DFX9g5@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9wL4veefgI439JCqGhF3iNg8rzxvnXf/kb1FppW3vJXR52UIn
	WU6c2kP3xPCWQyf1WN/9tWCW9TMO/JQOx74HOT/m42BUCQMdjHqa7bgV
X-Gm-Gg: ASbGncvmj6r9mW0/+P+tnI3VMyAT6JHL2yrI0yvkOZzfqlcrh9joiey/XUw3WCw+jZn
	zYHPa9LM7zqkDdSRwT7C1JdIKBssqDpp87/CwtNE9OI1E8Eco+s8J0XA4noPozLywU7IMgByH/5
	aNvUaXR6KmzVekt0EWJ5SYECJjammpugd75ya8DGNoQzL397EMN7ZBjdHIUScwUaC9F80bAh6hZ
	5MjaveTBb5/bD+6sG3iJ/uI/kNjgT6jJ3LoCh0/xMyi/2HgvNbkbxuVc74H32aTlsw4tqcpYgGs
	ZN82P0IGm7WQWnOetIt2+TaL2ab/pIBPGJO8kHwExwhufUfVwIEUCFy11HLcDTRGU200xA0QAyk
	65DIjswc7N4U01g==
X-Google-Smtp-Source: AGHT+IF962CYjlLZtvg9eHBjvU8GUucSlYDpx3mPu8LwlDHj4xeOOn/8jtcAmRLBHe5JeNQW4grErg==
X-Received: by 2002:a17:907:3c86:b0:ad8:a329:b490 with SMTP id a640c23a62f3a-adfad396ef2mr1987587166b.23.1750335862153;
        Thu, 19 Jun 2025 05:24:22 -0700 (PDT)
Received: from localhost.localdomain ([2a02:2f0e:c51b:8900:a03f:12cb:72f7:9069])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae000b02bd3sm504688066b.3.2025.06.19.05.24.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 05:24:21 -0700 (PDT)
From: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
To: clabbe.montjoie@gmail.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	linux-crypto@vger.kernel.org
Cc: wens@csie.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ovidiu Panait <ovidiu.panait.oss@gmail.com>
Subject: [PATCH 10/10] crypto: sun8i-ce - implement request batching
Date: Thu, 19 Jun 2025 15:23:16 +0300
Message-ID: <20250619122316.2587236-11-ovidiu.panait.oss@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
References: <20250619122316.2587236-1-ovidiu.panait.oss@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_052423_920873_FF4E6D4B 
X-CRM114-Status: GOOD (  29.20  )
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

The Allwinner crypto engine can process multiple requests at a time,
if they are chained together using the task descriptor's 'next' field.
Having multiple requests processed in one go can reduce the number
of interrupts generated and also improve throughput.

This commit introduces batching support in the sun8i-ce driver by
enabling the retry mechanism in the crypto_engine and implementing
the do_batch_requests() callback. Only requests of the same type
(hash, skcipher, etc) are batched together, as the hardware doesn't
seem to support processing multiple types of requests in the same batch.

The existing do_one_request() handlers are adjusted to only fill a per-flow
queue and set up the dma mappings. Once the queue is full or a different
kind of request is received, -ENOSPC is returned to signal the crypto
engine that the batch is ready to be processed. Next, do_batch_requests()
chains the requests, sets the interrupt flag, sends the batch to hardware
for processing and performs the cleanup.

With request batching, the tcrypt multibuffer benchmark shows an increase
in throughput of ~85% for 16 byte AES blocks (when testing with 8 data
streams on the OrangePi Zero2 board).

Signed-off-by: Ovidiu Panait <ovidiu.panait.oss@gmail.com>
---
 .../allwinner/sun8i-ce/sun8i-ce-cipher.c      |  15 +--
 .../crypto/allwinner/sun8i-ce/sun8i-ce-core.c | 123 ++++++++++++++++--
 .../crypto/allwinner/sun8i-ce/sun8i-ce-hash.c |  13 +-
 drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h  |  31 +++++
 4 files changed, 155 insertions(+), 27 deletions(-)

diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
index 22b1fe72aa71..5a3fd5848fd1 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-cipher.c
@@ -165,7 +165,7 @@ static int sun8i_ce_cipher_prepare(struct skcipher_request *areq,
 
 	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_cipher[algt->ce_algo_id];
-	common |= rctx->op_dir | CE_COMM_INT;
+	common |= rctx->op_dir;
 	cet->t_common_ctl = cpu_to_le32(common);
 	/* CTS and recent CE (H6) need length in bytes, in word otherwise */
 	if (ce->variant->cipher_t_dlen_in_bytes)
@@ -376,16 +376,15 @@ int sun8i_ce_cipher_do_one(struct crypto_engine *engine, void *areq)
 	int err;
 
 	chan = &ce->chanlist[rctx->flow];
-	cet = chan->tl;
+	cet = sun8i_ce_enqueue_one(chan, areq);
+	if (IS_ERR(cet))
+		return PTR_ERR(cet);
 
 	err = sun8i_ce_cipher_prepare(req, cet);
-	if (err)
+	if (err) {
+		sun8i_ce_dequeue_one(chan);
 		return err;
-
-	err = sun8i_ce_run_task(ce, rctx->flow,
-				crypto_tfm_alg_name(req->base.tfm));
-
-	sun8i_ce_cipher_finalize_req(areq, cet, err);
+	}
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
index b6cfc6758a5a..a2addc9f64d9 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-core.c
@@ -10,7 +10,7 @@
  * You could find a link for the datasheet in Documentation/arch/arm/sunxi.rst
  */
 
-#include <crypto/engine.h>
+#include <crypto/internal/engine.h>
 #include <crypto/internal/hash.h>
 #include <crypto/internal/rng.h>
 #include <crypto/internal/skcipher.h>
@@ -171,8 +171,14 @@ static const struct ce_variant ce_r40_variant = {
 
 static void sun8i_ce_dump_task_descriptors(struct sun8i_ce_flow *chan)
 {
-	print_hex_dump(KERN_INFO, "TASK: ", DUMP_PREFIX_NONE, 16, 4,
-		       chan->tl, sizeof(struct ce_task), false);
+	for (int i = 0; i < chan->reqs_no; ++i) {
+		struct ce_task *cet = &chan->tl[i];
+		char task[CE_MAX_TASK_DESCR_DUMP_MSG_SIZE];
+
+		snprintf(task, sizeof(task), "TASK %d:", i);
+		print_hex_dump(KERN_INFO, task, DUMP_PREFIX_NONE, 16, 4,
+			       cet, sizeof(struct ce_task), false);
+	}
 }
 
 /*
@@ -190,10 +196,6 @@ int sun8i_ce_run_task(struct sun8i_ce_dev *ce, int flow, const char *name)
 	u32 v;
 	int err = 0;
 
-#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
-	ce->chanlist[flow].stat_req++;
-#endif
-
 	mutex_lock(&ce->mlock);
 
 	v = readl(ce->base + CE_ICR);
@@ -710,12 +712,107 @@ static int sun8i_ce_debugfs_show(struct seq_file *seq, void *v)
 
 DEFINE_SHOW_ATTRIBUTE(sun8i_ce_debugfs);
 
+static int sun8i_ce_get_flow_from_engine(struct sun8i_ce_dev *ce,
+					 struct crypto_engine *engine)
+{
+	for (int i = 0; i < MAXFLOW; ++i)
+		if (ce->chanlist[i].engine == engine)
+			return i;
+
+	return -ENODEV;
+}
+
+static int sun8i_ce_do_batch(struct crypto_engine *engine)
+{
+	struct sun8i_ce_dev *ce;
+	struct sun8i_ce_flow *chan;
+	int err, flow;
+
+	ce = dev_get_drvdata(engine->dev);
+	flow = sun8i_ce_get_flow_from_engine(ce, engine);
+	if (flow < 0)
+		return flow;
+
+	chan = &ce->chanlist[flow];
+
+	if (!chan->reqs_no)
+		return 0;
+
+#ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
+	ce->chanlist[flow].stat_req += chan->reqs_no;
+#endif
+
+	for (int i = 0; i < chan->reqs_no - 1; ++i) {
+		struct ce_task *task = &chan->tl[i];
+		dma_addr_t next = chan->t_phy + (i + 1) * sizeof(struct ce_task);
+
+		task->next = desc_addr_val_le32(ce, next);
+	}
+	chan->tl[chan->reqs_no - 1].next = 0;
+	chan->tl[chan->reqs_no - 1].t_common_ctl |= cpu_to_le32(CE_COMM_INT);
+
+	err = sun8i_ce_run_task(ce, flow, "BATCH");
+
+	for (int i = 0; i < chan->reqs_no; ++i) {
+		struct crypto_async_request *areq = chan->reqs[i];
+		u32 req_type = crypto_tfm_alg_type(areq->tfm);
+
+		if (req_type == CRYPTO_ALG_TYPE_SKCIPHER)
+			sun8i_ce_cipher_finalize_req(areq, &chan->tl[i], err);
+
+		if (IS_ENABLED(CONFIG_CRYPTO_DEV_SUN8I_CE_HASH) &&
+					(req_type == CRYPTO_ALG_TYPE_AHASH))
+			sun8i_ce_hash_finalize_req(areq, &chan->tl[i], err);
+
+		chan->reqs[i] = NULL;
+	}
+
+	chan->reqs_no = 0;
+
+	return err;
+}
+
+struct ce_task *sun8i_ce_enqueue_one(struct sun8i_ce_flow *chan,
+				     struct crypto_async_request *areq)
+{
+	struct ce_task *cet;
+	struct crypto_async_request *prev;
+	u32 alg_type, prev_alg_type;
+
+	if (chan->reqs_no == CE_MAX_REQS_PER_BATCH)
+		return ERR_PTR(-ENOSPC);
+
+	if (chan->reqs_no) {
+		prev = chan->reqs[chan->reqs_no - 1];
+		prev_alg_type = crypto_tfm_alg_type(prev->tfm);
+		alg_type = crypto_tfm_alg_type(areq->tfm);
+
+		if (alg_type != prev_alg_type)
+			return ERR_PTR(-ENOSPC);
+	}
+
+	cet = chan->tl + chan->reqs_no;
+	chan->reqs[chan->reqs_no] = areq;
+	chan->reqs_no++;
+
+	return cet;
+}
+
+void sun8i_ce_dequeue_one(struct sun8i_ce_flow *chan)
+{
+	if (chan->reqs_no) {
+		chan->reqs_no--;
+		chan->reqs[chan->reqs_no] = NULL;
+	}
+}
+
 static void sun8i_ce_free_chanlist(struct sun8i_ce_dev *ce, int i)
 {
 	while (i >= 0) {
 		crypto_engine_exit(ce->chanlist[i].engine);
 		if (ce->chanlist[i].tl)
-			dma_free_coherent(ce->dev, sizeof(struct ce_task),
+			dma_free_coherent(ce->dev,
+					  CE_DMA_TASK_DESCR_ALLOC_SIZE,
 					  ce->chanlist[i].tl,
 					  ce->chanlist[i].t_phy);
 		i--;
@@ -737,7 +834,9 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 	for (i = 0; i < MAXFLOW; i++) {
 		init_completion(&ce->chanlist[i].complete);
 
-		ce->chanlist[i].engine = crypto_engine_alloc_init(ce->dev, true);
+		ce->chanlist[i].engine = crypto_engine_alloc_init_and_set(
+					 ce->dev, true, sun8i_ce_do_batch, true,
+					 CE_MAX_REQS_PER_BATCH);
 		if (!ce->chanlist[i].engine) {
 			dev_err(ce->dev, "Cannot allocate engine\n");
 			i--;
@@ -750,9 +849,9 @@ static int sun8i_ce_allocate_chanlist(struct sun8i_ce_dev *ce)
 			goto error_engine;
 		}
 		ce->chanlist[i].tl = dma_alloc_coherent(ce->dev,
-							sizeof(struct ce_task),
-							&ce->chanlist[i].t_phy,
-							GFP_KERNEL);
+						CE_DMA_TASK_DESCR_ALLOC_SIZE,
+						&ce->chanlist[i].t_phy,
+						GFP_KERNEL);
 		if (!ce->chanlist[i].tl) {
 			dev_err(ce->dev, "Cannot get DMA memory for task %d\n",
 				i);
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
index 5d8ac1394c0c..73cfcdb2b951 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce-hash.c
@@ -350,7 +350,6 @@ static int sun8i_ce_hash_prepare(struct ahash_request *areq, struct ce_task *cet
 
 	cet->t_id = cpu_to_le32(rctx->flow);
 	common = ce->variant->alg_hash[algt->ce_algo_id];
-	common |= CE_COMM_INT;
 	cet->t_common_ctl = cpu_to_le32(common);
 
 	cet->t_sym_ctl = 0;
@@ -488,15 +487,15 @@ int sun8i_ce_hash_run(struct crypto_engine *engine, void *async_req)
 	int err;
 
 	chan = &ce->chanlist[rctx->flow];
-	cet = chan->tl;
+	cet = sun8i_ce_enqueue_one(chan, async_req);
+	if (IS_ERR(cet))
+		return PTR_ERR(cet);
 
 	err = sun8i_ce_hash_prepare(areq, cet);
-	if (err)
+	if (err) {
+		sun8i_ce_dequeue_one(chan);
 		return err;
-
-	err = sun8i_ce_run_task(ce, rctx->flow, crypto_ahash_alg_name(tfm));
-
-	sun8i_ce_hash_finalize_req(async_req, cet, err);
+	}
 
 	return 0;
 }
diff --git a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
index 1022fd590256..424deea18453 100644
--- a/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
+++ b/drivers/crypto/allwinner/sun8i-ce/sun8i-ce.h
@@ -104,6 +104,10 @@
 #define CE_DIE_ID_MASK	0x07
 
 #define MAX_SG 8
+#define CE_MAX_REQS_PER_BATCH			10
+#define CE_MAX_TASK_DESCR_DUMP_MSG_SIZE		12
+#define CE_DMA_TASK_DESCR_ALLOC_SIZE		\
+		(CE_MAX_REQS_PER_BATCH * sizeof(struct ce_task))
 
 #define CE_MAX_CLOCKS 4
 #define CE_DMA_TIMEOUT_MS	3000
@@ -191,6 +195,8 @@ struct ce_task {
  * @status:	set to 1 by interrupt if task is done
  * @t_phy:	Physical address of task
  * @tl:		pointer to the current ce_task for this flow
+ * @reqs:	array of requests to be processed in batch
+ * @reqs_no:	current number of requests in @reqs
  * @stat_req:	number of request done by this flow
  */
 struct sun8i_ce_flow {
@@ -199,6 +205,8 @@ struct sun8i_ce_flow {
 	int status;
 	dma_addr_t t_phy;
 	struct ce_task *tl;
+	struct crypto_async_request *reqs[CE_MAX_REQS_PER_BATCH];
+	int reqs_no;
 #ifdef CONFIG_CRYPTO_DEV_SUN8I_CE_DEBUG
 	unsigned long stat_req;
 #endif
@@ -373,6 +381,29 @@ struct sun8i_ce_alg_template {
 	char fbname[CRYPTO_MAX_ALG_NAME];
 };
 
+/**
+ * sun8i_ce_enqueue_one - add a request to the per-flow batch queue
+ * @chan: engine flow to enqueue the request
+ * @areq: request to be added to the batch queue
+ *
+ * This function adds request @areq to the batch queue in @chan. Should be
+ * called during do_one_request() crypto engine handler.
+ *
+ * @return - on success, task descriptor associated with the request
+ *         - on failure, ERR_PTR(-ENOSPC) if the queue was full or if the
+ *           request type is different from the requests already queued up
+ */
+struct ce_task *sun8i_ce_enqueue_one(struct sun8i_ce_flow *chan,
+				     struct crypto_async_request *areq);
+
+/**
+ * sun8i_ce_dequeue_one - remove head request from the per-flow batch queue
+ * @chan: engine flow to remove the request from
+ *
+ * This function removes the head request from the batch queue in @chan.
+ */
+void sun8i_ce_dequeue_one(struct sun8i_ce_flow *chan);
+
 int sun8i_ce_aes_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			unsigned int keylen);
 int sun8i_ce_des3_setkey(struct crypto_skcipher *tfm, const u8 *key,
-- 
2.49.0


