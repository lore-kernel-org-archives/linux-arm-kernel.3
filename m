Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5647BC982C1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 15:43:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ztyh0a+vXJ3jUJUPZfBAdjUE+owWJwL3VgcSSjqCAzY=; b=CNI6Tj6yvKiQ7cg7IkMgdIOK1I
	3+RvytBo5p4ULpjs9yNtiG3IxP/vmVNEnBWxfEqYuitCYDr7SmyzsSlc2v8z1ckuN8MAZAKTC0E51
	djPK+WUfSz+e1omlUmvF5ZEIRnoackM6httehDrY+biQXl+Oy9qp75V2a5ovSzoJJ4eLWQ4cdwdax
	cgPBQhWnU7z+xkDw6Xeisi8f1NzgKLb2mPcqjr+4B0EwGZce7x6MhkgpmJW6e/legevynaCrkL2Zn
	dNz+j9SoNOWhUXYMumgR/BF0VZPOhkIf0at9VBUlaEAYUwX8Jy4A4LTNVgwvcb5KVmJh+7rzJTPy8
	VTKT0qRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJs-00000007GU9-06Po;
	Tue, 15 Sep 2026 15:43:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VJl-00000007GRc-3nLB
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 15 Sep 2026 15:43:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ztyh0a+vXJ3jUJUPZfBAdjUE+owWJwL3VgcSSjqCAzY=; b=XsdgNDWZ7Ka5ygvgWF5ASkIX6E
	C2lJ4F4uhkpR1uuW+mwkDr83sHEmsqmOGtaqyp4OC8QwaRbCorZbwXKct37cRuWnXKcTGAbBlXI7R
	P2ZcNcMh98l9xMiB1uv1J9rGiq59Klc65JAyMew5EM5wbFInFLPbK4HGws0TYJB1wUDtfXI6wZGsB
	Ju8DsQ5Ud9/zoMjHcTYdiz8YKOhUo9nEvNd2D85IssUm92ciQZyfKwytZNUn6r2qqkol4IaP4tS87
	0iKoeNIq5124O7wd1dZ/40yolx4aJEgdwzZ9WG2khKZlVOAXpUqoNUrBiXN5XfvC/ZoO/uqDfoPiy
	vzHlWp3Q==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6VJi-00000006xxs-3NeO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 15:43:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E88A8169E;
	Tue, 15 Sep 2026 08:43:24 -0700 (PDT)
Received: from workstation-e142269.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EB8B73F882;
	Tue, 15 Sep 2026 08:43:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789487008; bh=eZi0YOrnOLSovTu30sPts42LqDHKJiClC5gUuLSflSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HTmx64G9LOeaRQY06AYRfv2R9UcGo7zFxMq21gHcUf+6r9pEwBDPHJW0uGwC/2f6t
	 aiR/3AhQeu3xbxabtRQSt457EnzjWt0jFzaPF3fboYdMOR4Il9+rQE6bkNL798KR5A
	 sbvHwAjIe9ezOBTK4X+K//kIJkzbNi4nXapUk98M=
From: Wei-Lin Chang <weilin.chang@arm.com>
To: linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Fuad Tabba <fuad.tabba@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Itaru Kitayama <itaru.kitayama@fujitsu.com>,
	Wang Han <wanghan@linux.alibaba.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	"Lorenzo Stoakes (ARM)" <ljs@kernel.org>,
	Wei-Lin Chang <weilin.chang@arm.com>
Subject: [PATCH v6 2/7] KVM: arm64: nv: Introduce guest stage-2 tracking structures
Date: Tue, 15 Sep 2026 16:43:00 +0100
Message-ID: <20260915154305.3852871-3-weilin.chang@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915154305.3852871-1-weilin.chang@arm.com>
References: <20260915154305.3852871-1-weilin.chang@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_164331_249586_59352848 
X-CRM114-Status: GOOD (  17.58  )
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
 arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
 arch/arm64/kvm/nested.c           |  1 +
 3 files changed, 42 insertions(+)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index cd9b9d2462f9..365ec57d6d7a 100644
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
index 671e2941d619..061cd1e09af2 100644
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
 
@@ -1122,10 +1125,25 @@ void stage2_unmap_vm(struct kvm *kvm)
 	srcu_read_unlock(&kvm->srcu, idx);
 }
 
+static void guest_s2_tracking_destroy(struct rb_root_cached *tree)
+{
+	struct kvm_guest_s2_mapping *mapping;
+	struct interval_tree_node *node;
+
+	while ((node = interval_tree_iter_first(tree, 0, ULONG_MAX))) {
+		interval_tree_remove(node, tree);
+		mapping = container_of(node, struct kvm_guest_s2_mapping,
+				       canonical);
+		kfree(mapping);
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
@@ -1138,12 +1156,18 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
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
+	if (!kvm_is_nested_s2_mmu(kvm, mmu))
+		guest_s2_tracking_destroy(&mappings_tree);
 }
 
 static void hyp_mc_free_fn(void *addr, void *mc)
diff --git a/arch/arm64/kvm/nested.c b/arch/arm64/kvm/nested.c
index d60f6f69e293..b7bed02e38f7 100644
--- a/arch/arm64/kvm/nested.c
+++ b/arch/arm64/kvm/nested.c
@@ -52,6 +52,7 @@ int kvm_init_nested(struct kvm *kvm)
 					      GFP_KERNEL_ACCOUNT);
 	kvm->arch.nested_mmus_size = 0;
 	atomic_set(&kvm->arch.vncr_tlb_count, 0);
+	spin_lock_init(&kvm->arch.guest_s2_tracking_lock);
 
 	return kvm->arch.nested_mmus ? 0 : -ENOMEM;
 }
-- 
2.43.0


