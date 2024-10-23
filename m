Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5939CDDE7F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:29:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qBQ1exXOyUAkGUdX95BCc0w0f7JMEwL/TNEEr1tlxH8=; b=xh8SJSSHmLzqsJDyHXRqP9JAuk
	vq70jwNPC6Uw3gS+nz2jfm2sxbrdcuCul2eMsA1VB1k7mY13n+isoXBuRqd5eMGqXs3bsRWawf7xh
	wCrSjYaLdRnJj1mC+Yoas7SfcTHg/ttCFyIfHpONQpg0GdXo/HOIp8f56lZj+2HHTDqmsgdcyADdb
	f+iL30lj85C7X7Ul2K9lim1vL+O7n8TWikL+I5tBb0iewGgNqxAHlv6Hx8jajeafnZxzNF2ahyZdL
	apvzAkbk2UiY3DnvckLI1bBz71W8JQe4gekMzra7k+wmv6cYXDk0T6TeRsoMam8aiVBmXKiSCBnlA
	1ZWB0cmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dIx-0000000Ey5O-49Ns;
	Wed, 23 Oct 2024 15:29:47 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckJ-0000000EpMu-44uv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2DC41A4503D;
	Wed, 23 Oct 2024 14:53:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21D38C4CEC6;
	Wed, 23 Oct 2024 14:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695235;
	bh=94ZxBE/fRbkOTF9bxMR8oYJg1g6c0hqbQxQqrdRz6CU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ewi5KjZ9xy/M8KFowBO8lg0ve3hBFaSdwKNAGD6bgqwj7+A3hUKyuws4yMyPQHNDv
	 sUdwSbhU81Xt55j0sWWw3X1BiG0oGNpBkk4J+DZsHIStKGh/wYVQ2z79iEYF1BbQb8
	 rfbZI1c5RcmIJmpwws3AXVbOiQK6O6H3nhFcCFa6WQmsXcTqEYm20XQZxmFr5oeEAc
	 DjTRt2vWMOvd80P3SQBDsjKNUuc9tALkgslbg7KHc7/BvVw73di5w7hM67VMtaGAaG
	 PhKljS5od5Ilac4shdkXARQXr09yPFRPgwtNH2eXzqx1FYoeC0S+ZFdyrnwH2eyXQ8
	 zCVqDKwkbSLQw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckD-0068vz-DF;
	Wed, 23 Oct 2024 15:53:53 +0100
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Mark Brown <broonie@kernel.org>
Subject: [PATCH v5 19/37] KVM: arm64: Split S1 permission evaluation into direct and hierarchical parts
Date: Wed, 23 Oct 2024 15:53:27 +0100
Message-Id: <20241023145345.1613824-20-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20241023145345.1613824-1-maz@kernel.org>
References: <20241023145345.1613824-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, alexandru.elisei@arm.com, broonie@kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_075400_302480_3AAEB954 
X-CRM114-Status: GOOD (  17.66  )
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

The AArch64.S1DirectBasePermissions() pseudocode deals with both
direct and hierarchical S1 permission evaluation. While this is
probably convenient in the pseudocode, we would like a bit more
flexibility to slot things like indirect permissions.

To that effect, split the two permission check parts out of
handle_at_slow() and into their own functions. The permissions
are passed around as part of the walk_result structure.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 162 +++++++++++++++++++++++++++-----------------
 1 file changed, 98 insertions(+), 64 deletions(-)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index b9d0992e91972..adcfce3f67f03 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -37,6 +37,12 @@ struct s1_walk_result {
 			u8	APTable;
 			bool	UXNTable;
 			bool	PXNTable;
+			bool	ur;
+			bool	uw;
+			bool	ux;
+			bool	pr;
+			bool	pw;
+			bool	px;
 		};
 		struct {
 			u8	fst;
@@ -764,111 +770,139 @@ static bool pan3_enabled(struct kvm_vcpu *vcpu, enum trans_regime regime)
 	return sctlr & SCTLR_EL1_EPAN;
 }
 
-static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
+static void compute_s1_direct_permissions(struct kvm_vcpu *vcpu,
+					  struct s1_walk_info *wi,
+					  struct s1_walk_result *wr)
 {
-	bool perm_fail, ur, uw, ux, pr, pw, px;
-	struct s1_walk_result wr = {};
-	struct s1_walk_info wi = {};
-	int ret, idx;
-
-	ret = setup_s1_walk(vcpu, op, &wi, &wr, vaddr);
-	if (ret)
-		goto compute_par;
-
-	if (wr.level == S1_MMU_DISABLED)
-		goto compute_par;
-
-	idx = srcu_read_lock(&vcpu->kvm->srcu);
-
-	ret = walk_s1(vcpu, &wi, &wr, vaddr);
-
-	srcu_read_unlock(&vcpu->kvm->srcu, idx);
-
-	if (ret)
-		goto compute_par;
-
-	/* FIXME: revisit when adding indirect permission support */
-	/* AArch64.S1DirectBasePermissions() */
-	if (wi.regime != TR_EL2) {
-		switch (FIELD_GET(PTE_USER | PTE_RDONLY, wr.desc)) {
+	/* Non-hierarchical part of AArch64.S1DirectBasePermissions() */
+	if (wi->regime != TR_EL2) {
+		switch (FIELD_GET(PTE_USER | PTE_RDONLY, wr->desc)) {
 		case 0b00:
-			pr = pw = true;
-			ur = uw = false;
+			wr->pr = wr->pw = true;
+			wr->ur = wr->uw = false;
 			break;
 		case 0b01:
-			pr = pw = ur = uw = true;
+			wr->pr = wr->pw = wr->ur = wr->uw = true;
 			break;
 		case 0b10:
-			pr = true;
-			pw = ur = uw = false;
+			wr->pr = true;
+			wr->pw = wr->ur = wr->uw = false;
 			break;
 		case 0b11:
-			pr = ur = true;
-			pw = uw = false;
+			wr->pr = wr->ur = true;
+			wr->pw = wr->uw = false;
 			break;
 		}
 
-		switch (wr.APTable) {
+		/* We don't use px for anything yet, but hey... */
+		wr->px = !((wr->desc & PTE_PXN) || wr->uw);
+		wr->ux = !(wr->desc & PTE_UXN);
+	} else {
+		wr->ur = wr->uw = wr->ux = false;
+
+		if (!(wr->desc & PTE_RDONLY)) {
+			wr->pr = wr->pw = true;
+		} else {
+			wr->pr = true;
+			wr->pw = false;
+		}
+
+		/* XN maps to UXN */
+		wr->px = !(wr->desc & PTE_UXN);
+	}
+}
+
+static void compute_s1_hierarchical_permissions(struct kvm_vcpu *vcpu,
+						struct s1_walk_info *wi,
+						struct s1_walk_result *wr)
+{
+	/* Hierarchical part of AArch64.S1DirectBasePermissions() */
+	if (wi->regime != TR_EL2) {
+		switch (wr->APTable) {
 		case 0b00:
 			break;
 		case 0b01:
-			ur = uw = false;
+			wr->ur = wr->uw = false;
 			break;
 		case 0b10:
-			pw = uw = false;
+			wr->pw = wr->uw = false;
 			break;
 		case 0b11:
-			pw = ur = uw = false;
+			wr->pw = wr->ur = wr->uw = false;
 			break;
 		}
 
-		/* We don't use px for anything yet, but hey... */
-		px = !((wr.desc & PTE_PXN) || wr.PXNTable || uw);
-		ux = !((wr.desc & PTE_UXN) || wr.UXNTable);
+		wr->px &= !wr->PXNTable;
+		wr->ux &= !wr->UXNTable;
+	} else {
+		if (wr->APTable & BIT(1))
+			wr->pw = false;
 
-		if (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) {
-			bool pan;
+		/* XN maps to UXN */
+		wr->px &= !wr->UXNTable;
+	}
+}
 
-			pan = *vcpu_cpsr(vcpu) & PSR_PAN_BIT;
-			pan &= ur || uw || (pan3_enabled(vcpu, wi.regime) && ux);
-			pw &= !pan;
-			pr &= !pan;
-		}
-	} else {
-		ur = uw = ux = false;
+static void compute_s1_permissions(struct kvm_vcpu *vcpu, u32 op,
+				   struct s1_walk_info *wi,
+				   struct s1_walk_result *wr)
+{
+	compute_s1_direct_permissions(vcpu, wi, wr);
 
-		if (!(wr.desc & PTE_RDONLY)) {
-			pr = pw = true;
-		} else {
-			pr = true;
-			pw = false;
-		}
+	if (!wi->hpd)
+		compute_s1_hierarchical_permissions(vcpu, wi, wr);
 
-		if (wr.APTable & BIT(1))
-			pw = false;
+	if (op == OP_AT_S1E1RP || op == OP_AT_S1E1WP) {
+		bool pan;
 
-		/* XN maps to UXN */
-		px = !((wr.desc & PTE_UXN) || wr.UXNTable);
+		pan = *vcpu_cpsr(vcpu) & PSR_PAN_BIT;
+		pan &= wr->ur || wr->uw || (pan3_enabled(vcpu, wi->regime) && wr->ux);
+		wr->pw &= !pan;
+		wr->pr &= !pan;
 	}
+}
+
+static u64 handle_at_slow(struct kvm_vcpu *vcpu, u32 op, u64 vaddr)
+{
+	struct s1_walk_result wr = {};
+	struct s1_walk_info wi = {};
+	bool perm_fail = false;
+	int ret, idx;
+
+	ret = setup_s1_walk(vcpu, op, &wi, &wr, vaddr);
+	if (ret)
+		goto compute_par;
+
+	if (wr.level == S1_MMU_DISABLED)
+		goto compute_par;
+
+	idx = srcu_read_lock(&vcpu->kvm->srcu);
+
+	ret = walk_s1(vcpu, &wi, &wr, vaddr);
+
+	srcu_read_unlock(&vcpu->kvm->srcu, idx);
+
+	if (ret)
+		goto compute_par;
 
-	perm_fail = false;
+	compute_s1_permissions(vcpu, op, &wi, &wr);
 
 	switch (op) {
 	case OP_AT_S1E1RP:
 	case OP_AT_S1E1R:
 	case OP_AT_S1E2R:
-		perm_fail = !pr;
+		perm_fail = !wr.pr;
 		break;
 	case OP_AT_S1E1WP:
 	case OP_AT_S1E1W:
 	case OP_AT_S1E2W:
-		perm_fail = !pw;
+		perm_fail = !wr.pw;
 		break;
 	case OP_AT_S1E0R:
-		perm_fail = !ur;
+		perm_fail = !wr.ur;
 		break;
 	case OP_AT_S1E0W:
-		perm_fail = !uw;
+		perm_fail = !wr.uw;
 		break;
 	case OP_AT_S1E1A:
 	case OP_AT_S1E2A:
-- 
2.39.2


