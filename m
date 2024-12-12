Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D0C8E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ad8VaRxtZnAxyHVkIXz4K0nVjIFcF/oVHqSEQiSXY50=; b=MYSsAQwdMsvqWfGWUtfWCM2fUk
	xGtp9kXNOvo8hAC8UuJ5KFK1o3q6TDZJ0bt4F5bLHdiMm5umgB9kEZlfDqJiKpRsM+cEHnJwgq3bg
	/bnH+bS2VbutQ32lrkDiJht/3jIK021UW7w0nGo+4UsXWQWS2GX4QVl+fI/JKbkA0yppgqvpFICqN
	d5xo5P/m4Hwq8b2WR7BU1TeGW9ObbcIQbI3j0EvY/HSX/Q7poN8eLpl3PkPHykdJglufb3fH4RZ4/
	a6n+d+ACJ5iorGSNjWIkP9nQ7fhs53KbchXvD338bpW6/yUXq3+yuROm/rCrxl+b2JjpXFRJ5Ogv7
	AmXG5O5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlPA-00000000oFp-3lPS;
	Thu, 12 Dec 2024 15:47:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlIm-00000000mwf-05Js
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:40:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BFA241762;
	Thu, 12 Dec 2024 07:40:59 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.41])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AE2513F720;
	Thu, 12 Dec 2024 07:40:30 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH 5/6] arm_mpam: [NFU] Rework ID remapping to use a kernel command-line argument
Date: Thu, 12 Dec 2024 15:39:59 +0000
Message-Id: <20241212154000.330467-6-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212154000.330467-1-Dave.Martin@arm.com>
References: <20241212154000.330467-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_074032_103702_1BC23D24 
X-CRM114-Status: GOOD (  11.63  )
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

Hacking the source is an acceptable interface for experimentation,
but not very convenient.

Instead, add a kernel command-line parameter
mpam_partid_per_closid=<n> to specify how many PARTIDs are used to
provide monitoring groups for each resctrl CLOSID.

This change is not intended for upstream.

Signed-off-by: Dave Martin <Dave.Martin@arm.com>
---
 drivers/platform/arm64/mpam/mpam_resctrl.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/platform/arm64/mpam/mpam_resctrl.c b/drivers/platform/arm64/mpam/mpam_resctrl.c
index 0473286ec65a..870efbf39f6f 100644
--- a/drivers/platform/arm64/mpam/mpam_resctrl.c
+++ b/drivers/platform/arm64/mpam/mpam_resctrl.c
@@ -3,6 +3,9 @@
 
 #define pr_fmt(fmt) "mpam: resctrl: " fmt
 
+#undef KBUILD_MODNAME
+#define KBUILD_MODNAME "mpam"
+
 #include <linux/arm_mpam.h>
 #include <linux/cacheinfo.h>
 #include <linux/cpu.h>
@@ -10,6 +13,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <linux/list.h>
+#include <linux/moduleparam.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/resctrl.h>
@@ -158,6 +162,24 @@ static bool mpam_resctrl_hide_cdp(enum resctrl_res_level rid)
 
 static unsigned int partid_per_closid = 1;
 
+static int mpam_resctrl_partid_per_closid_set(const char *val,
+					      const struct kernel_param *kp)
+{
+	/*
+	 * 16 in an arbitrary maximum, sufficient for experimentation
+	 * but not ridiculously large:
+	 */
+	return param_set_uint_minmax(val, kp, 1, 16);
+}
+
+static const struct kernel_param_ops mpam_resctrl_partid_per_closid_ops  = {
+	.set = mpam_resctrl_partid_per_closid_set,
+	.get = param_get_uint,
+};
+
+device_param_cb(partid_per_closid, &mpam_resctrl_partid_per_closid_ops,
+		&partid_per_closid, 0444);
+
 static unsigned int mpam_num_pmg(void)
 {
 	return mpam_pmg_max + 1;
-- 
2.34.1


