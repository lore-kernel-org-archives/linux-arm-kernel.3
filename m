Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40E51C88E7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Sep 2026 16:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IiJhppubAXZI5kvVOBDwWoMiwLKmpcoAb1Cc4sdE+Gw=; b=1D4dhejn2R+bjww7C5ivVe1TOo
	gkvQXFmy4CTFA64fjss2tynWh9B2ZQAgZYIbRezfTymZkeIo+9dMN9ENdCCr3zL5O3zaNVFVbrTcR
	sZJn1G5DaGPisPGKujrzj17d+22D7YT9wBb7GrHdidrjMjH28sBqkHuNNomaZk4WbLXZoHZKZEwXN
	PubQ6Gwo10shpG5GZpvL90GqTRWfYGguWBF/VRuNynT1IMkmVcjfrHVAxxtsdxMYN08fqFmVHbsw0
	ejntKq3+Kl3I8DW7gT/kYMvsvDpvQT4U2cGLNo1KR08HGGbXrceBf79D1sPv051ZHFwdD8Jdj8cZB
	PWnHQQ7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6VcD-00000007LNR-0QrI;
	Tue, 15 Sep 2026 16:02:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Vbz-00000007LDi-3FSd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Sep 2026 16:02:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9F5D51570;
	Tue, 15 Sep 2026 09:02:19 -0700 (PDT)
Received: from ewhatever.cambridge.arm.com (ewhatever.cambridge.arm.com [10.2.197.99])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 875953F882;
	Tue, 15 Sep 2026 09:02:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789488143; bh=datF3OC3RosPiHglYYmm7bLuPO/48ROsNh7L6QxULV4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=tZV7KI6sh7Jy4XfvXKUfJv/d50esT6k+3jQPDVPk4pGq4fxrnbzOCAoG25fcgKnwt
	 lfOf0hV5nRpsA0AwRE4xNMCrqQKhIYO6qulCXkRZjXuPu5gAv744S4rnEjPRn3UCRJ
	 zjpPn72PlTRpSGC6c2w6fPgbSfvLPF3LgSgHPx4I=
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
	Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [PATCH v18 10/23] KVM: arm64: Abstract out memory abort handling
Date: Tue, 15 Sep 2026 17:01:28 +0100
Message-ID: <20260915160141.3543048-11-suzuki.poulose@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260915160141.3543048-1-suzuki.poulose@arm.com>
References: <20260915160141.3543048-1-suzuki.poulose@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_090223_906732_2AEED421 
X-CRM114-Status: GOOD (  15.02  )
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

Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
---
 arch/arm64/include/asm/kvm_host.h |  2 ++
 arch/arm64/kvm/mmu.c              | 36 +++++++++++++++++++------------
 2 files changed, 24 insertions(+), 14 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index ad3b34ba0b805..7ce46d853c47e 100644
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
index 3d8b6e5b811ed..607c908c15c42 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1742,7 +1742,7 @@ struct kvm_s2_fault_vma_info {
 	bool		map_non_cacheable;
 };
 
-static int pkvm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+static int protected_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 {
 	unsigned int flags = FOLL_HWPOISON | FOLL_LONGTERM | FOLL_WRITE;
 	struct kvm_vcpu *vcpu = s2fd->vcpu;
@@ -2180,6 +2180,22 @@ static int user_mem_abort(const struct kvm_s2_fault_desc *s2fd)
 	return kvm_s2_fault_map(s2fd, &s2vi, prot, memcache);
 }
 
+static int kvm_vm_mem_abort(const struct kvm_s2_fault_desc *s2fd)
+{
+	int ret;
+	struct kvm_vcpu *vcpu = s2fd->vcpu;
+
+	VM_WARN_ON_ONCE(kvm_vcpu_trap_is_permission_fault(vcpu) &&
+			!kvm_is_write_fault(vcpu) &&
+			!kvm_vcpu_trap_is_exec_fault(vcpu));
+
+	if (kvm_slot_has_gmem(s2fd->memslot))
+		ret = gmem_abort(s2fd);
+	else
+		ret = user_mem_abort(s2fd);
+	return ret;
+}
+
 /* Resolve the access fault by making the page young again. */
 static void handle_access_fault(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa)
 {
@@ -2287,6 +2303,7 @@ int kvm_handle_guest_sea(struct kvm_vcpu *vcpu)
 int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 {
 	struct kvm_s2_trans nested_trans, *nested = NULL;
+	struct kvm *kvm = vcpu->kvm;
 	unsigned long esr;
 	phys_addr_t fault_ipa; /* The address we faulted on */
 	phys_addr_t ipa; /* Always the IPA in the L1 guest phys space */
@@ -2448,19 +2465,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu)
 		.hva		= hva,
 	};
 
-	if (kvm_vm_is_protected(vcpu->kvm)) {
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
@@ -2855,6 +2860,7 @@ static const struct kvm_vm_s2_ops protected_pkvm_vm_s2_ops = {
 	 * .vm_test_age_gfn
 	 * .vm_stage2_unmap_range
 	 */
+	.vm_mem_abort			= protected_vm_mem_abort,
 };
 
 static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
@@ -2863,6 +2869,7 @@ static const struct kvm_vm_s2_ops pkvm_vm_s2_ops = {
 	.vm_age_gfn			= kvm_vm_age_gfn,
 	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
 	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
 static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
@@ -2871,6 +2878,7 @@ static const struct kvm_vm_s2_ops kvm_default_vm_s2_ops = {
 	.vm_age_gfn			= kvm_vm_age_gfn,
 	.vm_test_age_gfn		= kvm_vm_test_age_gfn,
 	.vm_stage2_unmap_range		= kvm_vm_stage2_unmap_range,
+	.vm_mem_abort			= kvm_vm_mem_abort,
 };
 
 #define KVM_VM_S2_OPS(flavor, ops)		\
-- 
2.43.0


