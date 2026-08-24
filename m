Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8403FC5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:30:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iDn1o2DLL+y0sd22jeA5t6tGJEqFYhPXPnftrfb3MMM=; b=v7D/t9lQDCa3szhb8hxzePREfn
	DFwXFFXHmKYRLVoR4MPAB7g46WCKrluHY8BzKOpPocF9LYnWDOup0X+7UyJeAqgIXw4MxeA44V16V
	ztHKmPJC4kXm4/IlbUmLWF/A3+9MIB41jWQmCd5pEeGqXw9cA09Mo/5Stn0Sp0/YmZNqxd7XcvF7G
	CJHWlWPXEDNyl7vOKdt0sB7W84j3khJti6yInKOfE14pJI5b6PE6AomeT+ABeL6+s8YRT5EGZgD8E
	4V7F9weT4otyzrnmOpBQ3D366jf/2XnzpIk3sxGjbVBoaMBiMmRuSEXK9hQKSoCej2IfVmlj6hXZZ
	d1wBrXpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUke-0000000Ghha-1frp;
	Mon, 24 Aug 2026 13:30:14 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUkc-0000000Ghh8-2hRy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 13:30:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B0E64600E2;
	Mon, 24 Aug 2026 13:30:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 987D81F000E9;
	Mon, 24 Aug 2026 13:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787578209;
	bh=iDn1o2DLL+y0sd22jeA5t6tGJEqFYhPXPnftrfb3MMM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=gdcKIYQLI5HeVyXSM2OirRq2RIF0UF0dCL/O3mP/vsUNEeHf8rogh7W5b5tsJmPe6
	 NVqMzKfWLFtxBjl5Tj+xuyECb4p8kzVDDFyXvNA47tYycOpvzlvir47tSmEQRZZ0+0
	 /FzuZ7AzJYpJs0F+xIVB4lNdCpZMF1YfpEln3kfMHZnhloiTZG28ValSOYheFKVbVj
	 jExroxeuXDXK42Ma+1vtxiyqTqJ964htlRa/CmUUdAnmXCd2fdS/oR9epj83dKmMss
	 GKzBKqLpw2Sd2dmQBeW4krCm8NmWEXJ53YQwH00S3k/0+ksUTXdxgrpx/dM1LiLojN
	 FrZ8KiFolO3aA==
Date: Mon, 24 Aug 2026 14:30:02 +0100
From: Will Deacon <will@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Wei-Lin Chang <weilin.chang@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oupton@kernel.org>, Fuad Tabba <tabba@google.com>,
	Joey Gouly <joey.gouly@arm.com>,
	Steffen Eiden <seiden@linux.ibm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Zenghui Yu <yuzenghui@huawei.com>,
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Dev Jain <dev.jain@arm.com>, Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Matt Fleming <matt@codeblueprint.co.uk>,
	Vincent Donnefort <vdonnefort@google.com>,
	Sebastian Ene <sebastianene@google.com>
Subject: Re: [PATCH v3 0/2] arm64: ptdump flush fixes
Message-ID: <aoxHWvUwgzqzg_cQ@willie-the-truck>
References: <20260814222458.584906-1-weilin.chang@arm.com>
 <87h5klno04.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87h5klno04.wl-maz@kernel.org>
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

On Sun, Aug 23, 2026 at 11:13:15AM +0100, Marc Zyngier wrote:
> On Fri, 14 Aug 2026 23:24:56 +0100,
> Wei-Lin Chang <weilin.chang@arm.com> wrote:
> > 
> > Hi,
> > 
> > This series fixes two problems around ptdumps:
> > 
> > 1. note_page_flush(), which flushes out the last row of ptdumps, does
> >    not account for address spaces that have IA < 64. Other than making
> >    the last region extremely huge, the attributes of the last region
> >    within the address spaces appear to extend all the way to 1 << 64.
> > 
> > 2. KVM/arm64's stage-2 ptdump missed calling note_page_flush().
> > 
> > To address Will's comment [1], I have created an end_address field for
> > struct ptdump_pg_state, and initialized it with the end address of the
> > ptdumps. It follows the same convention as the last range->end:
> > exclusive end, except for the case where the address space ends at
> > 1 << 64. In that case it is set as ULONG_MAX.
> > 
> > Caching the end address avoids duplicating the range iteration in
> > note_page_flush(), at the cost of duplicating state in ptdump_pg_state.
> > 
> > Series is based on v7.2-rc5.
> 
> Reviewed-by: Marc Zyngier <maz@kernel.org>
> 
> Will, if you're OK with patch #1, do you want the whole thing to go
> via the arm64 or the kvmarm tree?

I can pick 'em both up, as I already have some other fixes on my radar
for -rc1.

Cheers,

Will

