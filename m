Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25A1BC3601B
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Apr 2025 08:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYl7f85untSBaRrmNA+DrhMEE4zGZxt0EhzKRLffDHc=; b=n/UwSK7sxAjULdv7k7f/qOZ7cO
	S5r7TlDfoDGEMmN0LPm2sj1HogYWQySFLPmq3CIUjQEtGl/xGhIwqzwoWxSGOffoE+Y8YCQylaHPG
	lMrsfIhEkvHMTP22FASFzVFQuUGeGERre+tHwjPQDBjvMjXCmc2JA3zwz5ofZfUcGBAcIlQQjW8gV
	UeRhU4a4Lwwu5UIsEYR7wAJ4YGY+3bBQSTRUWnDK+5xN0SmWoWTYXzRYiNGLBUTC6UwZLZFqQ7a7w
	ALF7oNOeyHnlYWYwQVd8/zW5MjYcEWksjkjLsFLfmHYOlhgGthWAqsp7a5Bget+AsAaPYLtfU+zUN
	vFCrqLSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0FyD-00000008Gfp-2yjy;
	Thu, 03 Apr 2025 08:30:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0Fvn-00000008GGW-10rg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Apr 2025 08:28:12 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 35DA5106F;
	Thu,  3 Apr 2025 01:28:11 -0700 (PDT)
Received: from mazurka.cambridge.arm.com (mazurka.cambridge.arm.com [10.2.80.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 63B403F59E;
	Thu,  3 Apr 2025 01:28:04 -0700 (PDT)
Date: Thu, 3 Apr 2025 08:28:01 +0000
From: =?utf-8?Q?Miko=C5=82aj?= Lenczewski <miko.lenczewski@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: suzuki.poulose@arm.com, yang@os.amperecomputing.com, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, jean-philippe@linaro.org,
	robin.murphy@arm.com, joro@8bytes.org, akpm@linux-foundation.org,
	ardb@kernel.org, mark.rutland@arm.com, joey.gouly@arm.com,
	maz@kernel.org, james.morse@arm.com, broonie@kernel.org,
	oliver.upton@linux.dev, baohua@kernel.org, david@redhat.com,
	ioworker0@gmail.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	mshavit@google.com, jsnitsel@redhat.com, smostafa@google.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev
Subject: Re: [PATCH v5 3/3] arm64/mm: Elide tlbi in contpte_convert() under
 BBML2
Message-ID: <20250403082801.GA14239@mazurka.cambridge.arm.com>
References: <20250325093625.55184-1-miko.lenczewski@arm.com>
 <20250325093625.55184-4-miko.lenczewski@arm.com>
 <fc505d3f-8ee4-40ed-8b8e-9e1c07b21fe1@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fc505d3f-8ee4-40ed-8b8e-9e1c07b21fe1@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_012811_319694_1AC4A9BC 
X-CRM114-Status: GOOD (  18.64  )
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

On Thu, Apr 03, 2025 at 09:14:43AM +0100, Ryan Roberts wrote:
> On 25/03/2025 05:36, Mikołaj Lenczewski wrote:
> > diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
> > index 55107d27d3f8..77ed03b30b72 100644
> > --- a/arch/arm64/mm/contpte.c
> > +++ b/arch/arm64/mm/contpte.c
> > @@ -68,7 +68,8 @@ static void contpte_convert(struct mm_struct *mm, unsigned long addr,
> >  			pte = pte_mkyoung(pte);
> >  	}
> >  
> > -	__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> > +	if (!system_supports_bbml2_noabort())
> > +		__flush_tlb_range(&vma, start_addr, addr, PAGE_SIZE, true, 3);
> >  
> >  	__set_ptes(mm, start_addr, start_ptep, pte, CONT_PTES);
> 
> Despite all the conversation we had about completely eliding the TLBI for the
> BBML2 case, I've continued to be a bit uneasy about it. I had another chat with
> Alex C and we concluded that it is safe, but there could be conceivable
> implementations where it is not performant. Alex suggested doing a TLBI without
> the DSB and I think that's a good idea. So after the __set_ptes(), I suggest adding:
> 
> 	if (system_supports_bbml2_noabort())
> 		__flush_tlb_range_nosync(mm, start_addr, addr, PAGE_SIZE,
> 					 true, 3);
> 
> That will issue the TLBI but won't wait for it to complete. So it should be very
> fast. We are guranteed correctness immediately. We are guranteed performance
> after the next DSB (worst-case; next context switch).
> 
> Thanks,
> Ryan

Hi Ryan,

Sure, perfectly happy to add that on. Will respin and add a note about
this behaviour to the source code and to the patch / cover letter.

-- 
Kind regards,
Mikołaj Lenczewski

