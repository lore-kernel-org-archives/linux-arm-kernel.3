Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D87AC36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 18:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2TlbJsVg7ADUXbeqN4HViqbS/v7ZZAnjfGTYi4tNQpg=; b=iTyPOva4NvSnON65/+UfQtRP44
	aa9DhNgiqO6RpPPNCqoP+rqDpC55hKp6sUeX5tkvoB16xXbPQgySwkjNTpkuJvvhcby2rIb11RKje
	0dRmU0z1/ShLOnRg+y7Kb35wwnliUOfZydTl1HC/s1/bwRkWY5RrWFZnHL2cCYEeGgyFgzYvmJX3l
	7UcwwyIn5eY2PBdJ/VxUhkZOEEdtR/FWUMTvWEdFZ3SV+ccAlihp6FPwmoJiQ1d3HXFpJ6GV86Ebp
	ed8WlFp2w+hrFVVvDHnJfpgVtDFFGqEzm/FlXS/sKb8UkO1SL12fz888+ND16naFC8a8q66xZaHQj
	/SVkDiew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2DhV-000000057IC-3jbw;
	Tue, 08 Apr 2025 18:29:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Dad-000000055sF-0QsS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 18:22:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C8FFAA48FDE;
	Tue,  8 Apr 2025 18:16:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88A7CC4CEE8;
	Tue,  8 Apr 2025 18:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744136546;
	bh=ROS5jr/XnGZ06dtqqkVH5FTegaK3TD2euUktm9dfK+A=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=u4vKl6rvmfLdqWK4Kul+5+fDibO2yJ5yWaJFerR5uj8Kwks3J+wPO2DeDJgasR4cs
	 ls8MaNp8Ezu/I27KvuyKHIDmv9ucOgh0tYWU6FroXMZY8VJneGO6tvMXElp4X9cHPL
	 UyJ7sqxzMC2IPlEfnmbZD/KsEwNgve1ICU9l+AUg3iH6PqYUaj+r5fKov7uPb22Fgj
	 j30dXXdkGUnBEsXBqQpgp9mgEOJfDpqfCqensolvXKIFXZtOJto16LITogSgwqmbFU
	 oOaDomzF+9fw5c4ik5e14pmgZfq3CCsgrTrIss4+vQ7k4++Qdt7t6aSMrCO43QU7Wm
	 HJ29r5B5BebpA==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:09:58 +0100
Subject: [PATCH 5.15 v3 03/11] KVM: arm64: Discard any SVE state when
 entering KVM guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-stable-sve-5-15-v3-3-ca9a6b850f55@kernel.org>
References: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
In-Reply-To: <20250408-stable-sve-5-15-v3-0-ca9a6b850f55@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3562; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ROS5jr/XnGZ06dtqqkVH5FTegaK3TD2euUktm9dfK+A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn9WlN98cQ/PSAdnjHKGF2x/DeH/D/JoC7PCjo5IQz
 vy8RWU+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ/VpTQAKCRAk1otyXVSH0DySB/
 9phxVh+yQ1r2/VJPq78DO5XvJd9IID/lMbU4lEYeOwXylwsQWtN43or0QjkjMPjnX2pyBGCaE1T+AD
 Neht04TMqS+Fdrg8Y8jvuEtFY0KBT2S9a4ioZdpnaVeCXhvtPGXsCajBGJtwiLvJt8oSbrvt0gAVyk
 MG4krlmzmmn7+GffR1EAg+OTuoy/6w1atZldRfrh/mkWDIAHLLiu6tz4nrTD47CKo6s4IJrJCkrLmY
 I7X8/7muNEluxJXGX/X7CWtUEYbZ1c5TrpFc8J1tVVKSqZilOVWguyQ1a5zmLP3BMOFipST4qrd54f
 PKIGN/lgN76BgMMPzN5B6tnZcR3Ys8
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_112227_273780_4D9228AF 
X-CRM114-Status: GOOD (  17.95  )
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

[ Upstream commit 93ae6b01bafee8fa385aa25ee7ebdb40057f6abe ]

Since 8383741ab2e773a99 (KVM: arm64: Get rid of host SVE tracking/saving)
KVM has not tracked the host SVE state, relying on the fact that we
currently disable SVE whenever we perform a syscall. This may not be true
in future since performance optimisation may result in us keeping SVE
enabled in order to avoid needing to take access traps to reenable it.
Handle this by clearing TIF_SVE and converting the stored task state to
FPSIMD format when preparing to run the guest.  This is done with a new
call fpsimd_kvm_prepare() to keep the direct state manipulation
functions internal to fpsimd.c.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221115094640.112848-2-broonie@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
[ Mark: trivial backport to v6.1 ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 23 +++++++++++++++++++++++
 arch/arm64/kvm/fpsimd.c         |  4 +++-
 3 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 9a62884183e5..f7faf0f4507c 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -44,6 +44,7 @@ extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
 extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
+extern void fpsimd_kvm_prepare(void);
 
 extern void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *state,
 				     void *sve_state, unsigned int sve_vl);
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e22571e57ae1..57e89361edcb 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1108,6 +1108,29 @@ void fpsimd_signal_preserve_current_state(void)
 		sve_to_fpsimd(current);
 }
 
+/*
+ * Called by KVM when entering the guest.
+ */
+void fpsimd_kvm_prepare(void)
+{
+	if (!system_supports_sve())
+		return;
+
+	/*
+	 * KVM does not save host SVE state since we can only enter
+	 * the guest from a syscall so the ABI means that only the
+	 * non-saved SVE state needs to be saved.  If we have left
+	 * SVE enabled for performance reasons then update the task
+	 * state to be FPSIMD only.
+	 */
+	get_cpu_fpsimd_context();
+
+	if (test_and_clear_thread_flag(TIF_SVE))
+		sve_to_fpsimd(current);
+
+	put_cpu_fpsimd_context();
+}
+
 /*
  * Associate current's FPSIMD context with this cpu
  * The caller must have ownership of the cpu FPSIMD context before calling
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 24734bfcfaa0..16e29f03dcbf 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -70,12 +70,14 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 {
 	BUG_ON(!current->mm);
-	BUG_ON(test_thread_flag(TIF_SVE));
 
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
+	fpsimd_kvm_prepare();
+
 	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
+
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;
 }

-- 
2.39.5


