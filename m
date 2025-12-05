Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DF0DD374AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 21:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45h/x57Owi8IUkn8qcoQuug5MLGtTUUyJjtaRld0iWE=; b=nG2fLkxnpobExJjjy6twXrB8t9
	yo9ieRoH7a0E4tjszDKZsLmJdr7l4dY2wKZbqwz111HqThoGQGEHUOO0B8lTXxSIlVPH6uXUPCSxJ
	43LXXceCrEDVhEvsADAgK0OK2MTI/tRa+g4sXCdc8+h2Y5QAttaFcmutfEOTMwIUCoUIaF7WQpTwy
	We1kpDJTH4aSQa+q0EFW8ECGc+YIZOG6845X8UfUGzd0mjK+8tpK6XV1iEOHbywlwuKKA5Fp+lZPo
	lz2A0Y0qeNwqNxtbVufvRJbpguXCBBKKkZD2u3b4ZnrkNmdCqi+EptbKpg0Grk3vz3/8Jdt8EEVPl
	4ZNPGVIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdq8-0000000A51U-0Rwn;
	Fri, 05 Dec 2025 21:59:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRdq5-0000000A50e-2ZfB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 21:59:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F147B1A25;
	Fri,  5 Dec 2025 13:59:36 -0800 (PST)
Received: from merodach.members.linode.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 93CEA3F740;
	Fri,  5 Dec 2025 13:59:40 -0800 (PST)
From: James Morse <james.morse@arm.com>
To: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: James Morse <james.morse@arm.com>,
	D Scott Phillips OS <scott@os.amperecomputing.com>,
	carl@os.amperecomputing.com,
	lcherian@marvell.com,
	bobo.shaobowang@huawei.com,
	tan.shaopeng@fujitsu.com,
	baolin.wang@linux.alibaba.com,
	Jamie Iles <quic_jiles@quicinc.com>,
	Xin Hao <xhao@linux.alibaba.com>,
	peternewman@google.com,
	dfustini@baylibre.com,
	amitsinght@marvell.com,
	David Hildenbrand <david@kernel.org>,
	Dave Martin <dave.martin@arm.com>,
	Koba Ko <kobak@nvidia.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	fenghuay@nvidia.com,
	baisheng.gao@unisoc.com,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Gavin Shan <gshan@redhat.com>,
	Ben Horgan <ben.horgan@arm.com>,
	rohit.mathew@arm.com,
	reinette.chatre@intel.com,
	Punit Agrawal <punit.agrawal@oss.qualcomm.com>
Subject: [RFC PATCH 04/38] arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
Date: Fri,  5 Dec 2025 21:58:27 +0000
Message-Id: <20251205215901.17772-5-james.morse@arm.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20251205215901.17772-1-james.morse@arm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251205_135945_790772_63500D85 
X-CRM114-Status: GOOD (  12.92  )
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

The MPAM system registers will be lost if the CPU is reset during
PSCI's CPU_SUSPEND.

Add a PM notifier to restore them.

mpam_thread_switch(current) can't be used as this won't make any
changes if the in-memory copy says the register already has the
correct value. In reality the system register is UNKNOWN out of reset.

Signed-off-by: James Morse <james.morse@arm.com>
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
2.39.5


