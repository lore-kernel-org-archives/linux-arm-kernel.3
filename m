Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A40C369BD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Apr 2025 00:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lY+dMi2Vi0xi+Whr8lwT5y3p+ZC8oi8ZD/dxkLW0/6U=; b=dyYnxPdGXW+NYv7M6aYFZlt7tO
	H1t9PnIlpFinr8gT42VHkBxgVS4zAfcWH4cLeG61Ek58CG0ehVTXYKWpx5/1Oz5RkWYEnbBUKgd98
	zLgfGGs0CNka/IOen73fLihlVuuSmXX7e5dPhPMxyj45KETErRyVGjHCu6NdzAFsENSHuMol9SOAS
	X4xccXjDepz2lN3QUUU1pn5eEUIwz78mts0pQrU8c46rGDzy4oeIShTJzi2YLXKnZIOFCZWXr83Ex
	n5pbjkA86hCjVLVOR3+itVJYVBv7e/J0PtFD4C8EG6JFbhfId42iqWoAzMysKcCh2QPBQlEHukZxg
	ABwx87Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5DAR-0000000BIqD-47Et;
	Thu, 17 Apr 2025 00:31:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5D4j-0000000BGik-1nmp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Apr 2025 00:25:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B951849D6A;
	Thu, 17 Apr 2025 00:25:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD04C4CEE2;
	Thu, 17 Apr 2025 00:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744849552;
	bh=oRt3lYFMkjnSjiKx9sDZB+3QRpB709eowurjKxguJTA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Dzwy2xTcrjU/683hGez8zlDaDWQQ1RO+JDjpuMEFEQbpg6LgYMI6sKAm6Ocx8f1yC
	 i4t6zsBw4Co3avfBQygF3vWV3XABMgUUutilSyYAeNJPztsktNfzC23AZANlvJRqHG
	 lQr7k9v+oXrpMCYQT4NvncCRxlIJXimVyx4gUIWFxppNOUFrYb/kfTWl2zYno3jpv0
	 TkEkap7elGLzy/kguXUovRM07gZMmOPDayJ1Jy0TB82qFhDoaht51iF+xjR2ifAXK8
	 XXVj6dKupL17ahRoCccM1I+QXKzRyeueFNmK08JE4Jt58wYJnOFS7+qRdqdY9Pxpvx
	 c7tLbi0lH0tsA==
From: Mark Brown <broonie@kernel.org>
Date: Thu, 17 Apr 2025 01:25:06 +0100
Subject: [PATCH v5 02/28] arm64/fpsimd: Decide to save ZT0 and streaming
 mode FFR at bind time
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-kvm-arm64-sme-v5-2-f469a2d5f574@kernel.org>
References: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
In-Reply-To: <20250417-kvm-arm64-sme-v5-0-f469a2d5f574@kernel.org>
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
X-Mailer: b4 0.15-dev-c25d1
X-Developer-Signature: v=1; a=openpgp-sha256; l=3233; i=broonie@kernel.org;
 h=from:subject:message-id; bh=oRt3lYFMkjnSjiKx9sDZB+3QRpB709eowurjKxguJTA=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBoAEpwozZXsAd5qJB21CA4CiCtC30WEvhJ7v0tYfEB
 LUVgom+JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaABKcAAKCRAk1otyXVSH0D68B/
 9M69whFUWMXybJGWIhTbqH8+ujooutUhhbaK2hydw7hO46/aGqeqndM6p8RFHY1GvSsSF5wa0rjgkG
 CCZ9kYwIAksf54WacwaQ0QwTo7qDzLn3s7laitE06tg22cIY6B3HTWNbmXyr/b9DvKk0USDwzs8qbT
 oFLJUNDxoZYM/nLAzQvk/wbcDctkuiLuoZ22W6v5oLrneyLfqrJb3t0eyZSuj/aZlbPfr6n/fxWbFC
 8uHMEaK+rwzJu139FcqQCNF6JqDjK3B1QSQ/rdX87LZwEPo+S6wEu39p8cPDlvtuQnGaArHPK4zoHB
 ywHb4TIGRl2XmDiNgrtPN3fSrniwif
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_172553_522309_AF00E4EC 
X-CRM114-Status: GOOD (  18.41  )
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
index 8279565826ad..573bd6a219f2 100644
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -86,6 +86,7 @@ struct cpu_fp_state {
 	void *sme_state;
 	u64 *svcr;
 	u64 *fpmr;
+	u64 sme_features;
 	unsigned int sve_vl;
 	unsigned int sme_vl;
 	enum fp_type *fp_type;
diff --git a/arch/arm64/kernel/fpsimd.c b/arch/arm64/kernel/fpsimd.c
index d3a901afff72..266ce7a9f195 100644
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -474,12 +474,12 @@ static void fpsimd_save_user_state(void)
 
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
@@ -1660,6 +1660,12 @@ static void fpsimd_bind_task_to_cpu(void)
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
index 7f6e43d25691..7fc14b7349a0 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -106,6 +106,7 @@ void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu)
 		fp_state.svcr = &__vcpu_sys_reg(vcpu, SVCR);
 		fp_state.fpmr = &__vcpu_sys_reg(vcpu, FPMR);
 		fp_state.fp_type = &vcpu->arch.fp_type;
+		fp_state.sme_features = 0;
 
 		if (vcpu_has_sve(vcpu))
 			fp_state.to_save = FP_STATE_SVE;

-- 
2.39.5


