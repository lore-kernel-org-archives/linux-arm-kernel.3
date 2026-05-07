Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A8E0CD3445
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 08:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oysCO2GNq+pfDUxK0gk5J79L5g3WyP7UgX/D+7UD3M0=; b=0lpBMbNatun3ek3PFtVagAF/xa
	SSanmo5oawo3x7YIfWo/GxlRfekN24LruNqm1PkrxH1y83EvC6y+/trBNwg11RB/aarty7483mlNg
	2+e9waeWUkXZHFjhYql9ZJKkRnCRAz80MrGmS+9mo1WaiOzwjWdl1GQMJVWKQH6Mmn64B9d44ungC
	NJe76MhuHd/ay1Qf5IsLc4p2Rwvmhzn79biH1/6OKymdg9iY0XAzfCB6bmykUQopaW7+xXFPwVEUr
	WULnYqDQc4TL94AfjJdzRErNvdd0m92olR88koO0jfKOU5mnIwZlHQDZZS0h7r8aVCuI1fS+rTy9q
	SPagqQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuMo-00000003Dnn-0z6k;
	Thu, 07 May 2026 08:45:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKuMl-00000003Dmu-2FGJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 08:45:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6C24422F8;
	Thu,  7 May 2026 01:45:48 -0700 (PDT)
Received: from raptor (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0DC2D3F836;
	Thu,  7 May 2026 01:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778143553; bh=OOppSG08L/KO4ewNhuiOGUn8DWyo80ypF6cLMLTTsYE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ufrmHspjVCl4Wzf0NQBsG9zpogPjmvRIN1w+ESiaSlDExzghg2rqd8dhdsCqAR69g
	 8hZG8qjjFi6QLj+2oPUa2khfsO2MREpvN3a0jiv3RWVVv/UzdDsvHNrl+0TdcjdGQg
	 wyLfzq6PWCP3Ivvzk4azYH5V3T7Jw1ERbkYc1EVw=
Date: Thu, 7 May 2026 09:45:46 +0100
From: Alexandru Elisei <alexandru.elisei@arm.com>
To: Sean Christopherson <seanjc@google.com>
Cc: maz@kernel.org, oupton@kernel.org, joey.gouly@arm.com,
	suzuki.poulose@arm.com, yuzenghui@huawei.com,
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	tabba@google.com, David.Hildenbrand@arm.com
Subject: Re: [RFC PATCH] KVM: arm64: Align KVM_EXIT_MEMORY_FAULT error codes
 with documentation
Message-ID: <afxROjBUVzeQQNfg@raptor>
References: <20260506105053.107404-1-alexandru.elisei@arm.com>
 <afs3wp7xBUf2jYK4@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <afs3wp7xBUf2jYK4@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_014555_712147_8D86149B 
X-CRM114-Status: GOOD (  28.47  )
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

(Resending this because I managed to mess up the headers, sorry for the
duplicate).

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

