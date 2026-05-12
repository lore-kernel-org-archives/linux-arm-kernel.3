Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2D8FCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 15:22:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9RPNV9f2FkJa8SsKMvM0nSEQ+h9Bwc3cCq10hzKrpUc=; b=iBKeor8kJJYhOrojOK9chndFmN
	J+AtzRllWg4Rf/3lTEa+byOVRdthc6s/5IEO63tAl2+tSZzuX0tfeDJdJWZ10IGJtZYIAbPSkPTVz
	Jl8CtXYLdE5dkuPJ1hYqOgW8+MgNssF1Glp3QEy0lpph5A8gkoTQrlL25L7hy+IR7qqxI/Q4PToGi
	yiQbY7hqyGqoDN7HVwkujdjBN3v16IDX7zrDR3OGAxFgX/UK7zEPM8IN9Z/u1stXT3CF3+7jLTH4y
	H31/r+LbTmtCzBtYC7Hs9XNL713rQwlN3L91a6DaEPLZYSFLHBfakSuDVHthvGamdHqlunQKg/mgV
	5eEGjuvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMow6-0000000HCHO-37jo;
	Tue, 12 May 2026 15:22:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMow6-0000000HCGn-0J0Q
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 15:22:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5D306618A1;
	Tue, 12 May 2026 15:22:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEB83C2BCB0;
	Tue, 12 May 2026 15:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778599336;
	bh=0mQ9WUyf//P5pbvLH0sW41h1Dq7UtQ3QNXMnE8N+8AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S8BrcVysnQowfGUpu+ooPgWJynKE//pAzW6sSO7hDvSasTPlNgaVqtfpUGhH851R2
	 WmHO7Xdgy9S+x2SWRJU3mYy0Hy9nhugcyvSv2ZftkS291MX/rYqeLqgiVjJl6qqA5V
	 Eq9TR0XO5SGn1wb2tvYv9yzENhNHhw6GfogkwbcEzPHqBh1ZAj2HKKqW0A+9M5mdY4
	 aGgvW8eSC0BhkkvXQpo8t5ylz4xhWFpkgzWzL2dGJnCllyMlRYtwiSLmc4tzQ6gI3F
	 QcrtlGWqCdUQ0ePPvZGqgeN3fC4LN/Fg4sp0x+IuvE86fQ5APeTOg7AXs7YER+3U5D
	 UJYMiVWDvdgAw==
Date: Tue, 12 May 2026 16:22:10 +0100
From: Will Deacon <will@kernel.org>
To: Yang Shi <yang@os.amperecomputing.com>
Cc: catalin.marinas@arm.com, ryan.roberts@arm.com, cl@gentwo.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [v6 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Message-ID: <agNFou9cAavEILXl@willie-the-truck>
References: <20260316192933.3993042-1-yang@os.amperecomputing.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260316192933.3993042-1-yang@os.amperecomputing.com>
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

On Mon, Mar 16, 2026 at 12:29:33PM -0700, Yang Shi wrote:
> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
> rodata=full"), the direct mapping may be split on some machines instead
> keeping static since boot. It makes more sense to show the direct mapping
> use in /proc/meminfo than before.
> This patch will make /proc/meminfo show the direct mapping use like the
> below (4K base page size):
> DirectMap4K:       94792 kB
> DirectMap64K:     134208 kB
> DirectMap2M:     1173504 kB
> DirectMap32M:    5636096 kB
> DirectMap1G:    529530880 kB
> 
> Although just the machines which support BBML2_NOABORT can split the
> direct mapping, show it on all machines regardless of BBML2_NOABORT so
> that the users have consistent view in order to avoid confusion.
> 
> Although ptdump also can tell the direct map use, but it needs to dump
> the whole kernel page table. It is costly and overkilling. It is also
> in debugfs which may not be enabled by all distros. So showing direct
> map use in /proc/meminfo seems more convenient and has less overhead.
> 
> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
> ---
> v6: * Rebased to v7.0-rc3
>     * Rebased on top of Anshuman's v5 "arm64/mm: Enable batched TLB flush
>       in unmap_hotplug_range()"
>     * Used const for direct map type array per Will
>     * Defined PUD size for 16K/64K even though it is not used per Will
>     * Removed the misleading comment in init_pmd() per Will
> v5: * Rebased to v6.19-rc4
>     * Fixed the build error for !CONFIG_PROC_FS
> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>     * Used shorter name for the helpers and variables per Ryan
>     * Fixed accounting for memory hotunplug
> v3: * Fixed the over-accounting problems per Ryan
>     * Introduced helpers for add/sub direct map use and #ifdef them with
>       CONFIG_PROC_FS per Ryan
>     * v3 is a fix patch on top of v2
> v2: * Counted in size instead of the number of entries per Ryan
>     * Removed shift array per Ryan
>     * Use lower case "k" per Ryan
>     * Fixed a couple of build warnings reported by kernel test robot
>     * Fixed a couple of poential miscounts
> 
>  arch/arm64/mm/mmu.c | 197 +++++++++++++++++++++++++++++++++++++++-----
>  1 file changed, 176 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 5fb9a66f0754..7e95dbc69d57 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -29,6 +29,7 @@
>  #include <linux/mm_inline.h>
>  #include <linux/pagewalk.h>
>  #include <linux/stop_machine.h>
> +#include <linux/proc_fs.h>
>  
>  #include <asm/barrier.h>
>  #include <asm/cputype.h>
> @@ -171,6 +172,87 @@ static void init_clear_pgtable(void *table)
>  	dsb(ishst);
>  }
>  
> +enum dm_type {
> +	PTE,
> +	CONT_PTE,
> +	PMD,
> +	CONT_PMD,
> +	PUD,
> +	NR_DM_TYPE,
> +};
> +
> +#ifdef CONFIG_PROC_FS
> +static unsigned long dm_meminfo[NR_DM_TYPE];
> +
> +void arch_report_meminfo(struct seq_file *m)
> +{
> +	const char *size[NR_DM_TYPE];
> +
> +#if defined(CONFIG_ARM64_4K_PAGES)
> +	size[PTE] = "4k";
> +	size[CONT_PTE] = "64k";
> +	size[PMD] = "2M";
> +	size[CONT_PMD] = "32M";
> +	size[PUD] = "1G";
> +#elif defined(CONFIG_ARM64_16K_PAGES)
> +	size[PTE] = "16k";
> +	size[CONT_PTE] = "2M";
> +	size[PMD] = "32M";
> +	size[CONT_PMD] = "1G";
> +	size[PUD] = "64G";
> +#elif defined(CONFIG_ARM64_64K_PAGES)
> +	size[PTE] = "64k";
> +	size[CONT_PTE] = "2M";
> +	size[PMD] = "512M";
> +	size[CONT_PMD] = "16G";
> +	size[PUD] = "4T";
> +#endif
> +
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PTE], dm_meminfo[PTE] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[CONT_PTE],
> +			dm_meminfo[CONT_PTE] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PMD], dm_meminfo[PMD] >> 10);
> +	seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[CONT_PMD],
> +			dm_meminfo[CONT_PMD] >> 10);
> +	if (pud_sect_supported())
> +		seq_printf(m, "DirectMap%s:	%8lu kB\n",
> +			size[PUD], dm_meminfo[PUD] >> 10);
> +}
> +
> +static inline bool is_dm_addr(unsigned long addr)
> +{
> +	return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
> +}

Just use __is_lm_address()?

For better or worse, the arm64 arch code tends to talk about the "linear
map" rather than the "direct map", so a little bit of renaming would be
good (i.e. s/dm/lm/). I'm fine if you want to keep the user-visible
strings as "DirectMap".

Will

