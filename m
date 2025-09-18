Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB26CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1B9mi8iGxLXvuJD9TjHrvpOZTvdT6wqZTI7tA5YyVcg=; b=zZuuTiEoOfm4IwQcAsMee8wq1u
	CVE9mQlr5vY7gVW9n6XZni0AExSFvb3GaFjPBmzV12d6pZXdSle5iPuHP3BsKY494E2hKjt7UzGoj
	ZYPbAPmEID7/35anDOGl1d+IzfZwGWJScgCe2PPTh78ck709vwH3T76ystycSE2QehZhPKFPsux0s
	9y+YWJKRWryMH+au4VmCY1k18Yw/9tlOxSoD2ALlEnCgKHEmbeqUaN6AcUFFHos/kI0mFyAAr++Y3
	k2kP0LykNij3cxXuVT3Ujl3oG3s3bHpEknlUcNdarAifA+PoAAv9NpFB81J/AFsgXZ+NLumHRvoa5
	dGFPObQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGLA-00000000J4x-0JzM;
	Thu, 18 Sep 2025 15:14:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGL7-00000000J2O-3Ciu
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:14:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 000B560225;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1FA7C4CEEB;
	Thu, 18 Sep 2025 15:14:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758208468;
	bh=VnXTaODZ9KKv1VyS6psdOf4AON93ty2oTWMW5jw3b9A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=trR2pFQ+PpnboBbUG2K2IIDifqZQi3df1p1KBz5NbwBWUlp0GVNShGjlDy/lZu3C/
	 Gj6LhZ6PgeAQCrsVoZexTy7ccdxeDfi6051JEEYxwHgwk4cmknM2np8yEuXd4he8Az
	 xyXc4mV1ke6Sw3Yuyi67TU42MR4uQPztk8RnWxf7POvmWYM3ZeoWLvS/Y3GFlboz6T
	 YQmjNiKU7FDWaFAOXEKFZ3aCYl8cGefJIXcuYiBnXVDihsf47EFHZ9FAPstTTLG1zQ
	 F540u+AY+r5Bd8GKxtwZkaWgx7RU0CH9G9x24eSIayywEMwAt9HmGRdKJ+ZBGRJcCe
	 ya3nMG9AKR2mQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1uzGL4-00000007TmF-2WSt;
	Thu, 18 Sep 2025 15:14:26 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Jinqian Yang <yangjinqian1@huawei.com>
Subject: [PATCH v2 02/10] KVM: arm64: Add reg_feat_map_desc to describe full register dependency
Date: Thu, 18 Sep 2025 16:13:54 +0100
Message-Id: <20250918151402.1665315-3-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250918151402.1665315-1-maz@kernel.org>
References: <20250918151402.1665315-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, yangjinqian1@huawei.com
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

struct reg_bits_to_feat_map is great to describe bit-to-feature
dependency, but not so much to describe register-to-feature
dependency. Yet both need to exist.

Add a new reg_feat_map_desc structure to describe this.

Extra complexity is added by the need to source the RES0 bits from
the runtime-computed FGT masks, for which we need an extra flag
and extra complexity. Oh well.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/config.c | 81 ++++++++++++++++++++++++++++++++++++-----
 1 file changed, 72 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/kvm/config.c b/arch/arm64/kvm/config.c
index d85dd05c00b0e..c2bfffe660bca 100644
--- a/arch/arm64/kvm/config.c
+++ b/arch/arm64/kvm/config.c
@@ -7,12 +7,22 @@
 #include <linux/kvm_host.h>
 #include <asm/sysreg.h>
 
+/*
+ * Describes the dependencies between a set of bits (or the negation
+ * of a set of RES0 bits) and a feature. The flags indicate how the
+ * data is interpreted.
+ */
 struct reg_bits_to_feat_map {
-	u64		bits;
+	union {
+		u64	bits;
+		u64	*res0p;
+	};
 
 #define	NEVER_FGU	BIT(0)	/* Can trap, but never UNDEF */
 #define	CALL_FUNC	BIT(1)	/* Needs to evaluate tons of crap */
 #define	FIXED_VALUE	BIT(2)	/* RAZ/WI or RAO/WI in KVM */
+#define	RES0_POINTER	BIT(3)	/* Pointer to RES0 value instead of bits */
+
 	unsigned long	flags;
 
 	union {
@@ -28,9 +38,27 @@ struct reg_bits_to_feat_map {
 	};
 };
 
-#define __NEEDS_FEAT_3(m, f, id, fld, lim)		\
+/*
+ * Describes the dependencies for a given register:
+ *
+ * @feat_map describes the dependency for the whole register. If the
+ * features the register depends on are not present, the whole
+ * register is effectively RES0.
+ *
+ * @bit_feat_map describes the dependencies for a set of bits in that
+ * register. If the features these bits depend on are not present, the
+ * bits are effectively RES0.
+ */
+struct reg_feat_map_desc {
+	const char			  *name;
+	const struct reg_bits_to_feat_map feat_map;
+	const struct reg_bits_to_feat_map *bit_feat_map;
+	const unsigned int		  bit_feat_map_sz;
+};
+
+#define __NEEDS_FEAT_3(m, f, w, id, fld, lim)		\
 	{						\
-		.bits	= (m),				\
+		.w	= (m),				\
 		.flags = (f),				\
 		.regidx	= IDREG_IDX(SYS_ ## id),	\
 		.shift	= id ##_## fld ## _SHIFT,	\
@@ -39,28 +67,63 @@ struct reg_bits_to_feat_map {
 		.lo_lim	= id ##_## fld ##_## lim	\
 	}
 
-#define __NEEDS_FEAT_2(m, f, fun, dummy)		\
+#define __NEEDS_FEAT_2(m, f, w, fun, dummy)		\
 	{						\
-		.bits	= (m),				\
+		.w	= (m),				\
 		.flags = (f) | CALL_FUNC,		\
 		.fval = (fun),				\
 	}
 
-#define __NEEDS_FEAT_1(m, f, fun)			\
+#define __NEEDS_FEAT_1(m, f, w, fun)			\
 	{						\
-		.bits	= (m),				\
+		.w	= (m),				\
 		.flags = (f) | CALL_FUNC,		\
 		.match = (fun),				\
 	}
 
+#define __NEEDS_FEAT_FLAG(m, f, w, ...)			\
+	CONCATENATE(__NEEDS_FEAT_, COUNT_ARGS(__VA_ARGS__))(m, f, w, __VA_ARGS__)
+
 #define NEEDS_FEAT_FLAG(m, f, ...)			\
-	CONCATENATE(__NEEDS_FEAT_, COUNT_ARGS(__VA_ARGS__))(m, f, __VA_ARGS__)
+	__NEEDS_FEAT_FLAG(m, f, bits, __VA_ARGS__)
 
 #define NEEDS_FEAT_FIXED(m, ...)			\
-	NEEDS_FEAT_FLAG(m, FIXED_VALUE, __VA_ARGS__, 0)
+	__NEEDS_FEAT_FLAG(m, FIXED_VALUE, bits, __VA_ARGS__, 0)
+
+#define NEEDS_FEAT_RES0(p, ...)				\
+	__NEEDS_FEAT_FLAG(p, RES0_POINTER, res0p, __VA_ARGS__)
 
+/*
+ * Declare the dependency between a set of bits and a set of features,
+ * generating a struct reg_bit_to_feat_map.
+ */
 #define NEEDS_FEAT(m, ...)	NEEDS_FEAT_FLAG(m, 0, __VA_ARGS__)
 
+/*
+ * Declare the dependency between a non-FGT register, a set of
+ * feature, and the set of individual bits it contains. This generates
+ * a struct reg_feat_map_desc.
+ */
+#define DECLARE_FEAT_MAP(n, r, m, f)					\
+	struct reg_feat_map_desc n = {					\
+		.name			= #r,				\
+		.feat_map		= NEEDS_FEAT(~r##_RES0, f), 	\
+		.bit_feat_map		= m,				\
+		.bit_feat_map_sz	= ARRAY_SIZE(m),		\
+	}
+
+/*
+ * Specialised version of the above for FGT registers that have their
+ * RES0 masks described as struct fgt_masks.
+ */
+#define DECLARE_FEAT_MAP_FGT(n, msk, m, f)				\
+	struct reg_feat_map_desc n = {					\
+		.name			= #msk,				\
+		.feat_map		= NEEDS_FEAT_RES0(&msk.res0, f),\
+		.bit_feat_map		= m,				\
+		.bit_feat_map_sz	= ARRAY_SIZE(m),		\
+	}
+
 #define FEAT_SPE		ID_AA64DFR0_EL1, PMSVer, IMP
 #define FEAT_SPE_FnE		ID_AA64DFR0_EL1, PMSVer, V1P2
 #define FEAT_BRBE		ID_AA64DFR0_EL1, BRBE, IMP
-- 
2.39.2


