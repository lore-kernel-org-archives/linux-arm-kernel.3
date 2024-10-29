Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FA75D3A67B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 18:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kl26WOdC+mDmLtRCsY1mpQj2hreo1lP49DeEz272vS0=; b=yWRmXFejXvDmubfKd9Ny7dThb6
	CpMaMNBaBT7Z/fLrsbPnVlzxj1y3gvzpPXGgE4MoWRSM/tW13eIuS1XPj4dk7ZMyrXiZOEwnymfgO
	Xf1cOrZHODafL/xz5qtetQAcOveRy9TeYDhXNp2pS44HU6eMAdkICjUrywcEI9wBVgZnCgM4N4yGR
	nPczMkw/PKKXLVNr0UCwQ2LMmOEse+N41Qn+8JcLAY7MT71AonXmTg+e6AaqTSgyhVLT5tm2aAxL3
	EvG8RF9ReUpnLo1qz0DY0Yg01pPud17z8lFK8xAtL8vlPIUxR2rj7wc9wBRyb/VvXQxSNpsNLKfYx
	nDa6X3iA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5rDr-0000000FWmv-3q46;
	Tue, 29 Oct 2024 18:45:43 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5ozX-0000000F6Zb-46A7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 16:22:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4740FA42FAA;
	Tue, 29 Oct 2024 16:20:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82843C4CECD;
	Tue, 29 Oct 2024 16:22:44 +0000 (UTC)
Date: Tue, 29 Oct 2024 16:22:42 +0000
From: Catalin Marinas <catalin.marinas@arm.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: Vlastimil Babka <vbabka@suse.cz>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Mark Brown <broonie@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, Peter Xu <peterx@redhat.com>,
	linux-arm-kernel@lists.infradead.org, Will Deacon <will@kernel.org>,
	Aishwarya TCV <Aishwarya.TCV@arm.com>
Subject: Re: [PATCH hotfix 6.12 v2 4/8] mm: resolve faulty mmap_region()
 error path behaviour
Message-ID: <ZyEL0s_qiyAYURR2@arm.com>
References: <57mgmdx7wgfwci3yo3ggkmcnm3ujamgkwcccm77ypvmer5tegn@opiq3ceh2uvy>
 <ykzmur56ms7fm4midi6tbncjvcvf7ue4lp7e4orblrmwnefw3e@oa3enlpdrcrr>
 <bea02efe-a695-49e0-b15c-2270a82cadbf@lucifer.local>
 <CAHk-=whpXVBNvd0NJpw9=FGcuTuThwtfcKeM3Ug=Uk6kpChCPA@mail.gmail.com>
 <0b64edb9-491e-4dcd-8dc1-d3c8a336a49b@suse.cz>
 <CAHk-=wgE8410gu3EabjNEHhOYh1dyYwt23J62S4a9SYcwZUFhw@mail.gmail.com>
 <1608957a-d138-4401-98ef-7fbe5fb7c387@suse.cz>
 <cf1deb9b-c5c4-4e85-891d-62ecf9a04e0f@lucifer.local>
 <ZyD5iXikMzotl9mU@arm.com>
 <da15a72b-c1de-427b-a764-0ebbdd3f6a8e@lucifer.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da15a72b-c1de-427b-a764-0ebbdd3f6a8e@lucifer.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_092248_170997_8FE99000 
X-CRM114-Status: GOOD (  33.32  )
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

On Tue, Oct 29, 2024 at 03:16:00PM +0000, Lorenzo Stoakes wrote:
> On Tue, Oct 29, 2024 at 03:04:41PM +0000, Catalin Marinas wrote:
> > On Mon, Oct 28, 2024 at 10:14:50PM +0000, Lorenzo Stoakes wrote:
> > > So continue to check VM_MTE_ALLOWED which arch_calc_vm_flag_bits() sets if
> > > MAP_ANON.
> > [...]
> > > diff --git a/mm/shmem.c b/mm/shmem.c
> > > index 4ba1d00fabda..e87f5d6799a7 100644
> > > --- a/mm/shmem.c
> > > +++ b/mm/shmem.c
> > > @@ -2733,9 +2733,6 @@ static int shmem_mmap(struct file *file, struct vm_area_struct *vma)
> > >  	if (ret)
> > >  		return ret;
> > >
> > > -	/* arm64 - allow memory tagging on RAM-based files */
> > > -	vm_flags_set(vma, VM_MTE_ALLOWED);
> >
> > This breaks arm64 KVM if the VMM uses shared mappings for the memory
> > slots (which is possible). We have kvm_vma_mte_allowed() that checks for
> > the VM_MTE_ALLOWED flag as the VMM may not use PROT_MTE/VM_MTE directly.
> 
> Ugh yup missed that thanks.
> 
> > I need to read this thread properly but why not pass the file argument
> > to arch_calc_vm_flag_bits() and set VM_MTE_ALLOWED in there?
> 
> Can't really do that as it is entangled in a bunch of other stuff,
> e.g. calc_vm_prot_bits() would have to pass file and that's used in a bunch
> of places including arch code and... etc. etc.

Not calc_vm_prot_bits() but calc_vm_flag_bits().
arch_calc_vm_flag_bits() is only implemented by two architectures -
arm64 and parisc and calc_vm_flag_bits() is only called from do_mmap().

Basically we want to set VM_MTE_ALLOWED early during the mmap() call
and, at the time, my thinking was to do it in calc_vm_flag_bits(). The
calc_vm_prot_bits() OTOH is also called on the mprotect() path and is
responsible for translating PROT_MTE into a VM_MTE flag without any
checks. arch_validate_flags() would check if VM_MTE comes together with
VM_MTE_ALLOWED. But, as in the KVM case, that's not the only function
checking VM_MTE_ALLOWED.

Since calc_vm_flag_bits() did not take a file argument, the lazy
approach was to add the flag explicitly for shmem (and hugetlbfs in
-next). But I think it would be easier to just add the file argument to
calc_vm_flag_bits() and do the check in the arch code to return
VM_MTE_ALLOWED. AFAICT, this is called before mmap_region() and
arch_validate_flags() (unless I missed something in the recent
reworking).

> I suggest instead we instead don't drop the yucky shmem thing, which will
> set VM_MTE_ALLOWED for shmem, with arch_calc_vm_flag_bits() still setting
> it for MAP_ANON, but the other changes will mean the arch_validate_flags()
> will be fixed too.
> 
> So this just means not dropping the mm/shmem.c bit basically and everything
> should 'just work'?

If we can't get the calc_vm_flag_bits() approach to work, I'm fine with
this as a fix and we'll look to do it properly from 6.13.

-- 
Catalin

