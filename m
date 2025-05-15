Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68C8FC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 13:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DmgkS8N8rQzLFF3Qk+NBeZfgMPXV3DlidkbB4nNL2g8=; b=y/qn/fh0+geMIwcw+xNx7CjKoR
	qAxyQxQiUC98Xr3R0e6j6uEltItuyWWXCCgafYZ1wMJHjXPoaQ45ibkoQxIqJHCIVrExi2Qk2pkQg
	hBU8B4wdZsR3U/wTXl9k9uZTQwT/9SXu1qChxZCNm6Kklvo+XoJsmffpYPK24chG/4HQTBySw6VKW
	DOj04x+F+6vGsHuWkrMMDwnYcefXxtGrcvx8RKLfToeQf8T18KSLipJGXk2+WO3ZFsgiDTT0H4EEn
	v0uWXZfEOjaMtnQ8mbROd30E7wte0DXkDJSZS+L402jeEvRLJDKhZ3fXrCJgi51De1EazEjj9tf2x
	Z+YrhQ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYfT-00000000jeO-10oQ;
	Thu, 15 May 2025 13:30:35 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFYWJ-00000000iA9-1u4z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 13:21:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B9902A4C97C;
	Thu, 15 May 2025 13:21:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9334CC4CEEF;
	Thu, 15 May 2025 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315266;
	bh=JPkYbeCC/0+2C7oAcLkVgxvwJCw1QU+wPgbrczN6A7U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ULXEX8KvfmKzhiJTB9Hd7eAwANfC1BZlgWUM6t1hJ0bRn630MAm6VurvIy9r8jpMv
	 P8420bwYR5nxut2GfVXVQDFMKw37eb5L9zAC+Lvc2MjADIccHILfOZidJCg4zVrg9d
	 ztlRyJp81Y8h9GJBQ8F7MtMW/l5FFlq2R6LHEytAK8hJO4D52qmjNYozDkFgO5xZTU
	 7XpeOkZCSYTjUvUkUIch2iogvEw/HV/kp2nPW8sWvO38mtWsKti/L661hX7Bdi/18x
	 p0vUB79T0gzxVtl8orIGPgtsS0rbb95U71ta/kVU9w0UWbwMMSBU2H25ROQ1jxHDHR
	 GX1Ig7sE95TZw==
Date: Thu, 15 May 2025 14:21:01 +0100
From: Will Deacon <will@kernel.org>
To: David Hildenbrand <david@redhat.com>
Cc: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com,
	ryan.roberts@arm.com, anshuman.khandual@arm.com,
	mark.rutland@arm.com, yang@os.amperecomputing.com,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] arm64: Check pxd_leaf() instead of !pxd_table() while
 tearing down page tables
Message-ID: <20250515132059.GA12038@willie-the-truck>
References: <20250515063450.86629-1-dev.jain@arm.com>
 <332ecda7-14c4-4dc3-aeff-26801b74ca04@redhat.com>
 <4904d02f-6595-4230-a321-23327596e085@arm.com>
 <6fe7848c-485e-4639-b65c-200ed6abe119@redhat.com>
 <35ef7691-7eac-4efa-838d-c504c88c042b@arm.com>
 <c06930f0-f98c-4089-aa33-6789b95fd08f@redhat.com>
 <91fc96c3-4931-4f07-a0a9-507ac7b5ae6d@arm.com>
 <a005b0c3-861f-4e73-a747-91e0a15c85de@redhat.com>
 <20250515125606.GA11878@willie-the-truck>
 <23042cdf-e0fc-4b3a-92f6-688689728cc7@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <23042cdf-e0fc-4b3a-92f6-688689728cc7@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_062107_628029_6DEC9BD6 
X-CRM114-Status: GOOD (  40.52  )
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

On Thu, May 15, 2025 at 03:04:50PM +0200, David Hildenbrand wrote:
> On 15.05.25 14:56, Will Deacon wrote:
> > On Thu, May 15, 2025 at 11:32:22AM +0200, David Hildenbrand wrote:
> > > On 15.05.25 11:27, Dev Jain wrote:
> > > > 
> > > > 
> > > > On 15/05/25 2:23 pm, David Hildenbrand wrote:
> > > > > On 15.05.25 10:47, Dev Jain wrote:
> > > > > > 
> > > > > > 
> > > > > > On 15/05/25 2:06 pm, David Hildenbrand wrote:
> > > > > > > On 15.05.25 10:22, Dev Jain wrote:
> > > > > > > > 
> > > > > > > > 
> > > > > > > > On 15/05/25 1:43 pm, David Hildenbrand wrote:
> > > > > > > > > On 15.05.25 08:34, Dev Jain wrote:
> > > > > > > > > > Commit 9c006972c3fe removes the pxd_present() checks because the
> > > > > > > > > > caller
> > > > > > > > > > checks pxd_present(). But, in case of vmap_try_huge_pud(), the caller
> > > > > > > > > > only
> > > > > > > > > > checks pud_present(); pud_free_pmd_page() recurses on each pmd
> > > > > > > > > > through
> > > > > > > > > > pmd_free_pte_page(), wherein the pmd may be none.
> > > > > > > > > The commit states: "The core code already has a check for pXd_none()",
> > > > > > > > > so I assume that assumption was not true in all cases?
> > > > > > > > > 
> > > > > > > > > Should that one problematic caller then check for pmd_none() instead?
> > > > > > > > 
> > > > > > > >      From what I could gather of Will's commit message, my
> > > > > > > > interpretation is
> > > > > > > > that the concerned callers are vmap_try_huge_pud and vmap_try_huge_pmd.
> > > > > > > > These individually check for pxd_present():
> > > > > > > > 
> > > > > > > > if (pmd_present(*pmd) && !pmd_free_pte_page(pmd, addr))
> > > > > > > >        return 0;
> > > > > > > > 
> > > > > > > > The problem is that vmap_try_huge_pud will also iterate on pte entries.
> > > > > > > > So if the pud is present, then pud_free_pmd_page -> pmd_free_pte_page
> > > > > > > > may encounter a none pmd and trigger a WARN.
> > > > > > > 
> > > > > > > Yeah, pud_free_pmd_page()->pmd_free_pte_page() looks shaky.
> > > > > > > 
> > > > > > > I assume we should either have an explicit pmd_none() check in
> > > > > > > pud_free_pmd_page() before calling pmd_free_pte_page(), or one in
> > > > > > > pmd_free_pte_page().
> > > > > > > 
> > > > > > > With your patch, we'd be calling pte_free_kernel() on a NULL pointer,
> > > > > > > which sounds wrong -- unless I am missing something important.
> > > > > > 
> > > > > > Ah thanks, you seem to be right. We will be extracting table from a none
> > > > > > pmd. Perhaps we should still bail out for !pxd_present() but without the
> > > > > > warning, which the fix commit used to do.
> > > > > 
> > > > > Right. We just make sure that all callers of pmd_free_pte_page() already
> > > > > check for it.
> > > > > 
> > > > > I'd just do something like:
> > > > > 
> > > > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > > > index 8fcf59ba39db7..e98dd7af147d5 100644
> > > > > --- a/arch/arm64/mm/mmu.c
> > > > > +++ b/arch/arm64/mm/mmu.c
> > > > > @@ -1274,10 +1274,8 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long
> > > > > addr)
> > > > > 
> > > > >            pmd = READ_ONCE(*pmdp);
> > > > > 
> > > > > -       if (!pmd_table(pmd)) {
> > > > > -               VM_WARN_ON(1);
> > > > > -               return 1;
> > > > > -       }
> > > > > +       VM_WARN_ON(!pmd_present(pmd));
> > > > > +       VM_WARN_ON(!pmd_table(pmd));
> > > > 
> > > > And also return 1?
> > > 
> > > I'll leave that to Catalin + Will.
> > > 
> > > I'm not a friend for adding runtime-overhead for soemthing that should not
> > > happen and be caught early during testing -> VM_WARN_ON_ONCE().
> > 
> > I definitely think we should return early if the pmd isn't a table.
> > Otherwise, we could end up descending into God-knows-what!
> 
> The question is: how did something that is not a table end up here, and why
> is it valid to check exactly that at runtime. Not strong opinion, it just
> feels a bit arbitrary to test for exactly that at runtime if it is
> completely unexpected.

I see it a little bit like type-checking: we could see an invalid entry,
a leaf entry or a table entry and we should only ever dereference the
latter. If the VM_WARN_ON() is justified, then I find it jarring to go
ahead with the dereference regardless of the type.

That said, maybe the VM_WARN_ON() should either be deleted or moved out
to the callers in mm/vmalloc.c?

Will

