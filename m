Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84E50C79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RytTzjss6Vp2K1q3n6YPFKxC2mr1mhgiW1GnP1/BI60=; b=0z1DKaA58i3CRqMmfoirE+WTjB
	DZAz0wf5ubJs6EPYsfHzYWgeFLoel64bKbY/FJ4xnEQy5vTI1DxU7r/TkUsLtephNdx/SGGqk7hJR
	ChlAFJYVPDnPnQMukaHBeawa1xtzBH1zgGS+MWhx2im4tf1Q1BzXGsBmCNYi2jx1NKnz7j2OtRRYh
	3txIPmRBZL5JlL64upaTmKOLEvimEtWLHWxC4boMUHkllQ1Ep9OtDmwSP/dbRAQZtF5uIsdl7t1AM
	BymkGqfuKkbpW6T+bdbvRWNyNkCUdt1IkYPZnwZXuHFAmQAIl4ljoggBk1F3HNklaQz/qZIrTQgIK
	/RVJsetw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrJ-0000000BeXX-0UDo;
	Mon, 05 Jan 2026 15:51:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmrG-0000000BeTw-28CR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:51:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E412060145;
	Mon,  5 Jan 2026 15:51:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08AABC116D0;
	Mon,  5 Jan 2026 15:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767628261;
	bh=KyqwmpkT0XzVRJbn7urXKIik32fzcIYZDfk4aQ0aieE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DCM+ZLI9kuIX/R+wDd/Gm6pbCS+OmMIkYOTgk6DaWZKIWHTZoNJNBbHFuuQglit75
	 XgedsYD9/uZuXFfzPz62V59BZXo0Nb+D+CLzAsIj15ntaQsBtr3yr9I3VaR6yQRHEJ
	 YF7+n8v9qn2Hsxnhyy+8g9P4ecC/IcMH2Bpxm3YmPZysm4tH1bvlKlLAcsehkMG7Re
	 pC/TY2GwAUOf9wXg0LX2EAlRdhHqnNOn1W5KLDdV4mjE/JvuJ44KlQruR0EtUHXm3z
	 3sQrhhrtap7L6Clmyd/NuVSvq++kB4XBsjVcWeGuQLb5fQjK4D85FmrtwZiAMLN2+W
	 XV16PNYe9Ovxw==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>
Subject: [PATCH 23/30] KVM: arm64: Add hvc handler at EL2 for hypercalls from protected VMs
Date: Mon,  5 Jan 2026 15:49:31 +0000
Message-ID: <20260105154939.11041-24-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260105154939.11041-1-will@kernel.org>
References: <20260105154939.11041-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Add a hypercall handler at EL2 for hypercalls originating from protected
VMs. For now, this implements only the FEATURES and MEMINFO calls, but
subsequent patches will implement the SHARE and UNSHARE functions
necessary for virtio.

Unhandled hypercalls (including PSCI) are passed back to the host.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  1 +
 arch/arm64/kvm/hyp/nvhe/pkvm.c         | 37 ++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/switch.c       |  1 +
 3 files changed, 39 insertions(+)

diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
index a5a7bb453f3e..c904647d2f76 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
@@ -88,6 +88,7 @@ struct pkvm_hyp_vm *get_pkvm_hyp_vm(pkvm_handle_t handle);
 struct pkvm_hyp_vm *get_np_pkvm_hyp_vm(pkvm_handle_t handle);
 void put_pkvm_hyp_vm(struct pkvm_hyp_vm *hyp_vm);
 
+bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code);
 bool kvm_handle_pvm_restricted(struct kvm_vcpu *vcpu, u64 *exit_code);
 void kvm_init_pvm_id_regs(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
index df340de59eed..5cdec49e989b 100644
--- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
+++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
@@ -4,6 +4,8 @@
  * Author: Fuad Tabba <tabba@google.com>
  */
 
+#include <kvm/arm_hypercalls.h>
+
 #include <linux/kvm_host.h>
 #include <linux/mm.h>
 
@@ -934,3 +936,38 @@ int __pkvm_finalize_teardown_vm(pkvm_handle_t handle)
 	hyp_spin_unlock(&vm_table_lock);
 	return err;
 }
+/*
+ * Handler for protected VM HVC calls.
+ *
+ * Returns true if the hypervisor has handled the exit (and control
+ * should return to the guest) or false if it hasn't (and the handling
+ * should be performed by the host).
+ */
+bool kvm_handle_pvm_hvc64(struct kvm_vcpu *vcpu, u64 *exit_code)
+{
+	u64 val[4] = { SMCCC_RET_INVALID_PARAMETER };
+	bool handled = true;
+
+	switch (smccc_get_function(vcpu)) {
+	case ARM_SMCCC_VENDOR_HYP_KVM_FEATURES_FUNC_ID:
+		val[0] = BIT(ARM_SMCCC_KVM_FUNC_FEATURES);
+		val[0] |= BIT(ARM_SMCCC_KVM_FUNC_HYP_MEMINFO);
+		break;
+	case ARM_SMCCC_VENDOR_HYP_KVM_HYP_MEMINFO_FUNC_ID:
+		if (smccc_get_arg1(vcpu) ||
+		    smccc_get_arg2(vcpu) ||
+		    smccc_get_arg3(vcpu)) {
+			break;
+		}
+
+		val[0] = PAGE_SIZE;
+		break;
+	default:
+		/* Punt everything else back to the host, for now. */
+		handled = false;
+	}
+
+	if (handled)
+		smccc_set_retval(vcpu, val[0], val[1], val[2], val[3]);
+	return handled;
+}
diff --git a/arch/arm64/kvm/hyp/nvhe/switch.c b/arch/arm64/kvm/hyp/nvhe/switch.c
index d3b9ec8a7c28..b62e25e8bb7e 100644
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -190,6 +190,7 @@ static const exit_handler_fn hyp_exit_handlers[] = {
 
 static const exit_handler_fn pvm_exit_handlers[] = {
 	[0 ... ESR_ELx_EC_MAX]		= NULL,
+	[ESR_ELx_EC_HVC64]		= kvm_handle_pvm_hvc64,
 	[ESR_ELx_EC_SYS64]		= kvm_handle_pvm_sys64,
 	[ESR_ELx_EC_SVE]		= kvm_handle_pvm_restricted,
 	[ESR_ELx_EC_FP_ASIMD]		= kvm_hyp_handle_fpsimd,
-- 
2.52.0.351.gbe84eed79e-goog


