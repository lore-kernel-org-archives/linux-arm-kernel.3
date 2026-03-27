Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C9B10ED67C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 14:02:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7S/JdnU/dGCZ5ndvfhZZdwAqxwTJujt9XEkHBO47ssU=; b=GD1VRFxQMtaPRbMqRcILK6b+tb
	UUk9qY2KadUHbYo9ax9zn87U7Txe8fr4QHnTbsl7SOEAHhBwYoHAnX5K1bDhxTgmbOuhysVAMdKnb
	PYhELSoK3zXb28CyT7tbQg3zm/VZzpPYpDK/6a0Y5pLk8mun/LQzSX+VfCHecPTZBi9io03cGVRJj
	pk3rTdmPgNNkWefqc8x/3MlYWhfVrxjd3nD1MFb1fVhloYDDstixtZYy3EYFruifFYiAQxb51i3Xg
	ush5rLZBEpDTjPqFXrooBgQQ3wqVkUpn62HBrMczB9DBIaCo4LW5VjDD03igaRe59xD01KAVpDI6L
	c7eOfwGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lf-00000007WeU-2vJB;
	Fri, 27 Mar 2026 14:02:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lS-00000007WR0-0X6j
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Mar 2026 14:02:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7S/JdnU/dGCZ5ndvfhZZdwAqxwTJujt9XEkHBO47ssU=; b=PpsMKBJS4i9typyHrHWj1Xlut9
	jCYp4YHMP1WW1C9bmWi/aIAKA3lLpIsoUzcihf8MiijiFNmAOyuhGyT91Y5NorWmwjrMfeAoTCf4g
	bxNRbZO7YQMGvs/FfaTq6ZzzNtrEBbNzOX6Txg66TShIwkERbEnu/Ilv/cqOI+0ronmIxjZzlS80w
	HIWuRvR79sihQC5lV30IuFcmhjKNpDRvMIv6jvEM7UEcuu9mmuWR0JmR7b3TXoqr/kt+acXOw8SQz
	N4XSr37fM/0JyNEnYO7f4v6Kaz5f131+ehAxeav7DPwqwHMW5DoLLwnencwLj2mGO9a0SO2kTEyWq
	CsWXeatA==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w67lO-0000000AYk8-0Vxp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Mar 2026 14:02:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1D10844019;
	Fri, 27 Mar 2026 14:02:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4367BC19423;
	Fri, 27 Mar 2026 14:02:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774620130;
	bh=pFJJO55Bup4H+ayanSXWyht2AlYF5v4+8PnrdfjS8Vo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kL8rAeoOR22fNkhNSVpYVC/7j+bl1tx4D3lGYhJtmFLuH7loUgS+N25rmdpvlm+FJ
	 dUnYhogVAh6Kn1deiMjOYH4NWYwXJ8tdUoHGSjj8Cu80YTsmqlldOESLIL+TTO34uB
	 abXLpCqEUBEdsThTHmaUwgucwKpJiTsEgbPYjhTk2hX6EQ5Vc0FF26AiocgJHCvQer
	 xFEHRsZC32nXEi8IcXAL/JBr1dhkj5pR0kozsNTAzC/6Ea5X3YLwq0m7L/iSnOw1Bf
	 K8OxIPf+xnUZLHadYeO5bS3G5YHILCoCdDFdO4WwDzk+pZofVbGLQX6zQglL6EIH4S
	 fTgk7PZdhyHaQ==
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
Subject: [PATCH v4 24/38] KVM: arm64: Annotate guest donations with handle and gfn in host stage-2
Date: Fri, 27 Mar 2026 14:00:23 +0000
Message-ID: <20260327140039.21228-25-will@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260327140039.21228-1-will@kernel.org>
References: <20260327140039.21228-1-will@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_140214_575554_711D21F3 
X-CRM114-Status: GOOD (  10.41  )
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

Handling host kernel faults arising from accesses to donated guest
memory will require an rmap-like mechanism to identify the guest mapping
of the faulting page.

Extend the page donation logic to encode the guest handle and gfn
alongside the owner information in the host stage-2 pte.

Reviewed-by: Fuad Tabba <tabba@google.com>
Tested-by: Fuad Tabba <tabba@google.com>
Tested-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Will Deacon <will@kernel.org>
---
 arch/arm64/kvm/hyp/nvhe/mem_protect.c | 20 ++++++++++++++++++--
 1 file changed, 18 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index 90003cbf5603..51cb5c89fd20 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -593,7 +593,6 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 		if (!ret)
 			__host_update_page_state(addr, size, PKVM_PAGE_OWNED);
 		break;
-	case PKVM_ID_GUEST:
 	case PKVM_ID_HYP:
 		ret = host_stage2_set_owner_metadata_locked(addr, size,
 							    owner_id, 0);
@@ -603,6 +602,20 @@ int host_stage2_set_owner_locked(phys_addr_t addr, u64 size, u8 owner_id)
 	return ret;
 }
 
+#define KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK	GENMASK(15, 0)
+/* We need 40 bits for the GFN to cover a 52-bit IPA with 4k pages and LPA2 */
+#define KVM_HOST_PTE_OWNER_GUEST_GFN_MASK	GENMASK(55, 16)
+static u64 host_stage2_encode_gfn_meta(struct pkvm_hyp_vm *vm, u64 gfn)
+{
+	pkvm_handle_t handle = vm->kvm.arch.pkvm.handle;
+
+	BUILD_BUG_ON((pkvm_handle_t)-1 > KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK);
+	WARN_ON(!FIELD_FIT(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn));
+
+	return FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_HANDLE_MASK, handle) |
+	       FIELD_PREP(KVM_HOST_PTE_OWNER_GUEST_GFN_MASK, gfn);
+}
+
 static bool host_stage2_force_pte_cb(u64 addr, u64 end, enum kvm_pgtable_prot prot)
 {
 	/*
@@ -1125,6 +1138,7 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	struct pkvm_hyp_vm *vm = pkvm_hyp_vcpu_to_hyp_vm(vcpu);
 	u64 phys = hyp_pfn_to_phys(pfn);
 	u64 ipa = hyp_pfn_to_phys(gfn);
+	u64 meta;
 	int ret;
 
 	host_lock_component();
@@ -1138,7 +1152,9 @@ int __pkvm_host_donate_guest(u64 pfn, u64 gfn, struct pkvm_hyp_vcpu *vcpu)
 	if (ret)
 		goto unlock;
 
-	WARN_ON(host_stage2_set_owner_locked(phys, PAGE_SIZE, PKVM_ID_GUEST));
+	meta = host_stage2_encode_gfn_meta(vm, gfn);
+	WARN_ON(host_stage2_set_owner_metadata_locked(phys, PAGE_SIZE,
+						      PKVM_ID_GUEST, meta));
 	WARN_ON(kvm_pgtable_stage2_map(&vm->pgt, ipa, PAGE_SIZE, phys,
 				       pkvm_mkstate(KVM_PGTABLE_PROT_RWX, PKVM_PAGE_OWNED),
 				       &vcpu->vcpu.arch.pkvm_memcache, 0));
-- 
2.53.0.1018.g2bb0e51243-goog


