Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78A40D35690
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 08:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6r4Jon7CZ7YeQ1Z/oQhBvDL/rU8h1YhWVcs9bAvAfw=; b=2Ul7WCLRINlCHsW7a7oXg8dS+g
	SlmRBggFN2uuR76UFDfH2PWIcI+sSNQ8TV3O5FxYQZDqbBx+UozeVZFWbvGBD/7PG0Ycw+/YAzjKO
	T4mQ6U4/dvyJBLgFL6E6pB4cJs/8Xl+21fIvTas7M25SAFh/oS6Nsbmd+EO6SdRrqI4HQvB9KNj/D
	vNZOSLt2uh8fd+i1dPltwU8CY6snvpVFBPUxEx0M9agoHclrWmA9gaW05aPOfv4UIJFLCeN2w4j+h
	EPn0Y8TLyQyALBDhodeQiFiejPWcaL9BQOWthIGJI3kOSQZmbvKfn4jx3ydOCDRAZDnMWpnVDtk4x
	J3EAwxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0y8-0000000Ffix-42xf;
	Wed, 28 Jan 2026 08:32:08 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl0y5-0000000FfiQ-3K6u
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 08:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8D4CA4446F;
	Wed, 28 Jan 2026 08:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00DD4C4CEF1;
	Wed, 28 Jan 2026 08:31:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769589123;
	bh=MIu53TNJT0oYRJMg60HbP3DOZ0cZyH4Xd+NMgQs6Nec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bw/oUTvhB6gWXSudQa1AB0m+S9WAXgkPU6Njvqa4zFpA23y9kpL8zHHiXOOelOIuj
	 Wrwdx5cmCXxnvnBe9jGMNxWBZ+tMMVAkXuL6xoblNIfeQVy+h2ujR3bCqqjZEkheWb
	 TbviHdHpUdYiuSyCqAEYkFOnTVKFrRejH3+BBFuEOauCgYpiVM+ynpCT5njyqaPCSR
	 zdiy6aUHyDTeA4SlhajejnJDWljHJ8Mv+kpD6Ebf53Jh+SJQcuvFMMMWRd/csBMYxE
	 E0nxvWdxUbtfAnTpKYwZEp9lUiNfgdl4F7NvgH27OUXiVGasrmu31TrM/SQwi5e+Xt
	 Fnxac7mac9+UQ==
Date: Wed, 28 Jan 2026 10:31:51 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Jinjie Ruan <ruanjinjie@huawei.com>
Cc: ardb@kernel.org, leitao@debian.org, corbet@lwn.net,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	bp@alien8.de, mingo@kernel.org, pawan.kumar.gupta@linux.intel.com,
	feng.tang@linux.alibaba.com, kees@kernel.org, elver@google.com,
	arnd@arndb.de, fvdl@google.com, lirongqing@baidu.com,
	bhelgaas@google.com, bhe@redhat.com, dave.hansen@linux.intel.com,
	cfsworks@gmail.com, osandov@fb.com, sourabhjain@linux.ibm.com,
	jbohac@suse.cz, ryan.roberts@arm.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2] arm64: kexec: Add support for crashkernel CMA
 reservation
Message-ID: <aXnJd_Xghj9JLsnK@kernel.org>
References: <20260126081334.699147-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260126081334.699147-1-ruanjinjie@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_003205_877800_3EED9C03 
X-CRM114-Status: GOOD (  31.69  )
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

On Mon, Jan 26, 2026 at 04:13:34PM +0800, Jinjie Ruan wrote:
> Commit 35c18f2933c5 ("Add a new optional ",cma" suffix to the
> crashkernel= command line option") and commit ab475510e042 ("kdump:
> implement reserve_crashkernel_cma") added CMA support for kdump
> crashkernel reservation.
> 
> Crash kernel memory reservation wastes production resources if too
> large, risks kdump failure if too small, and faces allocation difficulties
> on fragmented systems due to contiguous block constraints. The new
> CMA-based crashkernel reservation scheme splits the "large fixed
> reservation" into a "small fixed region + large CMA dynamic region": the
> CMA memory is available to userspace during normal operation to avoid
> waste, and is reclaimed for kdump upon crash—saving memory while
> improving reliability.
> 
> So extend crashkernel CMA reservation support to arm64. The following
> changes are made to enable CMA reservation:
> 
> - Parse and obtain the CMA reservation size along with other crashkernel
>   parameters.
> - Call reserve_crashkernel_cma() to allocate the CMA region for kdump.
> - Include the CMA-reserved ranges for kdump kernel to use.
> - Exclude the CMA-reserved ranges from the crash kernel memory to
>   prevent them from being exported through /proc/vmcore.
> 
> Update kernel-parameters.txt to document CMA support for crashkernel on
> arm64 architecture.

I'm looking at this and at almost identical patch for riscv 
https://lore.kernel.org/all/20260126080738.696723-1-ruanjinjie@huawei.com
and it feels wrong that we have duplicate the code that excludes cma
ranges.
CMA ranges are known to the crash_core and I don't see why we cannot
exclude them there.
 
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> v2:
> - Free cmem in prepare_elf_headers()
> - Add the mtivation.
> ---
>  Documentation/admin-guide/kernel-parameters.txt |  2 +-
>  arch/arm64/kernel/machine_kexec_file.c          | 15 ++++++++++++++-
>  arch/arm64/mm/init.c                            |  5 +++--
>  3 files changed, 18 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 1058f2a6d6a8..36bb642a7edd 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -1119,7 +1119,7 @@ Kernel parameters
>  			It will be ignored when crashkernel=X,high is not used
>  			or memory reserved is below 4G.
>  	crashkernel=size[KMG],cma
> -			[KNL, X86, ppc] Reserve additional crash kernel memory from
> +			[KNL, X86, ARM64, ppc] Reserve additional crash kernel memory from
>  			CMA. This reservation is usable by the first system's
>  			userspace memory and kernel movable allocations (memory
>  			balloon, zswap). Pages allocated from this memory range
> diff --git a/arch/arm64/kernel/machine_kexec_file.c b/arch/arm64/kernel/machine_kexec_file.c
> index 410060ebd86d..ef6ce9aaba80 100644
> --- a/arch/arm64/kernel/machine_kexec_file.c
> +++ b/arch/arm64/kernel/machine_kexec_file.c
> @@ -48,7 +48,7 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  	u64 i;
>  	phys_addr_t start, end;
>  
> -	nr_ranges = 2; /* for exclusion of crashkernel region */
> +	nr_ranges = 2 + crashk_cma_cnt; /* for exclusion of crashkernel region */
>  	for_each_mem_range(i, &start, &end)
>  		nr_ranges++;
>  
> @@ -64,6 +64,12 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  		cmem->nr_ranges++;
>  	}
>  
> +	for (i = 0; i < crashk_cma_cnt; i++) {
> +		cmem->ranges[cmem->nr_ranges].start = crashk_cma_ranges[i].start;
> +		cmem->ranges[cmem->nr_ranges].end = crashk_cma_ranges[i].end;
> +		cmem->nr_ranges++;
> +	}
> +
>  	/* Exclude crashkernel region */
>  	ret = crash_exclude_mem_range(cmem, crashk_res.start, crashk_res.end);
>  	if (ret)
> @@ -75,6 +81,13 @@ static int prepare_elf_headers(void **addr, unsigned long *sz)
>  			goto out;
>  	}
>  
> +	for (i = 0; i < crashk_cma_cnt; ++i) {
> +		ret = crash_exclude_mem_range(cmem, crashk_cma_ranges[i].start,
> +					      crashk_cma_ranges[i].end);
> +		if (ret)
> +			goto out;
> +	}
> +
>  	ret = crash_prepare_elf64_headers(cmem, true, addr, sz);
>  
>  out:
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 524d34a0e921..28165d94af08 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -96,8 +96,8 @@ phys_addr_t __ro_after_init arm64_dma_phys_limit;
>  
>  static void __init arch_reserve_crashkernel(void)
>  {
> +	unsigned long long crash_base, crash_size, cma_size = 0;
>  	unsigned long long low_size = 0;
> -	unsigned long long crash_base, crash_size;
>  	bool high = false;
>  	int ret;
>  
> @@ -106,11 +106,12 @@ static void __init arch_reserve_crashkernel(void)
>  
>  	ret = parse_crashkernel(boot_command_line, memblock_phys_mem_size(),
>  				&crash_size, &crash_base,
> -				&low_size, NULL, &high);
> +				&low_size, &cma_size, &high);
>  	if (ret)
>  		return;
>  
>  	reserve_crashkernel_generic(crash_size, crash_base, low_size, high);
> +	reserve_crashkernel_cma(cma_size);
>  }
>  
>  static phys_addr_t __init max_zone_phys(phys_addr_t zone_limit)
> -- 
> 2.34.1
> 

-- 
Sincerely yours,
Mike.

