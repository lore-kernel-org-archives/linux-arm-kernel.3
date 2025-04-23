Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE852C369D8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Apr 2025 17:42:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYRPErwghAuJrUrMATVK0z7mk+Z1fYVjT+iN10KULs4=; b=QRxmraThHMaoF+aCMkSmwwUpNc
	mrzQHfU0fJK9unYtA+IYbsUlNbnv5mdDlk637V2kj+4zv1n79+r1tLvtuqJBlVm8R+D+OGzmOENaa
	DZ6UB9M6AWzE6QHdQ6oB+tAYofso1mnoM57oPLuG13v16831pBdht00Vl7AlXVQsM0qZc/ZO81dq/
	La2tDQb+3z4+lDmEKQfJNjHC/iQWsRHeoTLTCKPBO5Dh+C1bladwEw+3TvsFOkZO/gkJorSC2NvWk
	/MKm6zOpnBIJt6y+cCYuopjFMDNxc/TDP2cs3ED4coadHcAoG4RKImnknGFljsV4xV3Q6e2uENdBQ
	G/wONzpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e6e-0000000BKEZ-2AU1;
	Wed, 23 Apr 2025 17:41:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7boi-0000000AvoL-2Wm9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Apr 2025 15:15:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 16B4C61569;
	Wed, 23 Apr 2025 15:14:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4A16C4CEE2;
	Wed, 23 Apr 2025 15:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745421315;
	bh=wqa/hPQI/dzLM4fwrGkpZyGhz9VCScqC+REjDpgrRJ8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fmlv9SItvcgBQaSg1kfHz4IBO67X7zmcYYXcE/j9CYgIuNfJTe4GjhKHAX9/iOKxS
	 xHIP/3OtQpuE+4EVzq25RJf6wXhLgmSCbX3D0CXwDc0OeLA2ykzGcoO1P1D6q9wZxk
	 ZklriYeMYS5lsIQpHmYaw0r6UarxtPWakoL255memGvLNqH5mXY2yeSlPEyO/D/nap
	 VZYIt0s9vcJtzTI+Zkgobslm9QnPh/i6EjuEGy+yYkVD3tdC9TOEHuZVRg1FA652Os
	 RNW6CdFImvgvxRoEmGA/f1TmcBski5XGcmvGaCl04wXvJtdCCcno+bzFsLKMxBfe4A
	 nvA6ZpY6yEoiw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u7bof-0082xr-OB;
	Wed, 23 Apr 2025 16:15:13 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Eric Auger <eric.auger@redhat.com>,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>
Subject: [PATCH v3 03/17] KVM: arm64: nv: Extract translation helper from the AT code
Date: Wed, 23 Apr 2025 16:14:54 +0100
Message-Id: <20250423151508.2961768-4-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250423151508.2961768-1-maz@kernel.org>
References: <20250423151508.2961768-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, eric.auger@redhat.com, gankulkarni@os.amperecomputing.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

The address translation infrastructure is currently pretty tied to
the AT emulation.

However, we also need to features that require the use of VAs, such
as VNCR_EL2 (and maybe one of these days SPE), meaning that we need
a slightly more generic infrastructure.

Start this by introducing a new helper (__kvm_translate_va()) that
performs a S1 walk for a given translation regime, EL and PAN
settings.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h | 54 ++++++++++++++++
 arch/arm64/kvm/at.c                 | 96 +++++++++++------------------
 2 files changed, 91 insertions(+), 59 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index 692f403c1896e..c8a779b393c28 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -245,4 +245,58 @@ static inline unsigned int ps_to_output_size(unsigned int ps)
 	}
 }
 
+enum trans_regime {
+	TR_EL10,
+	TR_EL20,
+	TR_EL2,
+};
+
+struct s1_walk_info {
+	u64	     		baddr;
+	enum trans_regime	regime;
+	unsigned int		max_oa_bits;
+	unsigned int		pgshift;
+	unsigned int		txsz;
+	int 	     		sl;
+	bool			as_el0;
+	bool	     		hpd;
+	bool			e0poe;
+	bool			poe;
+	bool			pan;
+	bool	     		be;
+	bool	     		s2;
+};
+
+struct s1_walk_result {
+	union {
+		struct {
+			u64	desc;
+			u64	pa;
+			s8	level;
+			u8	APTable;
+			bool	UXNTable;
+			bool	PXNTable;
+			bool	uwxn;
+			bool	uov;
+			bool	ur;
+			bool	uw;
+			bool	ux;
+			bool	pwxn;
+			bool	pov;
+			bool	pr;
+			bool	pw;
+			bool	px;
+		};
+		struct {
+			u8	fst;
+			bool	ptw;
+			bool	s2;
+		};
+	};
+	bool	failed;
+};
+
+int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
+		       struct s1_walk_result *wr, u64 va);
+
 #endif /* __ARM64_KVM_NESTED_H */
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 7a5267f43b51f..71406908d4f44 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -10,56 +10,6 @@
 #include <asm/kvm_hyp.h>
 #include <asm/kvm_mmu.h>
 
-enum trans_regime {
-	TR_EL10,
-	TR_EL20,
-	TR_EL2,
-};
-
-struct s1_walk_info {
-	u64	     		baddr;
-	enum trans_regime	regime;
-	unsigned int		max_oa_bits;
-	unsigned int		pgshift;
-	unsigned int		txsz;
-	int 	     		sl;
-	bool	     		hpd;
-	bool			e0poe;
-	bool			poe;
-	bool			pan;
-	bool	     		be;
-	bool	     		s2;
-};
-
-struct s1_walk_result {
-	union {
-		struct {
-			u64	desc;
-			u64	pa;
-			s8	level;
-			u8	APTable;
-			bool	UXNTable;
-			bool	PXNTable;
-			bool	uwxn;
-			bool	uov;
-			bool	ur;
-			bool	uw;
-			bool	ux;
-			bool	pwxn;
-			bool	pov;
-			bool	pr;
-			bool	pw;
-			bool	px;
-		};
-		struct {
-			u8	fst;
-			bool	ptw;
-			bool	s2;
-		};
-	};
-	bool	failed;
-};
-
 static void fail_s1_walk(struct s1_walk_result *wr, u8 fst, bool s1ptw)
 {
 	wr->fst		= fst;
@@ -145,20 +95,15 @@ static void compute_s1poe(struct kvm_vcpu *vcpu, struct s1_walk_info *wi)
 	}
 }
 
-static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
+static int setup_s1_walk(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 			 struct s1_walk_result *wr, u64 va)
 {
 	u64 hcr, sctlr, tcr, tg, ps, ia_bits, ttbr;
 	unsigned int stride, x;
-	bool va55, tbi, lva, as_el0;
+	bool va55, tbi, lva;
 
 	hcr = __vcpu_sys_reg(vcpu, HCR_EL2);
 
-	wi->regime = compute_translation_regime(vcpu, op);
-	as_el0 = (op == OP_AT_S1E0R || op == OP_AT_S1E0W);
-	wi->pan = (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) &&
-		  (*vcpu_cpsr(vcpu) & PSR_PAN_BIT);
-
 	va55 = va & BIT(55);
 
 	if (wi->regime == TR_EL2 && va55)
@@ -319,7 +264,7 @@ static int setup_s1_walk(struct kvm_vcpu *vcpu, u32 op, struct s1_walk_info *wi,
 
 	/* R_BNDVG and following statements */
 	if (kvm_has_feat(vcpu->kvm, ID_AA64MMFR2_EL1, E0PD, IMP) &&
-	    as_el0 && (tcr & (va55 ? TCR_E0PD1 : TCR_E0PD0)))
+	    wi->as_el0 && (tcr & (va55 ? TCR_E0PD1 : TCR_E0PD0)))
 		goto transfault_l0;
 
 	/* AArch64.S1StartLevel() */
@@ -1155,7 +1100,12 @@ static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	bool perm_fail = false;
 	int ret, idx;
 
-	ret = setup_s1_walk(vcpu, op, &wi, &wr, vaddr);
+	wi.regime = compute_translation_regime(vcpu, op);
+	wi.as_el0 = (op == OP_AT_S1E0R || op == OP_AT_S1E0W);
+	wi.pan = (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) &&
+		 (*vcpu_cpsr(vcpu) & PSR_PAN_BIT);
+
+	ret = setup_s1_walk(vcpu, &wi, &wr, vaddr);
 	if (ret)
 		goto compute_par;
 
@@ -1457,3 +1407,31 @@ void __kvm_at_s12(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
 	par = compute_par_s12(vcpu, par, &out);
 	vcpu_write_sys_reg(vcpu, par, PAR_EL1);
 }
+
+/*
+ * Translate a VA for a given EL in a given translation regime, with
+ * or without PAN. This requires wi->{regime, as_el0, pan} to be
+ * set. The rest of the wi and wr should be 0-initialised.
+ */
+int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
+		       struct s1_walk_result *wr, u64 va)
+{
+	int ret;
+
+	ret = setup_s1_walk(vcpu, wi, wr, va);
+	if (ret)
+		return ret;
+
+	if (wr->level == S1_MMU_DISABLED) {
+		wr->ur = wr->uw = wr->ux = true;
+		wr->pr = wr->pw = wr->px = true;
+	} else {
+		ret = walk_s1(vcpu, wi, wr, va);
+		if (ret)
+			return ret;
+
+		compute_s1_permissions(vcpu, wi, wr);
+	}
+
+	return 0;
+}
-- 
2.39.2


