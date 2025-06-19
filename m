Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A52A6C71157
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 01:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IB1pXwG+o7bC4LkvgA8w7LAYlqk0B9GUuwyv4RmtU4=; b=x86qg/tx8qxgD4QewBTzVHxH7D
	gQlDlii6ztqLEOdAWjcLQoTvKK76W7XAwunzvHWY3vFC1rxxRP9nJkcbnBPPI60iDZ8S0pAFpGvsa
	zlzFJWSiNmbU6ShxmC/wX0p+LLOhdfRK2Utx+M0LNMgqEmfp74Qa02FIPO265fY47DqK2+kR+7SSn
	Am7qqt1OEIZH2gYRL9kAOcFiHUh0bmHe46seXeBDjkuyrIS506a08ICxXCLAfKkCKfsfkOQscT+0j
	kirwIZ6Z5AKR+KP209xDPfcJxjGw41WljdqA+n7fKCH/MGhXEvNPXFAeSoKRLho0JKnS71SkZd5jV
	4sEibZEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS41m-0000000Bk8w-2V9L;
	Thu, 19 Jun 2025 01:25:18 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uS3zZ-0000000Bk1q-0qGQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 01:23:02 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-311ae2b6647so141355a91.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 18:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750296180; x=1750900980; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8IB1pXwG+o7bC4LkvgA8w7LAYlqk0B9GUuwyv4RmtU4=;
        b=Gv6OBxW3jLkFt4yxMkl8hZ8LF/Qc53vtkmdHLX9lkKVY4upIETqio3jxgHIh7zVGSh
         qxdkRNRBo4slelAacKik3+TLIi0/Pnt+RtGQYOwSKpqPYN96e0gL1Bu6WBLd2MDjeRWy
         e9HJMYExselAkD0IleJjlgZEmMrcZzUDjis/0WaArLoiXcb2w06mELS5AJO/C57ZZzzp
         zSqK0D5OA67nlDKqH3gr3qX5ixqUSTRAPnZXcPtVvdjpb3V0GKvqnYtt5I5nDrxlPDDC
         lAuFhYtRPzkRa7j74GNmFAsS9kasEIk+WNTNFSjsSZOLUiEaiMkcL72eGadhAKjtTXV2
         HLlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750296180; x=1750900980;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8IB1pXwG+o7bC4LkvgA8w7LAYlqk0B9GUuwyv4RmtU4=;
        b=Prer66Q8BmMB1slUUW7cSwykYikUUF9rbvVPjSd5h02eNBzofD86o74K09UBA9S3vA
         GlPOykFp/lZ/oyRu55F14UTV66+TUMSmHPf/dCPv54FhE/DJ/bv0Pqwy6+YTtlhGwRmG
         aHk6iaIW8uWtEVym6HON+ZYJj52dwDYPz/Lwto0UpFHy2+MsuWFy9lOoupR+j7r6yye3
         Gk+0GisWNy8mrwV6JmoyWlSkdzX/azAJof/HP+HN3uDdUuWkkP9nSp9LEWUoNaGugrr+
         2U0mokop/RI+YtJ65J/kiKhgnTvJzeWZ6IU26QNpBDklWy0gBIPDcRiFdqrqw3s5twb0
         d9Pg==
X-Forwarded-Encrypted: i=1; AJvYcCWzL0AW6zTkEFbnqE3UBIGes9sMvz9M8Bc8Xq732rHm3UOIQDq7kI5Oy4utvpw8X8gfG8WSv/U2lhFRZ/0yqlU1@lists.infradead.org
X-Gm-Message-State: AOJu0YxlnFxwy4ptAEFZCGv4knc+XvNVSGqUXKrvqXXRVEsK31Ocaf+j
	8JNrDbDTzAI2JOjOtiRa1yLCuz4O7W2FPxpd8LJCnKTYCOTkX1QyWynyXTTu0ZYiy96lp1S/Nvp
	z27wG7Q==
X-Google-Smtp-Source: AGHT+IGdcvQAVVSk4fM09uW8oDEjJdJY7dpl9V3Y4AvXuJ+N0Avyh7SwiUaAWue2o5CoAmxFjj275F4p3uY=
X-Received: from pjbsz14.prod.google.com ([2002:a17:90b:2d4e:b0:313:1c10:3595])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:254e:b0:311:e8cc:4256
 with SMTP id 98e67ed59e1d1-313f1d644b8mr24662451a91.22.1750296180025; Wed, 18
 Jun 2025 18:23:00 -0700 (PDT)
Date: Wed, 18 Jun 2025 18:22:58 -0700
In-Reply-To: <aFNIPXoEb5iCjt_L@linux.dev>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
 <20250618042424.330664-4-jthoughton@google.com> <aFMaxi5LDr4HHbMR@linux.dev>
 <aFMl6DOcKfH6ampb@google.com> <aFNIPXoEb5iCjt_L@linux.dev>
Message-ID: <aFNmci0s1_P845XZ@google.com>
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
X-CRM114-CacheID: sfid-20250618_182301_261127_DBABBF07 
X-CRM114-Status: GOOD (  37.33  )
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
> On Wed, Jun 18, 2025 at 01:47:36PM -0700, Sean Christopherson wrote:
> > On Wed, Jun 18, 2025, Oliver Upton wrote:
> > > What I would like to see on arm64 is that for every "KVM_EXIT_MEMORY_FAULT"
> > > we provide as much syndrome information as possible. That could imply
> > > some combination of a sanitised view of ESR_EL2 and, where it is
> > > unambiguous, common fault flags that have shared definitions with x86.
> > 
> > Me confused, this is what the above does?  "struct kvm_page_fault" is arch
> > specific, e.g. x86 has a whole pile of stuff in there beyond gfn, exec, write,
> > is_private, and slot.
> 
> Right, but now I need to remember that some of the hardware syndrome
> (exec, write) is handled in the arch-neutral code and the rest belongs
> to the arch.

Yeah, can't argue there.

> > The approach is non-standard, but I think my justification/reasoning for having
> > the structure be arch-defined still holds:
> > 
> >  : Rather than define a common kvm_page_fault and kvm_arch_page_fault child,
> >  : simply assert that the handful of required fields are provided by the
> >  : arch-defined structure.  Unlike vCPU and VMs, the number of common fields
> >  : is expected to be small, and letting arch code fully define the structure
> >  : allows for maximum flexibility with respect to const, layout, etc.
> > 
> > If we could use anonymous struct field, i.e. could embed a kvm_arch_page_fault
> > without having to bounce through an "arch" field, I would vote for the approach.
> > Sadly, AFAIK, we can't yet use those in the kernel.
> 
> The general impression is that this is an unnecessary amount of complexity
> for doing something trivial (computing flags).

It looks pretty though!

> > Nothing prevents arm64 (or any arch) from wrapping kvm_prepare_memory_fault_exit()
> > and/or taking action after it's invoked.  That's not an accident; the "prepare
> > exit" helpers (x86 has a few more) were specifically designed to not be used as
> > the "return" to userspace.  E.g. this one returns "void" instead of -EFAULT
> > specifically so that the callers isn't "required" to ignore the return if the
> > caller wants to populate (or change, but hopefully that's never the case) fields
> > after calling kvm_prepare_memory_fault_exit), and so that arch can return an
> > entirely different error code, e.g. -EHWPOISON when appropriate.
> 
> IMO, this does not achieve the desired layering / ownership of memory
> fault triage. This would be better organized as the arch code computing
> all of the flags relating to the hardware syndrome (even boring ones
> like RWX) 

Just to make sure I'm not misinterpreting things, by "computing all of the flags",
you mean computing KVM_MEMORY_EXIT_FLAG_xxx flags that are derived from hardware
state, correct?

> and arch-neutral code potentially lending a hand with the software bits.
>
> With this I either need to genericize the horrors of the Arm
> architecture in the common thing or keep track of what parts of the
> hardware flags are owned by arch v. non-arch. SW v. HW fault context is
> a cleaner split, IMO.

The problem I'm struggling with is where to draw the line.  If we leave hardware
state to arch code, then we're not left with much.  Hmm, but it really is just
the gfn/gpa that's needed in common code to avoid true ugliness.  The size is
technically arch specific, but the reported size is effectively a placeholder,
i.e. it's always PAGE_SIZE, and probably always will be PAGE_SIZE, but we wanted
to give ourselves an out if necessary.

Would you be ok having common code fill gpa and size?  If so, then we can do this:

--
void kvm_arch_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
					struct kvm_page_fault *fault);

static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
						 struct kvm_page_fault *fault)
{
	KVM_ASSERT_TYPE_IS(gfn_t, fault->gfn);

	vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
	vcpu->run->memory_fault.gpa = fault->gfn << PAGE_SHIFT;
	vcpu->run->memory_fault.size = PAGE_SIZE;

	vcpu->run->memory_fault.flags = 0;
	kvm_arch_prepare_memory_fault_exit(vcpu, fault);
}
--

where arm64's arch hook is empty, and x86's is:

--
static inline void kvm_arch_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
						      struct kvm_page_fault *fault)
{
	if (fault->is_private)
		vcpu->run->memory_fault.flags |= KVM_MEMORY_EXIT_FLAG_PRIVATE;
}
--

It's not perfect, but it should be much easier to describe the contract, and
common code can still pass around a kvm_page_fault structure instead of a horde
of booleans.

