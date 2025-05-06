Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C083C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 22:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j22iHDMbOpCNZvTS7XoRGGnDdAk3cRORF/aI2NFwNQg=; b=WYmznoYc6zDD+n0tG7KoPYiS62
	b23pQCA3W3rEkhLE2rOI40DX0RI2VIjMcO60eFYiE3Oi/yWDkJ7DUK2EiR2sLVesnJeIQ70u0dtGm
	swrLz0qigd0xhFknn5pDo4a+c73rGysZrQxWtZeRlVH58hJemSHn1hqHwivpHSWvOvp88sQ3lSHe+
	TsU/Rkxqydyy+/2wRx9lmL5YwkhgBNyK6Cx12Z5H/fS9ws7k0A9kRGQ6vjeGPwzFkRxw7pTFfzDZp
	cqODPsSBpPEPNbz78EN270Jh7hZtLQOBck3tOyompJYvLr0Zi3PkXTGIMRqVTs6NeL0HKc1YFxBc+
	CM9ftkFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCQgt-0000000DWat-1M28;
	Tue, 06 May 2025 22:23:07 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCLOw-0000000CiJN-0ocd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 16:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 038D1A4D6F4;
	Tue,  6 May 2025 16:44:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0282C4CEEB;
	Tue,  6 May 2025 16:44:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746549853;
	bh=Y0zjLJEGkJrxaxp4SDctGpq7uyiWPRxobc1+3u1ZYhU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QnfE+Pn2iGJXtZ6akqbzwmun/WrXpt4zH3y1dzyi9zAIJNA73ndrUggFcMERtQnL8
	 nWWHuqeHUBRa/cPESclt9mqvKEr4ewKsubmLsMAJ6wTH6PHCxKqxjOnt45yo8gFM0Y
	 CaISxUeqDVq/Rnb4PmNdjf5oHdzMHgNMfI7aPV6/DEk98+ixFwtzl5GWvSLHNhzMiz
	 QNRxr7zVy7Mk8lH/RbDms6aAcHlwhixLwIq2+bpISilo7M+Av31TNi0Qx4bx0gzPnd
	 fs8M7C3TkQr6gvwQYqcX7dCgv8qEIoy6/FjSQDX2jOVl/tG3csh8Q3LwyzHcciZ40u
	 O2RNCGfiEsPZg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uCLOt-00CJkN-St;
	Tue, 06 May 2025 17:44:11 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ben Horgan <ben.horgan@arm.com>
Subject: [PATCH v4 25/43] KVM: arm64: Unconditionally configure fine-grain traps
Date: Tue,  6 May 2025 17:43:30 +0100
Message-Id: <20250506164348.346001-26-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250506164348.346001-1-maz@kernel.org>
References: <20250506164348.346001-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com, ben.horgan@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_094414_361184_0BA9AFE9 
X-CRM114-Status: GOOD (  11.71  )
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

From: Mark Rutland <mark.rutland@arm.com>

... otherwise we can inherit the host configuration if this differs from
the KVM configuration.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
[maz: simplified a couple of things]
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h | 39 ++++++++++---------------
 1 file changed, 15 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/kvm/hyp/include/hyp/switch.h b/arch/arm64/kvm/hyp/include/hyp/switch.h
index 027d05f308f75..925a3288bd5be 100644
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -107,7 +107,8 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 
 #define update_fgt_traps_cs(hctxt, vcpu, kvm, reg, clr, set)		\
 	do {								\
-		u64 c = 0, s = 0;					\
+		u64 c = clr, s = set;					\
+		u64 val;						\
 									\
 		ctxt_sys_reg(hctxt, reg) = read_sysreg_s(SYS_ ## reg);	\
 		if (vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu))		\
@@ -115,14 +116,10 @@ static inline void __activate_traps_fpsimd32(struct kvm_vcpu *vcpu)
 									\
 		compute_undef_clr_set(vcpu, kvm, reg, c, s);		\
 									\
-		s |= set;						\
-		c |= clr;						\
-		if (c || s) {						\
-			u64 val = __ ## reg ## _nMASK;			\
-			val |= s;					\
-			val &= ~c;					\
-			write_sysreg_s(val, SYS_ ## reg);		\
-		}							\
+		val = __ ## reg ## _nMASK;				\
+		val |= s;						\
+		val &= ~c;						\
+		write_sysreg_s(val, SYS_ ## reg);			\
 	} while(0)
 
 #define update_fgt_traps(hctxt, vcpu, kvm, reg)		\
@@ -175,33 +172,27 @@ static inline void __activate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 		update_fgt_traps(hctxt, vcpu, kvm, HAFGRTR_EL2);
 }
 
-#define __deactivate_fgt(htcxt, vcpu, kvm, reg)				\
+#define __deactivate_fgt(htcxt, vcpu, reg)				\
 	do {								\
-		if ((vcpu_has_nv(vcpu) && !is_hyp_ctxt(vcpu)) ||	\
-		    kvm->arch.fgu[reg_to_fgt_group_id(reg)])		\
-			write_sysreg_s(ctxt_sys_reg(hctxt, reg),	\
-				       SYS_ ## reg);			\
+		write_sysreg_s(ctxt_sys_reg(hctxt, reg),		\
+			       SYS_ ## reg);				\
 	} while(0)
 
 static inline void __deactivate_traps_hfgxtr(struct kvm_vcpu *vcpu)
 {
 	struct kvm_cpu_context *hctxt = host_data_ptr(host_ctxt);
-	struct kvm *kvm = kern_hyp_va(vcpu->kvm);
 
 	if (!cpus_have_final_cap(ARM64_HAS_FGT))
 		return;
 
-	__deactivate_fgt(hctxt, vcpu, kvm, HFGRTR_EL2);
-	if (cpus_have_final_cap(ARM64_WORKAROUND_AMPERE_AC03_CPU_38))
-		write_sysreg_s(ctxt_sys_reg(hctxt, HFGWTR_EL2), SYS_HFGWTR_EL2);
-	else
-		__deactivate_fgt(hctxt, vcpu, kvm, HFGWTR_EL2);
-	__deactivate_fgt(hctxt, vcpu, kvm, HFGITR_EL2);
-	__deactivate_fgt(hctxt, vcpu, kvm, HDFGRTR_EL2);
-	__deactivate_fgt(hctxt, vcpu, kvm, HDFGWTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGRTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGWTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HFGITR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HDFGRTR_EL2);
+	__deactivate_fgt(hctxt, vcpu, HDFGWTR_EL2);
 
 	if (cpu_has_amu())
-		__deactivate_fgt(hctxt, vcpu, kvm, HAFGRTR_EL2);
+		__deactivate_fgt(hctxt, vcpu, HAFGRTR_EL2);
 }
 
 static inline void  __activate_traps_mpam(struct kvm_vcpu *vcpu)
-- 
2.39.2


