Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BACF5C5B569
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 20:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HLRiy4oEDRFIIclyBYhYlhcWJlQi8Yh+K5tmL2UyuoU=; b=R/6ggfVPBIdQZCEkuz6AkHCB0i
	Y95dVY8tELnPZylNfxb+Il14YSIpeeHmfNhc6cK2dPsjYgeL/EWr153g/Yvi76zeKnS7pwEe/EYfE
	4h+Yi9qWuHJTY+e/Fs2aDPiIIDKGj8Gr4ANUolkKwcU9L/vMti/vsYtHD4u198oOuZVKW8s/3CEKY
	SjI1oQeG04nZt38VVS5aEiJDDM2klf+U9dm/055BYGknXbhMAcbrNB029N4czxea3Ja4jmGWLmocF
	auC5lHrmCxNg8LGNOhaJpgDEXR63jpDfuI8NFvROsB254gRXr48Rtaaj0EuLWBwfdL98PsxJWvoRp
	wv7YxZRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyV-0000000Cqxk-1rKX;
	Mon, 10 Aug 2026 20:51:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtWyR-0000000Cqvk-26oZ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 20:51:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 929A61655;
	Mon, 10 Aug 2026 13:51:49 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A27EA3F673;
	Mon, 10 Aug 2026 13:51:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786395113; bh=+00wwLx2iD8NqUqVubsawzy5FD696qdsjH5gps6fsU8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g34esSVbwgvbpFnxNBpR1Me1bmsksw0WYXt0Sq2xiR4AT3vfjPITtqT56LaFKP/RB
	 QKtAiNOmsH1OF4L1utKZU8Q+ej6AIMcG9Exk7XpM2YkOUJmO9IpGxXYpfNcCzf3Mc6
	 sajgsFgdsiv8DS4sLiamM19Dv6DOy1LCb2CK+QL4=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v5 2/6] KVM: arm64: nv: Introduce guest stage-2 tracking structures
Date: Mon, 10 Aug 2026 21:50:34 +0100
Message-ID: <20260810205038.118843-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260810205038.118843-1-weilin.chang@arm.com>
References: <20260810205038.118843-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_135155_620422_8C49BD2C 
X-CRM114-Status: GOOD (  17.19  )
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

In order to avoid unmapping all shadow stage-2 mappings when KVM
receives a MMU notifier unmap call, we have to keep track of the
canonical IPA -> nested IPA relationship of the shadow mappings
created. This essentially means tracking the guest's stage-2.

To do this, represent each mapping by struct kvm_guest_s2_mapping. It
stores the mapping's canonical IPA range and the nested IPA range using
two interval tree nodes. Both nodes will be inserted into their
respective interval trees called guest_s2_mappings. The canonical IPA
ranges will be stored in the tree within the canonical MMU, and the
nested IPA ranges will be stored in the corresponding nested MMU's tree.

For example:

struct kvm_guest_s2_mapping mapping1, mapping2;

    ---------------------> mapping2.canonical
    |                      mapping1.canonical
    |                          ^   (both stored in canonical mmu's tree)
    |                          |
--*****-----------------------*****----------- CIPA
   \\\\\                      |||||                  mapping1.nested_mmu
    \\\\\                     \\\\\                            |
     \\\\\                     \\\\\                           v
------\\\\\---------------------*****--------- NIPA #1 (nested mmu #1)
       \\\\\                      |
        \\\\\                     -> mapping1.nested
         \\\\\                       (stored in nested mmu #1's tree)
          \\\\\
-----------*****------------------------------ NIPA #2 (nested mmu #2)
             |                                                 ^
             -> mapping2.nested                                |
                (stored in nested mmu #2's tree)   mapping2.nested_mmu

Using the trees we can look up nodes in either of the IPA spaces, and
for each node, find the corresponding range in the other IPA space from
the other node in the enclosing kvm_guest_s2_mapping.

Define kvm_guest_s2_mapping and the interval tree here. Guest stage-2
mapping tracking will come in subsequent patches.

Signed-off-by: Wei-Lin Chang <weilin.chang@arm.com>
---
 arch/arm64/include/asm/kvm_host.h | 17 +++++++++++++++++
 arch/arm64/kvm/mmu.c              | 30 ++++++++++++++++++++++++++++++
 arch/arm64/kvm/nested.c           |  1 +
 3 files changed, 48 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index bae2c4f92ef5..0695c4ef93f1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -14,6 +14,7 @@
 #include <linux/arm-smccc.h>
 #include <linux/bitmap.h>
 #include <linux/types.h>
+#include <linux/interval_tree.h>
 #include <linux/jump_label.h>
 #include <linux/kvm_types.h>
 #include <linux/maple_tree.h>
@@ -150,6 +151,16 @@ struct kvm_vmid {
 	atomic64_t id;
 };
 
+/*
+ * Record of a guest stage-2 mapping, storing canonical and nested IPA
+ * ranges. Both ranges have the same size.
+ */
+struct kvm_guest_s2_mapping {
+	struct interval_tree_node canonical;
+	struct interval_tree_node nested;
+	struct kvm_s2_mmu *nested_mmu;
+};
+
 struct kvm_s2_mmu {
 	struct kvm_vmid vmid;
 
@@ -227,6 +238,9 @@ struct kvm_s2_mmu {
 	 */
 	bool	pending_unmap;
 
+	/* Guest s2 mapping records indexed in this MMU's IPA space. */
+	struct rb_root_cached guest_s2_mappings;
+
 	/*
 	 *  0: Nobody is currently using this, check vttbr for validity
 	 * >0: Somebody is actively using this.
@@ -326,6 +340,9 @@ struct kvm_arch {
 	size_t nested_mmus_size;
 	int nested_mmus_next;
 
+	/* Guest s2 tracking trees access serialization. */
+	spinlock_t guest_s2_tracking_lock;
+
 	/* Interrupt controller */
 	struct vgic_dist	vgic;
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 336dd8f7e8ab..59b4f583240e 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -7,6 +7,7 @@
 #include <linux/acpi.h>
 #include <linux/mman.h>
 #include <linux/kvm_host.h>
+#include <linux/interval_tree.h>
 #include <linux/io.h>
 #include <linux/hugetlb.h>
 #include <linux/sched/signal.h>
@@ -1033,6 +1034,8 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
 
 	mmu->pgd_phys = __pa(pgt->pgd);
 
+	mmu->guest_s2_mappings = RB_ROOT_CACHED;
+
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
 		kvm_init_nested_s2_mmu(mmu);
 
@@ -1122,10 +1125,32 @@ void stage2_unmap_vm(struct kvm *kvm)
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
+static void guest_s2_tracking_destroy(struct kvm_s2_mmu *mmu,
+				      struct rb_root_cached *tree)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+	struct kvm_guest_s2_mapping *mapping;
+	struct interval_tree_node *node;
+
+	while ((node = interval_tree_iter_first(tree, 0, ULONG_MAX))) {
+		interval_tree_remove(node, tree);
+
+		if (!kvm_is_nested_s2_mmu(kvm, mmu)) {
+			mapping = container_of(node, struct kvm_guest_s2_mapping,
+					       canonical);
+			/* The canonical MMU is destroyed after the nested MMUs. */
+			kfree(mapping);
+		}
+
+		cond_resched();
+	}
+}
+
 void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 {
 	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
 	struct kvm_pgtable *pgt = NULL;
+	struct rb_root_cached mappings_tree;
 
 	write_lock(&kvm->mmu_lock);
 	pgt = mmu->pgt;
@@ -1138,12 +1163,17 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
 	if (kvm_is_nested_s2_mmu(kvm, mmu))
 		kvm_init_nested_s2_mmu(mmu);
 
+	mappings_tree = mmu->guest_s2_mappings;
+	mmu->guest_s2_mappings = RB_ROOT_CACHED;
+
 	write_unlock(&kvm->mmu_lock);
 
 	if (pgt) {
 		kvm_stage2_destroy(pgt);
 		kfree(pgt);
 	}
+
+	guest_s2_tracking_destroy(mmu, &mappings_tree);
 }
 
 static void hyp_mc_free_fn(void *addr, void *mc)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index dfb96edbdc43..744aacba61ae 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -49,6 +49,7 @@ void kvm_init_nested(struct kvm *kvm)
 	kvm->arch.nested_mmus = NULL;
 	kvm->arch.nested_mmus_size = 0;
 	atomic_set(&kvm->arch.vncr_map_count, 0);
+	spin_lock_init(&kvm->arch.guest_s2_tracking_lock);
 }
 
 static int init_nested_s2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu)
-- 
2.43.0


