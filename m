Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 355D5C982D9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 10:44:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CiwXmmdbIEfz+vTg//E8LLcXzxRdgCAkhdh9vMT66So=; b=WUMqS3GJyujuflot683N7ZaEE/
	dDHooWEG0Dfvz1HbZNeYdfhtZAU34PWeNGaKvugP2pVpWjhMIpbDwz3DuT5EOr4JFc/BfAxPlEGyl
	ntuhPDvwh1/RET1F02lzB7hPHcJNspj77EIXEUwCeqhQ4oC3/3sWOaALOZveCE2j87Tpys7T/bVZc
	hplolFj85kG3X7kGnEYZuYdzP9sRHtuY18xEkTgKFtO8oeCFxpyrhiFYDtZCIfzlGZivK0PoN8IOg
	GyolA3at4cp4hFbzyzNI33fOb+fcKny2+ELrZwnteNdkpM6Wj5yuUsS/TxLGw2ZJ49uSEa6Ffv9I6
	xmTDSFXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4o-0000000E7eE-3wwg;
	Fri, 18 Sep 2026 10:44:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7W4m-0000000E7cv-2kMb;
	Fri, 18 Sep 2026 10:44:17 +0000
Date: Fri, 18 Sep 2026 12:44:11 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1789728252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=CiwXmmdbIEfz+vTg//E8LLcXzxRdgCAkhdh9vMT66So=;
	b=zkR1T3tRFNENllO1IxZSff/YZuLZTtXxgK6Qz5tbfKrFxxcW8iRe+lAWUuLsUhln4E3TlS
	PkBQBnZ0IV//J7/oAWUEzvK30dUJT1ieMRk9FF1/njKe6UfuB+K4rL/FvwZRy7aNcVSv0p
	aVqsxhqEX9USUOfn8fbzIOk3vXTwPmfbggUi3qkm/cdlTn2nfGBbPy2aqUdvPJ8F5SEbjB
	PS0SeTi/VvRpL9oJ9/6FfvR6ltAL0cdPppFeh/2nqkmulqlukjILpcLhKbzAC1hhELAZx6
	6+XK6OUiMgz89pvCRRaNd3z4SBujbZ5a9SnAOBHv3BXbLZrF9loKSzG7M8qb7A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1789728252;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type;
	bh=CiwXmmdbIEfz+vTg//E8LLcXzxRdgCAkhdh9vMT66So=;
	b=AN4XQTipSgxZGuyyIvfehlnKXDByEhYUOqND+SeJ86JRP+gb85pNMBAGKni4U2TqO7foJe
	bPGDq7wUikOet+AQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com
Subject: [PATCH] platform/raspberrypi: Use %p for pointer formatting
Message-ID: <20260918104411.gMUABcHB@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_034416_848270_D58C26EC 
X-CRM114-Status: UNSURE (   9.62  )
X-CRM114-Notice: Please train this message.
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

Since commit ad67b74d2469d ("printk: hash addresses printed with
%p") pointers are hashed by default and the behaviour can be controller
by `hash_pointers' boot argument.
The policy on %p is to not introduce new ones.
Removing %pK makes it possible to remove its handling from the library.

Ideally I would the %p usage here but can't tell how important it is for
debugging.

Use %p instead %pK.

Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
 drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c  | 4 ++--
 drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
index e786417032522..c99f63b80addf 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_arm.c
@@ -891,7 +891,7 @@ void vchiq_dump_platform_instances(struct vchiq_state *state, struct seq_file *f
 		}
 		rcu_read_unlock();
 
-		seq_printf(f, "Instance %pK: pid %d,%s completions %d/%d\n",
+		seq_printf(f, "Instance %p: pid %d,%s completions %d/%d\n",
 			   instance, instance->pid,
 			   instance->connected ? " connected, " :
 			   "",
@@ -908,7 +908,7 @@ void vchiq_dump_platform_service_state(struct seq_file *f,
 	struct user_service *user_service =
 			(struct user_service *)service->base.userdata;
 
-	seq_printf(f, "  instance %pK", service->instance);
+	seq_printf(f, "  instance %p", service->instance);
 
 	if ((service->base.callback == service_callback) && user_service->is_vchi) {
 		seq_printf(f, ", %d/%d messages",
diff --git a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
index 48d6b1d743293..bb4e5015956d6 100644
--- a/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
+++ b/drivers/platform/raspberrypi/vchiq-interface/vchiq_core.c
@@ -3915,7 +3915,7 @@ void vchiq_dump_state(struct seq_file *f, struct vchiq_state *state)
 	seq_printf(f, "State %d: %s\n", state->id,
 		   conn_state_names[state->conn_state]);
 
-	seq_printf(f, "  tx_pos=0x%x(@%pK), rx_pos=0x%x(@%pK)\n",
+	seq_printf(f, "  tx_pos=0x%x(@%p), rx_pos=0x%x(@%p)\n",
 		   state->local->tx_pos,
 		   state->tx_data + (state->local_tx_pos & VCHIQ_SLOT_MASK),
 		   state->rx_pos,
-- 
2.55.0


