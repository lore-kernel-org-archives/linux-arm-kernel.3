Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32B2FC5516D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 12:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DulmpQOh2UwOXi3qlin3hjgVoAUJhkyK/puVXl2lmtE=; b=JPvgPTyK5bku0jTbnFJXnWyr4d
	kaVwR2vnfhR9y3I4GOJl9ooZ7othT7H4NGSCagDM9tea6xngkmiwgJ8SDFH+BcAJMcgsa4QM97pdx
	9dPUiy+F9zlXlXYRDwzABdiWQRea62OBwZOpZMRSGf/Z4wESd+V64uGoCDWHQP5c6n1FgYosZpnaK
	zz4VmN+AefTRaIMxcttebeCzOuIFOajUpyi68CDUqmMoawCd8iUiY0qhduej1rdsbr5K6bjGDb8Ta
	XCNhQYVhEIjvTlbLYRrTDH2a+ISj+37u/ZQjgbaJmTJTDtyHapukd2YhbLXeE+wnexXBe2ZAvaUqO
	kh95IOcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmVL-0000000CUvE-3leJ;
	Fri, 31 Jul 2026 12:38:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpmUo-0000000CUeM-34jE
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 12:37:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32136600BB;
	Fri, 31 Jul 2026 12:37:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2358A1F000E9;
	Fri, 31 Jul 2026 12:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785501469;
	bh=DulmpQOh2UwOXi3qlin3hjgVoAUJhkyK/puVXl2lmtE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=DWqefNuDYtjWMhrifW0Eb2LdDbwmGQWyVcEYKpjuCnyoqqaaZp5dRZc1WVT4EwSSc
	 TTh/aRuCdnO4VZykEN3aAiMALM26IzCkrldjjKol/cxhDbwH2BQlOAabvhpFULxQrZ
	 Hlp5voj0CctVE0RqpgQcIb+bjA0ZjNxl6twJhCtEuV/H6KX1MqTE0uNPaOomo74cEK
	 vTMYFOW8Q1NL/fpgpl9qj5REDsnIPF25kGPvvRSN6iqy/V31891cQBXZgU298fo0X4
	 MtGwC+VTihkcGhFplLo4lv613yRTaLE0DITLrZzZEsdJOIrZItr4wvviglUOydYT7w
	 NPT9bGGDxvJ+Q==
From: Mark Brown <broonie@kernel.org>
Date: Fri, 31 Jul 2026 13:25:44 +0100
Subject: [PATCH v17 06/14] KVM: arm64: Validate GCS exception lock when
 emulating ERET
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-arm64-gcs-v17-6-5e39ca01b14e@kernel.org>
References: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
In-Reply-To: <20260731-arm64-gcs-v17-0-5e39ca01b14e@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Shuah Khan <shuah@kernel.org>, Fuad Tabba <tabba@google.com>, 
 Oliver Upton <oupton@kernel.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3924; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZU9mNb8TUUW8fTZnFvfc37aP+mNNUc8as/YCprUO5Nc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqbJcAJ7Xlro9QT3wfMMvUtJSebZWgSwU26XoTN
 Eb47F9QX5CJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCamyXAAAKCRAk1otyXVSH
 0BSgB/90u4JgRL9VO1bf5DnualRUsnfIW+RIKz8rKYbBg7okLiCrCjhe+QI7Ox/mNSQe7YsYryx
 n9YUUrEpe0SV05qOuaBoHYGd/PPspFETHumIMEvOz90lai5UvhRNouvRmmLO8qoPhzdfNmXQZv/
 34z6+fF1WX807IhTtp/ZxatzJZcS0itrbY/sT07NxdVfO1ZgO6Uh/G3F4NsBwklqxWjbTFcDz3U
 u+cZLELmn2Ag3riWrISvKUacKqrW7qrOOj+vc6AwBXPyTE0znGQLGfmyG7xZYiW6ZWipUL5Ikbr
 OwW57WR89HUjjwLOSPxmbZRTyA6wNBB65z7O6a3Y9C+Yja0T
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

As per DDI0487 R_TYTWB GCS adds an additional case where an illegal
exception return can be generated. If all of:

 - PSTATE.EXLOCK is 0.
 - The EL is not being changed by the ERET.
 - GCSCR_ELx.EXLOCKEN is 1.

are true then the return is illegal. Emulate this behaviour when
emulating ERET for nested guests, while we're at it using the symbolic
definition for EXLOCK in SPSR.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 39 +++++++++++++++++++++++++++++++++++++
 arch/arm64/kvm/emulate-nested.c     |  5 ++++-
 arch/arm64/kvm/hyp/vhe/switch.c     |  4 ++++
 3 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 012d711034d1..b2343f67d15b 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -240,6 +240,45 @@ static inline bool kvm_auth_eretax(struct kvm_vcpu *vcpu, u64 *elr)
 }
 #endif
 
+#ifdef CONFIG_ARM64_GCS
+/*
+ * A subset of the pseudocode ELFromSPSR(), validity checks are
+ * assumed to have been done in code that is not GCS specific.
+ */
+static inline int exlock_el_from_spsr(u64 spsr)
+{
+	return FIELD_GET(GENMASK(3, 2), spsr);
+}
+
+/* See IllegalExceptionReturn() pseudocode */
+static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
+						   u64 spsr)
+{
+	u64 cur_el, target_el;
+
+	if (!kvm_has_gcs(vcpu->kvm))
+		return false;
+
+	if (vcpu->arch.ctxt.regs.pstate & PSR_EXLOCK_BIT)
+		return false;
+
+	cur_el = exlock_el_from_spsr(vcpu->arch.ctxt.regs.pstate);
+	target_el = exlock_el_from_spsr(spsr);
+
+	if (cur_el != target_el)
+		return false;
+
+	return read_sysreg_el1(SYS_GCSCR) & GCSCR_ELx_EXLOCKEN;
+}
+
+#else
+static inline bool kvm_check_illegal_exlock_return(struct kvm_vcpu *vcpu,
+						   u64 spsr)
+{
+	return false;
+}
+#endif
+
 #define KVM_NV_GUEST_MAP_SZ	(KVM_PGTABLE_PROT_SW1 | KVM_PGTABLE_PROT_SW0)
 
 static inline u64 kvm_encode_nested_level(struct kvm_s2_trans *trans)
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index b32742d9dd73..0f0723f22000 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2740,10 +2740,13 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 	 * - trying to return to an illegal M value
 	 * - trying to return to a 32bit EL
 	 * - trying to return to EL1 with HCR_EL2.TGE set
+	 * - GCSCR_ELx.EXLOCKEN is 1 and PSTATE.EXLOCK is 0 when attempting
+	 *   to return from ELx the same EL.
 	 */
 	if (mode == PSR_MODE_EL3t   || mode == PSR_MODE_EL3h ||
 	    mode == 0b00001         || (mode & BIT(1))       ||
 	    (spsr & PSR_MODE32_BIT) ||
+	    kvm_check_illegal_exlock_return(vcpu, spsr) ||
 	    (vcpu_el2_tge_is_set(vcpu) && (mode == PSR_MODE_EL1t ||
 					   mode == PSR_MODE_EL1h))) {
 		u64 mask;
@@ -2770,7 +2773,7 @@ static u64 kvm_check_illegal_exception_return(struct kvm_vcpu *vcpu, u64 spsr)
 
 		mask = PSR_MODE_MASK | PSR_MODE32_BIT;
 		if (kvm_has_feat(vcpu->kvm, ID_AA64PFR1_EL1, GCS, IMP))
-			mask |= BIT_ULL(34);	/* PSTATE.EXLOCK */
+			mask |= PSR_EXLOCK_BIT;
 
 		spsr |= *vcpu_cpsr(vcpu) & mask;
 		spsr |= PSR_IL_BIT;
diff --git a/arch/arm64/kvm/hyp/vhe/switch.c b/arch/arm64/kvm/hyp/vhe/switch.c
index bbe9cebd3d9d..e09d9a425689 100644
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -371,6 +371,10 @@ static bool kvm_hyp_handle_eret(struct kvm_vcpu *vcpu, u64 *exit_code)
 		return false;
 	}
 
+	/* Push GCS exception lock failures into the slow path */
+	if (kvm_check_illegal_exlock_return(vcpu, spsr))
+		return false;
+
 	/* If ERETAx fails, take the slow path */
 	if (esr_iss_is_eretax(esr)) {
 		if (!(vcpu_has_ptrauth(vcpu) && kvm_auth_eretax(vcpu, &elr)))

-- 
2.47.3


