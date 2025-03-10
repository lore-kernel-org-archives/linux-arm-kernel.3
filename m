Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C701C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 13:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=neIfYHGtqMz3+nOFUuTHu5bRKgPI8GOGY0XmkRTcxMY=; b=Kojyu1OTtIIYcJzNnc9KhZsGpJ
	8j8t4rgsLn7ey56qCZaW+V/R8y6dmeO5RuPJetvGfcQsWIWakxfy3pwhUErU/5dh+jTkq0Yk7U4UE
	z0Ras/DSzK8Q0bifK6WydbVxRuLhFpzjZkXu247xKTygKlYu/zWNaEl7ThWqE+DLsh8X2CPG4p03B
	diasNj0C4x/8cw9rzkunJrGLiA4as1A8wXM3QsrW7OthF0EGiZbRj5MhMl1nXQEkuABqfadiG/aSt
	gAoTjMBuHggOWsJnSYdUqwmPBvwOKPIONZEmn0HDkjj5XhzhBkFDr2DLxoR28+jDsAWnS3oWOkS7V
	y6Tgdhsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trctS-00000002jhF-0CZJ;
	Mon, 10 Mar 2025 13:10:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trcC4-00000002bSS-1sRu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Mar 2025 12:25:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 700585C6301;
	Mon, 10 Mar 2025 12:22:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10443C4CEF3;
	Mon, 10 Mar 2025 12:25:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741609516;
	bh=xp93Ax3ZY3cy/9jRe90kxjTcUJ7hVTFmw+yK2iZ3fJY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Xd4n0S6Br/rRtAO6GbpR+OIRDQaNv0R4Ld/sANGbUX4cipcAxcwdnOb7Qo1DKlkd7
	 NH7uKc9Awlk6/ZTMh+mVu2AsBUtLrIO0QbWbnN72jYPRVC7nwHXH9/UrpNPr9uh3nd
	 FAXZBfnIi+slIs9c/V6gp9r2V8a5+C0cSqIXthn9p7wDjdeTRWrE0cQP5JkiboN4Db
	 5pO/7gvBaPgOEI6VFDhqFb5CDxwh4iApcW+v9wAvWglUrLY3I+BK0nd3ZcAqWUzRKD
	 mW8aCRUc+SPfYkSZ6dyqXpO1YtTlCJli0bqUJ2VYPAGwrjPWjp1fF6fH05vgxDYh51
	 4CmVfxxWJUcnQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1trcC2-00CAea-6x;
	Mon, 10 Mar 2025 12:25:14 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 16/23] KVM: arm64: Use KVM-specific HCRX_EL2 RES0 mask
Date: Mon, 10 Mar 2025 12:24:58 +0000
Message-Id: <20250310122505.2857610-17-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250310122505.2857610-1-maz@kernel.org>
References: <20250310122505.2857610-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_052516_606227_ECEA0301 
X-CRM114-Status: GOOD (  17.26  )
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

We do not have a computed table for HCRX_EL2, so statically define
the bits we know about. A warning will fire if the architecture
grows bits that are not handled yet.

Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_arm.h | 18 ++++++++++++++----
 arch/arm64/kvm/emulate-nested.c  |  5 +++++
 arch/arm64/kvm/nested.c          |  4 ++--
 3 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
index 5bdeea023f01f..66012bbb8032a 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -326,10 +326,20 @@
 #define HFGRTR_EL2_RES0		HFGxTR_EL2_RES0
 #define HFGWTR_EL2_RES0		(HFGRTR_EL2_RES0 | __HFGRTR_ONLY_MASK)
 
-/* Polarity masks for HCRX_EL2 */
-#define __HCRX_EL2_RES0         HCRX_EL2_RES0
-#define __HCRX_EL2_MASK		(BIT(6))
-#define __HCRX_EL2_nMASK	~(__HCRX_EL2_RES0 | __HCRX_EL2_MASK)
+/*
+ * Polarity masks for HCRX_EL2, limited to the bits that we know about
+ * at this point in time. It doesn't mean that we actually *handle*
+ * them, but that at least those that are not advertised to a guest
+ * will be RES0 for that guest.
+ */
+#define __HCRX_EL2_MASK		(BIT_ULL(6))
+#define __HCRX_EL2_nMASK	(GENMASK_ULL(24, 14) | \
+				 GENMASK_ULL(11, 7)  | \
+				 GENMASK_ULL(5, 0))
+#define __HCRX_EL2_RES0		~(__HCRX_EL2_nMASK | __HCRX_EL2_MASK)
+#define __HCRX_EL2_RES1		~(__HCRX_EL2_nMASK | \
+				  __HCRX_EL2_MASK  | \
+				  __HCRX_EL2_RES0)
 
 /* Hyp Prefetch Fault Address Register (HPFAR/HDFAR) */
 #define HPFAR_MASK	(~UL(0xf))
diff --git a/arch/arm64/kvm/emulate-nested.c b/arch/arm64/kvm/emulate-nested.c
index 4f468759268c0..f6c7331c21ca4 100644
--- a/arch/arm64/kvm/emulate-nested.c
+++ b/arch/arm64/kvm/emulate-nested.c
@@ -2149,6 +2149,7 @@ int __init populate_nv_trap_config(void)
 	BUILD_BUG_ON(__NR_CGT_GROUP_IDS__ > BIT(TC_CGT_BITS));
 	BUILD_BUG_ON(__NR_FGT_GROUP_IDS__ > BIT(TC_FGT_BITS));
 	BUILD_BUG_ON(__NR_FG_FILTER_IDS__ > BIT(TC_FGF_BITS));
+	BUILD_BUG_ON(__HCRX_EL2_MASK & __HCRX_EL2_nMASK);
 
 	for (int i = 0; i < ARRAY_SIZE(encoding_to_cgt); i++) {
 		const struct encoding_to_trap_config *cgt = &encoding_to_cgt[i];
@@ -2174,6 +2175,10 @@ int __init populate_nv_trap_config(void)
 		}
 	}
 
+	if (__HCRX_EL2_RES0 != HCRX_EL2_RES0)
+		kvm_info("Sanitised HCR_EL2_RES0 = %016llx, expecting %016llx\n",
+			 __HCRX_EL2_RES0, HCRX_EL2_RES0);
+
 	kvm_info("nv: %ld coarse grained trap handlers\n",
 		 ARRAY_SIZE(encoding_to_cgt));
 
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index 63fe1595f318d..48b8a700de457 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -1039,8 +1039,8 @@ int kvm_init_nv_sysregs(struct kvm_vcpu *vcpu)
 	set_sysreg_masks(kvm, HCR_EL2, res0, res1);
 
 	/* HCRX_EL2 */
-	res0 = HCRX_EL2_RES0;
-	res1 = HCRX_EL2_RES1;
+	res0 = __HCRX_EL2_RES0;
+	res1 = __HCRX_EL2_RES1;
 	if (!kvm_has_feat(kvm, ID_AA64ISAR3_EL1, PACM, TRIVIAL_IMP))
 		res0 |= HCRX_EL2_PACMEn;
 	if (!kvm_has_feat(kvm, ID_AA64PFR2_EL1, FPMR, IMP))
-- 
2.39.2


