Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDE9CD6E42
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 12:26:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bw1QthjE+l6lxZ5Ru1nFCa4brM3SVW0KGygO/I39i0=; b=EVcPGxYEJtY+Ll9qjqtWIf1hjy
	TBT5QFVZCGBuD/RL0p4iVvaMRNv2J6euk4VJ+NhcJ53bU3Rhr3+3ZdZpFW3D+R7/740mB3I8gu3Px
	HLfOP2Mk4gMK+5N1Z8pbTacx4wI1Wx0UQepl4tjxrWwvHSIjjRB0FhaWqO0xfqXKx1/0yq1DR3py5
	5iC7FK68xoRFhU8ITCbCfqeHWgaGfH37pSkadkaU09UD/jllS0LOcx95No6hs9J6AH42VA0rM+HmM
	hLjVUSXTc0LeiWib0JaxfWipmlMdJclbW/7+8RqF0kCB9sC2EZTp/AvnSNSGHZ0K7FTPq8gSeAwB/
	MQZSC6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWOo-0000000ASnl-42Nx;
	Thu, 13 Nov 2025 12:26:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWOm-0000000ASnP-0Vfq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 12:26:01 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4303812FC;
	Thu, 13 Nov 2025 04:25:51 -0800 (PST)
Received: from [10.57.88.12] (unknown [10.57.88.12])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 99CE33F5A1;
	Thu, 13 Nov 2025 04:25:57 -0800 (PST)
Message-ID: <40682e84-edc1-4861-b078-a5067259cd73@arm.com>
Date: Thu, 13 Nov 2025 12:25:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64/mm: Document why linear map split failure upon
 vm_reset_perms is not problematic
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, catalin.marinas@arm.com, will@kernel.org
Cc: rppt@kernel.org, shijie@os.amperecomputing.com,
 yang@os.amperecomputing.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251112062716.64801-1-dev.jain@arm.com>
 <20251112062716.64801-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20251112062716.64801-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_042600_291098_2D757202 
X-CRM114-Status: GOOD (  28.45  )
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

On 12/11/2025 06:27, Dev Jain wrote:
> Consider the following code path:
> 
> (1) vmalloc -> (2) set_vm_flush_reset_perms -> (3) set_memory_ro/set_memory_rox
> -> .... (4) use the mapping .... -> (5) vfree -> (6) vm_reset_perms
> -> (7) set_area_direct_map.
> Or, it may happen that we encounter failure at (3) and directly jump to (5).
> 
> In both cases, (7) may fail due to linear map split failure. But, we care
> about its success *only* for the region which got successfully changed by
> (3). Such a region is guaranteed to be pte-mapped.

I keep tripping over this bit because I keep forgetting that even if the vmalloc
region whose permissions are being changed contains a huge mapping, we still
change the linear map page-by-page. So the portion of the linear map is
guarranteed to be pte-mapped.

> 
> The TLDR is that (7) will surely succeed for the regions we care about.

Appologies, we have definitely discussed this before, but I still can't quite
convince myself. Consider this:

static void vm_reset_perms(struct vm_struct *area)
{
	...

	/*
	 * Set direct map to something invalid so that it won't be cached if
	 * there are any accesses after the TLB flush, then flush the TLB and
	 * reset the direct map permissions to the default.
	 */
	set_area_direct_map(area, set_direct_map_invalid_noflush);
	_vm_unmap_aliases(start, end, flush_dmap);
	set_area_direct_map(area, set_direct_map_default_noflush);
}

If we have a situation where a region of 4M is allocated with vmalloc, which is
PMD-mapped, then only the second 2M has its permissions changed by
set_memory_ro[x], we end up with the first 2M not pte-mapped in the linear map
with default permissions and the second 2M pte-mapped in the linear with
non-default permissions.

The above code tries to set the whole vm area to invalid in the linear map
before issuing a TLB flush. This could fail for the first half of the area if we
are unable to allocate the PTE table to split to PTE (since
set_direct_map_default_noflush() is called page-by-page). So we end up with the
first half of the region valid with default permissions in the linear map and
the second half invalid when we do the TLB flush.

(The above code does it this way to a) reduce the number of TLB flushes to the
minimum  - the same one covers both the linear map and the vmalloc invalidation,
and b) to ensure there is no window when memory has both X and W aliases.

Given it is guarranteed that if any of the linear map is still valid, then it's
permissions are the default ones and the vmalloc alias was never changed to
non-default permissions for that part, then I agree this is safe.

I've convinced myself that this is all safe and correct. Sorry for the babble:

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index b4ea86cd3a71..dc05f06a47f2 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -185,6 +185,15 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 */
>  	if (rodata_full && (pgprot_val(set_mask) == PTE_RDONLY ||
>  			    pgprot_val(clear_mask) == PTE_RDONLY)) {
> +		/*
> +		 * Note: One may wonder what happens if the calls to
> +		 * set_area_direct_map() in vm_reset_perms() fail due ENOMEM on
> +		 * linear map split failure. Observe that we care about those
> +		 * calls to succeed *only* for the region whose permissions
> +		 * are not default. Such a region is guaranteed to be
> +		 * pte-mapped, because the below call can change those
> +		 * permissions to non-default only after splitting that region.
> +		 */
>  		for (i = 0; i < area->nr_pages; i++) {
>  			ret = __change_memory_common((u64)page_address(area->pages[i]),
>  					       PAGE_SIZE, set_mask, clear_mask);


