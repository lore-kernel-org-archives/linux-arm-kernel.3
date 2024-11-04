Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB993D132C8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 13:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CVlLw2VsW1NEYgyhjgZsv6w0k6EmJDYLHCvZ5J3b7lU=; b=gB1iM+VJinfLj8fEh5Fpcov5Io
	lxvQbUBwOtfqRyJCBEYxgT5hdj1gX5qoogE3A2iGDgWTT0KjYJGsEueLWcZuLs1IlGV0s0OiF5ebl
	F1lVWQeJkREGXzl2BPg+2bDmsIvhYZ9SmW1Q6+fKlXMs2bR6wTMUlOQfdd1jxqanjWwUeQPF6Zva4
	0BEytosrPBF62W5efw5pO2Op2m8Tj3jJiigbLyF48ous2ouxlOdc+kPSJRKQN25vR331sru4cdUJS
	EgKUNCjy8oIeDhLE3AwqS4Wpnc8y9VIis872d4+GDYcldKdT/DYYEhcuGUrdNcQyxxDmoSmAxaUX0
	PA/EBKeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xTs-0000000DwH0-0q3k;
	Mon, 04 Nov 2024 13:50:56 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7xBv-0000000DsK8-3TZW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 13:32:25 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e28fea2adb6so5990951276.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 04 Nov 2024 05:32:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730727142; x=1731331942; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=CVlLw2VsW1NEYgyhjgZsv6w0k6EmJDYLHCvZ5J3b7lU=;
        b=Ce9x2HJy0o00QKxFdcvfS3MOkwu/PPFTaNa3C4xmX0HBQFyr7aIBYwx+ouPXGAPMlE
         OPWXNSR8bU/DIAntErarLYS3ZpEwX3kU6t7Vl7atHN5NFYkjvhXbAP95Ccc18/aR3un4
         vICZLPHns6H7VWDAJ4/39JZXaZUUYmPKX6X/zCkLpw+bwF3yynB9gGY3xx4iBR4SEYXC
         kCP39msq+HE6TG8/U9Pol5N5ZlLrT/Pc5h3/QMw9RG1kZmP4cQ2ab35CsEi8WG7PpZ+L
         1QdnzTJF+KKGtyMCauRGLllHPzChhp8wO4elN5ylyZDqr18xYK96/tWswXhGndcfBsTx
         ylLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730727142; x=1731331942;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CVlLw2VsW1NEYgyhjgZsv6w0k6EmJDYLHCvZ5J3b7lU=;
        b=IFSQxqcdrUYjrkP4/2C6XErIK4k+N9sKHvyN8uW9wNtNNDs1MKJMMrkUNnloJ5CYd5
         alF9mU1OXOPRR9vzdO7W4iDxi2DJ9bb1R1JOmS1ZqU9/cET77OXjJ95Je4RtCTwk5v9d
         0EsTqrYFmDs7rbqLpCV8pxjCJEAHAG9NNci2styaIzCQrnmj11jTs8qAd6+jo2LuyKj5
         EtdPEPZx1VSI6H/FypOhaguhzDDOVxONBypIn25Fst+9HKsBjoMe6eVvOCLEHWI4dfgZ
         Swfnq/BP3RiQPdxFP0VCc06d1dAjfA62qBom+CrDBJ/R7h0IH+bsuMohwE8JkP5/6f8Z
         dsgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWSkn94EKg1nH8PrWZFR38usZOPiVgXPuei+m9fWaONCEnQ/tzbGws9vgkCqgNZO7Y3V37ISIkuVQ74S6L5736m@lists.infradead.org
X-Gm-Message-State: AOJu0YwQtmxnoheMckHsCcPuU8b38xc68U5BVfuDE5nILmbIzoDFI8KF
	zpFlb4oeC/vpkmUOrfhQN6UE9Ml/6SNFhuLmKCkpwPOZKEMs5a22+fV3c9TIHx0LxRph4a7hag7
	cuEC7ZA==
X-Google-Smtp-Source: AGHT+IGaIdjKw90MUAD6f3zhsAl5Ou4eqg/HHU1QzYnDITqGlaaCQnGFAV9PmmYFtFHG3tgEwpSpmlOm/Ebd
X-Received: from big-boi.c.googlers.com ([fda3:e722:ac3:cc00:31:98fb:c0a8:129])
 (user=qperret job=sendgmr) by 2002:a25:ed07:0:b0:e1d:912e:9350 with SMTP id
 3f1490d57ef6-e3087bc765dmr65574276.6.1730727142628; Mon, 04 Nov 2024 05:32:22
 -0800 (PST)
Date: Mon,  4 Nov 2024 13:31:52 +0000
In-Reply-To: <20241104133204.85208-1-qperret@google.com>
Mime-Version: 1.0
References: <20241104133204.85208-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Message-ID: <20241104133204.85208-7-qperret@google.com>
Subject: [PATCH 06/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Zenghui Yu <yuzenghui@huawei.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Vincent Donnefort <vdonnefort@google.com>, 
	Sebastian Ene <sebastianene@google.com>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_053223_985704_BEE46F46 
X-CRM114-Status: GOOD (  13.50  )
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

kvm_pgtable_stage2_relax_perms currently assumes that it is being called
from a 'shared' walker, which will not be true once called from pKVM. To
allow for the re-use of that function, make the walk flags one of its
parameters.

Signed-off-by: Quentin Perret <qperret@google.com>
---
 arch/arm64/include/asm/kvm_pgtable.h | 4 +++-
 arch/arm64/kvm/hyp/pgtable.c         | 6 ++----
 arch/arm64/kvm/mmu.c                 | 7 +++----
 3 files changed, 8 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 442a45d38e23..f52fa8158ce6 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -709,6 +709,7 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address to identify the page-table entry.
  * @prot:	Additional permissions to grant for the mapping.
+ * @flags:	Flags to control the page-table walk (ex. a shared walk)
  *
  * The offset of @addr within a page is ignored.
  *
@@ -721,7 +722,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
-				   enum kvm_pgtable_prot prot);
+				   enum kvm_pgtable_prot prot,
+				   enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_flush_range() - Clean and invalidate data cache to Point
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index fa25062f0590..ee060438dc77 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1310,7 +1310,7 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 }
 
 int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
-				   enum kvm_pgtable_prot prot)
+				   enum kvm_pgtable_prot prot, enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
 	s8 level;
@@ -1328,9 +1328,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
 	if (prot & KVM_PGTABLE_PROT_X)
 		clr |= KVM_PTE_LEAF_ATTR_HI_S2_XN;
 
-	ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level,
-				       KVM_PGTABLE_WALK_HANDLE_FAULT |
-				       KVM_PGTABLE_WALK_SHARED);
+	ret = stage2_update_leaf_attrs(pgt, addr, 1, set, clr, NULL, &level, flags);
 	if (!ret || ret == -EAGAIN)
 		kvm_call_hyp(__kvm_tlb_flush_vmid_ipa_nsh, pgt->mmu, addr, level);
 	return ret;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 27e1b281f402..80dd61038cc7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1440,6 +1440,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	long vma_pagesize, fault_granule;
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1683,13 +1684,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		 * PTE, which will be preserved.
 		 */
 		prot &= ~KVM_NV_GUEST_MAP_SZ;
-		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot);
+		ret = kvm_pgtable_stage2_relax_perms(pgt, fault_ipa, prot, flags);
 	} else {
 		ret = kvm_pgtable_stage2_map(pgt, fault_ipa, vma_pagesize,
 					     __pfn_to_phys(pfn), prot,
-					     memcache,
-					     KVM_PGTABLE_WALK_HANDLE_FAULT |
-					     KVM_PGTABLE_WALK_SHARED);
+					     memcache, flags);
 	}
 
 out_unlock:
-- 
2.47.0.163.g1226f6d8fa-goog


