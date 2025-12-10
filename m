Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3D06D3C928
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 17:30:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDFUIGxFYMr4BSUdcxiZh0xFZkZ9RF4q+M33sbxu/VI=; b=ecC4gBlomYtYiKKPgdDlKiBlQb
	tnqPMnqC0u0xDufMzf9hy/Ndnpsq/ZoONmwWAERVB6g/odB6yaeHLZ+TRXUaQY3mSM62zDZtYQBb+
	Vrk4eIzwLiKfG4gBL2EtE1mJzh9mynwABy9le+Djm//FaoCDChteZ+qxchRUsdfPZFYgYrVbF8bJM
	s9Tf27gq9iu0qzdJGATMgR4nMqyMQEo968OxfzYTNtlhuq9d9hKnkbfs+BVgWI+c6DoNu7Yk95XBv
	6ElNE/C2niqLECkTy4EW0WxygvNC69uJF7bBOEAYKXr9OtwtMLhWxhgh6uloR9AmE4MUmbqmWeL7n
	d8W+TVaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1W-0000000FhOO-18a2;
	Wed, 10 Dec 2025 17:30:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTO1L-0000000FhFK-0q1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Dec 2025 17:30:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BF11644427;
	Wed, 10 Dec 2025 17:30:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 968ECC19422;
	Wed, 10 Dec 2025 17:30:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765387833;
	bh=iGSMpz04w1pT5imROni6zGKAJvnyidKOwCelMQ5/JEE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cN4+VWQ5vXNaiCRn3F7lZJoCuzk2W1TRBj4QsVTqfyJ8IChFjyo3mjP2UdAsi7dcg
	 /Lg0LawE37PYE2hPxvJ7+mT9G57ACOu4OA4SDBAR+ovD0N99X3Xvi31G3Z+A1BtqS8
	 Wo5plDhlj7d+lrOIBVZJLwM/LmraazVzX8uWhoBRrq1k1Te/nhl9J3T6C8ChYIGVeM
	 K0m1H/iGAinlabT6+J6zK5v5OmCvYb/C6b41+Yta67qK2zTqqKSUMZ+l3dwG6Qv6sA
	 /VDgLkTo4jess+eWsPkfStjvawHsGJaoFaj3aeEXiEH3Wsz2lVCMw1AJ7PsjMIGIvN
	 Wenct/2ZN59Ow==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vTO1H-0000000BnnB-3Huj;
	Wed, 10 Dec 2025 17:30:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Sascha Bischoff <Sascha.Bischoff@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: [PATCH v2 6/6] KVM: arm64: Honor UX/PX attributes for EL2 S1 mappings
Date: Wed, 10 Dec 2025 17:30:24 +0000
Message-ID: <20251210173024.561160-7-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251210173024.561160-1-maz@kernel.org>
References: <20251210173024.561160-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, alexandru.elisei@arm.com, Sascha.Bischoff@arm.com, qperret@google.com, tabba@google.com, sebastianene@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_093035_317989_C57DA974 
X-CRM114-Status: GOOD (  12.83  )
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

Now that we potentially have two bits to deal with when setting
execution permissions, make sure we correctly handle them when both
when building the page tables and when reading back from them.

Reported-by: Alexandru Elisei <alexandru.elisei@arm.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/include/asm/kvm_pgtable.h | 12 +++---------
 arch/arm64/kvm/hyp/pgtable.c         | 24 +++++++++++++++++++++---
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index be68b89692065..095e6b73740a6 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -87,15 +87,9 @@ typedef u64 kvm_pte_t;
 
 #define KVM_PTE_LEAF_ATTR_HI_SW		GENMASK(58, 55)
 
-#define __KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
-#define __KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
-#define __KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
-
-#define KVM_PTE_LEAF_ATTR_HI_S1_XN					\
-	({ cpus_have_final_cap(ARM64_KVM_HVHE) ?			\
-			(__KVM_PTE_LEAF_ATTR_HI_S1_UXN |		\
-			 __KVM_PTE_LEAF_ATTR_HI_S1_PXN) :		\
-			__KVM_PTE_LEAF_ATTR_HI_S1_XN; })
+#define KVM_PTE_LEAF_ATTR_HI_S1_XN	BIT(54)
+#define KVM_PTE_LEAF_ATTR_HI_S1_UXN	BIT(54)
+#define KVM_PTE_LEAF_ATTR_HI_S1_PXN	BIT(53)
 
 #define KVM_PTE_LEAF_ATTR_HI_S2_XN	GENMASK(54, 53)
 
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index e0bd6a0172729..97c0835d25590 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -342,6 +342,9 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
 	if (!(prot & KVM_PGTABLE_PROT_R))
 		return -EINVAL;
 
+	if (!cpus_have_final_cap(ARM64_KVM_HVHE))
+		prot &= ~KVM_PGTABLE_PROT_UX;
+
 	if (prot & KVM_PGTABLE_PROT_X) {
 		if (prot & KVM_PGTABLE_PROT_W)
 			return -EINVAL;
@@ -351,8 +354,16 @@ static int hyp_set_prot_attr(enum kvm_pgtable_prot prot, kvm_pte_t *ptep)
 
 		if (system_supports_bti_kernel())
 			attr |= KVM_PTE_LEAF_ATTR_HI_S1_GP;
+	}
+
+	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
+		if (!(prot & KVM_PGTABLE_PROT_PX))
+			attr |= KVM_PTE_LEAF_ATTR_HI_S1_PXN;
+		if (!(prot & KVM_PGTABLE_PROT_UX))
+			attr |= KVM_PTE_LEAF_ATTR_HI_S1_UXN;
 	} else {
-		attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
+		if (!(prot & KVM_PGTABLE_PROT_PX))
+			attr |= KVM_PTE_LEAF_ATTR_HI_S1_XN;
 	}
 
 	attr |= FIELD_PREP(KVM_PTE_LEAF_ATTR_LO_S1_AP, ap);
@@ -373,8 +384,15 @@ enum kvm_pgtable_prot kvm_pgtable_hyp_pte_prot(kvm_pte_t pte)
 	if (!kvm_pte_valid(pte))
 		return prot;
 
-	if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_XN))
-		prot |= KVM_PGTABLE_PROT_X;
+	if (cpus_have_final_cap(ARM64_KVM_HVHE)) {
+		if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_PXN))
+			prot |= KVM_PGTABLE_PROT_PX;
+		if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_UXN))
+			prot |= KVM_PGTABLE_PROT_UX;
+	} else {
+		if (!(pte & KVM_PTE_LEAF_ATTR_HI_S1_XN))
+			prot |= KVM_PGTABLE_PROT_PX;
+	}
 
 	ap = FIELD_GET(KVM_PTE_LEAF_ATTR_LO_S1_AP, pte);
 	if (ap == KVM_PTE_LEAF_ATTR_LO_S1_AP_RO)
-- 
2.47.3


