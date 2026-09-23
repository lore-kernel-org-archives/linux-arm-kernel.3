Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C71A1C98316
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 21:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8M+UT7oIyha+XPFScsNzmi18L28ReOVLoc3XQz11GVc=; b=dkFkZ1HK/VV2GUOLiHpq4Ltq+u
	9OeNJTXbLGVBvIjeKYcUlpDsxX4CZ4iCBY0UsafIeCS5ue7tERwv9GiVlnA80jhj0ZjQui/QPK+WO
	hhXTARZ5r+lwNd0+uq5jCqmQhZlcDYGzvOCZRwKV6H3HXfRnLFqp7IefizmNDhFpofygPOElhV8v6
	k36licdi2RBYR1mYMDtRpK/jyu9ErwoXbI7rw1B0P1iZAM52PSRZCgsC0PXTu6WYJQ7QJo6kU75nf
	L+CDUuPGw1XgnnSTn+FYPwRjr+E3ZsE1pc+1e7U9exirsDnYcQFgNOpSYtxShlrk5PT9v3Jf53a1X
	oIhp+9AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UyF-00000009cZn-1fwO;
	Wed, 23 Sep 2026 21:57:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9UyE-00000009cZf-1uuQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 21:57:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C8E8C43F16;
	Wed, 23 Sep 2026 21:57:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E64F1F000FF;
	Wed, 23 Sep 2026 21:57:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790200661;
	bh=8M+UT7oIyha+XPFScsNzmi18L28ReOVLoc3XQz11GVc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=UlRCpIiuV4BL8JAAastxBfA9AqVs0ltc4wCol3mQOA0gLZjTyueHPUzDfkomWqfcu
	 vpR5AZPTtAEq8u8eSrNmhkr+1CMQCTroungYOMyBMU32U2CLz6KVXjlWqsLSI8bR6S
	 wP35XQ0D+0tN2X9HGw/1WDk6TQFINV9Nk3VDmxB8pRzxfOrvcjXU2KNpiq4TgP+2pl
	 ygpXh/ifYG/6W3V00QmeW4/BAs7W2rOQMFTUC0RlwS5eMPL8R/2vlpijuJKJ/F+yA+
	 MDkFmyaiUsbKOg26ABOc+B4X0L531YtjJ1pdd1hXGLbmJLpqc1OPuXWPqBU7xsqBdy
	 Cg9pPN+qNyR9w==
Message-ID: <f95ccf9c-c366-48d6-ac9f-c97546b9b543@kernel.org>
Date: Wed, 23 Sep 2026 23:57:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 03/10] mm/vmalloc: use pte_set_huge()/pte_clear_huge()
 for PTE-level block mappings
To: Barry Song <baohua@kernel.org>, Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
 urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
 ajd@linux.ibm.com, anshuman.khandual@arm.com, david@kernel.org,
 dev.jain@arm.com, jiangwen6@xiaomi.com, leo.yan@arm.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com, mpe@ellerman.id.au,
 npiggin@gmail.com, rppt@kernel.org, ryan.roberts@arm.com
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-4-jiangwen6@xiaomi.com>
 <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
Content-Language: fr-FR
From: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
In-Reply-To: <CAGsJ_4z-oqoxKynRr6mz0-5zZU_2NBnPkwz05CEEHHnwTyqa-Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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



Le 23/09/2026 à 23:38, Barry Song a écrit :
> On Wed, Sep 23, 2026 at 2:28 PM Wen Jiang <jiangwenxiaomi@gmail.com> wrote:
>>
>> vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
>> huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
>> the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
>> couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.
>>
>> Now that arm64 and powerpc/8xx provide pte_set_huge() and
>> pte_clear_huge(), add the generic fallbacks next to the existing
>> pmd/pud_set_huge() family and convert vmap_pte_range() and
>> vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
>> around the block-mapping paths are dropped, so PTE-level block mappings
>> now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
>> longer includes <linux/hugetlb.h>.
>>
>> The fallbacks exist only to keep the build working on architectures
>> without PTE-level block mapping support. They are unreachable there:
> 
> Since this is a `BUILD_BUG`, can the compiler simply eliminate the call?
> I guess the build would still pass even without the fallbacks, so this is
> more of a build-time check than something needed to keep the build passing?

Yes and that's what the compiler does, it eliminates the call.
The BUILD_BUG() is there to make sure it does eliminates the call.

The build won't pass without at least a forward declaration of the fallback.

In the old days when BUILD_BUG() didn't exist, the trick was the declare 
the function and never define it. But with that trick the problem is 
only detected at link time. With BUILD_BUG() the problem is detected at 
build time.

> 
> Am I missing something?
> 
>> the callers only run when arch_vmap_pte_range_map_size() or
>> arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
>> which requires an arch implementation. BUILD_BUG() makes that
>> explicit rather than silently doing nothing.
>>
>> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> 
> Nice to see that `#ifdef CONFIG_HUGETLB_PAGE` and
> `#include <linux/hugetlb.h>` are no longer needed in `vmalloc`.
> 
> Nothing concerns me except for the changelog issue mentioned above.
> Please double-check whether the changelog needs to be corrected.
> 
> Reviewed-by: Barry Song <baohua@kernel.org>


