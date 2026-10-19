Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFFD609CEF7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Y0b96+p6;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Tg+zUoit
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z2W4QtM//rkXfqjHQ7/TEqFOqtfnpjSrxUFW4r4yHmY=; b=Y0b96+p6zRyMv6v7wRw3bCbbqw
	VL93OYLM93Ti7JLRKf1+3WWkHXTcYmRpNpL7nPjXjWN0f3RoW+iSvuUqBqbKT/Qmm8KXCoosgAnu0
	VIuOVL7Iu6Nyt0zCWbSeeFP6PtXrRiLhhYNxjuhk6ThwVqTh+8+Av+/YTdgF8arPg4e4pXTTjEvfZ
	oNXbtDkQOnodEb5xtQzTRqcn4G3SQ7jPYGhxpvrqI3t2kT835pirYW1heeWA5VAp74NsLC9keOWPj
	ZFv0sH4+uiZpXMrGqQFuSkLFQ54htzt73NFfSwmadbrJWCYEA7srLQpxXqEj5m2aOKeo90bP2/FnH
	sS1sLY+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4Y-00000007p6y-3c3b;
	Mon, 19 Oct 2026 15:14:47 +0000
Received: from mgamail.intel.com ([198.175.65.9])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIp4T-00000007p3B-1ynD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:14:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792422882; x=1823958882;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=4TTqTt9wzLanOmqx5tRJYgHRoGJHQa7XuL3mClvOZ3Q=;
  b=Tg+zUoitnEybvlFOE9PVGzSHX2NcsqfeRnI846lsf97DtxuIQucbJ0XQ
   fXaNdyD5Hxb+j4dJNgP78FGrNPSHxN3urZz01FjexnxreoAWn1TrgOu8F
   2MMzMEtUWwmiF23fJ1PMI8nXZ0KFpA5HYJdCFGVKqhdFSTJyjZuSYd5LP
   SRYHM7w8t4KWMyawWhEYiZ9YshoXji+t2o2ogkisnhAp8w5ttHtQJLJSj
   42uSO+bHGS8xHuVkH5keNRS4E7e18aInvrTf1yRCZzOelMouXj1HR7Oa1
   OI1CbeBwGbcH4NdKEfszlZ85atVjAYAsUUmtjSH41PyXkclAvMMCbfdlR
   g==;
X-CSE-ConnectionGUID: oBeFgwmATkuABXjNuPkbXA==
X-CSE-MsgGUID: eNPVOjXcR5m4Vp8hiEoAxw==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="992138"
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="992138"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 08:14:36 -0700
X-CSE-ConnectionGUID: Es0OG1AjQvONz3CixRLctA==
X-CSE-MsgGUID: jLfSd1UcT+SHn92uwWKARg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,167,1787036400"; 
   d="scan'208";a="2636147"
Received: from jf5300-15a101203tc.jf.intel.com (HELO meta-crater2c.jf.intel.com) ([10.54.113.49])
  by fmviesa005.fm.intel.com with ESMTP; 19 Oct 2026 08:14:36 -0700
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
Subject: [PATCH 3/3] dmaengine: drop DMA_COMPLETION_NO_ORDER and DMA_OUT_OF_ORDER
Date: Mon, 19 Oct 2026 08:06:32 -0700
Message-ID: <20261019150632.4026424-4-daniel1.byrne@intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261019150632.4026424-1-daniel1.byrne@intel.com>
References: <20261019150632.4026424-1-daniel1.byrne@intel.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_081441_673798_CEBC0061 
X-CRM114-Status: GOOD (  23.23  )
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

DMA_COMPLETION_NO_ORDER (commit 47ec7f09bc10 ("dmaengine: cookie bypass
for out of order completion")) flagged devices whose completions can
overtake submission order. On DSA this happens when a work queue (one
dmaengine channel) belongs to a group that contains several engines.
Per-channel cookie tracking gives wrong answers in this case, since
dma_cookie_complete() moves the completed-cookie watermark past
still-in-flight earlier descriptors, so cookie-order status can report
DMA_COMPLETE for a running transfer. Clients were told to use
callbacks only, dmatest refused polled mode, and DMA_OUT_OF_ORDER
existed as the tx_status answer for such devices.

idxd, the only in-tree setter, now answers
dmaengine_async_is_tx_complete() from per-descriptor generation
numbers, exactly within the limits that helper's kernel-doc states: for
a transaction submitted without DMA_PREP_INTERRUPT, on the first query
that reports it finished. Polling an out-of-order device is therefore
safe and neither the capability nor the status code has any remaining
meaning. Drop them.

Whether reordering occurs at all is group configuration rather than a
device property. A group with a single engine completes its work
queues' descriptors in order. However, the driver cannot assume how
the administrator grouped engines, and the all-engines-in-one-group
layout is the device's throughput configuration.

Assisted-by: Claude:claude-opus-5-5
Assisted-by: Claude:claude-fable-5-1
Signed-off-by: Daniel Byrne <daniel1.byrne@intel.com>
---
 .../driver-api/dmaengine/provider.rst         | 19 -------------------
 drivers/dma/dmatest.c                         | 11 +----------
 drivers/dma/idxd/dma.c                        |  1 -
 include/linux/dmaengine.h                     |  5 +----
 4 files changed, 2 insertions(+), 34 deletions(-)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index ef342886af96..435ccd3bedac 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -260,22 +260,6 @@ Currently, the types available are:
     want to transfer a portion of uncompressed data directly to the
     display to print it
 
-- DMA_COMPLETION_NO_ORDER
-
-  - The device does not support in order completion.
-
-  - The driver should return DMA_OUT_OF_ORDER for device_tx_status if
-    the device is setting this capability.
-
-  - All cookie tracking and checking API should be treated as invalid if
-    the device exports this capability.
-
-  - At this point, this is incompatible with polling option for dmatest.
-
-  - If this cap is set, the user is recommended to provide an unique
-    identifier for each descriptor sent to the DMA device in order to
-    properly track the completion.
-
 - DMA_REPEAT
 
   - The device supports repeated transfers. A repeated transfer, indicated by
@@ -468,9 +452,6 @@ supported.
   - In the case of a cyclic transfer, it should only take into
     account the total size of the cyclic buffer.
 
-  - Should return DMA_OUT_OF_ORDER if the device does not support in order
-    completion and is completing the operation out of order.
-
   - This function can be called in an interrupt context.
 
 - device_config
diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 3d0d54a97add..fbfa2f1d6f29 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -854,10 +854,7 @@ static int dmatest_func(void *data)
 			result("test timed out", total_tests, src->off, dst->off,
 			       len, 0);
 			goto error_unmap_continue;
-		} else if (status != DMA_COMPLETE &&
-			   !(dma_has_cap(DMA_COMPLETION_NO_ORDER,
-					 dev->cap_mask) &&
-			     status == DMA_OUT_OF_ORDER)) {
+		} else if (status != DMA_COMPLETE) {
 			result(status == DMA_ERROR ?
 			       "completion error status" :
 			       "completion busy status", total_tests, src->off,
@@ -1035,12 +1032,6 @@ static int dmatest_add_channel(struct dmatest_info *info,
 	dtc->chan = chan;
 	INIT_LIST_HEAD(&dtc->threads);
 
-	if (dma_has_cap(DMA_COMPLETION_NO_ORDER, dma_dev->cap_mask) &&
-	    info->params.polled) {
-		info->params.polled = false;
-		pr_warn("DMA_COMPLETION_NO_ORDER, polled disabled\n");
-	}
-
 	if (dma_has_cap(DMA_MEMCPY, dma_dev->cap_mask)) {
 		if (dmatest == 0) {
 			cnt = dmatest_add_threads(info, dtc, DMA_MEMCPY);
diff --git a/drivers/dma/idxd/dma.c b/drivers/dma/idxd/dma.c
index dd5a9d9274ce..19340c7ae2d3 100644
--- a/drivers/dma/idxd/dma.c
+++ b/drivers/dma/idxd/dma.c
@@ -417,7 +417,6 @@ int idxd_register_dma_device(struct idxd_device *idxd)
 
 	dma_cap_set(DMA_INTERRUPT, dma->cap_mask);
 	dma_cap_set(DMA_PRIVATE, dma->cap_mask);
-	dma_cap_set(DMA_COMPLETION_NO_ORDER, dma->cap_mask);
 	dma->device_release = idxd_dma_release;
 
 	dma->device_prep_dma_interrupt = idxd_dma_prep_interrupt;
diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 83bef7a70b99..9f73470759bb 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -39,7 +39,6 @@ enum dma_status {
 	DMA_IN_PROGRESS,
 	DMA_PAUSED,
 	DMA_ERROR,
-	DMA_OUT_OF_ORDER,
 };
 
 /**
@@ -62,7 +61,6 @@ enum dma_transaction_type {
 	DMA_SLAVE,
 	DMA_CYCLIC,
 	DMA_INTERLEAVE,
-	DMA_COMPLETION_NO_ORDER,
 	DMA_REPEAT,
 	DMA_LOAD_EOT,
 /* last transaction type for creation of the capabilities mask */
@@ -1632,8 +1630,7 @@ static inline enum dma_status dma_async_is_tx_complete(struct dma_chan *chan,
  * has finished. Once the first terminal answer has retired the
  * descriptor, a later query for the same cookie reads DMA_COMPLETE.
  *
- * Return: DMA_COMPLETE, DMA_IN_PROGRESS, DMA_PAUSED, DMA_ERROR or
- * DMA_OUT_OF_ORDER.
+ * Return: DMA_COMPLETE, DMA_IN_PROGRESS, DMA_PAUSED or DMA_ERROR.
  */
 static inline enum dma_status dmaengine_async_is_tx_complete(struct dma_chan *chan,
 	dma_cookie_t cookie)
-- 
2.43.0


