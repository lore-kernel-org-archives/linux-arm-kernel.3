Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06EF4E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=; b=fuK1eNkTk1LQb4dU4B10g7mflS
	Tz7QVuq0ThPmXPu1vuZc11AGXLHFfA/5L85vxYUat6bxNi/yBWAOlHpDbdX+flQrGKJuY0pnYlrav
	s9wXtgQ8BKIt5j3dswhSuvvw0I6YF2vdTlYzNn72ZpJm0MWOWBhF84uisM8NrgUTQcbXbIZjn27s9
	C018E+yPq+DHr4sIobF1TJbI4MLs/j2ZTaAnKK/McqFwCPykB5rkkxv6I8nmnkCi4O3RRRpcd5Exj
	Vo+82EUMmR82fQxYBwqMjDqDnnl7wo+jcjHgKwxIpAB2nTgtgEeqm0ZsktOYcjmuxca6Ui0ZXyFt4
	ayLKe/xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImQA-0000000CBB6-0XvM;
	Wed, 04 Dec 2024 10:15:50 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImOY-0000000CAxo-35py
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:14:11 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso35765e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 02:14:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733307249; x=1733912049; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=;
        b=LctlKP6QoQAMj+QkO36ejS7NgsODyYis0DE7c0gB5jGb95Y8HIjfhxo3B6gqqqTS96
         eep/6+gTvPJE22VZqgvtqBKvy7KFV08FUa9WBl8imhknPHjEsNmyJcckzDwLqqwrLMHJ
         FvCM2LmQzeBOw3hKrkd4O8GYPBCfw871v5aAgya0EGYE1mMWfv4YmCSTt1/9ABVMhQ6q
         x+Le0vgi+bXqJG08jTa9Qy8YJxetQ5mVK5nZFeq+t/nIvP2YghzhGmPbyCGhAkrI2FMA
         gKYUxPBTd7SNZ25X5svb7Y1uz3ZRKP73m1ereNy7+eoHl2hFDyBDSo0gV6h+3BceVsOX
         uI3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733307249; x=1733912049;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BMGnNPxPYgtjLytE4uW9hhJz+Jg05BhCFp2UIgwDwC0=;
        b=dvVLl40z8U7j9JIxOuFKu/2BJRVOwOpjZoCCbhgYX0zKpBrXi+dmiC4Ux6aE4MHU1V
         aGLz7sAr5n4vcaosjK1QLW9F1qkB08dEKVjy8mQ7B0A4x21YnT1vmnJjLF3QnoDmOfWS
         LaZOA7kvJH/LXiAFUMObr9oFcuatquwDjM+fZIHnix/utLvoNdLJg4ihGhlM1aYOI2VO
         Gx1ta0h9XV8647NvUBY6rgMxkslIulW1l6DAQ4Vh2K2PXXwukRaeir+7pfC+ObXn3P7u
         8oNuTqPU1XYWOflKyyVyHkmkOYjUb7Gc/6/yp8jzTNUZuoFmW9qK+6X+dTYOWRAWJ0gd
         hNwg==
X-Forwarded-Encrypted: i=1; AJvYcCV6HyvooHRBiqCb9eqTnw9YKWdeor4jjj5DDegfl6hIuylNTKazuafZqsUeVUOBb2fFszQ5SrG/j3WUlBFFUyx5@lists.infradead.org
X-Gm-Message-State: AOJu0Yxrm+W3kUIl+ZYWerl6ymIu+OXc/S+tTc3yo8fvgjqcYd3/b2EV
	ymbr5enA0wfGt+pMOxptEHJxWoWOyGTF+VLycsZOl1gx+wr0C9vyCl+o+KgGAA==
X-Gm-Gg: ASbGncv4ZWS26knkTRQ01LJPUBHkzNXceBI5/RWr6sceTi0HnuD04ZiOPqgfE7RL2dV
	r0mGEesCy7LHlZyiIo+EBsHw8aa1Ah4aBtlB4ZoF0vmoZX9vTdMFbLDbNlAwLpf6thhktRUqRMc
	pCXA3WpCECVkTZNsDpfVl9PFYO0rMrZ3JHFjpGPLYd6omsQ014fdBlOyJGzlg6sFnJUzzdm+040
	DCucr0w4xtJnNUiRVVZ7KndL6WzuQSFxYFnWGD87NgEiCRisNUbtbvC5ehvEPzkqIIdEGjgpOrB
	gmj5yYmv8o8Q
X-Google-Smtp-Source: AGHT+IEI5ovyp1RCIv/DEgpLwXFNydHyjD9DBddbq5V/1dJpcQ7kJme1DtYiR17VJHUI0rTtCpgyHQ==
X-Received: by 2002:a7b:ca4d:0:b0:434:9ff3:8ffc with SMTP id 5b1f17b1804b1-434d4aaada7mr918595e9.4.1733307248895;
        Wed, 04 Dec 2024 02:14:08 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385e4617a61sm12383645f8f.3.2024.12.04.02.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:14:08 -0800 (PST)
Date: Wed, 4 Dec 2024 10:14:04 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 2/4] iommu/io-pgtable-arm: Re-use the pgtable walk
 for iova_to_phys
Message-ID: <Z1ArbJbqAnD-Qn52@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-3-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-3-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_021410_774471_D460345F 
X-CRM114-Status: GOOD (  22.15  )
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

Hi Rob,

On Mon, Oct 28, 2024 at 02:31:38PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Re-use the generic pgtable walk path.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/io-pgtable-arm.c | 74 +++++++++++++++++-----------------
>  1 file changed, 37 insertions(+), 37 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 7e9c0f8ae138..88b128c77893 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -712,42 +712,6 @@ static size_t arm_lpae_unmap_pages(struct io_pgtable_ops *ops, unsigned long iov
>  				data->start_level, ptep);
>  }
>  
> -static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> -					 unsigned long iova)
> -{
> -	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> -	arm_lpae_iopte pte, *ptep = data->pgd;
> -	int lvl = data->start_level;
> -
> -	do {
> -		/* Valid IOPTE pointer? */
> -		if (!ptep)
> -			return 0;
> -
> -		/* Grab the IOPTE we're interested in */
> -		ptep += ARM_LPAE_LVL_IDX(iova, lvl, data);
> -		pte = READ_ONCE(*ptep);
> -
> -		/* Valid entry? */
> -		if (!pte)
> -			return 0;
> -
> -		/* Leaf entry? */
> -		if (iopte_leaf(pte, lvl, data->iop.fmt))
> -			goto found_translation;
> -
> -		/* Take it to the next level */
> -		ptep = iopte_deref(pte, data);
> -	} while (++lvl < ARM_LPAE_MAX_LEVELS);
> -
> -	/* Ran out of page tables to walk */
> -	return 0;
> -
> -found_translation:
> -	iova &= (ARM_LPAE_BLOCK_SIZE(lvl, data) - 1);
> -	return iopte_to_paddr(pte, data) | iova;
> -}
> -
>  struct io_pgtable_walk_data {
>  	struct io_pgtable		*iop;
>  	void				*data;
> @@ -763,6 +727,41 @@ static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
>  				 arm_lpae_iopte *ptep,
>  				 int lvl);
>  
> +struct iova_to_phys_data {
> +	arm_lpae_iopte pte;
> +	int lvl;
> +};
> +
> +static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
> +			      arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct iova_to_phys_data *data = walk_data->data;
> +	data->pte = *ptep;
> +	data->lvl = lvl;
> +	return 0;
> +}
> +
> +static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
> +					 unsigned long iova)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct iova_to_phys_data d;
> +	struct io_pgtable_walk_data walk_data = {
> +		.data = &d,
> +		.visit = visit_iova_to_phys,
> +		.addr = iova,
> +		.end = iova + 1,
> +	};
> +	int ret;
> +
> +	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
> +	if (ret)
> +		return 0;
> +
> +	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
> +	return iopte_to_paddr(d.pte, data) | iova;
> +}
> +
>  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  			    struct io_pgtable_walk_data *walk_data,
>  			    arm_lpae_iopte *ptep, int lvl)
> @@ -780,8 +779,9 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  		return 0;
>  	}
>  
> -	if (WARN_ON(!iopte_table(pte, lvl)))
> +	if (!iopte_table(pte, lvl)) {
>  		return -EINVAL;
> +	}
>  
>  	ptep = iopte_deref(pte, data);
>  	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
> -- 
> 2.47.0
> 

