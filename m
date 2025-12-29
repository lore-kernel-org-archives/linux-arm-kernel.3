Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4B77D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 06:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z24o1bT1ugcsbBAq+DlkXsAbqHC8CQOJHAmR6N3rhQg=; b=iO3JawIzBITyZUXj4S4tBuEvfT
	biuPsuZJl8N05iBeif7vAXafRFk5yEFw5ayXRu6nTXkHOLgzmhnwe5Cw5LhplkDEXf4V16AAKEMkK
	R6xvKs0aNW4pXlB3J76oDdQQLivR49QUd0qM+BpwdQChlcrLBAH6WIbwchF6m6wPbTEfBr7fY5WjP
	VNeclyKUShSdx42nt5Yi+rrvg9pM2ZsjzU6NJGqTSlMszKPJh5KEdy+rbHZOJba5bZKYlAiK5FHbC
	oTX5xNpMxajCvYhvGqaQSFx2iiG2jK8JOqZR3SmvJY6zy01w3qryATx7npDX3/d/THTIixCA9ajwQ
	WxfDuK1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7Dr-00000003Ova-14VR;
	Mon, 29 Dec 2025 06:59:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va7Dp-00000003Ov6-2DJB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 06:59:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4110343E5F;
	Mon, 29 Dec 2025 06:59:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 013C0C4CEF7;
	Mon, 29 Dec 2025 06:59:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766991556;
	bh=o0wgikOuKph/UYuKT9+K1YO24u8iftLUAb48sk35Re0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LX6iWUywtDOVwU3j9KaL9yXGKfNvvYoCb2qlBXzbFyPsnG2vGbJfpde+T2rxhLMi6
	 2QkUnuWKjSpsWFFAsUzRcNl579W7HN0vsLwnx0uIdqDYc9pemeno7sciMWkg6kcTI/
	 4/xSfoSw/2dLsoppKWxsEq5G+zDhlITLjIbe3xtQyDd3VX8EaYH8uBU7LN15p9UqQL
	 FVs9iNnIt/1eTm9Frc5o3vv9Yv1CER2nZ+JljzygBIBdOv7xURTNYUtEzZKhlQ+g8z
	 HHaOgTGPYzoj7al1VV0VjV+KDjSPLts8cDtlXEe/iJFkjLIODRbrq6dVEwqGplAjPU
	 8vCr0gtMZU5XA==
Date: Mon, 29 Dec 2025 08:59:05 +0200
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
Subject: Re: [PATCH 20/26] mm/sparse: Register information into meminspect
Message-ID: <aVImuURq0FXsfsrp@kernel.org>
References: <20251119154427.1033475-1-eugen.hristev@linaro.org>
 <20251119154427.1033475-21-eugen.hristev@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251119154427.1033475-21-eugen.hristev@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_225917_584255_6215D3BD 
X-CRM114-Status: GOOD (  16.95  )
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

On Wed, Nov 19, 2025 at 05:44:21PM +0200, Eugen Hristev wrote:
> Annotate vital static information into meminspect:
>  - mem_section
> 
> Information on these variables is stored into inspection table.
> 
> Register dynamic information into meminspect:
>  - section
>  - mem_section_usage
> 
> This information is being allocated for each node, so call
> memblock_mark_inspect to mark the block accordingly.
> 
> Signed-off-by: Eugen Hristev <eugen.hristev@linaro.org>
> ---
>  mm/sparse.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/mm/sparse.c b/mm/sparse.c
> index 17c50a6415c2..80530e39c8b2 100644
> --- a/mm/sparse.c
> +++ b/mm/sparse.c
> @@ -15,6 +15,7 @@
>  #include <linux/swapops.h>
>  #include <linux/bootmem_info.h>
>  #include <linux/vmstat.h>
> +#include <linux/meminspect.h>
>  #include "internal.h"
>  #include <asm/dma.h>
>  
> @@ -30,6 +31,7 @@ struct mem_section mem_section[NR_SECTION_ROOTS][SECTIONS_PER_ROOT]
>  	____cacheline_internodealigned_in_smp;
>  #endif
>  EXPORT_SYMBOL(mem_section);
> +MEMINSPECT_SIMPLE_ENTRY(mem_section);
>  
>  #ifdef NODE_NOT_IN_PAGE_FLAGS
>  /*
> @@ -253,6 +255,7 @@ static void __init memblocks_present(void)
>  		size = sizeof(struct mem_section *) * NR_SECTION_ROOTS;
>  		align = 1 << (INTERNODE_CACHE_SHIFT);
>  		mem_section = memblock_alloc_or_panic(size, align);
> +		memblock_mark_inspect(virt_to_phys(mem_section), size);

Why not meminspect_register_va()?

>  	}
>  #endif
>  
> @@ -343,6 +346,7 @@ sparse_early_usemaps_alloc_pgdat_section(struct pglist_data *pgdat,
>  		limit = MEMBLOCK_ALLOC_ACCESSIBLE;
>  		goto again;
>  	}
> +	memblock_mark_inspect(virt_to_phys(usage), size);
>  	return usage;
>  }
>  
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.

