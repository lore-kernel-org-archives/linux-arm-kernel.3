Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82966CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 19:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CEV8mTgiEkV3pKTwbj9JmWq0S+SCs1B/j92LF4+Bo+k=; b=dp9Ze8ZJ9ynQkpec2wwFC54lST
	G/SS9mir6rioPft8/5DIxWVINbETRpWhLb1lQzOr6Lu+wnKmh9K2v6ivz8D1Xh98Y1K3zSu18ZL96
	TbX8CLa6zK+gE9b20Jq+m3yxF7vdQ1LcwbMUFt7fLPfPtoV4UmhGdLCK7gIid2o45DbH0wnodvHs7
	+YZUR+yUPVjfO0qCUi7Rw8Z+eRqoTuzsf3v1Y7SOIRwLC27GrK0OVVfXGQCaYFeYHf8oIzwTfj9Ig
	k+xAEbwpmXpo9U3NaM2p80VVafgmV4Y2h7E65Q+JKPm/1rIgbHN/H/LvjS062s8H4YiItCW79qjsj
	hYxUpeRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8Ui-0000000BjMa-1GWL;
	Mon, 01 Jun 2026 19:40:16 +0000
Received: from pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com ([52.26.1.71])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU8Ug-0000000BjMD-05YX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 19:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1780342814; x=1811878814;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=CEV8mTgiEkV3pKTwbj9JmWq0S+SCs1B/j92LF4+Bo+k=;
  b=GKQN5z+WnDepuSNBQoo1sqjsXqnRk4KGFm/EnHKPIY3+CiCYWp+I1Oo9
   n39WiXEoLahejIwHEZ49kPfgYzDW3Iy53jjgT5VMoFHc27mjh8fRSExcg
   YQIStbuaQYRrHj2Z75RV2gIjHmhOurzUzWEJx0ttHnfb088oyS1l+1PsK
   ilwhkhA+OsMBk9rdpGWPy5xRIgXQy4S6ZRiiw5qlG4/KnFsFjYZju+9UR
   6Mwnd4B8WRZcaIyQ3F7B4T9K2/0IesOks/6rL/CyU8f81hU/Ps6elnu5V
   ztd1VkRJ+6GyNBdROBq/+Le2F2E8iAGgKZH5mAtOfJr5uvznitIc4aSAq
   g==;
X-CSE-ConnectionGUID: Uok1d9SkSIedDsFn8SIMMw==
X-CSE-MsgGUID: k/bi1f2+SuyGnTpK0Rc8eQ==
X-IronPort-AV: E=Sophos;i="6.24,181,1774310400"; 
   d="scan'208";a="20896261"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-006.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2026 19:40:09 +0000
Received: from EX19MTAUWA001.ant.amazon.com [205.251.233.236:12267]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.19.88:2525] with esmtp (Farcaster)
 id 80c07004-3a76-4dfb-b7ae-c4c08f0e1e85; Mon, 1 Jun 2026 19:40:09 +0000 (UTC)
X-Farcaster-Flow-ID: 80c07004-3a76-4dfb-b7ae-c4c08f0e1e85
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWA001.ant.amazon.com (10.250.64.204) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37;
 Mon, 1 Jun 2026 19:40:08 +0000
Received: from dev-dsk-congkai-2a-df9e8fab.us-west-2.amazon.com
 (172.23.251.204) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.37; Mon, 1 Jun 2026
 19:40:07 +0000
From: Congkai Tan <congkai@amazon.com>
To: <kvmarm@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
CC: Congkai Tan <congkai@amazon.com>, Marc Zyngier <maz@kernel.org>, "Oliver
 Upton" <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose
	<suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas
	<catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Mark Rutland
	<mark.rutland@arm.com>, Haris Okanovic <harisokn@amazon.com>, Geoff Blake
	<blakgeof@amazon.com>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] KVM: arm64: Expose PMMIR_EL1.SLOTS to guests
Date: Mon, 1 Jun 2026 19:39:54 +0000
Message-ID: <20260601193954.2103455-1-congkai@amazon.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [172.23.251.204]
X-ClientProxiedBy: EX19D035UWA003.ant.amazon.com (10.13.139.86) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_124014_119579_B47D4212 
X-CRM114-Status: GOOD (  17.93  )
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

Commit 46081078feb4 ("KVM: arm64: Upgrade PMU support to ARMv8.4")
trapped PMMIR_EL1 as RAZ/WI and masked STALL_SLOT* from PMCEID1 to
discourage guests from relying on a register they could not read.

Forward the SLOTS field of PMMIR_EL1 so that the perf userspace tool
can read the correct value from
/sys/bus/event_source/devices/armv8_pmuv3_0/caps/slots. Today, perf
stat fails with message "Failure to read '#slots'" because it can
only read 0x0 from the sysfs location, causing the parsing failure
of the default metrics.

Fix this by:
1. Adding an access_pmmir() handler that reads arm_pmu->reg_pmmir
   and returns a masked value containing only the SLOTS field [7:0]
   to the guest. Other PMMIR_EL1 fields are kept as RAZ to limit
   the extra information that this change exposes; individual
   fields can be unmasked as KVM gains support for each feature.
2. Removing the STALL_SLOT, STALL_SLOT_FRONTEND and STALL_SLOT_BACKEND
   mask in PMCEID1. The mask existed to hide these events under the
   sysfs events/ directory when PMMIR_EL1 was RAZ; with SLOTS now
   readable they should be correctly exposed.

Tested on Graviton 2 (Neoverse N1, pre-PMUv3p4), Graviton 3
(Neoverse V1) and Graviton 4 (Neoverse V2) metal hosts with QEMU:
caps/slots reads 0x00000008 in guests on Graviton 3/4 and 0x00000000
on Graviton 2 (correct for pre-PMUv3p4). perf stat correctly
evaluates the default metrics.

Fixes: 46081078feb4 ("KVM: arm64: Upgrade PMU support to ARMv8.4")
Cc: stable@vger.kernel.org
Signed-off-by: Congkai Tan <congkai@amazon.com>
Reviewed-by: Haris Okanovic <harisokn@amazon.com>
Reviewed-by: Geoff Blake <blakgeof@amazon.com>
---
 arch/arm64/kvm/pmu-emul.c | 11 +----------
 arch/arm64/kvm/sys_regs.c | 26 ++++++++++++++++++++++++--
 2 files changed, 25 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
index e1860acae641..bafd5a258927 100644
--- a/arch/arm64/kvm/pmu-emul.c
+++ b/arch/arm64/kvm/pmu-emul.c
@@ -864,16 +864,7 @@ static u64 compute_pmceid0(struct arm_pmu *pmu)
 
 static u64 compute_pmceid1(struct arm_pmu *pmu)
 {
-	u64 val = __compute_pmceid(pmu, 1);
-
-	/*
-	 * Don't advertise STALL_SLOT*, as PMMIR_EL0 is handled
-	 * as RAZ
-	 */
-	val &= ~(BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT - 32) |
-		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_FRONTEND - 32) |
-		 BIT_ULL(ARMV8_PMUV3_PERFCTR_STALL_SLOT_BACKEND - 32));
-	return val;
+	return __compute_pmceid(pmu, 1);
 }
 
 u64 kvm_pmu_get_pmceid(struct kvm_vcpu *vcpu, bool pmceid1)
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index 148fc3400ea8..7da7566dfd9f 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -18,6 +18,7 @@
 #include <linux/printk.h>
 #include <linux/uaccess.h>
 #include <linux/irqchip/arm-gic-v3.h>
+#include <linux/perf/arm_pmu.h>
 
 #include <asm/arm_pmuv3.h>
 #include <asm/cacheflush.h>
@@ -1370,6 +1371,27 @@ static bool access_pminten(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 	return true;
 }
 
+/*
+ * Expose only PMMIR_EL1.SLOTS to the guest, which is consumed by perf in its
+ * topdown default metric group. Other PMMIR_EL1 fields remain RAZ. Future
+ * patches can extend the exposed mask incrementally as KVM gains support for
+ * those features.
+ */
+static bool access_pmmir(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
+			 const struct sys_reg_desc *r)
+{
+	struct arm_pmu *cpu_pmu = vcpu->kvm->arch.arm_pmu;
+
+	if (p->is_write)
+		return write_to_read_only(vcpu, p, r);
+
+	if (check_pmu_access_disabled(vcpu, 0))
+		return false;
+
+	p->regval = cpu_pmu->reg_pmmir & ARMV8_PMU_SLOTS;
+	return true;
+}
+
 static bool access_pmovs(struct kvm_vcpu *vcpu, struct sys_reg_params *p,
 			 const struct sys_reg_desc *r)
 {
@@ -3456,7 +3478,7 @@ static const struct sys_reg_desc sys_reg_descs[] = {
 	{ PMU_SYS_REG(PMINTENCLR_EL1),
 	  .access = access_pminten, .reg = PMINTENSET_EL1,
 	  .get_user = get_pmreg, .set_user = set_pmreg },
-	{ SYS_DESC(SYS_PMMIR_EL1), trap_raz_wi },
+	{ PMU_SYS_REG(PMMIR_EL1), .access = access_pmmir, .reset = NULL },
 
 	{ SYS_DESC(SYS_MAIR_EL1), access_vm_reg, reset_unknown, MAIR_EL1 },
 	{ SYS_DESC(SYS_PIRE0_EL1), NULL, reset_unknown, PIRE0_EL1,
@@ -4600,7 +4622,7 @@ static const struct sys_reg_desc cp15_regs[] = {
 	{ CP15_PMU_SYS_REG(HI,     0, 9, 14, 4), .access = access_pmceid },
 	{ CP15_PMU_SYS_REG(HI,     0, 9, 14, 5), .access = access_pmceid },
 	/* PMMIR */
-	{ CP15_PMU_SYS_REG(DIRECT, 0, 9, 14, 6), .access = trap_raz_wi },
+	{ CP15_PMU_SYS_REG(DIRECT, 0, 9, 14, 6), .access = access_pmmir },
 
 	/* PRRR/MAIR0 */
 	{ AA32(LO), Op1( 0), CRn(10), CRm( 2), Op2( 0), access_vm_reg, NULL, MAIR_EL1 },

base-commit: 1702da76e017ae0fbe1a92b07bc332972c293e89
-- 
2.50.1


