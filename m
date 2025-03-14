Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D57AC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 00:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYXtKIpO9mvuOSL676yp0RXoBsIn5et9w/9b5jrCUDE=; b=lBXXYUUragNyrknGAPwV/4A0R+
	ixM1gMfxeW8P7uyqwWE00KUyb4FCcJJDVsT9tezuSg5nnLshWYjFjqpgftgDl/HyIHAyFE4xZmdbb
	lXl+CowHakRw46tXFslLv5Uyvv48AgVC+l2XgHyozylNigrujm/AXl/W7sgzVTDPvEjGbRTXHJXRy
	b+qR0XCgejxo8Qe06dgm4ehCYzQhK59YJc6QcGH8oQ5oTjgCdkosok5PGj2yPCQE4biAjM8aiOes+
	BrF4ctFVWM16HbxmwFO6NpNdvJYZ3aSAe1v5x9ABShUmUTia4tOJgOzg/ICN/tHWT10pta+FbC0JK
	SZs+sKvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tstBF-0000000CpUm-39c0;
	Fri, 14 Mar 2025 00:45:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tst1h-0000000CoPc-2VtQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 00:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E7645C5A81;
	Fri, 14 Mar 2025 00:33:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073F9C4CEEA;
	Fri, 14 Mar 2025 00:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741912548;
	bh=HIGP6VBVWear5iflnuFs+CJgbgmTu67qH3gNvcXNftM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AGjYGP2YJS1aamsClgwJVp8lf/kvGD7uAoY25yBI1REbemyE74WLcQq+g06M468KS
	 aUnhTHifE1olwyulIXOfBegwsLtZU3L+PD+pKyAwyf2vmFxif5nqvz5i3pCeUR9361
	 vA3QrC0POnnxP8GMCB7ZibojebO9BYXEeD6zPS8ONfPixf1JLhC0OrmDBggVSzbJJf
	 YxUU9Zw2ARStBU/VEzBgs/NxsItnxNFSSQAViGOr/Bd+73QS9eNS51zzODz8yS35Bn
	 WOz/59OHaZRjIR4iZcrtLw2URol/L2smOLmeCBst5gk5bgvV4GVQLtddWLcqnQFPYP
	 MsZ2DhXlTQKRw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Mar 2025 00:35:17 +0000
Subject: [PATCH 6.12 5/8] KVM: arm64: Remove VHE host restore of
 CPACR_EL1.SMEN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250314-stable-sve-6-12-v1-5-ddc16609d9ba@kernel.org>
References: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
In-Reply-To: <20250314-stable-sve-6-12-v1-0-ddc16609d9ba@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=4631; i=broonie@kernel.org;
 h=from:subject:message-id; bh=m4KZU2ZKwzrjocVTNsB04VCPKKuL2LaKvOlEuHx81YI=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn03nMSFXYqxcla2yOd8Q6on5+uQX/712+j4Vs6YuY
 SKd3+2qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9N5zAAKCRAk1otyXVSH0NwpB/
 9R+P4tBBfHyjajsFRWu7iejmODR6/43awUkFAy7YdjeXS6OC7DNo1d0jkkT+kNF+Ep0vF1ThBl1aXm
 kWW2QxCv7ixy2vRkXOFjUkoZBzyK28avR1VQ0o2+CL5E/PV4dqncMKypK7Bc22NYh5c4npcXhLgiS+
 FZjjcjQoGIq+I9r+dSQPA0LLOtCtB/Wqq9uUY5RT76bydSYgs5aRDsTU7uK0QXBcRQsW8QbDTRBJjU
 PdSw4sVNx6DU0sOGN7/xtoN9vOT7S8TUZS1zDI6+sOy+qEGCBBJ5XgI9cLevDs1ltX5awZO05gRQhu
 2KA92X3cjMs8+lCWAguTV7tORpNOCx
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_173549_734770_C36F9AD7 
X-CRM114-Status: GOOD (  20.80  )
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

[ Upstream commit 407a99c4654e8ea65393f412c421a55cac539f5b ]

When KVM is in VHE mode, the host kernel tries to save and restore the
configuration of CPACR_EL1.SMEN (i.e. CPTR_EL2.SMEN when HCR_EL2.E2H=1)
across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
configuration may be clobbered by hyp when running a vCPU. This logic
has historically been broken, and is currently redundant.

This logic was originally introduced in commit:

  861262ab86270206 ("KVM: arm64: Handle SME host state when running guests")

At the time, the VHE hyp code would reset CPTR_EL2.SMEN to 0b00 when
returning to the host, trapping host access to SME state. Unfortunately,
this was unsafe as the host could take a softirq before calling
kvm_arch_vcpu_put_fp(), and if a softirq handler were to use kernel mode
NEON the resulting attempt to save the live FPSIMD/SVE/SME state would
result in a fatal trap.

That issue was limited to VHE mode. For nVHE/hVHE modes, KVM always
saved/restored the host kernel's CPACR_EL1 value, and configured
CPTR_EL2.TSM to 0b0, ensuring that host usage of SME would not be
trapped.

The issue above was incidentally fixed by commit:

  375110ab51dec5dc ("KVM: arm64: Fix resetting SME trap values on reset for (h)VHE")

That commit changed the VHE hyp code to configure CPTR_EL2.SMEN to 0b01
when returning to the host, permitting host kernel usage of SME,
avoiding the issue described above. At the time, this was not identified
as a fix for commit 861262ab86270206.

Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
state, there's no need to save/restore the state of the EL0 SME trap.
The kernel can safely save/restore state without trapping, as described
above, and will restore userspace state (including trap controls) before
returning to userspace.

Remove the redundant logic.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-5-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[Update for rework of flags storage -- broonie]
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 --
 arch/arm64/kvm/fpsimd.c           | 21 ---------------------
 2 files changed, 23 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 1a126fa657fcde3433f37f3aaf464a5b6a5f095d..122a1e12582c0584bce86c5416ef7d150f90fe95 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -891,8 +891,6 @@ struct kvm_vcpu_arch {
 /* Save TRBE context if active  */
 #define DEBUG_STATE_SAVE_TRBE	__vcpu_single_flag(iflags, BIT(6))
 
-/* SME enabled for EL0 */
-#define HOST_SME_ENABLED	__vcpu_single_flag(sflags, BIT(1))
 /* Physical CPU not in supported_cpus */
 #define ON_UNSUPPORTED_CPU	__vcpu_single_flag(sflags, BIT(2))
 /* WFIT instruction trapped */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 4127abfd319c2c683d2281efa52a6abe5fac67ee..f64724197958e0d8a4ec17deb1f9826ce3625eb7 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -65,12 +65,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	fpsimd_save_and_flush_cpu_state();
 	*host_data_ptr(fp_owner) = FP_STATE_FREE;
 
-	if (system_supports_sme()) {
-		vcpu_clear_flag(vcpu, HOST_SME_ENABLED);
-		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
-			vcpu_set_flag(vcpu, HOST_SME_ENABLED);
-	}
-
 	/*
 	 * If normal guests gain SME support, maintain this behavior for pKVM
 	 * guests, which don't support SME.
@@ -141,21 +135,6 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 
 	local_irq_save(flags);
 
-	/*
-	 * If we have VHE then the Hyp code will reset CPACR_EL1 to
-	 * the default value and we need to reenable SME.
-	 */
-	if (has_vhe() && system_supports_sme()) {
-		/* Also restore EL0 state seen on entry */
-		if (vcpu_get_flag(vcpu, HOST_SME_ENABLED))
-			sysreg_clear_set(CPACR_EL1, 0, CPACR_ELx_SMEN);
-		else
-			sysreg_clear_set(CPACR_EL1,
-					 CPACR_EL1_SMEN_EL0EN,
-					 CPACR_EL1_SMEN_EL1EN);
-		isb();
-	}
-
 	if (guest_owns_fp_regs()) {
 		if (vcpu_has_sve(vcpu)) {
 			u64 zcr = read_sysreg_el1(SYS_ZCR);

-- 
2.39.5


