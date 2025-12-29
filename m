Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C55E1E8FDB1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 06:56:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUQhxxwcd6BVMFmEMYGpfB0bAUQY48KpU7wfuCLlszc=; b=K9A2ARdhGUh2agXWjGi2oD4quL
	mU/A2ynLF1PqGj5rh5mIt+MrxPrEHcPeM9sxUO1qG/w0yxuZqLV7iDySsaaJ+syDoe+rqn36JerCf
	a+cKB+fiQ87KeoIvP9G/A7dZZiTpr54G+C46Wvk6kfXDT+Kcizmo5VdM7Y3FMGAQ7xSlVNrlWKz/m
	JmfgWBJXe9VLH8y7idTezmHDJ3bAUrRYWJcGZcsvUrVgX/sX8hDU6EDRTzDK2Cu96rsZN7gU6gSUV
	1954IFD7mowEnikrqEpZzCsrV008+apyYiAQLKBPSiGXZcxyQNM96JE0qK8+Y6rbvlh9CH22xbMM5
	1MUBxxtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7BQ-00000003Ogi-28Bq;
	Mon, 29 Dec 2025 06:56:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7BP-00000003OgZ-1VXP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 06:56:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B8226000A;
	Mon, 29 Dec 2025 06:56:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29BF0C4CEF7;
	Mon, 29 Dec 2025 06:56:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766991404;
	bh=2L8Mk5WlWQlOwro+lzGpqFESnl7Z8ZzqFs5ya2vJbDQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cUntOqUx88jhIghah0BtHV123Tman5cFwnDzVOOMvAYksaJNRnWq3CjmRgean4N04
	 iqBLRzsOdMTU3ApunWnlX+Bxep76Drrj3bbErnOEUHKj70mMeVRFGcbNvY3xbUz2aR
	 WAj1+AQac4O+dn36O7LVQJUH2awM38yGe/04UBJ3WJbWcANLHTDv1LS+mLBD8qIIq5
	 /IsjB1NXRI9IJzDgLplHWc7WmtEBGwCqwThO1YR7/smhHyy8w0NEidVyVyHCbhTFKB
	 ot1wOsmC7rNnr2/wlnCU8Nn7gUTB/bs0BUNZCqANofZZ2Jp49o7HJ6H/nXcX0sXTiN
	 DODwXttylU7BQ==
Date: Mon, 29 Dec 2025 08:56:34 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Eugen Hristev <eugen.hristev@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, tglx@linutronix.de, andersson@kernel.org,
	pmladek@suse.com, rdunlap@infradead.org, corbet@lwn.net,
	david@redhat.com, mhocko@suse.com, tudor.ambarus@linaro.org,
	mukesh.ojha@oss.qualcomm.com, linux-arm-kernel@lists.infradead.org,
	linux-hardening@vger.kernel.org, jonechou@google.com,
	rostedt@goodmis.org, linux-doc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-arch@vger.kernel.org, tony.luck@intel.com, kees@kernel.org
Subject: Re: [PATCH 18/26] mm/memblock: Add MEMBLOCK_INSPECT flag
Message-ID: <aVImIneFgOngYdSn@kernel.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-19-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-19-eugen.hristev@linaro.org>
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

Hi Eugen,

On Wed, Nov 19, 2025 at 05:44:19PM +0200, Eugen Hristev wrote:
> This memblock flag indicates that a specific block is registered
> into an inspection table.
> The block can be marked for inspection using memblock_mark_inspect()
> and cleared with memblock_clear_inspect()

Can you explain why memblock should treat memory registered for inspection
differently?

> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  include/linux/memblock.h |  7 +++++++
>  mm/memblock.c            | 36 ++++++++++++++++++++++++++++++++++++
>  2 files changed, 43 insertions(+)
> 
> diff --git a/include/linux/memblock.h b/include/linux/memblock.h
> index 221118b5a16e..c3e55a4475cf 100644
> --- a/include/linux/memblock.h
> +++ b/include/linux/memblock.h
> @@ -51,6 +51,10 @@ extern unsigned long long max_possible_pfn;
>   * memory reservations yet, so we get scratch memory from the previous
>   * kernel that we know is good to use. It is the only memory that
>   * allocations may happen from in this phase.
> + * @MEMBLOCK_INSPECT: memory region is annotated in kernel memory inspection
> + * table. This means a dedicated entry will be created for this region which
> + * will contain the memory's address and size. This allows kernel inspectors
> + * to retrieve the memory.
>   */
>  enum memblock_flags {
>  	MEMBLOCK_NONE		= 0x0,	/* No special request */
> @@ -61,6 +65,7 @@ enum memblock_flags {
>  	MEMBLOCK_RSRV_NOINIT	= 0x10,	/* don't initialize struct pages */
>  	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
>  	MEMBLOCK_KHO_SCRATCH	= 0x40,	/* scratch memory for kexec handover */
> +	MEMBLOCK_INSPECT	= 0x80,	/* memory selected for kernel inspection */
>  };
>  
>  /**
> @@ -149,6 +154,8 @@ unsigned long memblock_addrs_overlap(phys_addr_t base1, phys_addr_t size1,
>  bool memblock_overlaps_region(struct memblock_type *type,
>  			      phys_addr_t base, phys_addr_t size);
>  bool memblock_validate_numa_coverage(unsigned long threshold_bytes);
> +int memblock_mark_inspect(phys_addr_t base, phys_addr_t size);
> +int memblock_clear_inspect(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_hotplug(phys_addr_t base, phys_addr_t size);
>  int memblock_clear_hotplug(phys_addr_t base, phys_addr_t size);
>  int memblock_mark_mirror(phys_addr_t base, phys_addr_t size);
> diff --git a/mm/memblock.c b/mm/memblock.c
> index e23e16618e9b..a5df5ab286e5 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -17,6 +17,7 @@
>  #include <linux/seq_file.h>
>  #include <linux/memblock.h>
>  #include <linux/mutex.h>
> +#include <linux/meminspect.h>
>  
>  #ifdef CONFIG_KEXEC_HANDOVER
>  #include <linux/libfdt.h>
> @@ -1016,6 +1017,40 @@ static int __init_memblock memblock_setclr_flag(struct memblock_type *type,
>  	return 0;
>  }
>  
> +/**
> + * memblock_mark_inspect - Mark inspectable memory with flag MEMBLOCK_INSPECT.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_mark_inspect(phys_addr_t base, phys_addr_t size)
> +{
> +	int ret;
> +
> +	ret = memblock_setclr_flag(&memblock.memory, base, size, 1, MEMBLOCK_INSPECT);
> +	if (ret)
> +		return ret;
> +
> +	meminspect_lock_register_pa(base, size);
> +
> +	return 0;
> +}
> +
> +/**
> + * memblock_clear_inspect - Clear flag MEMBLOCK_INSPECT for a specified region.
> + * @base: the base phys addr of the region
> + * @size: the size of the region
> + *
> + * Return: 0 on success, -errno on failure.
> + */
> +int __init_memblock memblock_clear_inspect(phys_addr_t base, phys_addr_t size)
> +{
> +	meminspect_lock_unregister_pa(base, size);
> +
> +	return memblock_setclr_flag(&memblock.memory, base, size, 0, MEMBLOCK_INSPECT);
> +}
> +
>  /**
>   * memblock_mark_hotplug - Mark hotpluggable memory with flag MEMBLOCK_HOTPLUG.
>   * @base: the base phys addr of the region
> @@ -2704,6 +2739,7 @@ static const char * const flagname[] = {
>  	[ilog2(MEMBLOCK_RSRV_NOINIT)] = "RSV_NIT",
>  	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
>  	[ilog2(MEMBLOCK_KHO_SCRATCH)] = "KHO_SCRATCH",
> +	[ilog2(MEMBLOCK_INSPECT)] = "INSPECT",
>  };
>  
>  static int memblock_debug_show(struct seq_file *m, void *private)
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

