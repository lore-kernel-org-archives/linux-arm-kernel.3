Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EF40E69E9F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 10:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8+RnTOcmNRxXwhtm+wQBKlKgN7Eb65VjOuEvF6hfgqY=; b=Nd7fKgIzUl2KEGvnsBs/0pWANS
	l1GXEsbaOhPhL8OgEJtOqi5hSbt2Xfu/8YSEB70PHa8+r2KVIc5QX/M0eIMxMdTvHSJ4KsAEk3JvC
	asRUIfHLMAHLvb4ybDn/hv7C3vdWKu652kJbAlFZ0zyvPezyDbUZiB79T4CABLebSWywqAahxcGhu
	wuQ9x2RS40gcLT2N+LUwEFGe2tKV+7v3SpAIkiDmMJv8fV8mHAQH8EKJwVYmAUPqhbXGnvsKcXlba
	jbmu60t7HlQa2TYsDHgpl35ProMDmMt6zFszeXzdNzaGL0o+pSXPOatzxmvTMKQVBUDgKt5ofHFue
	I9k3Us7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQOc-000000097Vn-0m5x;
	Tue, 03 Dec 2024 10:44:46 +0000
Received: from mail-ed1-x54a.google.com ([2a00:1450:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIQHv-000000095c3-3a6A
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 10:37:52 +0000
Received: by mail-ed1-x54a.google.com with SMTP id 4fb4d7f45d1cf-5d0b6f3770eso2962885a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Dec 2024 02:37:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733222270; x=1733827070; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8+RnTOcmNRxXwhtm+wQBKlKgN7Eb65VjOuEvF6hfgqY=;
        b=JG+fkm5FvfhhjtcccZOQFZENIGrjfqjsTv3u90ordhbs7rco4yuZhiniYbhpb46zau
         gFbM3rwbYP1/AMvu+OMEf2u/brUa3yEETjN9sxYm9U+sg3dSWtjFqIHuAOY6hDmRLgKs
         4X4prmIGSFt1UvVLS85vxE0+jjjUM35/pLohTPJTNrI1WWDy0liiZX6lEWk8Xd7TKSfi
         zvtN6nEf9Y6c2BcTON+qkwNgi9YXkge1yjccTqhD6q1vLknUvt+fSs7UJ7gmmLuOyiL0
         Og56fSMNfIVJyL5eqzarShWzYqcJJ9CNuFe+rsx2Zsa1jObSNwJBF98vC47praALSMFg
         GeYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733222270; x=1733827070;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8+RnTOcmNRxXwhtm+wQBKlKgN7Eb65VjOuEvF6hfgqY=;
        b=j3PBM1chfD0TeZiknV4yVFIEuGRlF3GxHSyXaoRynAJvhpOxP1ayHVMjLuShKorHeh
         EFnRld10XxBFN2BSixtJJEbzVEUYduTIDVluqDntJCY6BYtScGAt/aJmQuUfJrzHm8Yb
         fCnU27+LDv2u5v8PsJZ9XYhb5vfl9w88RTfH7cM38oqMAYc43KNa/ERTEg6kzjDYdbWV
         l36uakO8kSgfAElq8/Kh5dNW7NIf40h30yvqMNjuUHoLFmr9PZ6jAu63omgmaWpxQslt
         HKgBiL9lQQHmYYOwv38OdHPjxvJZDak+NIuSPAX1EA0HpUPWnv2WWt+fbX+5cjTC6CkI
         0ARg==
X-Forwarded-Encrypted: i=1; AJvYcCUtHIX92XM9K+rOH9idKlAw7I4yzhJY3sD4M8ZVhz6DLZfUirNA0bvJw2jfD9uBMSHKvKP0XT4VpBTpL3ZvOMVf@lists.infradead.org
X-Gm-Message-State: AOJu0Yy1zwzJaxgS3riHZWk9TOg2xtNdH77AnDHcHOmLU44axeQ1d8j8
	wscHY2phfQFYk4xPWoFMaxl3rO0r5SYXvOHj/eNBrhmqLkFZX7ExEGt3wEYwDnm/NeKlwj2Cm3e
	O2CQilQ==
X-Google-Smtp-Source: AGHT+IEkCh4976H9zoeMRqzwAu1itMZtieMRxRM0H0hSSBC62K8xa96o6pizViFqZkrAm2FM/BgncFwuslk8
X-Received: from edrm26.prod.google.com ([2002:aa7:d35a:0:b0:5cd:564f:2e8c])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:b73:b0:5d1:11b6:2246
 with SMTP id 4fb4d7f45d1cf-5d111b624b2mr138127a12.32.1733222270207; Tue, 03
 Dec 2024 02:37:50 -0800 (PST)
Date: Tue,  3 Dec 2024 10:37:23 +0000
In-Reply-To: <20241203103735.2267589-1-qperret@google.com>
Mime-Version: 1.0
References: <20241203103735.2267589-1-qperret@google.com>
X-Mailer: git-send-email 2.47.0.338.g60cca15819-goog
Message-ID: <20241203103735.2267589-7-qperret@google.com>
Subject: [PATCH v2 06/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
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
X-CRM114-CacheID: sfid-20241203_023751_892055_858031D7 
X-CRM114-Status: GOOD (  13.61  )
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
2.47.0.338.g60cca15819-goog


