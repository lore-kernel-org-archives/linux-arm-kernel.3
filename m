Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95618C61DBE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 14:14:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iCeVjNoZeobF60+OH4Nxi54oTDRZSmQHMdE6lHiYi/c=; b=WK9RFZ4kvVV2WMs7kLxb+kfRZ1
	UizSCd2hzgwLmWwfrNzzs2ZIThRpfI45JRBuBkYD37GxP93Nt1PNaNicnOLSRVW5bnE+OefrcQIMy
	bdyEJc2W4Ba9NE49kh8It6SZqDSvpUrp3jR9rM9miFRYW/LBBZ5+hsP5UyrR/nXNGtsehm//LgXbA
	LzaBf6iIuXfx0a24LsovbndVg2wyYl6RxvpHIImzVAOMPifkEOsGYsgdoaqnE+aBFCqI8df5N/zO1
	CjiaMEW1vaperBl+s6G3kKOuA01DugRQSE3txr8oK6B5xN7WndoX3xrpaljSMO56CvJVY+kxR0iQ0
	g/0rsuPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrut-00000000w1W-0Pql;
	Tue, 25 Aug 2026 14:14:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyrur-00000000w1O-2sRM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 14:14:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 720F543280;
	Tue, 25 Aug 2026 14:14:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638CB1F000E9;
	Tue, 25 Aug 2026 14:14:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787667257;
	bh=iCeVjNoZeobF60+OH4Nxi54oTDRZSmQHMdE6lHiYi/c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e9U5B/c5Tbvg9ISAr9IFwB1IXb7zjhZHukAHa3SyRZ/d2f1dbw63p+/43201hCitK
	 NxLA4LM2MeZvvTaeqMHs9uFyXW1m8sT/8Zi5DwlUm9caSuznGIjhihbu1QoOS0Fy0X
	 xE4gCZrS4QlUNLxSUoiak3gCCatNzymwHhULrfdQfDTaKs/Iatuhm3AuTtlbCmLNma
	 pwfrVUwdYcfj7ZQaNt8XExNUHIuD3yFcMDHdz1No0Edr4PQq7VVIQgERf4NxDISpDK
	 7SY0xfLjZnzDAmHtm9JDOocMwRmYmgXN0zSctl4ivzWNxLLWHIyUNsGmdd7l/NFCiK
	 6lWz72nSiKUwA==
Date: Tue, 25 Aug 2026 15:14:12 +0100
From: Will Deacon <will@kernel.org>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Brown <broonie@kernel.org>, kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] arm64: Don't read GMID_EL1 when MTE is disabled
Message-ID: <ao2jNDv8tOjnimEH@willie-the-truck>
References: <20260824184155.2644646-1-fuad.tabba@linux.dev>
 <aoypji6EJ8zToWvh@arm.com>
 <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+EHjTwueqEAVq-7_ioRN+1h3LNPAqHX3rTqbXODViJJM-D_pQ@mail.gmail.com>
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

On Mon, Aug 24, 2026 at 11:29:54PM +0100, Fuad Tabba wrote:
> On Mon, 24 Aug 2026 at 21:29, Catalin Marinas <catalin.marinas@arm.com> wrote:
> >
> > On Mon, Aug 24, 2026 at 07:41:55PM +0100, Fuad Tabba wrote:
> > > +/*
> > > + * Reading GMID_EL1 when the kernel has disabled MTE traps to EL2, and the raw
> > > + * ID_AA64PFR1_EL1 reflects neither CONFIG_ARM64_MTE nor the cmdline override.
> > > + */
> > > +static inline bool gmid_el1_accessible(u64 pfr1)
> > > +{
> > > +     if (!IS_ENABLED(CONFIG_ARM64_MTE))
> > > +             return false;
> > > +
> > > +     pfr1 &= ~id_aa64pfr1_override.mask;
> > > +     pfr1 |= id_aa64pfr1_override.val;
> > > +
> > > +     return id_aa64pfr1_mte(pfr1);
> > > +}
> >
> > Can this function not use __read_sysreg_by_encoding() directly and not
> > get an argument at all? We'd get the override from that function rather
> > than open-coding it here.
> 
> Like this?
> 
>       static inline bool gmid_el1_accessible(void)
>       {
>               if (!IS_ENABLED(CONFIG_ARM64_MTE))
>                       return false;
> 
>               return
> id_aa64pfr1_mte(__read_sysreg_by_encoding(SYS_ID_AA64PFR1_EL1));
>       }
> 
> > Eventually, once we get Suzuki's clamping fix,
> > it also ensures we won't be able to bump the MTE version to unsafe
> > values (but that's a different fix from this one).
> 
> Agreed it's separate, but v3 applies the override without checking
> that the CPU has MTE2, so id_aa64pfr1.mte=2 on a CPU without it reads
> a GMID_EL1 that isn't there. On the boot CPU that's before the
> override is sanitised. Should I check the raw register before applying
> the override, until the clamp lands?

At which point, why don't we bite the bullet and implement Suzuki's
idea so that __read_sysreg_by_encoding() does what you want more generally?

https://lore.kernel.org/all/afc5bd00-28ca-413b-b047-ee53589c285d@arm.com/

> > If you are worried about additional trapping of the MRS, we should go
> > for Will's improvement to always read the cached values in
> > __read_sysreg_by_encoding().
> 
> Not worried :) __cpuinfo_store_cpu() has already read ID_AA64PFR1_EL1
> a few lines up.

But if you go with __read_sysreg_by_encoding() then you'd still be
reading it (and trapping) twice, no?

Will

