Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16A12F33A78
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 14:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v9bU/SFB7GqQxG2CTlk8KNxL7XWAvU4JEkKIiI7/zmA=; b=CdilVuTJbEkgq6rc+KSzdfMGdN
	VV+yu6xoFmBZy/S+obfTKOjScaRg3r6kTSVsZfBCVhhGmfqLxhnrYnuArtm0iVrpfEe2z+zC9QkPY
	yqEOLxUP1lNBGL9jSUs8Pl9252Dlu2gNU3ooEpp5N+z1JZdMul/ukrmYmfyjfGdwlNRCGBr60LGPS
	8W+4L+gD49c2BzW+N2y8Iy8UeyD48+u48035LydqZWdKbznscwtAxJrR8uZ/qduMmd/g/o1wEuq6u
	wZEfZ1jE1A2NiXoL6k3W0Z7WpzMsOPhrcZalioANcDbrrhw/1Zn2DGVY2mdLPvXiIDqNPHOaDtKEq
	JEsdkoXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wZ-000000021QY-2Ja6;
	Thu, 05 Mar 2026 14:44:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy9wX-000000021OG-26nb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 14:44:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3378840BAB;
	Thu,  5 Mar 2026 14:44:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 314D7C19423;
	Thu,  5 Mar 2026 14:44:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772721889;
	bh=az1yyQJ2qsUaihRa0P+YInfDMXRen00HXpIO3q6xyDs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=n8PML7mq8w6MzKfg1ZZhmMNT/GMOk+JzTyY4Q7IcmfbQ0bOVEftNc3Wa9ysM34exR
	 YpJuURzut28O+u5Cr7Bv5wwf//wgU0ZY2KsGejueNm5U8LBYWhy1ZoQcf2pvGnBBg4
	 hU5ZHBOKsZCiehzlmU3QySgng6a8qSFufyidrK3slocECKZs+GG8lLv7vU699walTz
	 DRUI1mpvlVuhWc4frFCMuoQicNOOiS2j6Gcmba0WF6FQwO5sLjlbIsgfbkbN94L+qj
	 +z38U2JJ72l2tp6kSJCSe3B/4TPIyqUoDXhzEWR8Uxte1o2ep17CTZu0RUjMeL8Qs5
	 kfEDlnnuXTWvg==
From: Will Deacon <will@kernel.org>
To: kvmarm@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Mostafa Saleh <smostafa@google.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH v3 11/36] KVM: arm64: Introduce __pkvm_host_donate_guest()
Date: Thu,  5 Mar 2026 14:43:24 +0000
Message-ID: <20260305144351.17071-12-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260305144351.17071-1-will@kernel.org>
References: <20260305144351.17071-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_064449_585486_8EF578D5 
X-CRM114-Status: GOOD (  14.93  )
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

In preparation for supporting protected VMs, whose memory pages are
isolated from the host, introduce a new pKVM hypercall to allow the
donation of pages to a guest.

Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/kvm_asm.h              |  1 +
 arch/arm64/include/asm/kvm_pgtable.h          |  2 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h |  2 ++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c            | 21 +++++++++++++
 arch/arm64/kvm/hyp/nvhe/mem_protect.c         | 30 +++++++++++++++++++
 5 files changed, 55 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/include/asm/kvm_asm.h b/arch/arm64/include/asm/kvm_asm.h
index df6b661701b6..dfc6625c8269 100644
--- a/arch/arm64/include/asm/kvm_asm.h
+++ b/arch/arm64/include/asm/kvm_asm.h
@@ -79,6 +79,7 @@ enum __kvm_host_smccc_func {
 	/* Hypercalls that are available only when pKVM has finalised. */
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_hyp,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_hyp,
+	__KVM_HOST_SMCCC_FUNC___pkvm_host_donate_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_share_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_unshare_guest,
 	__KVM_HOST_SMCCC_FUNC___pkvm_host_relax_perms_guest,
diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index c201168f2857..b6f7595c4979 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -100,7 +100,7 @@ typedef u64 kvm_pte_t;
 					 KVM_PTE_LEAF_ATTR_HI_S2_XN)
 
 #define KVM_INVALID_PTE_OWNER_MASK	GENMASK(9, 2)
-#define KVM_MAX_OWNER_ID		1
+#define KVM_MAX_OWNER_ID		3
 
 /*
  * Used to indicate a pte for which a 'break-before-make' sequence is in
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
index 5f9d56754e39..9c0cc53d1dc9 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mem_protect.h
@@ -28,6 +28,7 @@ enum pkvm_component_id {
 	PKVM_ID_HOST,
 	PKVM_ID_HYP,
 	PKVM_ID_FFA,
+	PKVM_ID_GUEST,
 };
 
 extern unsigned long hyp_nr_cpus;
@@ -39,6 +40,7 @@ int __pkvm_host_donate_hyp(u64 pfn, u64 nr_pages);
 int __pkvm_hyp_donate_host(u64 pfn, u64 nr_pages);
 int __pkvm_host_share_ffa(u64 pfn, u64 nr_pages);
 int __pkvm_host_unshare_ffa(u64 pfn, u64 nr_pages);
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu);
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot);
 int __pkvm_host_unshare_guest(u64 gfn, u64 nr_pages, struct pkvm_hyp_vm *hyp_vm);
diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
index 634ea2766240..970656318cf2 100644
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -241,6 +241,26 @@ static int pkvm_refill_memcache(struct pkvm_hyp_vcpu *hyp_vcpu)
 			       &host_vcpu->arch.pkvm_memcache);
 }
 
+static void handle___pkvm_host_donate_guest(struct kvm_cpu_context *host_ctxt)
+{
+	DECLARE_REG(u64, pfn, host_ctxt, 1);
+	DECLARE_REG(u64, gfn, host_ctxt, 2);
+	struct pkvm_hyp_vcpu *hyp_vcpu;
+	int ret = -EINVAL;
+
+	hyp_vcpu = pkvm_get_loaded_hyp_vcpu();
+	if (!hyp_vcpu || !pkvm_hyp_vcpu_is_protected(hyp_vcpu))
+		goto out;
+
+	ret = pkvm_refill_memcache(hyp_vcpu);
+	if (ret)
+		goto out;
+
+	ret = __pkvm_host_donate_guest(pfn, gfn, hyp_vcpu);
+out:
+	cpu_reg(host_ctxt, 1) =  ret;
+}
+
 static void handle___pkvm_host_share_guest(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(u64, pfn, host_ctxt, 1);
@@ -595,6 +615,7 @@ static const hcall_t host_hcall[] = {
 
 	HANDLE_FUNC(__pkvm_host_share_hyp),
 	HANDLE_FUNC(__pkvm_host_unshare_hyp),
+	HANDLE_FUNC(__pkvm_host_donate_guest),
 	HANDLE_FUNC(__pkvm_host_share_guest),
 	HANDLE_FUNC(__pkvm_host_unshare_guest),
 	HANDLE_FUNC(__pkvm_host_relax_perms_guest),
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 7b0f8ad7b20f..0a9a96236841 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -971,6 +971,36 @@ static int __guest_check_transition_size(u64 phys, u64 ipa, u64 nr_pages, u64 *s
 	return 0;
 }
 
+int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
+{
+	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
+	u64 phys = hyp_pfn_to_phys(pfn);
+	u64 ipa = hyp_pfn_to_phys(gfn);
+	int ret;
+
+	host_lock_component();
+	guest_lock_component(vm);
+
+	ret = __host_check_page_state_range(phys, PAGE_SIZE, PKVM_PAGE_OWNED);
+	if (ret)
+		goto unlock;
+
+	ret = __guest_check_page_state_range(vm, ipa, PAGE_SIZE, PKVM_NOPAGE);
+	if (ret)
+		goto unlock;
+
+	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
+	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
+				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
+				       &vcpu->vcpu.arch.pkvm_memcache, 0));
+
+unlock:
+	guest_unlock_component(vm);
+	host_unlock_component();
+
+	return ret;
+}
+
 int __pkvm_host_share_guest(u64 pfn, u64 gfn, u64 nr_pages, struct pkvm_hyp_vcpu *vcpu,
 			    enum kvm_pgtable_prot prot)
 {
-- 
2.53.0.473.g4a7958ca14-goog


