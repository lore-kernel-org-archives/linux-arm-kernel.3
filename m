Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7F84E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 19:49:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/S80FmDYKb1wMSZogthtihTZ2ow/iC1/VbK9O8uYM7w=; b=IXCbyYJ5oALR0lG3juwuND76Yc
	aUP+kFgWgbfsRxzE4oCpZLmp/iSu9Gr6VBlfPHaLwNcfFwF8nOMbmNMzlQuZd5/jj/fUG0J0jqB1G
	8FzC8mpsZDjwGQLJKy7/BHucsQwpUCC8LFLGDwaD6P/5iQ/E9Xp7S3+ql3ajxXfovMcGC98Eb9DAu
	t0KxuezSlvV0FMic0cXmnKbB9IGopApLVD3KDNn189sGkMyJ0NyN3e2pHaVyw6m1ZbIGSDZHuoQK/
	zOTogIRDsKV9av3/Uf7zobnrZPz6frm6RuJKj6gdx8Hp7AzQxJaRoRP2GDjfHZfhaJ+jPxx5Swgbe
	OyN5A3jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tO02Q-0000000Ha4G-0MdV;
	Wed, 18 Dec 2024 19:48:54 +0000
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNzv3-0000000HYKJ-2wgt
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 19:41:18 +0000
Received: by mail-ej1-x649.google.com with SMTP id a640c23a62f3a-aab9f30ac00so355101566b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 11:41:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734550876; x=1735155676; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/S80FmDYKb1wMSZogthtihTZ2ow/iC1/VbK9O8uYM7w=;
        b=nW4ovy3DIDzeAKdNYqB+Y8dnKg3HPcQbw/g/+FEg0GGGAWaXig9/3lMovrOwMzPxG8
         nk8S8eZ95gDlBy+chx8772EJwrnU6blGGjDz78Gd8pZ4kSFhF86aIjmxshvmcpv3DsTD
         eWjZUhqrKzDMqGwPkfYf+48EYELPMaHjVcb9WIjC5imkPOJ1Nb1nWd3aDWXR45sR+Ozy
         fbYdrVcnvlU1DX4Hm8m6r7Ggyt9yj/U17UVog8dyvPFHy/IYFg20JjXPP5Jfp3EjIkgj
         0t8sOJSP8h8ZLXC3KoWmvaiURvy71ahEjUlpr79IJk+ERtPaoxf+N4pF0T2eLIq93Nzb
         5I3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734550876; x=1735155676;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/S80FmDYKb1wMSZogthtihTZ2ow/iC1/VbK9O8uYM7w=;
        b=GOx//eUInSGnu9TbE2LxQTW1SbPVc5zv6mNK9hqC/HDntoOJVrNH3H/P1s7wLD056h
         T+oR7H6ISxcG7NTOQKbMPos9JMyaE5RJi+yM3lH1n5jQffXD62r7wmsljDX0px8n4H1M
         7KsGvr6ERhQCqDlQL2IlKkiJkGRozhRaKlA2HJ+QJCtIQBuxAgeWSRDKHGuSpd1sUWx4
         RDqRm9vCyMdlmtKl8WtRZ8mOwzaFkjJS+hzUzhjKgEJJfWC592gErgYQHL6d2cfwQnt/
         cYa4JlXOeZdtCb3f4d4gM3mP4xnHuZ0SCBm4IL+ALW6Av9FvFLW93dJj+Ltdi45cGaXx
         b+qQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQCPWYCSy68Qp6dXSCrwv7qMzMn8Pgzd5Q/I5uQpS9nnxhgAc5Xa4pRi0Z4/dRVXPhk9tuyGj8psPdA345xAKY@lists.infradead.org
X-Gm-Message-State: AOJu0YzWXuB9YHzDjODlPSV716hv5hepqxKV0HTjhyjya6+HNW/wyicq
	CdLqabNriNZX/47TJAKVREvjip0D9UW3bxy77Yo3ofjcPrPZ/bDp6rCzINSyQYsV5Zn/2tfGwMg
	RjgqysA==
X-Google-Smtp-Source: AGHT+IGO+aoiY0pAX0txDmM56AhyGulUG5MWxWr8/SJsqYx74spHn0f9QQj9LlBmJWIaz8dI7mVe/cFIZAmV
X-Received: from ejchq16.prod.google.com ([2002:a17:907:3f10:b0:aa6:c227:374c])
 (user=qperret job=prod-delivery.src-stubby-dispatcher) by 2002:a17:907:6e90:b0:aa6:8bb4:5035
 with SMTP id a640c23a62f3a-aabf479ebadmr460491566b.31.1734550875904; Wed, 18
 Dec 2024 11:41:15 -0800 (PST)
Date: Wed, 18 Dec 2024 19:40:47 +0000
In-Reply-To: <20241218194059.3670226-1-qperret@google.com>
Mime-Version: 1.0
References: <20241218194059.3670226-1-qperret@google.com>
X-Mailer: git-send-email 2.47.1.613.gc27f4b7a9f-goog
Message-ID: <20241218194059.3670226-7-qperret@google.com>
Subject: [PATCH v4 06/18] KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
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
X-CRM114-CacheID: sfid-20241218_114117_741584_7EDF6DD4 
X-CRM114-Status: GOOD (  13.30  )
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

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>
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


