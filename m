Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F777EF06E3
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 04:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U37aKUtc6RlOePvT1hsucle0pebLyklaSQDosLHQp6Q=; b=1DeNmPFWzfaX0xeDmyU59EKOmh
	eREYXcpK13Wwze8weHjgV+BOqH2zCJk5PHSV9K+ZWBv9ichO5sMaUP7ndX3D5MiS0G0piKhZbLMdj
	1JFD+hP5384N1EVt+ofof+QKGhS0dhQ5AonubEM4YrczH6sXNaOnv1dPQvKpZDLG1PWm1Q6wbwUnh
	Tz8MEzqWg+JLy16Bgqea0ZxsixNHaxWZ3wwjCQp/l5ShrAsvXix0jfKCnlgVWBl9SE1dapVGTQM5S
	3lVRLbg9Z8GtVAfqBN+/BXLSKujO8lREsEoBbAOdCasbr+dk2OpkoZ6iAQ+zNs9HzINBgC8qjjGX0
	imgZARSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1q-0000000CzXM-0B7B;
	Sun, 08 Feb 2026 04:04:10 +0000
Received: from mail-dl1-x1233.google.com ([2607:f8b0:4864:20::1233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vow1n-0000000CzVr-3gZ6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 04:04:09 +0000
Received: by mail-dl1-x1233.google.com with SMTP id a92af1059eb24-1249b9f5703so2505415c88.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 07 Feb 2026 20:04:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1770523447; x=1771128247; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U37aKUtc6RlOePvT1hsucle0pebLyklaSQDosLHQp6Q=;
        b=CgMAzxgvpDyUdcpP2mlhsWfVgS9Cz610QBFriC3Qxs9LSXFXTW4BVPZUEobAfjD3Ck
         Zl71XXyvBxMBgJ0PS0zSuaLp8x3yupsGJDFTWPmXhxxDkDgaDfU0yNP4DlHhNnT/1SUV
         bt7/SmrCNyedjqQgC52qXmiZlbdo6Vk8vnmeA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770523447; x=1771128247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=U37aKUtc6RlOePvT1hsucle0pebLyklaSQDosLHQp6Q=;
        b=JXk0GWcxHuyI+8JcyFzfT+PquJQsQJ1iA1Mvn9kUWYFM504SxQBSQbHdy/RcI29ZuS
         MQzu98jPyakTtvoyssQxBcbJrebA+yrzj1Y8ZGgNpDUrbz58EEUeeUksvK4j+IVyCdOa
         iVDB6+hIWIHy+DYpZRYUqgjVJWgUUfDh363uAK0tjyDa3SlxMFnUqYX05dbynRK3tcA4
         2hKpC9ilnBA/mBw8qS2mekc+XPW3IzI3wJXsp1LIE9/wZGnwYXnljsPCBOozz2dG9b8u
         zgUqOYxxR327rtDuaFnXK0ARjfVxfiiO5N8NUbup637e/90J65++LhVrxOb+U8Ldra5Y
         yi9A==
X-Forwarded-Encrypted: i=1; AJvYcCUfRdionf9jgPc2akjJqHX6nMtJCMzPZ0zUrTjak33qg5d2PJ/YrpphYBf7Gs8sMEB+CIUxGSX5RPYXVWKaFx4J@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/94JRho79vLE1YFnkluqOzez4Qc45VVLUsqFwiuwbHxBck+FC
	P5bMqc5QTX/5UP2M7nqfl/s9j+bCRycErPEUZnw1M0puKu7fMc2mCiEBYVQtlpza6g==
X-Gm-Gg: AZuq6aIQ9GDP8fF2VyMqA3D00S6u1vAWk5TkhrR7HuwbJUfe25kaghzYIeitpNtFB1c
	CYHopoHBBMzxNq1wXNT0gO/WL7QE9Xi28MeNRczmhPRGzfaHZW5uGICyZ9dk5wcaJmn0QdZA4on
	hkFMgaum2AbdRorHYhssjkMnjHvrtS5L8mfC3g3DhDho3F0uFyXxSAVEjxxnKZdbaL3F2JifprX
	1UCwFZUhJo2CDqK7+ibSJBR5Dju5BrrOhsGSdCn90cX55FY/7M3RLrATFqjjUOO2BmlsEKEil6A
	DtiLS9yuHB2KXMZG7Sgwmd0F5z0Z1kcM9cH1o0ixe+dCY1ezzh6U6QKYUVnkhm6mblonSC5Ctsw
	Oxotwcif8WoAW1b06rEjlkfcjb1cBG3/yxa+WKEc/RAjmNcy3SC7LDcmv9KkO84VeRFRhU5eil+
	6/7NwLah3cfqrR28/dCwLPNcQD1wiHxQYIHRLgkpfcShEHsF3cqsqTE3oSNUgXTlC+y8ZJszU=
X-Received: by 2002:a05:7022:250e:b0:11a:2f10:fa46 with SMTP id a92af1059eb24-12703e569femr3754647c88.0.1770523446753;
        Sat, 07 Feb 2026 20:04:06 -0800 (PST)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:6d43:22d7:40eb:81e6])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-127041e61b9sm7085064c88.8.2026.02.07.20.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Feb 2026 20:04:03 -0800 (PST)
From: Douglas Anderson <dianders@chromium.org>
To: jassisinghbrar@gmail.com
Cc: Douglas Anderson <dianders@chromium.org>,
	Frank.Li@nxp.com,
	andersson@kernel.org,
	arm-scmi@vger.kernel.org,
	cristian.marussi@arm.com,
	festevam@gmail.com,
	imx@lists.linux.dev,
	jay.buddhabhatti@amd.com,
	jonathanh@nvidia.com,
	kernel@pengutronix.de,
	konradybcio@kernel.org,
	krzk@kernel.org,
	lenb@kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-tegra@vger.kernel.org,
	mathieu.poirier@linaro.org,
	michal.simek@amd.com,
	nm@ti.com,
	rafael@kernel.org,
	robh@kernel.org,
	s.hauer@pengutronix.de,
	shawn.guo@linaro.org,
	ssantosh@kernel.org,
	sudeep.holla@kernel.org,
	tglx@kernel.org,
	thierry.reding@gmail.com
Subject: [PATCH v2 01/15] mailbox: Deprecate NULL mbox messages; Introduce mbox_ring_doorbell()
Date: Sat,  7 Feb 2026 20:01:23 -0800
Message-ID: <20260207200128.v2.1.I600d04c0553f5c5ba39c2f92201da313aedfe746@changeid>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
In-Reply-To: <20260208040240.1971442-1-dianders@chromium.org>
References: <20260208040240.1971442-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_200407_950558_5A5DAE52 
X-CRM114-Status: GOOD (  41.57  )
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

The way the mailbox core behaves when you pass a NULL `mssg` parameter
to mbox_send_message() is a little questionable. Specifically, the
mailbox core stores the currently active message directly in its
`active_req` field. In at least two places it decides that if this
field is `NULL` then there is no active request. That means if `mssg`
is ever NULL it will cause the mailbox core to think is no active
request. The two places where it does this are:

1. When a client calls mbox_send_message(), if `active_req` is NULL
   then it will call the mailbox controller to send the new message
   even if the mailbox controller hasn't yet called mbox_chan_txdone()
   on the previous (NULL) message.
2. The mailbox core will never call the client's `tx_done()` callback
   with a NULL message because `tx_tick()` returns early whenever the
   message is NULL.

Though the above doesn't look like it was a conscious design choice,
it does have the benefit of providing a simple way to assert an
edge-triggered interrupt to the remote processor on the other side of
the mailbox. Specifically:

1. Like a normal edge-triggered interrupt, if multiple edges arrive
   before the interrupt is Acked they are coalesced.
2. Like a normal edge-triggered interrupt, as long as the receiver
   (the remote processor in this case) "Ack"s the interrupt _before_
   checking for work and the sender (the mailbox client in this case)
   posts the interrupt _after_ adding new work then we can always be
   certain that new work will be noticed. This assumes that the
   mailbox client and remote processor have some out-of-band way to
   communicate work and the mailbox is just being used as an
   interrupt.

Doing a `git grep -A1 mbox_send_message | grep NULL` shows 14 hits in
mainline today, but it's not 100% clear if all of those users are
relying on the benefits/quirks of the existing behavior.

Since the current NULL `mssg` behavior is a bit questionable but has
some benefits, let's:

1. Deprecate the NULL behavior and print a warning.
2. Add a new mbox_ring_doorbell() function that is very similar to the
   existing NULL `mssg` case but a tad bit cleaner.

The design of the new mbox_ring_doorbell() will be to maximize
compatibility with the old NULL `mssg` behavior. Specifically:

* We'll still pass NULL to the mailbox controller to indicate a
  doorbell.
* Doorbells will not be queued and won't have txdone.
* We'll call immediately into the mailbox controller when a doorbell
  is posted.

With the above, any mailbox clients that don't mix doorbells and
normal messages are intended to see no change in behavior when
switching to the new API. Using the new API, which officiall documents
that mbox_client_txdone() shouldn't be called for doorbells, does
allow us to remove those calls.

There are two differences in behavior between the old sending a NULL
message and the new mbox_ring_doorbell():

1. If the mailbox controller returned an error when trying to send a
   NULL message, the old NULL message could have ended up being queued
   up in the core's FIFO. Now we will just return the error.
2. If a client rings a doorbell while a non-doorbell message is in
   progress, previously NULL messages would have been "queued" in that
   case and now doorbells will be immediately posted.

I'm hoping that nobody was relying on either of the two differences.
In general holding NULL messages in the mailbox core's queue has odd
behavior and is hard to reason about. Hopefully it's reasonable to
assume nobody was doing this.

As mentioned above, it should be noted that it's now documented that
"txdone" shouldn't be called (by both mailbox drivers and clients) for
doorbells. That being said, in most cases it won't hurt since the
mailbox core will ignore the bogus "txdone". The only case where it's
critical for a mailbox controller not to call "txdone" for a doorbell
is when a mailbox channel mixes normal messages and doorbells and
cares about the txdone callback. Specifically, when you ring a
doorbell and immediately send a normal message, if the controller
calls "txdone" for the doorbell it could look as if the normal message
finished before it should have. This issue also would have happened
with the old NULL `mssg`, though.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

Changes in v2:
- Instead of just documenting NULL, introduce a new function

 drivers/mailbox/mailbox.c          | 82 +++++++++++++++++++++++++++++-
 include/linux/mailbox_client.h     |  1 +
 include/linux/mailbox_controller.h |  4 +-
 3 files changed, 85 insertions(+), 2 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 2acc6ec229a4..c1e7f6b1fe72 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -161,6 +161,9 @@ EXPORT_SYMBOL_GPL(mbox_chan_received_data);
  * The controller that has IRQ for TX ACK calls this atomic API
  * to tick the TX state machine. It works only if txdone_irq
  * is set by the controller.
+ *
+ * Should not be called for "doorbell" messages (any time the message
+ * sent was NULL).
  */
 void mbox_chan_txdone(struct mbox_chan *chan, int r)
 {
@@ -182,6 +185,9 @@ EXPORT_SYMBOL_GPL(mbox_chan_txdone);
  * The client/protocol had received some 'ACK' packet and it notifies
  * the API that the last packet was sent successfully. This only works
  * if the controller can't sense TX-Done.
+ *
+ * Should not be called for "doorbell" messages (any time the message
+ * sent was NULL).
  */
 void mbox_client_txdone(struct mbox_chan *chan, int r)
 {
@@ -222,7 +228,7 @@ EXPORT_SYMBOL_GPL(mbox_client_peek_data);
  * mbox_send_message -	For client to submit a message to be
  *				sent to the remote.
  * @chan: Mailbox channel assigned to this client.
- * @mssg: Client specific message typecasted.
+ * @mssg: Client specific message typecasted. Should not be NULL.
  *
  * For client to submit data to the controller destined for a remote
  * processor. If the client had set 'tx_block', the call will return
@@ -249,6 +255,28 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 	if (!chan || !chan->cl)
 		return -EINVAL;
 
+	/*
+	 * The mailbox core gets confused when mbox_send_message() is called
+	 * with NULL messages since the code directly stores messages in
+	 * `active_req` and assumes that a NULL `active_req` means no request
+	 * is active. This causes the core to call the mailbox controller a
+	 * second time even if the previous message hasn't finished and also
+	 * means the client's tx_done() callback will never be called. However,
+	 * clients historically passed NULL anyway. Deprecate passing NULL
+	 * here by adding a warning.
+	 *
+	 * Clients who don't have a message should switch to using
+	 * mbox_ring_doorbell(), which explicitly documents the immediate
+	 * sending of doorbells, the lack of txdone, and what happens if you
+	 * mix doorbells and normal messages.
+	 *
+	 * TODO: when it's certain that all clients have transitioned, consider
+	 * changing this to return -EINVAL.
+	 */
+	if (!mssg)
+		dev_warn_once(chan->mbox->dev,
+			      "NULL mailbox messages are deprecated\n");
+
 	t = add_to_rbuf(chan, mssg);
 	if (t < 0) {
 		dev_err(chan->mbox->dev, "Try increasing MBOX_TX_QUEUE_LEN\n");
@@ -277,6 +305,58 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 }
 EXPORT_SYMBOL_GPL(mbox_send_message);
 
+/**
+ * mbox_ring_doorbell - Client function to ring the doorbell with no message.
+ * @chan: Mailbox channel assigned to this client.
+ *
+ * Send a notification to the remote side of the mailbox but don't actually
+ * send any data. This is typically used when the client and the remote side
+ * of the mailbox have some other (non-mailbox) way to communicate and the
+ * mailbox is simply used as an "interrupt" to notify the remote side.
+ *
+ * This function has a few important differences from mbox_send_message():
+ * - There is no concept of "txdone" for mbox_ring_doorbell(), even if the
+ *   controller itself would be able to tell when the remote CPU saw or Acked
+ *   the doorbell.
+ * - Because there is no concept of "txdone", there is no need to wait for
+ *   previous doorbells to "finish" before notifying the controller of another
+ *   doorbell.
+ * - Because we never wait to notify a controller of a doorbell, there is no
+ *   queue for doorbells.
+ *
+ * The above properties mean that calling mbox_ring_doorbell() is the equivalent
+ * of re-asserting an edge triggered interrupt to the remote side. If the remote
+ * side hasn't yet "cleared" the interrupt this is a no-op. If the remote side
+ * has cleared the interrupt, it will be re-asserted. Expected usage:
+ *
+ * This CPU:
+ * - Update out-of-band (OOB) memory shared between this CPU and remote CPU.
+ * - Ring doorbell.
+ * Remote CPU:
+ * - Clear doorbell.
+ * - Read OOB shared memory and act on it.
+ *
+ * The remote CPU will always be guaranteed to notice changes, even if this CPU
+ * updates / rings multiple times before the remote CPU has a chance to run.
+ *
+ * Mixing calls of mbox_ring_doorbell() and mbox_send_message() on the same
+ * mailbox channel is allowed, assuming the mailbox controller correctly avoids
+ * calling mbox_chan_txdone() for doorbells.
+ *
+ * NOTE: For compatibility reasons, doorbells are sent to the mailbox
+ *	 controller driver by passing NULL to the mailbox controller's
+ *	 send_data() callback.
+ *
+ * Return: Negative error code upon failure.
+ */
+int mbox_ring_doorbell(struct mbox_chan *chan)
+{
+	guard(spinlock_irqsave)(&chan->lock);
+
+	return chan->mbox->ops->send_data(chan, NULL);
+}
+EXPORT_SYMBOL_GPL(mbox_ring_doorbell);
+
 /**
  * mbox_flush - flush a mailbox channel
  * @chan: mailbox channel to flush
diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
index c6eea9afb943..e3fc11e42c58 100644
--- a/include/linux/mailbox_client.h
+++ b/include/linux/mailbox_client.h
@@ -42,6 +42,7 @@ struct mbox_chan *mbox_request_channel_byname(struct mbox_client *cl,
 					      const char *name);
 struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int index);
 int mbox_send_message(struct mbox_chan *chan, void *mssg);
+int mbox_ring_doorbell(struct mbox_chan *chan);
 int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
 void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
 bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
diff --git a/include/linux/mailbox_controller.h b/include/linux/mailbox_controller.h
index 80a427c7ca29..36648fa7b6f3 100644
--- a/include/linux/mailbox_controller.h
+++ b/include/linux/mailbox_controller.h
@@ -19,7 +19,9 @@ struct mbox_chan;
  *		if the remote hasn't yet read the last data sent. Actual
  *		transmission of data is reported by the controller via
  *		mbox_chan_txdone (if it has some TX ACK irq). It must not
- *		sleep.
+ *		sleep. Will be passed NULL data for doorbell-only messages.
+ *		Note that doorbell messages are always sent immediately with
+ *		no queuing. mbox_chan_txdone() shouldn't be called on doorbells.
  * @flush:	Called when a client requests transmissions to be blocking but
  *		the context doesn't allow sleeping. Typically the controller
  *		will implement a busy loop waiting for the data to flush out.
-- 
2.53.0.rc2.204.g2597b5adb4-goog


