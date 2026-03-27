Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CF210F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 22:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5pe4fNuksLvBr6m40iWLP0RWVZihoYn68/6iv6BlIG4=; b=FsWdIxUb1dPkv4PLXPwID+BPBz
	qWgb/hFY7WFKZZBJ2OsfyLYpmAyjsFS5HTzaEnAIn8eCYLqG21cJ1tb4UPIUxZA1k9/ALCsl5a1sS
	fDGfqNM+/oRcNnTG3WvdbnTEG+2hRBRDclhWshO8VO1ZuBOoiCHAL6eIKwUdvCFKjMniYpyxWpw0E
	bmfV3HwOh4QGAfvHRJVZXBQOBDPnaGA6BP7eJBkvwDtydx7EhM2RvJ8saKMBzwTO9eCqcnaYQKafy
	Gpqmv7KQPEfVqB+x+LXLtv/g6xmQ1zAzLRgsbHlfKcqyZmk2naF22NFQNWdut1pPxKq4Y/Jk8Fboa
	ZUsC200Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FEb-00000008GFj-162m;
	Fri, 27 Mar 2026 22:00:53 +0000
Received: from mail-qk1-x72a.google.com ([2607:f8b0:4864:20::72a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6FEV-00000008GFA-0fgj
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 22:00:52 +0000
Received: by mail-qk1-x72a.google.com with SMTP id af79cd13be357-8c6f21c2d81so244631985a.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Mar 2026 15:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774648845; x=1775253645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pe4fNuksLvBr6m40iWLP0RWVZihoYn68/6iv6BlIG4=;
        b=HutLb63X0B6tf9TPsIGcXmSvNPnfI1Qc+XB3idU6m4ShW9hFzrbqRgQGIwL4fOWIUv
         CdGdEsV6ErCDqRJ6GkdhKDApQJHQOBPyYVVQEV9I3WIAl8C0KANHW9o1V+ODdV+zlb3S
         Jw4tp8qtdjDqdY5Hx9I6jF/bBaXrarkInCvFX6NbM033YOdWaMYCCmFLcRKWJYfHzSmM
         0YHwlSAMZYKB4hdCAxU1QJqPIEMMUbghO7Ek9tHj+UEN+koK5Ol5MbCumxOxvgnl7IhR
         L6EWVKjYwL/eN2AUXrgYjq9asDd4IzAfnw+1zDaaIq2ilP4PW3+2k4U4BSfTs8Cd38XJ
         j3ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774648845; x=1775253645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pe4fNuksLvBr6m40iWLP0RWVZihoYn68/6iv6BlIG4=;
        b=CU1bNFvcd4LeQWkw5E6N6VVBFYCV8Qmq0NIAlJkfFWwSq1wMU6HSTbAuphzfbPTDYf
         JSw54yhb8re1bkEPYT0xDu7B6BWWXhJlMa+nlNaPhiG3dYkoQOnu/k9KZvLxgPKyw4bd
         o/6K7KOoQF/zP9UWLj6pKT9dljvqgAhTCEsuBcc22zzYMIvFbnEJTgenMGaownFE/uAD
         6t1Q+HuAbL2UIPdF+A2Jfmzg/q6ixXQTTRCLarb8znHFKhrrHQgVRV126FSZKIGFfiED
         Nbh5rxrBmur++TPUnECJ/PuZsFgbfhbuUn5TQ0C4jNm1+1yrT7L1npcscU0l30HM6g0e
         LhXQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfG6vg1HM0DyBTEsUclBVxu5cjL8Bj4f0c3HG6E9ueGKN7ZlzdP6JPj3BFHvGwMzOGZKcC4mR6b4R/4zt3ZZ/h@lists.infradead.org
X-Gm-Message-State: AOJu0YyK17bzPlAbnynyCzBk26+N04n+4a8cMSkbiZMS8fdzsBIHcES3
	IYBa22ZTECtJKEzA+NRrMCBc8wn2EIDsLmcnJ4fqDNGiE1XLkXgzJOoR
X-Gm-Gg: ATEYQzwkpDxlNNACssxkBubfm2sOzxObGrQQOVb7y49/F5l2fzhsx3t+faaS36YfY4K
	XJRQfyXxUAu6nqNdrBZILm/hIpNou1MKLKMVMqZmCIjkc25g54rdpL57lOdFfnlEsYrQ7m+z9qy
	Cll6Q2e3LAEsZdDrwEeSD0Sruu8XMeer9eEHIjRvBBh9K/irmWJKhoPC3deuW3akUkJZGXmTQzy
	eDdgFrPy78ynqeeEDz5Us7X96/MdFAm9/Tv+XmoHuMsi5wMzPq+bNJQqg27tcW8+a3N1UiL4EZG
	5uFDRFxiZ/i239sFe16CAl/be/idGXkrA3aQBkBWiyUTUcSWD13xIDrz9xXFNGlL79aciYAZI4r
	lSx8vxLYCsBYFHyRSoaWSZ8Mxh+zo63ukm2UIYF5fdt/pqi8Z1aAgDBFpMS7+a37VEv9A89Hqgg
	cj7zAoy15a5rZtRYo7cRExa3H/1mX31tp+W5J68qdYsXh8ulbLHNkwJ7vJn+Hd63dChxm5nhl8h
	NmSVuHljSm6hA==
X-Received: by 2002:a05:620a:29c7:b0:8cf:de1c:edea with SMTP id af79cd13be357-8d01c595cb2mr593582585a.13.1774648845186;
        Fri, 27 Mar 2026 15:00:45 -0700 (PDT)
Received: from Desktop-PC.. (wnpgmb0311w-ds01-161-217-39.dynamic.bellmts.net. [142.161.217.39])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89ecf867c24sm3011196d6.36.2026.03.27.15.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Mar 2026 15:00:44 -0700 (PDT)
From: jassisinghbrar@gmail.com
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: dianders@chromium.org,
	shawn.guo@linaro.org,
	maz@kernel.org,
	andersson@kernel.org,
	tglx@kernel.org,
	joonwonkang@google.com,
	Jassi Brar <jassisinghbrar@gmail.com>
Subject: [PATCH] mailbox: Fix NULL message support in mbox_send_message()
Date: Fri, 27 Mar 2026 17:00:40 -0500
Message-ID: <20260327220040.53326-1-jassisinghbrar@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_150047_237618_D08384C1 
X-CRM114-Status: GOOD (  22.79  )
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

Reported-by: Joonwon Kang <joonwonkang@google.com>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
---
 drivers/mailbox/mailbox.c   | 15 ++++++++-------
 drivers/mailbox/mailbox.h   |  3 +++
 drivers/mailbox/tegra-hsp.c |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
index 617ba505691d..9622369cab66 100644
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
@@ -246,7 +246,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg)
 {
 	int t;
 
-	if (!chan || !chan->cl)
+	if (!chan || !chan->cl || mssg == MBOX_NO_MSG)
 		return -EINVAL;
 
 	t = add_to_rbuf(chan, mssg);
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
2.52.0


