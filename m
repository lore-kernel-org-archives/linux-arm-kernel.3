Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD51AC79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 16:24:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0rpxpcs9OXB4KnER7qZ3x6F/Alg7K5WCZ24dhH70660=; b=HGbjLBV4VHIn3N6HMIU1Qbe2Yq
	oHU0xe9lpGP8cyq5hp8DJapGoJfXSgor/Yj8uG7X7iiGax//TF9pHzkHjoD7IEh3AbFmH56kMSk3A
	p0r3lLqA8sLuIXqLGBdwgx6DQhrQAoCXjyodbJNAnPEofpSDn1b6WDFAbU6SnnH2Vv2+JQ+BfPbUI
	OiIbJUV6/syAj3mca9dioiZZWIa3RBexW1kRJqCtKGj1nYtvvGBpf3guA/thKkftWnZYTUOTqvQ1t
	nrOrAuy5i4q4pw460AxLu7nc0dE8qKZHquVaAArZjkz78ZpkeQkyLrrFBV9guOccf3iAlw6oNg0eB
	f+64znig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hZU-0000000EwEr-1tHf;
	Thu, 10 Sep 2026 16:24:20 +0000
Received: from mail-pj1-x1045.google.com ([2607:f8b0:4864:20::1045])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4hZR-0000000EwE3-1zmc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 16:24:18 +0000
Received: by mail-pj1-x1045.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso12191350a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Sep 2026 09:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789057456; x=1789662256; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0rpxpcs9OXB4KnER7qZ3x6F/Alg7K5WCZ24dhH70660=;
        b=YklsOATpwj9/qVdOgdOloV7SH9awByVgDf02RzpTZqXLWUtAsABHSrfZ+qdHmAoYGA
         0eC7dcxzP+i8kprS3JX7vOJXOehnncHPpZ71Du2r2/xdBvpn6F+yPF1Y/sgSrh0VtRSG
         9uNd9cjbWkvfGopIb4UEHmXCwfUYh8WLJdUHCG3c0bnDAxjy3ZefiqBqAAM/nlsU4yav
         /1AzNsRpudPZ+A1lZuz9ka1OUMQ099qAxlMOskJArxMmsD4IMLcKPloTHejFIp5l13+E
         6JpXa0xY18s2+sq0XKvcV1IjbSNnucLfgH3vTfPeSzLehYaxjCk7i/1eYPyZ0PUiNLRz
         E7/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789057456; x=1789662256;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0rpxpcs9OXB4KnER7qZ3x6F/Alg7K5WCZ24dhH70660=;
        b=RXWTtsc49KjS4HFadjxgO96nqSv8HJnM0XtdApjcsDRQMh9Qk3ekWD6zf6RMWHKU64
         Ik+Efl+erdeq2tFvuI3H7YHXpUm8Ff0yEWELthAjdPeFjK9Im2IuY6DvNr0pvmhJAwQh
         ZTVLlgtqW+X95pHweDckt94U5UhmOAJ6LXNzZiIjxDf/PHwgX01/o44cIiJS2rCUHzlz
         XBWXVvWA5mrr/n4IdLtjYNvhrKXtBB2e/3VB249WvgQC4hRkAiXQCAEM9W84eowRoofr
         B41tcDICKwaY11igI8GO6L1zVsWS4iCBSP/9Vh4j4N46579GhwI+9H7Wrz3lBmUXk79x
         8s2w==
X-Forwarded-Encrypted: i=1; AKwUvBylnX5yqf+s6hQrO6/8zLebJqOkXNoQzL38Zepd/qHakpv1HQjgPkvrD5/mM0YgU8xTrKqcF/9v2/x8sOvL4YeB@lists.infradead.org
X-Gm-Message-State: AFuF++k6HV0vlwekDFQnTwWWWmhSDlSuhGHncA7Oi7tEytLYRbqZusDl
	b0tBoTVKHq2Oel7QKGKHn1dNLMqo/CPHyrW7EIddmZn7hkwxK2n20F1POtwaOoMFsdu1+0LefYo
	uKsWZ6Q==
X-Received: from pjye16.prod.google.com ([2002:a17:90a:ee10:b0:39b:9a0e:78cd])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d644:b0:398:9c00:29ec
 with SMTP id 98e67ed59e1d1-39b26245cfcmr66792937a91.20.1789057455320; Thu, 10
 Sep 2026 09:24:15 -0700 (PDT)
Date: Thu, 10 Sep 2026 09:24:14 -0700
In-Reply-To: <5x0d1hj1.ritesh.list@gmail.com>
Mime-Version: 1.0
References: <20260902164123.2546762-1-seanjc@google.com> <20260902164123.2546762-13-seanjc@google.com>
 <5x0d1hj1.ritesh.list@gmail.com>
Message-ID: <aqLZrk6m3NgugzBU@google.com>
Subject: Re: [PATCH v2 12/20] KVM: selftests: Add APIs to override memory
 region types with custom memslots
From: Sean Christopherson <seanjc@google.com>
To: Ritesh Harjani <ritesh.list@gmail.com>
Cc: Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, 
	Paolo Bonzini <pbonzini@redhat.com>, Tianrui Zhao <zhaotianrui@loongson.cn>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Fuad Tabba <fuad.tabba@linux.dev>, 
	Joey Gouly <joey.gouly@arm.com>, Steffen Eiden <seiden@linux.ibm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Atish Patra <atish.patra@linux.dev>, Alexandre Ghiti <alex@ghiti.fr>, 
	David Hildenbrand <david@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, kvm@vger.kernel.org, loongarch@lists.linux.dev, 
	kvm-riscv@lists.infradead.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Itaru Kitayama <itaru.kitayama@fujitsu.com>, 
	Nicholas Piggin <npiggin@gmail.com>
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260910_092417_518782_3D848BA6 
X-CRM114-Status: GOOD (  19.48  )
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

On Thu, Sep 10, 2026, Ritesh Harjani wrote:
> Sean Christopherson <seanjc@google.com> writes:
> 
> > Add and use APIs to override memory region types instead of open coding the
> > logic in tests, partly to dedup test code, but mostly to add some amount of
> > protection against conflicting overrides.  This will allow converting more
> > tests to override memory regions without taking on too much risk of bugs in
> > the long term, e.g. due to silently overriding a region multiple times.
> >
> > Deliberately "unroll" the loops in __vm_create() and the CMMA test's
> > create_main_memslot() to avoid filling all memslots in anticipation of
> > adding an "extra" memslot that is for test use and *only* test use, i.e.
> > shouldn't be configured by core library code.
> >
> > Converting tests to overriding memory regions will allow taking the region
> > type instead of the raw memslot in the physical page allocator APIs.
> >
> 
> May I suggest few changes in the naming of these APIs:
> 
> static inline void vm_override_mem_region(struct kvm_vm *vm,
> 					      enum kvm_mem_region_type type,
> 					      u32 slot)
> {
> 	TEST_ASSERT(vm->memslots[type] == KVM_INVALID_MEMSLOT,
> 		    "Memory region type '%u' was already overridden with slot=%u",
> 		    type, vm->memslots[type]);
> 
> 	vm->memslots[type] = slot;
> }
> 
> static inline void vm_override_add_mem_region_flags(struct kvm_vm *vm,
> 					    enum kvm_mem_region_type type,
> 					    enum vm_mem_backing_src_type src_type,
> 					    gpa_t gpa, u32 slot, u64 npages,
> 					    u32 flags)
> {
> 	vm_override_mem_region(vm, type, slot);
> 	vm_userspace_mem_region_add(vm, src_type, gpa, slot, npages, flags);
> }
> 
> static inline void vm_override_add_mem_region(struct kvm_vm *vm,
> 					  enum kvm_mem_region_type type,
> 					  enum vm_mem_backing_src_type src_type,
> 					  gpa_t gpa, u32 slot, u64 npages)
> {
> 	vm_override_add_mem_region_flags(vm, type, src_type, gpa, slot, npages, 0);
> }
> 
> Those "_add_" and "_flags" in the function names easily gives away
> the difference in the APIs, rather than differentiating via "__".

I am strongly against postfixes like "_flags".  We do use postfixes for the VM
creation APIs, e.g. vm_create_barebones(), vm_create_with_vcpus(), etc., but only
because there are so many possible combinations that differentiating through
underscores is completely infeasible (unless we forced callers to regurgitate
huge amounts of boilerplace and/or had an absurd number of params), and because
the collection of APIs is tree-like, as opposed to a single linear chain of APIs.

For this, there is a much more finite set of possibilities, and the set of APIs
is a direct liner chain (no underscores => __ => ____).

I agree that not capturing that {,__}vm_override_mem_region() adds a userspace
memory region isn't ideal, but due to the term "memory region" already being
somewhat overloaded, I don't want to have "add" in the name as I think that will
make it harder to differentiate between the "enum kvm_mem_region_type" APIs and
the "userspace memory region" APIs.

And IMO it's totally fine for a function name to express what the API does at a
higher level, without capturing the exact operations in explicit detail.  E.g.
__vm_create() (and even ____vm_create()) obviously does a lot more than literally
KVM_VM_CREATE.

