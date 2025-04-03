Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2CC7C3600C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 14:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BdyFL4GeBSGa/19dqYa/jBUg//G09CApfxjPS3UQzQo=; b=qGI+7wuPLVDOd1pcSX/g2Sdl9s
	NWGBSFPOwcMkRmbPl6NzWYTLaGIxrnk7i8lWL3bqLnu0hLhxRl17yQF5rrmpkdMjcCas5Svpv/pnd
	WtHaJKgYAQerVIIRlXyezJNe8oyal7reeDp0uBUsLC9ZPzqrkSqn5yBOM+Fk4KeEUrBGEm2C8YF31
	qQb5nSzdmGg+eGILECWdTPTFI+aSnPAblmGZRi6OSn8FpE+4jtWeoIWAw+PQfK0v7M7bro4Y6qQT3
	tZRavdqQTJv0PAAvxMbaiATivJbXCF/tcNhlKoR4nIhaLqYQHpB/yuFIh+Qne0uvicrFbfoFEmHl+
	4Z6yQcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LIa-000000091ft-2tls;
	Thu, 03 Apr 2025 14:12:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0LGn-000000091Pw-1ZkJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 14:10:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C408168429;
	Thu,  3 Apr 2025 14:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96A22C4CEE3;
	Thu,  3 Apr 2025 14:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743689412;
	bh=HehmzWN07oImSDzOXjOMFAC9bLomTxZFRkiMNjxI5FQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p4tCPFYYYPGoaZWejEYhyx1y7zD3cp3NTUeFqKkYekF1dCNx8KDC4P0g66yoeO4fj
	 IwQeRmrNwV+NXJciR0mgdgA6w6dLUogofUeFKcS6brgieJ4VEzsExBZsOaZYHtc5fR
	 sLRe6uQRvYTJw2G5EZMRtQ8sydPfG4I8GEmaP/Gm2jeQtdppNQCAGEDSHnU9vhK7Hq
	 SFXipEe7jLpRvLbkwRKX3pJWCXfRBYqfkk9EXc8forpXVlHdDUfdZ3Vo4TcIpD8vk9
	 ui6dBY5E6bgi5+Ffe916I7e/DwfPLsM9iBqNRXH9PJO1hX3BTGEisqGFtMeFiPRumM
	 2X0cBdR7DNuXg==
Date: Thu, 3 Apr 2025 17:10:03 +0300
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
Subject: Re: [RFC PATCH 3/3] mm: Implement for_each_valid_pfn() for
 CONFIG_SPARSEMEM
Message-ID: <Z-6WuzNDSwPN4Enn@kernel.org>
References: <Z-vn-sMtNfwyJ9VW@kernel.org>
 <20250402201841.3245371-1-dwmw2@infradead.org>
 <20250402201841.3245371-3-dwmw2@infradead.org>
 <Z-4phOInXZlxFwk9@kernel.org>
 <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e465ba32fb34b31eddb18890587960671b73234f.camel@infradead.org>
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

On Thu, Apr 03, 2025 at 08:07:22AM +0100, David Woodhouse wrote:
> On Thu, 2025-04-03 at 09:24 +0300, Mike Rapoport wrote:
> > with a small nit below
> > 
> > > +static inline bool first_valid_pfn(unsigned long *p_pfn)
> > > +{
> > > +	unsigned long pfn = *p_pfn;
> > > +	unsigned long nr = pfn_to_section_nr(pfn);
> > > +	struct mem_section *ms;
> > > +	bool ret = false;
> > > +
> > > +	ms = __pfn_to_section(pfn);
> > > +
> > > +	rcu_read_lock_sched();
> > > +
> > > +	while (!ret && nr <= __highest_present_section_nr) {
> > 
> > This could be just for(;;), we anyway break when ret becomes true or we get
> > past last present section.
> 
> True for the 'ret' part but not *nicely* for the last present section.
> If the original pfn is higher than the last present section it could
> trigger that check before entering the loop.
> 
> Yes, in that case 'ms' will be NULL, valid_section(NULL) is false and
> you're right that it'll make it through to the check in the loop
> without crashing. So it would currently be harmless, but I didn't like
> it. It's relying on the loop not to do the wrong thing with an input
> which is arguably invalid.
> 
> I'll see if I can make it neater. I may drop the 'ret' variable
> completely and just turn the match clause into unlock-and-return-true.
> I *like* having a single unlock site. But I think I like simpler loop
> code more than that.
> 
> FWIW I think the check for (PHYS_PFN(PFN_PHYS(pfn)) != pfn) at the
> start of pfn_valid() a few lines above is similarly redundant. Because
> if the high bits are set in the PFN then pfn_to_section_nr(pfn) is
> surely going to be higher than NR_MEM_SECTIONS and it'll get thrown out
> at the very next check, won't it?

I believe the check for (PHYS_PFN(PFN_PHYS(pfn)) != pfn) got to the generic
version from arm64::pfn_valid() that historically supported both FLATMEM
and SPARSEMEM.

I can't think of a configuration in which (PHYS_PFN(PFN_PHYS(pfn)) != pfn)
and pfn_to_section_nr(pfn) won't be higher than NR_MEM_SECTIONS, but with
all variants that arm64 has for PAGE_SHIFT and ARM64_PA_BITS I could miss
something.
 
> I care because I didn't bother to duplicate that 'redundant' check in
> my first_valid_pfn(), so if there's a reason for it that I'm missing, I
> should take a closer look.
> 
> I'm also missing the reason why the FLATMEM code in memory_model.h does
> 'unsigned long pfn_offset = ARCH_PFN_OFFSET' and then uses its local
> pfn_offset variable, instead of just using ARCH_PFN_OFFSET directly as
> I do in the FLATMEM for_each_valid_pfn() macro.

Don't remember now, but I surely had some $REASON for that :) 

-- 
Sincerely yours,
Mike.

