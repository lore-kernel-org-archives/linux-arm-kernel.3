Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79321609CEF4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:14:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Teufcvh6;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=hhs5iXBY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RLjqAdwihfwMILiMHPnz0FYmmo76i0aPQCh334CV9WE=; b=Teufcvh6NQ1skN1Rr6DvOKJ0FW
	wLnNiMQoJN6/Z01gZzKn9XvT3iJjkrKbPgRxU8st91jc1Nh/mLxp8nUH5Dyo/Br1s5QyFXY4634fC
	etGG0E9RKolCLm/wp5wHa6iHo3P7iozl2rnJq8q17ejLEaHMc5n3dPSAF14gx1/I7Lvat9dHu/aSj
	3cpfJ6r0Egpc4Q5dj1oXZX7cShPVkrgUKVbZbDpapTNZXvvlJAimjSMz6MTVONaGBZkkP2lYmJgpC
	X9XQtCOFdwGq3bBi7b/GBh5g03xowGRKSbSOmVO/oLp5pFE/aP9VXvZuS3o4CnByjJyIjpB/dO5rU
	L/5xl/nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4Y-00000007p6N-0bNj;
	Mon, 19 Oct 2026 15:14:46 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4S-00000007p3B-0KZq
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:14:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422880; x=1823958880;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=TDUC9/ygnBevxT8Y20L5HUe3WFLonkXYpQ/2lAUky5g=;
  b=hhs5iXBYtAnCgHR9dtVeX8KDDns2LkT5K3yVO6iaQb9kJlE1BSw2BG0b
   tfYoshZ9fZnF070tf/shAnLW427m0oQQVOLDV/DhTR/5FOosbXnopzdmH
   h/RNQOjxn/EWQd9DfOXLwVdBmYdn0SDjgncq2AXiuOUUzmefraB8feYzI
   FVDJ4NS4i/WuwP2GHhW/jMOhiPOhR9jtw9Tb6/tglq69pHJsXkrUGKlyo
   ECVT37ax13PbafphK0B3Ziuafb8GlSluUizcUkUFMQ8fZzAU45NTXq3XN
   ejvj/NqIvpB0yGWgICs85Jly9oOuHDF6Hhd1hjWtdVSC2UlxkpLVDvkYx
   Q==;
X-CSE-ConnectionGUID: ZuPSM5EES1q4s8ODrV7AFQ==
X-CSE-MsgGUID: Xv18k2XeRL6Q4ZnnFTP3lQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992127"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992127"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: ts3hCmxIRqujsEnHjHCn9g==
X-CSE-MsgGUID: IxcBpJplQy6yQzPxTgk6JQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636138"
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
Subject: [PATCH 1/3] dmaengine: add dmaengine_async_is_tx_complete() for channel status queries
Date: Mon, 19 Oct 2026 08:06:30 -0700
Message-ID: <20261019150632.4026424-2-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019150632.4026424-1-daniel1.byrne@intel.com>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_081440_175699_5BB1EDB7 
X-CRM114-Status: GOOD (  32.63  )
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

Add dmaengine_async_is_tx_complete() as the client API for polling the
completion of one transaction. Like dma_async_is_tx_complete(), which
it deprecates, it routes the query to the channel's device_tx_status()
callback; the change is that it drops the @last and @used outputs,
which only make sense for providers that complete in cookie order.
A provider that tracks per-descriptor state can answer exactly from
that state, and a high-rate in-kernel polling user, the io_uring DSA
copy offload to be posted separately, depends on such answers.

The kernel-doc says how far such an answer goes. It is exact for a
transaction submitted without DMA_PREP_INTERRUPT, on the first query
that reports it finished. An interrupt-armed transaction reports its
result through callback_result, and a cookie whose descriptor has been
retired reads DMA_COMPLETE. The client guide's advice to pause or stop
the channel before a query points at that text.

dma_async_is_complete() was only used through dma_cookie_status(), so
delete it from the client header and open-code the cookie-window
comparison there. Move dma_set_tx_state(), which only providers call,
from the client header into drivers/dma/dmaengine.h; every in-tree
user already includes it. Convert dma_sync_wait() and dmatest to the
new helper, fix the two comments that still name the deleted helper,
and document the cookie assignment helpers in the provider guide.

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
---
 Documentation/driver-api/dmaengine/client.rst | 24 ++++-----
 .../driver-api/dmaengine/provider.rst         | 45 ++++++++++++++--
 drivers/dma/amba-pl08x.c                      |  2 +-
 drivers/dma/at_hdmac.c                        |  5 +-
 drivers/dma/dmaengine.c                       |  2 +-
 drivers/dma/dmaengine.h                       | 21 +++++++-
 drivers/dma/dmatest.c                         |  3 +-
 include/linux/dmaengine.h                     | 54 +++++++++----------
 8 files changed, 103 insertions(+), 53 deletions(-)

diff --git a/Documentation/driver-api/dmaengine/client.rst b/Documentation/driver-api/dmaengine/client.rst
index 5ee5d4a3596d..255aaad33339 100644
--- a/Documentation/driver-api/dmaengine/client.rst
+++ b/Documentation/driver-api/dmaengine/client.rst
@@ -277,8 +277,8 @@ The details of these operations are:
 
       dma_cookie_t dmaengine_submit(struct dma_async_tx_descriptor *desc)
 
-   This returns a cookie can be used to check the progress of DMA engine
-   activity via other DMA engine calls not covered in this document.
+   This returns a cookie that can be used to check the progress of a transaction
+   via dmaengine_async_is_tx_complete().
 
    dmaengine_submit() will not start the DMA operation, it merely adds
    it to the pending queue. For this, see step 5, dma_async_issue_pending.
@@ -357,23 +357,23 @@ Further APIs
 
    .. code-block:: c
 
-      enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
-		dma_cookie_t cookie, dma_cookie_t *last, dma_cookie_t *used)
+      enum dma_status dmaengine_async_is_tx_complete(struct dma_chan *chan,
+		dma_cookie_t cookie)
 
-   This can be used to check the status of the channel. Please see
-   the documentation in include/linux/dmaengine.h for a more complete
-   description of this API.
-
-   This can be used in conjunction with dma_async_is_complete() and
-   the cookie returned from dmaengine_submit() to check for
-   completion of a specific DMA transaction.
+   This can be used with the cookie returned from dmaengine_submit()
+   to check for completion of a specific DMA transaction.
 
    .. note::
 
       Not all DMA engine drivers can return reliable information for
       a running DMA channel. It is recommended that DMA engine users
       pause or stop (via dmaengine_terminate_all()) the channel before
-      using this API.
+      using this API, unless the provider tracks per-descriptor state.
+      Even such a provider answers exactly only within the limits that
+      the kernel-doc of dmaengine_async_is_tx_complete() in
+      include/linux/dmaengine.h describes: for a transaction submitted
+      without DMA_PREP_INTERRUPT, and on the first query that reports it
+      finished.
 
 5. Synchronize termination API
 
diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index f4ed98f701c9..ef342886af96 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -419,7 +419,9 @@ supported.
 
     - tx_submit: A pointer to a function you have to implement,
       that is supposed to push the current transaction descriptor to a
-      pending queue, waiting for issue_pending to be called.
+      pending queue, waiting for issue_pending to be called. Each
+      descriptor is given a cookie to identify it. See the section
+      "Cookie Management" below.
 
     - phys: Physical address of the descriptor which is used later by
       the dma engine to read the descriptor and initiate transfer.
@@ -533,6 +535,41 @@ supported.
 
   - May sleep.
 
+Cookie Management
+------------------
+
+When a transaction is queued for submission via tx_submit(), the provider
+must assign that transaction a cookie (dma_cookie_t) to uniquely identify it.
+The provider is allowed to perform this assignment however it wants, but for
+convenience the following utility functions are available to create
+monotonically increasing cookies:
+
+  .. code-block:: c
+
+    void dma_cookie_init(struct dma_chan *chan);
+
+  Called once at channel creation.
+
+  .. code-block:: c
+
+    dma_cookie_t dma_cookie_assign(struct dma_async_tx_descriptor *tx);
+
+  Assign a cookie to the given descriptor.
+
+  .. code-block:: c
+
+    void dma_cookie_complete(struct dma_async_tx_descriptor *tx);
+
+  Mark the descriptor as complete and invalidate the cookie.
+
+  .. code-block:: c
+
+    enum dma_status dma_cookie_status(struct dma_chan *chan,
+      dma_cookie_t cookie, struct dma_tx_state *state);
+
+  Report the status of the cookie, filling in the state structure if
+  it is not NULL.
+
 
 Misc notes
 ==========
@@ -550,10 +587,10 @@ where to put them)
 
 dma_cookie_t
 
-- it's a DMA transaction ID that will increment over time.
+- it's a DMA transaction ID.
 
-- Not really relevant any more since the introduction of ``virt-dma``
-  that abstracts it away.
+- The value can be chosen by the provider, or use the helper APIs
+  such as dma_cookie_assign() and dma_cookie_complete().
 
 dma_vec
 
diff --git a/drivers/dma/amba-pl08x.c b/drivers/dma/amba-pl08x.c
index 5e88fd44812d..8c235a603bb0 100644
--- a/drivers/dma/amba-pl08x.c
+++ b/drivers/dma/amba-pl08x.c
@@ -1536,7 +1536,7 @@ static void pl08x_free_chan_resources(struct dma_chan *chan)
 }
 
 /*
- * Code accessing dma_async_is_complete() in a tight loop may give problems.
+ * Code polling the transaction status in a tight loop may give problems.
  * If slaves are relying on interrupts to signal completion this function
  * must not be called with interrupts disabled.
  */
diff --git a/drivers/dma/at_hdmac.c b/drivers/dma/at_hdmac.c
index e5b30a57c477..7ea0822a3900 100644
--- a/drivers/dma/at_hdmac.c
+++ b/drivers/dma/at_hdmac.c
@@ -1666,9 +1666,8 @@ static int atc_terminate_all(struct dma_chan *chan)
  * @cookie: transaction identifier to check status of
  * @txstate: if not %NULL updated with transaction state
  *
- * If @txstate is passed in, upon return it reflect the driver
- * internal state and can be used with dma_async_is_complete() to check
- * the status of multiple cookies without re-checking hardware state.
+ * If @txstate is passed in, upon return it reflects the driver
+ * internal state: the last completed and the last issued cookie.
  */
 static enum dma_status
 atc_tx_status(struct dma_chan *chan,
diff --git a/drivers/dma/dmaengine.c b/drivers/dma/dmaengine.c
index ced78c985d1c..d7febef65a2d 100644
--- a/drivers/dma/dmaengine.c
+++ b/drivers/dma/dmaengine.c
@@ -537,7 +537,7 @@ enum dma_status dma_sync_wait(struct dma_chan *chan, dma_cookie_t cookie)
 
 	dma_async_issue_pending(chan);
 	do {
-		status = dma_async_is_tx_complete(chan, cookie, NULL, NULL);
+		status = dmaengine_async_is_tx_complete(chan, cookie);
 		if (time_after_eq(jiffies, dma_sync_wait_timeout)) {
 			dev_err(chan->device->dev, "%s: timeout!\n", __func__);
 			return DMA_ERROR;
diff --git a/drivers/dma/dmaengine.h b/drivers/dma/dmaengine.h
index 53f16d3f0029..e72876a512a3 100644
--- a/drivers/dma/dmaengine.h
+++ b/drivers/dma/dmaengine.h
@@ -79,7 +79,26 @@ static inline enum dma_status dma_cookie_status(struct dma_chan *chan,
 		state->residue = 0;
 		state->in_flight_bytes = 0;
 	}
-	return dma_async_is_complete(cookie, complete, used);
+
+	if (complete <= used) {
+		if ((cookie <= complete) || (cookie > used))
+			return DMA_COMPLETE;
+	} else {
+		if ((cookie <= complete) && (cookie > used))
+			return DMA_COMPLETE;
+	}
+	return DMA_IN_PROGRESS;
+}
+
+static inline void dma_set_tx_state(struct dma_tx_state *st,
+	dma_cookie_t last, dma_cookie_t used, u32 residue)
+{
+	if (!st)
+		return;
+
+	st->last = last;
+	st->used = used;
+	st->residue = residue;
 }
 
 static inline void dma_set_residue(struct dma_tx_state *state, u32 residue)
diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..3d0d54a97add 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -847,8 +847,7 @@ static int dmatest_func(void *data)
 					done->done,
 					msecs_to_jiffies(params->timeout));
 
-			status = dma_async_is_tx_complete(chan, cookie, NULL,
-							  NULL);
+			status = dmaengine_async_is_tx_complete(chan, cookie);
 		}
 
 		if (!done->done) {
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 4178248611d9..83bef7a70b99 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -1596,9 +1596,12 @@ static inline void dma_async_issue_pending(struct dma_chan *chan)
  * @last: returns last completed cookie, can be NULL
  * @used: returns last issued cookie, can be NULL
  *
- * If @last and @used are passed in, upon return they reflect the driver
- * internal state and can be used with dma_async_is_complete() to check
- * the status of multiple cookies without re-checking hardware state.
+ * This function is deprecated. New code should use
+ * dmaengine_async_is_tx_complete() instead.
+ *
+ * If @last and @used are passed in, upon return they reflect the most
+ * recently submitted (used) cookie and the most recently completed
+ * cookie.
  */
 static inline enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
 	dma_cookie_t cookie, dma_cookie_t *last, dma_cookie_t *used)
@@ -1615,36 +1618,29 @@ static inline enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
 }
 
 /**
- * dma_async_is_complete - test a cookie against chan state
- * @cookie: transaction identifier to test status of
- * @last_complete: last know completed transaction
- * @last_used: last cookie value handed out
+ * dmaengine_async_is_tx_complete - poll for transaction completion
+ * @chan: DMA channel
+ * @cookie: transaction identifier to check status of
  *
- * dma_async_is_complete() is used in dma_async_is_tx_complete()
- * the test logic is separated for lightweight testing of multiple cookies
+ * Query the provider's device_tx_status() callback for the state of a
+ * single transaction. Providers that rely on cookie ordering answer with
+ * the cookie-window approximation. Providers that track per-descriptor
+ * state can answer exactly, but only for a transaction submitted without
+ * DMA_PREP_INTERRUPT and only on the first query that reports it
+ * finished. A transaction submitted with DMA_PREP_INTERRUPT reports its
+ * result through callback_result, and the query only tells whether it
+ * has finished. Once the first terminal answer has retired the
+ * descriptor, a later query for the same cookie reads DMA_COMPLETE.
+ *
+ * Return: DMA_COMPLETE, DMA_IN_PROGRESS, DMA_PAUSED, DMA_ERROR or
+ * DMA_OUT_OF_ORDER.
  */
-static inline enum dma_status dma_async_is_complete(dma_cookie_t cookie,
-			dma_cookie_t last_complete, dma_cookie_t last_used)
-{
-	if (last_complete <= last_used) {
-		if ((cookie <= last_complete) || (cookie > last_used))
-			return DMA_COMPLETE;
-	} else {
-		if ((cookie <= last_complete) && (cookie > last_used))
-			return DMA_COMPLETE;
-	}
-	return DMA_IN_PROGRESS;
-}
-
-static inline void
-dma_set_tx_state(struct dma_tx_state *st, dma_cookie_t last, dma_cookie_t used, u32 residue)
+static inline enum dma_status dmaengine_async_is_tx_complete(struct dma_chan *chan,
+	dma_cookie_t cookie)
 {
-	if (!st)
-		return;
+	struct dma_tx_state state;
 
-	st->last = last;
-	st->used = used;
-	st->residue = residue;
+	return chan->device->device_tx_status(chan, cookie, &state);
 }
 
 #ifdef CONFIG_DMA_ENGINE
-- 
2.43.0


