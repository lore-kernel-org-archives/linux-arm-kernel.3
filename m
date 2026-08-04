Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C47BC55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 12:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GKB4l2IZdbP/Q0kXwbUuYXowkK37syxnhhgXnRPRqN4=; b=irAGIhRKU5HY04Cu35gPcdgAkR
	H9IR7EmOWA7gznMTTattmfx4rHIFXSGuTHowRXMIkUwzbfgWB4Q9r55dZDWoH8fqzdnTKzzOw1r7S
	kL+y4Zx2i2iV2z/OvbTWkDdJHcyARkcC1kRxqqEdbBRi2ieOh5UK9uG7/1vsLV19EfDY0STH/jjnH
	nK759Y93Mkogqg4iHJtfDlR/aaF0UdgaLcvSmNcIx3h1UdLR3WvxJwXAh24y6u0NPExDFH6KKtROO
	8bsiPvKOiv28YFNLLO4UJrxuuNkc4NCghzJOTiU99jvytQSAbZIwfUsVRsAR2qzebIphsPkWqo5Cl
	HiG67f2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEV7-00000001qSI-2RgX;
	Tue, 04 Aug 2026 12:44:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrEV6-00000001qS2-1TUH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 12:44:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E3D9543A4A;
	Tue,  4 Aug 2026 12:44:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 034D81F000E9;
	Tue,  4 Aug 2026 12:44:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785847447;
	bh=GKB4l2IZdbP/Q0kXwbUuYXowkK37syxnhhgXnRPRqN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=T+v+kmdgCi3T4UxR1mhAPlH3L3GeQtz+35K3qNK/vTqxJ2yOhaKoAVspBfOMxLtsn
	 FIWPLNKujn5Olk6Z1+BnoEkDpCRSlRtCDxuydX1h9GeE6Eo2MOGwzDqGMneFaBwi/s
	 k1oHBA1ZQ6LyPgdPLKQitX4rEDVnEILfBvI9RX+oJ2Ihm42LEJmI4EzjPJ+9HlvHfA
	 kAMfGranFVW0VA+QEd5XUJV+yYuDvEayQq7xHv1OcCe6lMi7yMbcz8Nt00EWijb0Sc
	 z41BRatoKPG4RoVOTuLaS2r3qLW8wT6a0YEEg0Aik0zKahizkE1Pp51jHOmksup38v
	 HLAh1qHJ/KsIQ==
Date: Tue, 4 Aug 2026 13:43:45 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Pedro Falcato <pfalcato@suse.de>
Cc: David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, 
	Helge Deller <deller@gmx.de>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, "Liam R. Howlett" <liam@infradead.org>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Jan Kara <jack@suse.cz>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Nico Pache <npache@redhat.com>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Kevin Brodsky <kevin.brodsky@arm.com>, Muhammad Usama Anjum <usama.anjum@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] mm/powerpc/8xx: constify ptep_get() argument
Message-ID: <anHeZx6Gg7waNWjL@lucifer>
References: <20260803164400.531199-1-pfalcato@suse.de>
 <20260803164400.531199-4-pfalcato@suse.de>
 <anHI4B-lMu6AJJfA@lucifer>
 <anHc4aUbwxWx9YJF@pedro-suse>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anHc4aUbwxWx9YJF@pedro-suse>
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

On Tue, Aug 04, 2026 at 01:38:52PM +0100, Pedro Falcato wrote:
> On Tue, Aug 04, 2026 at 12:13:13PM +0100, Lorenzo Stoakes (ARM) wrote:
> > On Mon, Aug 03, 2026 at 05:43:57PM +0100, Pedro Falcato wrote:
> > > There is no need for write access to the PTE.
> > >
> > > Signed-off-by: Pedro Falcato <pfalcato@suse.de>
> >
> > With below addressed LGTM so:
> >
> > Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
> >
> > > ---
> > >  arch/powerpc/include/asm/nohash/32/pte-8xx.h | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> > > index e2ea8ba9f8ca..f2bab31040c7 100644
> > > --- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> > > +++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
> > > @@ -226,7 +226,7 @@ static inline pte_basic_t pte_update(struct mm_struct *mm, unsigned long addr, p
> > >
> > >  #ifdef CONFIG_PPC_16K_PAGES
> > >  #define ptep_get ptep_get
> > > -static inline pte_t ptep_get(pte_t *ptep)
> > > +static inline pte_t ptep_get(const pte_t *ptep)
> > >  {
> > >  	pte_basic_t val = READ_ONCE(ptep->pte);
> > >  	pte_t pte = {val, val, val, val};
> >
> > Worth making these const too (that {val, val, val, val} horrifies me btw :)?
>
> This is PPC code, so I don't know if they have any particular opinion here,
> but I could definitely do this.
>
> (FWIW, it seems we're more aggressive in MM in doing this than other places
> in the kernel?)

I mean I can't see why there'd be any objection given you're already const-ing
here :)

>
> --
> Pedro

--
Cheers, Lorenzo

