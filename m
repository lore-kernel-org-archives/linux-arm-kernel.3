Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BC1BC982D8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 14:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5OcZ3HbYtIeYRRXVQKXFZiwk4WCSqfOF9R0M+z4jE/c=; b=1LUpI3Bnbx28yi
	mON4/d+IdqkcOBmfZWQCioe0G1CGMNuM2m7HA1gnWkxAWsplXrlSPyVTC/LGJNQthSsq0ozH0KCJQ
	w++gyRPIUdRO6GXWmaOkJZdBe0M60q7oJJdZT+YiscoeD3cQPbktIkhkQ2K2+6ukEvaS6HpJXZv2P
	gtnV+QfaXCIrG7G/co4tRz7JxY2PQVW51P8MgNMcf9EyVM2HxTa++gJUbp8TJns2pb4nrkEm5IyYB
	J9rK+UqYf3TrY69N87Vw4XgkVK43cmiXhMKPwzNYT/ckDgK3Nw9wsJKgkE8V3sLpKrmrCMd83IZsW
	YRsgcKA8xgRtHZKmr4Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJV-0000000Efn9-1L0R;
	Fri, 18 Sep 2026 14:11:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ZJP-0000000Efkc-3toL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 14:11:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B0DF2168F;
	Fri, 18 Sep 2026 07:11:29 -0700 (PDT)
Received: from e142021.Arm.com (e142021.arm.com [10.41.4.144])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9851E3F86C;
	Fri, 18 Sep 2026 07:11:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789740693; bh=EqKIdJZ0C+yXX2cIFzzx7FCYTPgkMMFND81vIIt+GIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=F8FyOcCXQckp4bzNt3OPkNZh/YqjJUFVK3Ks90QuELF1e+SfV/oHOHnLlbvEJbIjW
	 +0+W6JoEjuh4aPKeFPi1H2YKg+jWtMQuTPHrDEB65dDB4bMg/rHN6FapE+LfjOWR5d
	 ec95aBneWJET/Ps4qFVCb0yDoYk/OG7950gLn2Bc=
From: Andre Przywara <andre.przywara@arm.com>
To: Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH v4 3/8] firmware: smccc: lfa: Add timeout and trigger watchdog
Date: Fri, 18 Sep 2026 16:11:06 +0200
Message-ID: <20260918141112.2115555-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260918141112.2115555-1-andre.przywara@arm.com>
References: <20260918141112.2115555-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_071136_372891_5C01C4BF 
X-CRM114-Status: GOOD (  17.62  )
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
 drivers/firmware/smccc/lfa_fw.c | 43 +++++++++++++++++++++++++++++----
 1 file changed, 38 insertions(+), 5 deletions(-)

diff --git a/drivers/firmware/smccc/lfa_fw.c b/drivers/firmware/smccc/lfa_fw.c
index 7cf847e102d5a..b6ce478d3fc01 100644
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
@@ -295,6 +303,7 @@ static int call_lfa_activate(void *data)
 	struct fw_image *image = data;
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
 
+	touch_nmi_watchdog();
 	reg.a0 = ARM_SMCCC_LFA_ACTIVATE;
 	reg.a1 = image->fw_seq_id;
 	/*
@@ -318,6 +327,7 @@ static int call_lfa_activate(void *data)
 
 static int activate_fw_image(struct fw_image *image)
 {
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_ACTIVATE_BUDGET_MS);
 	int ret;
 
 retry:
@@ -339,8 +349,15 @@ static int activate_fw_image(struct fw_image *image)
 	}
 
 	/* SMC returned with call_again flag set, or with LFA_BUSY */
-	if (ret == -EAGAIN || ret == -EBUSY)
-		goto retry;
+	if (ret == -EAGAIN || ret == -EBUSY) {
+		if (ktime_before(ktime_get(), end)) {
+			if (!msleep_interruptible(LFA_ACTIVATE_DELAY_MS))
+				goto retry;
+			ret = -EINTR;
+		} else {
+			ret = -ETIMEDOUT;
+		}
+	}
 
 	lfa_cancel(image);
 
@@ -352,6 +369,7 @@ static int activate_fw_image(struct fw_image *image)
 static int prime_fw_image(struct fw_image *image)
 {
 	struct arm_smccc_1_2_regs reg = { 0 }, res;
+	ktime_t end = ktime_add_ms(ktime_get(), LFA_PRIME_BUDGET_MS);
 	int ret;
 
 	if (image->may_reset_cpu) {
@@ -360,6 +378,8 @@ static int prime_fw_image(struct fw_image *image)
 		return -EINVAL;
 	}
 
+	touch_nmi_watchdog();
+
 	reg.a0 = ARM_SMCCC_LFA_PRIME;
 retry:
 	/*
@@ -378,10 +398,23 @@ static int prime_fw_image(struct fw_image *image)
 		return lfa_to_linux_errno((long)res.a0);
 	}
 
-	if (res.a1 & LFA_PRIME_CALL_AGAIN)
-		goto retry;
+	if (!(res.a1 & LFA_PRIME_CALL_AGAIN))
+		return 0;
 
-	return 0;
+	/* SMC returned with call_again flag set */
+	if (ktime_before(ktime_get(), end)) {
+		if (!msleep_interruptible(LFA_PRIME_DELAY_MS))
+			goto retry;
+		ret = -EINTR;
+	} else {
+		pr_err("LFA_PRIME for image %s timed out",
+		       get_image_name(image));
+		ret = -ETIMEDOUT;
+	}
+
+	lfa_cancel(image);
+
+	return ret;
 }
 
 static ssize_t name_show(struct kobject *kobj, struct kobj_attribute *attr,
-- 
2.43.0


