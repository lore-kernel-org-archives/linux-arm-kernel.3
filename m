Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4125CD342F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 21:46:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eUD9DeuD9wPNQm64sgjZ1QoOElmrAVGf/IwiBojeS0s=; b=KTjm94+mmsO85TS/qVNjpxEcPd
	dwN2x9edd+3avn8I0Z4MOzbJzcdF6/xOYWYKhhwIFRmwJ+9nLzBaZCKc4BBSR2yrorj1kmAMFhqY+
	RkRRwDKQL4wgPV6aXBZlpaTXk04q+UpD3BdrnfrYxuEqQZVLDtrE/BOgsn7jOC1aFmr01d06jSPH6
	PW3EBj8CrrRXy9Czz5AbZ0kRJPRDvMlzdfZ4RBx8qwPYHZooEGRSV1QZfJB6M3t1CvvGNcILlrcAz
	bg1VM1Ou40yUKsjSDazmqrc8F3mnd7fZkC/8GO/p3kJFZzQeoO4F7KT5EVgzO9GEvfrMoz4Q4gaYX
	OoNJuprg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK17K-0000000EQ8f-0Sip;
	Mon, 04 May 2026 21:46:18 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wK17H-0000000EQ84-3q0b
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 21:46:17 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-479d68a9063so1576856b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 May 2026 14:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777931174; x=1778535974; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eUD9DeuD9wPNQm64sgjZ1QoOElmrAVGf/IwiBojeS0s=;
        b=ChowOXfYbHjCazWCMXXUouUA0p3dxoJ9xjkFTwLO9hv5kHKFq5v/qmOHw5WptuewNm
         DUtQWeRF8KHKgrfgcIRC/WBdm7SlhWcdYoZY9zsw8Y455tW0adUeUY6JpBPs8CyVw7gc
         P0eG+H/GEl3gVcsPXEuxQSVCR+VghOs5EFBnxg3pnC8J0ltSCgd8Bqp4hSAWiUyUUimA
         otJ3R5rSUuVqUtBDCfcnbYJYHX9eR6CKXig38TDmBTxFcOpCjoSiduz6epa/yYTUCX58
         MnlBcEj8SId7tCwqxb9pWXVVrDF/mIiALyM9ZC8a+gRtEN4PFtA6Lxn2itr1vvhSgshd
         9nWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777931174; x=1778535974;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eUD9DeuD9wPNQm64sgjZ1QoOElmrAVGf/IwiBojeS0s=;
        b=k+8a7C+2c9Dh9kCnknLiqqnEyv2Wwemga2/WzIMZSeTg9ESiQA82FtLPzeNHQxGIi0
         zDr034E7GFDFW+YZ8d02K5fJIj6GD3ZsogKFbQuKtKb7XgzCfi3RBmW2FqF7Z6WqnXmB
         EsmwfxuEfQ8zhLG7bhzfzvYVeoEC96FLL26OQw2Ej0mnKdykqBmZOyMhKUqPGeah438s
         nuuUV+pmufkTs/+V8GmMznN/Jp9TISP+Y/RjmrdskYUBxWA3Gpn4o/GwJHQMMBFWrJ83
         ouyEjHfxeAjFAkH2h4BiEKoUbVDEmRX/TlafsF0ZCPRqi4fwqWcX6nJ0cyQr+AmIXdt0
         n78A==
X-Forwarded-Encrypted: i=1; AFNElJ9vKhNDjTT2U4sbIkkX+m9HYrjzxk1RvEhtmaYZ2x8iIrdRyg3PQPbfCjqh0pDO8puAHx1n0qZab49ei8TqhAFl@lists.infradead.org
X-Gm-Message-State: AOJu0YxIm0RhIIBw4uBYb9/7MnC5bufTtyJPAkDl4jZRH8h/P0pYH9dF
	yzrHzkTkjQ8evS7tWL/O8OgvuzyZEgLzXu9Xb4p9PxqaopCznH/v4syd
X-Gm-Gg: AeBDiesD0prQV6JsnHtmV6fyUhIDL2DYOGR6gb4JBuOwdfYGO/GZ0NhJrszjEIaZwCF
	vU2CxUiDsVMTNTAGw3fscbeMTetTLKB8bOxR2BPHlzx0UTbs02x3gD0fsNfaksb7TMXTGBokuNt
	K4DBbGqIYSJT3MZxa02kEVGKFtEbO1g9HhEHKXWMXytYAuhuNkAe7mq6JXVu2kppnSU7R8nISa1
	5c+9Y39otzcmonKQrbmtFUE9qcHjLNi/NefUg5BbwxM9jGBx9J9u9lOD/ccjVtVFMBBT6axcdde
	nFwhmGP55mLO7aVbUmxCEV7O9+c8PIwP8P20HacYGpu9Td/sm+0P3NiuUOAjdaJ0n1C80AOF5qd
	a8RZRGqSUKDCL3V0SK2Dg16Cm8K+6+NTEgj+x63wdKAvfkQTcTrak6ymyCH/AN+WhQ8Glm2l5bj
	0pTCOtUwjX1Q7P/ymHMuuhSTuTqo+lsqiuXxKjUvUdnjtvYvaKEMiGl2RYweGvyxw2aHBPsDnQ0
	XyB5s4=
X-Received: by 2002:a05:6808:199f:b0:479:ac7d:6d91 with SMTP id 5614622812f47-47c892a6a6amr5268710b6e.39.1777931174448;
        Mon, 04 May 2026 14:46:14 -0700 (PDT)
Received: from linuxescape.lan (23-88-128-2.fttp.usinternet.com. [23.88.128.2])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-47c763b33c1sm7439845b6e.1.2026.05.04.14.46.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 May 2026 14:46:14 -0700 (PDT)
From: Maxwell Doose <m32285159@gmail.com>
To: salih.erim@amd.com,
	conall.ogriofa@amd.com,
	jic23@kernel.org,
	michal.simek@amd.com
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	linux-iio@vger.kernel.org (open list:XILINX AMS DRIVER),
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/ZYNQ ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iio: adc: xilinx-ams: Replace spin_lock() and unlock() calls with guard(spinlock*)()
Date: Mon,  4 May 2026 16:46:12 -0500
Message-ID: <20260504214613.121283-1-m32285159@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_144615_959923_64E7F58A 
X-CRM114-Status: GOOD (  12.43  )
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

Include linux/cleanup.h to take advantage of RAII macros.

Replace spin_lock() and unlock() calls with their RAII macro
counterparts. This will help modernize the code and increase readability.

Remove "flags" variables where spin_lock_irqsave() has been replaced
with guard(spinlock_irqsave)()

Signed-off-by: Maxwell Doose <m32285159@gmail.com>
---
 drivers/iio/adc/xilinx-ams.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/drivers/iio/adc/xilinx-ams.c b/drivers/iio/adc/xilinx-ams.c
index 124470c92529..2b98f94d90bc 100644
--- a/drivers/iio/adc/xilinx-ams.c
+++ b/drivers/iio/adc/xilinx-ams.c
@@ -10,6 +10,7 @@
 
 #include <linux/bits.h>
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/clk.h>
 #include <linux/delay.h>
 #include <linux/devm-helpers.h>
@@ -414,18 +415,15 @@ static void ams_unmask(struct ams *ams)
 
 static void ams_update_alarm(struct ams *ams, unsigned long alarm_mask)
 {
-	unsigned long flags;
-
 	if (ams->ps_base)
 		ams_update_ps_alarm(ams, alarm_mask);
 
 	if (ams->pl_base)
 		ams_update_pl_alarm(ams, alarm_mask);
 
-	spin_lock_irqsave(&ams->intr_lock, flags);
+	guard(spinlock_irqsave)(&ams->intr_lock);
 	ams_update_intrmask(ams, AMS_ISR0_ALARM_MASK, ~alarm_mask);
 	ams_unmask(ams);
-	spin_unlock_irqrestore(&ams->intr_lock, flags);
 }
 
 static void ams_enable_channel_sequence(struct iio_dev *indio_dev)
@@ -1060,9 +1058,8 @@ static void ams_unmask_worker(struct work_struct *work)
 {
 	struct ams *ams = container_of(work, struct ams, ams_unmask_work.work);
 
-	spin_lock_irq(&ams->intr_lock);
+	guard(spinlock_irq)(&ams->intr_lock);
 	ams_unmask(ams);
-	spin_unlock_irq(&ams->intr_lock);
 
 	/* If still pending some alarm re-trigger the timer */
 	if (ams->current_masked_alarm)
@@ -1076,16 +1073,14 @@ static irqreturn_t ams_irq(int irq, void *data)
 	struct ams *ams = iio_priv(indio_dev);
 	u32 isr0;
 
-	spin_lock(&ams->intr_lock);
+	guard(spinlock)(&ams->intr_lock);
 
 	isr0 = readl(ams->base + AMS_ISR_0);
 
 	/* Only process alarms that are not masked */
 	isr0 &= ~((ams->intr_mask & AMS_ISR0_ALARM_MASK) | ams->current_masked_alarm);
-	if (!isr0) {
-		spin_unlock(&ams->intr_lock);
+	if (!isr0)
 		return IRQ_NONE;
-	}
 
 	/* Clear interrupt */
 	writel(isr0, ams->base + AMS_ISR_0);
@@ -1099,8 +1094,6 @@ static irqreturn_t ams_irq(int irq, void *data)
 	schedule_delayed_work(&ams->ams_unmask_work,
 			      msecs_to_jiffies(AMS_UNMASK_TIMEOUT_MS));
 
-	spin_unlock(&ams->intr_lock);
-
 	return IRQ_HANDLED;
 }
 

base-commit: 7fd2df204f342fc17d1a0bfcd474b24232fb0f32
-- 
2.54.0


