Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F6AC5AE5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 19:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEPUmFNyxjYgPVpGVaY8hKrJJoLvXh6/9HF7frzRDIo=; b=Uv1guy5Dtq9g73s5pQ1ZplOKME
	m51Jb9DcV35ToyU2aOQT7rAZgBK3deDVO/jL6hen1Z6/aihv1wFAZN1yR3AxjYE8hrg0WjCaEM2df
	V4skfa6avJwvhsC6hRrWm70IkYXpAQGXQfsFjWX2r2KK0MOAnID1OjWP4VUtHgV6lCyGvYfAuwQSI
	MqljYb6o2MYtBoUKSVqpKPJxfOdUQ4HQ8xcZ25DFJyySNbGbhDxtjlwd7hg575Cu6Hj+f2XZJD8sH
	ao6qavDBni3H9wQPbYFnIP6IJrvfS14NzQENZ8mf2SibKRqdQaUY7ehsdKRNe7xep5ohlyVv2xV2T
	q32ao1Jg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWYg-0000000FXRo-1C7k;
	Fri, 20 Feb 2026 19:53:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtWYd-0000000FXRP-39dh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 19:53:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5021339;
	Fri, 20 Feb 2026 11:52:50 -0800 (PST)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 461E63F7D8;
	Fri, 20 Feb 2026 11:52:56 -0800 (PST)
Date: Fri, 20 Feb 2026 19:52:53 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	Emanuele Rocca <emanuele.rocca@arm.com>,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH 2/3] arm64: gcs: Allow PAGE_NONE mappings for NUMA
 balancing
Message-ID: <aZi7lYLdOtGdzxC9@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-3-catalin.marinas@arm.com>
 <650c2324-8caa-49c5-940f-982e8c8b9965@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <650c2324-8caa-49c5-940f-982e8c8b9965@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_115259_831476_9C7CCBF6 
X-CRM114-Status: GOOD (  23.84  )
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

On Fri, Feb 20, 2026 at 05:16:52PM +0100, David Hildenbrand wrote:
> On 2/20/26 15:05, Catalin Marinas wrote:
> > diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> > index 2e404441063b..f8993e3fa5d1 100644
> > --- a/arch/arm64/mm/mmap.c
> > +++ b/arch/arm64/mm/mmap.c
> > @@ -87,7 +87,15 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
> >   	/* Short circuit GCS to avoid bloating the table. */
> >   	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> > -		prot = pgprot_val(PAGE_GCS_RO);
> > +		/*
> > +		 * Allow PAGE_NONE for NUMA balancing, otherwise use
> > +		 * PAGE_GCS_RO. The permission will be made writeable
> > +		 * (PAGE_GCS) on a GCS fault.
> > +		 */
> > +		if (vm_flags & (VM_READ | VM_WRITE))
> 
> Could consider using VM_ACCESS_FLAGS here. For Shadow stacks we'd never
> expect executable properties.

Yes, this is better.

> > +			prot = pgprot_val(PAGE_GCS_RO);
> > +		else
> > +			prot = pgprot_val(protection_map[VM_NONE]);
> 
> change_protection() documents that "This is assuming that NUMA faults are
> handled using PROT_NONE. If an architecture makes a different choice, it
> will need further changes to the core."
> 
> So task_numa_work()->change_prot_numa()->change_protection() passes "newprot
> = PAGE_NONE".
> 
> Where is the vm_get_page_prot() called on that path where your change would
> make a difference?
> 
> I'd thing that vm_get_page_prot() gets only invoked through a "proper"
> mpotect() in mprotect_fixup()->vma_set_page_prot()...->vm_get_page_prot(),
> not for NUMA hinting that leaves the VMA untouched.
> 
> OTOH, I wonder whether mprotect(PROT_NONE) could trigger the path you
> thought of above.

I started with the mprotect(PROT_NONE) in mind but thought the NUMA case
is a better argument. You are right, it doesn't use the same path.

I need to check what we do with mprotect(PROT_NONE). If it's not
rejected somewhere on the path to change_protect(), we end up with an
accessible GCS mapping. Maybe it doesn't matter much but I'd rather have
the access disabled. Anyway, I'll write some test next week to see what
it does. The above comment will need to be changed.

Thanks for the review.

-- 
Catalin

