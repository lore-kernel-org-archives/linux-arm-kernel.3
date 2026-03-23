Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A94DF483C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Mar 2026 16:24:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=O5z0cZoIP40ydCgMr2OHiwxqqMK+7x7ZmHu7h/85psw=; b=dot1sW5UDyggaOG1vcFRlmP0J4
	s9KTZPY2SEnr4/0WYF9n4uK/T1IN1zmj53wfYm5LDf03m3oQ9qkDfZzq59qlDEJ+atUKcbdweNJR8
	xdta3dOkotz16WffjAuzlpoi6xR0f3z95DH+1yJcWVCG1hgRyi0CAzvetrrn8LJsfEwgEItYgx3Xc
	m2qknNfOG/Zr22/2meInkyTW9pNkd6QOlHnzwMwXjNgo8UwUQenPK77docf3bJncbFyyN5E9kunnf
	gi9V/S/N6NS/IEViXLZKyemRMQPMfc2+oJ523LOWqoxJ6SN5WgkIGrWuchwcu/tQ4ykUsxPqNarmv
	i/Bn9S7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4i4s-0000000H7yf-2P7R;
	Mon, 23 Mar 2026 16:24:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4i4l-0000000H7uW-2HoV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Mar 2026 16:24:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4D35169E;
	Mon, 23 Mar 2026 09:24:16 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 351623F73B;
	Mon, 23 Mar 2026 09:24:21 -0700 (PDT)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	James Morse <james.morse@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Mark Brown <broonie@kernel.org>,
	kvmarm@lists.linux.dev
Subject: [PATCH v3 5/5] KVM: arm64: Add SMC hook for SME dvmsync erratum
Date: Mon, 23 Mar 2026 16:24:05 +0000
Message-ID: <20260323162408.4163113-6-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260323162408.4163113-1-catalin.marinas@arm.com>
References: <20260323162408.4163113-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_092423_728191_EC2AE465 
X-CRM114-Status: GOOD (  14.37  )
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

C1-Pro cores with SME have an erratum where TLBI+DSB does not complete
all outstanding SME accesses. Instead a DSB needs to be executed on the
affecteed CPUs. The implication is pages cannot be unmapped from the
host stage2 then provided to the guest. Host SME accesses may occur
after this point.

This erratum breaks pKVM's guarantees, and the workaround is hard to
implement as EL2 and EL1 share a security state meaning EL1 can mask
IPI sent by EL2, leading to interrupt blackouts.

Instead, do this in EL3. This has the advantage of a separate security
state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
to know about CPUs that are off or in PSCI's CPU_SUSPEND.

Add the needed hook.

Signed-off-by: James Morse <james.morse@arm.com>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 17 +++++++++++++++++
 include/linux/arm-smccc.h             |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 38f66a56a766..ef8afbdd421b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -5,6 +5,8 @@
  */
 
 #include <linux/kvm_host.h>
+#include <linux/arm-smccc.h>
+
 #include <asm/kvm_emulate.h>
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
@@ -28,6 +30,15 @@ static struct hyp_pool host_s2_pool;
 static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
 #define current_vm (*this_cpu_ptr(&__current_vm))
 
+static void pkvm_sme_dvmsync_fw_call(void)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
+		struct arm_smccc_res res;
+
+		arm_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);
+	}
+}
+
 static void guest_lock_component(struct pkvm_hyp_vm *vm)
 {
 	hyp_spin_lock(&vm->lock);
@@ -553,6 +564,12 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 	if (ret)
 		return ret;
 
+	/*
+	 * After stage2 maintenance has happened, but before the page owner has
+	 * changed.
+	 */
+	pkvm_sme_dvmsync_fw_call();
+
 	/* Don't forget to update the vmemmap tracking for the host */
 	if (owner_id == PKVM_ID_HOST)
 		__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
diff --git a/include/linux/arm-smccc.h b/include/linux/arm-smccc.h
index 50b47eba7d01..e7195750d21b 100644
--- a/include/linux/arm-smccc.h
+++ b/include/linux/arm-smccc.h
@@ -105,6 +105,12 @@
 			   ARM_SMCCC_SMC_32,				\
 			   0, 0x3fff)
 
+/* C1-Pro erratum 4193714: SME DVMSync early acknowledgement */
+#define ARM_SMCCC_CPU_WORKAROUND_4193714				\
+	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
+			   ARM_SMCCC_SMC_32,				\
+			   ARM_SMCCC_OWNER_CPU, 0x10)
+
 #define ARM_SMCCC_VENDOR_HYP_CALL_UID_FUNC_ID				\
 	ARM_SMCCC_CALL_VAL(ARM_SMCCC_FAST_CALL,				\
 			   ARM_SMCCC_SMC_32,				\

