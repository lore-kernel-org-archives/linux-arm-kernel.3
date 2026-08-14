Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60036C5CFCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 20:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K6tKc6Z28OzPDiujW0hEkp7xKryH9fQ7JBGmFv2ZkPg=; b=FFBT85OigQDe/wgNJ6u4+i2BaH
	Pcc7q+WY/HSVgC12GA048lzZ1F769/5XXojicf5btX4WrzijhBFYuCLZhG22HrZvfG6HPb3TBd9/H
	2PN6gPTr0APd/ttrqoVCup2bEFSfBsVJdpBQ/KMewf0CzFHf2mWPC1a0jEOdQqVdnkteTzNU2MszW
	HPMA26jhnMURz798NMyakDiuFs1AnjB93Tv3S8suCemJGoHKrRwZuGupTGKKmefCs5xTv4nDf+GnO
	zv9kAg30lv+Q4RymRNnswLey70do9WT+9qGuodJ0CWqzZMB9aIFK2kQmSCl2Ujb52+Pnv5JmPvGaL
	yum0gwFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyKn-000000038Ht-18SG;
	Fri, 14 Aug 2026 20:16:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuyKi-000000038Gl-0EIr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 20:16:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F36F600AF;
	Fri, 14 Aug 2026 20:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DCDEFC2BCF6;
	Fri, 14 Aug 2026 20:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786738610;
	bh=XfOxtLqm+gTaszkcqBFfA+yichex03j+Zn51l2FB75A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sx6iy5xjJCRiOo0GUqnLsxAZ6VNrFdnYE786CUnOFElvGfO/ob/msGvKhfV7AvugK
	 Sf/3FvIWeBpenuN0TkJTHq+aIA8YziT90m7ewRKcfyG3mkh/KglcnZkitRxq9f4Tc2
	 My9nZXgNcn52rWpmi9J0tiUSUNFo9SZ/jUUObt6PuG8chRl0l2jGtaF+Bciesy2rV4
	 LMZK1Bg/PyOhZ3HNsh7/MY1Oasrc10Z2DEXmwEEG83VhdYuLYAQOpoDjJicoCrOgh4
	 DgdkmfR+wvBCfzFCv+C4khsxkSigCxJUicFAH1ILU+i08uQai2gOGJV9qGlpO1bLZE
	 9GqZMmtDaBPWA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEC67C5CFC1;
	Fri, 14 Aug 2026 20:16:50 +0000 (UTC)
From: Roland Dreier via B4 Relay <devnull+rolanddreier.rivian.com@kernel.org>
Date: Fri, 14 Aug 2026 20:15:33 +0000
Subject: [PATCH 1/2] firmware: arm_scmi: Protect xfer->async_done with
 xfer->lock
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-scmi-async-done-race-v1-1-335b163d77ee@rivian.com>
References: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
In-Reply-To: <20260814-scmi-async-done-race-v1-0-335b163d77ee@rivian.com>
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786738610; l=9843;
 i=rolanddreier@rivian.com; s=20260814; h=from:subject:message-id;
 bh=KwnqXNyT6Amma15ZNEtaoQkZXX80va0zk2YGE2S3CtM=;
 b=OvOwIEoLb6m3ktIPx8G0AaYkYWUS/gxsFOqerimJi/1sCeP2XOL5lJIoYIxbSo2ExYbxi7IMQ
 6jihaGXyNaDC4J7zfmhBLRpRMnCdhSBdlbKPZ2TiAwjtGjPjrZA/mrD
X-Developer-Key: i=rolanddreier@rivian.com; a=ed25519;
 pk=C7SBXsDIlarq7BpINqyDL67XV/AGNqNt09NCCpFcExk=
X-Endpoint-Received: by B4 Relay for rolanddreier@rivian.com/20260814 with
 auth_id=952
X-Original-From: Roland Dreier <rolanddreier@rivian.com>
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
Reply-To: rolanddreier@rivian.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Roland Dreier <rolanddreier@rivian.com>

Asynchronous SCMI commands are completed by a delayed response. The RX
path signals the response with complete(xfer->async_done). Unlike
xfer->done, xfer->async_done is a pointer to a completion owned by
whoever is waiting for the delayed response, and it stays valid only for
as long as that waiter is still waiting.  In do_xfer_with_response() it
is a DECLARE_COMPLETION_ONSTACK() in the caller's stack frame.

Nothing serialises the RX path against a waiter that gives up on a
timeout. scmi_msg_response_validate() does read xfer->async_done
under xfer->lock, and documents that as a requirement, but the lock is
dropped again before scmi_handle_response() dereferences the pointer,
and neither the arming nor the disarming side takes it at all. So a
delayed response arriving just as the wait times out can be signalled
on a completion that is already gone:

  waiter                                RX path (IRQ context)
  ------                                ---------------------
  do_xfer_with_response():
    xfer->async_done = &async_response
    do_xfer(xfer)
    wait_for_completion_timeout(xfer->async_done, tmo)
    /* returns 0, gives up */
                                        /* response receive interrupt */
                                        scmi_handle_response():
                                          scmi_xfer_command_acquire()
                                            lock xfer->lock
                                            validate: async_done != NULL
                                            unlock xfer->lock
    xfer->async_done = NULL
    return -ETIMEDOUT
    /* async_response goes out of scope */
                                          complete(xfer->async_done)

That last complete() has two possible bad outcomes: it either dereferences
the NULL just stored by the waiter or - if that store is not yet visible
on the RX CPU - it takes a lock and writes to a stack frame that the
waiter maybe has already returned from.

Fix this by making xfer->lock cover xfer->async_done end-to-end. Add
helpers to arm and disarm it under the lock, use them on both the regular
and the raw paths, and have the RX path read and signal the completion
under that same lock. A waiter that is timing out then either completes
its disarm before the RX path looks, in which case the delayed response is
dropped, or blocks in the disarm until the RX path is done with the
completion, in which case the completion is still alive.

Account for the dropped case with a new "delayed_response_dropped"
debugfs counter to make it visible if this ever happens.

Fixes: 58ecdf03dbb9 ("firmware: arm_scmi: Add support for asynchronous commands and delayed response")
Signed-off-by: Roland Dreier <rolanddreier@rivian.com>
---
 drivers/firmware/arm_scmi/common.h    | 23 +++++++++++++++++++++++
 drivers/firmware/arm_scmi/driver.c    | 35 ++++++++++++++++++++++++++++++-----
 drivers/firmware/arm_scmi/protocols.h |  9 ++++++---
 drivers/firmware/arm_scmi/raw_mode.c  |  4 ++--
 4 files changed, 61 insertions(+), 10 deletions(-)

diff --git a/drivers/firmware/arm_scmi/common.h b/drivers/firmware/arm_scmi/common.h
index b9723c105fc1..fc2f69bcebff 100644
--- a/drivers/firmware/arm_scmi/common.h
+++ b/drivers/firmware/arm_scmi/common.h
@@ -282,6 +282,28 @@ static inline bool is_polling_enabled(struct scmi_chan_info *cinfo,
 		is_transport_polling_capable(desc);
 }
 
+/**
+ * scmi_xfer_async_response_arm  - Arm the delayed response completion
+ *
+ * @xfer: A reference to the xfer to arm
+ * @async_done: The completion to signal upon reception of a delayed response,
+ *		or NULL to disarm @xfer.
+ */
+static inline void scmi_xfer_async_response_arm(struct scmi_xfer *xfer,
+						struct completion *async_done)
+{
+	unsigned long flags;
+
+	spin_lock_irqsave(&xfer->lock, flags);
+	xfer->async_done = async_done;
+	spin_unlock_irqrestore(&xfer->lock, flags);
+}
+
+static inline void scmi_xfer_async_response_disarm(struct scmi_xfer *xfer)
+{
+	scmi_xfer_async_response_arm(xfer, NULL);
+}
+
 void scmi_xfer_raw_put(const struct scmi_handle *handle,
 		       struct scmi_xfer *xfer);
 struct scmi_xfer *scmi_xfer_raw_get(const struct scmi_handle *handle);
@@ -303,6 +325,7 @@ enum debug_counters {
 	RESPONSE_OK,
 	NOTIFICATION_OK,
 	DELAYED_RESPONSE_OK,
+	DELAYED_RESPONSE_DROPPED,
 	XFERS_RESPONSE_TIMEOUT,
 	XFERS_RESPONSE_POLLED_TIMEOUT,
 	RESPONSE_POLLED_OK,
diff --git a/drivers/firmware/arm_scmi/driver.c b/drivers/firmware/arm_scmi/driver.c
index 3e0d975ec94c..5c295bdc15ca 100644
--- a/drivers/firmware/arm_scmi/driver.c
+++ b/drivers/firmware/arm_scmi/driver.c
@@ -1063,6 +1063,28 @@ static inline void scmi_xfer_command_release(struct scmi_info *info,
 	__scmi_xfer_put(&info->tx_minfo, xfer);
 }
 
+/**
+ * scmi_xfer_async_response_complete  - Signal a received delayed response
+ *
+ * @xfer: A reference to the xfer whose delayed response was received
+ *
+ * Return: True if a completion was still armed on @xfer and has been
+ *	   signalled, false if a timed-out waiter had already disarmed it.
+ */
+static bool scmi_xfer_async_response_complete(struct scmi_xfer *xfer)
+{
+	unsigned long flags;
+	struct completion *async_done;
+
+	spin_lock_irqsave(&xfer->lock, flags);
+	async_done = xfer->async_done;
+	if (async_done)
+		complete(async_done);
+	spin_unlock_irqrestore(&xfer->lock, flags);
+
+	return !!async_done;
+}
+
 static inline void scmi_clear_channel(struct scmi_info *info,
 				      struct scmi_chan_info *cinfo)
 {
@@ -1166,8 +1188,10 @@ static void scmi_handle_response(struct scmi_chan_info *cinfo,
 
 	if (xfer->hdr.type == MSG_TYPE_DELAYED_RESP) {
 		scmi_clear_channel(info, cinfo);
-		complete(xfer->async_done);
-		scmi_inc_count(info->dbg, DELAYED_RESPONSE_OK);
+		if (scmi_xfer_async_response_complete(xfer))
+			scmi_inc_count(info->dbg, DELAYED_RESPONSE_OK);
+		else
+			scmi_inc_count(info->dbg, DELAYED_RESPONSE_DROPPED);
 	} else {
 		complete(&xfer->done);
 		scmi_inc_count(info->dbg, RESPONSE_OK);
@@ -1509,7 +1533,7 @@ static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
 	int ret, timeout = msecs_to_jiffies(SCMI_MAX_RESPONSE_TIMEOUT);
 	DECLARE_COMPLETION_ONSTACK(async_response);
 
-	xfer->async_done = &async_response;
+	scmi_xfer_async_response_arm(xfer, &async_response);
 
 	/*
 	 * Delayed responses should not be polled, so an async command should
@@ -1521,7 +1545,7 @@ static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
 
 	ret = do_xfer(ph, xfer);
 	if (!ret) {
-		if (!wait_for_completion_timeout(xfer->async_done, timeout)) {
+		if (!wait_for_completion_timeout(&async_response, timeout)) {
 			dev_err(ph->dev,
 				"timed out in delayed resp(caller: %pS)\n",
 				(void *)_RET_IP_);
@@ -1531,7 +1555,7 @@ static int do_xfer_with_response(const struct scmi_protocol_handle *ph,
 		}
 	}
 
-	xfer->async_done = NULL;
+	scmi_xfer_async_response_disarm(xfer);
 	return ret;
 }
 
@@ -2989,6 +3013,7 @@ static const char * const dbg_counter_strs[] = {
 	"response_ok",
 	"notification_ok",
 	"delayed_response_ok",
+	"delayed_response_dropped",
 	"xfers_response_timeout",
 	"xfers_response_polled_timeout",
 	"response_polled_ok",
diff --git a/drivers/firmware/arm_scmi/protocols.h b/drivers/firmware/arm_scmi/protocols.h
index 15ad5162e37a..8583159059e6 100644
--- a/drivers/firmware/arm_scmi/protocols.h
+++ b/drivers/firmware/arm_scmi/protocols.h
@@ -100,7 +100,10 @@ struct scmi_msg_hdr {
  *	message. If request-ACK protocol is used, we can reuse the same
  *	buffer for the rx path as we use for the tx path.
  * @done: command message transmit completion event
- * @async_done: pointer to delayed response message received event completion
+ * @async_done: pointer to delayed response message received event completion,
+ *		or NULL when no delayed response is expected. Protected by
+ *		@lock, since the completion is owned by the waiter and can
+ *		vanish once the wait times out.
  * @pending: True for xfers added to @pending_xfers hashtable
  * @node: An hlist_node reference used to store this xfer, alternatively, on
  *	  the free list @free_xfers or in the @pending_xfers hashtable
@@ -121,7 +124,7 @@ struct scmi_msg_hdr {
  *	    - SCMI_XFER_SENT_OK -> SCMI_XFER_DRESP_OK
  *	      (Missing synchronous response is assumed OK and ignored)
  * @flags: Optional flags associated to this xfer.
- * @lock: A spinlock to protect state and busy fields.
+ * @lock: A spinlock to protect state, busy and async_done fields.
  * @priv: A pointer for transport private usage.
  */
 struct scmi_xfer {
@@ -147,7 +150,7 @@ struct scmi_xfer {
 #define SCMI_XFER_IS_CHAN_SET(x)	\
 	((x)->flags & SCMI_XFER_FLAG_CHAN_SET)
 	int flags;
-	/* A lock to protect state and busy fields */
+	/* A lock to protect state, busy and async_done fields */
 	spinlock_t lock;
 	void *priv;
 };
diff --git a/drivers/firmware/arm_scmi/raw_mode.c b/drivers/firmware/arm_scmi/raw_mode.c
index 1f6e51670208..8751cff5fa4e 100644
--- a/drivers/firmware/arm_scmi/raw_mode.c
+++ b/drivers/firmware/arm_scmi/raw_mode.c
@@ -346,7 +346,7 @@ scmi_xfer_raw_waiter_get(struct scmi_raw_mode_info *raw, struct scmi_xfer *xfer,
 
 		if (async) {
 			reinit_completion(&rw->async_response);
-			xfer->async_done = &rw->async_response;
+			scmi_xfer_async_response_arm(xfer, &rw->async_response);
 		}
 
 		rw->cinfo = cinfo;
@@ -361,7 +361,7 @@ static void scmi_xfer_raw_waiter_put(struct scmi_raw_mode_info *raw,
 				     struct scmi_xfer_raw_waiter *rw)
 {
 	if (rw->xfer) {
-		rw->xfer->async_done = NULL;
+		scmi_xfer_async_response_disarm(rw->xfer);
 		rw->xfer = NULL;
 	}
 

-- 
2.54.0



