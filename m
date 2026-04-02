Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD22D6AAEC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 17:07:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qe/ZA3cS06JPwazJ5lT2X5nq3OydOwSen9aJipTvAo8=; b=vS6tG79iP06q+xXiki1RcDVSSw
	9Z7tFAmuuP0BSRqT3bJ2gfeDyUXezwRW8GYk+e13yivzlY7+sWr4ChadKgqYR1F8/GQ982qOYNkDr
	c7DLrt5lFxH8Qm0lvLS1dkGn/0VOmzVIMdzL93JnBEhdTpe5x3faG0kjdLHSo03R8+fhONnROBG8q
	v8I8s6gfaWuoc1Z86jycXSvE84OhsggAozUbyHZBp/fT996uNcQZpFOx91kgAkObjkiQC3Wbr/Fiv
	++gx2IN5Tf+bGQyzoUeXjNJ64GdvEVED1TeYiVgcFdtsqk1n6u8wHYYihtDwvHCZGQ/EUYpYDrTGI
	vNg/qVWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LWD-00000000Zlz-3Qfe;
	Thu, 02 Apr 2026 17:07:45 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8LWA-00000000Zkz-2cSR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 17:07:44 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-35d9f68d00fso2349719a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 02 Apr 2026 10:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775149661; x=1775754461; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qe/ZA3cS06JPwazJ5lT2X5nq3OydOwSen9aJipTvAo8=;
        b=V2MOHTyCqulewb42z25Fy5oDTZtCgIw2AyQEdD/xHhkgVoG6DS0QjeNM4cRqtVy+Sl
         OBRh54KDrlTmH+YCS47ONUDVqvWQIueLflI1oqKgXob+ydke/z7v6Hn1u1MnlH+e5i8M
         jeznkXgBpmZfGaLEW4G3IdZ7Bu5XeaOX9IZMzhGc3a/dZfZI2EH0VQih9nCi9gyNn/rx
         0hw74tqA1CSN31cF2+6vQab8+QOtjOchUYYdBTqiZbr8gI9tOcFWDW2lWvfE6/WwF0Y8
         NLt8VKxXPTn/M01dUSNGA/RViKds7VRqze535+NjbPSNquJ6DcEAl+tbnkL5CO/oTbr7
         sYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775149661; x=1775754461;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qe/ZA3cS06JPwazJ5lT2X5nq3OydOwSen9aJipTvAo8=;
        b=ccOHlFW17EFl3i0UJW5q3AXwalZ9uaWl3jxFvknmCTpAlh2wHwKSd1HlksKtaSrhFk
         VpR5GpZxN2vv3gjSlnEfLz82MDXZdtA/+u66JEa6btR6K9g6a6oS3i2zQ+YmhQpQdoQE
         o1fkG0wffzBFYJKyqrwX48vurSqwwQ3KA5SIwBZ/XSL7tovQI5pzy6RtKfiNuzWkePEM
         6tF3Vp13RrBKho/pkp2wRgHxqGA5F8T1G3P+IOzWRuA00JvynNc+C1lwTrAcpR3ZD2Kb
         j1/SJbEJEGGE3eqMEssXfnJWat2Hbd5NCL58gxsBFU9XJW+eA9ojeJj7VZr1CZYa+v9S
         qT5Q==
X-Forwarded-Encrypted: i=1; AJvYcCWrYnbJnkchAvoq65xFV3AViG6dLSiyL8n/2SgBYOuY+0W9r+ulYTcq9/277sjxtuYk7BIJ3Ficd1T19hNDwrZc@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy8lXOcLmHQ+POaoq5EMOUZmzqwqU0p2FTleE4L/W5cLJFz2a5
	A5WsxAwkcGs+ZbJuSfL3wO3G5Vg37NwTNNQcYUenA93cX2kAnnlfwQo+1sVbcdLs3JUIvZDBsSs
	D6ZymvdgWCceGSJW2UDSrcR8wjg==
X-Received: from pgww5.prod.google.com ([2002:a05:6a02:2c85:b0:c73:9919:c4f8])
 (user=joonwonkang job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a21:32a0:b0:398:98ab:71a8 with SMTP id adf61e73a8af0-39ef773e0a1mr9207386637.47.1775149661098;
 Thu, 02 Apr 2026 10:07:41 -0700 (PDT)
Date: Thu,  2 Apr 2026 17:06:40 +0000
In-Reply-To: <20260402170641.2082547-1-joonwonkang@google.com>
Mime-Version: 1.0
References: <20260402170641.2082547-1-joonwonkang@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260402170641.2082547-2-joonwonkang@google.com>
Subject: [PATCH v3 1/2] mailbox: Use per-thread completion to fix wrong
 completion order
From: Joonwon Kang <joonwonkang@google.com>
To: jassisinghbrar@gmail.com, matthias.bgg@gmail.com, 
	angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, 
	jonathanh@nvidia.com
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	Joonwon Kang <joonwonkang@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_100742_672879_289A4434 
X-CRM114-Status: GOOD (  28.31  )
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

Previously, a sender thread in mbox_send_message() could be woken up at
a wrong time in blocking mode. It is because there was only a single
completion for a channel whereas messages from multiple threads could be
sent in any order; since the shared completion could be signalled in any
order, it could wake up a wrong sender thread.

This commit resolves the false wake-up issue with the following changes:
- Completions are created just as many as the number of concurrent sender
  threads
- A completion is created on a sender thread's stack
- Each slot of the message queue, i.e. `msg_data`, contains a pointer to
  its target completion
- tx_tick() signals the completion of the currently active slot of the
  message queue

Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/all/1490809381-28869-1-git-send-email-jaswinder.singh@linaro.org
Signed-off-by: Joonwon Kang <joonwonkang@google.com>
---
 drivers/mailbox/mailbox.c          | 86 +++++++++++++++++++-----------
 drivers/mailbox/mtk-vcp-mailbox.c  |  2 +-
 drivers/mailbox/tegra-hsp.c        |  2 +-
 include/linux/mailbox_controller.h | 20 ++++---
 4 files changed, 72 insertions(+), 38 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 138ffbcd4fde..d63386468982 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -21,7 +21,7 @@
 static LIST_HEAD(mbox_cons);
 static DEFINE_MUTEX(con_mutex);
 
-static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
+static int add_to_rbuf(struct mbox_chan *chan, void *mssg, struct completion *tx_complete)
 {
 	int idx;
 
@@ -32,7 +32,8 @@ static int add_to_rbuf(struct mbox_chan *chan, void *mssg)
 		return -ENOBUFS;
 
 	idx = chan->msg_free;
-	chan->msg_data[idx] = mssg;
+	chan->msg_data[idx].data = mssg;
+	chan->msg_data[idx].tx_complete = tx_complete;
 	chan->msg_count++;
 
 	if (idx == MBOX_TX_QUEUE_LEN - 1)
@@ -50,24 +51,33 @@ static void msg_submit(struct mbox_chan *chan)
 	int err = -EBUSY;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		if (!chan->msg_count || chan->active_req != MBOX_NO_MSG)
+		if (chan->active_req >= 0)
 			break;
 
-		count = chan->msg_count;
-		idx = chan->msg_free;
-		if (idx >= count)
-			idx -= count;
-		else
-			idx += MBOX_TX_QUEUE_LEN - count;
+		while (chan->msg_count > 0) {
+			count = chan->msg_count;
+			idx = chan->msg_free;
+			if (idx >= count)
+				idx -= count;
+			else
+				idx += MBOX_TX_QUEUE_LEN - count;
 
-		data = chan->msg_data[idx];
+			data = chan->msg_data[idx].data;
+			if (data != MBOX_NO_MSG)
+				break;
+
+			chan->msg_count--;
+		}
+
+		if (!chan->msg_count)
+			break;
 
 		if (chan->cl->tx_prepare)
 			chan->cl->tx_prepare(chan->cl, data);
 		/* Try to submit a message to the MBOX controller */
 		err = chan->mbox->ops->send_data(chan, data);
 		if (!err) {
-			chan->active_req = data;
+			chan->active_req = idx;
 			chan->msg_count--;
 		}
 	}
@@ -79,27 +89,35 @@ static void msg_submit(struct mbox_chan *chan)
 	}
 }
 
-static void tx_tick(struct mbox_chan *chan, int r)
+static void tx_tick(struct mbox_chan *chan, int r, int idx)
 {
-	void *mssg;
+	struct mbox_message mssg = {MBOX_NO_MSG, NULL};
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		mssg = chan->active_req;
-		chan->active_req = MBOX_NO_MSG;
+		if (idx >= 0 && idx != chan->active_req) {
+			chan->msg_data[idx].data = MBOX_NO_MSG;
+			chan->msg_data[idx].tx_complete = NULL;
+			return;
+		}
+
+		if (chan->active_req >= 0) {
+			mssg = chan->msg_data[chan->active_req];
+			chan->active_req = -1;
+		}
 	}
 
 	/* Submit next message */
 	msg_submit(chan);
 
-	if (mssg == MBOX_NO_MSG)
+	if (mssg.data == MBOX_NO_MSG)
 		return;
 
 	/* Notify the client */
 	if (chan->cl->tx_done)
-		chan->cl->tx_done(chan->cl, mssg, r);
+		chan->cl->tx_done(chan->cl, mssg.data, r);
 
 	if (r != -ETIME && chan->cl->tx_block)
-		complete(&chan->tx_complete);
+		complete(mssg.tx_complete);
 }
 
 static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
@@ -112,10 +130,10 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req != MBOX_NO_MSG && chan->cl) {
+		if (chan->active_req >= 0 && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
-				tx_tick(chan, 0);
+				tx_tick(chan, 0, -1);
 			else
 				resched = true;
 		}
@@ -168,7 +186,7 @@ void mbox_chan_txdone(struct mbox_chan *chan, int r)
 		return;
 	}
 
-	tx_tick(chan, r);
+	tx_tick(chan, r, -1);
 }
 EXPORT_SYMBOL_GPL(mbox_chan_txdone);
 
@@ -188,7 +206,7 @@ void mbox_client_txdone(struct mbox_chan *chan, int r)
 		return;
 	}
 
-	tx_tick(chan, r);
+	tx_tick(chan, r, -1);
 }
 EXPORT_SYMBOL_GPL(mbox_client_txdone);
 
@@ -266,11 +284,19 @@ EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
 int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
+	int idx;
+	struct completion tx_complete;
 
 	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
-	t = add_to_rbuf(chan, mssg);
+	if (chan->cl->tx_block) {
+		init_completion(&tx_complete);
+		t = add_to_rbuf(chan, mssg, &tx_complete);
+	} else {
+		t = add_to_rbuf(chan, mssg, NULL);
+	}
+
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
 		return t;
@@ -287,10 +313,11 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 		else
 			wait = msecs_to_jiffies(chan->cl->tx_tout);
 
-		ret = wait_for_completion_timeout(&chan->tx_complete, wait);
+		ret = wait_for_completion_timeout(&tx_complete, wait);
 		if (ret == 0) {
+			idx = t;
 			t = -ETIME;
-			tx_tick(chan, t);
+			tx_tick(chan, t, idx);
 		}
 	}
 
@@ -321,7 +348,7 @@ int mbox_flush(struct mbox_chan *chan, unsigned long timeout)
 
 	ret = chan->mbox->ops->flush(chan, timeout);
 	if (ret < 0)
-		tx_tick(chan, ret);
+		tx_tick(chan, ret, -1);
 
 	return ret;
 }
@@ -340,9 +367,8 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->msg_free = 0;
 		chan->msg_count = 0;
-		chan->active_req = MBOX_NO_MSG;
+		chan->active_req = -1;
 		chan->cl = cl;
-		init_completion(&chan->tx_complete);
 
 		if (chan->txdone_method	== TXDONE_BY_POLL && cl->knows_txdone)
 			chan->txdone_method = TXDONE_BY_ACK;
@@ -498,7 +524,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
-		chan->active_req = MBOX_NO_MSG;
+		chan->active_req = -1;
 		if (chan->txdone_method == TXDONE_BY_ACK)
 			chan->txdone_method = TXDONE_BY_POLL;
 	}
@@ -553,7 +579,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
-		chan->active_req = MBOX_NO_MSG;
+		chan->active_req = -1;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
diff --git a/drivers/mailbox/mtk-vcp-mailbox.c b/drivers/mailbox/mtk-vcp-mailbox.c
index 1b291b8ea15a..a7bab06ac686 100644
--- a/drivers/mailbox/mtk-vcp-mailbox.c
+++ b/drivers/mailbox/mtk-vcp-mailbox.c
@@ -84,7 +84,7 @@ static int mtk_vcp_mbox_send_data(struct mbox_chan *chan, void *data)
 
 static bool mtk_vcp_mbox_last_tx_done(struct mbox_chan *chan)
 {
-	struct mtk_ipi_info *ipi_info = chan->active_req;
+	struct mtk_ipi_info *ipi_info = chan->msg_data[chan->active_req].data;
 	struct mtk_vcp_mbox *priv = chan->con_priv;
 
 	return !(readl(priv->base + priv->cfg->set_in) & BIT(ipi_info->index));
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index 7b1e1b83ea29..efe0033cb5c5 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -495,7 +495,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *chan,
 			mbox_chan_txdone(chan, 0);
 
 			/* Wait until channel is empty */
-			if (chan->active_req != MBOX_NO_MSG)
+			if (chan->active_req >= 0)
 				continue;
 
 			return 0;
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index e3896b08f22e..912499ad08ed 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -113,16 +113,25 @@ struct mbox_controller {
  */
 #define MBOX_TX_QUEUE_LEN	20
 
+/**
+ * struct mbox_message - Internal representation of a mailbox message
+ * @data:		Data packet
+ * @tx_complete:	Pointer to the transmission completion
+ */
+struct mbox_message {
+	void *data;
+	struct completion *tx_complete;
+};
+
 /**
  * struct mbox_chan - s/w representation of a communication chan
  * @mbox:		Pointer to the parent/provider of this channel
  * @txdone_method:	Way to detect TXDone chosen by the API
  * @cl:			Pointer to the current owner of this channel
- * @tx_complete:	Transmission completion
- * @active_req:		Currently active request hook
+ * @active_req:		Index of the currently active slot in the queue
  * @msg_count:		No. of mssg currently queued
  * @msg_free:		Index of next available mssg slot
- * @msg_data:		Hook for data packet
+ * @msg_data:		Queue of data packets
  * @lock:		Serialise access to the channel
  * @con_priv:		Hook for controller driver to attach private data
  */
@@ -130,10 +139,9 @@ struct mbox_chan {
 	struct mbox_controller *mbox;
 	unsigned txdone_method;
 	struct mbox_client *cl;
-	struct completion tx_complete;
-	void *active_req;
+	int active_req;
 	unsigned msg_count, msg_free;
-	void *msg_data[MBOX_TX_QUEUE_LEN];
+	struct mbox_message msg_data[MBOX_TX_QUEUE_LEN];
 	spinlock_t lock; /* Serialise access to the channel */
 	void *con_priv;
 };
-- 
2.53.0.1185.g05d4b7b318-goog


