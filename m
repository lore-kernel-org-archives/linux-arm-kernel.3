Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68402C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 11:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r532mY6PAx7peN+fIHLSHRYPlvwN6xaHwVRoi5GJnBk=; b=XOmNj+9eELt/qhWZNWQTGVmpYD
	3ITZyfmRO7VH1EcQpJlIummTZB28X3ex641LkjxCa6A93e9OL5TBXZ8nMUb+c5kA80/YW3V4Ak2P2
	mAYklBOgCNRAzIivqlsa3+rc//91Jq7+L5kSL0g0uuVKZMEE3+Zd0UKD5+qeRXEoi3vVWWP+LIjjL
	YtfrUjDfypG4vusOAyY8LqYmFjCHNRa0pWB+lLnV8xpC4//mlo/E4eL5LUDGtIeybVImG7E+aEQ0z
	7QdYnx82E7vWbbciuPkpowOa7G8khTGQ2I2B3x2xsFvCXMI/CubrA32rShdTbdBpiMOeWuiJMpwuz
	N0wQxfgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9uL-0000000EOVx-1Gu9;
	Mon, 29 Jun 2026 11:12:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we9uJ-0000000EOVk-3HtF
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 11:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ACE1942DBD;
	Mon, 29 Jun 2026 11:12:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A97B1F000E9;
	Mon, 29 Jun 2026 11:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782731526;
	bh=r532mY6PAx7peN+fIHLSHRYPlvwN6xaHwVRoi5GJnBk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Sp+T3kwLxt+2g4MyteUhPz88Hrg1k2cjDrLu7Ac//pKIDJ/va8AaPl5KfY7Mpy0g+
	 xnpD5HLqekzcFL1HTc3/BKPZaQkPZEI+YRG8cFVDgpP1/+6ahG67V65EsICetRX7Fp
	 R5/ehY3IuEhYWINWAUL9iAe1zAtEBNA2mfnb2fY5C/Yf4Nn6gSHohDGj08hnUz1Lpt
	 L7tddxxgaqNvcl/wBaOblTZA5UPxRM0/tSmrBTBldmxtaN7KGak9d7TxtK0p4Hkgyh
	 NUZjvdhQEEMqpb4Lvwpl1uK4ovUiEJ+HEJDMxxJazb7lR7akw73lT3ApyS5mbfzbU+
	 7K+notFsWzHig==
Date: Mon, 29 Jun 2026 12:12:01 +0100
From: Will Deacon <will@kernel.org>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>, linux-kernel@vger.kernel.org,
	Ben Hutchings <ben@decadent.org.uk>
Subject: Re: [PATCH] arm64/mm: Optimize TLB flush in
 unmap_hotplug_[pmd|pud]_range()
Message-ID: <akJTAWReRvKlqi_u@willie-the-truck>
References: <20260626012845.475959-1-anshuman.khandual@arm.com>
 <ced1c28d-b9e1-4307-8900-7139c610d176@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ced1c28d-b9e1-4307-8900-7139c610d176@kernel.org>
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

On Fri, Jun 26, 2026 at 06:09:27PM +0200, David Hildenbrand (Arm) wrote:
> On 6/26/26 03:28, Anshuman Khandual wrote:
> > flush_tlb_kernel_range() could flush down an entire block mapping just with
> > a single PAGE_SIZE stride. This capability was being used umapping PMD and
> > PUD based block mappings in unmap_hotplug_[pmd|pud]_range().
> > 
> > But later on the commit 48478b9f7913
> > ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()") replaced
> > this PAGE_SIZE stride with [PMD|PUD]_SIZE strides, hence forcing multiple
> > PAGE_SIZE stride based TLB flushes on platforms where TLB range operation
> > is not supported. Revert back to the earlier TLB behaviour along with the
> > required comments that were dropped earlier.
> > 
> 
> Right, it looked like the right thing to do in that commit. I wonder if we can
> make the comments even clearer to prevent his happening another time,
> incorporating the HW consideration.
> 
> In any case
> 
> Reviewed-by: David Hildenbrand (Arm) <david@kernel.org>
> 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Reported-by: Ben Hutchings <ben@decadent.org.uk>
> > Closes: https://lore.kernel.org/all/b0d5836032ce3135bfc473f6bff791306d086925.camel@decadent.org.uk/
> > Fixes: 48478b9f7913 ("arm64/mm: Enable batched TLB flush in unmap_hotplug_range()")
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/mm/mmu.c | 12 ++++++++++--
> >  1 file changed, 10 insertions(+), 2 deletions(-)
> > 
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 8242f93f05e4..5ff0041f4a5f 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -1509,7 +1509,11 @@ static void unmap_hotplug_pmd_range(pud_t *pudp, unsigned long addr,
> >  			if (free_mapped) {
> >  				/* CONT blocks are not supported in the vmemmap */
> >  				WARN_ON(pmd_cont(pmd));
> > -				flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> > +				/*
> > +				 * One TLBI should be sufficient here as the PMD_SIZE
> > +				 * range is mapped with a single block entry.
> > +				 */
> 
> "Flush only a single page, resulting in a single TLBi for this large block
> mapping, avoiding multiple TLBIs on HW without TLB range flushes."

I'll add something like this when applying and I'll rewrite the commit
message as well.

Cheers,

Will

