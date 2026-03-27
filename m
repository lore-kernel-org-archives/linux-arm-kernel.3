Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D80C10ED64A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZzRs9uQkPgiHfbZEpsdu0nSfteqrXKxz9ECItSznHeM=; b=LYxljlLiGp1jMr89JI++jYqW1H
	N7OlXeNfbfiyi8XNEfpo5iHgzKRzi3KiGbsOXFEm2dat8S0NgH+MGyJjjqZ6sNZbAHs2bTD7xN7SU
	5lCHXCXy4Gb3NlaihK95Ou4ur9/XEJDB0yls/ymWV3PYhBSDSv+IutA0iERA4D9tgO/7lsS5sL6NP
	J5WHKJ7y+Dx3ZQKfTkzSeJTOl9D95b1xmsCTVR/BzpljsIfC0Ohuo7qDSgJWvoMmVi9zJv49MvZ4Y
	vHuk3isc/A9R9Zf6v284P0asOLRPi8PKw0H+CkSMtoDIA4iOMtq/wYNHXhD2c40LKYzwDRAeUA1Qm
	KccsirNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65Ug-00000007FN6-1qMY;
	Fri, 27 Mar 2026 11:36:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w65UJ-00000007F2L-1Izo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 11:36:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F184D4475B;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D42BBC19423;
	Fri, 27 Mar 2026 11:36:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774611386;
	bh=N9bhiVx5Vh1CUIB4IHblaqgBEI4KzyxLhqGgwc8mT8U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ZXcZJB+fmHnNctN4JagniqSKrNn0NZ+FF4d2/PMUsVXHYe5ozVi1Vs6wDCbhkMWVl
	 kbtsBMwriXE8+iqnod94kKQkkDBVidwwEVKZcZ4hI4MrVEg4e+awoETdz8J3zNhWZ4
	 jUCKaCTeno52ao89BJn2QEn75PidrxH8ZDQtZyO/KVhspUdROjDEry0V3FvSHUaM//
	 DR6stROoc8egaC8wuX45Sxu8jE+suyLZlCYKjg/jxRWbnyr/LVNDORgcwGNy4vktIs
	 MOOMECQw3PCmkSSSDiTQlcf3OcNMrRBR0GR08ZosciOpZgKGGTX2eYWtihYX+zpLG7
	 M+5v6BFhqS9Xg==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1w65UG-00000006K4a-4Adm;
	Fri, 27 Mar 2026 11:36:25 +0000
From: Marc Zyngier <maz@kernel.org>
To: kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	kvm@vger.kernel.org
Cc: Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oupton@kernel.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Fuad Tabba <tabba@google.com>,
	Will Deacon <will@kernel.org>,
	Quentin Perret <qperret@google.com>
Subject: [PATCH v2 12/30] KVM: arm64: Hoist MTE validation check out of MMU lock path
Date: Fri, 27 Mar 2026 11:36:00 +0000
Message-ID: <20260327113618.4051534-13-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327113618.4051534-1-maz@kernel.org>
References: <20260327113618.4051534-1-maz@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, oupton@kernel.org, yuzenghui@huawei.com, tabba@google.com, will@kernel.org, qperret@google.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_043627_411839_37BF96A2 
X-CRM114-Status: GOOD (  15.11  )
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

From: Fuad Tabba <tabba@google.com>

Simplify the non-cacheable attributes assignment by using a ternary
operator. Additionally, hoist the MTE validation check (mte_allowed) out
of kvm_s2_fault_map() and into kvm_s2_fault_compute_prot(). This allows
us to fail faster and avoid acquiring the KVM MMU lock unnecessarily
when the VMM introduces a disallowed VMA for an MTE-enabled guest.

Signed-off-by: Fuad Tabba <tabba@google.com>
Signed-off-by: Marc Zyngier <maz@kernel.org>
---
 arch/arm64/kvm/mmu.c | 28 ++++++++++++----------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 0c71e3a9af8b0..ee2a548999b1b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1870,18 +1870,21 @@ static int kvm_s2_fault_compute_prot(struct kvm_s2_fault *fault)
 	if (fault->exec_fault)
 		fault->prot |= KVM_PGTABLE_PROT_X;
 
-	if (fault->s2_force_noncacheable) {
-		if (fault->vm_flags & VM_ALLOW_ANY_UNCACHED)
-			fault->prot |= KVM_PGTABLE_PROT_NORMAL_NC;
-		else
-			fault->prot |= KVM_PGTABLE_PROT_DEVICE;
-	} else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC)) {
+	if (fault->s2_force_noncacheable)
+		fault->prot |= (fault->vm_flags & VM_ALLOW_ANY_UNCACHED) ?
+			       KVM_PGTABLE_PROT_NORMAL_NC : KVM_PGTABLE_PROT_DEVICE;
+	else if (cpus_have_final_cap(ARM64_HAS_CACHE_DIC))
 		fault->prot |= KVM_PGTABLE_PROT_X;
-	}
 
 	if (fault->nested)
 		adjust_nested_exec_perms(kvm, fault->nested, &fault->prot);
 
+	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
+		/* Check the VMM hasn't introduced a new disallowed VMA */
+		if (!fault->mte_allowed)
+			return -EFAULT;
+	}
+
 	return 0;
 }
 
@@ -1918,15 +1921,8 @@ static int kvm_s2_fault_map(struct kvm_s2_fault *fault, void *memcache)
 		}
 	}
 
-	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm)) {
-		/* Check the VMM hasn't introduced a new disallowed VMA */
-		if (fault->mte_allowed) {
-			sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
-		} else {
-			ret = -EFAULT;
-			goto out_unlock;
-		}
-	}
+	if (!fault->fault_is_perm && !fault->s2_force_noncacheable && kvm_has_mte(kvm))
+		sanitise_mte_tags(kvm, fault->pfn, fault->vma_pagesize);
 
 	/*
 	 * Under the premise of getting a FSC_PERM fault, we just need to relax
-- 
2.47.3


