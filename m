Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1EF2C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Apr 2025 12:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XaBFgF7h6yZETV3oh2+8ATn+Y8lxLn+ueDwzNgT8BSQ=; b=jLvfUNr/7OuHsYlIoAWoCTGBwE
	MEIQKAxMorDMDksrMpy7haw0clf897hWDdlYXTaM8hKq1O/1Mp3l91vlxVv/yJ3G6MT45nndASpq4
	nglhyrBUJKMaWq6mTlZHnUgzfN59PND8E/bE460LBkrRcarASE6YxD2QQoBzOlUZ2k/BXNmB9gsN0
	0s2+Kynheuyqel6Rvnlqj6Ni+Gv4f1u9sCFfvNfcORk1RY6oGbdLUhyqh5h/OiU9R8sCCZ96qEa5y
	4kDp1TBNpE3qSOucLvnEDvy5LkTHdGN36gOk441Q3WQ+YFnm89ACIReVHZH/bhKleikVgw1m0iIu/
	/uJ4jWgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8f7p-000000022Xq-3evn;
	Sat, 26 Apr 2025 12:59:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8eeN-00000001z1B-2A22
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Apr 2025 12:28:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 230AA4A6CD;
	Sat, 26 Apr 2025 12:28:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A01C4CEEB;
	Sat, 26 Apr 2025 12:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745670534;
	bh=vjXbDrwewvSPOtQWRUXGG3NnR/e5HfNw/ic9Gwvm87Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ds9qg2MK2v+YonRamaBxkYB9M5FwNcttcSk6jDiWTRHqPEL8ZWWZrTeO+cxAT+Pz6
	 9dWIam4AtpAU41OTGrnUKlf032zwvQBNMTiebfM7y9NqR9PZyr0KmGFys7O+aZdp7d
	 r09fSY4llzRxA9KnuCSdB00xj/RAk1VbP+UvsLbiQbD5rJz5s2I9ReVbnRqcA1LgNQ
	 i6oIemZirFH4uBhUlpliuOIzGQ08UgqlDHWuWtYK1LM8i4QqqioJSBsVbzy/NgKF0+
	 bD5isQFN5dP+uocGNjNyYPDMgG3cmceikZkbJPN/8WBi2U/KfoCY7JH+hgWQ5EJ5z0
	 JxES0W3BJ0gjg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1u8eeK-0092VH-T8;
	Sat, 26 Apr 2025 13:28:53 +0100
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
	Catalin Marinas <catalin.marinas@arm.com>
Subject: [PATCH v3 16/42] KVM: arm64: Simplify handling of negative FGT bits
Date: Sat, 26 Apr 2025 13:28:10 +0100
Message-Id: <20250426122836.3341523-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250426122836.3341523-1-maz@kernel.org>
References: <20250426122836.3341523-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com, will@kernel.org, catalin.marinas@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250426_052855_629071_E3E5F9C2 
X-CRM114-Status: GOOD (  13.83  )
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

check_fgt_bit() and triage_sysreg_trap() implement the same thing
twice for no good reason. We have to lookup the FGT register twice,
as we don't communucate it. Similarly, we extract the register value
at the wrong spot.

Reorganise the code in a more logical way so that things are done
at the correct location, removing a lot of duplication.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/emulate-nested.c | 49 ++++++++-------------------------
 1 file changed, 12 insertions(+), 37 deletions(-)

diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 1bcbddc88a9b7..52a2d63a667c9 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2215,11 +2215,11 @@ static u64 kvm_get_sysreg_res0(struct kvm *kvm, enum vcpu_sysreg sr)
 	return masks->mask[sr - __VNCR_START__].res0;
 }
 
-static bool check_fgt_bit(struct kvm_vcpu *vcpu, bool is_read,
-			  u64 val, const union trap_config tc)
+static bool check_fgt_bit(struct kvm_vcpu *vcpu, enum vcpu_sysreg sr,
+			  const union trap_config tc)
 {
 	struct kvm *kvm = vcpu->kvm;
-	enum vcpu_sysreg sr;
+	u64 val;
 
 	/*
 	 * KVM doesn't know about any FGTs that apply to the host, and hopefully
@@ -2228,6 +2228,8 @@ static bool check_fgt_bit(struct kvm_vcpu *vcpu, bool is_read,
 	if (is_hyp_ctxt(vcpu))
 		return false;
 
+	val = __vcpu_sys_reg(vcpu, sr);
+
 	if (tc.pol)
 		return (val & BIT(tc.bit));
 
@@ -2242,38 +2244,17 @@ static bool check_fgt_bit(struct kvm_vcpu *vcpu, bool is_read,
 	if (val & BIT(tc.bit))
 		return false;
 
-	switch ((enum fgt_group_id)tc.fgt) {
-	case HFGRTR_GROUP:
-		sr = is_read ? HFGRTR_EL2 : HFGWTR_EL2;
-		break;
-
-	case HDFGRTR_GROUP:
-		sr = is_read ? HDFGRTR_EL2 : HDFGWTR_EL2;
-		break;
-
-	case HAFGRTR_GROUP:
-		sr = HAFGRTR_EL2;
-		break;
-
-	case HFGITR_GROUP:
-		sr = HFGITR_EL2;
-		break;
-
-	default:
-		WARN_ONCE(1, "Unhandled FGT group");
-		return false;
-	}
-
 	return !(kvm_get_sysreg_res0(kvm, sr) & BIT(tc.bit));
 }
 
 bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 {
+	enum vcpu_sysreg fgtreg;
 	union trap_config tc;
 	enum trap_behaviour b;
 	bool is_read;
 	u32 sysreg;
-	u64 esr, val;
+	u64 esr;
 
 	esr = kvm_vcpu_get_esr(vcpu);
 	sysreg = esr_sys64_to_sysreg(esr);
@@ -2320,25 +2301,19 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 		break;
 
 	case HFGRTR_GROUP:
-		if (is_read)
-			val = __vcpu_sys_reg(vcpu, HFGRTR_EL2);
-		else
-			val = __vcpu_sys_reg(vcpu, HFGWTR_EL2);
+		fgtreg = is_read ? HFGRTR_EL2 : HFGWTR_EL2;
 		break;
 
 	case HDFGRTR_GROUP:
-		if (is_read)
-			val = __vcpu_sys_reg(vcpu, HDFGRTR_EL2);
-		else
-			val = __vcpu_sys_reg(vcpu, HDFGWTR_EL2);
+		fgtreg = is_read ? HDFGRTR_EL2 : HDFGWTR_EL2;
 		break;
 
 	case HAFGRTR_GROUP:
-		val = __vcpu_sys_reg(vcpu, HAFGRTR_EL2);
+		fgtreg = HAFGRTR_EL2;
 		break;
 
 	case HFGITR_GROUP:
-		val = __vcpu_sys_reg(vcpu, HFGITR_EL2);
+		fgtreg = HFGITR_EL2;
 		switch (tc.fgf) {
 			u64 tmp;
 
@@ -2359,7 +2334,7 @@ bool triage_sysreg_trap(struct kvm_vcpu *vcpu, int *sr_index)
 		goto local;
 	}
 
-	if (tc.fgt != __NO_FGT_GROUP__ && check_fgt_bit(vcpu, is_read, val, tc))
+	if (tc.fgt != __NO_FGT_GROUP__ && check_fgt_bit(vcpu, fgtreg, tc))
 		goto inject;
 
 	b = compute_trap_behaviour(vcpu, tc);
-- 
2.39.2


