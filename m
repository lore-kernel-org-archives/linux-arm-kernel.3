Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C87A6C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 00:31:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TewbN+94O1vSpe85NKxHqZUbofGnJs96Ssy/504dggE=; b=kNBtM41iSXmnTRcN8iPTC2lqpz
	kWM+s9LnA3WGkSmDCvKh43/NYVOHwz/SEIo4tAASC+BrfbxEnkjU4ml4Aq6GSaa2aLlYr5vEvpFB/
	Wya5mydRWl98tXrkwNH0CZA17rVOrp0+V6jAKbRbhBiUGpvsQ3/6NT1huevLgdfULtVZd1dY8UjsK
	/7y/57N59kHw2OZr7BGrXtwTflY5SDf7lPKAvKGfOiPzpi3yjz4tS3Z14OeyGP36tqXqZalmtyGuj
	kakoDY9GdQuQ0JOMffgnauz0XJe5qhqBGPSoO/M4ho6/hDjRskqEvt/YLV798ML2vGq3grnRNZViN
	R7WJu9LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTaA-00000003eCq-0OI2;
	Tue, 15 Jul 2025 00:31:42 +0000
Received: from out-174.mta0.migadu.com ([91.218.175.174])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubTXh-00000003dYU-1f7o
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 00:29:11 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752539341;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=TewbN+94O1vSpe85NKxHqZUbofGnJs96Ssy/504dggE=;
	b=LjLsdXWOHwMlD7wYiLTPv8JM3ihc0ZmeFT91MxmLY88yZlqoZEezzdSaAixITKfXRqaY/w
	IJmAH56zwGGFNLWhIwCFQrGWybdgNF0n9bl6KK95Xi1aASsxfxbym6lzfrGC9o/RuCWnJC
	mZF1Gv7n3dAxH2i7JKXvVpfYPlEudPs=
From: Sean Anderson <sean.anderson@linux.dev>
To: Anand Ashok Dumbre <anand.ashok.dumbre@xilinx.com>,
	Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Andy Shevchenko <andy@kernel.org>,
	Manish Narani <manish.narani@xilinx.com>,
	linux-kernel@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH] iio: xilinx-ams: Unmask interrupts after updating alarms
Date: Mon, 14 Jul 2025 20:28:47 -0400
Message-Id: <20250715002847.2035228-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_172909_732318_652C9968 
X-CRM114-Status: GOOD (  12.14  )
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

To convert level-triggered alarms into edge-triggered IIO events, alarms
are masked when they are triggered. To ensure we catch subsequent
alarms, we then periodically poll to see if the alarm is still active.
If it isn't, we unmask it. Active but masked alarms are stored in
current_masked_alarm.

If an active alarm is disabled, it will remain set in
current_masked_alarm until ams_unmask_worker clears it. If the alarm is
re-enabled before ams_unmask_worker runs, then it will never be cleared
from current_masked_alarm. This will prevent the alarm event from being
pushed even if the alarm is still active.

Fix this by recalculating current_masked_alarm immediately when enabling
or disabling alarms.

Fixes: d5c70627a794 ("iio: adc: Add Xilinx AMS driver")
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/iio/adc/xilinx-ams.c | 45 ++++++++++++++++++++----------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 76dd0343f5f7..180d4140993d 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -389,6 +389,29 @@ static void ams_update_pl_alarm(struct ams *ams, unsigned long alarm_mask)
 	ams_pl_update_reg(ams, AMS_REG_CONFIG3, AMS_REGCFG3_ALARM_MASK, cfg);
 }
 
+static void ams_unmask(struct ams *ams)
+{
+	unsigned int status, unmask;
+
+	status = readl(ams->base + AMS_ISR_0);
+
+	/* Clear those bits which are not active anymore */
+	unmask = (ams->current_masked_alarm ^ status) & ams->current_masked_alarm;
+
+	/* Clear status of disabled alarm */
+	unmask |= ams->intr_mask;
+
+	ams->current_masked_alarm &= status;
+
+	/* Also clear those which are masked out anyway */
+	ams->current_masked_alarm &= ~ams->intr_mask;
+
+	/* Clear the interrupts before we unmask them */
+	writel(unmask, ams->base + AMS_ISR_0);
+
+	ams_update_intrmask(ams, ~AMS_ALARM_MASK, ~AMS_ALARM_MASK);
+}
+
 static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
 {
 	unsigned long flags;
@@ -401,6 +424,7 @@ static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
 
 	spin_lock_irqsave(&ams->intr_lock, flags);
 	ams_update_intrmask(ams, AMS_ISR0_ALARM_MASK, ~alarm_mask);
+	ams_unmask(ams);
 	spin_unlock_irqrestore(&ams->intr_lock, flags);
 }
 
@@ -1035,28 +1059,9 @@ static void ams_handle_events(struct iio_dev *indio_dev, unsigned long events)
 static void ams_unmask_worker(struct work_struct *work)
 {
 	struct ams *ams = container_of(work, struct ams, ams_unmask_work.work);
-	unsigned int status, unmask;
 
 	spin_lock_irq(&ams->intr_lock);
-
-	status = readl(ams->base + AMS_ISR_0);
-
-	/* Clear those bits which are not active anymore */
-	unmask = (ams->current_masked_alarm ^ status) & ams->current_masked_alarm;
-
-	/* Clear status of disabled alarm */
-	unmask |= ams->intr_mask;
-
-	ams->current_masked_alarm &= status;
-
-	/* Also clear those which are masked out anyway */
-	ams->current_masked_alarm &= ~ams->intr_mask;
-
-	/* Clear the interrupts before we unmask them */
-	writel(unmask, ams->base + AMS_ISR_0);
-
-	ams_update_intrmask(ams, ~AMS_ALARM_MASK, ~AMS_ALARM_MASK);
-
+	ams_unmask(ams);
 	spin_unlock_irq(&ams->intr_lock);
 
 	/* If still pending some alarm re-trigger the timer */
-- 
2.35.1.1320.gc452695387.dirty


