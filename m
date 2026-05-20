Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46E28CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 May 2026 07:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+FrgwpGM2Ey9DAqvdXlbg9+ub1m+pVkWeD4ut37zc88=; b=TsqTqvYdHJ9MPY65cZu3fneIKy
	S46noDNk30mnSkC0ae/c7ZJZVi+lUZUA8tmLbTnbFSbc5IY0DFM4+ZeW77NDiavnC8PjyLwMW65+F
	51Lad2cH2m8HKLecPLUMh/L/RwczrqrDQ94qc3o1SbwuzvwSIEC0KPRwyWtT1NX6wvwykDAGvR7QD
	3nihaBZoYpFgoDzg2ubaSAZdJw1ctRttCA0tu9gcAp9ZOqh/w3jZYwZvwJCrlBABe9ft+nj2CEDRa
	YaSkZJvEmlYbsbzOvBFnwu5hF496L+r8BWBrG0gk6q+6jzPUbXNOLjnVUAQl2zNGbMcjcAgrQ+xs2
	OLTRqhmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbPr-00000003o2m-2oWg;
	Wed, 20 May 2026 07:32:31 +0000
Received: from mail-lf1-x133.google.com ([2a00:1450:4864:20::133])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPbPm-00000003o1P-3A7i
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 May 2026 07:32:30 +0000
Received: by mail-lf1-x133.google.com with SMTP id 2adb3069b0e04-5a8891f0c51so5014166e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 20 May 2026 00:32:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779262345; x=1779867145; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=+FrgwpGM2Ey9DAqvdXlbg9+ub1m+pVkWeD4ut37zc88=;
        b=eJyHnL3J37CinMUp9Hq2vjB0eRGWfTCklRwTyVjSXnRZhbfQuTPZScbgUViuzQ7BpO
         apmtMkUgFikyLhuGzzfZ/2IGRjXTIwvRaPuIsfDSiM9eSHv2V3p9Maq6qO/0L6L3uF2w
         uwzvhNG3ZKrSdY2KyLjwzdOnYLds/+BlY+DQVeeaTGS7XISe08DQnWxZcKAAAk6Vq/TT
         mROJwiD2dGuCQ7QKXHQQg9LdCXiuRcw0nKDozhBAu81DQYa8PI/cOcQhY/e28sm4UnTO
         YXDnCaNLgv8e9kwbQ1UxY2yvVPRjX0r2sXa0WhuJ2LmexczAP6qZc7hAUuTPJj+4/xR9
         8s2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779262345; x=1779867145;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+FrgwpGM2Ey9DAqvdXlbg9+ub1m+pVkWeD4ut37zc88=;
        b=e2uiElQW5zHsnMgXurmrBQZcaWx0ZPLNxMQc+DyJhLc6ihXWpJo7QjCcCOR/MC13e1
         tgZ8CPd79VVmsbcYoXpqKIFPAEV4iewrWgauYp5yo/6A90+zbVs9OiHLg28mmEOaVET5
         4ZBPfVcpmelzOrmu0yL8DoOLoXfwNVhs53u9F7i5z4v4kR24ZXuk9tEyZ7He8DGemw9S
         i+t8pxgE5S14pDae4hZ9gCX48Tjk0qPE2K5EFAqGXISbM7DFAqATPtIAZvCD4WNqGDlS
         Z4jd5le7bImOlJkMe6Jcu83Yye9j6J0JtpRfbUW+wFbhNknQCoi19ZpCE1JtpjXKDi+b
         DRoA==
X-Forwarded-Encrypted: i=1; AFNElJ/aeFJiCHkP5ZeACSpAsCC4EPit9/LYGuqOAKWv5g/vYYbUArvGaRozVzefcjSvzz31x7Py9q7z2cREgzJhErfk@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3PM9fZYKbnyS0ZCyfe3sjZH3tkOB4O7BX3rDmiwQKTwBcqU3b
	k1zuvLCbtZ2M/GwHBi6t5RHxfjwAQAiyQoReu4P2x6MFGQpN33j6lmjC
X-Gm-Gg: Acq92OFNeVPlnQuoRVeuLAjoOzvKu+ISgMKi8C6BweThsuGl1TPss9dIgWSq1r2cfQE
	x9Qx2NGOXXFM5HM2giFz19+b8iejvrXuuz9JDr+pG/DkYphsHipydV5DLnFPWXe1a34MG4owi0m
	MRUyoslqjGcSNX3uBOVqtFu2NEnfR3o1CUJ3DuRm9KD2U9wpmoBD1wK/UQgBUZxw0wAIdN4tTZq
	LVCuVBHzbzQ/4jpaL6cTA5bquh2aqb6WfQn54my9IzQ0Bpdxhb0zcXi41+as4OKm5QdgO5+lwRf
	SNt/QpoRfmqOXdOPFRBGVWQge2cLcqWp6YBxuVOkFtrTcKW5VjA/NTJb8xzEN7cyWgHR0E9SUL6
	tMnW3vVgdizb6t9EETBoRhUo8mBHYElqRfbVnBDvnbON62SXsVeIG33638BwtLK5K
X-Received: by 2002:a05:6512:1291:b0:5a3:fcb2:c6a1 with SMTP id 2adb3069b0e04-5aa0e614047mr7302936e87.13.1779262344292;
        Wed, 20 May 2026 00:32:24 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a9164bc462sm4733129e87.45.2026.05.20.00.32.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 00:32:23 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 20 May 2026 09:32:22 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com, will@kernel.org, akpm@linux-foundation.org,
	urezki@gmail.com, baohua@kernel.org, Xueyuan.chen21@gmail.com,
	dev.jain@arm.com, rppt@kernel.org, david@kernel.org,
	ryan.roberts@arm.com, anshuman.khandual@arm.com, ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org, Wen Jiang <jiangwen6@xiaomi.com>
Subject: Re: [PATCH v2 6/7] mm/vmalloc: align vm_area so vmap() can batch
 mappings
Message-ID: <ag1jhrWivbasi8Jq@milan>
References: <20260514094108.2016201-1-jiangwen6@xiaomi.com>
 <20260514094108.2016201-7-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260514094108.2016201-7-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_003226_808309_1388705E 
X-CRM114-Status: GOOD (  22.86  )
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

On Thu, May 14, 2026 at 05:41:07PM +0800, Wen Jiang wrote:
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
>  mm/vmalloc.c | 31 ++++++++++++++++++++++++++++++-
>  1 file changed, 30 insertions(+), 1 deletion(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index c30a7673e..b3389c8f1 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3591,6 +3591,35 @@ static int __vmap_huge(unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static struct vm_struct *get_aligned_vm_area(unsigned long size, unsigned long flags)
> +{
> +	unsigned int shift = (size >= PMD_SIZE) ? PMD_SHIFT :
> +				arch_vmap_pte_supported_shift(size);
> +	struct vm_struct *vm_area = NULL;
> +
> +	/*
> +	 * Try to allocate an aligned vm_area so contiguous pages can be
> +	 * mapped in batches.
> +	 */
> +	while (1) {
> +		unsigned long align = 1UL << shift;
> +
> +		vm_area = __get_vm_area_node(size, align, PAGE_SHIFT, flags,
> +				VMALLOC_START, VMALLOC_END,
> +				NUMA_NO_NODE, GFP_KERNEL,
> +				__builtin_return_address(0));
> +		if (vm_area || shift <= PAGE_SHIFT)
> +			goto out;
> +		if (shift == PMD_SHIFT)
> +			shift = arch_vmap_pte_supported_shift(size);
> +		else if (shift > PAGE_SHIFT)
> +			shift = PAGE_SHIFT;
> +	}
> +
> +out:
> +	return vm_area;
> +}
> +
IMO, we should get rid of this while(1) loop. It looks like you need to
handle just few cases. 3?


shift min value is PAGE_SHIFT, could you please clarify when it can be less?

--
Uladzislau Rezki

