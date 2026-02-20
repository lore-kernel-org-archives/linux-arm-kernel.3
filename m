Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3478C5ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Feb 2026 16:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cVwRCdVQL/e0KoLflYXLMg3iWuHLAAvqOZNNmiN5rlM=; b=VgiQypnViU4ZS/SogdlpY4V8Xi
	lJyGbJ8cdfGtQtYj7aG7HsjmtcdU6y7IvvKXbbSm8ABAPGvDhk6xjhAKHL9/K43EWDffnKK+9q+s9
	2KqrEse7tW/54MEf2lDvjC3CDWoeJVa6TxOI+sL6/IUiLOoC8icmSVcgCzh5WO4MBqmzuZrP+LKy8
	GmIs5IPZha3JWpvOn2zY8yzklpMu6suwhaIToZB08+rseJcnmGQ3vA5fzx2uXjS0fB5johgSRG7cB
	dTYHne5lcgbB7nVveUkmA58C/QjDc6faRCvt33Fve5HxLknPAeSwLmQSCMHX0AkFxXPvKCDjO8sQd
	zlhrxDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTBa-0000000FEAb-3eZ0;
	Fri, 20 Feb 2026 16:16:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtTBZ-0000000FEA6-0es6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Feb 2026 16:16:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2A27D6001D;
	Fri, 20 Feb 2026 16:16:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DCFDC116C6;
	Fri, 20 Feb 2026 16:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771604215;
	bh=kpkNbgAtvQrcuJYBpyM/snHW584YzCoFIhG2uKvTzx8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K2upkj/4APEtOgJ09n2a2p0JwC2IgowYSK9oRNYO+HcdbGAiiM3BYfUGCr50G75la
	 UQop4b6ifJqu3ODdcI5e4EArCT1nBrxkKjFhN+ogP6SH1GogjOsYUtReDN+Ks+z8hs
	 HPEvCwPZP3RhNJ3OI7ZuG4RkkhyiCOZQVwuWFIYBiHqZmII9Nm1KLKR9BgiWmtcuha
	 Lq6F4tOD6vyx8mOjghE1O4nQgd5Mfw8FduOApxG0Y6TVvneBuKbsVsd9u6kfLXxAYk
	 Ea+raJuf/eqKGwDSwB8ydhyra8/yHYj0TIW/EuPO4a104ZjoGZep2mkRtMRbItZKeL
	 1kY6E6QW0gM2Q==
Message-ID: <650c2324-8caa-49c5-940f-982e8c8b9965@kernel.org>
Date: Fri, 20 Feb 2026 17:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: gcs: Allow PAGE_NONE mappings for NUMA
 balancing
To: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Mark Brown <broonie@kernel.org>, Will Deacon <will@kernel.org>,
 Emanuele Rocca <emanuele.rocca@arm.com>, Mark Rutland <mark.rutland@arm.com>
References: <20260220140532.285011-1-catalin.marinas@arm.com>
 <20260220140532.285011-3-catalin.marinas@arm.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <20260220140532.285011-3-catalin.marinas@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 2/20/26 15:05, Catalin Marinas wrote:
> vm_get_page_prot() short-circuits the protection_map[] lookup for a
> VM_SHADOW_STACK mapping since its permissions are special. However, it
> also ignores PAGE_NONE mappings used for NUMA balancing by creating an
> accessible PTE.
> 
> Special-case the VM_NONE permission to create an invalid PTE even if it
> is a GCS mapping.
> 
> Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
> Fixes: 6497b66ba694 ("arm64/mm: Map pages for guarded control stack")
> Cc: <stable@vger.kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Will Deacon <will@kernel.org>
> Cc: David Hildenbrand <david@kernel.org>
> ---
>   arch/arm64/mm/mmap.c | 10 +++++++++-
>   1 file changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/mmap.c b/arch/arm64/mm/mmap.c
> index 2e404441063b..f8993e3fa5d1 100644
> --- a/arch/arm64/mm/mmap.c
> +++ b/arch/arm64/mm/mmap.c
> @@ -87,7 +87,15 @@ pgprot_t vm_get_page_prot(vm_flags_t vm_flags)
>   
>   	/* Short circuit GCS to avoid bloating the table. */
>   	if (system_supports_gcs() && (vm_flags & VM_SHADOW_STACK)) {
> -		prot = pgprot_val(PAGE_GCS_RO);
> +		/*
> +		 * Allow PAGE_NONE for NUMA balancing, otherwise use
> +		 * PAGE_GCS_RO. The permission will be made writeable
> +		 * (PAGE_GCS) on a GCS fault.
> +		 */
> +		if (vm_flags & (VM_READ | VM_WRITE))

Could consider using VM_ACCESS_FLAGS here. For Shadow stacks we'd never 
expect executable properties.

> +			prot = pgprot_val(PAGE_GCS_RO);
> +		else
> +			prot = pgprot_val(protection_map[VM_NONE]);

change_protection() documents that "This is assuming that NUMA faults 
are handled using PROT_NONE. If an architecture makes a different 
choice, it will need further changes to the core."

So task_numa_work()->change_prot_numa()->change_protection() passes 
"newprot = PAGE_NONE".

Where is the vm_get_page_prot() called on that path where your change 
would make a difference?

I'd thing that vm_get_page_prot() gets only invoked through a "proper" 
mpotect() in 
mprotect_fixup()->vma_set_page_prot()...->vm_get_page_prot(), not for 
NUMA hinting that leaves the VMA untouched.


OTOH, I wonder whether mprotect(PROT_NONE) could trigger the path you 
thought of above.

-- 
Cheers,

David

