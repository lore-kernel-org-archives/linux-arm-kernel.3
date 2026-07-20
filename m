Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7549C44521
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 07:51:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lodkTsyKKcDBj+yB9Hc1ozevSN9hyzeJ/bgAOus7jZU=; b=q2oDroQAs3d/sY+Kua0D7CNWXT
	TzWy7RO25kuJvbPkWyUx4pKbujHesiQu+zF+PfeozSdva92jPD6hNaVUKcaQtympSAB6ahoeARRar
	Xs8rD61Cssbv4Iu6rX2uGl4WJwYj4cQK92l5E6Ou4afVwLJURNLJFyV/+sJkr3P7ZW4eiA/h4nQZu
	QHAy5Djx0gPbiB5H+mSVvFTxpGhPThaKwrZLccfaO5r0dPPESZ6zClHkDA6T1Zt6dxI+vc0w64y79
	Xc4xlkFL2gpeXzgyUOjcjafkGmKYYJ0yW/WebK+h5dC5w7O5+jOwQ0KH16w9vzEa/IEQHKS64mq74
	A65UQy+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlimE-000000068Y6-3iwh;
	Mon, 20 Jul 2026 07:51:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlimD-000000068Xj-24yD
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 20 Jul 2026 07:51:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=lodkTsyKKcDBj+yB9Hc1ozevSN9hyzeJ/bgAOus7jZU=; b=dFPleSEnFeJkXi0y4xjBXf257H
	1lbMfC/9V04NhLYDJZH1+pvpynxr9MrYVNx5kqOMujjFRz3o8aRNxVebI99swg+5gXFZqiPsy8D0c
	7mpcQmwNYww2PpfFCrO0oNcybY+G1q0egchMrHUuXLdXpZovWtrVdHZlQa6tvhJbhjZ04FUTM3Rw7
	v760Xgb3wU2FjVZeC69clgy++Il1W+EDriOFC6LG3V1vS5F4uKt4IBcn5tl4HFej0/FLZd5HDs6QU
	kKQ0M50S37Z951BH8jvw03FQk3/PHEHGzikGlAXuVob01cV/Gphd4VEUSJVG09ooMVDP7o3Nxw9JN
	NB/+m98w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wlim9-0000000GMKo-1XVY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 07:50:59 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 299F22B;
	Mon, 20 Jul 2026 00:50:51 -0700 (PDT)
Received: from [10.164.19.57] (unknown [10.164.19.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 10F823F86F;
	Mon, 20 Jul 2026 00:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784533855; bh=2Un4GO8yOvt4jQTKL0yMvo/Ed/dJKpSRadpiypHDvPg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N3Y1fIEH02S7auRV/kad7+v07C+/uk7U1HwOWDfGg9cVKuJxjpF4lLb4rTj8QcSVM
	 fy1FCBwPyvvEce0+BXG4UcjaKJJF9wjlLKZNU3G1qgpI12D+s8sxjqCjt5PHMGl/1o
	 HVQy4QlxnijXCCw0L/cqoKcHdjO0pr1e+G9OvkWc=
Message-ID: <243328f9-1247-4104-ad09-b2f6de520128@arm.com>
Date: Mon, 20 Jul 2026 13:20:48 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 5/7] mm/vmalloc: Extract vm_shift() to consolidate
 mapping shift selection
To: Wen Jiang <jiangwenxiaomi@gmail.com>, akpm@linux-foundation.org,
 catalin.marinas@arm.com, linux-mm@kvack.org, urezki@gmail.com,
 will@kernel.org
Cc: Xueyuan.chen21@gmail.com, ajd@linux.ibm.com, anshuman.khandual@arm.com,
 david@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, rppt@kernel.org, ryan.roberts@arm.com,
 baohua@kernel.org, Wen Jiang <jiangwen6@xiaomi.com>,
 Leo Yan <leo.yan@arm.com>
References: <20260715120813.3609949-1-jiangwen6@xiaomi.com>
 <20260715120813.3609949-6-jiangwen6@xiaomi.com>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260715120813.3609949-6-jiangwen6@xiaomi.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_085058_392940_683D08D7 
X-CRM114-Status: GOOD (  13.80  )
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



On 15/07/26 5:38 pm, Wen Jiang wrote:
> Extract the vmalloc mapping shift selection from
> __vmalloc_node_range_noprof() into vm_shift(), preparing for reuse by the
> vmap batching path.
> 
> No functional change.
> 
> Suggested-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---

Reviewed-by: Dev Jain <dev.jain@arm.com>


>  mm/vmalloc.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index afc695d5973e8..a1e025120e9df 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3549,6 +3549,14 @@ void vunmap(const void *addr)
>  }
>  EXPORT_SYMBOL(vunmap);
> 
> +static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
> +{
> +	if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> +		return PMD_SHIFT;
> +
> +	return arch_vmap_pte_supported_shift(size);
> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -4047,11 +4055,7 @@ void *__vmalloc_node_range_noprof(unsigned long size, unsigned long align,
>  		 * supporting them.
>  		 */
> 
> -		if (arch_vmap_pmd_supported(prot) && size >= PMD_SIZE)
> -			shift = PMD_SHIFT;
> -		else
> -			shift = arch_vmap_pte_supported_shift(size);
> -
> +		shift = vm_shift(prot, size);
>  		align = max(original_align, 1UL << shift);
>  	}
> 
> --
> 2.34.1
> 


