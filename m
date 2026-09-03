Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6905C61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8rNOQjVW9B7UE3k2110qULAmhJnJclVzdTqOCKzRpKQ=; b=uJ30PKoSvkIARXCRG5EZvXlPmm
	NZB5UGE6yFZBE3Fy1K231JZr1aZDcliwTBdJm4XXydgFady9u5vqCGcGQi8Lof5Q8dZfrWIbngaI4
	7ZBAkT0hTnJPcKlfVCDSkjCW1p52JH5Kmwnmz59lvP5sB0rq6WDhGxXObGTlD7x4qUXENdLp+8RRV
	h7UaYR4TXjvnZRDOmmzdaRHGL1Uc7oAAgPLsum7M7K1UmIfiMj7p/z/8Msd6xkTZLAS0qtEmOTS6X
	bKOqJ1fMJLKvWMrU188zlQlAdMw6Q48eiN5xXI9P5jrLuiGJC48azNtHal8bz1FeFKTM/x5qEcV57
	+FI54vaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29yC-000000005us-09z1;
	Thu, 03 Sep 2026 16:07:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x29y9-000000005q0-3DAe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 16:07:19 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7F9BE1D34;
	Thu,  3 Sep 2026 09:07:13 -0700 (PDT)
Received: from e140010.cambridge.arm.com (e140010.arm.com [10.2.213.25])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 788183F673;
	Thu,  3 Sep 2026 09:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788451637; bh=vC2GmX5lShpPOLIG9D+l2W7lA1Il59WbD1YRpxDaZSY=;
	h=From:To:Subject:Date:In-Reply-To:References:From;
	b=GyTBAtlH3l9LjIY3HWGWEiq/Y4rK06FIhVDmI2yqfHZNfgzKVgJTiKhUuKAEaPns3
	 xdhvntpAObpDP3xz2TKYRqKp6Fczyz5B0tuA7u4VlIMcR8RKTgwVsEQwQv7oCcfo14
	 hDju8vdzK6yT48afW/97/LbOdf5A3liTY4MjEKt4=
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: maz@kernel.org,
	oupton@kernel.org,
	fuad.tabba@linux.dev,
	joey.gouly@arm.com,
	seiden@linux.ibm.com,
	suzuki.poulose@arm.com,
	yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	will@kernel.org,
	mark.rutland@arm.com,
	linux-perf-users@vger.kernel.org,
	catalin.marinas@arm.com,
	james.clark@linaro.org
Subject: [RFC PATCH v7 20/28] KVM: arm64: Allow guest SPE physical timestamps only if kernel allows it
Date: Thu,  3 Sep 2026 17:06:15 +0100
Message-ID: <20260903160623.315525-21-alexandru.elisei@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903160623.315525-1-alexandru.elisei@arm.com>
References: <20260903160623.315525-1-alexandru.elisei@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260903_090717_890494_AF0C7649 
X-CRM114-Status: GOOD (  14.49  )
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

The SPE driver allows userspace to use physical timestamps for records only
if the kernel allows it, do the same for a virtual machine.

Signed-off-by: Alexandru Elisei <alexandru.elisei@arm.com>
---
 arch/arm64/include/asm/kvm_spe.h | 1 +
 arch/arm64/kvm/hyp/vhe/spe-sr.c  | 5 +++--
 arch/arm64/kvm/spe.c             | 8 ++++++++
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_spe.h b/arch/arm64/include/asm/kvm_spe.h
index ad0ad6ace93c..8a55ea0de4e5 100644
--- a/arch/arm64/include/asm/kvm_spe.h
+++ b/arch/arm64/include/asm/kvm_spe.h
@@ -15,6 +15,7 @@ struct arm_spe_pmu;
 struct kvm_spe {
 	struct arm_spe_pmu *spe_pmu;
 	u64 pmblimitr_el1_res0_mask;
+	u64 guest_pmscr_el2;
 };
 
 struct kvm_vcpu_spe {
diff --git a/arch/arm64/kvm/hyp/vhe/spe-sr.c b/arch/arm64/kvm/hyp/vhe/spe-sr.c
index 978620ad99fa..3c32a1338cc8 100644
--- a/arch/arm64/kvm/hyp/vhe/spe-sr.c
+++ b/arch/arm64/kvm/hyp/vhe/spe-sr.c
@@ -107,6 +107,7 @@ static bool __kvm_spe_profiling_buffer_enabled(u64 pmblimitr, u64 pmbsr)
  */
 void __kvm_spe_restore_guest_state_vhe(struct kvm_vcpu *vcpu, struct kvm_cpu_context *guest_ctxt)
 {
+	struct kvm *kvm = vcpu->kvm;
 	u64 pmblimitr, pmbsr;
 
 	pmbsr = ctxt_sys_reg(guest_ctxt, PMBSR_EL1);
@@ -120,10 +121,10 @@ void __kvm_spe_restore_guest_state_vhe(struct kvm_vcpu *vcpu, struct kvm_cpu_con
 		write_sysreg_s(pmbsr, SYS_PMBSR_EL1);
 	}
 
-	__kvm_spe_restore_sampling_regs(vcpu->kvm, guest_ctxt);
+	__kvm_spe_restore_sampling_regs(kvm, guest_ctxt);
 
 	write_sysreg_el1(ctxt_sys_reg(guest_ctxt, PMSCR_EL1), SYS_PMSCR);
-	write_sysreg_el2(0, SYS_PMSCR);
+	write_sysreg_el2(kvm->arch.kvm_spe.guest_pmscr_el2, SYS_PMSCR);
 }
 NOKPROBE_SYMBOL(__kvm_spe_restore_guest_state_vhe);
 
diff --git a/arch/arm64/kvm/spe.c b/arch/arm64/kvm/spe.c
index af1e19cb8e9a..68b751bdb384 100644
--- a/arch/arm64/kvm/spe.c
+++ b/arch/arm64/kvm/spe.c
@@ -3,9 +3,11 @@
  * Copyright (C) 2021 - ARM Ltd
  */
 
+#include <linux/capability.h>
 #include <linux/cpumask.h>
 #include <linux/kvm_host.h>
 #include <linux/perf/arm_spe_pmu.h>
+#include <linux/perf_event.h>
 
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_spe.h>
@@ -97,6 +99,12 @@ int kvm_spe_vcpu_first_run_init(struct kvm_vcpu *vcpu)
 	if (!kvm_spe->pmblimitr_el1_res0_mask)
 		kvm_spe_compute_pmblimitr_el1_res0_mask(kvm);
 
+	if (kvm_vm_has_ran_once(kvm))
+		return 0;
+
+	if (perf_allow_kernel())
+		kvm_spe->guest_pmscr_el2 = PMSCR_EL2_PCT_PHYS;
+
 	return 0;
 }
 
-- 
2.43.0


