Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBAD3FF8873
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nLZLYLu0zljUKhpttwJ+cNPly1RpQz6rB9m015oGS98=; b=2A5cLuXWL3SgT5Y/glwn6GYOSv
	hea/yE3LhCe2nPguN1bQGpk1T5JqpUNh8X4ELHfpAaPGnS5I8uVI307qhvN6DIyHbhng0wsGq/L9M
	iLFV+f823539hD/BGKGfv6D+6C0NMCqQrrp8vqTX2ggwbHpJZV4PfFgLuQ6yq2tfQB+G7B5QNK243
	A/uw6e0i3RDlhzTIf23J1LQbXtjLWPYXvrcTtg1WlPjMtObjXh9KE6GAt2Tz54XNC+IGLIybNARJE
	h8fiuWyUXwmw9P8IN4bQ0+p3iC1gsh6E1CjpiNYkrh25plpJ+e1mnQ4HUg1OOz8quNtIr9HKd3fLD
	2C3CIskw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITnq-00000005hWs-24S0;
	Thu, 30 Apr 2026 15:59:50 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wITnn-00000005hWU-2pj5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 15:59:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BEB3932D1;
	Thu, 30 Apr 2026 08:59:38 -0700 (PDT)
Received: from gaia.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A69273F763;
	Thu, 30 Apr 2026 08:59:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777564784; bh=m5tQdktelD+wislM/lslEYqqOh82U6eooilBfo9yZ00=;
	h=From:To:Cc:Subject:Date:From;
	b=idaAPGjyesQepnFnpwtxoFD6U1q29A0WwH3IZ9N25yGbQDhnmzn7+2l/l4VUS031Z
	 pffWpaEMSsuxxa+q1fL20LNQtSLCWpNR0elG7DVj8C7djl9cLGuWjFg8Nk3WbDih+c
	 zkQ/TlkSy4UhHBgB15R031kXblFPV3Un5vJC75YM=
From: Catalin Marinas <catalin.marinas@arm.com>
To: Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	James Morse <james.morse@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Vincent Donnefort <vdonnefort@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Sudeep Holla <sudeep.holla@kernel.org>
Subject: [PATCH] KVM: arm64: Work around C1-Pro erratum 4193714 for protected guests
Date: Thu, 30 Apr 2026 16:59:11 +0100
Message-ID: <20260430155911.628402-1-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_085947_802167_8B7FF0BA 
X-CRM114-Status: GOOD (  21.03  )
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
affected CPUs. The implication is pages cannot be unmapped from the
host Stage 2 then provided to the guest. Host SME accesses may occur
after this point.

This erratum breaks pKVM's guarantees, and the workaround is hard to
implement as EL2 and EL1 share a security state meaning EL1 can mask
IPIs sent by EL2, leading to interrupt blackouts.

Instead, do this in EL3. This has the advantage of a separate security
state, meaning lower EL cannot mask the IPI. It is also simpler for EL3
to know about CPUs that are off or in PSCI's CPU_SUSPEND.

Add the needed hook to host_stage2_set_owner_metadata_locked(). This
covers the cases where the host loses access to a page:

  __pkvm_host_donate_guest()
  __pkvm_guest_unshare_host()
  host_stage2_set_owner_locked() when owner_id == PKVM_ID_HYP

Signed-off-by: James Morse <james.morse@arm.com>
[catalin.marinas@arm.com: move the hook to host_stage2_set_owner_metadata_locked()]
[catalin.marinas@arm.com: use hyp_smccc_1_1_smc()]
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>
Cc: Will Deacon <will@kernel.org>
Cc: Vincent Donnefort <vdonnefort@google.com>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: Sudeep Holla <sudeep.holla@kernel.org>
---

That's a rebase to 7.1-rc1 together with a few tweaks. The initial
workaround for pKVM was posted here:

https://lore.kernel.org/r/20260323162408.4163113-6-catalin.marinas@arm.com

I dropped the vN numbering since the original series evolved a bit. I
also changed the subject here, more suitable for a stand-alone patch.

Changes since last time:

- Use hyp_smccc_1_1_smc() instead of arm_smccc_1_1_smc() as suggested by
  Vincent

- Do the SMC only when the host loses access to a page and not when the
  ownership transition happens in the other direction. Guests do not
  have access to SME in current mainline

I looked at the Android16 backport from Vincent and it covers more
cases but they do not apply to mainline (sglists, donate to FF-A). I
could not figure out why changing a host permission from RW to R or
!valid matters for this workaround, so that's not done here either.

 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 +++++++++++++++++++-
 include/linux/arm-smccc.h             |  6 ++++++
 2 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 28a471d1927c..75977179c9d1 100644
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
@@ -14,6 +16,7 @@
 
 #include <hyp/fault.h>
 
+#include <nvhe/arm-smccc.h>
 #include <nvhe/gfp.h>
 #include <nvhe/memory.h>
 #include <nvhe/mem_protect.h>
@@ -29,6 +32,15 @@ static struct hyp_pool host_s2_pool;
 static DEFINE_PER_CPU(struct pkvm_hyp_vm *, __current_vm);
 #define current_vm (*this_cpu_ptr(&__current_vm))
 
+static void pkvm_sme_dvmsync_fw_call(void)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714)) {
+		struct arm_smccc_res res;
+
+		hyp_smccc_1_1_smc(ARM_SMCCC_CPU_WORKAROUND_4193714, &res);
+	}
+}
+
 static void guest_lock_component(struct pkvm_hyp_vm *vm)
 {
 	hyp_spin_lock(&vm->lock);
@@ -574,8 +586,14 @@ static int host_stage2_set_owner_metadata_locked(phys_addr_t addr, u64 size,
 	ret = host_stage2_try(kvm_pgtable_stage2_annotate, &host_mmu.pgt,
 			      addr, size, &host_s2_pool,
 			      KVM_HOST_INVALID_PTE_TYPE_DONATION, annotation);
-	if (!ret)
+	if (!ret) {
+		/*
+		 * After stage2 maintenance has happened, but before the page
+		 * owner has changed.
+		 */
+		pkvm_sme_dvmsync_fw_call();
 		__host_update_page_state(addr, size, PKVM_NOPAGE);
+	}
 
 	return ret;
 }
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

