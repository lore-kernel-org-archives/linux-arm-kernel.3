Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D634C36010
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 11:35:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wbVch+zHYOCndBgA1cY7MQ4Zoe58gTWuQcTyIG25cIk=; b=ow3K4KcinnR1ky6lQT2/MzUbog
	LsuOXpB+RSAD6q9t3k0wLJmj1hJFWpoIuqW9XYVrYeA6xSs99oOSbliJVWn/FlgivwTFLyGhjWxN+
	yEAlhKofd7aSsI4ZXRhq6DEvDKqN0n1PuyfvlRpKYk+y3zdaoxUtN6ZAkERZtm9e823HBy2Lq93WP
	cE69daKVdXpvm1ewZUUbWyZ71zqXKwTds72+wCiSL4EpG5fqQjKVkZw7sbaO5VQYHpEjKspyzghYX
	5LAtrDOColmzpL84V79FDxL6QVofHc047HDw7r4UM9l9i0GzY6OaT/PrQcv9GDDqLQtxopQ4Ma/ai
	lHC08/ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZtx-00000002nIZ-0Mmx;
	Tue, 01 Apr 2025 11:35:29 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzZs7-00000002mtd-3rJz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Apr 2025 11:33:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20CD8A44665;
	Tue,  1 Apr 2025 11:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1D89C4CEE4;
	Tue,  1 Apr 2025 11:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743507214;
	bh=MSiUoVdDeD/owNol8s9zGlBrDOxClJLf4FDx5m/hEsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kQ7+TlbZFGday6F66wCc6Mj8FCsVOgzRf3x/EBAEeFRwGpJMFImo4y+kbZrIow662
	 ta53p8FR4siSwV0A+kRdo9nX82WVlFPI/6QS5KPCe7b8wrCiVlhpZAsKX95vqxrS1I
	 O6QuwcWWBQ9je8KrhEJNr268w2jvLZgKO/ASMrsjB0FSMA957/ULchEGwkawZwGKzJ
	 JQbPLAmiGEPDKTF2NwWVGuXvoKl0OudXGBO0QH6TyB59bmMLAcHd7DJT69km6gnaQK
	 LLSkabpmai4IP0/hzPWvudn4o9K+ZHbx6+OEnKlP4v3ITB3Y1F7a74aydHecpONRus
	 6qlDxiICUnX+Q==
Date: Tue, 1 Apr 2025 14:33:26 +0300
From: Mike Rapoport <rppt@kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	"Sauerwein, David" <dssauerw@amazon.de>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	David Hildenbrand <david@redhat.com>, Marc Zyngier <maz@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@linux.ibm.com>, Will Deacon <will@kernel.org>,
	kvmarm@lists.cs.columbia.edu, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v4 2/4] memblock: update initialization of reserved pages
Message-ID: <Z-vPBu5vAvFhYDzP@kernel.org>
References: <20210511100550.28178-1-rppt@kernel.org>
 <20210511100550.28178-3-rppt@kernel.org>
 <9f33c0b4517eaf5f36c515b92bdcb6170a4a576a.camel@infradead.org>
 <Z-qrtJ6cs-kXpepR@kernel.org>
 <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <b47d5f5602573bd082be3729ceddb3d1dc374ef1.camel@infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_043336_567822_8794964D 
X-CRM114-Status: GOOD (  37.27  )
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

On Mon, Mar 31, 2025 at 04:13:56PM +0100, David Woodhouse wrote:
> On Mon, 2025-03-31 at 17:50 +0300, Mike Rapoport wrote:
> > On Mon, Mar 31, 2025 at 01:50:33PM +0100, David Woodhouse wrote:
> > > On Tue, 2021-05-11 at 13:05 +0300, Mike Rapoport wrote:
> > > 
> > > On platforms with large NOMAP regions (e.g. which are actually reserved
> > > for guest memory to keep it out of the Linux address map and allow for
> > > kexec-based live update of the hypervisor), this pointless loop ends up
> > > taking a significant amount of time which is visible as guest steal
> > > time during the live update.
> > > 
> > > Can reserve_bootmem_region() skip the loop *completely* if no PFN in
> > > the range from start to end is valid? Or tweak the loop itself to have
> > > an 'else' case which skips to the next valid PFN? Something like
> > > 
> > >  for(...) {
> > >     if (pfn_valid(start_pfn)) {
> > >        ...
> > >     } else {
> > >        start_pfn = next_valid_pfn(start_pfn);
> > >     }
> > >  }
> > 
> > My understanding is that you have large reserved NOMAP ranges that don't
> > appear as memory at all, so no memory map for them is created and so
> > pfn_valid() is false for pfns in those ranges.
> > 
> > If this is the case one way indeed would be to make
> > reserve_bootmem_region() skip ranges with no valid pfns.
> > 
> > Another way could be to memblock_reserved_mark_noinit() such ranges and
> > then reserve_bootmem_region() won't even get called, but that would require
> > firmware to pass that information somehow.
> 
> I was thinking along these lines (not even build tested)...
> 
> I don't much like the (unsigned long)-1 part. I might make the helper
> 'static inline bool first_valid_pfn (unsigned long *pfn)' and return
> success or failure. But that's an implementation detail.
> 
> index 6d1fb6162ac1..edd27ba3e908 100644
> --- a/include/asm-generic/memory_model.h
> +++ b/include/asm-generic/memory_model.h
> @@ -29,8 +29,43 @@ static inline int pfn_valid(unsigned long pfn)
>         return pfn >= pfn_offset && (pfn - pfn_offset) < max_mapnr;
>  }
>  #define pfn_valid pfn_valid
> +
> +static inline unsigned long first_valid_pfn(unsigned long pfn)
> +{
> +       /* avoid <linux/mm.h> include hell */
> +       extern unsigned long max_mapnr;
> +       unsigned long pfn_offset = ARCH_PFN_OFFSET;
> +
> +       if (pfn < pfn_offset)
> +               return pfn_offset;
> +
> +       if ((pfn - pfn_offset) < max_mapnr)
> +               return pfn;
> +
> +       return (unsigned long)(-1);
> +}

This seems about right for FLATMEM. For SPARSEMEM it would be something
along these lines (I kept dubious -1):

static inline unsigned long first_valid_pfn(unsigned long pfn)
{
	unsigned long nr = pfn_to_section_nr(pfn);

	do {
		if (pfn_valid(pfn))
			return pfn;
		pfn = section_nr_to_pfn(nr++);
	} while (nr < NR_MEM_SECTIONS);

	return (unsigned long)-1;
}

-- 
Sincerely yours,
Mike.

