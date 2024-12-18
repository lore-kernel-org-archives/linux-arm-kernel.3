Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67C2BE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 12:08:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TffUWnK8qRknoMZpdRrwzjPRWDBT0fSzYTx1ZBmTW4Q=; b=FZJYqeGsNZqR3eZzuGcQENH1ix
	1O/u36dU1jsrDeCTq6dZ8wAqt4vbyHIh8YHPSU0zQ0NPHtn0lMIRpct1ABBNqDCwelUOZuWjFAaPQ
	sArHjLkTWd+hEzN0sqhylSPOZNUaIfI63r0AqjuZZbpiTPgsOujcFbwGbNLW/h01MNYTZSERgyLqk
	4lOC2aG5nrXDvPevuQVuVjM8PY58zvplPWfZ79sJrZoIuDa5cV4rFs0R++T0ODNEISmHK3h/aPKyn
	79fxHXQvKaHtoceOhQWD0sWVSBF7iXupkbQ3xNs774FF1ThjK5i2AQVy6qESD40ldM6G3nT45GO32
	NoFSgURg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNsqX-0000000GXs9-1eej;
	Wed, 18 Dec 2024 12:08:09 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNspR-0000000GXgW-0U5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 12:07:02 +0000
Received: by mail-ej1-x62d.google.com with SMTP id a640c23a62f3a-aa69107179cso1177237266b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Dec 2024 04:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734523620; x=1735128420; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TffUWnK8qRknoMZpdRrwzjPRWDBT0fSzYTx1ZBmTW4Q=;
        b=cqxNsrNPr+SUGLSynErzlMsuo+QWi7YBioiC8UH4GZLUL1ovAo982WIPtuw47Pd9E/
         xAY3PyOgDFrsJhALdX2I4YJdFFoaQGzaCchSOiAQjF2Cut7wD8vPMNxZitVK+evZh9j1
         uZYBAYB/Q9isS9g7vdE/R8vaKp0M4NIjFA31gczgE4/vUAbtEsKQ3hiSnzHz1aBNyhhl
         8/6qyyR9oexddyhKf3NVnOc6Q+eZuvLsYTIfmtfmj5urI1gro17r3s3S2okJqeqcWS5W
         Iafq8rjOBPeEahwOCxxwq4t7gajOo9j0Qm86WzdlwcJ7G6Fq/8OS7LB2JKz1E+3yEMom
         j5ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734523620; x=1735128420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TffUWnK8qRknoMZpdRrwzjPRWDBT0fSzYTx1ZBmTW4Q=;
        b=cqmWPqUszWuBEqi3vJM3tIxKimYDy1APXdFIbrB8NgZwJ4zJJ2JgMvY1Hf7SsZMUo/
         AK8APJPYerz0Vqn+zveK4dB+38LsDp3vOOpvOcEFJIvSJWEuxtH/mfPUhbNsMKXKjf/C
         xl31E9TQk6nIdMAQkcxQd2ROFj/FHJcdiEoIDOgp+2mYhu0Jz/bNzOtNFHT/GLaQvXL3
         zvvdblDd8NrtrOrJM0LTSijyOQ32OE9XcQwdlWukitG47TajeeTu4Wk+geJiUv1oES8m
         LQEqsM/t5SWXOqOFZIqPxJS4oT90MUV/M/LJEEPLr95RmCkYnCYoyPNiwHIKHDePEBEV
         HD+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUrsMEJhS7XqiM+X7IN1s4oVTYi7nh5kVGjAem/bwby+PpE1r3ANziyUqgPRVspX7wKYu3FKXkfYJwvqbyWbG1V@lists.infradead.org
X-Gm-Message-State: AOJu0Ywhc6ifQQLS3/5+yXDEGAH7oWTS6AX+dXlhUJTGGV23jZeou+s5
	9OwFAxGKwG8ciPMtFWO9bglt1x7OLi6AS2lPqaO6aVr3nvh25M75RlTqUluIGQ==
X-Gm-Gg: ASbGncv/uJIYxXS0SY1NfxdXnQVFdHA0DQcWEXR/KIETy8uTWVqxyS+Ex2eVK9r8NkD
	uLcHF3U52VhXduDS0EwuUJIDSv99WuwwRid7aYThTLH9GyTapqYH8Ko8lumns488LZSu3kBZtYV
	2wEsm5IyBhyAoUUUPLjkbVgxd0JHzNfu8AMRBlI3Z6p4XhUp4x3qmJ5cZxtyqMU5jid63cQ+ePo
	KwvBJn+idbtUXQrxl8XABx5a0BWAZAb95CwNARTyNCru49L3/czsrm1ZFmq4dY1OFppPWKllMYG
	RRC2ALbS+hEe59A=
X-Google-Smtp-Source: AGHT+IGh5JR9f+iJg3ul5+Dz1gzA6cwcFZttYXLX++lDo61oRhkeZsMd4gZ18WSWTQ8EuZRU856ksg==
X-Received: by 2002:a17:907:7854:b0:aa6:3e97:f9e2 with SMTP id a640c23a62f3a-aabf48b987dmr181518166b.47.1734523619346;
        Wed, 18 Dec 2024 04:06:59 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9635996asm561668766b.102.2024.12.18.04.06.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 04:06:58 -0800 (PST)
Date: Wed, 18 Dec 2024 12:06:55 +0000
From: Quentin Perret <qperret@google.com>
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>, Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Fuad Tabba <tabba@google.com>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 18/18] KVM: arm64: Plumb the pKVM MMU in KVM
Message-ID: <Z2K63zlpoQz76hnl@google.com>
References: <20241216175803.2716565-1-qperret@google.com>
 <20241216175803.2716565-19-qperret@google.com>
 <86ttb2qudi.wl-maz@kernel.org>
 <Z2GLR8KZzJn1YpUu@google.com>
 <86pllqqpzm.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <86pllqqpzm.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_040701_225873_493256E5 
X-CRM114-Status: GOOD (  40.83  )
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

On Tuesday 17 Dec 2024 at 15:38:21 (+0000), Marc Zyngier wrote:
> On Tue, 17 Dec 2024 14:31:35 +0000,
> Quentin Perret <qperret@google.com> wrote:
> > 
> > On Tuesday 17 Dec 2024 at 14:03:37 (+0000), Marc Zyngier wrote:
> > > My gripe with this is that it makes it much harder to follow what is
> > > happening by using tags (ctags, etags, whatever). I ended up with the
> > > hack below, which is super ugly, but preserves the tagging
> > > functionality for non-pKVM.
> > 
> > Ack.
> > 
> > > I'll scratch my head to find something more elegant...
> > 
> > I find your proposal pretty reasonable -- I had a few different ideas
> > but they were all really over-engineered, so I figured relying on a
> > naming convention was the simplest. And any divergence will be flagged
> > at compile time, so that shouldn't be too hard to maintain looking
> > forward.
> > 
> > The __S2 name isn't massively descriptive though. Maybe KVM_PGT_CALL()
> > or something? Thinking about it, this abstraction doesn't need to be
> > restricted to stage-2 stuff. We could most likely hide the
> > __pkvm_host_{un}share_hyp() logic behind a pkvm_pgtable_hyp_{un}map()
> > implementation in pkvm.c as well...
> 
> Oh, I'm happy with *any* name. I just changed it to make sure any
> missing occurrence would blow up.
> 
> And yes, if we can make that more uniform, I'm all for that.

I had a go at porting the hyp stage-1 code to the same logic and
ended up with the diff below.

It's not completely obvious it is much better than the existing code
TBH. I ended up resorting to odd things like passing a NULL pgt to the
pkvm_pgtable_hyp_*() functions and such. All the mess comes from the
pKVM boot flow, where Linux originally creates the hyp stage-1
page-table, but then frees it after pKVM has initialized and switches to
using hypercalls.

None of this is needed for this series though, so I won't include that
in v4. I'll post it separately once that series lands, and then we can
decide if it's worth it, or if it should be done differently.

diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index d116ab4230e8..b35c909f4d0a 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -152,8 +152,7 @@ static __always_inline unsigned long __kern_hyp_va(unsigned long v)
 #include <asm/kvm_pgtable.h>
 #include <asm/stage2_pgtable.h>
 
-int kvm_share_hyp(void *from, void *to);
-void kvm_unshare_hyp(void *from, void *to);
+void remove_hyp_mappings(void *from, void *to);
 int create_hyp_mappings(void *from, void *to, enum kvm_pgtable_prot prot);
 int __create_hyp_mappings(unsigned long start, unsigned long size,
 			  unsigned long phys, enum kvm_pgtable_prot prot);
diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
index 65f988b6fe0d..db7851459ef3 100644
--- a/arch/arm64/include/asm/kvm_pkvm.h
+++ b/arch/arm64/include/asm/kvm_pkvm.h
@@ -143,6 +143,11 @@ struct pkvm_mapping {
 	u64 pfn;
 };
 
+int pkvm_pgtable_hyp_init(struct kvm_pgtable *pgt, u32 va_bits, struct kvm_pgtable_mm_ops *mm_ops);
+void pkvm_pgtable_hyp_destroy(struct kvm_pgtable *pgt);
+int pkvm_pgtable_hyp_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
+			 enum kvm_pgtable_prot prot);
+u64 pkvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size);
 int pkvm_pgtable_stage2_init(struct kvm_pgtable *pgt, struct kvm_s2_mmu *mmu,
 			     struct kvm_pgtable_mm_ops *mm_ops);
 void pkvm_pgtable_stage2_destroy(struct kvm_pgtable *pgt);
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index 9bcbc7b8ed38..2dada891c199 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -183,7 +183,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 
 	kvm_init_nested(kvm);
 
-	ret = kvm_share_hyp(kvm, kvm + 1);
+	ret = create_hyp_mappings(kvm, kvm + 1, PAGE_HYP);
 	if (ret)
 		return ret;
 
@@ -217,7 +217,7 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 err_free_cpumask:
 	free_cpumask_var(kvm->arch.supported_cpus);
 err_unshare_kvm:
-	kvm_unshare_hyp(kvm, kvm + 1);
+	remove_hyp_mappings(kvm, kvm + 1);
 	return ret;
 }
 
@@ -268,7 +268,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
 	kfree(kvm->arch.sysreg_masks);
 	kvm_destroy_vcpus(kvm);
 
-	kvm_unshare_hyp(kvm, kvm + 1);
+	remove_hyp_mappings(kvm, kvm + 1);
 
 	kvm_arm_teardown_hypercalls(kvm);
 }
@@ -493,7 +493,7 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	if (err)
 		return err;
 
-	return kvm_share_hyp(vcpu, vcpu + 1);
+	return create_hyp_mappings(vcpu, vcpu + 1, PAGE_HYP);
 }
 
 void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
index ea5484ce1f3b..49acdda3f1d0 100644
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -33,7 +33,7 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
 		return 0;
 
 	/* Make sure the host task fpsimd state is visible to hyp: */
-	ret = kvm_share_hyp(fpsimd, fpsimd + 1);
+	ret = create_hyp_mappings(fpsimd, fpsimd + 1, PAGE_HYP);
 	if (ret)
 		return ret;
 
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 4e6cf4a1a6eb..53e584a5e8d7 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -407,44 +407,20 @@ void __init free_hyp_pgds(void)
 {
 	mutex_lock(&kvm_hyp_pgd_mutex);
 	if (hyp_pgtable) {
-		kvm_pgtable_hyp_destroy(hyp_pgtable);
+		KVM_PGT_CALL(kvm_pgtable_hyp_destroy, hyp_pgtable);
 		kfree(hyp_pgtable);
 		hyp_pgtable = NULL;
 	}
 	mutex_unlock(&kvm_hyp_pgd_mutex);
 }
 
-static bool kvm_host_owns_hyp_mappings(void)
-{
-	if (is_kernel_in_hyp_mode())
-		return false;
-
-	if (static_branch_likely(&kvm_protected_mode_initialized))
-		return false;
-
-	/*
-	 * This can happen at boot time when __create_hyp_mappings() is called
-	 * after the hyp protection has been enabled, but the static key has
-	 * not been flipped yet.
-	 */
-	if (!hyp_pgtable && is_protected_kvm_enabled())
-		return false;
-
-	WARN_ON(!hyp_pgtable);
-
-	return true;
-}
-
 int __create_hyp_mappings(unsigned long start, unsigned long size,
 			  unsigned long phys, enum kvm_pgtable_prot prot)
 {
 	int err;
 
-	if (WARN_ON(!kvm_host_owns_hyp_mappings()))
-		return -EINVAL;
-
 	mutex_lock(&kvm_hyp_pgd_mutex);
-	err = kvm_pgtable_hyp_map(hyp_pgtable, start, size, phys, prot);
+	err = KVM_PGT_CALL(kvm_pgtable_hyp_map, hyp_pgtable, start, size, phys, prot);
 	mutex_unlock(&kvm_hyp_pgd_mutex);
 
 	return err;
@@ -461,138 +437,18 @@ static phys_addr_t kvm_kaddr_to_phys(void *kaddr)
 	}
 }
 
-struct hyp_shared_pfn {
-	u64 pfn;
-	int count;
-	struct rb_node node;
-};
-
-static DEFINE_MUTEX(hyp_shared_pfns_lock);
-static struct rb_root hyp_shared_pfns = RB_ROOT;
-
-static struct hyp_shared_pfn *find_shared_pfn(u64 pfn, struct rb_node ***node,
-					      struct rb_node **parent)
-{
-	struct hyp_shared_pfn *this;
-
-	*node = &hyp_shared_pfns.rb_node;
-	*parent = NULL;
-	while (**node) {
-		this = container_of(**node, struct hyp_shared_pfn, node);
-		*parent = **node;
-		if (this->pfn < pfn)
-			*node = &((**node)->rb_left);
-		else if (this->pfn > pfn)
-			*node = &((**node)->rb_right);
-		else
-			return this;
-	}
-
-	return NULL;
-}
-
-static int share_pfn_hyp(u64 pfn)
-{
-	struct rb_node **node, *parent;
-	struct hyp_shared_pfn *this;
-	int ret = 0;
-
-	mutex_lock(&hyp_shared_pfns_lock);
-	this = find_shared_pfn(pfn, &node, &parent);
-	if (this) {
-		this->count++;
-		goto unlock;
-	}
-
-	this = kzalloc(sizeof(*this), GFP_KERNEL);
-	if (!this) {
-		ret = -ENOMEM;
-		goto unlock;
-	}
-
-	this->pfn = pfn;
-	this->count = 1;
-	rb_link_node(&this->node, parent, node);
-	rb_insert_color(&this->node, &hyp_shared_pfns);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_share_hyp, pfn, 1);
-unlock:
-	mutex_unlock(&hyp_shared_pfns_lock);
-
-	return ret;
-}
-
-static int unshare_pfn_hyp(u64 pfn)
-{
-	struct rb_node **node, *parent;
-	struct hyp_shared_pfn *this;
-	int ret = 0;
-
-	mutex_lock(&hyp_shared_pfns_lock);
-	this = find_shared_pfn(pfn, &node, &parent);
-	if (WARN_ON(!this)) {
-		ret = -ENOENT;
-		goto unlock;
-	}
-
-	this->count--;
-	if (this->count)
-		goto unlock;
-
-	rb_erase(&this->node, &hyp_shared_pfns);
-	kfree(this);
-	ret = kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn, 1);
-unlock:
-	mutex_unlock(&hyp_shared_pfns_lock);
-
-	return ret;
-}
-
-int kvm_share_hyp(void *from, void *to)
-{
-	phys_addr_t start, end, cur;
-	u64 pfn;
-	int ret;
-
-	if (is_kernel_in_hyp_mode())
-		return 0;
-
-	/*
-	 * The share hcall maps things in the 'fixed-offset' region of the hyp
-	 * VA space, so we can only share physically contiguous data-structures
-	 * for now.
-	 */
-	if (is_vmalloc_or_module_addr(from) || is_vmalloc_or_module_addr(to))
-		return -EINVAL;
-
-	if (kvm_host_owns_hyp_mappings())
-		return create_hyp_mappings(from, to, PAGE_HYP);
-
-	start = ALIGN_DOWN(__pa(from), PAGE_SIZE);
-	end = PAGE_ALIGN(__pa(to));
-	for (cur = start; cur < end; cur += PAGE_SIZE) {
-		pfn = __phys_to_pfn(cur);
-		ret = share_pfn_hyp(pfn);
-		if (ret)
-			return ret;
-	}
-
-	return 0;
-}
-
-void kvm_unshare_hyp(void *from, void *to)
+void remove_hyp_mappings(void *from, void *to)
 {
-	phys_addr_t start, end, cur;
-	u64 pfn;
+	unsigned long start = kern_hyp_va((unsigned long)from);
+	unsigned long end = kern_hyp_va((unsigned long)to);
+	unsigned long size = end - start;
 
-	if (is_kernel_in_hyp_mode() || kvm_host_owns_hyp_mappings() || !from)
+	if (!is_protected_kvm_enabled() || !from)
 		return;
 
-	start = ALIGN_DOWN(__pa(from), PAGE_SIZE);
-	end = PAGE_ALIGN(__pa(to));
-	for (cur = start; cur < end; cur += PAGE_SIZE) {
-		pfn = __phys_to_pfn(cur);
-		WARN_ON(unshare_pfn_hyp(pfn));
-	}
+	mutex_lock(&kvm_hyp_pgd_mutex);
+	WARN_ON(KVM_PGT_CALL(kvm_pgtable_hyp_unmap, hyp_pgtable, start, size) != size);
+	mutex_unlock(&kvm_hyp_pgd_mutex);
 }
 
 /**
@@ -615,9 +471,6 @@ int create_hyp_mappings(void *from, void *to, enum kvm_pgtable_prot prot)
 	if (is_kernel_in_hyp_mode())
 		return 0;
 
-	if (!kvm_host_owns_hyp_mappings())
-		return -EPERM;
-
 	start = start & PAGE_MASK;
 	end = PAGE_ALIGN(end);
 
@@ -699,16 +552,6 @@ static int __create_hyp_private_mapping(phys_addr_t phys_addr, size_t size,
 	unsigned long addr;
 	int ret = 0;
 
-	if (!kvm_host_owns_hyp_mappings()) {
-		addr = kvm_call_hyp_nvhe(__pkvm_create_private_mapping,
-					 phys_addr, size, prot);
-		if (IS_ERR_VALUE(addr))
-			return addr;
-		*haddr = addr;
-
-		return 0;
-	}
-
 	size = PAGE_ALIGN(size + offset_in_page(phys_addr));
 	ret = hyp_alloc_private_va_range(size, &addr);
 	if (ret)
@@ -2094,7 +1937,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
 		goto out;
 	}
 
-	err = kvm_pgtable_hyp_init(hyp_pgtable, *hyp_va_bits, &kvm_hyp_mm_ops);
+	err = KVM_PGT_CALL(kvm_pgtable_hyp_init, hyp_pgtable, *hyp_va_bits, &kvm_hyp_mm_ops);
 	if (err)
 		goto out_free_pgtable;
 
@@ -2106,7 +1949,7 @@ int __init kvm_mmu_init(u32 *hyp_va_bits)
 	return 0;
 
 out_destroy_pgtable:
-	kvm_pgtable_hyp_destroy(hyp_pgtable);
+	KVM_PGT_CALL(kvm_pgtable_hyp_destroy, hyp_pgtable);
 out_free_pgtable:
 	kfree(hyp_pgtable);
 	hyp_pgtable = NULL;
diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
index 64de20e8001d..f5a02b4039b1 100644
--- a/arch/arm64/kvm/pkvm.c
+++ b/arch/arm64/kvm/pkvm.c
@@ -270,6 +270,124 @@ static int __init finalize_pkvm(void)
 }
 device_initcall_sync(finalize_pkvm);
 
+struct hyp_shared_page {
+	struct rb_node node;
+	phys_addr_t phys;
+	void *hyp_va;
+	int count;
+};
+static struct rb_root hyp_shared_pages = RB_ROOT;
+
+static struct hyp_shared_page *find_shared_page(void *hyp_va, struct rb_node ***node,
+					       struct rb_node **parent)
+{
+	struct hyp_shared_page *page;
+
+	*node = &hyp_shared_pages.rb_node;
+	*parent = NULL;
+	while (**node) {
+		page = container_of(**node, struct hyp_shared_page, node);
+		*parent = **node;
+		if (page->hyp_va < hyp_va)
+			*node = &((**node)->rb_left);
+		else if (page->hyp_va > hyp_va)
+			*node = &((**node)->rb_right);
+		else
+			return page;
+	}
+
+	return NULL;
+}
+
+int pkvm_pgtable_hyp_init(struct kvm_pgtable *pgt, u32 va_bits, struct kvm_pgtable_mm_ops *mm_ops)
+{
+	if (pgt)
+		return kvm_pgtable_hyp_init(pgt, va_bits, mm_ops);
+	return 0;
+}
+
+void pkvm_pgtable_hyp_destroy(struct kvm_pgtable *pgt)
+{
+	if (pgt)
+		return kvm_pgtable_hyp_destroy(pgt);
+}
+
+static int share_page_hyp(void *hyp_va, phys_addr_t phys)
+{
+	struct rb_node **node, *parent;
+	struct hyp_shared_page *page;
+
+	page = find_shared_page(hyp_va, &node, &parent);
+	if (page) {
+		page->count++;
+		return 0;
+	}
+
+	page = kzalloc(sizeof(*page), GFP_KERNEL);
+	if (!page)
+		return -ENOMEM;
+	page->hyp_va = hyp_va;
+	page->phys = phys;
+	page->count = 1;
+	rb_link_node(&page->node, parent, node);
+	rb_insert_color(&page->node, &hyp_shared_pages);
+
+	return kvm_call_hyp_nvhe(__pkvm_host_share_hyp, phys >> PAGE_SHIFT, 1);
+}
+
+int pkvm_pgtable_hyp_map(struct kvm_pgtable *pgt, u64 addr, u64 size, u64 phys,
+			 enum kvm_pgtable_prot prot)
+{
+	u64 off;
+	int ret;
+
+	if (pgt)
+		return kvm_pgtable_hyp_map(pgt, addr, size, phys, prot);
+
+	addr = ALIGN_DOWN(addr, PAGE_SIZE);
+	phys = ALIGN_DOWN(phys, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
+	if (addr != (u64)kern_hyp_va(__va(phys)))
+		return -EINVAL;
+	if (prot != PAGE_HYP)
+		return -EPERM;
+
+	for (off = 0; off < size; off += PAGE_SIZE) {
+		ret = share_page_hyp((void *)(addr + off), phys + off);
+		if (ret)
+			return ret;
+	}
+
+	return 0;
+}
+
+u64 pkvm_pgtable_hyp_unmap(struct kvm_pgtable *pgt, u64 addr, u64 size)
+{
+	struct rb_node **node, *parent, *next;
+	struct hyp_shared_page *page;
+	u64 pfn, off = 0;
+
+	if (pgt)
+		return kvm_pgtable_hyp_unmap(pgt, addr, size);
+
+	page = find_shared_page((void *)addr, &node, &parent);
+	while (page && ((u64)page->hyp_va == addr + off) && off < size) {
+		next = rb_next(&page->node);
+		page->count--;
+		if (!page->count) {
+			pfn = page->phys >> PAGE_SHIFT;
+			rb_erase(&page->node, &hyp_shared_pages);
+			kfree(page);
+			if (kvm_call_hyp_nvhe(__pkvm_host_unshare_hyp, pfn, 1))
+				break;
+		}
+		off += PAGE_SIZE;
+		page = next ? container_of(next, struct hyp_shared_page, node) : NULL;
+	}
+
+	return off;
+}
+
 static int cmp_mappings(struct rb_node *node, const struct rb_node *parent)
 {
 	struct pkvm_mapping *a = rb_entry(node, struct pkvm_mapping, node);
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 470524b31951..e8b3d08e26dd 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -115,7 +115,7 @@ static int kvm_vcpu_finalize_sve(struct kvm_vcpu *vcpu)
 	if (!buf)
 		return -ENOMEM;
 
-	ret = kvm_share_hyp(buf, buf + reg_sz);
+	ret = create_hyp_mappings(buf, buf + reg_sz, PAGE_HYP);
 	if (ret) {
 		kfree(buf);
 		return ret;
@@ -154,9 +154,9 @@ void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
 	void *sve_state = vcpu->arch.sve_state;
 
-	kvm_unshare_hyp(vcpu, vcpu + 1);
+	remove_hyp_mappings(vcpu, vcpu + 1);
 	if (sve_state)
-		kvm_unshare_hyp(sve_state, sve_state + vcpu_sve_state_size(vcpu));
+		remove_hyp_mappings(sve_state, sve_state + vcpu_sve_state_size(vcpu));
 	kfree(sve_state);
 	kfree(vcpu->arch.ccsidr);
 }
-- 
2.47.1.613.gc27f4b7a9f-goog


