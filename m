Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D6EDC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 02:05:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eq7r6/NJ8dSXGIwqRHApE5WY2mIRtMgXU5KdgFzJOcA=; b=KwIWkPj7sAzp1Tz2zgZ2TAORs7
	1qC5HQRjhbWBZaxoB1D4YNP+WT71hZJSh0pMrSpKnWWPGDrf+gBWFhbPOlUsemcMQO4gbeqwKybiY
	vwFpT43TKQwSKWHnGBxjVJQ/rwsYHGxvti42gSqNTPVghXrSGD3A+zA3voTIUqpgc2eO1E+8aCzQr
	jw3XvZONWIZUgn1eVjpc4Z8J8JLduCHBZPY6TSSzdCYH/hxO8oDHVkQU+mKG9ky3B9Qq9BEmsCPuX
	JKDXZFX6zppRvZKh6A6hXC5VoEzuM7NT8xyLyAmxfSMIpkYRuzN6qxoCPR7ft92hli1aWOS+tW2al
	GI9tcrWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1til52-0000000DGoR-1HKO;
	Fri, 14 Feb 2025 02:05:24 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1til0s-0000000DF5O-1ayw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 02:01:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 53A475C5D23;
	Fri, 14 Feb 2025 02:00:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25E74C4CEE9;
	Fri, 14 Feb 2025 02:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739498465;
	bh=kqsWSKMkog4FhpAz4UkAy9DANv91balouV+4n5q8wvw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WBFzCyjUWdR9i0RBsxFj8RepbBZB6/rQNutHuG6YP9qGeAdpz3xbykfy54QAKo9+v
	 GAkCRbJ2tGLgffJTqXqyS7wKVgYQst3i8NHhmsYqBWwaun2LN0kGg7IJAOgk7uDt5f
	 FTNB3o2BVfIUu99u/DMHtyO5MK8t+J7m8XuNjHYcUlYIpmsEbYW+rKJcDfztYxp70C
	 5809xp0PldCSc0Be9wvjo5fke1cEGoIzFyiLGtEiPY8jIkJvHnkz3FC+LH6XyfDfMX
	 wDhTNpv8XEuVWfFZL1/hckj0jwm7LaK1HGl+XsazSfVlPjvAW8UOGM5s2voV0WdlnB
	 V5w02EgH3Xzuw==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 14 Feb 2025 01:57:45 +0000
Subject: [PATCH v4 02/27] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-kvm-arm64-sme-v4-2-d64a681adcc2@kernel.org>
References: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
In-Reply-To: <20250214-kvm-arm64-sme-v4-0-d64a681adcc2@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org, 
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3401; i=broonie@kernel.org;
 h=from:subject:message-id; bh=kqsWSKMkog4FhpAz4UkAy9DANv91balouV+4n5q8wvw=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnrqPCAAgt4h7/iRfuUhljXuxTDkKPZF4kwFB2WZBf
 keq+tKKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ66jwgAKCRAk1otyXVSH0ChcB/
 9uJEs/j2XAZMsPrKEEB9/z+ywg0/RE9AmpqtMg7DMJ54QYe+AE2+x30YqDWSY3r9VsK2iQrbqtNd2y
 WGjixjIP1JXD/MVpesuzgniC/wptvkVqd2kqWFbEBU4GHvFxuAY9kLgrS+2bxoKk1LkrSpstYhohKy
 Ya5j9JrnZEn4IwBpPHsOKT0XdsFs5wHwyysjq5LWICavmlxD22/4/LQGLPvoFq8Gxsvhp7MZlJcB2b
 yfWSgy9qTynBmneqku+hlJVbvTfhGrr3zZSbZqXdAkSPfBcYVT3dWwJd58MWPoXuLYXXnOxlJOLa8O
 NZtUP6Xy3lxMIileYs3YArCQYEYY81
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_180106_536939_E7DFD5A2 
X-CRM114-Status: GOOD (  18.62  )
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

Some parts of the SME state are optional, enabled by additional features
on top of the base FEAT_SME and controlled with enable bits in SMCR_ELx. We
unconditionally enable these for the host but for KVM we will allow the
feature set exposed to guests to be restricted by the VMM. These are the
FFR register (FEAT_SME_FA64) and ZT0 (FEAT_SME2).

We defer saving of guest floating point state for non-protected guests to
the host kernel. We also want to avoid having to reconfigure the guest
floating point state if nothing used the floating point state while running
the host. If the guest was running with the optional features disabled then
traps will be enabled for them so the host kernel will need to skip
accessing that state when saving state for the guest.

Support this by moving the decision about saving this state to the point
where we bind floating point state to the CPU, adding a new variable to
the cpu_fp_state which uses the enable bits in SMCR_ELx to flag which
features are enabled.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/fpsimd.h |  1 +
 arch/arm64/kernel/fpsimd.c      | 10 ++++++++--
 arch/arm64/kvm/fpsimd.c         |  1 +
 3 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/fpsimd.h b/arch/arm64/include/asm/fpsimd.h
index 95355892d47b3ec1c77a3ab19ccad0d7f9a8d621..144cc805bfea112341b89c9c6028cf4b2a201c6c 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -88,6 +88,7 @@ struct cpu_fp_state {
 	void *sme_state;
 	u64 *svcr;
 	u64 *fpmr;
+	u64 sme_features;
 	unsigned int sve_vl;
 	unsigned int sme_vl;
 	enum fp_type *fp_type;
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index e52ec18f0fcab0e34123b7a115e886fca3fae210..446a379d87539bb37a9d4eb7466a73d8819afc56 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -478,12 +478,12 @@ static void fpsimd_save_user_state(void)
 
 		if (*svcr & SVCR_ZA_MASK)
 			sme_save_state(last->sme_state,
-				       system_supports_sme2());
+				       last->sme_features & SMCR_ELx_EZT0);
 
 		/* If we are in streaming mode override regular SVE. */
 		if (*svcr & SVCR_SM_MASK) {
 			save_sve_regs = true;
-			save_ffr = system_supports_fa64();
+			save_ffr = last->sme_features & SMCR_ELx_FA64;
 			vl = last->sme_vl;
 		}
 	}
@@ -1697,6 +1697,12 @@ static void fpsimd_bind_task_to_cpu(void)
 	last->to_save = FP_STATE_CURRENT;
 	current->thread.fpsimd_cpu = smp_processor_id();
 
+	last->sme_features = 0;
+	if (system_supports_fa64())
+		last->sme_features |= SMCR_ELx_FA64;
+	if (system_supports_sme2())
+		last->sme_features |= SMCR_ELx_EZT0;
+
 	/*
 	 * Toggle SVE and SME trapping for userspace if needed, these
 	 * are serialsied by ret_to_user().
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index 3cbb999419af7bb31ce9cec2baafcad00491610a..f324990a400293976fd505442f9eaccc6d01ed8f 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -111,6 +111,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		fp_state.svcr = &__vcpu_sys_reg(vcpu, SVCR);
 		fp_state.fpmr = &__vcpu_sys_reg(vcpu, FPMR);
 		fp_state.fp_type = &vcpu->arch.fp_type;
+		fp_state.sme_features = 0;
 
 		if (vcpu_has_sve(vcpu))
 			fp_state.to_save = FP_STATE_SVE;

-- 
2.39.5


