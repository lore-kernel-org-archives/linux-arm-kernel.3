Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C518C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 15:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ONJgNMzxClMztzX9/gp9gMBjGA6j/fpzTGTPGO/ELgc=; b=3SiMPl+UgPiOuGRtGtuXEVmB0N
	j7uBn2fjsuBcM5MB5aehNi3TsYzq4rF9Hse9mkTizjB/FQCBfSqh1Ma2WH2ymddc9RxVUcsWXHd0c
	DaP2JBd62Q7KHoNwTVkMYJ68+IjmY9Xf1U2oSpBs5jFNPaAlOqTqA/BcDtojmCGZsYHgh2ZjxKv9c
	rbSLiYznSVCvouNlbjMSl/vXoXw5dlwIvc+iPNrZgFHYBI5Iilax10c4IDcFhRkt6Ur663MCxMMOO
	NlI4dwHRgXleIuGizJ1DMicTia4L/1DY5MNifI7jvrZ2hMoSsAfShPBP47kZ2/tiQUUjBX7e6btXp
	rt7s+1gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYoOg-00000000dg8-2Olg;
	Fri, 17 Jan 2025 15:36:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYo06-00000000ZGb-3Cdp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jan 2025 15:11:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 00CCA1476;
	Fri, 17 Jan 2025 07:11:39 -0800 (PST)
Received: from e133380.cambridge.arm.com (e133380.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D65A23F73F;
	Fri, 17 Jan 2025 07:11:09 -0800 (PST)
From: Dave Martin <Dave.Martin@arm.com>
To: linux-kernel@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Zeng Heng <zengheng4@huawei.com>,
	Shaopeng Tan <tan.shaopeng@fujitsu.com>,
	James Morse <james.morse@arm.com>
Subject: [RFC PATCH v2 07/11] arm_mpam: [NFU] Rework ID remapping to use a kernel command-line argument
Date: Fri, 17 Jan 2025 15:10:29 +0000
Message-Id: <20250117151033.1517882-20-Dave.Martin@arm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250117151033.1517882-1-Dave.Martin@arm.com>
References: <20250117151033.1517882-1-Dave.Martin@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_071110_835362_B09829AD 
X-CRM114-Status: GOOD (  12.12  )
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
index f834753a3274..eb1ef5d2bc57 100644
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


