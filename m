Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2125ACFA445
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 15:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxUdQkyet4AbAhDBl8F3F7zJ7o2Rh7Y0HwJxe5Rum64=; b=bwew3sXLXAYihf6ypZ8qIbsdOV
	QG8TkCbVzask/IwlqFsIIgfzwqZ2KLpCD+sYT56ZvTGAvPZnH+L4oOSjfUtc+mrJDdoORPcJOG2ON
	K6QxZvRVmcZVzLcV0st5GMrYfv4oDI+46QupkAq5lwSfa62F5+ckJ8CYPXKCI4SdmlKBO0p7QcV6v
	hUTy65QgyuoDX45b4oaAFhf4exRWJVtUMwU2fJcDZYvUgH2/roLc7WN2t5yVsZMa7QrM/Pr8n6ndQ
	KkdCrsjRSzVJvkOUOZ5hiOPyKmdB1uHOyMefwLGMwyCvSFw6Hv15p1Pc5vxOg0ndV1lbSBbXwz7nj
	Yh01ZyYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3de0-0000000F2Qv-0KTe;
	Wed, 23 Oct 2024 15:51:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckR-0000000EpST-3F0s
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 23 Oct 2024 14:54:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=VxUdQkyet4AbAhDBl8F3F7zJ7o2Rh7Y0HwJxe5Rum64=; b=VzeX0IzRYbSxa5865bl/A1DyDJ
	Ny7nO/5eXQ463M+VhemyhbzY2qncmdQN0NTWywNBsQHhL5A2qJBeB4jPKHEs/iVKp3izDfaxemj9v
	H5hbDfG969AdcjfFp3dTbcK2dsglSLd0MjgNnknpbGtrmBvdr9d2eOt6JAaKf3nqW2OLHou/KXJny
	VG6qdW4emmT80e0+YECVC1mekLvjkcW7xWRRvSz3feOdKZwjab/9fuWVUZxDTJV3UiudOABPtQkOQ
	25t6JtRYUTdybDXj3OPlXLSqkNr1syzfEAZhKijTsBI9pKOeDCyEn6nKb7GBmtrYz/bk+ejil5i0c
	IY8gHnUA==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3ckN-00000008Qeh-3oT2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 14:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B3517A45017;
	Wed, 23 Oct 2024 14:53:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB3FAC4CECD;
	Wed, 23 Oct 2024 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729695238;
	bh=IELrSxwq0YYfqTQ+7AffvzDHFrt+2D5q6aQ08Totfc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EH6y4mkgpXVlJPcAaQ66p/3bN7Ex2nMFSEB0BfsKg5FqtlVoi/3Qepd6Y6U5H4eMk
	 nPG+IqQ4KB7wSdBqo1hztsQqQ9+ZM68AJmu3HvP0WKWKB/6eiRy4msvc6CV/HTourM
	 5vQGGDm67wLY2Y8Tf12qgPFlCENS7VGWJzQRk+dpswPKhw3Fu00pzsrWRNwc7KlYCp
	 0MtidjZ0zhCwIC0SCoP3mZQ6X0p/TkIdInWx5DvZvcz3Xa3f5hsbTuGFBQ/qqtwjL6
	 Phx9htQXejFO2+fscDAmgeHtLCDVREBpETQij5NWWJMzuYvUynHB4jdPtLZS435lhh
	 GG+EC+TjNiWtw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1t3ckH-0068vz-2N;
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
Subject: [PATCH v5 36/37] KVM: arm64: Handle stage-1 permission overlays
Date: Wed, 23 Oct 2024 15:53:44 +0100
Message-Id: <20241023145345.1613824-37-maz@kernel.org>
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
X-CRM114-CacheID: sfid-20241023_155404_488422_C91CD6A1 
X-CRM114-Status: GOOD (  13.02  )
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

We now have the intrastructure in place to emulate S1POE:

- direct permissions are always overlay-capable
- indirect permissions are overlay-capable if the permissions are
  in the 0b0xxx range
- the overlays are strictly substractive

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/at.c | 53 +++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index 2ab2c3578c3a0..d300cd1a0d8a7 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -40,9 +40,11 @@ struct s1_walk_result {
 			u8	APTable;
 			bool	UXNTable;
 			bool	PXNTable;
+			bool	uov;
 			bool	ur;
 			bool	uw;
 			bool	ux;
+			bool	pov;
 			bool	pr;
 			bool	pw;
 			bool	px;
@@ -881,6 +883,9 @@ static void compute_s1_direct_permissions(struct kvm_vcpu *vcpu,
 		/* XN maps to UXN */
 		wr->px = !(wr->desc & PTE_UXN);
 	}
+
+	wr->pov = wi->poe;
+	wr->uov = wi->e0poe;
 }
 
 static void compute_s1_hierarchical_permissions(struct kvm_vcpu *vcpu,
@@ -1016,6 +1021,9 @@ static void compute_s1_indirect_permissions(struct kvm_vcpu *vcpu,
 	else
 		set_unpriv_perms(wr, false, false, false);
 
+	wr->pov = wi->poe && !(pp & BIT(3));
+	wr->uov = wi->e0poe && !(up & BIT(3));
+
 	/* R_VFPJF */
 	if (wr->px && wr->uw) {
 		set_priv_perms(wr, false, false, false);
@@ -1023,6 +1031,48 @@ static void compute_s1_indirect_permissions(struct kvm_vcpu *vcpu,
 	}
 }
 
+static void compute_s1_overlay_permissions(struct kvm_vcpu *vcpu,
+					   struct s1_walk_info *wi,
+					   struct s1_walk_result *wr)
+{
+	u8 idx, pov_perms, uov_perms;
+
+	idx = FIELD_GET(PTE_PO_IDX_MASK, wr->desc);
+
+	switch (wi->regime) {
+	case TR_EL10:
+		pov_perms = perm_idx(vcpu, POR_EL1, idx);
+		uov_perms = perm_idx(vcpu, POR_EL0, idx);
+		break;
+	case TR_EL20:
+		pov_perms = perm_idx(vcpu, POR_EL2, idx);
+		uov_perms = perm_idx(vcpu, POR_EL0, idx);
+		break;
+	case TR_EL2:
+		pov_perms = perm_idx(vcpu, POR_EL2, idx);
+		uov_perms = 0;
+		break;
+	}
+
+	if (pov_perms & ~POE_RXW)
+		pov_perms = POE_NONE;
+
+	if (wi->poe && wr->pov) {
+		wr->pr &= pov_perms & POE_R;
+		wr->px &= pov_perms & POE_X;
+		wr->pw &= pov_perms & POE_W;
+	}
+
+	if (uov_perms & ~POE_RXW)
+		uov_perms = POE_NONE;
+
+	if (wi->e0poe && wr->uov) {
+		wr->ur &= uov_perms & POE_R;
+		wr->ux &= uov_perms & POE_X;
+		wr->uw &= uov_perms & POE_W;
+	}
+}
+
 static void compute_s1_permissions(struct kvm_vcpu *vcpu,
 				   struct s1_walk_info *wi,
 				   struct s1_walk_result *wr)
@@ -1037,6 +1087,9 @@ static void compute_s1_permissions(struct kvm_vcpu *vcpu,
 	if (!wi->hpd)
 		compute_s1_hierarchical_permissions(vcpu, wi, wr);
 
+	if (wi->poe || wi->e0poe)
+		compute_s1_overlay_permissions(vcpu, wi, wr);
+
 	pan = wi->pan && (wr->ur || wr->uw ||
 			  (pan3_enabled(vcpu, wi->regime) && wr->ux));
 	wr->pw &= !pan;
-- 
2.39.2


