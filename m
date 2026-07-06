Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 980F5C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Jul 2026 13:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aPdLf+KOxw8KHcG6+hmeQrsSh4Lil+ms6YT/gHj3kAw=; b=F6en0W0MncE4CG
	7Dhy0KStVjcB29ixtxDMqjMzgo1rFfPx4r1ihcfHapIDJPBSl5TlL5iZiTMKQTg3r6H6tnvxAwsL0
	X+3CfRPRuVhvIRl9XHs2sK5ZTaMMaxB3bSvJ6dKbYhD9HOKIYB86+9cL9tjnU64RrNNdXgU7h3byG
	BABJFHqSiWYdN54W9u/X32A3DXDcAx7cUAB0hojiqysvo/OjvZWTg6oPZgoLOOdX42VoRujksHIDo
	YY/EVVxnqzUmQQdCBpImjIRy30RPtfbp8Mn/4ydUWOlx+S4Qx2VqGw1QWCJWYZERkhA0p+5o1wQ4I
	lbMQllBbJheMGLSgHneA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdQ-0000000Ce7l-3qWu;
	Mon, 06 Jul 2026 13:45:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgjdM-0000000Ce4t-43Er
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Jul 2026 13:45:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D01912BCB;
	Mon,  6 Jul 2026 06:45:10 -0700 (PDT)
Received: from e142021.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9D1253F7B4;
	Mon,  6 Jul 2026 06:45:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1783345515; bh=CbtwH7ct89Y2IfSsUKd1NZgN+GgDKmoEfOcekMjK3LQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ANCszHiu7/bac9OrHAcpdv3zTBl25v5nilv8Va3d2jxiGO9bgZGhoyBV3wm85RPQ8
	 UT9Wh3nBHO0BopK+M7h6HwLqq6JUlDtlak9THbRfnCkJCwnzpMVZsddUusDi/hw3gB
	 qHH3FYJoaP43vcR5D+U13jL81SsPWeAhfRfW2lbk=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v3 3/8] firmware: smccc: lfa: Add timeout and trigger watchdog
Date: Mon,  6 Jul 2026 15:44:43 +0200
Message-ID: <20260706134455.132091-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260706134455.132091-1-andre.przywara@arm.com>
References: <20260706134455.132091-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260706_064517_109670_11515656 
X-CRM114-Status: GOOD (  16.61  )
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
Cc: Conor Dooley <conor+dt@kernel.org>, vsethi@nvidia.com, Salman Nabi <salman.nabi@arm.com>, Rob Herring <robh@kernel.org>, linux-kernel@vger.kernel.org, Varun Wadekar <vwadekar@nvidia.com>, Trilok Soni <trilokkumar.soni@oss.qualcomm.com>, devicetree@vger.kernel.org, Nirmoy Das <nirmoyd@nvidia.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
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
index b333b1e28c0d..357e41f95206 100644
--- a/drivers/firmware/smccc/lfa_fw.c
+++ b/drivers/firmware/smccc/lfa_fw.c
@@ -6,11 +6,14 @@
 #include <linux/arm-smccc.h>
 #include <linux/arm-smccc-bus.h>
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
@@ -27,6 +30,11 @@
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
@@ -276,6 +284,7 @@ static int call_lfa_activate(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
 
+	touch_nmi_watchdog();
 	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
 	reg.a1 = image->fw_seq_id;
 	/*
@@ -299,6 +308,7 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct fw_image *image)
 {
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
 	int ret;
 
 retry:
@@ -314,8 +324,14 @@ static int activate_fw_image(struct fw_image *image)
 	}
 
 	/* SMC returned with call_again flag set, or with LFA_BUSY */
-	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY)
-		goto retry;
+	if (ret == -LFA_CALL_AGAIN || ret == -LFA_BUSY) {
+		if (ktime_before(ktime_get(), end)) {
+			msleep_interruptible(LFA_ACTIVATE_DELAY_MS);
+			goto retry;
+		}
+
+		ret = -LFA_TIMED_OUT;
+	}
 
 	lfa_cancel(image);
 
@@ -328,6 +344,7 @@ static int activate_fw_image(struct fw_image *image)
 static int prime_fw_image(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
 
 	if (image->may_reset_cpu) {
 		pr_err("CPU reset not supported by kernel driver\n");
@@ -335,6 +352,8 @@ static int prime_fw_image(struct fw_image *image)
 		return -EINVAL;
 	}
 
+	touch_nmi_watchdog();
+
 	reg.a0 = ARM_SMCCC_LFA_PRIME;
 retry:
 	/*
@@ -353,8 +372,24 @@ static int prime_fw_image(struct fw_image *image)
 		return res.a0;
 	}
 
-	if (res.a1 & LFA_PRIME_CALL_AGAIN)
-		goto retry;
+	if (res.a1 & LFA_PRIME_CALL_AGAIN) {
+		int ret;
+
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


