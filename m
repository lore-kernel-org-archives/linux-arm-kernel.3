Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1536CFA444
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:43:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cHtpVc2MtSCv/3R7xLsQ1jdcPm9aVJkL+rWMcBAQ1S0=; b=lYH/HeyBmHhnHtmuBsk/FtHb7w
	mTcbJBT27/v1GAY2TaHnVi2oEy8w91hR2PC8J/VOw4lHdscyGWsyodtGhB7ekpJSZibPrIFCzPAZ6
	n1MW6T+9bjrXFiAppB1ksWT+2mWOkfSC1ZwQ9jcqE/xiaMbU2NNv/jP88HMORS9ZZvFew8WLNU+02
	nRuyNuAWh0A0dpFgazh9FFcT9Srwn9WKiSpFUoR2dVZVr1dCD7kNBVizrrY1FvGsalLgN/QJlvc6c
	YV5C9ADwf5hU5NDLcSu49v40tsgtj5jDxrEz+b1PYxcxmdBCG3m28L4c+p8oQkJlOqbFns+0FCQZ9
	Lj1QJeEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3dWS-0000000F0bH-1u8a;
	Wed, 23 Oct 2024 15:43:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckR-0000000EpRz-0JrR
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cHtpVc2MtSCv/3R7xLsQ1jdcPm9aVJkL+rWMcBAQ1S0=; b=YKlqQOMUNZV96TR/vaQyzJ/YJe
	/cqInzcx5gLa4iWWjSsQqLg5YJ4dife4UNiBShOP9I8yE5G3CBPQH7A+/5Sw3F2XG4ZnGcPqj3sbO
	vm2gnqDvaNW9xNVYgHB5lExH+ymgDYrUUPP50EOXd1Fsty6GGzywohCM5BKKudihRZXA026sV89QH
	V20uIjKoidByEneO+pVgLa5L0aVakjJOOL/uUmRP9SikEjRFd8VsyxOOPs8YqN46GIBJ85O5Wvy2Q
	/VR0jOW881xLXMkLzOLW/OM97ADdDprIGIfGImyfS3NOgHbWX2NsI49oLfEBslHJWYXWfp7Unvq0R
	iZM7z3KA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-00000008Qc2-0F6a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E6A18A45052;
	Wed, 23 Oct 2024 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EBB4DC4CEE4;
	Wed, 23 Oct 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695239;
	bh=HaAMbLjHvEBYTJntSK9g1Kuu6XtJwMzo1Mxh7bO9MCE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=atBq4JQG3ggj5KST+dQkFG81JJ7LTjW/JovGWPYHIjx3JJv+nlRQxIPReTasJnglC
	 e8rLfqFWZBGrVKvc+/U5h54FPEz4fppMy25sN31OwLOlYPWQgfU7miAZcUd4KtlBfu
	 2UvtuHsH+Arr9vuIp4QLzX/6icHnVVswsVzy2pDV0pdv9asccN16DGWf/HyeMvDQhT
	 m1buXKPT1oBw6ajsiDdgmCy110PDb4ygvpwkE4r3um5yKpsEoDTSwem2444+DVKiP0
	 KXRGayyUTiirLx74ipGUmqVeaY5PQuvJdbs02XQi6OQVca586fUYbbU3QlzLAQiIDi
	 p04suHE+BVeQQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckH-0068vz-8T;
	Wed, 23 Oct 2024 15:53:57 +0100
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
Subject: [PATCH v5 37/37] KVM: arm64: Handle WXN attribute
Date: Wed, 23 Oct 2024 15:53:45 +0100
Message-Id: <20241023145345.1613824-38-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_155403_601640_60152EC2 
X-CRM114-Status: GOOD (  14.44  )
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

Until now, we didn't really care about WXN as it didn't have an
effect on the R/W permissions (only the execution could be droppped),
and therefore not of interest for AT.

However, with S1POE, WXN can revoke the Write permission if an
overlay is active and that execution is allowed. This *is* relevant
to AT.

Add full handling of WXN so that we correctly handle this case.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 45 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index d300cd1a0d8a7..8c5d7990e5b31 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -40,10 +40,12 @@ struct s1_walk_result {
 			u8	APTable;
 			bool	UXNTable;
 			bool	PXNTable;
+			bool	uwxn;
 			bool	uov;
 			bool	ur;
 			bool	uw;
 			bool	ux;
+			bool	pwxn;
 			bool	pov;
 			bool	pr;
 			bool	pw;
@@ -847,6 +849,8 @@ static void compute_s1_direct_permissions(struct kvm_vcpu *vcpu,
 					  struct s1_walk_info *wi,
 					  struct s1_walk_result *wr)
 {
+	bool wxn;
+
 	/* Non-hierarchical part of AArch64.S1DirectBasePermissions() */
 	if (wi->regime != TR_EL2) {
 		switch (FIELD_GET(PTE_USER | PTE_RDONLY, wr->desc)) {
@@ -884,6 +888,17 @@ static void compute_s1_direct_permissions(struct kvm_vcpu *vcpu,
 		wr->px = !(wr->desc & PTE_UXN);
 	}
 
+	switch (wi->regime) {
+	case TR_EL2:
+	case TR_EL20:
+		wxn = (vcpu_read_sys_reg(vcpu, SCTLR_EL2) & SCTLR_ELx_WXN);
+		break;
+	case TR_EL10:
+		wxn = (__vcpu_sys_reg(vcpu, SCTLR_EL1) & SCTLR_ELx_WXN);
+		break;
+	}
+
+	wr->pwxn = wr->uwxn = wxn;
 	wr->pov = wi->poe;
 	wr->uov = wi->e0poe;
 }
@@ -935,6 +950,16 @@ static void compute_s1_hierarchical_permissions(struct kvm_vcpu *vcpu,
 		(wr)->ux = (x);		\
 	} while (0)
 
+#define set_priv_wxn(wr, v)		\
+	do {				\
+		(wr)->pwxn = (v);	\
+	} while (0)
+
+#define set_unpriv_wxn(wr, v)		\
+	do {				\
+		(wr)->uwxn = (v);	\
+	} while (0)
+
 /* Similar to AArch64.S1IndirectBasePermissions(), without GCS  */
 #define set_perms(w, wr, ip)						\
 	do {								\
@@ -989,6 +1014,10 @@ static void compute_s1_hierarchical_permissions(struct kvm_vcpu *vcpu,
 			set_ ## w ## _perms((wr), false, false, false);	\
 			break;						\
 		}							\
+									\
+		/* R_HJYGR */						\
+		set_ ## w ## _wxn((wr), ((ip) == 0b0110));		\
+									\
 	} while (0)
 
 static void compute_s1_indirect_permissions(struct kvm_vcpu *vcpu,
@@ -1090,6 +1119,22 @@ static void compute_s1_permissions(struct kvm_vcpu *vcpu,
 	if (wi->poe || wi->e0poe)
 		compute_s1_overlay_permissions(vcpu, wi, wr);
 
+	/* R_QXXPC */
+	if (wr->pwxn) {
+		if (!wr->pov && wr->pw)
+			wr->px = false;
+		if (wr->pov && wr->px)
+			wr->pw = false;
+	}
+
+	/* R_NPBXC */
+	if (wr->uwxn) {
+		if (!wr->uov && wr->uw)
+			wr->ux = false;
+		if (wr->uov && wr->ux)
+			wr->uw = false;
+	}
+
 	pan = wi->pan && (wr->ur || wr->uw ||
 			  (pan3_enabled(vcpu, wi->regime) && wr->ux));
 	wr->pw &= !pan;
-- 
2.39.2


