Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A73CDE008
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 08:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BmCZQsSXsYfJR1VBDG7KzxqBWjPcEA12Brcw1hCcOr4=; b=ZCDX7eJ06cb5VA2Zum2NXENQnq
	O9u3lYOGdZolk+jCC+SQU5X1nmMdVm/zHVkBWTNXGnexgh2YH3ZqTLqxVlERgbzzW4u/0LLivDYIw
	Vp6wnGUf+pqWSIh/tj6IbAM7ERTr75pcyYmt+6YcQUUh2pEDY392xM0YYANIwYrkbLYf/0GKfzG+D
	JE+8OdaMbQyG5qIaiVdgYO1Yl2DvN0U7NLz23cs9kJ0pzTbXPDm37Q9rtHFbIIxkFVGM5BNv+SnJ+
	Htvv8lPDiIxlnsi66N1qPS2Cwdf3lwJZda62IlCGk9ae8Hk8oBYEd+OneeXQxN3zRnSB7fHQWXtbf
	tWuvtQ1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qL-0000000AqHw-3uxE;
	Fri, 26 Jun 2026 08:23:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd1qH-0000000AqCV-3S6l;
	Fri, 26 Jun 2026 08:23:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D242560122;
	Fri, 26 Jun 2026 08:23:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50D041F000E9;
	Fri, 26 Jun 2026 08:23:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782462196;
	bh=BmCZQsSXsYfJR1VBDG7KzxqBWjPcEA12Brcw1hCcOr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Q0iz61wX8mF1P/AT5iS0RguEKJoHnJbaf7dG2Xaw/wVTBi4SxVOBIVG9crP2DYbSS
	 9B5P3SKEr70iokd3WQ+CCaYah+LPidn/GAJZipn4uhCWTywct1mVsz3YZ/ftCiTQrE
	 qIKkvlTg8Pcl/XL4UTF/vAUtFR5Hf2bQTiCbSFFd3gE54FeQAVMkILpX728AtqliRP
	 9e4GR/CJT3k+Jc+rLFHTS9efO5Exl1wE+5HVjEfsZQBkSR7kbXAmF71M2tvjQui4IF
	 S6ag1cun9+W4Xim0JhLSIlJgXd4VVCduvxBVUGsqrgxZsPOvLnnwFdNX8U6/QzpZig
	 6wlgRknzBcAQg==
Date: Fri, 26 Jun 2026 11:23:05 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andrey Ryabinin <ryabinin.a.a@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Will Deacon <will@kernel.org>,
	Alexander Potapenko <glider@google.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>, kasan-dev@googlegroups.com,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org,
	linux-riscv@lists.infradead.org, loongarch@lists.linux.dev,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	WANG Xuerui <kernel@xen0n.name>
Subject: Re: [PATCH 0/6] treewide: remove unnecessary invalid range checks in
 memblock iteration loops
Message-ID: <aj426bA-YiOKt06m@kernel.org>
References: <20260621145919.1453-1-ekffu200098@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260621145919.1453-1-ekffu200098@gmail.com>
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

On Sun, Jun 21, 2026 at 11:59:10PM +0900, Sang-Heon Jeon wrote:
> The memblock API guarantees that for_each_mem_range() and
> for_each_mem_pfn_range() never return an invalid range, meaning start is
> always less than end.
> 
> Several memblock callers still have unnecessary invalid range checks in
> their loop bodies, so remove them.
> 
> Sang-Heon Jeon (6):
>   arm64: mm: remove unreachable invalid range check in
>     kasan_init_shadow()
>   LoongArch: remove unreachable invalid range check in kasan_init()
>   riscv: remove unreachable invalid range check in
>     create_linear_mapping_page_table()
>   riscv: remove unreachable invalid range check in kasan_init()
>   mm: remove unnecessary empty range check in
>     early_calculate_totalpages()
>   mm/hugetlb: remove unnecessary empty range check in
>     hugetlb_bootmem_set_nodes()

I queued this for inclusion into memblock tree.

>  arch/arm64/mm/kasan_init.c     | 3 ---
>  arch/loongarch/mm/kasan_init.c | 3 ---
>  arch/riscv/mm/init.c           | 2 --
>  arch/riscv/mm/kasan_init.c     | 3 ---
>  mm/hugetlb.c                   | 3 +--
>  mm/mm_init.c                   | 3 +--
>  6 files changed, 2 insertions(+), 15 deletions(-)
> 
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

