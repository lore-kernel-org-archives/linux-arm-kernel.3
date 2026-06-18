Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 213D9CD98ED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 14:21:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9GEnYG33F17bRUebP70R9oSvlshe6oh8TC7uZQQU+Q=; b=gaY84/1TRHGNSKqqT2vmlWUW40
	zJ0N0CKBITJeEz0ilVF6/kJEf/qzHN48YEMGkFmA7coCmQxYQulI1Rd2lMPeXbaT8mP2LgBBKoNL4
	U0/wAzCowXdocb9TMCwPGybNy/DIcJ64O7d2Jw1nGHH6FY1HIlnK4QZAZEmTTfJYBm9NPVQY57oPM
	gHPs//5CNOrTmI8NSEcmAyHLbxAXbSyoLuJDUeZo6zvtbHxJj2OH5k1UW0wL7cm43PDgZaZ3szdMn
	1X17l3cFlJQf2MrR9NcjLQTsK2DX2/csDJ0cbljWbIgm47UVulJRsQ1oSd4e7hlGEvAMM6KTYK6HU
	9Vha8qsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDca-00000001QLe-3pZo;
	Thu, 18 Jun 2026 14:21:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waDcX-00000001QL6-2pLK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 14:21:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CE6582A31;
	Thu, 18 Jun 2026 07:21:22 -0700 (PDT)
Received: from [10.1.25.219] (XHFQ2J9959-3.cambridge.arm.com [10.1.25.219])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E2E653F62B;
	Thu, 18 Jun 2026 07:21:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1781792487; bh=UJvB2cE80ENLkJAysf+TRElR2F2FZEG3i8BWI3trRbs=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=sWlfSJOn+ZN3AFuGhMupaPTBVGQl78THl7kWB9Qc5De6MyoVUtz9XpHh9KnAiKzg4
	 Y02lLu4SbsrvtwX8WrzRTqxIqiJsCDc+aIE51T47IlccPbJ+fNQ60k821ooOPlS157
	 0OP/izXFX/EO2mnDAhmcuCh0OKsW4NJuJPv/SUf0=
Message-ID: <07ab8b6f-cb58-4f8c-af7e-c99c2fb8933a@arm.com>
Date: Thu, 18 Jun 2026 15:21:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/6] arm64: mm: allow huge vmap permission adjustments
 with bbml2_no_abort
Content-Language: en-GB
To: =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 linux-arm-kernel@lists.infradead.org
Cc: linux-mm@kvack.org, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, David Hildenbrand <david@kernel.org>,
 "Mike Rapoport (Microsoft)" <rppt@kernel.org>,
 Ard Biesheuvel <ardb@kernel.org>, Christoph Lameter <cl@gentwo.org>,
 Yang Shi <yang@os.amperecomputing.com>, Brendan Jackman <jackmanb@google.com>
References: <20260611130144.1385343-1-abarnas@google.com>
 <20260611130144.1385343-3-abarnas@google.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260611130144.1385343-3-abarnas@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_072129_895869_EEA13A03 
X-CRM114-Status: GOOD (  22.91  )
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

On 11/06/2026 14:01, Adrian Barnaś wrote:
> Remove the protection against huge vmap permission adjustments on
> systems that support the bbml2_no_abort CPU feature.
> 
> Splitting live kernel VA section mappings into page mappings was
> restricted because it could cause TLB Conflict Aborts. This forced
> permission adjustments on memory allocated with VM_ALLOW_HUGE_VMAP to be
> rejected, resulting in performance drops (e.g., when enforcing rodata=on
> disables huge mappings).
> 
> The bbml2_no_abort feature (which mirrors the architectural guarantees of
> FEAT_BBML3) ensures that changing between table and block sizes without
> following a break-before-make sequence will not generate a TLB Conflict
> Abort. This hardware guarantee makes it safe to allow dynamic permission
> adjustments on huge vmap regions.

FYI Linu Cherian has a series that renames bbml2_no_abort to bbml3. I think he's
planning to post at -rc1. Would be good to rebase this on top once merged.

> 
> Signed-off-by: Adrian Barnaś <abarnas@google.com>
> ---
>  arch/arm64/mm/pageattr.c | 22 ++++++++++++++--------
>  1 file changed, 14 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 358d1dc9a576..88720bbba892 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -157,23 +157,29 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	}
>  
>  	/*
> -	 * Kernel VA mappings are always live, and splitting live section
> -	 * mappings into page mappings may cause TLB conflicts. This means
> -	 * we have to ensure that changing the permission bits of the range
> -	 * we are operating on does not result in such splitting.
> -	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> -	 * mappings are updated and splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
>  	 * covered by precisely one VM area that has the VM_ALLOC flag set.
>  	 */
>  	area = find_vm_area((void *)addr);
> +
>  	if (!area ||
>  	    ((unsigned long)kasan_reset_tag((void *)end) >
>  	     (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> +	    !(area->flags & VM_ALLOC))
> +		return -EINVAL;
> +
> +	/*
> +	 * Kernel VA mappings are always live, and splitting live section
> +	 * mappings into page mappings may cause TLB conflicts if bbml2_noabort
> +	 * is not present.
> +	 *
> +	 * While bbml2_noabort is not present disallow VM_ALLOW_HUGE_VMAP mappings
> +	 * to guarantee that only page mappings are updated and splitting is not
> +	 * needed.
> +	 */
> +	if (!system_supports_bbml2_noabort() && (area->flags & (VM_ALLOW_HUGE_VMAP)))

nit: no need for the parentheses around VM_ALLOW_HUGE_VMAP.

With that:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

>  		return -EINVAL;
>  
>  	if (!numpages)


