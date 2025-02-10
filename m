Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47230C021AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zOFwz3OREC0yr094Ofm95cL0ydxBVV5CQMqDeFtevUg=; b=u+KfpvV+N/akTAHmzEfZj5fX7M
	Ypxw7uQT8qtSzSwu73wPz3IloFJtY466CDVAv+MUWkK2eig6IZ4+2DXXHzHsVM6q3sc2bNxTIIniW
	PJD2LdsnuVdf0m2V+eqbDLwCXZff5G7ZnccixlsdXBSo97nrvPdiR6zRcsN7OJfaQUyQ+dk1gRj+P
	bVOuC7X0rvzpXrThmGSH8rNDoZmNXUyNdvCHIao7657GEwJ6hIUzFo0/f8FFkWvYTJdshvYJyY1AN
	pB8kB+8lhNJUzu4EO+3gZ/t+iNi0FJPK5l8E1O32378feEprKn5SkLThwkWvjVTh+jkPud3qLOYMh
	XyP0whQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZYd-000000016o3-3PDn;
	Mon, 10 Feb 2025 19:35:03 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYjL-00000000yvO-1AMI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:42:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2571C5C5E0D;
	Mon, 10 Feb 2025 18:41:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E852C4CED1;
	Mon, 10 Feb 2025 18:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212922;
	bh=VSyPFnhCYOtTO8DIctfyzOrtKdn/+D3yosLZiPowUhI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QXHyzZ49TycI4lbYjM7DLwmiL/Eh/bLzs2lPM5UYo07Szi7RSJQWZ45GTdoAEFn67
	 6KLXe1bAoZbkHcFopEghP6nhhXMiwSZeLdxdBf9pSH7J+b3jCN9r9DqZkT/onBXnu5
	 tOIVLPORXNiht0bfH0A3B9Qu1TjV7nut8Sn4ZDNCgy5d5rbOkuPzTHNEEoKE/Duzv4
	 bA2H+0Y3i4gPOwlFGy1Zl6bl48SDQnKqOizw0YpzByVbl1+/9t7QqqCEDD4Ycxjmxn
	 iCF4AMQbwjM7q+GPxrr8hnENjtd+4tUP5+9LTOTzqWku3ReOwTYr2ffwp8ghq9a+Zl
	 T4bqNcB+dTR+A==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1thYjI-002g2I-IP;
	Mon, 10 Feb 2025 18:42:00 +0000
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
Subject: [PATCH 14/18] KVM: arm64: Use KVM-specific HCRX_EL2 RES0 mask
Date: Mon, 10 Feb 2025 18:41:45 +0000
Message-Id: <20250210184150.2145093-15-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20250210184150.2145093-1-maz@kernel.org>
References: <20250210184150.2145093-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oliver.upton@linux.dev, yuzenghui@huawei.com, mark.rutland@arm.com, tabba@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_104203_419075_14F7E77A 
X-CRM114-Status: GOOD (  17.03  )
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
index af87afae6ca3d..67b381e4c1e14 100644
--- a/arch/arm64/include/asm/kvm_arm.h
+++ b/arch/arm64/include/asm/kvm_arm.h
@@ -323,10 +323,20 @@
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


