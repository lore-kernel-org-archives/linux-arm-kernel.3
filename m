Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F8C3E8B368
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:46:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xb70mYrxdF/7yz7PIf1z4Dyn0Fl45693Oct7cIaR7CQ=; b=1HAnQXFJZxnMHWRu2E1F+nHCCq
	HLtGy7pC60o+cCc9jQtPGBWvbjSWjk/7/qu1j9w6aCIpphoALDLk3ffycGrhUKSe7eNLtyrp0JdTA
	49dDCQALg/RvgznR0V09cDwP4C4B0XDbMg93+1F5Co3RRwreiEX1Uwi3kG4q/u8fyBUFAXvtk7O4v
	4ehmJ6qZ0zDAmjmMxX1zw177aKbCBDOuaGRQUkwNkiZvCGbOZtZjAZpJ/Sw6O5kNrhSG9KnV+ULX1
	kfNk2fGcHxd2S9Q9pn2CDJZ+2sgaoOVAC/SVayHbv60+FMLnXwkELVakuzh1SJ+QNjNjK4Tghu4Bh
	PM/Q9hTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnODl-00000007PeR-3hzJ;
	Tue, 03 Feb 2026 21:46:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnODj-00000007Pc4-3i6B
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:46:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EB76A339;
	Tue,  3 Feb 2026 13:45:56 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A0C0F3F778;
	Tue,  3 Feb 2026 13:45:57 -0800 (PST)
From: Ben Horgan <ben.horgan@arm.com>
To: ben.horgan@arm.com
Cc: amitsinght@marvell.com,
	baisheng.gao@unisoc.com,
	baolin.wang@linux.alibaba.com,
	carl@os.amperecomputing.com,
	dave.martin@arm.com,
	david@kernel.org,
	dfustini@baylibre.com,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@huawei.com,
	kobak@nvidia.com,
	lcherian@marvell.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	peternewman@google.com,
	punit.agrawal@oss.qualcomm.com,
	quic_jiles@quicinc.com,
	reinette.chatre@intel.com,
	rohit.mathew@arm.com,
	scott@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	tan.shaopeng@fujitsu.com,
	xhao@linux.alibaba.com,
	catalin.marinas@arm.com,
	will@kernel.org,
	corbet@lwn.net,
	maz@kernel.org,
	oupton@kernel.org,
	joey.gouly@arm.com,
	suzuki.poulose@arm.com,
	kvmarm@lists.linux.dev,
	zengheng4@huawei.com,
	linux-doc@vger.kernel.org,
	Dave Martin <Dave.Martin@arm.com>,
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Subject: [PATCH v4 21/41] arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
Date: Tue,  3 Feb 2026 21:43:22 +0000
Message-ID: <20260203214342.584712-22-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134604_018702_1A56732C 
X-CRM114-Status: GOOD (  14.25  )
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

From: Dave Martin <Dave.Martin@arm.com>

MPAM uses a fixed-point formats for some hardware controls.  Resctrl
provides the bandwidth controls as a percentage. Add helpers to convert
between these.

Ensure bwa_wd is at most 16 to make it clear higher values have no meaning.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: Dave Martin <Dave.Martin@arm.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since v2:
Ensure bwa_wd is at most 16 (moved from patch 40: arm_mpam: Generate a
configuration for min controls)
Expand comments
---
 drivers/resctrl/mpam_devices.c |  7 +++++
 drivers/resctrl/mpam_resctrl.c | 51 ++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index bf99c37a80a7..965384c667f6 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -713,6 +713,13 @@ static void mpam_ris_hw_probe(struct mpam_msc_ris *ris)
 			mpam_set_feature(mpam_feat_mbw_part, props);
 
 		props->bwa_wd = FIELD_GET(MPAMF_MBW_IDR_BWA_WD, mbw_features);
+
+		/*
+		 * The BWA_WD field can represent 0-63, but the control fields it
+		 * describes have a maximum of 16 bits.
+		 */
+		props->bwa_wd = min(props->bwa_wd, 16);
+
 		if (props->bwa_wd && FIELD_GET(MPAMF_MBW_IDR_HAS_MAX, mbw_features))
 			mpam_set_feature(mpam_feat_mbw_max, props);
 
diff --git a/drivers/resctrl/mpam_resctrl.c b/drivers/resctrl/mpam_resctrl.c
index 12017264530a..ece46e0d2ab3 100644
--- a/drivers/resctrl/mpam_resctrl.c
+++ b/drivers/resctrl/mpam_resctrl.c
@@ -10,6 +10,7 @@
 #include <linux/errno.h>
 #include <linux/limits.h>
 #include <linux/list.h>
+#include <linux/math.h>
 #include <linux/printk.h>
 #include <linux/rculist.h>
 #include <linux/resctrl.h>
@@ -228,6 +229,56 @@ static bool cache_has_usable_cpor(struct mpam_class *class)
 	return class->props.cpbm_wd <= 32;
 }
 
+/*
+ * Each fixed-point hardware value architecturally represents a range
+ * of values: the full range 0% - 100% is split contiguously into
+ * (1 << cprops->bwa_wd) equal bands.
+ *
+ * Although the bwa_bwd fields have 6 bits the maximum valid value is 16
+ * as it reports the width of fields that are at most 16 bits. When
+ * fewer than 16 bits are valid the least significant bits are
+ * ignored. The implied binary point is kept between bits 15 and 16 and
+ * so the valid bits are leftmost.
+ *
+ * See ARM IHI0099B.a "MPAM system component specification", Section 9.3,
+ * "The fixed-point fractional format" for more information.
+ *
+ * Find the nearest percentage value to the upper bound of the selected band:
+ */
+static u32 mbw_max_to_percent(u16 mbw_max, struct mpam_props *cprops)
+{
+	u32 val = mbw_max;
+
+	val >>= 16 - cprops->bwa_wd;
+	val += 1;
+	val *= MAX_MBA_BW;
+	val = DIV_ROUND_CLOSEST(val, 1 << cprops->bwa_wd);
+
+	return val;
+}
+
+/*
+ * Find the band whose upper bound is closest to the specified percentage.
+ *
+ * A round-to-nearest policy is followed here as a balanced compromise
+ * between unexpected under-commit of the resource (where the total of
+ * a set of resource allocations after conversion is less than the
+ * expected total, due to rounding of the individual converted
+ * percentages) and over-commit (where the total of the converted
+ * allocations is greater than expected).
+ */
+static u16 percent_to_mbw_max(u8 pc, struct mpam_props *cprops)
+{
+	u32 val = pc;
+
+	val <<= cprops->bwa_wd;
+	val = DIV_ROUND_CLOSEST(val, MAX_MBA_BW);
+	val = max(val, 1) - 1;
+	val <<= 16 - cprops->bwa_wd;
+
+	return val;
+}
+
 /* Test whether we can export MPAM_CLASS_CACHE:{2,3}? */
 static void mpam_resctrl_pick_caches(void)
 {
-- 
2.43.0


