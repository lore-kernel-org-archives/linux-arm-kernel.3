Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9EA8E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 16:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rSwzqWn/JPL8ZQQRXyuh4Wx6zhOYtp95KtVIr/TQVS4=; b=GoqioQi/5P3iiJLTimHnoV9CXB
	sZSE04GQAlhdyXxUPC/Ax1vVyTqVKugLVXhUHFqG+C9slg3CenuMXGHs8I2VHwxyzo/uEaHSv3PTE
	ZnE0aKrqmNqIsZ9aJws5RTSzcu/q5LcwuFXYDviP4RiqJeypWptlgScZvF/GfT5yEaxPgEOhJCBl5
	eQpYTGOQTck+lQBFR/xTT9ajbPKGqOnhzgOHdkTz3GYSsgZ87COuH1OvK7n7o/Dy82zrUjGq6rLmB
	rTL8E5ooeaX99v4sCJ+1/Mqpoo0obboI1Zc9V09CJeJ8vLmQB+ZQlt+VhHFZUA9osPfdCLFXxq4Po
	TtNFs9nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgHo-00000005WnV-0Mhe;
	Fri, 20 Dec 2024 16:55:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDU-00000005Vt7-1FQA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 20 Dec 2024 16:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=rSwzqWn/JPL8ZQQRXyuh4Wx6zhOYtp95KtVIr/TQVS4=; b=omaH2WFpHF94HKSXde/0+7M68/
	SxdJYq3/WtlQN+ktG1ySom38YJ+n8sf191BZuovlYLNRAWZMpHn7/myZSxUpJDKyuQhmRyXp6nN/K
	DICcnLwclYq34UCVjBDOic66Fm8SXMU+r4nqgR2pqtIsysbsGbmMIPF5pJWi8bNKQAghV3sbE8ufi
	aPFpmzOijoSmhQtS2oxp8baBoz6phcg3+dxdUeNoOA4n8/BvEfxCQQGOUVU808d4enBKcABAcAQvg
	qgC5BrKatkm7bXRWhlH1EgGszfxqbEHbykCN12Ym+jRq76gjNQ1k1ud/6lFb3N0X+uTGaIyBVlkHm
	hG8s97Lw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOgDR-00000005jQr-0kwk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 16:51:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EB14B5C66FF;
	Fri, 20 Dec 2024 16:50:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A804C4CECD;
	Fri, 20 Dec 2024 16:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734713461;
	bh=tNHHLZ/GUKR3zyLQMr9SmLccDJKFOywaygU53a8ORrU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=U0fMS7+sg4ObOs47tgUj0fJ6TvQ3m1eKtDUMQOgcNhgNYtgarH025ARgglxrkQ+G5
	 EVEq4J4DM2rO48CtxNBvZ6r6SCBrgs+K92FgefbzrWCLec/XnR4YbQSbMFN284x3Sz
	 SpqLlZEUVk7WIks5QIbfSIkyEP+kW9votWz62CfS4pC8RYL36fyMrAFwiLV4wGf7iK
	 Qb+RLAIeaC+M8hxAGz52UD00v5YPM+ZOeMcT9QMPzZWXnBtuYt3QuSC+QE7GmeP0Sw
	 lmEwoRR4W0mWrOWy4qI6IlLHSKZ2pA7QxWNKknKhxZZnubS+/ZUNHIisQSGEunWj6I
	 305q5yriDAmBg==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 20 Dec 2024 16:46:27 +0000
Subject: [PATCH RFC v3 02/27] arm64/fpsimd: Decide to save ZT0 and
 streaming mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-kvm-arm64-sme-v3-2-05b018c1ffeb@kernel.org>
References: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
In-Reply-To: <20241220-kvm-arm64-sme-v3-0-05b018c1ffeb@kernel.org>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
 Joey Gouly <joey.gouly@arm.com>, Catalin Marinas <catalin.marinas@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Will Deacon <will@kernel.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: Dave Martin <Dave.Martin@arm.com>, Fuad Tabba <tabba@google.com>, 
 linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
 linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3401; i=broonie@kernel.org;
 h=from:subject:message-id; bh=tNHHLZ/GUKR3zyLQMr9SmLccDJKFOywaygU53a8ORrU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBnZaBWsX7ZqoOdB4b5mGScOlPYolUX6HFXVv3II/y+
 il9/MEyJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ2WgVgAKCRAk1otyXVSH0CzoB/
 0b3XUZC1SIgcyr9aZTGKpBhSfDnj+lLwovphIWHJbmHxOLdeTpwX7t2E+7WHr3+fSGnQtllpadq5Xg
 inrHu99pLcZyW/J5cjYKX2MWKGZFy8O5iiWhsK+TOCAoafRsrz+9oiVh9yS5NPBG40xobgGIJhlxom
 qcyODonMbX+yhcoEB/mpdde0lGAc2zTXucrUmjNMHhHIPxwxgdC81HZP/6Y2pzpoLIYIMeDcZ2F1Em
 nW1dvtLh//GnK0DEbO5Rbh22K+6mRJWMJtDV6WJI6/kT3eg9mJGc8GuCXNJg8IjSFTqzgWrtlganth
 MZbZToJdR+xo9jlKj0GNdCPPLKsfiI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_165105_481040_6233802B 
X-CRM114-Status: GOOD (  17.96  )
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
index 92c085288ed2cbc4f51f49546c6abbde6ba891a3..7c66ed6e43c34d1b5e1cc00595c12244d13d3d0d 100644
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
@@ -1722,6 +1722,12 @@ static void fpsimd_bind_task_to_cpu(void)
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
index ea5484ce1f3ba3121b6938bda15f7a8057d49051..09b65abaf9db60cc57dbc554ad2108a80c2dc46b 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -138,6 +138,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		fp_state.svcr = &__vcpu_sys_reg(vcpu, SVCR);
 		fp_state.fpmr = &__vcpu_sys_reg(vcpu, FPMR);
 		fp_state.fp_type = &vcpu->arch.fp_type;
+		fp_state.sme_features = 0;
 
 		if (vcpu_has_sve(vcpu))
 			fp_state.to_save = FP_STATE_SVE;

-- 
2.39.5


