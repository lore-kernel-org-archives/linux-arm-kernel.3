Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11933FC72CB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 22 Mar 2026 17:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cSMooCIC7eRFhSt8FxFqoAMmRD4C+XMgbM/hUvAjw1Y=; b=INk7ItgEpUdSigwCHl/eXySi0a
	t5mHdN01dq0ufUPvFeTrNjlNEFRFZOYLXPNzNijs6Gb2NOlfRAnRGx8Cgta9n5fFFk2J7pe8+h59o
	V5i26gGmCgZhtQM6ceONHPaRmd80g0MW4PL4MdPIZVg/SM22SdSvnUQbsplb4A8hnFoxAPdYafh7o
	c+mYKcapdIsKh5pF+ruhhjPsu9YOIZY5R4c7XlKfK4DCL+DmcM7s9VnMUeAH/I4+3qWiHEkxK+AFc
	+moOpAitqKjJMIsRq7HNs3/rbQr6rd0fMhxHyP15Mey+Qtu/HrgdbvVnQ/SR7WD+hLk9jSZTgFW1a
	GsHf4+og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4MR6-0000000FXL8-0Ci9;
	Sun, 22 Mar 2026 17:18:00 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4MR4-0000000FXKn-0yjz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 22 Mar 2026 17:17:59 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8cd90401034so333857685a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 22 Mar 2026 10:17:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774199877; x=1774804677; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cSMooCIC7eRFhSt8FxFqoAMmRD4C+XMgbM/hUvAjw1Y=;
        b=T73q0m49ihBSKpzRVsSxfbkxhjk86xgy+amxIj3HQywyHhJk+PxmnlRhxaLl+cWkD6
         cysRWgToSi4o1Ng6Yh2w6IncYf31AbQBZKHDCKGsev+eT+chYTQH+5iDySuNeXDkr7uF
         AxbgltSz9eITtBpoT1PCZnajbBuX0HMmkBW9MrJHVEWmkOaiH31MfkZnkSRvlv7fW8TT
         OPt9TtXukW8h37VWU8vMvJ1As7j77st5HxQSuTvQG1iLVJtctQsZwJRScLkjL0P4fGit
         9Ld4prBr+4s0Phk3kt96W4ev9hd4MdPkBwEOQlS3vnYMzvwyXYwUDL1gZ8Ks/rumxGUr
         kucg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774199877; x=1774804677;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cSMooCIC7eRFhSt8FxFqoAMmRD4C+XMgbM/hUvAjw1Y=;
        b=DbuKzaZu8zqA0z9IxergGgkJUpNShfZRvPfhUzZwSGwUBHYVpKqEgLzZw0lKgA8xXC
         ZFHTEkh2JWiuDEoiurmuzaQmP/9lIMrE3QwcX9VD+CkQvRdwwXItltdW7UCdQmB8H5uf
         1X4vivSo/JphEpPuorNKgfAJSkc6mOpwUIW9uD8DIFs0aYesCycFlL+NCCApdg90uisG
         s6z/dyHXQR4ejkVwNbTHmf9h8ZSSGbRhmEbotQoQpO55/hhiZW/avmud/vRQlL+8dLjG
         Bo3oJEOsutJ4HigmWOm2ASCDzFGfwsi8g8EKFwEtCft2oqkxx+0jqSKgiv0H5QsSuDuk
         VOBw==
X-Forwarded-Encrypted: i=1; AJvYcCV2SaoE8wCY0k8A1XqMQAumKAbcheir1QpU14Ea5pffi279x3byH7F+8qTEyGjD1I9FbNBBT5rT1/jk3f8Jlt4y@lists.infradead.org
X-Gm-Message-State: AOJu0YwaTHAkR6bR0rdy1BsufB9GFOn1Xtnwrj4TqQCmi8UWqmutKxxO
	S4L96jlokjRUT5StClFi7w9QsKHe5FE1d7/J4DGxpZ8zod/eAofjeeMs
X-Gm-Gg: ATEYQzzXBf1oobNdPJeKynpyFx6GixHJSndLW4zJpmaTk3qrgEGOzL0DodFMMfgb/nc
	QN7SUSbs2EyvNXowHH8c7hFVHO5gAaBoltQrDXE9uX7GX207kw4qxmAGuN2tE7OHm5JTay+Bn3R
	hoXOLMo7s5NE0Xb8ITDgiCvxFWVh3f7kQJENfc3/aHL4cBcdp4DXgVa7pyeIwH5V7jWk1MXphVD
	eTINrnW4zxZkZQOkOG9A35BUfYqNm3JeSZ1TbfwyPT+S7rPMpG7yQdJVuZbT2uzBfN4AtbWwFju
	pX3yRqTrCyf28/3RyId0TXtzTAeCzSNPaAPfTuEuIVuZ0VR0kMq9ys7HdjeylDFs2nRny4CScDm
	5Przu3dK5tnfk/v447CjMyjKyQEIzHkhlA3r3zAzrQn2+vR/hBgGtdlMLCYGm6JCcSFohr1Cp8u
	zq+ipszhLCL4+Oi1FzCG1NqlplLCctwwu4AaNUGAc8SVH/4ztDVNqvAYmEJlBXoBba83xEh+xdr
	9sE7lJWnUWl0l8gZgw+QsFe
X-Received: by 2002:a05:620a:440b:b0:8cf:e152:592d with SMTP id af79cd13be357-8cfe1525999mr433128585a.21.1774199876857;
        Sun, 22 Mar 2026 10:17:56 -0700 (PDT)
Received: from Desktop-PC.. (wnpgmb0311w-ds01-161-217-39.dynamic.bellmts.net. [142.161.217.39])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cfc90e7587sm597838785a.46.2026.03.22.10.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Mar 2026 10:17:56 -0700 (PDT)
From: jassisinghbrar@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: dianders@chromium.org,
	shawn.guo@linaro.org,
	maz@kernel.org,
	stable@vger.kernel.org,
	andersson@kernel.org,
	tglx@kernel.org,
	joonwonkang@google.com,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
Date: Sun, 22 Mar 2026 12:17:52 -0500
Message-ID: <20260322171752.608486-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260322_101758_312132_18A09BDF 
X-CRM114-Status: GOOD (  22.55  )
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

From: Jassi Brar <jassisinghbrar@gmail.com>

The active_req field serves double duty as both the "is a TX in
flight" flag (NULL means idle) and the storage for the in-flight
message pointer. When a client sends NULL via mbox_send_message(),
active_req is set to NULL, which the framework misinterprets as
"no active request". This breaks the TX state machine by:

 - tx_tick() short-circuits on (!mssg), skipping the tx_done
   callback and the tx_complete completion
 - txdone_hrtimer() skips the channel entirely since active_req
   is NULL, so poll-based TX-done detection never fires.

Fix this by introducing a MBOX_NO_MSG sentinel value that means
"no active request," freeing NULL to be valid message data. The
sentinel is defined in the subsystem-internal mailbox.h so that
controller drivers within drivers/mailbox/ can reference it, but
it is not exposed to clients outside the subsystem.

Fifteen in-tree callers send NULL (doorbell-style IPCs on Qualcomm,
Tegra, TI, Xilinx, i.MX, SCMI, and PCC platforms). All were
audited for regression:

 - Most already work around the bug via knows_txdone=true with a
   manual mbox_client_txdone() call, making the framework's
   tracking irrelevant. These are unaffected.

 - Poll-based callers (Xilinx zynqmp/r5) are strictly better off:
   the poll timer now correctly detects NULL-active channels
   instead of silently skipping them.

 - irq-qcom-mpm.c was a pre-existing bug -- the only Qualcomm
   caller that omitted the knows_txdone + mbox_client_txdone()
   pattern. Fixed in a companion commit ("irqchip/qcom-mpm: Fix
   missing mailbox TX done acknowledgment").

 - No caller sets both a tx_done callback and sends NULL, nor
   combines tx_block=true with NULL sends, so the newly reachable
   callback/completion paths are never exercised.

Also update tegra-hsp's flush callback, which directly inspects
active_req to wait for the channel to drain: the old "!= NULL"
check becomes "!= MBOX_NO_MSG", otherwise flush spins until
timeout since the sentinel is non-NULL.

The only tradeoff is that 'MBOX_NO_MSG' can not be used as a message
by clients.

Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/mailbox/mailbox.c   | 13 +++++++------
 drivers/mailbox/mailbox.h   |  3 +++
 drivers/mailbox/tegra-hsp.c |  2 +-
 3 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 617ba505691d..2a7fc7395144 100644
--- a/drivers/mailbox/mailbox.c
+++ b/drivers/mailbox/mailbox.c
@@ -52,7 +52,7 @@ static void msg_submit(struct mbox_chan *chan)
 	int err = -EBUSY;
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
-		if (!chan->msg_count || chan->active_req)
+		if (!chan->msg_count || chan->active_req != MBOX_NO_MSG)
 			break;
 
 		count = chan->msg_count;
@@ -87,13 +87,13 @@ static void tx_tick(struct mbox_chan *chan, int r)
 
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		mssg = chan->active_req;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 	}
 
 	/* Submit next message */
 	msg_submit(chan);
 
-	if (!mssg)
+	if (mssg == MBOX_NO_MSG)
 		return;
 
 	/* Notify the client */
@@ -114,7 +114,7 @@ static enum hrtimer_restart txdone_hrtimer(struct hrtimer *hrtimer)
 	for (i = 0; i < mbox->num_chans; i++) {
 		struct mbox_chan *chan = &mbox->chans[i];
 
-		if (chan->active_req && chan->cl) {
+		if (chan->active_req != MBOX_NO_MSG && chan->cl) {
 			txdone = chan->mbox->ops->last_tx_done(chan);
 			if (txdone)
 				tx_tick(chan, 0);
@@ -319,7 +319,7 @@ static int __mbox_bind_client(struct mbox_chan *chan, struct mbox_client *cl)
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->msg_free = 0;
 		chan->msg_count = 0;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 		chan->cl = cl;
 		init_completion(&chan->tx_complete);
 
@@ -477,7 +477,7 @@ void mbox_free_channel(struct mbox_chan *chan)
 	/* The queued TX requests are simply aborted, no callbacks are made */
 	scoped_guard(spinlock_irqsave, &chan->lock) {
 		chan->cl = NULL;
-		chan->active_req = NULL;
+		chan->active_req = MBOX_NO_MSG;
 		if (chan->txdone_method == TXDONE_BY_ACK)
 			chan->txdone_method = TXDONE_BY_POLL;
 	}
@@ -532,6 +532,7 @@ int mbox_controller_register(struct mbox_controller *mbox)
 
 		chan->cl = NULL;
 		chan->mbox = mbox;
+		chan->active_req = MBOX_NO_MSG;
 		chan->txdone_method = txdone;
 		spin_lock_init(&chan->lock);
 	}
diff --git a/drivers/mailbox/mailbox.h b/drivers/mailbox/mailbox.h
index e1ec4efab693..c77dd6fc5b8a 100644
--- a/drivers/mailbox/mailbox.h
+++ b/drivers/mailbox/mailbox.h
@@ -5,6 +5,9 @@
 
 #include <linux/bits.h>
 
+/* Sentinel value distinguishing "no active request" from "NULL message data" */
+#define MBOX_NO_MSG	((void *)-1)
+
 #define TXDONE_BY_IRQ	BIT(0) /* controller has remote RTR irq */
 #define TXDONE_BY_POLL	BIT(1) /* controller can read status of last TX */
 #define TXDONE_BY_ACK	BIT(2) /* S/W ACK received by Client ticks the TX */
diff --git a/drivers/mailbox/tegra-hsp.c b/drivers/mailbox/tegra-hsp.c
index ed9a0bb2bcd8..7991e8dba579 100644
--- a/drivers/mailbox/tegra-hsp.c
+++ b/drivers/mailbox/tegra-hsp.c
@@ -497,7 +497,7 @@ static int tegra_hsp_mailbox_flush(struct mbox_chan *chan,
 			mbox_chan_txdone(chan, 0);
 
 			/* Wait until channel is empty */
-			if (chan->active_req != NULL)
+			if (chan->active_req != MBOX_NO_MSG)
 				continue;
 
 			return 0;
-- 
2.43.0


