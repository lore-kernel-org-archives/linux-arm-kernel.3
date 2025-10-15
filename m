Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13033CCD18E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 06:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bMz8FVtJcY2GE7liN4RGxuFk/amg60OKiAU3IoMdOSA=; b=lV0YUFz/42LgY0THpC2w+vBkmn
	Mcwtjf82ukuEZEnPRw+QiwI4Phuxn5DdtJWWXiN6L+k7q+/mEvwyUJp0EmA2gvx20Ml0yF9yNbX34
	8+cTSCDngvZTlV3MvuKxHffqnjP+Dt3/k4tYb2OoFif8b0hVWkQvZiS5Gps+3TACs+m7y8lHgIccP
	RZEq4cx3W0sZghBc/BYaOZQ0jxEtKKJjqpkiBsq92mP7/odjsLxUda9rh9o18e3owiG1vOOx2hMEF
	MSuc/LyhfWbYCAtndBz9Jb+zQijYpFgbYC5BwfS5oZOPrJNlLbo3KY1AkrLdEvc09P/5EtocLs4q+
	R8VTL5kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vLj-00000000e0O-1pHb;
	Wed, 15 Oct 2025 06:51:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8vLg-00000000dzx-3vdY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 06:51:02 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAF671A32;
	Tue, 14 Oct 2025 23:50:50 -0700 (PDT)
Received: from [10.163.67.182] (unknown [10.163.67.182])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2FE483F6A8;
	Tue, 14 Oct 2025 23:50:54 -0700 (PDT)
Message-ID: <eaa67b0d-e256-4db6-82e7-c4d56df70c09@arm.com>
Date: Wed, 15 Oct 2025 12:20:51 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: mm: relax VM_ALLOW_HUGE_VMAP if BBML2_NOABORT
 is supported
To: Yang Shi <yang@os.amperecomputing.com>, ryan.roberts@arm.com,
 cl@gentwo.org, catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251013232803.3065100-1-yang@os.amperecomputing.com>
 <20251013232803.3065100-3-yang@os.amperecomputing.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20251013232803.3065100-3-yang@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_235101_015734_F9EE0A2C 
X-CRM114-Status: GOOD (  20.85  )
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


On 14/10/25 4:57 am, Yang Shi wrote:
> When changing permissions for vmalloc area, VM_ALLOW_HUGE_VMAP area is
> exclueded because kernel can't split the va mapping if it is called on
> partial range.
> It is no longer true if the machines support BBML2_NOABORT after commit
> a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full").
> So we can relax this restriction and update the comments accordingly.
>
> Fixes: a166563e7ec3 ("arm64: mm: support large block mapping when rodata=full")
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
>   arch/arm64/mm/pageattr.c | 13 +++++++------
>   1 file changed, 7 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index c21a2c319028..b4dcae6273a8 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -157,13 +157,13 @@ static int change_memory_common(unsigned long addr, int numpages,
>   
>   	/*
>   	 * Kernel VA mappings are always live, and splitting live section
> -	 * mappings into page mappings may cause TLB conflicts. This means
> -	 * we have to ensure that changing the permission bits of the range
> -	 * we are operating on does not result in such splitting.
> +	 * mappings into page mappings may cause TLB conflicts on the machines
> +	 * which don't support BBML2_NOABORT.
>   	 *
>   	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> -	 * mappings are updated and splitting is never needed.
> +	 * Disallow VM_ALLOW_HUGE_VMAP mappings if the systems don't support
> +	 * BBML2_NOABORT to guarantee that only page mappings are updated and
> +	 * splitting is never needed on those machines.
>   	 *
>   	 * So check whether the [addr, addr + size) interval is entirely
>   	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -171,7 +171,8 @@ static int change_memory_common(unsigned long addr, int numpages,
>   	area = find_vm_area((void *)addr);
>   	if (!area ||
>   	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> +	    !(area->flags & VM_ALLOC) || ((area->flags & VM_ALLOW_HUGE_VMAP) &&
> +	    !system_supports_bbml2_noabort()))
>   		return -EINVAL;
>   
>   	if (!numpages)

This will conflict with my upcoming vmalloc-huge series, so best to leave it to me,
I already have this included :)


