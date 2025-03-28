Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E17DC28B20
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Mar 2025 15:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ig+x6CjODKOqVqXmoIwB6avCNmqqNEpXWOwXRDh5eNs=; b=opShHoLyeFGFmAGEvHLfC9/GtO
	lG39tk1dlyXRLxg3xdNp4HRsrLuMQuITSvH12k+sJGAdyPSAZGVA1sqiYcnheHVOKwPZmOoNInX8L
	c2EKRIhpxnzugQ0ZF134/O1UkXpyr1UibLvNWV1NoFBlws+Lqch8uPvQ9PLJlvfc54W8bsTmKFfSh
	MoyTCJICaedeOxhba4EY8JpHunC6+/WaUQklWPYCes/Yi8f0l4mIt84XdpXA93x7Thysoq2HwVFHj
	l549kpYwbQRazrQm+/m1FMFLLkUmD9PUUXZI06mMp1RoGPiPynJvSEhvWIpZWMFiFKywSJt/HPUPn
	nJDrpXVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyBQW-0000000Dji1-2POJ;
	Fri, 28 Mar 2025 15:15:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyArZ-0000000Dcwf-2Aq5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Mar 2025 14:39:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F04B71691;
	Fri, 28 Mar 2025 07:39:16 -0700 (PDT)
Received: from [10.57.87.112] (unknown [10.57.87.112])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 137103F58B;
	Fri, 28 Mar 2025 07:39:09 -0700 (PDT)
Message-ID: <54db9fe1-7115-476e-b838-80aa68aabe7e@arm.com>
Date: Fri, 28 Mar 2025 14:39:08 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64: pageattr: Explicitly bail out when changing
 permissions for vmalloc_huge mappings
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: gshan@redhat.com, rppt@kernel.org, steven.price@arm.com,
 suzuki.poulose@arm.com, tianyaxiong@kylinos.cn, ardb@kernel.org,
 david@redhat.com, urezki@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250328062103.79462-1-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250328062103.79462-1-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250328_073913_605296_E24BF78A 
X-CRM114-Status: GOOD (  20.07  )
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

On 28/03/2025 02:21, Dev Jain wrote:
> arm64 uses apply_to_page_range to change permissions for kernel VA mappings,
> which does not support changing permissions for leaf mappings. This function

I think you mean "block" mappings here? A leaf mapping refers to a page table
entry that maps a piece of memory at any level in the pgtable (i.e. a present
entry that does not map a table).

A block mapping is an Arm ARM term used to mean a leaf mapping at a level other
than the last level (e.g. pmd, pud). A page mapping is an Arm ARM term used to
mean a leaf mapping at the last level (e.g. pte).

> will change permissions until it encounters a leaf mapping, and will bail

block mapping

> out. To avoid this partial change, explicitly disallow changing permissions
> for VM_ALLOW_HUGE_VMAP mappings.

It will also emit a warning. Since there are no reports of this triggering, it
implies that there are currently no cases of code doing a vmalloc_huge()
followed by partial permission change, at least on arm64 (I'm told BPF does do
this on x86 though). But this is a footgun waiting to go off, so let's detect it
early and avoid the possibility of permissions in an intermediate state. (It
might be worth wordsmithing this into the commit log).

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>

With the commit log fixed up:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/mm/pageattr.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index 39fd1f7ff02a..8337c88eec69 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -96,7 +96,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Those are guaranteed to consist entirely of page mappings, and
> +	 * Disallow VM_ALLOW_HUGE_VMAP vmalloc mappings so that
>  	 * splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
> @@ -105,7 +105,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    !(area->flags & VM_ALLOC))
> +	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)


