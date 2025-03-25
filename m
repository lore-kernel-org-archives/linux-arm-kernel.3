Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C35FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 18:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDv9SQMiqk1RJja6matbXopI2J0AZypIoeZZWI8SWog=; b=hCUg25gR8YyFM/Xabam8SexAHf
	9sH5ijvN9POcqrdVSh7LrL27ce+8fBgGAo0vLiRAyA0J3+My9ZJWElY95iRFupl8K68FxA7V+W66W
	3Ma3N/mF1mMQe1aTt9Q4v42UiB4HmZheFbI6rXc+PFl1PFAi7R7kiRbqAcqA09UyfCUQuUJMG3nut
	y7HKdPOJe4A2S15aO96D+g2B7UYSH/5JJtbPY4q09JJgqYmojJgvY21owiM/tvUFxUaYwAFa1gRLL
	b7LHKDEMu7GUJgTPjAE7/5A+ICExkK+Xau0D2xLi16msZZ7BGdJ0H/yYu+KzGw4zHIEO0YdjX7V22
	WKTKCF8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9Of-00000006m5f-32z3;
	Tue, 25 Mar 2025 18:53:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx9L9-00000006lSu-2s49
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 18:49:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 05D3344169;
	Tue, 25 Mar 2025 18:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B756C4CEED;
	Tue, 25 Mar 2025 18:49:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742928567;
	bh=0wZD1ab5TO+w2Ej5vIOOKImo8bpRJRJoaeHESF6d4s4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=uQ3BM6xZepRTGPPK2Qde1EkIB7IwgpIVmiZzx1dxkSPnuvwyy+gtW8WzvZeZ9i8MJ
	 zUm1638yX1w0yU9O2BvKzRmVJdnbo+sFJZFru1L9r5Xw2HXwtRDD8TRp+IH8z/8n5b
	 m1sNBTGVLsI1zoZTKZS2262+P7xYd20vbmOyaeyl9O/knN/3LOnr0ZOiPgx9ZMQycp
	 zX4kQ0NvhFJ17uZmEIygSg9/FlVmNRQ6yllxmirvaBzpcCGS0PKJFqiI1MupZ4Nwv9
	 2nT7oF1CK8RBluc7EPO7uTTiIorbtsuwimpCwIP+bRNj4JcuTeXvM594svAzBUjIoQ
	 46iqXoLzxM46w==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 25 Mar 2025 18:48:15 +0000
Subject: [PATCH 6.1 01/12] KVM: arm64: Discard any SVE state when entering
 KVM guests
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250325-stable-sve-6-1-v1-1-83259d427d84@kernel.org>
References: <20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org>
In-Reply-To: <20250325-stable-sve-6-1-v1-0-83259d427d84@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu, 
 Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=3615; i=broonie@kernel.org;
 h=from:subject:message-id; bh=0wZD1ab5TO+w2Ej5vIOOKImo8bpRJRJoaeHESF6d4s4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBn4vqmXOmzyfYfFmo1l4WAEnJzOI3rteuXYec1pLdd
 ewvqq7qJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZ+L6pgAKCRAk1otyXVSH0E5cB/
 4ifaIngkyoUUP5qxoc9RuZTmxVgeC+XqbQNlO0NdZ3NvpJRsSojOptus30VHnBgvJx+2g4BiE0AulL
 BtBrMr6JnF690NmTMjjdyKUkTThSsQ+uGexsNK2davGm096nvzayXyzH3li0ZspDdXBqPHeWyk38hy
 oNSiyEX3oRjA2ouYbG5NzE+5P2TyjvdnBquGJzU54CrOAmoAnhN3essfZopVY1cBsQGecosfHs9ThC
 KCg9hXRO5ET/+HqKsF+GDLM8oMOB/epK38rIkso/kDn7sAdaQTr1Ps8WYcMTns+q5e2vw6dDsAp6dT
 Mcpje4+NHagHHv5KkFai9GIsInibZ+
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_114931_769493_D4215343 
X-CRM114-Status: GOOD (  17.32  )
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
index 930b0e6c94622a0ce446577b397ff9ba3f2f60e8..3544dfcc67a1eccc12bdff22347e40c378f4ca6b 100644
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
index 43afe07c74fdf86b8f4497058db40a58158b9bd8..1dc4254a99f25289278b83965946e09674ad4e75 100644
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
index ec8e4494873d412382a795691220fe55d229858e..51ca78b31b95241bb8186a473d1bf5ccd50a16f0 100644
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


