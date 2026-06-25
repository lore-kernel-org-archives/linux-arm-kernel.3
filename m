Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB468CDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 06:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ka/0fFwIrE8KYC5CIEgVfrLvIZWCEyFDPAvVUoaSKMk=; b=vHitUDouow24KxBGuxP2R1DHoB
	fA+Wgy8teaPwyQz7xNML5jfxaeMV5wfbgJR5mQUPUwoVCNazrfwbiZUA8L79Kt5XMQ6KGMfyBH6K3
	bqUfaKjLOA4WplG+94DS1oV6WOhqF17m018/tEGiyvL4+bnJsj2/PWhjdS8obCe7VtKDSoeorWYI7
	5GIxCMkxcVObBBzgyHuBYCzevM966h05Nroy1finZq6o5VBsT+eZCgOeWYjjvAmXuq6lVZt0ohmhq
	XEID2tZVMIOlfC9chnqaDBLh5TU8MSaYDnmRNij4/L7tzw/wpvLgFHHfuIxQIqoDud8YcqfD6/TSv
	c66PM13Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdiI-00000008iOh-0337;
	Thu, 25 Jun 2026 06:37:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcdiE-00000008iO7-2mUA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 06:37:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 27C862BCE;
	Wed, 24 Jun 2026 23:37:14 -0700 (PDT)
Received: from [10.164.19.14] (unknown [10.164.19.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2B7363F836;
	Wed, 24 Jun 2026 23:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782369438; bh=EEs9c0oR0ySt7qs8lyDve3TQdfPsDi4b1RDmHK97N2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cvB+/xs6BeUfI5Q+MqjEYE+/jyUJaCsPo3JqLGcjDJIEOO5eq8V6e62FPOC4la5MU
	 ASiXMlUF+QsKsIpEGNo1qlVHXUrPqK6NtC6W1d/wl03Setc1gjYV9m+gEx1WS8pqKF
	 E86vo+p2VLEx/Yb5YOwHQG8YIsV6M43EzueVm21Q=
Message-ID: <a6e410bd-7413-45f0-9033-a60cd5386512@arm.com>
Date: Thu, 25 Jun 2026 12:07:11 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap
 with contiguous memory
To: Wen Jiang <jiangwenxiaomi@gmail.com>, linux-mm@kvack.org,
 linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, urezki@gmail.com
Cc: baohua@kernel.org, Xueyuan.chen21@gmail.com, rppt@kernel.org,
 david@kernel.org, ryan.roberts@arm.com, anshuman.khandual@arm.com,
 ajd@linux.ibm.com, linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com,
 shanghaoqiang@xiaomi.com, Ard Biesheuvel <ardb@kernel.org>
References: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_233722_968654_6C4BBB1A 
X-CRM114-Status: GOOD (  16.88  )
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



On 18/06/26 2:17 pm, Wen Jiang wrote:
> This patchset accelerates ioremap, vmalloc, and vmap when the memory
> is physically fully or partially contiguous. Two techniques are used:
> 
> 1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
>    segments
> 2. Use batched mappings wherever possible in both vmalloc and ARM64
>    layers
> 
> Besides accelerating the mapping path, this also enables large
> mappings (PMD and cont-PTE) for vmap, which are currently not
> supported.
> 
> Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
> CONT-PTE regions instead of just one.
> 
> Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
> mapping logic between the ioremap and vmalloc/vmap paths, handling both
> CONT_PTE and regular PTE mappings. This prepares for the next patch.
> 
> Patch 4 extends the page table walk path to support page shifts other
> than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
> mappings. The function is renamed from vmap_small_pages_range_noflush()
> to vmap_pages_range_noflush_walk().
> 
> Patches 5-6 add huge vmap support for contiguous pages, including
> support for non-compound pages with pfn alignment verification.
> 
> On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
> the performance CPUfreq policy enabled, benchmark results:
> 
> * ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
> * vmalloc(1 MB) mapping time (excluding allocation) with
>   VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
> * vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)
> 
> Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.
> 

I am still a little nervous about doing vmap-huge by default.

We can play set_memory_* games on a vmap huge mapping partially, thus
forcing a pgtable split, and not all arches can handle a kernel pgtable
split.

For arm64, we can handle that with BBML2_NOABORT, but interestingly, in
change_memory_common, arch/arm64/mm/pageattr.c:

	area = find_vm_area((void *)addr);
	if (!area ||
	    ((unsigned long)kasan_reset_tag((void *)end) >
	     (unsigned long)kasan_reset_tag(area->addr) + area->size) ||
	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
		return -EINVAL;

Even before my change fcf8dda8cc48, we were bailing out on

!(area->flags & VM_ALLOC))

So on arm64 we haven't been supporting set_memory_* for vmap memory at all, because
it has VM_MAP set and not VM_ALLOC. Although we have a contradictory comment above
this code so not sure if this was intentional:

"Let's restrict ourselves to mappings created by vmalloc (or vmap)."


So either there is no user in the kernel doing vmap + set_memory_* (looks like it
by doing an LLM scan), or it is not fatal for set_memory_* to fail.

But even if no one does it now, technically the API allows it.

> 


