Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE23AC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 20:50:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I5t8P7O8Q2d0gJsfuLHKOR+WvGfRlegvudtjyvE+c7E=; b=mynXUABXpEbJIYe59PrcDfi3tG
	D4yx4oOiNlIWlNT7mMfERgK/i7xrnFYgku4HfJINuzDBWwlfOjXQu4nPVpZ58LvECWLQQUbFmVfZ1
	Beim63t8I9hLr4O+wE39j4G3xyVDjwmwCHivXDV9LpE5jyHZLB2z/PnsdDBFizTaca48Wl2cazjZx
	xLFb7Y/+5809MhyPXCdlW9OlraVeSwWreyq8bATIhea73kQXSVIsbp84DsK9rinBf6zpi5XSBgkG/
	VT0DlR31Ann28pvvfdbTEP9Tquy3eAU5QcsYnRutU6R3pgBCz2Oap5MOxz7Ynd5JaRzkmJCxjUgbd
	fqZ5NbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzjK-0000000BMuY-0ire;
	Wed, 18 Jun 2025 20:49:58 +0000
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRzh5-0000000BMmM-2JZe
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 20:47:40 +0000
Received: by mail-pf1-x44a.google.com with SMTP id d2e1a72fcca58-748d96b974cso43668b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 13:47:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750279658; x=1750884458; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=I5t8P7O8Q2d0gJsfuLHKOR+WvGfRlegvudtjyvE+c7E=;
        b=0BYlqAZKxDEFIMWYo54XjVkxK9AyGMM0ptMYGwbHIE6TyFRlT7bmdWbL+F5KhTPbtG
         ngvgqha1DxT0XXNCrvYnQkOS76Kd394H48m/IbzxWHzaDA6dKPHW02wlCFofK7BGmuwc
         X//ANR9CZVh2SppmRjoP3GH6rGiBkYi5kDB3ih2IW6yvAv0aj05mBrpBje5Glh4uIsM7
         LJ7iA1pENIPE1EVGTZUR7CChMGz2IbRtKOT2nDxo6Ft+GvyN9cWuw1dcsDVk8I9XA1eV
         tyqgGsdIY0cDixe1FeMpZmihnvPWC8cBwJ9JCY23XJnMX87XPxPc+4jBaULdpC4NZUNm
         Ou2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750279658; x=1750884458;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=I5t8P7O8Q2d0gJsfuLHKOR+WvGfRlegvudtjyvE+c7E=;
        b=vVkQDzvHHm9KGVRoqGfH1lUobbEMKxtjeA3ZKwiANBvPTDrTztqBNz9wA9sYdcjqLD
         mwKM3ig7w73aE1ofWocEVbzzkTs9puKVqhv4eATTJwyzGqY/7BrH81denMb0sahuUyAI
         M4iKoYvHG7PkV/UcngxmkXVZulVO/LRpF2T3iII8UynH+cHXlABQkrho68vvcgYJMxff
         /j74YUSZq+7ycr5auOwCUMKfzAWuXMFe7eR0dxKZuGzLwtFgQUmO4jlS2d5txC6QE8kK
         yBB0jv0spfycpLEwR6A+cjmKgY1RpxOj6LDzQ5T7J3D8FPmU+QamwPXfg/LhTzNQQFTv
         eWog==
X-Forwarded-Encrypted: i=1; AJvYcCX0QHcJ9ISZAdF32+nTlZ9iThML2s6sDMSOfOI8s3a+9C7y/gWW4kI/bIWOll+RsUvAWzx4Nk2hel1SRwsKb9RL@lists.infradead.org
X-Gm-Message-State: AOJu0YwIsg3HjD0NjVqEbY8du1Mh1Wfur1LmSkRgza1ybDjsUHcC96CW
	gl7V5CmLz9SOZX7euQ3VnPPy2hxuk6UtkV0zpPx8V6jOQLXH9+RCv6Mh3C9iiOogGMsm/IJxekA
	qgaifyw==
X-Google-Smtp-Source: AGHT+IFsMlePwDY6qmxFMx2/AM9b76jDzDiB1mAOtEb6xvvscl9w6SK2u5TQJ/MjXtylS7QVbS8ovVI8RZ8=
X-Received: from pfbgh9.prod.google.com ([2002:a05:6a00:6389:b0:747:b682:5cc0])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:b8b:b0:736:5e28:cfba
 with SMTP id d2e1a72fcca58-7489cfc3944mr25334965b3a.18.1750279658241; Wed, 18
 Jun 2025 13:47:38 -0700 (PDT)
Date: Wed, 18 Jun 2025 13:47:36 -0700
In-Reply-To: <aFMaxi5LDr4HHbMR@linux.dev>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-4-jthoughton@google.com> <aFMaxi5LDr4HHbMR@linux.dev>
Message-ID: <aFMl6DOcKfH6ampb@google.com>
Subject: Re: [PATCH v3 03/15] KVM: arm64: x86: Require "struct kvm_page_fault"
 for memory fault exits
From: Sean Christopherson <seanjc@google.com>
To: Oliver Upton <oliver.upton@linux.dev>
Cc: James Houghton <jthoughton@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	Nikita Kalyazin <kalyazin@amazon.com>, Anish Moorthy <amoorthy@google.com>, 
	Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_134739_609720_3A706C3C 
X-CRM114-Status: GOOD (  25.15  )
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

On Wed, Jun 18, 2025, Oliver Upton wrote:
> On Wed, Jun 18, 2025 at 04:24:12AM +0000, James Houghton wrote:
> > +#ifdef CONFIG_KVM_GENERIC_PAGE_FAULT
> > +
> > +#define KVM_ASSERT_TYPE_IS(type_t, x)					\
> > +do {									\
> > +	type_t __maybe_unused tmp;					\
> > +									\
> > +	BUILD_BUG_ON(!__types_ok(tmp, x) || !__typecheck(tmp, x));	\
> > +} while (0)
> > +
> >  static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
> > -						 gpa_t gpa, gpa_t size,
> > -						 bool is_write, bool is_exec,
> > -						 bool is_private)
> > +						 struct kvm_page_fault *fault)
> >  {
> > +	KVM_ASSERT_TYPE_IS(gfn_t, fault->gfn);
> > +	KVM_ASSERT_TYPE_IS(bool, fault->exec);
> > +	KVM_ASSERT_TYPE_IS(bool, fault->write);
> > +	KVM_ASSERT_TYPE_IS(bool, fault->is_private);
> > +	KVM_ASSERT_TYPE_IS(struct kvm_memory_slot *, fault->slot);
> > +
> >  	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
> > -	vcpu->run->memory_fault.gpa = gpa;
> > -	vcpu->run->memory_fault.size = size;
> > +	vcpu->run->memory_fault.gpa = fault->gfn << PAGE_SHIFT;
> > +	vcpu->run->memory_fault.size = PAGE_SIZE;
> >  
> >  	/* RWX flags are not (yet) defined or communicated to userspace. */
> >  	vcpu->run->memory_fault.flags = 0;
> > -	if (is_private)
> > +	if (fault->is_private)
> >  		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
> >  }
> > +#endif
> 
> This *is not* the right direction of travel for arm64. Stage-2 aborts /
> EPT violations / etc. are extremely architecture-specific events.

Yes and no.  100% agreed there are arch/vendor specific aspects of stage-2 faults,
but there are most definitely commonalites as well.

> What I would like to see on arm64 is that for every "KVM_EXIT_MEMORY_FAULT"
> we provide as much syndrome information as possible. That could imply
> some combination of a sanitised view of ESR_EL2 and, where it is
> unambiguous, common fault flags that have shared definitions with x86.

Me confused, this is what the above does?  "struct kvm_page_fault" is arch
specific, e.g. x86 has a whole pile of stuff in there beyond gfn, exec, write,
is_private, and slot.

The approach is non-standard, but I think my justification/reasoning for having
the structure be arch-defined still holds:

 : Rather than define a common kvm_page_fault and kvm_arch_page_fault child,
 : simply assert that the handful of required fields are provided by the
 : arch-defined structure.  Unlike vCPU and VMs, the number of common fields
 : is expected to be small, and letting arch code fully define the structure
 : allows for maximum flexibility with respect to const, layout, etc.

If we could use anonymous struct field, i.e. could embed a kvm_arch_page_fault
without having to bounce through an "arch" field, I would vote for the approach.
Sadly, AFAIK, we can't yet use those in the kernel.

> This could incur some minor code duplication, but even then we can share
> helpers for the software bits (like userfault).

Again, that is what is proposed here.

> FEAT_MTE_PERM is a very good example for this. There exists a "Tag"
> permission at stage-2 which is unrelated to any of the 'normal'
> read/write permissions. There's also the MostlyReadOnly permission from
> FEAT_THE which grants write permission to a specific set of instructions.
> 
> I don't want to paper over these nuances and will happily maintain an
> arm64-specific flavor of "kvm_prepare_memory_fault_exit()"

Nothing prevents arm64 (or any arch) from wrapping kvm_prepare_memory_fault_exit()
and/or taking action after it's invoked.  That's not an accident; the "prepare
exit" helpers (x86 has a few more) were specifically designed to not be used as
the "return" to userspace.  E.g. this one returns "void" instead of -EFAULT
specifically so that the callers isn't "required" to ignore the return if the
caller wants to populate (or change, but hopefully that's never the case) fields
after calling kvm_prepare_memory_fault_exit), and so that arch can return an
entirely different error code, e.g. -EHWPOISON when appropriate.

And it's not just kvm_prepare_memory_fault_exit() that I want to use kvm_page_fault;
kvm_faultin_pfn() is another case where having a common "struct kvm_page_fault"
would clean up some ugly/annoying boilerplate.

