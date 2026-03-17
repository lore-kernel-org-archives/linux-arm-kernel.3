Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43E08FD7076
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 10:34:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cwjQMCACmsvAEixGNPWA6vm0EF4rQ/pwY4kM2elfUl8=; b=0XJtFi0dSULCzL
	CiGLfoytcAKhLJBxvjG0bCmJFUmWfpUEzWzEvcw1U5yjZl51uDQOng5yFTJXTyBi2apNINTgDjEzO
	19+jy0imo3xTG6QosqzbbUIIKQ0lU1/ncr4vka/B8oobsYDiRSPbGuCCeSr89fUGfjA83h3b4le5d
	lS7W2xDsOC4wXYWsTAl74P3jRCpl7ZZdbZ9lHHD+HLYZNG0SL6Bbq8+KW23+LLOF54yDtu3ExCTER
	xAkpPw4Zbp2G19ES1lRhDACGVv6S/O5ra+319cqlPty/IC7F+j2p3PnE6azjmosU+yg0j6QK7A/vh
	G27UrATuF5Ivm0G3Pyeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2Rkb-000000062Dk-1Mhu;
	Tue, 17 Mar 2026 10:34:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2RkI-0000000621Z-1a4A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 10:33:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BD80C1477;
	Tue, 17 Mar 2026 03:33:47 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F29D53F7BD;
	Tue, 17 Mar 2026 03:33:51 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v2 4/8] firmware: smccc: lfa: Add timeout and trigger watchdog
Date: Tue, 17 Mar 2026 11:33:30 +0100
Message-ID: <20260317103336.1273582-5-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317103336.1273582-1-andre.przywara@arm.com>
References: <20260317103336.1273582-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_033354_607310_AD12A0C3 
X-CRM114-Status: GOOD (  15.25  )
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
Cc: vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, linux-kernel@vger.kernel.org, vwadekar@nvidia.com, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, Nirmoy Das <nirmoyd@nvidia.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Vedashree Vidwans <vvidwans@nvidia.com>

Enhance PRIME/ACTIVATION functions to touch watchdog and implement
timeout mechanism. This update ensures that any potential hangs are
detected promptly and that the LFA process is allocated sufficient
execution time before the watchdog timer expires. These changes improve
overall system reliability by reducing the risk of undetected process
stalls and unexpected watchdog resets.

Signed-off-by: Vedashree Vidwans <vvidwans@nvidia.com>
Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/firmware/smccc/lfa_fw.c | 43 ++++++++++++++++++++++++++++++---
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 4831abf2b60e..d1b5cd29b8a0 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -5,11 +5,14 @@
 
 #include <linux/arm-smccc.h>
 #include <linux/array_size.h>
+#include <linux/delay.h>
 #include <linux/fs.h>
 #include <linux/init.h>
 #include <linux/kobject.h>
+#include <linux/ktime.h>
 #include <linux/list.h>
 #include <linux/module.h>
+#include <linux/nmi.h>
 #include <linux/psci.h>
 #include <linux/stop_machine.h>
 #include <linux/string.h>
@@ -38,6 +41,11 @@
 #define LFA_PRIME_CALL_AGAIN		BIT(0)
 #define LFA_ACTIVATE_CALL_AGAIN		BIT(0)
 
+#define LFA_PRIME_BUDGET_MS		30000		/* 30s cap */
+#define LFA_PRIME_DELAY_MS		10		/* 10ms between polls */
+#define LFA_ACTIVATE_BUDGET_MS		10000		/* 10s cap */
+#define LFA_ACTIVATE_DELAY_MS		10		/* 10ms between polls */
+
 /* LFA return values */
 #define LFA_SUCCESS			0
 #define LFA_NOT_SUPPORTED		1
@@ -287,6 +295,7 @@ static int call_lfa_activate(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
 
+	touch_nmi_watchdog();
 	reg.a0 = LFA_1_0_FN_ACTIVATE;
 	reg.a1 = image->fw_seq_id;
 	/*
@@ -310,6 +319,7 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct fw_image *image)
 {
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
 	int ret;
 
 retry:
@@ -324,8 +334,15 @@ static int activate_fw_image(struct fw_image *image)
 		return 0;
 	}
 
-	if (ret == -LFA_CALL_AGAIN)
-		goto retry;
+	if (ret == -LFA_CALL_AGAIN) {
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
+			goto retry;
+		}
+
+		ret = -LFA_TIMED_OUT;
+	}
 
 	lfa_cancel(image);
 
@@ -338,6 +355,8 @@ static int activate_fw_image(struct fw_image *image)
 static int prime_fw_image(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
+	int ret;
 
 	if (image->may_reset_cpu) {
 		pr_err("CPU reset not supported by kernel driver\n");
@@ -345,6 +364,8 @@ static int prime_fw_image(struct fw_image *image)
 		return -EINVAL;
 	}
 
+	touch_nmi_watchdog();
+
 	reg.a0 = LFA_1_0_FN_PRIME;
 retry:
 	/*
@@ -363,8 +384,22 @@ static int prime_fw_image(struct fw_image *image)
 		return res.a0;
 	}
 
-	if (res.a1 & LFA_PRIME_CALL_AGAIN)
-		goto retry;
+	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
+		/* SMC returned with call_again flag set */
+		if (ktime_before(ktime_get(), end)) {
+			msleep_interruptible(LFA_PRIME_DELAY_MS);
+			goto retry;
+		}
+
+		pr_err("LFA_PRIME for image %s timed out",
+		       get_image_name(image));
+
+		ret = lfa_cancel(image);
+		if (ret != 0)
+			return ret;
+
+		return -ETIMEDOUT;
+	}
 
 	return 0;
 }
-- 
2.43.0


