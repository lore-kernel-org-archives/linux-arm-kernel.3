Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F5521073CBC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 13:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JzUCF4dZc4FVvHawtM4ImJJGW0/tUC3i9o/6/Kd50YY=; b=x5+LMOt2XXrWNa1kdvFiOb2vkO
	nPtvBBCfpckUlyVI0TCcwpad+ZzrCvTKdUNumsDoSd1u5Fs8wP/hX4BYR9zAm4giNVQobMQw6zRhs
	yKWpjJm98GFEiPYTa6rIuVMpzn9zRsR3VO1NaXYZTHh39hbVfmxHeHS3ay1a5xAALAUzbxATX/9iv
	RrKLG08DT4SOqRWixwu8e9xMCq/1ZC5kVQMswaAaofMzRIHFR/gsMd77RUAlGm2IoWrwrwkRBxs/p
	44cXR6qQnqMPQlICM5H7MNDazIJ3TB66V1SA5IriJrXBDnzflFqsOGIw/IGgbjp7YSVpgDbHy295f
	ZqbPQW0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATC0-00000008w1Y-31DR;
	Wed, 08 Apr 2026 13:43:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wATBy-00000008vzq-0ip7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 13:43:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E4FE82BC4;
	Wed,  8 Apr 2026 06:43:28 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D5E783F641;
	Wed,  8 Apr 2026 06:43:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775655814; bh=APSRIzYq127UdDGuSl50AgJ/vrTdGsi6czgv23BVJwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UEJQ9anJgeUmtd8DTENXwcmCoXpPyLdKpcr/YAU0Jj6mkWVKnIiODmF+dex/3TNNX
	 wXQXaAwwFlush8K52iPu6GFVM4CkkwKpiNgpRLOQx2OIs8g/EL3pDJU/rnhQCBsD8t
	 SH0tpbksaZzJcLxe/QBKj/YnOcLLGCHXw5l0N6u0=
Date: Wed, 8 Apr 2026 14:43:29 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	will@kernel.org, mark.rutland@arm.com,
	Ard Biesheuvel <ardb@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Liz Prucka <lizprucka@google.com>,
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>,
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 01/13] arm64: Move the zero page to rodata
Message-ID: <adZbgYJqY6bisaoZ@arm.com>
References: <20260320145934.2349881-15-ardb+git@google.com>
 <20260320145934.2349881-16-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320145934.2349881-16-ardb+git@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_064338_327958_1709CBDF 
X-CRM114-Status: GOOD (  16.45  )
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

Hi Ard,

On Fri, Mar 20, 2026 at 03:59:36PM +0100, Ard Biesheuvel wrote:
> diff --git a/arch/arm64/kernel/vmlinux.lds.S b/arch/arm64/kernel/vmlinux.lds.S
> index 2964aad0362e..2d021a576e50 100644
> --- a/arch/arm64/kernel/vmlinux.lds.S
> +++ b/arch/arm64/kernel/vmlinux.lds.S
> @@ -229,6 +229,7 @@ SECTIONS
>  #endif
>  
>  	reserved_pg_dir = .;
> +	empty_zero_page = .;
>  	. += PAGE_SIZE;
>  
>  	swapper_pg_dir = .;
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index a6a00accf4f9..795743913ce5 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -66,9 +66,8 @@ long __section(".mmuoff.data.write") __early_cpu_boot_status;
>  
>  /*
>   * Empty_zero_page is a special page that is used for zero-initialized data
> - * and COW.
> + * and COW. Defined in the linker script.
>   */
> -unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)] __page_aligned_bss;
>  EXPORT_SYMBOL(empty_zero_page);

I looked at Sashiko's reports
(https://sashiko.dev/#/patchset/20260320145934.2349881-15-ardb+git@google.com)
and it has a point here that with MTE, map_mem() doesn't map the
empty_zero_page as Tagged in the for_each_mem_range() loop. The
subsequent cpu_enable_mte() will fail to initialise the tags. I think
this problem disappears with patch 11 where all the linear map is now
Tagged.

We either ignore it or we temporarily map the kernel as Tagged until the
linear alias is removed later:

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 795743913ce5..5290f7537074 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1175,7 +1175,7 @@ static void __init map_mem(pgd_t *pgdp)
 	 * so we should avoid them here.
 	 */
 	__map_memblock(pgdp, kernel_start, kernel_end,
-		       PAGE_KERNEL, NO_CONT_MAPPINGS);
+		       pgprot_tagged(PAGE_KERNEL), NO_CONT_MAPPINGS);
 	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
 	arm64_kfence_map_pool(early_kfence_pool, pgdp);
 }

-- 
Catalin

