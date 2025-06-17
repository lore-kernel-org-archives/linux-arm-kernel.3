Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D12A8C71136
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Jun 2025 13:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tpUfbCrp7wDOWBLlHxyY1WwXFYXOAbUEgNvoM+mp4zM=; b=eesWtvaRMHjHYZsFEVLye53J11
	fI3YsJBIGYg/3vt+yi9VXsy9aQJetxV0QGCjl1QirUQzIrVAVMv6v/ewHxJqga9y+d6HgCphgLsxl
	VLwzep1+mPhysCWl+e+ItAIFuB2quhnmewzResn16ljAK4bmjmb9Gk8kR/YZ4Jz20/elk0phSFSsb
	e5VVBMeKiYnB7xC1+VF1RpBIZbxVvB+f3CnbF6HPr9e2KDGNIO9ftj5LzK8qUG5hAo/xH1OxCFnSf
	fOjSAxFhYvODjNOS9ZvID4cE8+xuIZrDLCr6iArD1Jc3w+7K0oEND795whAr3saK8FzLrBMSlx5oG
	PeXIeuvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWiN-00000007QYu-1IOF;
	Tue, 17 Jun 2025 13:51:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRWVM-00000007NvO-3zVw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Jun 2025 13:37:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B46C91595;
	Tue, 17 Jun 2025 06:37:13 -0700 (PDT)
Received: from lakrids.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 06E343F673;
	Tue, 17 Jun 2025 06:37:32 -0700 (PDT)
From: Mark Rutland <mark.rutland@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: broonie@kernel.org,
	catalin.marinas@arm.com,
	kvmarm@lists.linux.dev,
	mark.rutland@arm.com,
	maz@kernel.org,
	oliver.upton@linux.dev,
	stable@vger.kernel.org,
	tabba@google.com,
	will@kernel.org
Subject: [PATCH 2/7] KVM: arm64: VHE: Synchronize CPTR trap deactivation
Date: Tue, 17 Jun 2025 14:37:13 +0100
Message-Id: <20250617133718.4014181-3-mark.rutland@arm.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20250617133718.4014181-1-mark.rutland@arm.com>
References: <20250617133718.4014181-1-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_063737_117426_A6FD6410 
X-CRM114-Status: GOOD (  10.83  )
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

Currently there is no ISB between __deactivate_cptr_traps() disabling
traps that affect EL2 and fpsimd_lazy_switch_to_host() manipulating
registers potentially affected by CPTR traps.

When NV is not in use, this is safe because the relevant registers are
only accessed when guest_owns_fp_regs() && vcpu_has_sve(vcpu), and this
also implies that SVE traps affecting EL2 have been deactivated prior to
__guest_entry().

When NV is in use, a guest hypervisor may have configured SVE traps for
a nested context, and so it is necessary to have an ISB between
__deactivate_cptr_traps() and fpsimd_lazy_switch_to_host().

Due to the current lack of an ISB, when a guest hypervisor enables SVE
traps in CPTR, the host can take an unexpected SVE trap from within
fpsimd_lazy_switch_to_host(), e.g.

| Unhandled 64-bit el1h sync exception on CPU1, ESR 0x0000000066000000 -- SVE
| CPU: 1 UID: 0 PID: 164 Comm: kvm-vcpu-0 Not tainted 6.15.0-rc4-00138-ga05e0f012c05 #3 PREEMPT
| Hardware name: FVP Base RevC (DT)
| pstate: 604023c9 (nZCv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
| pc : __kvm_vcpu_run+0x6f4/0x844
| lr : __kvm_vcpu_run+0x150/0x844
| sp : ffff800083903a60
| x29: ffff800083903a90 x28: ffff000801f4a300 x27: 0000000000000000
| x26: 0000000000000000 x25: ffff000801f90000 x24: ffff000801f900f0
| x23: ffff800081ff7720 x22: 0002433c807d623f x21: ffff000801f90000
| x20: ffff00087f730730 x19: 0000000000000000 x18: 0000000000000000
| x17: 0000000000000000 x16: 0000000000000000 x15: 0000000000000000
| x14: 0000000000000000 x13: 0000000000000000 x12: 0000000000000000
| x11: 0000000000000000 x10: 0000000000000000 x9 : 0000000000000000
| x8 : 0000000000000000 x7 : 0000000000000000 x6 : ffff000801f90d70
| x5 : 0000000000001000 x4 : ffff8007fd739000 x3 : ffff000801f90000
| x2 : 0000000000000000 x1 : 00000000000003cc x0 : ffff800082f9d000
| Kernel panic - not syncing: Unhandled exception
| CPU: 1 UID: 0 PID: 164 Comm: kvm-vcpu-0 Not tainted 6.15.0-rc4-00138-ga05e0f012c05 #3 PREEMPT
| Hardware name: FVP Base RevC (DT)
| Call trace:
|  show_stack+0x18/0x24 (C)
|  dump_stack_lvl+0x60/0x80
|  dump_stack+0x18/0x24
|  panic+0x168/0x360
|  __panic_unhandled+0x68/0x74
|  el1h_64_irq_handler+0x0/0x24
|  el1h_64_sync+0x6c/0x70
|  __kvm_vcpu_run+0x6f4/0x844 (P)
|  kvm_arm_vcpu_enter_exit+0x64/0xa0
|  kvm_arch_vcpu_ioctl_run+0x21c/0x870
|  kvm_vcpu_ioctl+0x1a8/0x9d0
|  __arm64_sys_ioctl+0xb4/0xf4
|  invoke_syscall+0x48/0x104
|  el0_svc_common.constprop.0+0x40/0xe0
|  do_el0_svc+0x1c/0x28
|  el0_svc+0x30/0xcc
|  el0t_64_sync_handler+0x10c/0x138
|  el0t_64_sync+0x198/0x19c
| SMP: stopping secondary CPUs
| Kernel Offset: disabled
| CPU features: 0x0000,000002c0,02df4fb9,97ee773f
| Memory Limit: none
| ---[ end Kernel panic - not syncing: Unhandled exception ]---

Fix this by adding an ISB between __deactivate_traps() and
fpsimd_lazy_switch_to_host().

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Mark Brown <broonie@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/vhe/switch.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index 09df2b42bc1b7..20df44b49ceb8 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -667,6 +667,9 @@ static int __kvm_vcpu_run_vhe(struct kvm_vcpu *vcpu)
 
 	__deactivate_traps(vcpu);
 
+	/* Ensure CPTR trap deactivation has taken effect */
+	isb();
+
 	fpsimd_lazy_switch_to_host(vcpu);
 
 	sysreg_restore_host_state_vhe(host_ctxt);
-- 
2.30.2


