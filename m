Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73324606A9B6
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Nov 2026 14:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R7iOfxqS;
	dkim=pass (1024-bit key, unprotected) header.d=arm.com header.i=@arm.com header.a=rsa-sha256 header.s=foss header.b=ihkfHa+L
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=O9l6+4J6Q0JAqhCl13z5dKK4aG9ZFyHBKaMA7d29aaA=; b=R7iOfxqSlTetHu
	Egf97RzIWXFor5DWgndYToi5uTaX5zC1pOvFsvGE4Hsptp84PioLEvxvQQuXhuWgFXy9/saSl71Bj
	FlAQ4a4VraMKXtbudjYJmGTjD5KbXronxRv6xcUM1TJpfarvwhUYi5SU+YMJeFjXInoDSfrhJ/dCj
	jsIzsE10z26OS8CoPFRo4RP2RigvsISrRfna2DrzcPMjum2wsYqruSeKGHWR1F4KdNnzKbnkSVJ3B
	IgEEM4viQksaDh4oyzaRy5j9XIrD3Ft3bbl/CDPX2+wA27CQnsfxcz48Nt/LaqRxT8djpOd40owkm
	tizulwOCfPHiANsgkkVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsnr-0000000GkI1-39rt;
	Mon, 02 Nov 2026 14:14:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNsno-0000000GkEj-1INn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Nov 2026 14:14:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6E0E91691;
	Mon,  2 Nov 2026 06:14:20 -0800 (PST)
Received: from e122027.arm.com (unknown [10.57.58.9])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C848E3F59E;
	Mon,  2 Nov 2026 06:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1793628863; bh=vDEqOjWV7ICBwPmWvU+CuAGa9z+MEe1Eh70c6qnULq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ihkfHa+Lf5iT8gcKObEx1DQ/iVmmotF8Tms2upU7MAkdUAQGTjRCYGgXU0JfO+JiF
	 rt0o702pi4TC78wIFrTYRjLO+Bmm/RatfYYrEytc2szdp7pVQnwvp+UZ70oSKwhNer
	 8a0UQtJJEX13PV39etg/0aGd0hkrFR6W61rLM9Uw=
From: Steven Price <steven.price@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	James Morse <james.morse@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>,
	Zenghui Yu <yuzenghui@huawei.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Joey Gouly <joey.gouly@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Christoffer Dall <christoffer.dall@arm.com>,
	Fuad Tabba <tabba@google.com>,
	linux-coco@lists.linux.dev,
	Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
	Gavin Shan <gshan@redhat.com>,
	Shanker Donthineni <sdonthineni@nvidia.com>,
	Alper Gun <alpergun@google.com>,
	"Aneesh Kumar K . V" <aneesh.kumar@kernel.org>,
	Emi Kisanuki <fj0570is@fujitsu.com>,
	Vishal Annapurve <vannapurve@google.com>,
	WeiLin.Chang@arm.com,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH 11/11] KVM: arm64: CCA: Add Realm stage-2 MMU operations
Date: Mon,  2 Nov 2026 14:13:02 +0000
Message-ID: <20261102141304.126883-12-steven.price@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261102141304.126883-1-steven.price@arm.com>
References: <20261102141304.126883-1-steven.price@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261102_061425_237192_89B59292 
X-CRM114-Status: GOOD (  13.26  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Suzuki K Poulose <suzuki.poulose@arm.com>

Register the Realm stage-2 MMU operations now that the RMM mapping
and unmapping helpers are available. Route unmapping through the
RMM, and use the existing fault handler for Realm memory faults.

The RMM handles TLB invalidation when stage-2 mappings change, so
the host has no separate TLB flush to perform. Realm stage-2 does
not support access flags, including for shared IPAs.

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
Signed-off-by: Steven Price <steven.price@arm.com>
---
 arch/arm64/kvm/mmu.c | 33 ++++++++++++++++++++++++++++++++-
 1 file changed, 32 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 20aedbe6ec07..bb33c07569e3 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -191,6 +191,12 @@ static int kvm_vm_flush_remote_tlbs(struct kvm *kvm)
 	return 0;
 }
 
+static int realm_flush_remote_tlbs(struct kvm *kvm)
+{
+	/* Nothing to do here, RMM does the job */
+	return 0;
+}
+
 /**
  * kvm_arch_flush_remote_tlbs() - flush all VM TLB entries for v7/8
  * @kvm:	pointer to kvm structure.
@@ -218,6 +224,13 @@ static int kvm_vm_flush_remote_tlbs_range(struct kvm *kvm,
 	return 0;
 }
 
+static int realm_flush_remote_tlbs_range(struct kvm *kvm,
+					 gfn_t gfn, u64 nr_pages)
+{
+	/* Nothing to do here, RMM does the job */
+	return 0;
+}
+
 int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
 				     gfn_t gfn, u64 nr_pages)
 {
@@ -353,6 +366,15 @@ static void no_stage2_unmap_range(struct kvm_s2_mmu *mmu,
 {
 }
 
+static void realm_stage2_unmap_range(struct kvm_s2_mmu *mmu,
+				     phys_addr_t start, u64 size, bool may_block,
+				     enum kvm_gfn_range_filter filter)
+{
+	struct kvm *kvm = kvm_s2_mmu_to_kvm(mmu);
+
+	kvm_realm_unmap_range_filter(kvm, start, size, may_block, filter);
+}
+
 /*
  * Unmapping vs dcache management:
  *
@@ -3291,6 +3313,15 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
+static const struct kvm_vm_s2_ops realm_vm_s2_ops = {
+	.vm_flush_remote_tlbs		= realm_flush_remote_tlbs,
+	.vm_flush_remote_tlbs_range	= realm_flush_remote_tlbs_range,
+	.vm_age_gfn			= no_age_gfn,
+	.vm_test_age_gfn		= no_age_gfn,
+	.vm_stage2_unmap_range		= realm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
+};
+
 #define KVM_VM_S2_OPS(flavor, ops)		\
 		[flavor] = &(ops)
 
@@ -3299,7 +3330,7 @@ static const struct kvm_vm_s2_ops *arm64_vm_s2_ops[] = {
 	KVM_VM_S2_OPS(VM_NVHE, kvm_default_vm_s2_ops),
 	KVM_VM_S2_OPS(VM_PKVM, pkvm_vm_s2_ops),
 	KVM_VM_S2_OPS(VM_PROTECTED_PKVM, protected_pkvm_vm_s2_ops),
-	[VM_REALM] = NULL,
+	KVM_VM_S2_OPS(VM_REALM, realm_vm_s2_ops),
 };
 
 static int kvm_vm_init_vm_s2_ops(struct kvm *kvm)
-- 
2.43.0


