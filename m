Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0632C609CEFB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=P1Sn7Dw/;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=E9RytrjJ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Rg8ro+nVC+0k89M1QmhZ1e0RzR/D2AdQ8L9fKW1vx4=; b=P1Sn7Dw/c/khLSbvcmuDrkAavp
	BRIC0ti0mMlnoAa91w9DhMkPpxQshXry2qjF0vgNNbefhFBJhNsCGIsPf0d0y9iHdJmYD1+D3K2JS
	1h8wLO2USHFVmIpbtDXwsNJkltQpL55lfXja+E7ktBleSby1OaswQg8UL38gn7a4Ngv/Tm3CtZVuG
	a1huuEOx0vjxKc9npzqhg2tK+dMyJ+aB/g2CGc89zPX5Ytlskb8TckFlWYrTP8yDKf46aoEQXyMLt
	/iMsyjcBG7xMYKBKwZwgXQi3q3CvuO9ynkSZYt+C8FQaCnIkXLfYffyiZMTTYxqoxTvjynbldoTw/
	EnNoqTfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4Y-00000007p6f-34A8;
	Mon, 19 Oct 2026 15:14:46 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4S-00000007p49-15JH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422881; x=1823958881;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=1XahINlI+qtzt3WIrBdAjFdXjrmyMcpiOfQXjm/4WOY=;
  b=E9RytrjJIdJOSNNXr1cA6v++IImCFJ6nOD7KGkPe4esqbDfvngqau0ha
   ZdSOeAdRtHlQCAbuZI9mCyUuMPdN7m0ilQzKgaPrujq9YCsWny/A+QmHF
   T2t32GAsnlalmxCIPTNnAUefEAKjBJ9jehimoZMSJzwlRCfGCqXiLeSoz
   A5qu/9w3GyoJ/kuYYg6uugQxM8wPVqZLJ7jYX/9ewLbLh+kEYWAfc9VPI
   WeGU3WBvK5dH0L80gN6KH2PoexOU3Y0Q09Zb412vn3KkLFw4cBtijOv6Y
   0Fxz3BCeREUQHKIjcn1YU5mCNHLpODSxXcSbIH0cjbx9/Jlesfeo9bud5
   A==;
X-CSE-ConnectionGUID: kydj9vQQTnGluqeVKRj/8A==
X-CSE-MsgGUID: je4ukBSTQw24diqroaRjIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992133"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992133"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: wG5r3/fiQl2BWTJBHQT9Jw==
X-CSE-MsgGUID: X2Ddg/jvSledtfS/BnPcuA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636142"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:35 -0700
From: Daniel Byrne <daniel1.byrne@intel.com>
To: Vinod Koul <vkoul@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>,
	Frank Li <Frank.Li@kernel.org>,
	Vinicius Costa Gomes <vinicius.gomes@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Ludovic Desroches <ludovic.desroches@microchip.com>,
	dmaengine@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] dmaengine: idxd: generation-number transaction status
Date: Mon, 19 Oct 2026 08:06:31 -0700
Message-ID: <20261019150632.4026424-3-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019150632.4026424-1-daniel1.byrne@intel.com>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_081440_369295_E630DDBE 
X-CRM114-Status: GOOD (  34.94  )
X-Spam-Score: -4.7 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Implement device_tx_status() by reading the addressed descriptor's
completion record. The cookie encodes the descriptor id in its lower
16 bits and a generation number in the 14 bits above, so a query
against a recycled descriptor sees a stale cookie and reads
DMA_COMPLETE. The generation wraps after 16383 submissions of the same
slot; the contract is that a client polls a cookie to its terminal
answer, or abandons it, before its slot has been reused 16383 times,
which every in-tree polling client satisfies by construction.

Descriptors with a completion interrupt armed stay with the IRQ
handler: a generic client such as dmatest may request an interrupt,
and reading such a descriptor's completion record here would race with
the handler recycling it. tx_status therefore reports DMA_IN_PROGRESS
while such a cookie is live and the stale-cookie check answers once the
handler has completed it. Whether a descriptor is interrupt-armed
travels in the cookie, in the bit below the sign bit, since the
descriptor's own flags are rewritten when the handler recycles it.

A polled descriptor has two terminal answers. Its completion record
gives the first; the query retires the descriptor and reports
DMA_COMPLETE or DMA_ERROR from the status. The second is DMA_ERROR for
a descriptor outstanding on a work queue or a device that is no longer
enabled, since nothing will complete it; the slot is retired only when
the device halted, which kills it for good. Descriptors carry the
device's reset epoch from submit time for that, and the halt stores its
state before it bumps the epoch, so a poll that read the old epoch and
the halted state reads the epoch again and retires on a mismatch. The
same epoch lets device_synchronize() treat a drain that a halt ended
as complete, since the halt killed everything the drain covered.

Switch the prep callbacks' descriptor allocation to IDXD_OP_NONBLOCK:
prep callbacks may not sleep, and on an exhausted pool they return NULL
so the caller falls back. Direct kernel clients such as iaa_crypto keep
the blocking allocator path. This gives dmaengine_async_is_tx_complete()
exact per-descriptor results for polling clients on a device whose work
queues complete out of order across a group's engines.

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
---
 drivers/dma/idxd/device.c |   1 +
 drivers/dma/idxd/dma.c    | 158 ++++++++++++++++++++++++++++++++++++--
 drivers/dma/idxd/idxd.h   |   3 +
 drivers/dma/idxd/irq.c    |   8 ++
 4 files changed, 165 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/idxd/device.c b/drivers/dma/idxd/device.c
index 5ccdc5ff8d53..68a7de74f9e6 100644
--- a/drivers/dma/idxd/device.c
+++ b/drivers/dma/idxd/device.c
@@ -155,6 +155,7 @@ int idxd_wq_alloc_resources(struct idxd_wq *wq)
 			desc->iax_completion = &wq->iax_compls[i];
 		desc->compl_dma = wq->compls_addr + idxd->data->compl_size * i;
 		desc->id = i;
+		desc->gen = 1;
 		desc->wq = wq;
 		desc->cpu = -1;
 	}
diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index 0a7517cb51f2..dd5a9d9274ce 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -12,6 +12,20 @@
 #include "registers.h"
 #include "idxd.h"
 
+#define DMA_COOKIE_BITS (sizeof(dma_cookie_t) * 8)
+/*
+ * The descriptor id takes the lower 16 bits of the cookie.
+ */
+#define DESC_ID_BITS 16
+#define DESC_ID_MASK ((1 << DESC_ID_BITS) - 1)
+/*
+ * The generation takes the 14 bits above the id. Since dma_cookie_t is
+ * signed, the upper-most bit is left for the sign, and the bit below it
+ * records that the descriptor completes by interrupt.
+ */
+#define IDXD_COOKIE_RCI BIT(DMA_COOKIE_BITS - 2)
+#define DESC_GEN_MAX ((1 << (DMA_COOKIE_BITS - DESC_ID_BITS - 2)) - 1)
+
 static inline struct idxd_wq *to_idxd_wq(struct dma_chan *c)
 {
 	struct idxd_dma_chan *idxd_chan;
@@ -93,7 +107,7 @@ idxd_dma_prep_interrupt(struct dma_chan *c, unsigned long flags)
 		return NULL;
 
 	op_flag_setup(flags, &desc_flags);
-	desc = idxd_alloc_desc(wq, IDXD_OP_BLOCK);
+	desc = idxd_alloc_desc(wq, IDXD_OP_NONBLOCK);
 	if (IS_ERR(desc))
 		return NULL;
 
@@ -120,7 +134,7 @@ idxd_dma_submit_memcpy(struct dma_chan *c, dma_addr_t dma_dest,
 		return NULL;
 
 	op_flag_setup(flags, &desc_flags);
-	desc = idxd_alloc_desc(wq, IDXD_OP_BLOCK);
+	desc = idxd_alloc_desc(wq, IDXD_OP_NONBLOCK);
 	if (IS_ERR(desc))
 		return NULL;
 
@@ -154,11 +168,128 @@ static void idxd_dma_free_chan_resources(struct dma_chan *chan)
 		idxd_wq_refcount(wq));
 }
 
+/*
+ * A cookie has exactly one polling owner, the client that submitted the
+ * transaction. Observing a terminal completion record here retires and
+ * recycles the descriptor, since a polled descriptor has no interrupt
+ * and nobody else will. Two contexts polling the same live cookie
+ * would race that recycle, which every in-tree dmaengine polling
+ * client already avoids by construction.
+ */
 static enum dma_status idxd_dma_tx_status(struct dma_chan *dma_chan,
 					  dma_cookie_t cookie,
 					  struct dma_tx_state *txstate)
 {
-	return DMA_OUT_OF_ORDER;
+	struct idxd_wq *wq;
+	struct idxd_desc *desc;
+	u32 idx;
+	u8 status;
+
+	if (txstate)
+		memset(txstate, 0, sizeof(*txstate));
+
+	if (dma_submit_error(cookie))
+		return DMA_ERROR;
+
+	wq = to_idxd_wq(dma_chan);
+
+	idx = cookie & DESC_ID_MASK;
+	if (idx >= wq->num_descs)
+		return DMA_ERROR;
+
+	desc = wq->descs[idx];
+
+	/*
+	 * Descriptors with a completion interrupt armed (RCI) are
+	 * completed and recycled by the IRQ handler. Reading their
+	 * completion record here would race with the handler, and so
+	 * would reading the recycled descriptor's flags, which is why
+	 * the property travels in the cookie the caller owns. The handler
+	 * invalidates the cookie on completion, so a matching cookie means
+	 * the command is still in progress.
+	 */
+	if (cookie & IDXD_COOKIE_RCI)
+		return READ_ONCE(desc->txd.cookie) == cookie ?
+			DMA_IN_PROGRESS : DMA_COMPLETE;
+
+	if (desc->txd.cookie != cookie) {
+		/*
+		 * The cookie belongs to an old transaction that has
+		 * already completed and been recycled.
+		 */
+		return DMA_COMPLETE;
+	}
+
+	status = desc->completion->status & DSA_COMP_STATUS_MASK;
+
+	if (status) {
+		/* Capture completion record fields before desc is freed below. */
+		u8 fault_info = desc->completion->fault_info;
+		u64 fault_addr = desc->completion->fault_addr;
+
+		/*
+		 * Check against the original status because ABORT is
+		 * software defined as 0xff, which DSA_COMP_STATUS_MASK
+		 * can mask out.
+		 */
+		if (unlikely(desc->completion->status == IDXD_COMP_DESC_ABORT))
+			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
+		else
+			idxd_dma_complete_txd(desc, IDXD_COMPLETE_NORMAL, true, NULL, NULL);
+
+		dev_dbg(&wq->idxd->pdev->dev,
+			"dsa completion: status=0x%02x fault_info=0x%02x fault_addr=0x%llx\n",
+			status, fault_info, fault_addr);
+
+		if (status == DSA_COMP_SUCCESS)
+			return DMA_COMPLETE;
+
+		return DMA_ERROR;
+	}
+
+	/*
+	 * The descriptor is genuinely outstanding. A polled descriptor
+	 * carries no interrupt, so nothing but this function will ever
+	 * retire it, and a work queue or device that is no longer enabled
+	 * will not complete it either. Report the failure instead of
+	 * leaving the caller polling forever.
+	 *
+	 * A descriptor submitted before a device halt is dead for good:
+	 * the halt ended the engines and the reset that follows starts
+	 * them empty, so its record will never be written even once the
+	 * device is enabled again. Only in that case can the descriptor
+	 * be retired here safely; otherwise the pool would shrink by one
+	 * for every descriptor caught by a halt.
+	 */
+	if (desc->epoch != READ_ONCE(wq->idxd->reset_epoch)) {
+		idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true, NULL, NULL);
+		return DMA_ERROR;
+	}
+	/*
+	 * A device that is no longer enabled runs nothing it holds, so an
+	 * outstanding descriptor on it has failed. A halt stores its state
+	 * before it bumps the epoch, and this poll may have read the epoch
+	 * before the halt and the state after it, so the epoch is read
+	 * again: only the retire frees the slot of a descriptor the halt
+	 * caught. A halted device whose epoch still matches is between the
+	 * two stores, and the next poll retires the descriptor. The submit
+	 * reads the state after the stamp, so it refuses a descriptor
+	 * stamped with the bumped epoch.
+	 */
+	if (wq->idxd->state != IDXD_DEV_ENABLED) {
+		if (desc->epoch != READ_ONCE(wq->idxd->reset_epoch)) {
+			idxd_dma_complete_txd(desc, IDXD_COMPLETE_ABORT, true,
+					      NULL, NULL);
+			return DMA_ERROR;
+		}
+		if (wq->idxd->state == IDXD_DEV_HALTED)
+			return DMA_IN_PROGRESS;
+		return DMA_ERROR;
+	}
+	if (wq->state != IDXD_WQ_ENABLED)
+		return DMA_ERROR;
+
+	return DMA_IN_PROGRESS;
 }
 
 /*
@@ -177,7 +308,17 @@ static dma_cookie_t idxd_dma_tx_submit(struct dma_async_tx_descriptor *tx)
 	int rc;
 	struct idxd_desc *desc = container_of(tx, struct idxd_desc, txd);
 
-	cookie = dma_cookie_assign(tx);
+	cookie = (desc->gen << DESC_ID_BITS) | (desc->id & DESC_ID_MASK);
+	if (desc->hw->flags & IDXD_OP_FLAG_RCI)
+		cookie |= IDXD_COOKIE_RCI;
+
+	if (desc->gen == DESC_GEN_MAX)
+		desc->gen = 1;
+	else
+		desc->gen++;
+
+	tx->cookie = cookie;
+	desc->epoch = READ_ONCE(wq->idxd->reset_epoch);
 
 	rc = idxd_submit_desc(wq, desc);
 	if (rc < 0) {
@@ -219,6 +360,7 @@ static void idxd_dma_synchronize(struct dma_chan *c)
 {
 	struct idxd_wq *wq = to_idxd_wq(c);
 	LIST_HEAD(quarantined);
+	u32 epoch;
 
 	/*
 	 * dmaengine_synchronize() promises the client that its memory may
@@ -240,7 +382,13 @@ static void idxd_dma_synchronize(struct dma_chan *c)
 	 * Only a device reset ends the exposure of the client's memory.
 	 */
 	idxd_wq_quarantine_take(wq, &quarantined);
-	if (!idxd_wq_drain(wq)) {
+	/*
+	 * A halt during the drain kills every descriptor submitted before
+	 * it, which is all of them, and a reset that followed may have
+	 * ended the drain itself. Such a drain is as good as complete.
+	 */
+	epoch = READ_ONCE(wq->idxd->reset_epoch);
+	if (!idxd_wq_drain(wq) || READ_ONCE(wq->idxd->reset_epoch) != epoch) {
 		idxd_wq_quarantine_free(wq, &quarantined);
 		WRITE_ONCE(wq->stuck, false);
 		return;
diff --git a/drivers/dma/idxd/idxd.h b/drivers/dma/idxd/idxd.h
index b0cfd7101174..7fe5ec6c3bf3 100644
--- a/drivers/dma/idxd/idxd.h
+++ b/drivers/dma/idxd/idxd.h
@@ -349,6 +349,7 @@ struct idxd_device {
 	spinlock_t cmd_lock;	/* spinlock for device commands */
 	struct completion *cmd_done;
 	u32 cmd_seq;		/* bumps when a command starts running */
+	u32 reset_epoch;	/* bumps on every device halt */
 	struct idxd_group **groups;
 	struct idxd_wq **wqs;
 	struct idxd_engine **engines;
@@ -447,9 +448,11 @@ struct idxd_desc {
 	struct list_head list;
 	int id;
 	int cpu;
+	u16 gen;
 	u16 terminate_gen;	/* the queue's terminate_gen at an
 				 * interrupt-armed submit
 				 */
+	u32 epoch;		/* the device reset_epoch at submit */
 	struct idxd_wq *wq;
 };
 
diff --git a/drivers/dma/idxd/irq.c b/drivers/dma/idxd/irq.c
index 8217698056bb..5e34790359ee 100644
--- a/drivers/dma/idxd/irq.c
+++ b/drivers/dma/idxd/irq.c
@@ -508,6 +508,14 @@ static irqreturn_t idxd_halt(struct idxd_device *idxd)
 	gensts.bits = ioread32(idxd->reg_base + IDXD_GENSTATS_OFFSET);
 	if (gensts.state == IDXD_DEVICE_STATE_HALT) {
 		idxd->state = IDXD_DEV_HALTED;
+		/*
+		 * Every descriptor submitted before this point is dead: the
+		 * device will never write its completion record. Pollers
+		 * compare their descriptor's epoch against this to retire
+		 * such descriptors instead of waiting for a record that never
+		 * comes.
+		 */
+		WRITE_ONCE(idxd->reset_epoch, idxd->reset_epoch + 1);
 		if (gensts.reset_type == IDXD_DEVICE_RESET_SOFTWARE) {
 			/* The reinit below re-enables the queues, so revive them. */
 			idxd_wqs_halt_flush(idxd, true);
-- 
2.43.0


