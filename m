Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53C33CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 10:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL2VEZ+IBzYwlxXYg+rzHKBpplI1E6Vg7+aMtx1rIHc=; b=fV9jFKs5NhQvL+n918l4DyVpxs
	2qmv4fWCwm0nT+gCKtqlPWO3I50hlco4iYAswJGgwTMKE7qz9Z859cBlylrIWIIVlpvZ/R5W3EIZl
	zoxdmVh7HKkptAnrJd1v7N+bBveJyZ4op2I/K7zlbqiAretYY5w0h7htMVyN/zGf8dXbhH2+eE90e
	MDTVse1DOSEkxPxvozOChW0xzCtCrRJfFGKy77o5oMzEEAN8g1aM54tPVjDSCLJ2P3GxhMxX7okcx
	1EHAt9ODR+/JGSWrNsbfpp+1Wc4qqTAaMOjwCeOR5wLq8ISEB2+9Asc4WGuUjP34or3Tpl0uH3TeX
	SUklp8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6Xq-00000003gZF-189q;
	Mon, 15 Sep 2025 10:34:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XT-00000003g5F-2hKl
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 15 Sep 2025 10:34:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=LL2VEZ+IBzYwlxXYg+rzHKBpplI1E6Vg7+aMtx1rIHc=; b=h9TYt1gSI8R1fyJ5gOxQNq7CIc
	BACZTXCOHgJR1tSLJqdl+G1rPUWhaK2efb8ztccbBHdOLUPUzEqBihv6tNBHwmOAM7KNlQFakfTvJ
	SeLoaQtEIkS9OlOCLVzWV5R7kbfjRRnOI/v4FSZPrvJ3uI3si6pAfqBzJT56Sxe5m2YIXTB/nZDwJ
	aeJAt+3rDgA+g4CHeb4lkTOVWm2G9EFpwVtfoN6GwXUkmGy71BYLN2IQeXxwVJ+FzstnzZeakWIWm
	fXvUh52uZgyTzLQ/4uXADbFB9NpMXELeV6odMdMhPOnctDgAUCI4e9wNDC/gpJuVHOz5Si/o+AlAe
	edU8VItQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy6XQ-00000006vaB-3HUa
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 10:34:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C3C9A1424;
	Mon, 15 Sep 2025 03:34:15 -0700 (PDT)
Received: from e132581.arm.com (e132581.arm.com [10.1.196.87])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 688333F66E;
	Mon, 15 Sep 2025 03:34:22 -0700 (PDT)
From: Leo Yan <leo.yan@arm.com>
Date: Mon, 15 Sep 2025 11:33:45 +0100
Subject: [PATCH v3 22/31] coresight: cti: Make spin lock usage consistent
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250915-arm_coresight_power_management_fix-v3-22-ea49e91124ec@arm.com>
References: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
In-Reply-To: <20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>, 
 Yeoreum Yun <yeoreum.yun@arm.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>, 
 Yuanfang Zhang <quic_yuanfang@quicinc.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 Leo Yan <leo.yan@arm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757932420; l=2066;
 i=leo.yan@arm.com; s=20250604; h=from:subject:message-id;
 bh=RRuY2BufywWAGfMqAHbJ+Q87b/ypQTczbAJn4tPYXZI=;
 b=zE6eXaBADP1NPg//CIp/56NkcYPs0BSgAqvZwndTW14+uOIdTXlS8iSOuc/B0Ii5bHYwO3qtg
 TUyGuz9LQdYBBaSKhmBFy1wlfEKIYopx6awTlujJKHyvyVt37a/X3yQ
X-Developer-Key: i=leo.yan@arm.com; a=ed25519;
 pk=k4BaDbvkCXzBFA7Nw184KHGP5thju8lKqJYIrOWxDhI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_113425_114036_AE59294F 
X-CRM114-Status: GOOD (  11.31  )
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

The spin lock is currently acquired sometimes with IRQs disabled and
sometimes without. This leads to inconsistent semantics: the lock can be
either HARDIRQ-safe or HARDIRQ-unsafe, which may trigger lockdep
complaints.

Make the spin lock usage consistent by always without disabling IRQ.

Note: the CTI driver currently has a flaw that it does not use SMP call
for CPU-bound devices. Once the SMP call is supported in the CTI driver,
the locking scheme should consider to disable IRQs when taking the lock.

Signed-off-by: Leo Yan <leo.yan@arm.com>
---
 drivers/hwtracing/coresight/coresight-cti-core.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-cti-core.c b/drivers/hwtracing/coresight/coresight-cti-core.c
index 206a46fd4efd05165c56567289928295c5e35d4f..081b645987c7c7276361609bdf437949f62b5964 100644
--- a/drivers/hwtracing/coresight/coresight-cti-core.c
+++ b/drivers/hwtracing/coresight/coresight-cti-core.c
@@ -91,10 +91,9 @@ static int cti_enable_hw(struct cti_drvdata *drvdata, enum cs_mode mode)
 {
 	struct cti_config *config = &drvdata->config;
 	struct coresight_device	*csdev = drvdata->csdev;
-	unsigned long flags;
 	int rc = 0;
 
-	raw_spin_lock_irqsave(&drvdata->spinlock, flags);
+	raw_spin_lock(&drvdata->spinlock);
 
 	if (!drvdata->config.enable_req_count) {
 		coresight_set_mode(csdev, mode);
@@ -119,7 +118,7 @@ static int cti_enable_hw(struct cti_drvdata *drvdata, enum cs_mode mode)
 
 	config->hw_enabled = true;
 	drvdata->config.enable_req_count++;
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock(&drvdata->spinlock);
 	return rc;
 
 cti_state_unchanged:
@@ -129,7 +128,7 @@ static int cti_enable_hw(struct cti_drvdata *drvdata, enum cs_mode mode)
 cti_err_not_enabled:
 	if (!drvdata->config.enable_req_count)
 		coresight_set_mode(csdev, CS_MODE_DISABLED);
-	raw_spin_unlock_irqrestore(&drvdata->spinlock, flags);
+	raw_spin_unlock(&drvdata->spinlock);
 	return rc;
 }
 

-- 
2.34.1


