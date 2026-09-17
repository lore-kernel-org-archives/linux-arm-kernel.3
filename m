Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2658C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 04:26:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/TSlRmA9IxlgW+MUHKGWkJT1WvuwQwh9/IuOpZ/lzHA=; b=w+zduIWw+panGDFhwsY4aqPFkh
	5qeCEzM/q12KIW86YkHydqz3zEaKhcYvLfd9lb3oXTGlGG1Vg7F9pZBdz2UFQbN/Ou5YnyEECT6sf
	jzzZE88qqzJ0uUlzC+HnsnFvcrvG5sTOsHtOCtkwZPZRbNCTRLx7Five/rwE7vbE+NwU88gB/lkBg
	CVzmxlg/cPK2yp4OmLUL/gSIdQRZnMfXZFMfCcE+vDYT6yRWW28S6wocpk2VXr1FXd1v8ZRbdIN5Q
	qdMINHsC3JDaFS+CNX5mJGacAiEJ2yB5UKQC2lQ6GBO8M94vDroviNDmHlGbzj3w5Mu2im//TBkQ8
	3YCWq7dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73hR-0000000AZ7d-21y9;
	Thu, 17 Sep 2026 04:26:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x73hP-0000000AZ7H-2pYE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 04:26:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A1E361476;
	Wed, 16 Sep 2026 21:26:09 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 713783F882;
	Wed, 16 Sep 2026 21:26:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789619173; bh=EgXTNuPyQIL5qR2/Uw/QQJ0weEFCg16n/wsDo/uqsqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LYojUdTgIB2UPdkBV85+uIudRJGbmFduw8RmczXhFdRRGnBzUEGmqZPPxq8lAzPMQ
	 UlnzPf852DScCiQ9xzX6ugLDLyZlTF3Vrvc7mgae38oSyuBdnMzK8ZOvPcUS5ue7U2
	 Nyc2E8MlEPVadDDIUDzOmU/1qSSPUItaMJjfZaCM=
Date: Thu, 17 Sep 2026 09:56:09 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Lorenzo Stoakes <ljs@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH V2 02/14] arm64/mm: Route all pgtable reads via
 ptval_get()
Message-ID: <yjqldpl7il6uqfoqrszaopchqthhlffssprmlqjkljvpkbpwkt@zetb5hyvllsl>
References: <20260907035030.2839978-1-anshuman.khandual@arm.com>
 <20260907035030.2839978-3-anshuman.khandual@arm.com>
 <05a7ac7a-b7bb-4f75-a395-6854874fb8c7@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <05a7ac7a-b7bb-4f75-a395-6854874fb8c7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_212615_762822_65AA8B50 
X-CRM114-Status: GOOD (  17.62  )
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

On Wed, Sep 16, 2026 at 03:38:13PM +0200, David Hildenbrand (Arm) wrote:
> On 9/7/26 05:50, Anshuman Khandual wrote:
> > Define arm64 platform specific implementations for new pxdp_get() helpers.
> > These resolve into READ_ONCE(), thus ensuring required single copy atomic
> > semantics for the page table entry reads.
> > 
> > In future this infrastructure can be used for D128 to maintain single copy
> > atomicity semantics with inline asm blocks.
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > ---
> >  arch/arm64/include/asm/pgtable.h | 38 +++++++++++++++++++++++++++-----
> >  1 file changed, 32 insertions(+), 6 deletions(-)
> > 
> > diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> > index 83087b70f192..f764132ca34e 100644
> > --- a/arch/arm64/include/asm/pgtable.h
> > +++ b/arch/arm64/include/asm/pgtable.h
> > @@ -84,6 +84,32 @@ static inline void arch_leave_lazy_mmu_mode(void)
> >  	arch_flush_lazy_mmu_mode();
> >  }
> >  
> > +#define ptval_get(x)		READ_ONCE(x)
> > +
> > +#define pmdp_get pmdp_get
> > +static inline pmd_t pmdp_get(pmd_t *pmdp)
> > +{
> > +	return ptval_get(*pmdp);
> > +}
> Ah, one thing: you could pass a const pointer to all these read helpers.

Sure but first will have to change their defaults in include/linux/pgtable.h

> 
> -- 
> Cheers,
> 
> David

