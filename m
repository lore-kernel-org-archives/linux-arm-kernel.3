Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADF23C28B30
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 00:17:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9d7+hPv7lTY5qnBieBNK9HoKs1nCAZ/AFLDKwFl2q90=; b=QtOgIG0ctGo/wPYc28JcFB8Bt7
	pTw9uRIKh+1Cz6WuE3N+DERCv92QKeKfFcFcuGzXwG6wbeYQqqv1YziCBKByVkSFSvAPGzbvpEg6U
	3iYIIkYAhv1soi+Mfh69F+17vqRpBJw9KiTtULcb9mE3S4Kkoo9ArNm/De2YyBaXXcibS+6e3wevc
	mGyx06M2VZwsHUuwWocs0Is3y6pvghfpM/AcxxRWEfG7GhQaUKATYzA3ZO/gQnmBKOH8D5VhWiOU6
	cQ+D6ruxG7TAgSvXGQh1mSqM+sxdP4GL5mMAtZC0aOPXIpAQG3mWaS3t/COgtRD7r4axTx4F9r9Eg
	uVutNKrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvQ4x-0000000DXON-0ejo;
	Fri, 21 Mar 2025 00:17:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvPyR-0000000DWJ1-104P
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 00:10:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D42146159E;
	Fri, 21 Mar 2025 00:10:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5C52C4CEDD;
	Fri, 21 Mar 2025 00:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742515854;
	bh=E+aOhIZc+2/jDkgAqi9VNAFDe2MB1GBPZXykaIDdI+s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lvQwo43HTIXzO7+BzgxpIoQwAWuaMViA/smGiwAswopB3gxO00/muFXJ8+yFbxqEW
	 XfpldLKLK+EK2V8sqePMiAivni7z7iZwTedcPFo922AsVQyc7Bp3DsVSZOdHbc+iet
	 HQeFtG1TA5reeo2TWBuQP2i/XmZGqtp9hV0SGLp+KhMPHskTsgxGZnkJ0l6EaaSTpa
	 EgoDsBkaposLa+FtasVbn0LIJoElSb5v/5o87dYI8u43c9mrc/98IdFOsiOSt+x2M4
	 5EmdBF7FXFIIt2v6FyXLjXQPuxOWwnk0HR0/UFl2ae5LWT/rjEzPAQmE9ECFp7o9j/
	 X2Jj4HsoLd5wg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 21 Mar 2025 00:10:13 +0000
Subject: [PATCH 6.13 v2 4/8] KVM: arm64: Remove VHE host restore of
 CPACR_EL1.ZEN
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250321-stable-sve-6-13-v2-4-3150e3370c40@kernel.org>
References: <20250321-stable-sve-6-13-v2-0-3150e3370c40@kernel.org>
In-Reply-To: <20250321-stable-sve-6-13-v2-0-3150e3370c40@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Fuad Tabba <tabba@google.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3661; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yO17/qmFqJwkGL3jxPrvPZFrNQ9AjVZUoiyN8pPAOE0=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn3K52TqAzC8CL//mNmItcTqkrbfy/ktAiZU+akIKh
 9nEJeiWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ9yudgAKCRAk1otyXVSH0NDOB/
 sHQxIKoaGMrZWiPWz7KrALloXLYvye/VSbcUrjrNNLWr+gzFKKjezSeZLcx7NgEy064PmR/qhn6gig
 Hm0xk+jEhydJie7Bs7AnifcdNax0jc1J6NDmm8rfHAepnCHQc3/7NiKXJ2Hf+inYyUlTti0Vrt9Owa
 9EZWIHAA1Ksll1LsRaIIFg38KynXHMNtvEXlF6hPwQVEkQnW6jRy5eEirMW31Mhm0WckbBHg7luOhC
 UXequjpS92+nq2fUeeM0NeOIKEIZ4Tdz/Oo3yLte8YvNrdu7mqxsV/5qDcnEcwRCFHiaouBnb2spA0
 yo4mWPIcc/gwDzKVDJ3y0VgrxDScR5
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
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

[ Upstream commit 459f059be702056d91537b99a129994aa6ccdd35 ]

When KVM is in VHE mode, the host kernel tries to save and restore the
configuration of CPACR_EL1.ZEN (i.e. CPTR_EL2.ZEN when HCR_EL2.E2H=1)
across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
configuration may be clobbered by hyp when running a vCPU. This logic is
currently redundant.

The VHE hyp code unconditionally configures CPTR_EL2.ZEN to 0b01 when
returning to the host, permitting host kernel usage of SVE.

Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
state, there's no need to save/restore the state of the EL0 SVE trap.
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
Link: https://lore.kernel.org/r/20250210195226.1215254-4-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[Rework for refactoring of where the flags are stored -- broonie]
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_host.h |  2 --
 arch/arm64/kvm/fpsimd.c           | 16 ----------------
 2 files changed, 18 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 0b39888e86d6d40fea56bb6cb8ccdbaf480d0d55..fe25d411d3d8efbe19d5ffba8ea23bf98eb06c38 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -902,8 +902,6 @@ struct kvm_vcpu_arch {
 /* Save TRBE context if active  */
 #define DEBUG_STATE_SAVE_TRBE	__vcpu_single_flag(iflags, BIT(6))
 
-/* SVE enabled for host EL0 */
-#define HOST_SVE_ENABLED	__vcpu_single_flag(sflags, BIT(0))
 /* SME enabled for EL0 */
 #define HOST_SME_ENABLED	__vcpu_single_flag(sflags, BIT(1))
 /* Physical CPU not in supported_cpus */
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 2ee6bde85235581d6bc9cba7e578c55875b5d5a1..4127abfd319c2c683d2281efa52a6abe5fac67ee 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -65,10 +65,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 	fpsimd_save_and_flush_cpu_state();
 	*host_data_ptr(fp_owner) = FP_STATE_FREE;
 
-	vcpu_clear_flag(vcpu, HOST_SVE_ENABLED);
-	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
-		vcpu_set_flag(vcpu, HOST_SVE_ENABLED);
-
 	if (system_supports_sme()) {
 		vcpu_clear_flag(vcpu, HOST_SME_ENABLED);
 		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
@@ -202,18 +198,6 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 		 * when needed.
 		 */
 		fpsimd_save_and_flush_cpu_state();
-	} else if (has_vhe() && system_supports_sve()) {
-		/*
-		 * The FPSIMD/SVE state in the CPU has not been touched, and we
-		 * have SVE (and VHE): CPACR_EL1 (alias CPTR_EL2) has been
-		 * reset by kvm_reset_cptr_el2() in the Hyp code, disabling SVE
-		 * for EL0.  To avoid spurious traps, restore the trap state
-		 * seen by kvm_arch_vcpu_load_fp():
-		 */
-		if (vcpu_get_flag(vcpu, HOST_SVE_ENABLED))
-			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_ZEN_EL0EN);
-		else
-			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
 	local_irq_restore(flags);

-- 
2.39.5


