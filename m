Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B8ABCD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 07:53:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zd0pyH4JyTVrhWiF/m1kbVJHvnAmP0kTBiQpkGCTOkE=; b=qGefPjDe/iW8IYH5WrZqjdjdUo
	q+VTEPo+ny69q8Prr0f7o3k3CEpceIw78nM6b31Djc9/oq90jQ7sxV8miSwwNsFegGq7yksaRW7S5
	UR0oE0U4VcrSUI3Fn5MVtqE0JWpgkT8ix817TEsCw27vuIGyxvPsPKAxoqi6IBgvnc8+/KETW5Uog
	ntFt6w/6BjSbuWrazjHgHpdGvWAIVysOxiAQisaZd0Pjb2zVobso1zZfxOdwsrY1prZKuOV+c2Tdb
	KKrKiVGVQdfgLQgWQBdy6kp7ApgmejDKeRV6lAUKN8l70in7VWJbaRSRLLUYFXY0cI+m9zUoTUObv
	AxNlgJvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhAf-0000000Ctxc-3Obu;
	Sat, 23 May 2026 07:53:21 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQhAd-0000000Ctwr-0s6u
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 07:53:20 +0000
Received: by mail-lf1-x136.google.com with SMTP id 2adb3069b0e04-5a40502e63bso8349128e87.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 23 May 2026 00:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779522796; x=1780127596; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zd0pyH4JyTVrhWiF/m1kbVJHvnAmP0kTBiQpkGCTOkE=;
        b=e2fkn7eTEWKxyIr/dqMrlwNFu8sTDUmpfnR+3MIXt7cfAzWw1kTN8nBgrMESg2FzQB
         kAgHTbkmU1HXlb7PlxsB6QrG36f7OOqDJTSHUOE397bp4CPqEquux1DtnBqfpNCrrZAR
         fWLHXKSN0Sk+FRoymTUvVKojyWIvTzVgRzABjifLVTdeYuv26T4zWnALflVGcJ89fixa
         OtBe8boPpiAwpS1SRtyIEixPhpjTuBTw1Th6h5FiU3BSRzB7FvzXeagRIbBniX5p1DYU
         Kv9D5MraRsHJCNMEccADGXkq7hH8dmSaZRCl8+YMcoOsHK5Zw2UJ+oPp0cD3veewBy3z
         1jtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779522796; x=1780127596;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zd0pyH4JyTVrhWiF/m1kbVJHvnAmP0kTBiQpkGCTOkE=;
        b=SLklAVfGYCbDT4rBnCEWcjY5NfeKW/Rf4yaZTp2BJYAqdraGwqXQJjexJsRmj6QGmV
         Qkju16OqEUu9+V7ms/8kIQV6eU7pVyMGMfZFYxMP10W6liLOEt5on/cutN5YUPGFj3L9
         DmjH/BjoeuVijxgfy/0FV0uJ1Kldne7oGwt4OQ6J7xsLtlkvCd7k1CLGaaGGiVYNRUuT
         NxTGASpKjS5VdDjUdPPEXBwOQpkGVtayFibcij6E0Nufu3fupb9kID9F5N8xzbb90LS2
         Bn0owHnxGvXYzWsBbBibXhljPgwBWyLp+nARz5bAd3340nyxDhJQlekOCFc4nnuk2uxk
         botQ==
X-Forwarded-Encrypted: i=1; AFNElJ9OCfpCxrMb5kWqCT3K4mYGEmWp1buSoPmzMvSn+6k00sGBalHpb5cv45UCVYqhLmbyJoy/cph7382O2fRJHQ1H@lists.infradead.org
X-Gm-Message-State: AOJu0YyfORibUld4PkAOtSyFotY+ISlGHl/8ZtHCI1vNFsTYdFCRI1CI
	lpMDn0VBb5MB0gjywxp8hHFv0vdgpYvVmEVjLbeOHQam5oNWXaYM1grw
X-Gm-Gg: Acq92OGp1sr525uLBGHVsWkGLeHvSYejodLcdN8Or6g2n2fZ+SQqng5aZZxhr45/dsQ
	Nqrr9ENKngIBfVRr2XdSaEhqgA8ezIxEfJCP2EewAWSBrNMRdOsLlQ+kSw+KXd5R7g2sVNPvx2b
	jfZLeLrYIwXVgpwVPMbLXUiBtkWadTSaf0jb7+3PIN2QgLADDf0EL8SDYJkSZtCv7IeZ+T7JVbn
	a6IVKPmuJVp7m6QF4mD11XvWiBHp6kI9wrjZGplfMewD8Laaw0rLl/PIOSsvod2NHPeX3HR8So9
	Shie/M3IsKSWQQADRKx1vAzN75h1V55WpM8SfrYJ5WC/e2uJSYhJGPBhp6Q92iuMECJACx5pU7d
	F5XMJe+o35C8y2p7YIBXQMbe67L/mTsiH8AjR6tpTwSvgaCdpg3X4LHletJtY5z+HMrWVw74P0j
	oJK01LVUY0vbUEkbHjISEyRUBGYnCjvZR3c3SefT/l1nBS1KYJpwtQ6cumHqXihg==
X-Received: by 2002:ac2:4312:0:b0:5a8:a754:4b57 with SMTP id 2adb3069b0e04-5aa323b28e6mr1722088e87.41.1779522796191;
        Sat, 23 May 2026 00:53:16 -0700 (PDT)
Received: from pc636 (host-90-238-28-226.mobileonline.telia.com. [90.238.28.226])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa32cb37a7sm981873e87.2.2026.05.23.00.53.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 00:53:15 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Sat, 23 May 2026 09:53:12 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, jiangwen6@xiaomi.com
Subject: Re: [PATCH v3 6/6] mm/vmalloc: align vm_area so vmap() can batch
 mappings
Message-ID: <ahFc6KfVIoI2w8Uu@pc636>
References: <20260522053146.83209-1-jiangwenxiaomi@gmail.com>
 <20260522053146.83209-7-jiangwenxiaomi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260522053146.83209-7-jiangwenxiaomi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_005319_268820_0107CCEA 
X-CRM114-Status: GOOD (  21.13  )
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

On Fri, May 22, 2026 at 01:31:46PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> Try to align the vmap virtual address to PMD_SHIFT or a
> larger PTE mapping size hinted by the architecture, so
> contiguous pages can be batch-mapped when setting PMD or
> PTE entries.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> ---
>  mm/vmalloc.c | 33 ++++++++++++++++++++++++++++++++-
>  1 file changed, 32 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 50642246f4d40..040d400928aab 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3620,6 +3620,37 @@ static int vmap_batched(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static struct vm_struct *get_aligned_vm_area(unsigned long size,
> +		unsigned long flags, const void *caller)
> +{
> +	struct vm_struct *vm_area;
> +	unsigned int shift;
> +
> +	/* Try PMD alignment for large sizes */
> +	if (size >= PMD_SIZE) {
> +		vm_area = __get_vm_area_node(size, PMD_SIZE, PAGE_SHIFT, flags,
> +				VMALLOC_START, VMALLOC_END,
> +				NUMA_NO_NODE, GFP_KERNEL, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Try CONT_PTE alignment */
> +	shift = arch_vmap_pte_supported_shift(size);
> +	if (shift > PAGE_SHIFT) {
> +		vm_area = __get_vm_area_node(size, 1UL << shift, PAGE_SHIFT, flags,
> +				VMALLOC_START, VMALLOC_END,
> +				NUMA_NO_NODE, GFP_KERNEL, caller);
> +		if (vm_area)
> +			return vm_area;
> +	}
> +
> +	/* Fall back to page alignment */
> +	return __get_vm_area_node(size, PAGE_SIZE, PAGE_SHIFT, flags,
> +			VMALLOC_START, VMALLOC_END,
> +			NUMA_NO_NODE, GFP_KERNEL, caller);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3658,7 +3689,7 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	size = (unsigned long)count << PAGE_SHIFT;
> -	area = get_vm_area_caller(size, flags, __builtin_return_address(0));
> +	area = get_aligned_vm_area(size, flags, __builtin_return_address(0));
>  	if (!area)
>  		return NULL;
>  
> -- 
> 2.34.1
> 
This one LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

