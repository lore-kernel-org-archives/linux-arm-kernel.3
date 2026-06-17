Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3784CD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Jun 2026 15:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+mqWVy0xz5Q5QOdMchs2mpfdZbtXWI7hrs2LNKIi0SA=; b=y5Mpko/WMIF0NR+/95oEMg42rx
	sRt7aPQ54N/d6dSb+IzjCI1JVv6cRvN9VgGc7qFSmKKoueC7yS2JUbEHeuGlGjHkLEO3PD2V/sGUl
	sWMuKdcRDqGsQsXQBpGeAjh/ehsRElUF3nfXgn1lD96lmHK8ZijIbqKmVOYRM1rSI6fiLSfKFufJn
	R34LDvD7OXJJNKR7puNhGTIn+Ji/F880JUg4M9MOXK1RsQ546Krd062jAXgYXgw6/+zKWFNCe7/5/
	MDQ9X/0uU09rZHxAuDOEMSyMrEczZwLRRhmxW0ut2G/McleIcoPR6t0Zuk0jAncHqAp/CFaS0tWL8
	uy7mUf5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZs2H-0000000HYTm-2J45;
	Wed, 17 Jun 2026 15:18:37 +0000
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZs2F-0000000HYT0-2Mvr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Jun 2026 15:18:36 +0000
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-69583ca0499so1050926a12.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Jun 2026 08:18:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781709512; x=1782314312; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+mqWVy0xz5Q5QOdMchs2mpfdZbtXWI7hrs2LNKIi0SA=;
        b=Nl4i+HnpnoP+vZFZucYixpld2svAaC2wCKYoRuroRHJYT5jv9jaagslchIW3zQo9mK
         vODXNZJgWq3LHMSpkFbfqxc3cYj5+NYzqJ/tW4sv8gzm1ERdDoyz0WM4h6q84DYPLUCI
         hZUrfyzmEZiaWMEPFbsrqQ7/FEnsdvL+AWBVLc0sBIpUapQiHz9/7K4MSkBRSJxll5so
         8t2JVcbqXv6nJ6kw6DukwBMfcY+njTJa2hb3g2rYct/l0gJFDKBJrE4tx2QjLpfoUCij
         9YPMQ1Cce21M56zgRHuVstpfHprMRHB9CBM2EQGPhBzrgRnnryOgCDg9Ocvgz5OqoFvh
         eaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781709512; x=1782314312;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+mqWVy0xz5Q5QOdMchs2mpfdZbtXWI7hrs2LNKIi0SA=;
        b=GKBbVO0eqKuFFvvNZYVOYeBKMMBlYP0F26uVTLjODipHPUM4IFY2wnnXAwrrRxW/eI
         OGfTH3Uityk19/iPmthRKol0v1Ifa7pbfS4tAEKo4EwK+5HiBDe3dLYVKb+wfMSuXFy8
         yLmRmg1Fmm3ahxttIB9zN2ZTNP8nMM86Fm+fEcYlJtafx0IEDPg4fcGbibQvhH0MSqek
         OwWg81AE2aB1pDTC1/NqqghvNhj7rusL624bjSvPD3BrFLNHMIS7A5FtyfEwrvic4CvR
         2Zzz//RDmaO5dX0/zbDvbopW8mErE7v7FVmLvDF0g58uZgclUBWMWl5BhW/quMTAETtS
         yNVA==
X-Forwarded-Encrypted: i=1; AFNElJ+pj9U++dZaE2onJAXQtuFwxhBICdn3OrE8nxr70j/Gi/HMSC7Dw1AEFw2BsVWwA9ECuI5rBuzUiN1gp4aDB8hh@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1SSosW1+dPa964dIGhf7plDbd7fGRUIyr9krmOeLOKF8fiL4a
	c5pf1BBmeVJodRtbyRM/FCoNQdQ02p4A61iJ12reWwWmhOtU7pDATwG0d9gNFvq8Dg==
X-Gm-Gg: AfdE7cl/9gpUb3NE7ERd0sBinbeOyYcJE88hrOlJMu+V8y4uXrXqBdAp1EOYMrUy+YH
	aA2Tlk4zA5Ns+I3zMn6x4bSRi10RaYEt077auGSxJ6HAbz6Y5vob5a6fDpupYWCnRtm1ZyVkPyT
	68crJKCrRfC5Cespoa9jlvPVLwpUnytEMqxhEk4zyBYztjifv9V9wZbcqNMlxfeUQMgyYLoLE6Y
	zouiuuwgTGn03rympRT1gIgcEEMRoTCwFX2mo8S1PdZtuYQuVjE44UdYqbRaDwyymq9ECXNAIlV
	n7sJwPlNfPXkCDalmCKLczfF7ivkMh3nEKQea4oRuJcuopNBmfS/KarTbeu+74OhACY6VEszine
	6O1DEU5k1FAOghCjMaqlB1DcF56Zr/cIyAOaHfJFVHnrMCffKWwiwARTsxFWBrW18uVDO9AD3p3
	2kW+s/jAEF6aW+AAObSF6Gwip8NCWDBZLZnMI5YzyAawyoKmx8og==
X-Received: by 2002:a05:6402:528b:b0:68a:ac5e:f4ba with SMTP id 4fb4d7f45d1cf-695476ff271mr2444959a12.24.1781709511761;
        Wed, 17 Jun 2026 08:18:31 -0700 (PDT)
Received: from google.com (78.207.190.35.bc.googleusercontent.com. [35.190.207.78])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6937948dde4sm6692740a12.20.2026.06.17.08.18.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 08:18:31 -0700 (PDT)
Date: Wed, 17 Jun 2026 15:18:27 +0000
From: Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Brendan Jackman <brendan.jackman@linux.dev>,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
	Yang Shi <yang@os.amperecomputing.com>,
	Brendan Jackman <jackmanb@google.com>, owner-linux-mm@kvack.org
Subject: Re: [RFC PATCH 3/6] arm64: mm: fix restoring linear map permissions
 on execmem cache clean
Message-ID: <ajK6w3YTFpVaUl3v@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-4-abarnas@google.com>
 <DJ69RCVRBO0Y.3JCYSW50IC4RC@linux.dev>
 <aiuyoy8Kmr9yU4GM@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aiuyoy8Kmr9yU4GM@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_081835_655416_EA0B7872 
X-CRM114-Status: GOOD (  32.06  )
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

On Fri, Jun 12, 2026 at 10:17:55AM +0300, Mike Rapoport wrote:
>On Thu, Jun 11, 2026 at 01:54:13PM +0000, Brendan Jackman wrote:
>> On Thu Jun 11, 2026 at 1:01 PM UTC, =?UTF-8?q?Adrian=20Barna=C5=9B?= wrote:
>> > Strip the read-only attribute from the selected memory range when
>> > restoring the linear map after an execmem cache clean.
>> >
>> > An execmem cache clean is performed when a cache block becomes empty
>> > after unloading a module. When making the memory valid again, the linear
>> > memory alias must also have its read-only attribute cleared.
>> >
>> > Without this change, the linear memory alias remains read-only even
>> > after the execmem cache block itself is freed, which prevents subsequent
>> > allocations from writing to that memory.
>> >
>> > Signed-off-by: Adrian Barnaś <abarnas@google.com>
>> > ---
>> >  arch/arm64/mm/pageattr.c | 17 ++++++++++++++++-
>> >  1 file changed, 16 insertions(+), 1 deletion(-)
>> >
>> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
>> > index 88720bbba892..eaefdf90b0d5 100644
>> > --- a/arch/arm64/mm/pageattr.c
>> > +++ b/arch/arm64/mm/pageattr.c
>> > @@ -239,6 +239,13 @@ int set_memory_x(unsigned long addr, int numpages)
>> >  					__pgprot(PTE_PXN));
>> >  }
>> >
>> > +static int set_memory_default(unsigned long addr, int numpages)
>> > +{
>> > +	return __change_memory_common(addr, PAGE_SIZE * numpages,
>> > +				      __pgprot(PTE_VALID),
>> > +				      __pgprot(PTE_RDONLY));
>> > +}
>> > +
>> >  int set_memory_valid(unsigned long addr, int numpages, int enable)
>> >  {
>> >  	if (enable)
>> > @@ -362,7 +369,15 @@ int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid)
>> >  	if (!can_set_direct_map())
>> >  		return 0;
>> >
>> > -	return set_memory_valid(addr, nr, valid);
>> > +	/*
>> > +	 * Execmem cache uses this function to reset permissions on linear mapping
>> > +	 * when freeing unused cache block. On x86 it makes memory RW which is
>> > +	 * desirable.
>>
>> Hm, maybe desirable for execmem but that doesn't really mean the x86
>> behaviour is correct. Maybe it makes more sense to change the x86
>> to align with the arm64 behaviour here?
>>
>> BTW we should probably document this API a little bit, I never thought
>> abut what "valid" actually means until now. I had thought of it as "I
>> can access this memory" but that's an unclear concept and now I realise
>> "valid" is a technical concept in Arm that's confusing. And it's extra
>> confusing if the kernel API uses "valid" to mean a _different_ thing.
>
>I've got confused too and that's how set_direct_map_valid() got into x86
>with a different semantics than on arm64.
>
>What execmem really needs is set_direct_map_default() variant that gets
>nr_pages.
>
>AFAIR, set_direct_map_default() has a single 'page' parameter because it
>was added to reset permissions for the direct map alias for vmalloc()'ed
>pages before there was VMALLOC_HUGE and each page had to be reset
>independently anyway.
>
>Maybe it's time to add nr_pages to set_direct_map_valid().
>
>> Also, shouldn't execmem be using set_memory_default_noflush() before
>> freeing anyway? I guess that shoudl even be documented as "if you change
>> anything you need to call this before you free the page".
>
>It does on x86 because there set_direct_map_valid() is the same as
>set_direct_map_default().
>
>> > On ARM64 set_memory_valid() just change valid bit which
>> > +	 * leave direct mapping read-only so use set_memory_default instead.
>> > +	 */
>> > +
>> > +	return valid ? set_memory_default(addr, nr) :
>> > +		       set_memory_valid(addr, nr, false);
>> >  }
>> >
>> >  #ifdef CONFIG_DEBUG_PAGEALLOC
>>
>>
>
>-- 
>Sincerely yours,
>Mike.

Hi Mike, Brendan,

Thanks for taking a look at the RFC.

I was also quite confused by this initially. I spent some time debugging 
until I realized why unloading all the modules was causing the kernel to 
crash.

The reason I took this approach was that I wanted to send out a working 
prototype for arm64 that wouldn't interfere with the existing, working 
implementation on x86.

Following your suggestion, I can put together a preparatory patch series 
to refactor the set_direct_map_* APIs to accept a nr_pages parameter. 
This refactoring would also allow us to drop the redundant 
set_area_direct_map helper. I could then rebase the rox_cache series on 
top of that.

Does this sound like a good path forward?

Thanks,
Adrian

