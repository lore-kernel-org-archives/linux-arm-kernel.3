Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F039C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:31:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOVL8MOgkuj0skPcEnzgKQh5bWA5BQ52Ev/ezVYuAdA=; b=F6J/KDQ1QkXbKfgAuo8vI5+qWs
	oOF7wLTZ+nyAu1lmoPLrRbgnfK9O9W/TGa+F0BpQdwLahCMKsuwlmK3Tr3tlY+9CHTROC5P50JKg/
	NMl9HYabh5eboHlLHC9Pl0o2kPQCHz67qzfSQSzCNlLzFOG+O78xFJG8k+uJcmdvB6DCfQyBx5GGL
	TespL7SwORgLob1bHT31eHGg2tO+T8w90qrGT4WSUpQbuFwyjP3wfZdjubKyJwtFuEXW8oLmS2UaV
	Oi13FF9PAUlP26ydb94+bV4PQzqmhWvx5LuyEvtf3Jss9tNXYYJjR43f/XMgIQ4TaLn37bs4zLy9M
	VbAmseoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0h8O-0000000Bpo5-0UwW;
	Fri, 04 Apr 2025 13:31:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0h54-0000000Bp7M-27UB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:27:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 82A2044B94;
	Fri,  4 Apr 2025 13:27:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93EEDC4CEE8;
	Fri,  4 Apr 2025 13:27:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743773249;
	bh=U9ohMsi/C5NsIEyWu6dVbfAEv4pdOsK7cOsMN2eLlRY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EsDHOHuyu9xRSRhlrZCe6BEXlLM0Aiwt+DZc/ch4giSLGrDkMx20jgE96x25WNcCR
	 /ZaTKqoiMRoGhD+WHj/Jwmyn38BZi5XemNrR4Kx/mTpVEJ26+8jdtcd1pxmUzy7uKF
	 STHgXKB1B4a+DOlHJmP1OIDu9fZJVCX7dJWy0Y8uU9O5+oHpzrhWjd/tsKjZJSM5pW
	 XcYnHzXsc1amP0MRFF4kDy26mWBeM7GcOA7DwhImmltxkosIomc5nG3IgiVJlifNHs
	 pD3DQdNsoG8MXQtrph/yWe0xtaczGIONmmOT/G2/RPIIF1j6JBO/XnvjRh6DmsEaAn
	 Q3naJx1Sdx5Hw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 04 Apr 2025 14:23:34 +0100
Subject: [PATCH RESEND 6.1 01/12] KVM: arm64: Discard any SVE state when
 entering KVM guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-stable-sve-6-1-v1-1-cd5c9eb52d49@kernel.org>
References: <20250404-stable-sve-6-1-v1-0-cd5c9eb52d49@kernel.org>
In-Reply-To: <20250404-stable-sve-6-1-v1-0-cd5c9eb52d49@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
 Mark Brown <broonie@kernel.org>, stable@vger.kernel.org, 
 Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3447; i=broonie@kernel.org;
 h=from:subject:message-id; bh=U9ohMsi/C5NsIEyWu6dVbfAEv4pdOsK7cOsMN2eLlRY=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhvT39/TefNePXTnn5MO2gvs2jrnCudmMR8X/Ny+9GXj9VIqw
 V7lrJ6MxCwMjF4OsmCLL2mcZq9LDJbbOfzT/FcwgViaQKQxcnAIwkZNM7P9jMw8x7wrY32NVrLv8YI
 zMGqH3LPyyTqYMBzy/XTLVFmrLKS+f9C1gnmdGzl5Dv/r1z3Q7/zgUmQqFMm29xOikE+exvzKuafpu
 udVf/p+bUsmj3l/Hc8FWyulE0ruyqFPTHb78/3SOn11XJY7p3hKNF1x2Zc9ELmT//Oah7PzgT9dWfj
 vWH66xPaX3tBPMn4YxPTzEb814wvOpy/UTj1ZtEzlz4JBtXlbkmQPev7aKzbzO+l/qlsx2Rre2GC0+
 iwcsLSz5kScOBJXx2cfUBJysueuVOqf2snSOTZkeu7hOW61937xDTx636FzW5WlWd2crue4352Vxm0
 +BtOYnUykdjS03dGcWGSYpKTsCAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_062734_590494_6E03056A 
X-CRM114-Status: GOOD (  17.27  )
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
 arch/arm64/kvm/fpsimd.c         |  3 ++-
 3 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 930b0e6c9462..3544dfcc67a1 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -56,6 +56,7 @@ extern void fpsimd_signal_preserve_current_state(void);
 extern void fpsimd_preserve_current_state(void);
 extern void fpsimd_restore_current_state(void);
 extern void fpsimd_update_current_state(struct user_fpsimd_state const *state);
+extern void fpsimd_kvm_prepare(void);
 
 extern void fpsimd_bind_state_to_cpu(struct user_fpsimd_state *state,
 				     void *sve_state, unsigned int sve_vl,
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 43afe07c74fd..1dc4254a99f2 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1643,6 +1643,29 @@ void fpsimd_signal_preserve_current_state(void)
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
index ec8e4494873d..51ca78b31b95 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -75,11 +75,12 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
 void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu)
 {
 	BUG_ON(!current->mm);
-	BUG_ON(test_thread_flag(TIF_SVE));
 
 	if (!system_supports_fpsimd())
 		return;
 
+	fpsimd_kvm_prepare();
+
 	vcpu->arch.fp_state = FP_STATE_HOST_OWNED;
 
 	vcpu_clear_flag(vcpu, HOST_SVE_ENABLED);

-- 
2.39.5


