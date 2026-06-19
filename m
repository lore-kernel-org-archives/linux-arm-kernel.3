Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA57CD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWlZcW5gocf23/J+R+I6tOG13UyKgx7kXKNby8lhWlE=; b=r6lb/bjvz1B3k/RjsScQvIF605
	D/eSs9a3sOlskVPv5xSCow8WBP1TcqGaRmREe0NFyHJ6H3n+Rnz/6JIGbVp339oaB4tBgMYjmbaHP
	B2A7PwGF9v4izj5KXiGsZvSspEZv6fM9HZjWJMJIUnWcBdF8e3a1FKXWk6q2RFdAeTA+AbyVDHBWI
	1WdELst+7DOp6kC/4dp7t/cgktWsxuBSLthZFW3AE+U4wJ7VJhO6tXBWAw7vJU/j9yjvr6TrkQKQp
	ZZkrywOE7UFog7P2aC/y2iCcLtYXBLmgz7N9buIC10pq/bUHP7irGbjQ1Sak+4pkg9Jf3WkGFi6hu
	qoOls0QA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK5-000000025IL-3Mhe;
	Fri, 19 Jun 2026 07:07:29 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTK1-000000025E7-3dxM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:07:28 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-462c1cf9003so1624921f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852843; x=1782457643; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWlZcW5gocf23/J+R+I6tOG13UyKgx7kXKNby8lhWlE=;
        b=rK0xFNo3r+Bm64PHs9d9oHyMpfTSCyzwulNIJTSJ+4GBx5ok2dKFDScSTdZobXmhfe
         pKGAFOhnS981IAoqk6jdm7U+23shidhJqAR9zxzJRnrXG9Qx98YJHg7OvwHjVr12Zabm
         M8eSRwWr4/FBI2HYTMVLGppnJOCJ8+B3GcugZFS72EHTNMOvbW6u4fXc1u7eppwBwsud
         Ub44wSIHrJcOz0dx8TVFJYsD9KZJSeV0EH94DZaiDGP8aWMsaZSDahx+DtLpttjDd3MG
         j9TUvzQAxi299PDGgr9xlJmvgGfIOX8+Vw2lIXYhAE73eZXTgKVl43Wg/09Urcj6RzFm
         21KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852843; x=1782457643;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWlZcW5gocf23/J+R+I6tOG13UyKgx7kXKNby8lhWlE=;
        b=fiuL/jK7tA9Y7+5eTOVS/TWANdyDo3r1EHNRyCT7ZOS0iX18pTCc2URZjLG5soicYC
         HIaNtLp/0RQ7KX+wjvymnl04kMGLZr7BX47Bo3n83Qa6OFAGvy8aMFRf+HkbPmix/qfL
         ZvCX42n/POS6OboaxvB7MUxvoQqjia7J8XMAX3C3KvnnEbxUAYUuVHavQTtJaede5yYH
         Qd0fRRn+UA0PG17vDS0TAWJ95rbEPUsSC/LTb8WvGWixtJwGj66EhaF7Ctb/ASLGWBIG
         Hdjy3f17FEo2YGgAtxHTODTRtP/qJk2uGbxVGk1XlT1nnmZn0I6pBnaOwWsSWgY/gaWU
         XYVA==
X-Forwarded-Encrypted: i=1; AFNElJ87Y9wbh/K5l+wfXm7oWisf+bY+AelNmqOT0lW4JFCWtZb9+8R3HjigAtth9BL/j5ktyjbYA3+t/lUQD1U67A79@lists.infradead.org
X-Gm-Message-State: AOJu0Yxz3jxFdStyZp7+c19O/kpcCO8G6ocEX+kLTq6+34hCkN2fsJO7
	0JwfQD3OBpjYDGOYfviUyzPzCEpqxS7g/XhEFm+UqE/4gtnkid7YiHXFgE+JKPQczaRtGDhJSg0
	I2Q==
X-Received: from wrcl8.prod.google.com ([2002:a5d:5268:0:b0:460:18c0:dfeb])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:38d:b0:43b:5b25:67f8
 with SMTP id ffacd0b85a97d-4656dff1fa8mr1790919f8f.20.1781852842970; Fri, 19
 Jun 2026 00:07:22 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:07:13 +0100
In-Reply-To: <20260619070719.812227-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070719.812227-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070719.812227-3-tabba@google.com>
Subject: [PATCH v2 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg available
 to HYP code
From: Fuad Tabba <tabba@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Quentin Perret <qperret@google.com>, 
	Sebastian Ene <sebastianene@google.com>, Hyunwoo Kim <imv4bel@gmail.com>, 
	Fuad Tabba <tabba@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260619_000726_999974_87F92F69 
X-CRM114-Status: GOOD (  13.19  )
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

The vcpu_{read,write}_sys_reg() accessors are host-only, so helpers
built on them such as kvm_vcpu_set_be()/kvm_vcpu_is_be() cannot be
shared with hyp code. exception.c already wraps them in
__vcpu_{read,write}_sys_reg(), which pick the host- or hyp-side accessor
via has_vhe() and so are valid in any context.

Move those wrappers to kvm_emulate.h as kvm_vcpu_{read,write}_sys_reg()
and switch the callers over, so a follow-up series can share that
emulation code at EL2.

No functional change intended.

Signed-off-by: Fuad Tabba <tabba@google.com>
---
 arch/arm64/include/asm/kvm_emulate.h | 22 +++++++++++++++---
 arch/arm64/kvm/hyp/exception.c       | 34 ++++++++--------------------
 2 files changed, 28 insertions(+), 28 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
index 5bf3d7e1d92c..80b30fead3d1 100644
--- a/arch/arm64/include/asm/kvm_emulate.h
+++ b/arch/arm64/include/asm/kvm_emulate.h
@@ -506,6 +506,22 @@ static inline unsigned long kvm_vcpu_get_mpidr_aff(struct kvm_vcpu *vcpu)
 	return __vcpu_sys_reg(vcpu, MPIDR_EL1) & MPIDR_HWID_BITMASK;
 }
 
+static inline u64 kvm_vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
+{
+	if (has_vhe())
+		return vcpu_read_sys_reg(vcpu, reg);
+
+	return __vcpu_sys_reg(vcpu, reg);
+}
+
+static inline void kvm_vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
+{
+	if (has_vhe())
+		vcpu_write_sys_reg(vcpu, val, reg);
+	else
+		__vcpu_assign_sys_reg(vcpu, reg, val);
+}
+
 static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
 {
 	if (vcpu_mode_is_32bit(vcpu)) {
@@ -516,9 +532,9 @@ static inline void kvm_vcpu_set_be(struct kvm_vcpu *vcpu)
 
 		r = vcpu_has_nv(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
 
-		sctlr = vcpu_read_sys_reg(vcpu, r);
+		sctlr = kvm_vcpu_read_sys_reg(vcpu, r);
 		sctlr |= SCTLR_ELx_EE;
-		vcpu_write_sys_reg(vcpu, sctlr, r);
+		kvm_vcpu_write_sys_reg(vcpu, sctlr, r);
 	}
 }
 
@@ -533,7 +549,7 @@ static inline bool kvm_vcpu_is_be(struct kvm_vcpu *vcpu)
 	r = is_hyp_ctxt(vcpu) ? SCTLR_EL2 : SCTLR_EL1;
 	bit = vcpu_mode_priv(vcpu) ? SCTLR_ELx_EE : SCTLR_EL1_E0E;
 
-	return vcpu_read_sys_reg(vcpu, r) & bit;
+	return kvm_vcpu_read_sys_reg(vcpu, r) & bit;
 }
 
 static inline unsigned long vcpu_data_guest_to_host(struct kvm_vcpu *vcpu,
diff --git a/arch/arm64/kvm/hyp/exception.c b/arch/arm64/kvm/hyp/exception.c
index bef40ddb16db..2cb68dc7d441 100644
--- a/arch/arm64/kvm/hyp/exception.c
+++ b/arch/arm64/kvm/hyp/exception.c
@@ -20,22 +20,6 @@
 #error Hypervisor code only!
 #endif
 
-static inline u64 __vcpu_read_sys_reg(const struct kvm_vcpu *vcpu, int reg)
-{
-	if (has_vhe())
-		return vcpu_read_sys_reg(vcpu, reg);
-
-	return __vcpu_sys_reg(vcpu, reg);
-}
-
-static inline void __vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
-{
-	if (has_vhe())
-		vcpu_write_sys_reg(vcpu, val, reg);
-	else
-		__vcpu_assign_sys_reg(vcpu, reg, val);
-}
-
 static void __vcpu_write_spsr(struct kvm_vcpu *vcpu, unsigned long target_mode,
 			      u64 val)
 {
@@ -101,14 +85,14 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
 
 	switch (target_mode) {
 	case PSR_MODE_EL1h:
-		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL1);
-		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
-		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
+		vbar = kvm_vcpu_read_sys_reg(vcpu, VBAR_EL1);
+		sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+		kvm_vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL1);
 		break;
 	case PSR_MODE_EL2h:
-		vbar = __vcpu_read_sys_reg(vcpu, VBAR_EL2);
-		sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL2);
-		__vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
+		vbar = kvm_vcpu_read_sys_reg(vcpu, VBAR_EL2);
+		sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL2);
+		kvm_vcpu_write_sys_reg(vcpu, *vcpu_pc(vcpu), ELR_EL2);
 		break;
 	default:
 		/* Don't do that */
@@ -185,7 +169,7 @@ static void enter_exception64(struct kvm_vcpu *vcpu, unsigned long target_mode,
  */
 static unsigned long get_except32_cpsr(struct kvm_vcpu *vcpu, u32 mode)
 {
-	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+	u32 sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL1);
 	unsigned long old, new;
 
 	old = *vcpu_cpsr(vcpu);
@@ -281,7 +265,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
 {
 	unsigned long spsr = *vcpu_cpsr(vcpu);
 	bool is_thumb = (spsr & PSR_AA32_T_BIT);
-	u32 sctlr = __vcpu_read_sys_reg(vcpu, SCTLR_EL1);
+	u32 sctlr = kvm_vcpu_read_sys_reg(vcpu, SCTLR_EL1);
 	u32 return_address;
 
 	*vcpu_cpsr(vcpu) = get_except32_cpsr(vcpu, mode);
@@ -305,7 +289,7 @@ static void enter_exception32(struct kvm_vcpu *vcpu, u32 mode, u32 vect_offset)
 	if (sctlr & (1 << 13))
 		vect_offset += 0xffff0000;
 	else /* always have security exceptions */
-		vect_offset += __vcpu_read_sys_reg(vcpu, VBAR_EL1);
+		vect_offset += kvm_vcpu_read_sys_reg(vcpu, VBAR_EL1);
 
 	*vcpu_pc(vcpu) = vect_offset;
 }
-- 
2.55.0.rc0.738.g0c8ab3ebcc-goog


