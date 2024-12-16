Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DFEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 18:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6dFW7RUrUetXxVFNK2ULy2Fjq1gVFLFzwOzuHDurHwY=; b=wAV2iZR/R//0WD0SzUpmyfrjc3
	d0jcbfgIfAkBVZMGARcP7AiqJLcky64Ud1X5W2aFAm94Nk9qi+LKKMp29BOoHjfumRlcDnCM+raKQ
	bqkdDQcCoWAOnq1PxyC3FeQqZrULmCaTCo+Y5cbscQ3QDTl9ZHn8qCNYKhjzNeeEbK5obdFZTmPEz
	O9Z/4fmCrf/K7KsSZsM/4LBuJcioqMPzJb4tksHU7HdWiNtzFe/FSs0IneL60WNUPbYEqfn0WdcKj
	ZtapqE00C/NDvGlU3tDqbhzxxnR1/jwEeo2mvyktpfeRYxYRBbi6Ov1lJjnhAsP0AnzkA5MjUbw6p
	GhkywJWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFUz-0000000Atn7-3hqj;
	Mon, 16 Dec 2024 18:07:17 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNFMJ-0000000AqwV-2ihi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 17:58:20 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-5d3c284eba0so6275563a12.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Dec 2024 09:58:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734371898; x=1734976698; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=6dFW7RUrUetXxVFNK2ULy2Fjq1gVFLFzwOzuHDurHwY=;
        b=lnQGqgfeGiLOdZfd7cUzeerzRBavTnvgTMz8mJ9ahKwp8vLXnKiPcVOyKPfKwBG0IK
         x2l0yiqP3LPfXfdIbiAqbod9zI8JO7hcrI9B962gSwQuabbAb5EX5a/tpE+zNJn3f+Ub
         nbFhZiUCPyKhdsKSAK6bqWHeQlXDOE21CItfdYXYiPKYDf4pWqXO0xS0SfPsYhS1MOga
         n1gI2+86qFb8LWBSxg32nwdjLMuL2V97R1L8sRVhVxIW5Q0MmXguz3IlAVU5qrMzAnO0
         DfEutewPEP8wJ0PvaNDGWe4fFsDONlcV2Nyo+e1RqWn0o9JEqkAUODC7eHQVOOj5XrIk
         Odog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734371898; x=1734976698;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dFW7RUrUetXxVFNK2ULy2Fjq1gVFLFzwOzuHDurHwY=;
        b=GwtHTd9RqFIAyVMEnzkJFNCC7HBBG4sCbpyudd1cYQN0131U+tP0egKMmyFmgvje5X
         RWYndoRqkVzbkavusQJR6Ie2C9M222GcvCVPcNjgy/hRWfGd8qTAuqboEsFZKWShdGrq
         lIT6pK2+t1jwpuGQKwiodYD4c3qgyaAwuwHcubyoGeZnXmet9+VgZwPuF4or9MFK/6Vm
         TXz9KD5syyo1drzpJZGCdfBe4UzQ0FfuPsIMEGu/pVU/Mh1Vgt6uxdlmOuoChefUKLWj
         MGHs3M98GCEoT1m0GsPP6I/kyQ8DsBdQu6U5VGqfUxESkcfb2O1U3vjLpXgQadJ3SGjA
         y3gA==
X-Forwarded-Encrypted: i=1; AJvYcCUx6Whh957nybjY1o4aNQmSGnNtvl2ABPzgpnkAFB0OehHLs67cxlo9all3MejSS9cAfq+a1NNveGsVfttlkfJd@lists.infradead.org
X-Gm-Message-State: AOJu0YwPXqa3TIiwmtwpDw+WqBgtlgo0qMgnWkvmiZnu2e/ioh0s/KwL
	jWpw9Ui1GVskQmF4gzBieqjyRrubbI0jT9GoZPbTzZnooN00Vh+sHxWTur3K4tO9niD1b4RFqoU
	1vY9jyA==
X-Google-Smtp-Source: AGHT+IGc0SKdQx4fRg/2UZZOEnFM7Ob6WE6YJF9bkeGHxvuSwv02bVDmCemOOlGDIUPuD02qJQBB9v2MqSc7
X-Received: from edxk18.prod.google.com ([2002:a05:6402:12d2:b0:5d0:2300:5be])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3551:b0:5d0:d84c:abb3
 with SMTP id 4fb4d7f45d1cf-5d63c3b1c3bmr12340959a12.26.1734371898142; Mon, 16
 Dec 2024 09:58:18 -0800 (PST)
Date: Mon, 16 Dec 2024 17:57:51 +0000
In-Reply-To: <20241216175803.2716565-1-qperret@google.com>
Mime-Version: 1.0
References: <20241216175803.2716565-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241216175803.2716565-7-qperret@google.com>
Subject: [PATCH v3 06/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
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
X-CRM114-CacheID: sfid-20241216_095819_688273_A2E54C03 
X-CRM114-Status: GOOD (  13.20  )
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
index 38b7ec1c8614..c2f4149283ef 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -707,6 +707,7 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
  * @pgt:	Page-table structure initialised by kvm_pgtable_stage2_init*().
  * @addr:	Intermediate physical address to identify the page-table entry.
  * @prot:	Additional permissions to grant for the mapping.
+ * @flags:	Flags to control the page-table walk (ex. a shared walk)
  *
  * The offset of @addr within a page is ignored.
  *
@@ -719,7 +720,8 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
  * Return: 0 on success, negative error code on failure.
  */
 int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
-				   enum kvm_pgtable_prot prot);
+				   enum kvm_pgtable_prot prot,
+				   enum kvm_pgtable_walk_flags flags);
 
 /**
  * kvm_pgtable_stage2_flush_range() - Clean and invalidate data cache to Point
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index 0470aedb4bf4..b7a3b5363235 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -1307,7 +1307,7 @@ bool kvm_pgtable_stage2_test_clear_young(struct kvm_pgtable *pgt, u64 addr,
 }
 
 int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
-				   enum kvm_pgtable_prot prot)
+				   enum kvm_pgtable_prot prot, enum kvm_pgtable_walk_flags flags)
 {
 	int ret;
 	s8 level;
@@ -1325,9 +1325,7 @@ int kvm_pgtable_stage2_relax_perms(struct kvm_pgtable *pgt, u64 addr,
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
index a2339b76c826..641e4fec1659 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1452,6 +1452,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
 	struct kvm_pgtable *pgt;
 	struct page *page;
+	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
 
 	if (fault_is_perm)
 		fault_granule = kvm_vcpu_trap_get_perm_fault_granule(vcpu);
@@ -1695,13 +1696,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
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
2.47.1.613.gc27f4b7a9f-goog


