Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39506CF45AE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 17:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7T4ay5upo/Q6RyPprmLLqyDflJ4yoaKckEByYdaeRE=; b=O2UvsUUJOYc24pNPcpNpKRNH9C
	+naSQPBkesJgchfjZb5c3kCVG/M4CQZ6iE+lEy0NG0B9+m74HK5CVBcXjC73Gz1R6Ek/MjNNnralV
	0jw5/UWxfZd8EQ3evERaf/4Av/T17MZ8mR0nBebazKJ78Sr4vV8CBxaM83aVa0lmoeYPOauTkftD/
	heaggUCUndCsDd8R+Z1i7g9nv3a+TTt1fe9pdPeH/jw6804/TQYhb2sMiQlsByJ5L0EIkJXsiBSV0
	bxz9BHtA9pUJmXNLk7J8roQsF4CWfY0Y+se/nZ9S9L6GtxRPQB1cNaHoqN5FNzRVb4ZyphRepFdMb
	gbKUcUwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHY-00000005lLn-03Au;
	Mon, 12 Jan 2026 17:00:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfLHV-00000005lJV-0kVj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 17:00:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F152F1596;
	Mon, 12 Jan 2026 09:00:32 -0800 (PST)
Received: from e134344.cambridge.arm.com (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 937993F694;
	Mon, 12 Jan 2026 09:00:34 -0800 (PST)
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
Subject: [PATCH v3 09/47] arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
Date: Mon, 12 Jan 2026 16:58:36 +0000
Message-ID: <20260112165914.4086692-10-ben.horgan@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260112165914.4086692-1-ben.horgan@arm.com>
References: <20260112165914.4086692-1-ben.horgan@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_090041_262276_C7B37C12 
X-CRM114-Status: GOOD (  13.29  )
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

The MPAM system registers will be lost if the CPU is reset during PSCI's
CPU_SUSPEND.

Add a PM notifier to restore them.

mpam_thread_switch(current) can't be used as this won't make any changes if
the in-memory copy says the register already has the correct value. In
reality the system register is UNKNOWN out of reset.

Reviewed-by: Jonathan Cameron <jonathan.cameron@huawei.com>
Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Ben Horgan <ben.horgan@arm.com>
---
 arch/arm64/kernel/mpam.c | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/arch/arm64/kernel/mpam.c b/arch/arm64/kernel/mpam.c
index e6feff2324ac..dbe0a2d05abb 100644
--- a/arch/arm64/kernel/mpam.c
+++ b/arch/arm64/kernel/mpam.c
@@ -4,6 +4,7 @@
 #include <asm/mpam.h>
 
 #include <linux/arm_mpam.h>
+#include <linux/cpu_pm.h>
 #include <linux/jump_label.h>
 #include <linux/percpu.h>
 
@@ -13,12 +14,41 @@ DEFINE_PER_CPU(u64, arm64_mpam_current);
 
 u64 arm64_mpam_global_default;
 
+static int mpam_pm_notifier(struct notifier_block *self,
+			    unsigned long cmd, void *v)
+{
+	u64 regval;
+	int cpu = smp_processor_id();
+
+	switch (cmd) {
+	case CPU_PM_EXIT:
+		/*
+		 * Don't use mpam_thread_switch() as the system register
+		 * value has changed under our feet.
+		 */
+		regval = READ_ONCE(per_cpu(arm64_mpam_current, cpu));
+		write_sysreg_s(regval, SYS_MPAM1_EL1);
+		isb();
+
+		write_sysreg_s(regval, SYS_MPAM0_EL1);
+
+		return NOTIFY_OK;
+	default:
+		return NOTIFY_DONE;
+	}
+}
+
+static struct notifier_block mpam_pm_nb = {
+	.notifier_call = mpam_pm_notifier,
+};
+
 static int __init arm64_mpam_register_cpus(void)
 {
 	u64 mpamidr = read_sanitised_ftr_reg(SYS_MPAMIDR_EL1);
 	u16 partid_max = FIELD_GET(MPAMIDR_EL1_PARTID_MAX, mpamidr);
 	u8 pmg_max = FIELD_GET(MPAMIDR_EL1_PMG_MAX, mpamidr);
 
+	cpu_pm_register_notifier(&mpam_pm_nb);
 	return mpam_register_requestor(partid_max, pmg_max);
 }
 /* Must occur before mpam_msc_driver_init() from subsys_initcall() */
-- 
2.43.0


