Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7126DE8B362
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 21:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gwZP8Nam2t0AM5oJbfFBemxgjHH9k/Xcll32ijLdd/g=; b=o1eP9VE4ThL4fYAZdLIIn84G5q
	DQGq/j61yLYf6Fz6IL9J0CvvqxF1hOxSSE4wM70DAtKOxdv2aEU/y1soUClSpCYRaDKmDATRV3VID
	OjBWVJmp+qHi0WK/v5F966oTzCXuipp8NL7rr2k05moYXxjudnMG6V2SsUw+ik65P7i63sBlxUCxq
	R7hvjx8lKuox/JwFZ0TGjL40bmYBwfKXQv8zI2iK/gE6eTyigF7AipIMiTU610IiGYw/m/SsXeHpL
	C9VhDy5miowFBJxdLTW/ocvSfg2/FiWU1P006U3zyycX0U7kmdpyow6bCzSkceozGonSnqJON6E8Z
	3V4JjXhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOCj-00000007Ohe-3WfD;
	Tue, 03 Feb 2026 21:45:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnOCg-00000007Oei-3zuU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 21:45:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F0D98497;
	Tue,  3 Feb 2026 13:44:51 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A31B73F778;
	Tue,  3 Feb 2026 13:44:52 -0800 (PST)
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
	Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	Dave Martin <Dave.Martin@arm.com>
Subject: [PATCH v4 10/41] arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG values
Date: Tue,  3 Feb 2026 21:43:11 +0000
Message-ID: <20260203214342.584712-11-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260203214342.584712-1-ben.horgan@arm.com>
References: <20260203214342.584712-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_134459_144960_00A51A17 
X-CRM114-Status: GOOD (  12.24  )
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

From: James Morse <james.morse@arm.com>

Care must be taken when modifying the PARTID and PMG of a task in any
per-task structure as writing these values may race with the task being
scheduled in, and reading the modified values.

Add helpers to set the task properties, and the CPU default value.  These
use WRITE_ONCE() that pairs with the READ_ONCE() in mpam_get_regval() to
avoid causing torn values.

Tested-by: Gavin Shan <gshan@redhat.com>
Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
Tested-by: Peter Newman <peternewman@google.com>
CC: Dave Martin <Dave.Martin@arm.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
Keep comment attached to mpam_get_regval()
Add internal helper, __mpam_regval() (Jonathan)

Changes since v3:
Remove extra CONFIG_ARM64_MPAM guarding
Extend CONFIG_ARM64_MPAM guarding
---
 arch/arm64/include/asm/mpam.h | 28 +++++++++++++++++++++++++++-
 1 file changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
index 6bccbfdccb87..05aa71200f61 100644
--- a/arch/arm64/include/asm/mpam.h
+++ b/arch/arm64/include/asm/mpam.h
@@ -4,6 +4,7 @@
 #ifndef __ASM__MPAM_H
 #define __ASM__MPAM_H
 
+#include <linux/bitfield.h>
 #include <linux/jump_label.h>
 #include <linux/percpu.h>
 #include <linux/sched.h>
@@ -22,6 +23,23 @@ DECLARE_PER_CPU(u64, arm64_mpam_current);
  */
 extern u64 arm64_mpam_global_default;
 
+#ifdef CONFIG_ARM64_MPAM
+static inline u64 __mpam_regval(u16 partid_d, u16 partid_i, u8 pmg_d, u8 pmg_i)
+{
+	return FIELD_PREP(MPAM0_EL1_PARTID_D, partid_d) |
+	       FIELD_PREP(MPAM0_EL1_PARTID_I, partid_i) |
+	       FIELD_PREP(MPAM0_EL1_PMG_D, pmg_d) |
+	       FIELD_PREP(MPAM0_EL1_PMG_I, pmg_i);
+}
+
+static inline void mpam_set_cpu_defaults(int cpu, u16 partid_d, u16 partid_i,
+					 u8 pmg_d, u8 pmg_i)
+{
+	u64 default_val = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
+
+	WRITE_ONCE(per_cpu(arm64_mpam_default, cpu), default_val);
+}
+
 /*
  * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
  * which may race with reads in mpam_thread_switch(). Ensure only one of the old
@@ -30,12 +48,20 @@ extern u64 arm64_mpam_global_default;
  * value to be stored with cache allocations, despite being considered 'free' by
  * resctrl.
  */
-#ifdef CONFIG_ARM64_MPAM
 static inline u64 mpam_get_regval(struct task_struct *tsk)
 {
 	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
 }
 
+static inline void mpam_set_task_partid_pmg(struct task_struct *tsk,
+					    u16 partid_d, u16 partid_i,
+					    u8 pmg_d, u8 pmg_i)
+{
+	u64 regval = __mpam_regval(partid_d, partid_i, pmg_d, pmg_i);
+
+	WRITE_ONCE(task_thread_info(tsk)->mpam_partid_pmg, regval);
+}
+
 static inline void mpam_thread_switch(struct task_struct *tsk)
 {
 	u64 oldregval;
-- 
2.43.0


