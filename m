Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 597E6CF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:00:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CSgsFuf0ktLYiGgBmaxqAOaZ6TxhqYeXN7q2LRTC0MU=; b=vgbG+6UCT2dHyA3tvz5bK46eGD
	P4ttaTHQjQIikR+drozif6CgPSdaL1sSKzqw8w5hwD/npwm46HHQvDI956LLcaqm479mFMXDr7tWK
	H/D9BBmqeB11G5WZ1cduHsgOOsBuzmWlf6gPxEmrUirywFdmUquZWctpBBa4/55EbxzFBBEa2l8nS
	6VWLZAQOh2i1Ydd5VKv5kwSuPC/dmlwD+ZEfjTKfhd6P0prVYzS7TUJE7P++Yu2gUv+a/AotKW7MC
	8EOfyb/N6EwGDuhXdxZP140Xplf4CyBDbKfNPPqvSbcYG+O9f0QjCQZ9cayxrZRl96UdgSKSwo3IO
	dMoHq2vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHG-00000005l9P-3112;
	Mon, 12 Jan 2026 17:00:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHD-00000005l6y-3yBG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:00:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9BF82153B;
	Mon, 12 Jan 2026 09:00:16 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 417813F694;
	Mon, 12 Jan 2026 09:00:18 -0800 (PST)
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
	kvmarm@lists.linux.dev
Subject: [PATCH v3 06/47] arm64: mpam: Context switch the MPAM registers
Date: Mon, 12 Jan 2026 16:58:33 +0000
Message-ID: <20260112165914.4086692-7-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090024_067929_9F0C3325 
X-CRM114-Status: GOOD (  34.84  )
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

MPAM allows traffic in the SoC to be labeled by the OS, these labels are
used to apply policy in caches and bandwidth regulators, and to monitor
traffic in the SoC. The label is made up of a PARTID and PMG value. The x86
equivalent calls these CLOSID and RMID, but they don't map precisely.

MPAM has two CPU system registers that is used to hold the PARTID and PMG
values that traffic generated at each exception level will use. These can
be set per-task by the resctrl file system. (resctrl is the defacto
interface for controlling this stuff).

Add a helper to switch this.

struct task_struct's separate CLOSID and RMID fields are insufficient to
implement resctrl using MPAM, as resctrl can change the PARTID (CLOSID) and
PMG (sort of like the RMID) separately. On x86, the rmid is an independent
number, so a race that writes a mismatched closid and rmid into hardware is
benign. On arm64, the pmg bits extend the partid.
(i.e. partid-5 has a pmg-0 that is not the same as partid-6's pmg-0).  In
this case, mismatching the values will 'dirty' a pmg value that resctrl
believes is clean, and is not tracking with its 'limbo' code.

To avoid this, the partid and pmg are always read and written as a
pair. This requires a new u64 field. In struct task_struct there are two
u32, rmid and closid for the x86 case, but as we can't use them here do
something else. Add this new field, mpam_partid_pmg, to struct thread_info
to avoid adding more architecture specific code to struct task_struct.
Always use READ_ONCE()/WRITE_ONCE() when accessing this field.

Resctrl allows a per-cpu 'default' value to be set, this overrides the
values when scheduling a task in the default control-group, which has
PARTID 0. The way 'code data prioritisation' gets emulated means the
register value for the default group needs to be a variable.

The current system register value is kept in a per-cpu variable to avoid
writing to the system register if the value isn't going to change.  Writes
to this register may reset the hardware state for regulating bandwidth.

Finally, there is no reason to context switch these registers unless there
is a driver changing the values in struct task_struct. Hide the whole thing
behind a static key. This also allows the driver to disable MPAM in
response to errors reported by hardware. Move the existing static key to
belong to the arch code, as in the future the MPAM driver may become a
loadable module.

All this should depend on whether there is an MPAM driver, hide it behind
CONFIG_ARM64_MPAM.

CC: Amit Singh Tomar <amitsinght@marvell.com>
Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
Changes since rfc:
CONFIG_MPAM -> CONFIG_ARM64_MPAM in commit message
Remove extra DECLARE_STATIC_KEY_FALSE
Function name in comment, __mpam_sched_in() -> mpam_thread_switch()
Remove unused headers
Expand comment (Jonathan)

Changes since v2:
Tidy up ifdefs
---
 arch/arm64/Kconfig                   |  2 +
 arch/arm64/include/asm/mpam.h        | 67 ++++++++++++++++++++++++++++
 arch/arm64/include/asm/thread_info.h |  3 ++
 arch/arm64/kernel/Makefile           |  1 +
 arch/arm64/kernel/mpam.c             | 13 ++++++
 arch/arm64/kernel/process.c          |  7 +++
 drivers/resctrl/mpam_devices.c       |  2 -
 drivers/resctrl/mpam_internal.h      |  4 +-
 8 files changed, 95 insertions(+), 4 deletions(-)
 create mode 100644 arch/arm64/include/asm/mpam.h
 create mode 100644 arch/arm64/kernel/mpam.c

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 93173f0a09c7..cdcc5b76a110 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -2049,6 +2049,8 @@ config ARM64_MPAM
 
 	  MPAM is exposed to user-space via the resctrl pseudo filesystem.
 
+	  This option enables the extra context switch code.
+
 endmenu # "ARMv8.4 architectural features"
 
 menu "ARMv8.5 architectural features"
diff --git a/arch/arm64/include/asm/mpam.h b/arch/arm64/include/asm/mpam.h
new file mode 100644
index 000000000000..14011e5970ce
--- /dev/null
+++ b/arch/arm64/include/asm/mpam.h
@@ -0,0 +1,67 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2025 Arm Ltd. */
+
+#ifndef __ASM__MPAM_H
+#define __ASM__MPAM_H
+
+#include <linux/jump_label.h>
+#include <linux/percpu.h>
+#include <linux/sched.h>
+
+#include <asm/sysreg.h>
+
+DECLARE_STATIC_KEY_FALSE(mpam_enabled);
+DECLARE_PER_CPU(u64, arm64_mpam_default);
+DECLARE_PER_CPU(u64, arm64_mpam_current);
+
+/*
+ * The value of the MPAM0_EL1 sysreg when a task is in resctrl's default group.
+ * This is used by the context switch code to use the resctrl CPU property
+ * instead. The value is modified when CDP is enabled/disabled by mounting
+ * the resctrl filesystem.
+ */
+extern u64 arm64_mpam_global_default;
+
+/*
+ * The resctrl filesystem writes to the partid/pmg values for threads and CPUs,
+ * which may race with reads in mpam_thread_switch(). Ensure only one of the old
+ * or new values are used. Particular care should be taken with the pmg field as
+ * mpam_thread_switch() may read a partid and pmg that don't match, causing this
+ * value to be stored with cache allocations, despite being considered 'free' by
+ * resctrl.
+ */
+#ifdef CONFIG_ARM64_MPAM
+static inline u64 mpam_get_regval(struct task_struct *tsk)
+{
+	return READ_ONCE(task_thread_info(tsk)->mpam_partid_pmg);
+}
+
+static inline void mpam_thread_switch(struct task_struct *tsk)
+{
+	u64 oldregval;
+	int cpu = smp_processor_id();
+	u64 regval = mpam_get_regval(tsk);
+
+	if (!static_branch_likely(&mpam_enabled))
+		return;
+
+	if (regval == READ_ONCE(arm64_mpam_global_default))
+		regval = READ_ONCE(per_cpu(arm64_mpam_default, cpu));
+
+	oldregval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
+	if (oldregval == regval)
+		return;
+
+	write_sysreg_s(regval, SYS_MPAM1_EL1);
+	isb();
+
+	/* Synchronising the EL0 write is left until the ERET to EL0 */
+	write_sysreg_s(regval, SYS_MPAM0_EL1);
+
+	WRITE_ONCE(per_cpu(arm64_mpam_current, cpu), regval);
+}
+#else
+static inline void mpam_thread_switch(struct task_struct *tsk) {}
+#endif /* CONFIG_ARM64_MPAM */
+
+#endif /* __ASM__MPAM_H */
diff --git a/arch/arm64/include/asm/thread_info.h b/arch/arm64/include/asm/thread_info.h
index a803b887b0b4..fc801a26ff9e 100644
--- a/arch/arm64/include/asm/thread_info.h
+++ b/arch/arm64/include/asm/thread_info.h
@@ -41,6 +41,9 @@ struct thread_info {
 #ifdef CONFIG_SHADOW_CALL_STACK
 	void			*scs_base;
 	void			*scs_sp;
+#endif
+#ifdef CONFIG_ARM64_MPAM
+	u64			mpam_partid_pmg;
 #endif
 	u32			cpu;
 };
diff --git a/arch/arm64/kernel/Makefile b/arch/arm64/kernel/Makefile
index 76f32e424065..15979f366519 100644
--- a/arch/arm64/kernel/Makefile
+++ b/arch/arm64/kernel/Makefile
@@ -67,6 +67,7 @@ obj-$(CONFIG_CRASH_DUMP)		+= crash_dump.o
 obj-$(CONFIG_VMCORE_INFO)		+= vmcore_info.o
 obj-$(CONFIG_ARM_SDE_INTERFACE)		+= sdei.o
 obj-$(CONFIG_ARM64_PTR_AUTH)		+= pointer_auth.o
+obj-$(CONFIG_ARM64_MPAM)		+= mpam.o
 obj-$(CONFIG_ARM64_MTE)			+= mte.o
 obj-y					+= vdso-wrap.o
 obj-$(CONFIG_COMPAT_VDSO)		+= vdso32-wrap.o
diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
new file mode 100644
index 000000000000..9866d2ca0faa
--- /dev/null
+++ b/arch/arm64/kernel/mpam.c
@@ -0,0 +1,13 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (C) 2025 Arm Ltd. */
+
+#include <asm/mpam.h>
+
+#include <linux/jump_label.h>
+#include <linux/percpu.h>
+
+DEFINE_STATIC_KEY_FALSE(mpam_enabled);
+DEFINE_PER_CPU(u64, arm64_mpam_default);
+DEFINE_PER_CPU(u64, arm64_mpam_current);
+
+u64 arm64_mpam_global_default;
diff --git a/arch/arm64/kernel/process.c b/arch/arm64/kernel/process.c
index 489554931231..47698955fa1e 100644
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -51,6 +51,7 @@
 #include <asm/fpsimd.h>
 #include <asm/gcs.h>
 #include <asm/mmu_context.h>
+#include <asm/mpam.h>
 #include <asm/mte.h>
 #include <asm/processor.h>
 #include <asm/pointer_auth.h>
@@ -738,6 +739,12 @@ struct task_struct *__switch_to(struct task_struct *prev,
 	if (prev->thread.sctlr_user != next->thread.sctlr_user)
 		update_sctlr_el1(next->thread.sctlr_user);
 
+	/*
+	 * MPAM thread switch happens after the DSB to ensure prev's accesses
+	 * use prev's MPAM settings.
+	 */
+	mpam_thread_switch(next);
+
 	/* the actual thread switch */
 	last = cpu_switch_to(prev, next);
 
diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index b495d5291868..860181266b15 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -29,8 +29,6 @@
 
 #include "mpam_internal.h"
 
-DEFINE_STATIC_KEY_FALSE(mpam_enabled); /* This moves to arch code */
-
 /*
  * mpam_list_lock protects the SRCU lists when writing. Once the
  * mpam_enabled key is enabled these lists are read-only,
diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index e8971842b124..4632985bcca6 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -16,12 +16,12 @@
 #include <linux/srcu.h>
 #include <linux/types.h>
 
+#include <asm/mpam.h>
+
 #define MPAM_MSC_MAX_NUM_RIS	16
 
 struct platform_device;
 
-DECLARE_STATIC_KEY_FALSE(mpam_enabled);
-
 #ifdef CONFIG_MPAM_KUNIT_TEST
 #define PACKED_FOR_KUNIT __packed
 #else
-- 
2.43.0


