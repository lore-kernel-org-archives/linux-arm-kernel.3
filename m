Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73978CCD187
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 08:08:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yYc7Ntky0VhM+5TUm4oAzYSLC3sxKQ3YYjDPhPhkuZg=; b=zXth4HB2uLqKZB9FT9Ko7iih9M
	H53JBSraB4tRktjcQXyByInHpMl5RaQlBmo9LyICLLFMd4CLTSVVto7AhZmALKpTNid8qrpGOsA3Q
	WWY8Em186QNtS2zErKZcrQ/aUPB6X3fz33T7B6EXfItHRYDajCxLpc32NhAIAVINW+3wb5Io7N2+V
	yz9g3OsaqB7RUXnX2Kmd+AYOPVwCIBv/koGsThRdpC0AaQbtIYmgEI0LECuedYa5fgVxJOHep9hzs
	iXlki1otiqXsNPqz9fShWMqJIiPZGRSTf2U741NcnshgV9WNLJN+U09T7JrciigIj1hX2X3EWzor8
	2AdMcXUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8a5L-0000000FYzj-0CZo;
	Tue, 14 Oct 2025 08:08:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8a5I-0000000FYya-2iJm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 08:08:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 084D21A9A;
	Tue, 14 Oct 2025 01:08:32 -0700 (PDT)
Received: from [10.57.83.223] (unknown [10.57.83.223])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 831123F6A8;
	Tue, 14 Oct 2025 01:08:38 -0700 (PDT)
Message-ID: <f6e31f0d-a256-4d58-adfb-4d3d97dbaef2@arm.com>
Date: Tue, 14 Oct 2025 09:08:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: mm: relax VM_ALLOW_HUGE_VMAP if BBML2_NOABORT
 is supported
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, dev.jain@arm.com, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-3-yang@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251013232803.3065100-3-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_010840_731589_E0912C91 
X-CRM114-Status: GOOD (  23.12  )
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

On 14/10/2025 00:27, Yang Shi wrote:
> When changing permissions for vmalloc area, VM_ALLOW_HUGE_VMAP area is
> exclueded because kernel can't split the va mapping if it is called on
> partial range.
> It is no longer true if the machines support BBML2_NOABORT after commit
> a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full").
> So we can relax this restriction and update the comments accordingly.

Is there actually any user that benefits from this modified behaviour in the
current kernel? If not, then I'd prefer to leave this for Dev to modify
systematically as part of his series to enable VM_ALLOW_HUGE_VMAP by default for
arm64. I believe he's planning to post that soon.

Thanks,
Ryan

> 
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>  arch/arm64/mm/pageattr.c | 13 +++++++------
>  1 file changed, 7 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index c21a2c319028..b4dcae6273a8 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -157,13 +157,13 @@ static int change_memory_common(unsigned long addr, int numpages,
>  
>  	/*
>  	 * Kernel VA mappings are always live, and splitting live section
> -	 * mappings into page mappings may cause TLB conflicts. This means
> -	 * we have to ensure that changing the permission bits of the range
> -	 * we are operating on does not result in such splitting.
> +	 * mappings into page mappings may cause TLB conflicts on the machines
> +	 * which don't support BBML2_NOABORT.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> -	 * mappings are updated and splitting is never needed.
> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings if the systems don't support
> +	 * BBML2_NOABORT to guarantee that only page mappings are updated and
> +	 * splitting is never needed on those machines.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
>  	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -171,7 +171,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> +	    !(area->flags & VM_ALLOC) || ((area->flags & VM_ALLOW_HUGE_VMAP) &&
> +	    !system_supports_bbml2_noabort()))
>  		return -EINVAL;
>  
>  	if (!numpages)


