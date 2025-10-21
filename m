Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86D85CCD1A7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 16:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=; b=MB/ChlxbSq90O3DpFaLrNp5auD
	i1ajMf/3SCB2vWbqrhQmHXu9fYwmX4/sg709ey8rtiPiErVbd2fuvMcZ9o92akfG/iwhNMsuxEE0G
	YeJBvZ7id3YKvfXyNfenL0w7sGpSr2rZ2AmrVholyqRV4l4q4zxPn2Hrw82rfsknFlnf+4Eh6j7w8
	z2PWIwrLGubGQoZXNsib5hNSoKOUXjbEWe2U4yQVwhL35bLwvmtDBguK4sPOHk7BJHRENbWc6whdb
	AKkK6C6knyzxeHD1PK3hmFvnv/1cO/S7wPllI7/Sob5djCpSBMpJuQba/J/ZzdQd7zPqRzENG+Evf
	VevwjilA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFM1-000000007kH-39AB;
	Tue, 21 Oct 2025 16:36:57 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBFLy-000000007iq-3kKV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 16:36:56 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-b552f91033cso8706935a12.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Oct 2025 09:36:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761064613; x=1761669413; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
        b=KhTdc6Sd9alH3T5gNBzJdJ8R5LGqXBp0o6/9ZsBtVthNtKKoMUpKbcW/UW1QPz83Bi
         OyRndQzDBUVtKgw/gMFIA/WTrCnAIC4IpB4OZRxlJx8K9XMc4AcC+Hy53VuCapgAfVjv
         gS0n3RWTmRy8Giwjn55o1etmIF0H5qivWSuJJ20vSFjtUyZIUlfWVL286MtVIUJRHdH2
         oVN9pjLS5jeaTjfo/jMiA5+DhmnZh+wxa2e6aqgs5rCsGEbcEH+fw6eIwQMlMKUPUeib
         cAaTFTPhwcQpYDBZvnJIvlE6D4SRX0w3v4bzu4EAWCukJXNFmKcCdSsn2taqdhhAnsjn
         6fJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761064613; x=1761669413;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/IdadGFev8EMGQWIIqEHXt78w+GzasFDdOM6t/N/dU=;
        b=RjQGLmznq1/wNNaU0W9iE3F6IH7DRyB/tiQNF5/iJH8UgbRRrO0cDCP8x2HJaA1qdc
         0nuguQHTqKd5OSK+egGYa9eGMN80O/8754bDchIEOwHDgFfuCU2SfLsq4pBBj0SrOHgZ
         9Jmo33uqTgdj1AX/VgV6oYde2zx5K5AVf9oQSCjzZxjTYiScXlc3oMQMg6077QyeNsg2
         IwLg76fUq2IThBcxTWD1H4KTo2byW2yiNg6MVErAAj98QIbA8TF84PS0aN0GVF82JFja
         BVmpcMtI3vnjxIAwkTBamC2XPe8kOdTNbxU+jAAcUy1lU7+V4oJKiUSOdAtbTYyzlV2l
         pu0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWm1iBAEMkz4CgK0d/Vxr+kNDogHO3ScBdDvush1gjJPYKjgMwfFcvMZHvd9A22v/WITYZDY6J/DjxS6JVsD2W2@lists.infradead.org
X-Gm-Message-State: AOJu0YxeG+MmUmYT+ba2W1pPuWp2rkGEImzTuINfyXyEXOjydkaR7fEy
	jmAokq2c3m17KfbSoHw7xZn7VfC+IxFfqe/Yj+WpmPEOu0/EKygdviT3wg28KstIilwzBq9GzTv
	F7JCJ4g==
X-Google-Smtp-Source: AGHT+IES6ELYoVnXS8by0geR6jOr+Qyair+TP7lX0bGCC8OGD3dU25vj5A6KyxRj4XG+s9p6uoHaw2v+jQs=
X-Received: from pjbnk17.prod.google.com ([2002:a17:90b:1951:b0:32e:ca6a:7ca9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:3d0b:b0:32b:7220:8536
 with SMTP id adf61e73a8af0-334a856d5bbmr22480858637.16.1761064613440; Tue, 21
 Oct 2025 09:36:53 -0700 (PDT)
Date: Tue, 21 Oct 2025 09:36:52 -0700
In-Reply-To: <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
Mime-Version: 1.0
References: <20251017003244.186495-1-seanjc@google.com> <20251017003244.186495-5-seanjc@google.com>
 <aPcG3LMA0qX5H5YI@yzhao56-desk.sh.intel.com>
Message-ID: <aPe2pDYSpVFxDRWv@google.com>
Subject: Re: [PATCH v3 04/25] KVM: x86/mmu: Add dedicated API to map
 guest_memfd pfn into TDP MMU
From: Sean Christopherson <seanjc@google.com>
To: Yan Zhao <yan.y.zhao@intel.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	"Kirill A. Shutemov" <kas@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	x86@kernel.org, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Ira Weiny <ira.weiny@intel.com>, Kai Huang <kai.huang@intel.com>, 
	Michael Roth <michael.roth@amd.com>, Vishal Annapurve <vannapurve@google.com>, 
	Rick Edgecombe <rick.p.edgecombe@intel.com>, Ackerley Tng <ackerleytng@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_093654_931424_876BCD1C 
X-CRM114-Status: GOOD (  17.77  )
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

On Tue, Oct 21, 2025, Yan Zhao wrote:
> On Thu, Oct 16, 2025 at 05:32:22PM -0700, Sean Christopherson wrote:
> > diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
> > index 18d69d48bc55..ba5cca825a7f 100644
> > --- a/arch/x86/kvm/mmu/mmu.c
> > +++ b/arch/x86/kvm/mmu/mmu.c
> > @@ -5014,6 +5014,65 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
> >  	return min(range->size, end - range->gpa);
> >  }
> >  
> > +int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
> > +{
> > +	struct kvm_page_fault fault = {
> > +		.addr = gfn_to_gpa(gfn),
> > +		.error_code = PFERR_GUEST_FINAL_MASK | PFERR_PRIVATE_ACCESS,
> > +		.prefetch = true,
> > +		.is_tdp = true,
> > +		.nx_huge_page_workaround_enabled = is_nx_huge_page_enabled(vcpu->kvm),
> > +
> > +		.max_level = PG_LEVEL_4K,
> > +		.req_level = PG_LEVEL_4K,
> > +		.goal_level = PG_LEVEL_4K,
> > +		.is_private = true,
> > +
> > +		.gfn = gfn,
> > +		.slot = kvm_vcpu_gfn_to_memslot(vcpu, gfn),
> > +		.pfn = pfn,
> > +		.map_writable = true,
> > +	};
> > +	struct kvm *kvm = vcpu->kvm;
> > +	int r;
> > +
> > +	lockdep_assert_held(&kvm->slots_lock);
> Do we need to assert that filemap_invalidate_lock() is held as well?

Hrm, a lockdep assertion would be nice to have, but it's obviously not strictly
necessary, and I'm not sure it's worth the cost.  To safely assert, KVM would need
to first assert that the file refcount is elevated, e.g. to guard against
guest_memfd _really_ screwing up and not grabbing a reference to the underlying
file.

E.g. it'd have to be something like this:

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 94d7f32a03b6..5d46b2ac0292 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -5014,6 +5014,18 @@ long kvm_arch_vcpu_pre_fault_memory(struct kvm_vcpu *vcpu,
        return min(range->size, end - range->gpa);
 }
 
+static void kvm_assert_gmem_invalidate_lock_held(struct kvm_memory_slot *slot)
+{
+#ifdef CONFIG_PROVE_LOCKING
+       if (WARN_ON_ONCE(!kvm_slot_has_gmem(slot)) ||
+           WARN_ON_ONCE(!slot->gmem.file) ||
+           WARN_ON_ONCE(!file_count(slot->gmem.file)))
+               return;
+
+       lockdep_assert_held(file_inode(&slot->gmem.file)->i_mapping->invalidate_lock));
+#endif
+}
+
 int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 {
        struct kvm_page_fault fault = {
@@ -5038,6 +5050,8 @@ int kvm_tdp_mmu_map_private_pfn(struct kvm_vcpu *vcpu, gfn_t gfn, kvm_pfn_t pfn)
 
        lockdep_assert_held(&kvm->slots_lock);
 
+       kvm_assert_gmem_invalidate_lock_held(fault.slot);
+
        if (KVM_BUG_ON(!tdp_mmu_enabled, kvm))
                return -EIO;
--

Which I suppose isn't that terrible?

