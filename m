Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F16FF506D9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 14:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yZ0Q71mWn/1K83IfnKsT1roZgojOpzvBU0myXc7MR0=; b=D8+tzG1r/oR6XHteiwxCsWn23k
	yyFN8nib2ZvSt4UzwoX2PLYoA1svPSLZgjFk2nLZsO4IEgRcvPUVUwNfwwgUWj9lHvwac9yCOFRoq
	MffoTqCd7TkNs+frjdUoqrL0WWbFAUvGhT3qIfLunUAOZh/8hUGxBk5mlsnRF1/Exu5wjRGVxZhoS
	hhfc73UaJ8zY4EEDplu0rq7oRNWIkfudJMBbi8lqFLB1A6aGHlMkjlWwEK7m3Zh2/E3MhVSd+exjL
	XiHDB43M4Sfzucz8UzptpnGZ9FyqBAskNX1d/ZbB9fgmZth2xaDCPhyEyoImJ25w5fUjbiva1ER58
	x5u0JHhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29CA-00000004DMr-06Gi;
	Mon, 16 Mar 2026 14:45:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w29C8-00000004DMB-1q1U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 14:45:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6E8AC600AD;
	Mon, 16 Mar 2026 14:45:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85B08C19421;
	Mon, 16 Mar 2026 14:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773672323;
	bh=IDgNs3HZYuT9qiw+9So7xncnHaeOkdNOK7hWlAOMll8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FEsxa7f28ijZCVDp3G8nrl/AdSeXsXsRscAvW1Ym330MzI/6Hg6hCZfF3F+18c9Mc
	 8iSmAsk64cePYPYk4hRbOdQOCsYkuXrD2R3oI6Y+wosIoiHpSjeeGVM51vfqln62fz
	 Hd4HIiC32FfOZy7ILN9HRXuAc2Tk41Ao4GUixLFgxp3BmlAsYg7ht91Lw1cnJho1y3
	 zk3imc8kNB+bZvbUoc3q3NEP6NqQ+tLUrgTsmhSkRIeLunrCfYk5FSq2v0dw1sfu04
	 cCxZLTgmMy/MIcB7u01MpsSkSTCM0G+hFU3H6k6VvJVHqT4tnfYADeoFIxHB9bpuRQ
	 pjU9LHqWVke/A==
Message-ID: <672cdd3d-45ac-4e40-8b4d-6423ace14262@kernel.org>
Date: Mon, 16 Mar 2026 15:45:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: mm: Use generic enum pgtable_level
To: Kevin Brodsky <kevin.brodsky@arm.com>, Ryan Roberts
 <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>
References: <20260316140150.58207-1-kevin.brodsky@arm.com>
 <415ea4a5-e729-4fe5-b95d-29fcca8f7dbd@arm.com>
 <132a27ae-4deb-401f-86ad-f8b496bfd778@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <132a27ae-4deb-401f-86ad-f8b496bfd778@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 3/16/26 15:38, Kevin Brodsky wrote:
> On 16/03/2026 15:22, Ryan Roberts wrote:
>>>  static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>>> -				       enum pgtable_type pgtable_type)
>>> +				       enum pgtable_level pgtable_level)
>>>  {
>>>  	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
>>>  	struct ptdesc *ptdesc = pagetable_alloc(gfp & ~__GFP_ZERO, 0);
>>> @@ -539,40 +539,42 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>>>  
>>>  	pa = page_to_phys(ptdesc_page(ptdesc));
>>>  
>>> -	switch (pgtable_type) {
>>> -	case TABLE_PTE:
>>> +	switch (pgtable_level) {
>>> +	case PGTABLE_LEVEL_PTE:
>>>  		BUG_ON(!pagetable_pte_ctor(mm, ptdesc));
>>>  		break;
>>> -	case TABLE_PMD:
>>> +	case PGTABLE_LEVEL_PMD:
>>>  		BUG_ON(!pagetable_pmd_ctor(mm, ptdesc));
>>>  		break;
>>> -	case TABLE_PUD:
>>> +	case PGTABLE_LEVEL_PUD:
>>>  		pagetable_pud_ctor(ptdesc);
>>>  		break;
>>> -	case TABLE_P4D:
>>> +	case PGTABLE_LEVEL_P4D:
>>>  		pagetable_p4d_ctor(ptdesc);
>>>  		break;
>>> +	default:
>>> +		break;
>> nit: I think we should either explicitly support pgd or explicitly bug/warn. Now
>> that the enum has PGTABLE_LEVEL_PGD it looks legit to call __pgd_pgtable_alloc()
>> to allocate one. But it will currently silently fail to call pagetable_pgd_ctor().
> 
> I hesitated there as well, eventually I concluded that we're dealing
> with kernel page tables so we'll never allocate a PGD anyway...
> 
>> Probably simplest just to call BUG() in the default path?
> 
> ... but that's certainly fine by me :)

If we could force it to be inline, we could turn it into a BUILD_BUG().

	VM_WARN_ON()

might be good enough I guess.

-- 
Cheers,

David

