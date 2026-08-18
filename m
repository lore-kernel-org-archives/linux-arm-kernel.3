Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEA03C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 14:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cwu9jgSx99aJy+siRwvjcYh450OUVDvHmhpw14uHA7s=; b=1TXec4xZ6OLe4zv0f785qfLFAC
	2t7GjEKsIYcQrX6RMl/qAK+mwBSHc5OhEbKjxPItJBKt/9fnE0r+V1nIj6t6zWhaQOTjI/1S4oGzr
	lT5teX1j7hKWLEpXhTgS/e/14Gi162HYnen4W13Ir6pHiQL1I0zPmVtMT3PlIgb904Pn9mRdvbGwZ
	0O0jfxrEx9YCr7mH/HmHGxObijADsVDAl+tKVHJunGtZB8jLguMqTO5+h7uEveKkUQFukn3t1OIq1
	XuqxBIlAoU/xE0ud8CLi0Wn02Ndf4YxGnEAj0QIx//hkW9W4SzCXdXJA4AV7ica6QN3nyyBUJBS8P
	+54/o9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKc3-000000089HV-1PYr;
	Tue, 18 Aug 2026 14:16:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wwKc1-000000089GS-1diL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 14:16:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AEEEF1516;
	Tue, 18 Aug 2026 07:16:16 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 872973F85F;
	Tue, 18 Aug 2026 07:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1787062580; bh=n2wKaJ7B0u+TOzRiWJjt2/jNzta6bxVIi/vLveRb+xM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EhPcYTo21sYUZH9+m6BG3jc3jRms3MDajrKqMQo3+J/Br/TT7Bx5wZisHVwYpinRs
	 vNmVPG9EUiMlKE4qll0V0DRk3wH2LxO3ltS9xRWlXNM6ILTsIElFg6wNQGUWdjxH6M
	 kKgzNHLQgUyEWcTSuxQrpZEPjKeGAT6HYZ7x/QZs=
Date: Tue, 18 Aug 2026 15:16:07 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: James Houghton <jthoughton@google.com>
Cc: Will Deacon <will@kernel.org>, Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Nikos Nikoleris <nikos.nikoleris@arm.com>,
	Linu Cherian <linu.cherian@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	David Hildenbrand <david@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Nanyong Sun <sunnanyong@huawei.com>, Yu Zhao <yuzhao@google.com>,
	Frank van der Linden <fvdl@google.com>,
	David Rientjes <rientjes@google.com>, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org
Subject: Re: [PATCH 10/18] arm64: Support hugetlb vmemmap optimization
Message-ID: <aoRpJxCMTQ-RvTKX@arm.com>
References: <20260708031129.3503195-1-jthoughton@google.com>
 <20260708031129.3503195-11-jthoughton@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260708031129.3503195-11-jthoughton@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260818_071621_834967_DD85843E 
X-CRM114-Status: GOOD (  16.01  )
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

On Wed, Jul 08, 2026 at 03:11:20AM +0000, James Houghton wrote:
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index b3afe0688919..cf4bd6bd7f11 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -259,6 +259,7 @@ config ARM64
>  	select USER_STACKTRACE_SUPPORT
>  	select VDSO_GETRANDOM
>  	select VMAP_STACK
> +	select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP if ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP

Nit: we try to keep this list alphabetically ordered.

>  	help
>  	  ARM 64-bit (AArch64) Linux support.
>  
> @@ -1607,6 +1608,17 @@ config ARCH_SPARSEMEM_ENABLE
>  	def_bool y
>  	select SPARSEMEM_VMEMMAP_ENABLE
>  
> +config ARM64_WANT_OPTIMIZE_HUGETLB_VMEMMAP
> +	bool "Enable support for HugeTLB Vmemmap Optimization (HVO)"
> +	default n

Nit: 'n' is the default already.

> +	depends on HUGETLB_PAGE && SPARSEMEM_VMEMMAP && ARM64_HW_AFDBM
> +	help
> +	  Enable support for HVO. When enabled, late-onlining of CPUs that do

I'd drop 'of', not sure how it reads better. Maybe just 'late CPUs ...
will not be onlined'.

> +	  not support features required by HVO will not be onlined if all boot
> +	  CPUs do have such support.
> +
> +	  If unsure, say N
> +
>  config HW_PERF_EVENTS
>  	def_bool y
>  	depends on ARM_PMU

-- 
Catalin

