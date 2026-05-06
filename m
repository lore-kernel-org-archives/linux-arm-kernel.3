Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CC64CD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 13:39:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:From:Date:Reply-To:To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9z6XJfx0McRXgfG+ESzo7dm092rIL3bS6DYQK7Vt2zk=; b=OMWWxOQNvzvnn8m4hfWsST/aCI
	Jg1hqGuXAHBofoaci9llBdkI5IRg0dJ/8bZqWBfrHsm04VWbAiLCmATiWVS0V13fgr1mu7bSENCR8
	TzVkjOxzuZO9L+IJG/oZnhhPWFWTvGXEk1048VPkl9rSctvuFc+j8wWxlGwnjvZ53lhzxu8sGHcLa
	hhGtmE5Lu6vfkP/Oztm7EFNkMUPrxFgeD746xLySAF11BkhB4KhVB7ppkIgYxT3LTQSvlJhtkKQ+1
	BgQ/aNezOFKoonrs3JQ7UGjyVn1D27ks0WsSqAXLRJXNCrUT9EJPM0oQCBNPw6H3dkoPrDMXC6d09
	gB/So8MQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcTR-00000000vR6-2fef;
	Wed, 06 May 2026 13:39:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKcTQ-00000000vQk-25B9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 13:39:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEBD019F6;
	Wed,  6 May 2026 06:39:29 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 75C623F7B4;
	Wed,  6 May 2026 06:39:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778074775; bh=X1DW65cFOZTQJq07rALhs9VeCiIyBm5QnFundIjdxyg=;
	h=Date:From:Cc:Subject:References:In-Reply-To:From;
	b=OOT99HGUwDRz/VqppQ7JwvNwRaZNNUy3nvIXGebB256s5BGRBQM67qOKrq48J4Ck0
	 zzeINSuZTgVG14wmLA9UsA4XCmQSjQkQESkhVFT0qZhxPoAcdco4sCn3gVpYeBMffU
	 PkeuUxSQhAzQ5OFHhtZrSpiamYRsCJInGszFJSvc=
Date: Wed, 6 May 2026 14:39:30 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>, To: Sean Christopherson <seanjc@google.com>;
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	tabba@google.com, David.Hildenbrand@arm.com
Subject: Re: [RFC PATCH] KVM: arm64: Align KVM_EXIT_MEMORY_FAULT error codes
 with documentation
Message-ID: <aftEkgnDdL2AY_6H@raptor>
References: <20260506105053.107404-1-alexandru.elisei@arm.com>
 <afs3wp7xBUf2jYK4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afs3wp7xBUf2jYK4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260506_063936_617632_D500AC43 
X-CRM114-Status: GOOD (  28.36  )
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

Thanks for the explanations!

On Wed, May 06, 2026 at 05:44:50AM -0700, Sean Christopherson wrote:
> On Wed, May 06, 2026, Alexandru Elisei wrote:
> > The documentation for KVM_EXIT_MEMORY_FAULT states:
> > 
> > 'Note!  KVM_EXIT_MEMORY_FAULT is unique among all KVM exit reasons in that
> > it accompanies a return code of '-1', not '0'!  errno will always be set to
> > EFAULT or EHWPOISON when KVM exits with KVM_EXIT_MEMORY_FAULT, userspace
> > should assume kvm_run.exit_reason is stale/undefined for all other error
> > numbers'.
> > 
> > where a return code of '-1' is special because according to man 2 ioctl:
> > 
> > 'On error, -1 is returned, and errno is set to indicate the error'.
> > 
> > Putting the two together means that the ioctl KVM_RUN must 1) complete with
> > an error and 2) that error must must be either EFAULT or EHWPOISON for
> > userspace to detect a KVM_EXIT_MEMORY_FAULT VCPU exit.
> 
> Yes and no.  The key escape valve we (very deliberately) gave ourselves is this:
> 
>   userspace should assume kvm_run.exit_reason is stale/undefined for all other
>   error numbers.
> 
> As arm64 already does, that clause allows KVM to "speculatively" set exit_reason
> to KVM_EXIT_MEMORY_FAULT.  Which is by design.  The userspace flow is intended
> to be "if KVM_RUN returns EFAULT or EHWPOISON, then check for KVM_EXIT_MEMORY_FAULT
> to see if KVM provided more information about why the EFAULT/EHWPOISON error was
> returned".

Hm... In general, "speculatively" populating exit_reason with
KVM_EXIT_MEMORY_FAULT when userspace is not intended to use that information
looks a bit dubious to me. Why do the work if userspace is not supposed to use
the information?

Regarding gmem_abort(). As I see it, if today someone writes userspace that
relies on any of the undocumented error codes propagated from kvm_gmem_get_pfn()
to handle KVM_EXIT_MEMORY_FAULT, that means that KVM can never use those error
codes for any other exit_reason in the future, because that userspace will
break.

I'm sure this was all carefully considered when designing the interface, I was
just curious how this particular problem has been solved.

> 
> > On a kvm_gmem_get_pfn() error, gmem_abort() prepares the
> > KVM_EXIT_MEMORY_FAULT exit_reason and propagates the error back to
> > userspace. kvm_gmem_get_pfn() does not massage the error code, and if the
> > error is not -EFAULT or -EHWPOISON, userspace implementing the ABI fails to
> > detect the memory fault exit.
> > 
> > Things get more complicated with kvm_handle_vncr_abort().
> > kvm_translate_vncr(), similar to gmem_abort(), prepares the VCPU to exit
> > with KVM_EXIT_MEMORY_FAULT and propagates the error code from
> > kvm_gmem_get_pfn(). Then kvm_handle_vncr_abort() does a number of things
> > based on this specific error code:
> > 
> > - If it's -EAGAIN, KVM resumes the guest. Note that KVM, when handling a
> >   *host* fault on a guest_memfd backed VMA, retries the fault handling if
> >   kvm_gmem_get_pfn() returns -EAGAIN.
> 
> Totally fine.
> 
> > - If it's -ENOMEM, -EFAULT, -EIO or -EHWPOISON, it returns to userspace
> >   with 0 (success), meaning that, according to the documentation, userspace
> >   will not detect the memory fault exit.
> 
> Also totally fine, and working as intended.  KVM_EXIT_MEMORY_FAULT is provided
> for scenarios where (a) the issue is likely related to the GPA and (b) userspace
> can remedy the underlying issue using the information provided in kvm_run.memory_fault.

If KVM_RUN always returns 0 when exit_reason = KVM_EXIT_MEMORY_FAULT, which is what
kvm_handle_vncr_abort() does, how will userspace ever be able to handle the
fault?

Thanks,
Alex

