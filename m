Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3FAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 13:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QfnobycwuzciDg9tgsHPHeb+xl7WNE+wVeJM9dmruDg=; b=H+VXhEcd92qGPDVWShEzkfn9wR
	XkC5WbKcWQVMFCwPeofvIfTPveKgzbhLejxe/cj22/Zn/oqrYGA8/0xuRmDgeaxpnhXLgkruJHTg/
	S7/eXS9hPNh58kLACfKSdOsU+mSMMMzncOENy1ALXn1PdyN0JJfajY/LQ66kS2IEDf4VfCv796UYz
	D0GO4VlQc5BBFAXDDkIaoKNwkgudiFRJodh/8wE7oUfA/lqQM8PqOcZiA2couLN3k+5AqwZtHPbDF
	A4hJf2VpOM4vYKV8NpTFduDvQH4NteQtArM7l0Ov6EOCQ72AWttirLJy+KoAOQn11LoaZmRYVyvxD
	DfS/lhow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0hDV-0000000BqjM-1BNn;
	Fri, 04 Apr 2025 13:36:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0h5A-0000000Bp9P-2wFf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 13:27:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A786745060;
	Fri,  4 Apr 2025 13:27:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ADDEC4CEED;
	Fri,  4 Apr 2025 13:27:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743773260;
	bh=4VF5KHNGR8pAFy/QCy5ziE4tio3jSPNyk9q/Tymigz0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Q/Aprl38znGI4/+PHdXyCSj349psoGfqd2TmhKOuUZGkLxW0P2EHxsOkgbZ1JKYfi
	 SUyEKQfUe6wg0uypgWmfInNFSxOJjo8YxcnDDSkupJV6eWDb2AZ2t0zN4Mzfguzpiq
	 hr9Ta41+Z3OPwv066eAq17VSOfUNntG0Dt9hp+aN9iAWdDz2R+FyDB+udg9kO0HhO/
	 aRxq7TsJOBdipi9Nrt0vc952xEgJN8Z/NdWsmiEsOi1QTBiE2Jzs6GiOx95DScISSz
	 m2fbb4uuKaUXHEz/2arM1A/fb5sPs/bekXYEYlF7BOkd1GTH5xpdaYXGjcqwKE9TAQ
	 5QzK32Xeyy+kA==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 04 Apr 2025 14:23:37 +0100
Subject: [PATCH RESEND 6.1 04/12] arm64/fpsimd: Stop using TIF_SVE to
 manage register saving in KVM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250404-stable-sve-6-1-v1-4-cd5c9eb52d49@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3100; i=broonie@kernel.org;
 h=from:subject:message-id; bh=4VF5KHNGR8pAFy/QCy5ziE4tio3jSPNyk9q/Tymigz0=;
 b=owGbwMvMwMWocq27KDak/QLjabUkhvT39wyOKrLvEp2bfsLho/Hd60opRd7tHWZ/YuV29Lq9VC1m
 4uzuZDRmYWDkYpAVU2RZ+yxjVXq4xNb5j+a/ghnEygQyhYGLUwAmclaB/X/Uy77E8sO8MWYrcjdIbj
 2yYj/zJZaijilH5378/yD8cYS+2Kx6i2sK5rJerUfyrES5Nx245ZSZKvym3VO9eK9+U/XTK11aFw6b
 CTlWFErU7D5axp2t7Fu2TaTXpuKOuiEbF8eXtpfnSr5NUPn2daHBbr60E0JrpWsCXyiIqUsXnBF2+q
 p3jNtan32V3+Wb3G4GM3ez/9hpsUrP7fnMp9VzA8xXMIelTnaZst5vR+npX3eK+WOvMqWpBfg4ril3
 npMvYndyw/JrHMyCTU3Lbs8NXphrrrhubrrlii1FKUfn8PCWOmSGhdX+nKhU7rjlx4P2VW0fPcQ4Na
 Ky+wzeX2M9p9pT6SqUyny67NsGAA==
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250404_062740_783196_65A5E867 
X-CRM114-Status: GOOD (  14.76  )
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

[ Upstream commit 62021cc36add7b2c015b837f7893f2fb4b8c2586 ]

Now that we are explicitly telling the host FP code which register state
it needs to save we can remove the manipulation of TIF_SVE from the KVM
code, simplifying it and allowing us to optimise our handling of normal
tasks. Remove the manipulation of TIF_SVE from KVM and instead rely on
to_save to ensure we save the correct data for it.

There should be no functional or performance impact from this change.

Signed-off-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20221115094640.112848-5-broonie@kernel.org
Signed-off-by: Will Deacon <will@kernel.org>
[ Mark: trivial backport ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/kernel/fpsimd.c | 22 ++++------------------
 arch/arm64/kvm/fpsimd.c    |  3 ---
 2 files changed, 4 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index 1f6fd9229e53..3fcacbce5d42 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -439,8 +439,8 @@ static void task_fpsimd_load(void)
  * last, if KVM is involved this may be the guest VM context rather
  * than the host thread for the VM pointed to by current. This means
  * that we must always reference the state storage via last rather
- * than via current, other than the TIF_ flags which KVM will
- * carefully maintain for us.
+ * than via current, if we are saving KVM state then it will have
+ * ensured that the type of registers to save is set in last->to_save.
  */
 static void fpsimd_save(void)
 {
@@ -457,27 +457,13 @@ static void fpsimd_save(void)
 	if (test_thread_flag(TIF_FOREIGN_FPSTATE))
 		return;
 
-	if (test_thread_flag(TIF_SVE)) {
+	if ((last->to_save == FP_STATE_CURRENT && test_thread_flag(TIF_SVE)) ||
+	    last->to_save == FP_STATE_SVE) {
 		save_sve_regs = true;
 		save_ffr = true;
 		vl = last->sve_vl;
 	}
 
-	/*
-	 * Validate that an explicitly specified state to save is
-	 * consistent with the task state.
-	 */
-	switch (last->to_save) {
-	case FP_STATE_CURRENT:
-		break;
-	case FP_STATE_FPSIMD:
-		WARN_ON_ONCE(save_sve_regs);
-		break;
-	case FP_STATE_SVE:
-		WARN_ON_ONCE(!save_sve_regs);
-		break;
-	}
-
 	if (system_supports_sme()) {
 		u64 *svcr = last->svcr;
 
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 89c02ce797b8..ec82d0191f76 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -151,7 +151,6 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 					 &vcpu->arch.fp_type, fp_type);
 
 		clear_thread_flag(TIF_FOREIGN_FPSTATE);
-		update_thread_flag(TIF_SVE, vcpu_has_sve(vcpu));
 	}
 }
 
@@ -208,7 +207,5 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcpu *vcpu)
 			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
-	update_thread_flag(TIF_SVE, 0);
-
 	local_irq_restore(flags);
 }

-- 
2.39.5


