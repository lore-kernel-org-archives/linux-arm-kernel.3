Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06B6EC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 23:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aVP3DiB3HvKNlxTLG6+nr+sih4i6SPT2KS137bqEj/Y=; b=2yS6ddAZ7ZRlbozlYTmOY2VMT/
	FudSVL8bgNgokUpUqERmSJsLcshJaYw0zMm2dw6QjcJTOk5AOsyYzhxAK6sdGZM7ULZH1xTIVEDCU
	x5tpWmIoa4An9dHqKvCV5Zn5rGR2Cvv8vMALYdcAt8OY/ycLNXS59rsZSmAddZKCC5Fuk5m2R8pZo
	P87biXxv+VYsK7srKPHUNE1xoYBmx02QdglhveVPApauWZM1R91Khj1rZV3SVcXshBYrGDNI22RJI
	NaTjmHmyHTLVxZtUevPEiuTeg6cVBxa7j2ZXfAxPHIdoa5buosuX/taUDe7/J8NCg1zV0QYCe40vW
	6hFNEtVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS21M-0000000BYWq-1kBf;
	Wed, 18 Jun 2025 23:16:44 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS1z7-0000000BYNG-2YQK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 23:14:27 +0000
Date: Wed, 18 Jun 2025 16:14:05 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750288461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=aVP3DiB3HvKNlxTLG6+nr+sih4i6SPT2KS137bqEj/Y=;
	b=fJj+vEfcdZsyWbaYG30vNEKCtdWDHf3g/Ygtj0VNq6V4fzpOclefHU3KyXH2CvANdlmjNK
	KXUHjfjWAYGVPuitRWmnlr44c7tykStb3daT7iXyVWr7i8HlcdTbOqEYIaSPjBClT5iSGs
	GXLmADF9YQYmQOiFGcADjtlYqs4zKUs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Sean Christopherson <seanjc@google.com>
Cc: James Houghton <jthoughton@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Yan Zhao <yan.y.zhao@intel.com>,
	Nikita Kalyazin <kalyazin@amazon.com>,
	Anish Moorthy <amoorthy@google.com>,
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>,
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com,
	kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev
Subject: Re: [PATCH v3 03/15] KVM: arm64: x86: Require "struct
 kvm_page_fault" for memory fault exits
Message-ID: <aFNIPXoEb5iCjt_L@linux.dev>
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-4-jthoughton@google.com>
 <aFMaxi5LDr4HHbMR@linux.dev>
 <aFMl6DOcKfH6ampb@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFMl6DOcKfH6ampb@google.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_161426_132537_9C02AA50 
X-CRM114-Status: GOOD (  36.55  )
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

On Wed, Jun 18, 2025 at 01:47:36PM -0700, Sean Christopherson wrote:
> On Wed, Jun 18, 2025, Oliver Upton wrote:
> > On Wed, Jun 18, 2025 at 04:24:12AM +0000, James Houghton wrote:
> > > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > > +
> > > +#define KVM_ASSERT_TYPE_IS(type_t, x)					\
> > > +do {									\
> > > +	type_t __maybe_unused tmp;					\
> > > +									\
> > > +	BUILD_BUG_ON(!__types_ok(tmp, x) || !__typecheck(tmp, x));	\
> > > +} while (0)
> > > +
> > >  static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > > -						 gpa_t gpa, gpa_t size,
> > > -						 bool is_write, bool is_exec,
> > > -						 bool is_private)
> > > +						 struct kvm_page_fault *fault)
> > >  {
> > > +	KVM_ASSERT_TYPE_IS(gfn_t, fault->gfn);
> > > +	KVM_ASSERT_TYPE_IS(bool, fault->exec);
> > > +	KVM_ASSERT_TYPE_IS(bool, fault->write);
> > > +	KVM_ASSERT_TYPE_IS(bool, fault->is_private);
> > > +	KVM_ASSERT_TYPE_IS(struct kvm_memory_slot *, fault->slot);
> > > +
> > >  	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> > > -	vcpu->run->memory_fault.gpa = gpa;
> > > -	vcpu->run->memory_fault.size = size;
> > > +	vcpu->run->memory_fault.gpa = fault->gfn << PAGE_SHIFT;
> > > +	vcpu->run->memory_fault.size = PAGE_SIZE;
> > >  
> > >  	/* RWX flags are not (yet) defined or communicated to userspace. */
> > >  	vcpu->run->memory_fault.flags = 0;
> > > -	if (is_private)
> > > +	if (fault->is_private)
> > >  		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
> > >  }
> > > +#endif
> > 
> > This *is not* the right direction of travel for arm64. Stage-2 aborts /
> > EPT violations / etc. are extremely architecture-specific events.
> 
> Yes and no.  100% agreed there are arch/vendor specific aspects of stage-2 faults,
> but there are most definitely commonalites as well.

And I agree those commonalities should be expressed with the same flags
where possible.

> > What I would like to see on arm64 is that for every "KVM_EXIT_MEMORY_FAULT"
> > we provide as much syndrome information as possible. That could imply
> > some combination of a sanitised view of ESR_EL2 and, where it is
> > unambiguous, common fault flags that have shared definitions with x86.
> 
> Me confused, this is what the above does?  "struct kvm_page_fault" is arch
> specific, e.g. x86 has a whole pile of stuff in there beyond gfn, exec, write,
> is_private, and slot.

Right, but now I need to remember that some of the hardware syndrome
(exec, write) is handled in the arch-neutral code and the rest belongs
to the arch.

> The approach is non-standard, but I think my justification/reasoning for having
> the structure be arch-defined still holds:
> 
>  : Rather than define a common kvm_page_fault and kvm_arch_page_fault child,
>  : simply assert that the handful of required fields are provided by the
>  : arch-defined structure.  Unlike vCPU and VMs, the number of common fields
>  : is expected to be small, and letting arch code fully define the structure
>  : allows for maximum flexibility with respect to const, layout, etc.
> 
> If we could use anonymous struct field, i.e. could embed a kvm_arch_page_fault
> without having to bounce through an "arch" field, I would vote for the approach.
> Sadly, AFAIK, we can't yet use those in the kernel.

The general impression is that this is an unnecessary amount of
complexity for doing something trivial (computing flags).

> > This could incur some minor code duplication, but even then we can share
> > helpers for the software bits (like userfault).
> 
> Again, that is what is proposed here.
> 
> > FEAT_MTE_PERM is a very good example for this. There exists a "Tag"
> > permission at stage-2 which is unrelated to any of the 'normal'
> > read/write permissions. There's also the MostlyReadOnly permission from
> > FEAT_THE which grants write permission to a specific set of instructions.
> > 
> > I don't want to paper over these nuances and will happily maintain an
> > arm64-specific flavor of "kvm_prepare_memory_fault_exit()"
> 
> Nothing prevents arm64 (or any arch) from wrapping kvm_prepare_memory_fault_exit()
> and/or taking action after it's invoked.  That's not an accident; the "prepare
> exit" helpers (x86 has a few more) were specifically designed to not be used as
> the "return" to userspace.  E.g. this one returns "void" instead of -EFAULT
> specifically so that the callers isn't "required" to ignore the return if the
> caller wants to populate (or change, but hopefully that's never the case) fields
> after calling kvm_prepare_memory_fault_exit), and so that arch can return an
> entirely different error code, e.g. -EHWPOISON when appropriate.

IMO, this does not achieve the desired layering / ownership of memory
fault triage. This would be better organized as the arch code computing
all of the flags relating to the hardware syndrome (even boring ones
like RWX) and arch-neutral code potentially lending a hand with the
software bits.

With this I either need to genericize the horrors of the Arm
architecture in the common thing or keep track of what parts of the
hardware flags are owned by arch v. non-arch. SW v. HW fault context is
a cleaner split, IMO.

> And it's not just kvm_prepare_memory_fault_exit() that I want to use kvm_page_fault;
> kvm_faultin_pfn() is another case where having a common "struct kvm_page_fault"
> would clean up some ugly/annoying boilerplate.

That might be a better starting point for unifying these things, esp.
since kvm_faultin_pfn() doesn't have UAPI implications hiding behind it
and is already using common parameters.

Thanks,
Oliver

