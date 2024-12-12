Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3586CE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 16:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oUwA5ncUUTKGsJg51nb8RSX936iI6DjukadJTDivIIE=; b=Zr7hElClYArHRErv+XCdXBOCWD
	06fAk/iyYtAmnYNRs+67WWNUPCd15kQ6hTI4cHoYJfZjQFd7U59FBm5+fhFaDUFUtscIaYDXeR5M5
	n+eUK3R2Hwf25wxlzvRhKdxg6yhWjq4lSLb12XVAYfEq9Cu6idAqRyZT9LHx3sPuJHPsFVas5pS3Z
	mnDJchPXkvgkUqDzB/gQq6tiG7VZtUW3zJyexBNW2C3Oii+f/aWQ1obHor4C2+Rh2fRPMhUkjUMza
	f7zDyyBKhVe85zsOB8yXvRdt2YzSZ1/muEIyx6fmS9zLlwi+DUnj2Exk3Tq6WZdGsTyb/gKD8PAp6
	wrQanxVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLm70-00000000zUt-40HQ;
	Thu, 12 Dec 2024 16:32:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLlZT-00000000r6F-09od
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:57:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B38C41762;
	Thu, 12 Dec 2024 07:58:14 -0800 (PST)
Received: from e122027.cambridge.arm.com (e122027.cambridge.arm.com [10.1.39.50])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 81EDF3F720;
	Thu, 12 Dec 2024 07:57:43 -0800 (PST)
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Steven Price <steven.price@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
Subject: [PATCH v6 18/43] KVM: arm64: Handle realm MMIO emulation
Date: Thu, 12 Dec 2024 15:55:43 +0000
Message-ID: <20241212155610.76522-19-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241212155610.76522-1-steven.price@arm.com>
References: <20241212155610.76522-1-steven.price@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_075747_150985_6462D66E 
X-CRM114-Status: GOOD (  17.46  )
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

MMIO emulation for a realm cannot be done directly with the VM's
registers as they are protected from the host. However, for emulatable
data aborts, the RMM uses GPRS[0] to provide the read/written value.
We can transfer this from/to the equivalent VCPU's register entry and
then depend on the generic MMIO handling code in KVM.

For a MMIO read, the value is placed in the shared RecExit structure
during kvm_handle_mmio_return() rather than in the VCPU's register
entry.

Signed-off-by: Steven Price <steven.price@arm.com>
---
Changes since v5:
 * Inject SEA to the guest is an emulatable MMIO access triggers a data
   abort.
 * kvm_handle_mmio_return() - disable kvm_incr_pc() for a REC (as the PC
   isn't under the host's control) and move the REC_ENTER_EMULATED_MMIO
   flag setting to this location (as that tells the RMM to skip the
   instruction).
---
 arch/arm64/kvm/inject_fault.c |  4 +++-
 arch/arm64/kvm/mmio.c         | 16 ++++++++++++----
 arch/arm64/kvm/rme-exit.c     |  6 ++++++
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/inject_fault.c b/arch/arm64/kvm/inject_fault.c
index a640e839848e..611867b81ac2 100644
--- a/arch/arm64/kvm/inject_fault.c
+++ b/arch/arm64/kvm/inject_fault.c
@@ -165,7 +165,9 @@ static void inject_abt32(struct kvm_vcpu *vcpu, bool is_pabt, u32 addr)
  */
 void kvm_inject_dabt(struct kvm_vcpu *vcpu, unsigned long addr)
 {
-	if (vcpu_el1_is_32bit(vcpu))
+	if (unlikely(vcpu_is_rec(vcpu)))
+		vcpu->arch.rec.run->enter.flags |= REC_ENTER_INJECT_SEA;
+	else if (vcpu_el1_is_32bit(vcpu))
 		inject_abt32(vcpu, false, addr);
 	else
 		inject_abt64(vcpu, false, addr);
diff --git a/arch/arm64/kvm/mmio.c b/arch/arm64/kvm/mmio.c
index ab365e839874..e0889f17c3f9 100644
--- a/arch/arm64/kvm/mmio.c
+++ b/arch/arm64/kvm/mmio.c
@@ -6,6 +6,7 @@
 
 #include <linux/kvm_host.h>
 #include <asm/kvm_emulate.h>
+#include <asm/rmi_smc.h>
 #include <trace/events/kvm.h>
 
 #include "trace.h"
@@ -136,14 +137,21 @@ int kvm_handle_mmio_return(struct kvm_vcpu *vcpu)
 		trace_kvm_mmio(KVM_TRACE_MMIO_READ, len, run->mmio.phys_addr,
 			       &data);
 		data = vcpu_data_host_to_guest(vcpu, data, len);
-		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
+
+		if (vcpu_is_rec(vcpu))
+			vcpu->arch.rec.run->enter.gprs[0] = data;
+		else
+			vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu), data);
 	}
 
 	/*
 	 * The MMIO instruction is emulated and should not be re-executed
 	 * in the guest.
 	 */
-	kvm_incr_pc(vcpu);
+	if (vcpu_is_rec(vcpu))
+		vcpu->arch.rec.run->enter.flags |= REC_ENTER_EMULATED_MMIO;
+	else
+		kvm_incr_pc(vcpu);
 
 	return 1;
 }
@@ -162,14 +170,14 @@ int io_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 	 * No valid syndrome? Ask userspace for help if it has
 	 * volunteered to do so, and bail out otherwise.
 	 *
-	 * In the protected VM case, there isn't much userspace can do
+	 * In the protected/realm VM case, there isn't much userspace can do
 	 * though, so directly deliver an exception to the guest.
 	 */
 	if (!kvm_vcpu_dabt_isvalid(vcpu)) {
 		trace_kvm_mmio_nisv(*vcpu_pc(vcpu), kvm_vcpu_get_esr(vcpu),
 				    kvm_vcpu_get_hfar(vcpu), fault_ipa);
 
-		if (vcpu_is_protected(vcpu)) {
+		if (vcpu_is_protected(vcpu) || vcpu_is_rec(vcpu)) {
 			kvm_inject_dabt(vcpu, kvm_vcpu_get_hfar(vcpu));
 			return 1;
 		}
diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
index e532aa80e10d..8f0f9ab57f28 100644
--- a/arch/arm64/kvm/rme-exit.c
+++ b/arch/arm64/kvm/rme-exit.c
@@ -25,6 +25,12 @@ static int rec_exit_reason_notimpl(struct kvm_vcpu *vcpu)
 
 static int rec_exit_sync_dabt(struct kvm_vcpu *vcpu)
 {
+	struct realm_rec *rec = &vcpu->arch.rec;
+
+	if (kvm_vcpu_dabt_iswrite(vcpu) && kvm_vcpu_dabt_isvalid(vcpu))
+		vcpu_set_reg(vcpu, kvm_vcpu_dabt_get_rd(vcpu),
+			     rec->run->exit.gprs[0]);
+
 	return kvm_handle_guest_abort(vcpu);
 }
 
-- 
2.43.0


