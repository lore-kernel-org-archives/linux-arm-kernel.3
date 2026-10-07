Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF5AACA5FFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 07:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MrX4/3PNnBIZ+2gpSIRFOZIO8s/C+4cs1MuFgCgOog=; b=vosXMwM0Rd0KcV/eH4zVx/5N+A
	+z1bALMcG2PZVhvJl9ctP1oPe6NjdPfXH14u6JK8E/HlN4Ba5OnqUUZHZcNPS6ush5fqRt7uBPZGA
	XkQF8uEHSGUZaVlzEL324n1+azjv18uvXZoHCMfoydzqrjBVfnSLMPQej7Bbh86kqyTWt9d0KjwUk
	B1h8xonyH3JUTqSL5uu3v4I06IE8+HQI0BYgNs69EoUyqV++uXyIjd1OCykfHkBDCKf7Iho34rk27
	ZBRjCF01ocq51VeeubTNsca/kXyIsyX8OZ88KVZ8d1bRJu02tLbbo16fYvRbTaORV781pgktTDNg2
	ZfRIElXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCe-00000001rQJ-0Jm6;
	Wed, 07 Oct 2026 07:36:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMCb-00000001rMI-1PTT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 07:36:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D251BA8;
	Wed,  7 Oct 2026 00:36:32 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A7AC03F763;
	Wed,  7 Oct 2026 00:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1791358596; bh=tza71NQDOg4X2k1O6RmUhr0Bn7KXvVWWuwVTSpCyZMM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Zl2LLEKnNHnAIe+ORJKKmn+DVW6jmpQre6Ryos01lld+3oOvWVdXFoiPBRRVpbJAh
	 r9yA60bVsqucRCFa3aAXyzTgBxqzY86D5MU8YbiHsaTeZUPb/rFz+p+xBz4u+upLFr
	 Ek+gt4HVnFkzDz5Q0uFR6G319FBukxdXBR3Fshdk=
From: Suzuki K Poulose <suzuki.poulose@arm.com>
To: kvm@vger.kernel.org,
	kvmarm@lists.linux.dev
Cc: maz@kernel.org,
	will@kernel.org,
	catalin.marinas@arm.com,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	steven.price@arm.com,
	aneesh.kumar@kernel.org,
	oupton@kernel.org,
	gshan@redhat.com,
	joey.gouly@arm.com,
	tabba@google.com,
	yuzenghui@huawei.com,
	linux-coco@lists.linux.dev,
	gankulkarni@os.amperecomputing.com,
	sdonthineni@nvidia.com,
	alpergun@google.com,
	fj0570is@fujitsu.com,
	WeiLin.Chang@arm.com,
	lpieralisi@kernel.org,
	enju.kohei@fujitsu.com,
	sudeep.holla@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v23 12/14] KVM: arm64: Abstract out memory abort handling
Date: Wed,  7 Oct 2026 08:35:35 +0100
Message-ID: <20261007073537.2454351-13-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261007073537.2454351-1-suzuki.poulose@arm.com>
References: <20261007073537.2454351-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_003637_584090_8CC6AFE6 
X-CRM114-Status: GOOD (  13.87  )
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

Move the memory abort handling under VM specific s2 operation.

Tested-by: Gavin Shan <gshan@redhat.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
Changes since v21:
 - Rename protected_vm_mem_abort => protected_pkvm_mem_abort for consistency
   with the other callbacks.
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 33 ++++++++++++++++++-------------
 2 files changed, 21 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 296a6b0323e47..2e8ba509daa0f 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -156,6 +156,7 @@ struct kvm_vcpu_ops {
 };
 
 struct kvm_gfn_range;
+struct kvm_s2_fault_desc;
 
 struct kvm_vm_s2_ops {
 	bool (*vm_age_gfn)(struct kvm *kvm, struct kvm_gfn_range *range);
@@ -166,6 +167,7 @@ struct kvm_vm_s2_ops {
 	void (*vm_stage2_unmap_range)(struct kvm_s2_mmu *mmu,
 				      phys_addr_t start, u64 size,
 				      bool may_block);
+	int (*vm_mem_abort)(const struct kvm_s2_fault_desc *s2fd);
 };
 
 struct kvm_s2_mmu {
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 46d23483db4b0..9821cac0dce4b 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1740,7 +1740,7 @@ struct kvm_s2_fault_vma_info {
 	bool		map_non_cacheable;
 };
 
-static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int protected_pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
@@ -2178,6 +2178,20 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
 }
 
+static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	struct kvm_vcpu *vcpu = s2fd->vcpu;
+
+	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
+			!kvm_is_write_fault(vcpu) &&
+			!kvm_vcpu_trap_is_exec_fault(vcpu));
+
+	if (kvm_slot_has_gmem(s2fd->memslot))
+		return gmem_abort(s2fd);
+	else
+		return user_mem_abort(s2fd);
+}
+
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
@@ -2447,19 +2461,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		.hva		= hva,
 	};
 
-	if (kvm_vm_is_protected(kvm)) {
-		ret = pkvm_mem_abort(&s2fd);
-	} else {
-		VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
-				!write_fault &&
-				!kvm_vcpu_trap_is_exec_fault(vcpu));
-
-		if (kvm_slot_has_gmem(memslot))
-			ret = gmem_abort(&s2fd);
-		else
-			ret = user_mem_abort(&s2fd);
-	}
-
+	ret = kvm->arch.vm_s2_ops->vm_mem_abort(&s2fd);
 	if (ret == 0)
 		ret = 1;
 out:
@@ -2873,6 +2875,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
 	.vm_age_gfn			= no_age_gfn,
 	.vm_test_age_gfn		= no_age_gfn,
 	.vm_stage2_unmap_range		= no_stage2_unmap_range,
+	.vm_mem_abort			= protected_pkvm_mem_abort,
 };
 
 static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
@@ -2881,6 +2884,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
 	.vm_age_gfn			= pkvm_age_gfn,
 	.vm_test_age_gfn		= pkvm_test_age_gfn,
 	.vm_stage2_unmap_range		= pkvm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
 static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
@@ -2889,6 +2893,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_age_gfn			= kvm_vm_age_gfn,
 	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
 	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
 #define KVM_VM_S2_OPS(flavor, ops)		\
-- 
2.43.0


