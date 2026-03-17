Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B607FD8764
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 12:47:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VJ1ZJ9dPgcjPoI/S5WpbkXX1sx/pBiOzKIj67WN9nlY=; b=V2VNAbxr6/QDFCRC//l6pnzqyn
	2HvH57EHOcvwnsvPWmVkgPT8jxn4ImUzwDYPLKYAQ8OngI8N5w+02U6Ws2N9zt6Cc7zBJZQjbFUeK
	i28a81qGqMbSCAvC1tu/bsAY7+yKUOCfLvwrsE89w+Bt0Cm+bv2bWmXgFdnhlghbSjGj9ncTz8yOh
	tqO+Fvj+A470wyqtxJhTYjoags+BS4xDJ2PaLvxwOuDTu2MfH5WWl0Eyv6qsS9DVxKvEs/2pVQEuz
	E9RAVvez7dubOZhr8GY+U6kk/cv43L9MFGmZ4S0aSpXdkash0Q96J1pJvQr7uxhhM84pDU6RPBbFW
	Wk8X0LAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TpN-00000006KKW-3dTj;
	Tue, 17 Mar 2026 12:47:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2TpL-00000006KJy-1goR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 12:47:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D45B81477;
	Tue, 17 Mar 2026 05:47:07 -0700 (PDT)
Received: from [10.57.60.143] (unknown [10.57.60.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 9378B3F7BD;
	Tue, 17 Mar 2026 05:47:12 -0700 (PDT)
Message-ID: <361498f4-ccf2-4be1-be05-861b417499b5@arm.com>
Date: Tue, 17 Mar 2026 13:47:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Use generic enum pgtable_level
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20260316140150.58207-1-kevin.brodsky@arm.com>
 <415ea4a5-e729-4fe5-b95d-29fcca8f7dbd@arm.com>
 <132a27ae-4deb-401f-86ad-f8b496bfd778@arm.com>
 <672cdd3d-45ac-4e40-8b4d-6423ace14262@kernel.org>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <672cdd3d-45ac-4e40-8b4d-6423ace14262@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260317_054715_490445_A9E814FC 
X-CRM114-Status: GOOD (  12.25  )
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

On 16/03/2026 15:45, David Hildenbrand (Arm) wrote:
> On 3/16/26 15:38, Kevin Brodsky wrote:
>> On 16/03/2026 15:22, Ryan Roberts wrote:
>>>>  static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>>>> -				       enum pgtable_type pgtable_type)
>>>> +				       enum pgtable_level pgtable_level)
>>>>  {
>>>>  	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>>>>  	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
>>>> @@ -539,40 +539,42 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>>>>  
>>>>  	pa = page_to_phys(ptdesc_page(ptdesc));
>>>>  
>>>> -	switch (pgtable_type) {
>>>> -	case TABLE_PTE:
>>>> +	switch (pgtable_level) {
>>>> +	case PGTABLE_LEVEL_PTE:
>>>>  		BUG_ON(!pagetable_pte_ctor(mm, ptdesc));
>>>>  		break;
>>>> -	case TABLE_PMD:
>>>> +	case PGTABLE_LEVEL_PMD:
>>>>  		BUG_ON(!pagetable_pmd_ctor(mm, ptdesc));
>>>>  		break;
>>>> -	case TABLE_PUD:
>>>> +	case PGTABLE_LEVEL_PUD:
>>>>  		pagetable_pud_ctor(ptdesc);
>>>>  		break;
>>>> -	case TABLE_P4D:
>>>> +	case PGTABLE_LEVEL_P4D:
>>>>  		pagetable_p4d_ctor(ptdesc);
>>>>  		break;
>>>> +	default:
>>>> +		break;
>>> nit: I think we should either explicitly support pgd or explicitly bug/warn. Now
>>> that the enum has PGTABLE_LEVEL_PGD it looks legit to call __pgd_pgtable_alloc()
>>> to allocate one. But it will currently silently fail to call pagetable_pgd_ctor().
>> I hesitated there as well, eventually I concluded that we're dealing
>> with kernel page tables so we'll never allocate a PGD anyway...
>>
>>> Probably simplest just to call BUG() in the default path?
>> ... but that's certainly fine by me :)
> If we could force it to be inline, we could turn it into a BUILD_BUG().

I don't think this would help, pgd_pgtable_alloc_init_mm() is passed
around as a function pointer so the compiler can't know the value of
pgtable_level at compile time.

> 	VM_WARN_ON()
>
> might be good enough I guess.

I think so, not calling a ctor at PGD level has no real consequence (it
wasn't done at all until recently).

- Kevin

