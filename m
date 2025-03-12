Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7776C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 00:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+XPxOrgQqyf75dmHWOKGkzIqgPT5zX5TPOBFd88dD2w=; b=u30zQumTBjYp1bHVGAjvBjiAQB
	y3IU6iTyq6Oz6WvRHKNnMN7zHAcrvlap5XPjANE7QswMJmKL3iNEzx9bXEZyy3336o224SNT+wksS
	kSYJrAziPNirjlsexzw+ZEamVaI3ix3P7s4gusMkPum8r2G0QJ20Sm2NO4c38Ukxn6NqmiE33SJsG
	tkOpe1m0fhCh2LIgH5pkJ3/FyhSpMBUmm64AMu4jLU+meGRzcPvsD7M4sYJwP3T9MhB8WYehvQKaW
	uCwtiwm+OKeNGC7N/PSJ7x7ilnhPuiVbyb53IGxUd47sviryg4knZCSVIM8RadITcQMICIl9vxQLY
	JVZpPPwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsW2N-00000009mbj-2Gd2;
	Thu, 13 Mar 2025 00:02:59 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsVpe-00000009kHN-3g1d
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 23:49:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 3C218A451D7;
	Wed, 12 Mar 2025 23:44:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4128AC4CEE3;
	Wed, 12 Mar 2025 23:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741823389;
	bh=+uERNQF5UkjKJBIpV+9hBTi9ouGANfThGnrWNdRyna8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MLD63qByBtBkkd7l/eR/q7Gr4877dpQlHNe80ZsAIO/Mz80nJZUpjpOwkU+f3bZ9m
	 Xt60PMfoIG4uAFHQzDM5XuiZ/IQc3diWOFrD4sQtMVnqqyGOTR1HrF9tzxw+HoQxQZ
	 vejfD1HYMr6926jr1NUJtCmh5qeOiIDXNhbcQPuWQ+9fHyMnTOjXuqMEvmz5XYx2Xc
	 PMbmRxbSSabFYbT7yRkh/OiWjrV7EDEn5+YQoPTub85nMti7UvF/rqa9tK/D3jEAps
	 dF5XtBUhMJW56IaPlJHdcY4GC4hzyTRjcSm+/dCbdSH5WGoQs9+JnT14qir5if6IQE
	 qp2vq7Er5M+og==
From: Mark Brown <broonie@kernel.org>
Date: Wed, 12 Mar 2025 23:49:15 +0000
Subject: [PATCH 6.13 7/8] KVM: arm64: Mark some header functions as inline
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250312-stable-sve-6-13-v1-7-c7ba07a6f4f7@kernel.org>
References: <20250312-stable-sve-6-13-v1-0-c7ba07a6f4f7@kernel.org>
In-Reply-To: <20250312-stable-sve-6-13-v1-0-c7ba07a6f4f7@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=5610; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0qUpq6HUams3FaMMmSJsBH+0qO7zI5hxVkBdLHdk9A0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn0h2CsD+Km+50MRjLSBR9FFTfcdMgC68AEbly4Odw
 U5HszSaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9IdggAKCRAk1otyXVSH0KOuB/
 4t4NtAc/sxax2otNNdND1sAd8PHJYOJmL6FHenPgg//X823FXKlGZPdHhy1euSsZR87tqzwoF6c/Fp
 HFTaOyMTiihb0LsBHopcBs/TVgbMHM5JlU68goPjYJYGqyPRVa2rTLijIpC9xP0dbycihr2eceppB5
 bFfEJOwhoR6Js/Eun+TuGSgSsCU+qjIzTcalbHk500ydde7BXQnJed1V/g6QcQrN6TYJaYqJ/CIGx8
 0pVS4pRTnkMgEb84Nhj6YHQVrCqT38yEceqZaTrMAVAhfnN+3x6FNdV1r3KoM51STwQQtcOa38ZsRe
 BPrByjfH35rXp0sZD3NEAFwxYIgwnS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_164951_051674_646B9208 
X-CRM114-Status: GOOD (  12.80  )
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

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit f9dd00de1e53a47763dfad601635d18542c3836d ]

The shared hyp switch header has a number of static functions which
might not be used by all files that include the header, and when unused
they will provoke compiler warnings, e.g.

| In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:703:13: warning: 'kvm_hyp_handle_dabt_low' defined but not used [-Wunused-function]
|   703 | static bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:682:13: warning: 'kvm_hyp_handle_cp15_32' defined but not used [-Wunused-function]
|   682 | static bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:662:13: warning: 'kvm_hyp_handle_sysreg' defined but not used [-Wunused-function]
|   662 | static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:458:13: warning: 'kvm_hyp_handle_fpsimd' defined but not used [-Wunused-function]
|   458 | static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:329:13: warning: 'kvm_hyp_handle_mops' defined but not used [-Wunused-function]
|   329 | static bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~

Mark these functions as 'inline' to suppress this warning. This
shouldn't result in any functional change.

At the same time, avoid the use of __alias() in the header and alias
kvm_hyp_handle_iabt_low() and kvm_hyp_handle_watchpt_low() to
kvm_hyp_handle_memory_fault() using CPP, matching the style in the rest
of the kernel. For consistency, kvm_hyp_handle_memory_fault() is also
marked as 'inline'.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-8-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index e330a7825b56f14ccb144810bc0d31f7f400fb22..300ec597cf1257954019f50cce44d662d6420790 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -326,7 +326,7 @@ static inline bool __populate_fault_info(struct kvm_vcpu *vcpu)
 	return __get_fault_info(vcpu->arch.fault.esr_el2, &vcpu->arch.fault);
 }
 
-static bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	*vcpu_pc(vcpu) = read_sysreg_el2(SYS_ELR);
 	arm64_mops_reset_regs(vcpu_gp_regs(vcpu), vcpu->arch.fault.esr_el2);
@@ -404,7 +404,7 @@ static void kvm_hyp_save_fpsimd_host(struct kvm_vcpu *vcpu)
  * If FP/SIMD is not implemented, handle the trap and inject an undefined
  * instruction exception to the guest. Similarly for trapped SVE accesses.
  */
-static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	bool sve_guest;
 	u8 esr_ec;
@@ -595,7 +595,7 @@ static bool handle_ampere1_tcr(struct kvm_vcpu *vcpu)
 	return true;
 }
 
-static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_TX2_219_TVM) &&
 	    handle_tx2_tvm(vcpu))
@@ -615,7 +615,7 @@ static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return false;
 }
 
-static bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (static_branch_unlikely(&vgic_v3_cpuif_trap) &&
 	    __vgic_v3_perform_cpuif_access(vcpu) == 1)
@@ -624,19 +624,18 @@ static bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
 	return false;
 }
 
-static bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
+					       u64 *exit_code)
 {
 	if (!__populate_fault_info(vcpu))
 		return true;
 
 	return false;
 }
-static bool kvm_hyp_handle_iabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
-	__alias(kvm_hyp_handle_memory_fault);
-static bool kvm_hyp_handle_watchpt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
-	__alias(kvm_hyp_handle_memory_fault);
+#define kvm_hyp_handle_iabt_low		kvm_hyp_handle_memory_fault
+#define kvm_hyp_handle_watchpt_low	kvm_hyp_handle_memory_fault
 
-static bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (kvm_hyp_handle_memory_fault(vcpu, exit_code))
 		return true;

-- 
2.39.5


