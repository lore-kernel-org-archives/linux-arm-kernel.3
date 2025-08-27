Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63F6BCA1001
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 19:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqlDqXJLkWmomu4lRqlA7oyJ2VSEWL5uY/P1AVqbMTs=; b=4XnYPNMsBiRp9Xk1jfs/5xAT9l
	ZpJ/L7Xom+X3tqVSJ8b6oYaNNWsvK5W277SZ7YrFNdDfzM5aYt0cYTDUxbtgNei6QBN9db7jpYh1F
	6DvWgJKfdN8RXt6qvBfNTV83nO1wmIWiL649JScCD8Pa8SdFGjFT6HaV/gIluSuGmThpx/ngHzPDL
	Uw1CvbWAIAFmgJVkBZH6GQVrDwXLvX3FiKUPYssQWHBNat0h+N9PlR+5p8OFwPm8OgvsxPZRyGzbV
	k6alOACBZyNnxAINkAKnkVCE8wEzdF/wrL++ucxp7GE2D05kXIJ11HJXE7LUkZO+ccDfI6FcPdfnX
	Gm8Gd0IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urLbs-0000000GZDF-1VRi;
	Wed, 27 Aug 2025 19:15:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urIjb-0000000G8pC-1oRp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 16:10:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2BBFF44B89;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F960C4CEF0;
	Wed, 27 Aug 2025 16:10:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756311051;
	bh=2Fbtp1u1nwumaVlQqZHqzjNwKa2ySrV6IvVjSvGY+JE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iOIJ6dIg42a0NHGtrIsm8aYG4XLNJRp6w2wctycVvdG34/WvGNEOeDGQlYA/Eadrm
	 xnoyj0LDI1McF2BOPIk++kweWTImvDow+AzgIndvs301cgyGAateACaVWlBNP0ZUoc
	 2IFXvFhgrJ41zVfpWY0yyJXbuu1ar+zzDGHWInsz5s/w2Fk+ECv9/x/IsWc4Ldq51F
	 0zS5MBjYQLkkrpqcI1CuZEZtg5MJDZX+H7DJIo5YSKHDKdvTwfs1S4PQSDB3q5bRG6
	 n6MX0PGeKY9Aw0DIXs6rl8hCSmeM518L4zoy8cHqMadMrp3vh2+NZowdsuDsZ1mo2k
	 dJX4RerEviIzw==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1urIjZ-00000000yGc-1CY2;
	Wed, 27 Aug 2025 16:10:49 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH 14/16] KVM: arm64: Add S1 IPA to page table level walker
Date: Wed, 27 Aug 2025 17:10:36 +0100
Message-Id: <20250827161039.938958-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250827161039.938958-1-maz@kernel.org>
References: <20250827161039.938958-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_091051_510923_48F287AD 
X-CRM114-Status: GOOD (  16.66  )
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

Use the filtering hook infrastructure to implement a new walker
that, for a given VA and an IPA, returns the level of the first
occurence of this IPA in the walk from that VA.

This will be used to improve our SEA syndrome reporting.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_nested.h |  2 +
 arch/arm64/kvm/at.c                 | 65 +++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_nested.h b/arch/arm64/include/asm/kvm_nested.h
index cce0e4cb54484..2be6c3de74e3d 100644
--- a/arch/arm64/include/asm/kvm_nested.h
+++ b/arch/arm64/include/asm/kvm_nested.h
@@ -353,6 +353,8 @@ struct s1_walk_result {
 
 int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 		       struct s1_walk_result *wr, u64 va);
+int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa,
+			     int *level);
 
 /* VNCR management */
 int kvm_vcpu_allocate_vncr_tlb(struct kvm_vcpu *vcpu);
diff --git a/arch/arm64/kvm/at.c b/arch/arm64/kvm/at.c
index f77c16225557f..70253d189133e 100644
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@ -1578,3 +1578,68 @@ int __kvm_translate_va(struct kvm_vcpu *vcpu, struct s1_walk_info *wi,
 
 	return 0;
 }
+
+struct desc_match {
+	u64	ipa;
+	int	level;
+};
+
+static int match_s1_desc(struct s1_walk_context *ctxt, void *priv)
+{
+	struct desc_match *dm = priv;
+	u64 ipa = dm->ipa;
+
+	/* Use S1 granule alignment */
+	ipa &= GENMASK(52, ctxt->wi->pgshift);
+
+	/* Not the IPA we're looking for? Continue. */
+	if (ipa != ctxt->table_ipa)
+		return 0;
+
+	/* Note the level and interrupt the walk */
+	dm->level = ctxt->level;
+	return -EINTR;
+}
+
+int __kvm_find_s1_desc_level(struct kvm_vcpu *vcpu, u64 va, u64 ipa, int *level)
+{
+	struct desc_match dm = {
+		.ipa	= ipa,
+	};
+	struct s1_walk_info wi = {
+		.filter	= &(struct s1_walk_filter){
+			.fn	= match_s1_desc,
+			.priv	= &dm,
+		},
+		.regime	= TR_EL10,
+		.as_el0	= false,
+		.pan	= false,
+	};
+	struct s1_walk_result wr = {};
+	int ret;
+
+	ret = setup_s1_walk(vcpu, &wi, &wr, va);
+	if (ret)
+		return ret;
+
+	/* We really expect the S1 MMU to be on here... */
+	if (WARN_ON_ONCE(wr.level == S1_MMU_DISABLED)) {
+		*level = 0;
+		return 0;
+	}
+
+	/* Walk the guest's PT, looking for a match along the way */
+	ret = walk_s1(vcpu, &wi, &wr, va);
+	switch (ret) {
+	case -EINTR:
+		/* We interrupted the walk on a match, return the level */
+		*level = dm.level;
+		return 0;
+	case 0:
+		/* The walk completed, we failed to find the entry */
+		return -ENOENT;
+	default:
+		/* Any other error... */
+		return ret;
+	}
+}
-- 
2.39.2


