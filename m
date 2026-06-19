Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FFCCD98F6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Jun 2026 07:05:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lWlZcW5gocf23/J+R+I6tOG13UyKgx7kXKNby8lhWlE=; b=FPEeN9pwRflTUU4U4xzeuFiSeG
	yF4oxWDPOWaYWKUqNOxmXChq+RYVpAnNOz2e+3EzLOK5oUvH1LjIzysIdPDW3h5Il6HUE9oHEccoU
	K7WPA5xxb3+997UNETlbs05AP37kJJQjBt56iIC7kK6WbIqQ8sGWSPgSEQD6juqZg6FVFMALp1ck4
	+JaavFVYBjuVKVynv6huM5o1rhwZBQKKD8XTOuD+NxgSyWpEl0gDVyP46On/BEMtOLMfa6oP7EwXB
	TMEtU41m6f8+W5W2feHAaic35bnhaH/E7fZmS33tziHdlQd9YkqyB1iVHHkNT+l9LZMZ5r1QXEgGV
	d/4p+n9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHy-000000024SU-3Zbh;
	Fri, 19 Jun 2026 07:05:18 +0000
Received: from mail-wr1-x44a.google.com ([2a00:1450:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waTHu-000000024PE-33Oc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Jun 2026 07:05:15 +0000
Received: by mail-wr1-x44a.google.com with SMTP id ffacd0b85a97d-46011aa5000so960371f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Jun 2026 00:05:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781852712; x=1782457512; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lWlZcW5gocf23/J+R+I6tOG13UyKgx7kXKNby8lhWlE=;
        b=vi05PhTOG32CdPeBzMAauyNJzBrqtT2Dz8dvXtVmLJIiQB+QsFH7H+vNI/ZJCI0zqJ
         3Jp8wdYcLYL4inSooNn38ijZ/oT54Aj4KC642zgZFb/uxoEyMALWt9c8IDl7rmY+th6E
         821AP3PKxIScbw4GClpOQSqRJxOo3MmkBGIWWyLZbheDmPEinYyS0qkXDtBMU3s7sZnY
         Gxi9cOiWz51wKQ8K9fdesaZjxyN3LXZhZis79MQAZW25382fJ1FZK+tw7Gum7tgWNi+M
         sYsnglHgnKCWHjoYsQakbXnphWYKu5zBPVyARIcvevch86+J+x7d/evBupygYoh1BqeT
         VQ7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781852712; x=1782457512;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lWlZcW5gocf23/J+R+I6tOG13UyKgx7kXKNby8lhWlE=;
        b=qWprmaJHjpOL83GlrgN97iYb3w9ILtsivt9kH+7HzHO91YxwED5YTudcI7HNFUFfcY
         IpvR6T0skP/M2O3voSylDNHdE/g+Szm4/QI4jT0sLK9gBzTZdjbiEa+n3SYbJgRaRlt9
         ql3gLdF8U7aMMIPt0t9TeBHCz0PfsLMAswbbdJMy3Rmjvde9S9+4HB0PoPFuKwvF1OcP
         hmuZ8UxoYFkXCs0pn4KazlF8MddRdAdzY93C2yHGPD2pQp8ls3474sMVOngHHXMwrRr+
         XRZ5snIWEiwHYsKusPP6QVhB+avi4q8ZauUJcKeGpllOn5JIcnrj4gmaRLfYXHSUKSyl
         jqrw==
X-Forwarded-Encrypted: i=1; AFNElJ+hlwR8NcYL+e0YRL/9KyT7MTvsSOUk9mQaPl0M89y3X2v+WGEPyLvf5VkwWVQKsk8ov2ByfrScBi03t2zVxNr8@lists.infradead.org
X-Gm-Message-State: AOJu0YwaCKwc5xV0zzM7BL0W1PtIx27eKl04THCymhY9IiJ4nSfEiBAr
	qKaPl91LODCGmN/f5P3EeOcGmTBxgw/PYbukK1GZNX4jJE4wSWlXKFLxB6vbvPZLASw5afG3nok
	ktA==
X-Received: from wmpd18.prod.google.com ([2002:a05:600c:4c12:b0:48e:6f63:7624])
 (user=tabba job=prod-delivery.src-stubby-dispatcher) by 2002:a7b:c384:0:b0:490:b642:ce31
 with SMTP id 5b1f17b1804b1-4923ef53bcemr32354745e9.2.1781852712103; Fri, 19
 Jun 2026 00:05:12 -0700 (PDT)
Date: Fri, 19 Jun 2026 08:05:02 +0100
In-Reply-To: <20260619070508.802802-1-tabba@google.com>
Mime-Version: 1.0
References: <20260619070508.802802-1-tabba@google.com>
X-Mailer: git-send-email 2.55.0.rc0.738.g0c8ab3ebcc-goog
Message-ID: <20260619070508.802802-3-tabba@google.com>
Subject: [PATCH 2/8] KVM: arm64: Make vcpu_{read,write}_sys_reg available to
 HYP code
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
X-CRM114-CacheID: sfid-20260619_000514_794957_B34F2DBD 
X-CRM114-Status: GOOD (  13.03  )
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


