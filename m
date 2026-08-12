Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AF1C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 22:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rlblx6qt1rqemUxEZ6qZUYhzuNbcWAL6YV0Kj3/NsUE=; b=nvu9xDuihR4Z5BN848z5di4Y51
	v9Dj5xixOVZ3lmkz8spXadHz1ZNR8c6yQ4WV1akOfU5fwOHZSb2A/P3Fc2RhWSP0YW7w1r48bM6mU
	gpiiK5v2LTWBCzZYpmhuJch+Q6Sob4tupcBX7nmbyl4+qJmqWcXUgwuL3HYh6+7xD1rxVpzsFIkc/
	Qq/gpmKqGMt+/3rJr4/wLo/OZiB1XB9NRYIACdR2XdrU/9sZvUmuX30lRgsnFcjD2XB2eP9YKE4lS
	XojAFBO/mt1HAkSFF2V7oUO6J0nXrGAv6WVhf0p7G0azoS3+OgI/y7m+dSlcE5O6BAHkaCLZ2mTGf
	G60uMjnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuHfN-0000000H6IY-1K3N;
	Wed, 12 Aug 2026 22:43:21 +0000
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuHfJ-0000000H6H6-1DWq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 22:43:18 +0000
Received: by mail-pg1-x532.google.com with SMTP id 41be03b00d2f7-c9e7391839cso1337110a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Aug 2026 15:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivian.com; s=google; t=1786574596; x=1787179396; darn=lists.infradead.org;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rlblx6qt1rqemUxEZ6qZUYhzuNbcWAL6YV0Kj3/NsUE=;
        b=YY6KU6gp4I+XoEkvoosZzeI37HHbQB6NZNPwVD67eFmGcV5V0BTCBMj/5bNuyIVOvy
         rOok/U0U2SnOnQGxh6EdqPv+QGW46wJT+f247+QiDoeFv8umZUXervWaDPul11kNYFmw
         tvTSVxi7Aj/AqnjAEoDGWUe90g5Z82mKqpAKsr3nQI/KQyKeHjQUbHM6g+XQlu62wBk3
         /bwxmeao2048HXkxhzue5YsVbGIXEj5s7zxEjHbk0k9fPuh+LA+k665uEC1SMiSbwfLD
         b50zPtJDlf2u54KCpNF2IHBlb4FpUJ7gzZHDcE+71LyfaTTCa94PKI9ZPInpf6pxm/7U
         ZfAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786574596; x=1787179396;
        h=content-type:mime-version:references:in-reply-to:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=rlblx6qt1rqemUxEZ6qZUYhzuNbcWAL6YV0Kj3/NsUE=;
        b=oi3SxilJoe3yB9/rXS0PNKe79YTRWfM3hR9WP9Nr7yfpXmbX9D6H6zPfkRBQbaWRyB
         NlOZltg5oPVZqZQLpOdaqQ1SJY0dmkYv7Os1W9eAKse6vACjf+sY9kHMRhJoU3uJDRB4
         ix7Is9jmTlRgYzlpUmJ4+JcZ8QC4mwB4EBtmq+GG3XRRdgCLuZpAE3yCVlJqZYeYr9zh
         zN91befWii0VfTaGoorVvB39PyPWMKYz0ipMxaPGJIHh+7DXs7bGe4RTvXG3dqXcfTSy
         0v5JXvQdNRx4o3xravMf6tKhjbAD6q03Z6sg4MNrCTt4GcChvkHeFIwcs3yAOoUI5t4S
         CJmw==
X-Forwarded-Encrypted: i=1; AHgh+RriUEAUAj15UW6z7fzMRtXtNuUg9LzadRIPxobbhjLCxaUEO/RPnm9hz8UHQN2+rX9fOfk2ViA+IcobnyOziUU5@lists.infradead.org
X-Gm-Message-State: AOJu0Yy40DaMnZcmEKzxfQHjJbgs0NPdV/OexWFD1Ik63RKjc3F4DhZ9
	63aE4hmFOWLz7S8aTbSWJ3cl9sdznIobWn68E9o2TFoqBIxDn1FdorkivStKYNlgx39392qbyXb
	fc1BbPeANZc9U5igTVfIa2ODjBporsaLk1gJCjoyk9PEFHmZA8ZsEDiRoTxp6nUO6JikO2A==
X-Gm-Gg: AR+sD127TAjU0j1bBPqn48ClqqGarpK6V5wlZXrEnnMics3rfqDY9JbAEIfx5BqdpY4
	NqOw90fjMZ+V5atqe0hPjvU1OIZD4r/DKxap7tW8l5zu89FweZ6N3IZK7AES4N4JEZKLO6esnb4
	hvxDgMQTlfRrF2m9aFzi71DZyYuF9s+/PW4wbzZbKDH0rpUzeez6KykMUZiVlXj/Hd9JxdrRj17
	PQoLJ2fcV115g4RGIXsqJl/EDez8DvhZeriTJb3g1ot2tXiSOywFFhJqYiE1FgtFypcBMDkjFQ/
	6rY1taoAbLDyOsIP+HsVN1/4NvitcjI97BJXImishrqJqZlqtxS7JWR+YpAJh1M+DvB1gnyj4gi
	hugCOcl27RMvp6wmPpc2IoZxaCf0663DrBnmhFGauulEOlgq6Dlsbe2nnzvBEJrH9rgvxrPtgfH
	EVugOMk/it5zhzTsVjmHiCYu3DBBJibsnPAEdEw4UT8DOQjOEnhIvytQqacC0o/arCYc+nLCB1F
	EBonuhCuQbokZcfnXiB+FgHNuPkzlUPBUno4YoBM1WSWDUexSdZ6vQtERtYVMA1iUq4UDhRuv+W
	1x1A3CKfWvS/iP3t
X-Received: by 2002:a05:6a20:cd96:b0:3b7:aefe:4367 with SMTP id adf61e73a8af0-3cc5540b487mr1915887637.33.1786574596145;
        Wed, 12 Aug 2026 15:43:16 -0700 (PDT)
Received: from ip-10-198-159-19.us-west-2.compute.internal (ec2-44-232-128-107.us-west-2.compute.amazonaws.com. [44.232.128.107])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbef710cc24sm204967a12.20.2026.08.12.15.43.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 15:43:15 -0700 (PDT)
From: Roland Dreier <rolanddreier@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] firmware: arm_scmi: Don't reuse raw xfers with async_done still armed
Date: Wed, 12 Aug 2026 22:43:06 +0000
Message-ID: <20260812224311.904964-2-rolanddreier@rivian.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260812224311.904964-1-rolanddreier@rivian.com>
References: <20260812224311.904964-1-rolanddreier@rivian.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_154317_333866_95176904 
X-CRM114-Status: GOOD (  23.01  )
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

In SCMI raw mode, scmi_xfer_raw_worker() releases the xfer before
releasing the waiter that disarms xfer->async_done, and scmi_xfer_get()
does not clear async_done when it hands out a recycled xfer. A concurrent
transaction can therefore pick up the xfer while it still points at the
old waiter's completion, so:

 - a delayed response arriving for the new transaction can be signalled
   on the old waiter's completion, which may already be re-armed for yet
   another unrelated transaction, making that transaction's wait return
   early; and

 - the old waiter's disarm, which still runs after the xfer has been
   released, clobbers the arming just installed by the new transaction,
   so the new waiter times out even if its delayed response arrives.

Release the waiter first, while the worker still holds a reference on
the xfer, so that an xfer can never reach the free list still
armed. Track whether a delayed response is expected in the waiter
itself instead of peeking at xfer->async_done outside xfer->lock, and
wait on the waiter's own embedded completion. (The new async flag is
not strictly needed but it makes the logic easier to reason about)

Finally, harden scmi_xfer_get() to clear async_done when handing out
an xfer, so that no future release-ordering change can leak a stale
arming into a new transaction.

Fixes: 3c3d818a9317 ("firmware: arm_scmi: Add core raw transmission support")
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
 drivers/firmware/arm_scmi/driver.c   |  1 +
 drivers/firmware/arm_scmi/raw_mode.c | 25 +++++++++++++++++++++----
 2 files changed, 22 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 5c295bdc15ca..2d8884f0036b 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -717,6 +717,7 @@ static struct scmi_xfer *scmi_xfer_get(const struct scmi_handle *handle,
 
 	refcount_set(&xfer->users, 1);
 	atomic_set(&xfer->busy, SCMI_XFER_FREE);
+	xfer->async_done = NULL;
 	spin_unlock_irqrestore(&minfo->xfer_lock, flags);
 
 	return xfer;
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 8751cff5fa4e..5ee21f6b7001 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -198,6 +198,8 @@ struct scmi_raw_mode_info {
  * @async_response: A completion to be, optionally, used for async waits: it
  *		    will be setup by @scmi_do_xfer_raw_start, if needed, to be
  *		    pointed at by xfer->async_done.
+ * @async: True if @async_response was armed on @xfer, i.e. if a delayed
+ *	   response has to be waited for.
  * @node: A list node.
  */
 struct scmi_xfer_raw_waiter {
@@ -205,6 +207,7 @@ struct scmi_xfer_raw_waiter {
 	struct scmi_chan_info *cinfo;
 	struct scmi_xfer *xfer;
 	struct completion async_response;
+	bool async;
 	struct list_head node;
 };
 
@@ -349,6 +352,7 @@ scmi_xfer_raw_waiter_get(struct scmi_raw_mode_info *raw, struct scmi_xfer *xfer,
 			scmi_xfer_async_response_arm(xfer, &rw->async_response);
 		}
 
+		rw->async = async;
 		rw->cinfo = cinfo;
 		rw->xfer = xfer;
 	}
@@ -361,8 +365,16 @@ static void scmi_xfer_raw_waiter_put(struct scmi_raw_mode_info *raw,
 				     struct scmi_xfer_raw_waiter *rw)
 {
 	if (rw->xfer) {
+		/*
+		 * Disarm the delayed response before this waiter, and its
+		 * embedded completion, can be picked up again for a new
+		 * transaction: a delayed response received late, after the
+		 * related wait timed out, must not signal a completion which
+		 * has been in the meantime re-armed on a different xfer.
+		 */
 		scmi_xfer_async_response_disarm(rw->xfer);
 		rw->xfer = NULL;
+		rw->async = false;
 	}
 
 	mutex_lock(&raw->free_mtx);
@@ -479,18 +491,23 @@ static void scmi_xfer_raw_worker(struct work_struct *work)
 				    ret, scmi_inflight_count(raw->handle));
 
 		/* Wait also for an async delayed response if needed */
-		if (!ret && xfer->async_done) {
+		if (!ret && rw->async) {
 			unsigned long tmo = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
 
-			if (!wait_for_completion_timeout(xfer->async_done, tmo))
+			if (!wait_for_completion_timeout(&rw->async_response, tmo))
 				dev_err(dev,
 					"timed out in RAW delayed resp - HDR:%08X\n",
 					pack_scmi_header(&xfer->hdr));
 		}
 
-		/* Release waiter and xfer */
-		scmi_xfer_raw_put(raw->handle, xfer);
+		/*
+		 * Release the waiter first: this disarms the delayed response
+		 * while we still hold a reference on the xfer, so that the xfer
+		 * cannot be recycled by a new transaction while it still points
+		 * at this waiter's completion.
+		 */
 		scmi_xfer_raw_waiter_put(raw, rw);
+		scmi_xfer_raw_put(raw->handle, xfer);
 	} while (1);
 }
 
-- 
2.54.0


-- 
*CONFIDENTIALITY NOTE:* This electronic message (including any attachments) 
may contain information that is privileged, confidential, and proprietary. 
If you are not the intended recipient, you are hereby notified that any 
disclosure, copying, distribution, or use of the information contained 
herein (including any reliance thereon) is strictly prohibited. If you 
received this electronic message in error, please immediately reply to the 
sender that you have received this communication and destroy the material 
in its entirety, whether in electronic or hard copy format. Although Rivian 
has taken reasonable precautions to ensure no viruses are present in this 
email, Rivian accepts no responsibility for any loss or damage arising from 
the use of this email or attachments.

