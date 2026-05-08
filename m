Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA79ACD3436
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 May 2026 08:55:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G1ZoPpqH4O3KtG4oNgVODmWXrZDixQpADtvbHjNCFE4=; b=fRpWKj1t74m1YpkRsb+JTqmxxv
	h5v+S2hz+Zb4pL07Azd0hE45tEc9wewMJU+anfMfCqMyVV2DxQdnEVi3xhON9nnZTwmz9VAE/t1Ac
	HgCcjb9e+GICnvp9G2sk/OZ6iq1Ye1hINK4MWwh+Jlm8nJW9sYzxF4Xyg0Q8iCw9QV7ybLJ/cfI+D
	mLe3NxabEiNE5JO2xO+pG+0fA048zdAzCqAbMUxe7UEEdFSo7enNo24VnjAApXBEXIDf05JWW952b
	78DdlYUnC2VqE0tuYVfTBtoGzNQBsRIqsLEujjAxGObXdjfhOl/4v8c7zqdIy/sakJcfAEF95gfhh
	mMgoJaVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGzf-0000000638U-3wYh;
	Fri, 08 May 2026 08:55:35 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGzd-0000000637l-2Pbk
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 08 May 2026 08:55:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=G1ZoPpqH4O3KtG4oNgVODmWXrZDixQpADtvbHjNCFE4=; b=WTLwCUlGY8RoOiYxC/uaHixvLS
	zG4MfdOFNezenDhUsNcktSOykRiTMJJWvPtjljbsANCC5gVGYuttgw8vFq9QjzRhxlVPOebzKKBAU
	HlI6RngkAghPaxlRsYVCTBQkL1gh0B/tEL0CSLHHtvVnemZ5u771MoCGeOai3fFtKt9XpRPg39SAk
	1xuD3xYLvzi311zkCQBsqpTyBIClgmeVqrIIi/OwqKBP2z54t6ETYtzh5qvGKycs4aVeFpM8Rp0+d
	wBMt9eFmSjXVosCM44+IJYNcPEZumpd5jvLRYpYNGxM6aPdTYB5D0FkagWnX4hFQzzaGIHejW73UP
	8zWdsmtQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLGzV-00000005lPI-3i5Q
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 May 2026 08:55:28 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4EEB61A25;
	Fri,  8 May 2026 01:55:17 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E44CE3F763;
	Fri,  8 May 2026 01:55:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778230522; bh=b8BIYY7ac8Ae7tR8uNbsryLwF7VRUu7eVOGgpilWx2g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j5hwWCv68XJr5xZgsYeNGpRFPW839kSjXhzDNAoCEmAx+LslHM1TCvxwKR9FgL7HX
	 7qlgpTc9tPnjmsKMWmKu7j6SUl/w53aFlvRf03QVvR1NXbQMD6wVAoJ1vd1k1XvnFi
	 iGWzMOiWvWJwtpmADEPZiCUa60GUMI70WdItKzFU=
Date: Fri, 8 May 2026 09:55:17 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	tabba@google.com, David.Hildenbrand@arm.com
Subject: Re: [RFC PATCH] KVM: arm64: Align KVM_EXIT_MEMORY_FAULT error codes
 with documentation
Message-ID: <af2k9btE5hS6lWHR@raptor>
References: <20260506105053.107404-1-alexandru.elisei@arm.com>
 <afs3wp7xBUf2jYK4@google.com>
 <afxROjBUVzeQQNfg@raptor>
 <afyUkaQ1wtivyH8W@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afyUkaQ1wtivyH8W@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_095526_676284_86BE8677 
X-CRM114-Status: GOOD (  42.68  )
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

Hi Sean,

On Thu, May 07, 2026 at 06:33:05AM -0700, Sean Christopherson wrote:
> On Thu, May 07, 2026, Alexandru Elisei wrote:
> > Hi Sean,
> > 
> > (Resending this because I managed to mess up the headers, sorry for the
> > duplicate).
> > 
> > Thanks for the explanations!
> > 
> > On Wed, May 06, 2026 at 05:44:50AM -0700, Sean Christopherson wrote:
> > > On Wed, May 06, 2026, Alexandru Elisei wrote:
> > > > The documentation for KVM_EXIT_MEMORY_FAULT states:
> > > > 
> > > > 'Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that
> > > > it accompanies a return code of '-1', not '0'!  errno will always be set to
> > > > EFAULT or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace
> > > > should assume kvm_run.exit_reason is stale/undefined for all other error
> > > > numbers'.
> > > > 
> > > > where a return code of '-1' is special because according to man 2 ioctl:
> > > > 
> > > > 'On error, -1 is returned, and errno is set to indicate the error'.
> > > > 
> > > > Putting the two together means that the ioctl KVM_RUN must 1) complete with
> > > > an error and 2) that error must must be either EFAULT or EHWPOISON for
> > > > userspace to detect a KVM_EXIT_MEMORY_FAULT VCPU exit.
> > > 
> > > Yes and no.  The key escape valve we (very deliberately) gave ourselves is this:
> > > 
> > >   userspace should assume kvm_run.exit_reason is stale/undefined for all other
> > >   error numbers.
> > > 
> > > As arm64 already does, that clause allows KVM to "speculatively" set exit_reason
> > > to KVM_EXIT_MEMORY_FAULT.  Which is by design.  The userspace flow is intended
> > > to be "if KVM_RUN returns EFAULT or EHWPOISON, then check for KVM_EXIT_MEMORY_FAULT
> > > to see if KVM provided more information about why the EFAULT/EHWPOISON error was
> > > returned".
> > 
> > Hm... In general, "speculatively" populating exit_reason with
> > KVM_EXIT_MEMORY_FAULT when userspace is not intended to use that information
> > looks a bit dubious to me.
> 
> Oh, for sure, it's not exactly ideal.
> 
> > Why do the work if userspace is not supposed to use the information?
> 
> Because not filling kvm_run when KVM is supposed to (per KVM's contract with
> userspace) would be a bug, whereas unnecessarily filling kvm_run is "just" wasted
> cycles (and not very many of them).  x86 also has multiple flows where it fills
> kvm_run "speculatively", e.g. in low(ish) level helpers where it's not known if
> KVM will actually exit to userspace.

For arm64, it's not that hard to figure out that 0 from the fault handlers means
a return to guest:

fault handler returns 0 => kvm_handle_guest_abort() massages the 0 into 1 =>
kvm_vcpu_arch_ioctl() resumes loop.

Consequently anything other than 0 from the fault handlers means an exit to
userspace.

Not sure if that proves or disproves my point though :(

> 
> Overall, for code like this, IMO it's also yields less complex KVM code, though
> I suppose it can also end up being more confusing for readers.
> 
> > Regarding gmem_abort(). As I see it, if today someone writes userspace that
> > relies on any of the undocumented error codes propagated from kvm_gmem_get_pfn()
> > to handle KVM_EXIT_MEMORY_FAULT, that means that KVM can never use those error
> > codes for any other exit_reason in the future, because that userspace will
> > break.
> 
> Hmm, if we wanted to defend against that, we could scribble kvm_run.exit_reason
> on the way out of KVM_RUN, e.g.
> 
> diff --git virt/kvm/kvm_main.c virt/kvm/kvm_main.c
> index 89489996fbc1..76801d103dd9 100644
> --- virt/kvm/kvm_main.c
> +++ virt/kvm/kvm_main.c
> @@ -4475,6 +4475,10 @@ static long kvm_vcpu_ioctl(struct file *filp,
>                  */
>                 rseq_virt_userspace_exit();
>  
> +               if (vcpu->run->exit_reason == KVM_EXIT_MEMORY_FAULT &&
> +                   r && r != -EFAULT && r != EHWPOISON)
                                               ^^^^^^^^^^
					       -EHWPOISON

> +                       vcpu->run->exit_reason = KVM_EXIT_UNKNOWN;
> +
>                 trace_kvm_userspace_exit(vcpu->run->exit_reason, r);
>                 break;
>         }

I was thinking something like this, to avoid populating KVM_EXIT_MEMORY_FAULT
information and then overwriting it later (I assume all architectures go
through the helper and don't open code it, haven't checked):

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4c14aee1fb06..6e1eeb511967 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -2505,11 +2505,14 @@ static inline void kvm_account_pgtable_pages(void *virt, int nr)
 /* Max number of entries allowed for each kvm dirty ring */
 #define  KVM_DIRTY_RING_MAX_ENTRIES  65536

-static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu,
+static inline void kvm_prepare_memory_fault_exit(struct kvm_vcpu *vcpu, int error,
                                                 gpa_t gpa, gpa_t size,
                                                 bool is_write, bool is_exec,
                                                 bool is_private)
 {
+       if (error != -EFAULT && error != -EHWPOISON)
+               return;
+
        vcpu->run->exit_reason = KVM_EXIT_MEMORY_FAULT;
        vcpu->run->memory_fault.gpa = gpa;
        vcpu->run->memory_fault.size = size;

arm64 sets exit_reason = KVM_EXIT_UNKNOWN before the run loop. After a
cursory look, I *think* x86 does the same, so the result would be similar
to what you propose, at least for these two architectures. We could also
set exit_reason to unknown if !-EFAULT && !-EHWPOISON to be sure.

Avoids leaking what memory the guest accesses, for the extra, extra
paranoid.

It would also make at least one person (me) less confused about why
KVM_EXIT_MEMORY_FAULT is populated when userspace is not supposed to
consume it :)

On the other hand, all call sites would need to be modified.

> 
> I don't know that I'm convinced that level of paranoia is worth it though.

It's up to you, I don't feel strongly about it. If you do decide to go
ahead with it, whatever approach you choose, I can prepare the patch.

> 
> > I'm sure this was all carefully considered when designing the interface, I was
> > just curious how this particular problem has been solved.
> 
> Heh, I like to think we carefully considered the interface, but thinking of every
> possible way userspace can be silly is hard :-)

Agreed. That's why I think exposing strictly the minimum necessary
information to userspace is a good defence :)

Thanks,
Alex

