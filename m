Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D08BE7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CkYLTBgm995LkjvCxemjC6Jocdx1o/Bh1C0vkU2Fy7M=; b=LJrQQ713m5zVKThrj77gy7/s9j
	krMn59/46vAUqCQC9XSvfIAwb7ji8MCAdSxzZPDSh+aexdWgEjfL/HIE2sRTkUHIipH/Lr8VuiM4o
	RipriWSATCioQGFA+g2Bycf/Ynm3k5BI5weot5NDXVJLqMiHAgyBIX5vPq3cckYPDlfuOtNMrtIQu
	iAHjicu9uxWNMCcUqYaV4Q5zKaSTDtrp90/3MVTwIEildavXHXuIAgo13KgwXlfOaLKpymGXNwDfK
	H/r7wUOmw+1PRdsY/PpnBetvDUNz+9nbp3sngUfXdLFrjHmuxKlwzzBB2OWnxo/8mFWUny+VHRTkd
	ydA7wMXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImWJ-0000000CBo9-2fRN;
	Wed, 04 Dec 2024 10:22:11 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImVI-0000000CBhZ-2FZb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:21:09 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso36295e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 02:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733307667; x=1733912467; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CkYLTBgm995LkjvCxemjC6Jocdx1o/Bh1C0vkU2Fy7M=;
        b=2YxS1JtqmuilrYbzFY+n8DHv2Lzr3Z1coFcuqMeqQI1Z7WbbkLbLWgYmppVFCJ6vb7
         JiTcvCNSZ+6+vG7z5dW7RC6lZo8KMM7U4R6LIWcWWgPJSO3v45wcUK0igk7D2TmWjnq4
         Re8X9ai93dLwQvOGcDD2i/GxOQiTnDB/kjGOM17hQ7xikDo00qZYx38Cb2ipge3stZVW
         rhH+Ata908UHiFx3KuL4UO0e5BNwCCcr328KVdLv0Iqcbh3gj9ykSF9zV8WyPsdWVW+D
         86XXJK08hjBy3mFZu2Ip1rgB5Ayda6Gd1ZWYpeCemYEA08YLfNDgZINWMjaibr14Q7UE
         SRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733307667; x=1733912467;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CkYLTBgm995LkjvCxemjC6Jocdx1o/Bh1C0vkU2Fy7M=;
        b=FUxAzsr+E42MqfezALhApEOpXBnsFiunlJf7zXJ05eFrOCJ7AIDS8Tsdqsu+WVojAV
         p2Psn023s1IFMb7SZZlw+tEw20FZvo55wrC1N7TlAF/Wi4Pg0QKIPZVmkcO0Z5nFx0He
         Xmf4T1gz2zfV2BqRa5oFlM7K8XfNOwEGO8PnTqycOqLEfv4xhVrnSYgO6+7jNfwmtmpv
         jXB+PPw4/xlY0KDAYD06VM1S3OWbPjKbXRPmwze0ZRC5ArB1KATf+0jaJmE8SOU2Y57g
         +kiGbukyruZG8xPZ/s0yrdpMAlesrZjNS9iP5cBqJM6OSrr4NUSuuO1WIn9AjcuiO9JU
         UGaA==
X-Forwarded-Encrypted: i=1; AJvYcCXv7pO06vWYv2uj+Vi2rKz28n2JB804350733aoHvYi8DNZkpoeKdnxoEXk4w/4celh5j0LjiEzR/0XpmoXf0Y2@lists.infradead.org
X-Gm-Message-State: AOJu0YwvP074S7Vc5Kdc4j3nm4fWSueDkh5PRrq2DVvu4ThBSVh3aCi6
	rfVPYtFNkIbmUxhBbwCfoI+CHhXVVnHtVCsXjyaA4WunEyx9JYNLMYPYtuE+Ow==
X-Gm-Gg: ASbGncvE8gGUpJwBiQ4n/+UaRB/10LowH/qfC5RMnLBWVrW4t+Qy+v/9UCyLI228F8U
	5GN9+jl0VmfcUpVPmj8NF4sD9qxi8vUFX/qjGoAUQyioLh4fUa6wUJYSKOyWd1b8fAEfiP4a22Z
	8ktqkSUjRt7yjG4phW7SUcUpXsD2CgcdB/4jQY1eUjnJ7GEDHSTrysLoERs/Rb4EgxNidP6aek0
	u58xkjPNu4ihAGoehhIJZ5HiE8Fl80Rq16uo96Vs3wVyLLM34A2pgmLAVuyx2PHJAH978j47Q3y
	Zio/xba9gwfI
X-Google-Smtp-Source: AGHT+IE7T8d7TZw5PeKMBFpYLBTez7iD+72RMF2IGZ5bXAf6OdVX2raWOJrJNuhpXSW4NzSb1otqdQ==
X-Received: by 2002:a05:600c:5113:b0:431:43a1:4cac with SMTP id 5b1f17b1804b1-434d528f647mr784575e9.3.1733307666792;
        Wed, 04 Dec 2024 02:21:06 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cb6e1sm19021945e9.37.2024.12.04.02.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:21:06 -0800 (PST)
Date: Wed, 4 Dec 2024 10:21:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Vasant Hegde <vasant.hegde@amd.com>,
	Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Joao Martins <joao.m.martins@oracle.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 3/4] iommu/io-pgtable-arm: Add way to debug pgtable
 walk
Message-ID: <Z1AtDgLD0SDUxDHl@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-4-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-4-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_022108_579097_CC8D93B0 
X-CRM114-Status: GOOD (  28.19  )
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

On Mon, Oct 28, 2024 at 02:31:39PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> Add an io-pgtable method to walk the pgtable returning the raw PTEs that
> would be traversed for a given iova access.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
> ---
>  drivers/iommu/io-pgtable-arm.c | 25 +++++++++++++++++++++++++
>  include/linux/io-pgtable.h     | 15 +++++++++++++++
>  2 files changed, 40 insertions(+)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 88b128c77893..6739e1fa54ec 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -762,6 +762,30 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  	return iopte_to_paddr(d.pte, data) | iova;
>  }
>  
> +static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
> +			      arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
> +	data->ptes[data->level++] = *ptep;
> +	return 0;
> +}
> +
> +static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
> +				 void *wd)
> +{
> +	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
> +	struct io_pgtable_walk_data walk_data = {
> +		.data = wd,
> +		.visit = visit_pgtable_walk,
> +		.addr = iova,
> +		.end = iova + 1,
> +	};
> +
> +	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;

I think this is a bit fragile, as it only works because the walk spans
one address, otherwise it breaks, the visitor will keep incrementing
the level. IMO, this should be removed, and the visitor already knows
the level as it's passed as an argument, so something like this:

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 6739e1fa54ec..bc73f9edae8a 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -766,7 +766,8 @@ static int visit_pgtable_walk(struct io_pgtable_walk_data *walk_data, int lvl,
 			      arm_lpae_iopte *ptep, size_t size)
 {
 	struct arm_lpae_io_pgtable_walk_data *data = walk_data->data;
-	data->ptes[data->level++] = *ptep;
+	data->ptes[lvl] = *ptep;
+	data->level = lvl + 1;
 	return 0;
 }
 
@@ -781,8 +782,6 @@ static int arm_lpae_pgtable_walk(struct io_pgtable_ops *ops, unsigned long iova,
 		.end = iova + 1,
 	};
 
-	((struct arm_lpae_io_pgtable_walk_data *)wd)->level = 0;
-
 	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 }
 
Thanks,
Mostafa
> +
> +	return __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
> +}
> +
>  static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
>  			    struct io_pgtable_walk_data *walk_data,
>  			    arm_lpae_iopte *ptep, int lvl)
> @@ -937,6 +961,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
>  		.unmap_pages	= arm_lpae_unmap_pages,
>  		.iova_to_phys	= arm_lpae_iova_to_phys,
>  		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
> +		.pgtable_walk	= arm_lpae_pgtable_walk,
>  	};
>  
>  	return data;
> diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
> index b1ecfc3cd5bc..d7bfbf351975 100644
> --- a/include/linux/io-pgtable.h
> +++ b/include/linux/io-pgtable.h
> @@ -178,12 +178,26 @@ struct io_pgtable_cfg {
>  	};
>  };
>  
> +/**
> + * struct arm_lpae_io_pgtable_walk_data - information from a pgtable walk
> + *
> + * @ptes:     The recorded PTE values from the walk
> + * @level:    The level of the last PTE
> + *
> + * @level also specifies the last valid index in @ptes
> + */
> +struct arm_lpae_io_pgtable_walk_data {
> +	u64 ptes[4];
> +	int level;
> +};
> +
>  /**
>   * struct io_pgtable_ops - Page table manipulation API for IOMMU drivers.
>   *
>   * @map_pages:    Map a physically contiguous range of pages of the same size.
>   * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
>   * @iova_to_phys: Translate iova to physical address.
> + * @pgtable_walk: (optional) Perform a page table walk for a given iova.
>   *
>   * These functions map directly onto the iommu_ops member functions with
>   * the same names.
> @@ -197,6 +211,7 @@ struct io_pgtable_ops {
>  			      struct iommu_iotlb_gather *gather);
>  	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
>  				    unsigned long iova);
> +	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
>  	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
>  				    unsigned long iova, size_t size,
>  				    unsigned long flags,
> -- 
> 2.47.0
> 

