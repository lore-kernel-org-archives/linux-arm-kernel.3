Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAC20E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 10:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=; b=a4bDBj9hIftd8ZHaFYRpGe9IP+
	vuxMWxzePsDRuichOxQGA28Ght/W9hN1FtJrn23YhaROJcuftZD2Twq6lfx+UYu4TNAVqxi2u9qn9
	XGnq9U9IaZcwugCZcpSNzoAQ9qnB5aIomKfK+DI0kBLHCA6ytJls+w631DZ4XcQKC6uk0GF2Qvc5z
	KuVbvslRRde7cPHuopL7mcNih8pm7AD/qyJdv7CjTlljF58/9SoYZPvVywhw9wZnK04eHnUIqyvlG
	iw/7vGqKeTmDv8w1rTeRnPqTqjn0RuCiG2r5fIukMVMG153DjxlX0/jfaww1M56eumGAIXGTJvtRb
	zlVD0jiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tImNx-0000000CAqK-3Ept;
	Wed, 04 Dec 2024 10:13:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tImMx-0000000CAhd-08FY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 10:12:32 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4349c7b6b0dso35625e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 02:12:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733307149; x=1733911949; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=;
        b=ojMkQ6DrlFhKEQcuf2wwHOlVUvzL95W1q+5NJw5Kk+jT5IKpsibkxUn9OEhjWOHRcr
         4Kl5UPNQyjirhUH4V9E5PAAMYPk68OYpVAIfHgJDUay1U6MKzl4LEYPrPZAS2pH3Y0d+
         EAMsA6xBo5HgSMzD4mdjSq5Bl+c5R4XnTJfqsW71H03/Py5fBCzus52eJwdvftBvU9Pp
         4Qc3Vw1NsrEp13L9Le6J9Dnev2IOWvT07xcjLbdbOx2aG5STTxqKfS8Wy0ZLhSrO4Pnr
         /h9s+HaOSbFqrMNQfp6jw5GG8PIqZ/xbwijFTN3U/tX5Rv7yuzKI3H0We2LcAwic2Vzc
         c2tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733307149; x=1733911949;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qLs+MAjnlkioXfCJEobmWlFJttU5DMSqco9NCjVHPyc=;
        b=aT5q6N+XkhoADLriYQKW5IqmF2p0ylSWKjnaUAiaVDYfR/Tk2kr4xeCXxhEnBZ8Uko
         IWp3yflXGpSKl/wqvPmOK5Zj9DYyE+HNEc5o36kWpal7uxIY9WqLmHHpfWVG/0ybJWJ8
         fp83kpFhU46jdR4t1yT0Ztc/OynLjqCepZmEA1P/uf2R42kJov82WwEGLq3hl+ikpoBT
         5YW4FR4rM8UW1mAAB50GWGc6S59+bHY6cWfaQ3M1IfuRL0JQ0Ek5mRqhM/3yJs2FTeiZ
         O+bRay1YVLqx5bJ7PncphsG4Ov8bUfPh6md9PX75t16iyiVCPCcjOGjeNSQgQHdIycWV
         OHHg==
X-Forwarded-Encrypted: i=1; AJvYcCWmGveKMz/9HeGefTt8hVG7OFX2UHR9W6pHu13NJJ4hnMh2kLBCFawSMzvufEPf7zjxREa1SVspYYWRLDUFo34v@lists.infradead.org
X-Gm-Message-State: AOJu0YxvIsAb/Cg4Qf1SX9jA0gSYVqcSLkv3w/7txQp++02wAQyPKuyS
	GbA/EHe04C3uHBN+B1wlEw9nufLToY7TvXgFWgzHx21plxigd68rR3ngyxLsxQ==
X-Gm-Gg: ASbGncsd4/1PwKM986qDHX7w2OIWyEfHSWXS3rDnchFYIH6uFzfXKfLCppCWj2U/Qod
	1nYzRCUmwgG+lKtwHFFVZl52QTz8T+t0/CJTVWuGvhL8vmxbd8Bp2q8y6jGABQGxLUuLcCqmkb6
	ZSWCK7ieGurnUFzIQock848Rf4aB9y2U/3S721vZDNw5RWJVdwhn8DGekihCNekChnjcsUlsT//
	jTqksA9RhEpVxGAaQjC+vvBJkUdHB5tufEltPjQvzdcxtXYRiQsqCM0vCrhy75Vd51CUGdHop1g
	zb+bSt55V7FB
X-Google-Smtp-Source: AGHT+IF9rW/W/KKMO9BVSr/bLw+TLa/dGxJXo2KOIrSL7bT2KMLiMDQYkoQTQpYdu8So3eWOjlcV+w==
X-Received: by 2002:a05:600c:4a93:b0:42c:acd7:b59b with SMTP id 5b1f17b1804b1-434d4aab051mr1048795e9.6.1733307148736;
        Wed, 04 Dec 2024 02:12:28 -0800 (PST)
Received: from google.com (158.100.79.34.bc.googleusercontent.com. [34.79.100.158])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-385eeb999f4sm9494986f8f.109.2024.12.04.02.12.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 02:12:28 -0800 (PST)
Date: Wed, 4 Dec 2024 10:12:24 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Rob Clark <robdclark@gmail.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
	freedreno@lists.freedesktop.org, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Rob Clark <robdclark@chromium.org>, Joerg Roedel <joro@8bytes.org>,
	"moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v10 1/4] iommu/io-pgtable-arm: Make pgtable walker more
 generic
Message-ID: <Z1ArCCTGtJY9gxP3@google.com>
References: <20241028213146.238941-1-robdclark@gmail.com>
 <20241028213146.238941-2-robdclark@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241028213146.238941-2-robdclark@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_021231_068262_E3F6CEDC 
X-CRM114-Status: GOOD (  22.53  )
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

On Mon, Oct 28, 2024 at 02:31:37PM -0700, Rob Clark wrote:
> From: Rob Clark <robdclark@chromium.org>
> 
> We can re-use this basic pgtable walk logic in a few places.
> 
> Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Mostafa Saleh <smostafa@google.com>

> ---
>  drivers/iommu/io-pgtable-arm.c | 67 ++++++++++++++++++++++------------
>  1 file changed, 43 insertions(+), 24 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index 0e67f1721a3d..7e9c0f8ae138 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -749,33 +749,33 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
>  }
>  
>  struct io_pgtable_walk_data {
> -	struct iommu_dirty_bitmap	*dirty;
> +	struct io_pgtable		*iop;
> +	void				*data;
> +	int (*visit)(struct io_pgtable_walk_data *walk_data, int lvl,
> +		     arm_lpae_iopte *ptep, size_t size);
>  	unsigned long			flags;
>  	u64				addr;
>  	const u64			end;
>  };
>  
> -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
> -				       struct io_pgtable_walk_data *walk_data,
> -				       arm_lpae_iopte *ptep,
> -				       int lvl);
> +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> +				 struct io_pgtable_walk_data *walk_data,
> +				 arm_lpae_iopte *ptep,
> +				 int lvl);
>  
> -static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
> -				  struct io_pgtable_walk_data *walk_data,
> -				  arm_lpae_iopte *ptep, int lvl)
> +static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
> +			    struct io_pgtable_walk_data *walk_data,
> +			    arm_lpae_iopte *ptep, int lvl)
>  {
>  	struct io_pgtable *iop = &data->iop;
>  	arm_lpae_iopte pte = READ_ONCE(*ptep);
>  
> -	if (iopte_leaf(pte, lvl, iop->fmt)) {
> -		size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +	size_t size = ARM_LPAE_BLOCK_SIZE(lvl, data);
> +	int ret = walk_data->visit(walk_data, lvl, ptep, size);
> +	if (ret)
> +		return ret;
>  
> -		if (iopte_writeable_dirty(pte)) {
> -			iommu_dirty_bitmap_record(walk_data->dirty,
> -						  walk_data->addr, size);
> -			if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> -				iopte_set_writeable_clean(ptep);
> -		}
> +	if (iopte_leaf(pte, lvl, iop->fmt)) {
>  		walk_data->addr += size;
>  		return 0;
>  	}
> @@ -784,13 +784,13 @@ static int io_pgtable_visit_dirty(struct arm_lpae_io_pgtable *data,
>  		return -EINVAL;
>  
>  	ptep = iopte_deref(pte, data);
> -	return __arm_lpae_iopte_walk_dirty(data, walk_data, ptep, lvl + 1);
> +	return __arm_lpae_iopte_walk(data, walk_data, ptep, lvl + 1);
>  }
>  
> -static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
> -				       struct io_pgtable_walk_data *walk_data,
> -				       arm_lpae_iopte *ptep,
> -				       int lvl)
> +static int __arm_lpae_iopte_walk(struct arm_lpae_io_pgtable *data,
> +				 struct io_pgtable_walk_data *walk_data,
> +				 arm_lpae_iopte *ptep,
> +				 int lvl)
>  {
>  	u32 idx;
>  	int max_entries, ret;
> @@ -805,7 +805,7 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  
>  	for (idx = ARM_LPAE_LVL_IDX(walk_data->addr, lvl, data);
>  	     (idx < max_entries) && (walk_data->addr < walk_data->end); ++idx) {
> -		ret = io_pgtable_visit_dirty(data, walk_data, ptep + idx, lvl);
> +		ret = io_pgtable_visit(data, walk_data, ptep + idx, lvl);
>  		if (ret)
>  			return ret;
>  	}
> @@ -813,6 +813,23 @@ static int __arm_lpae_iopte_walk_dirty(struct arm_lpae_io_pgtable *data,
>  	return 0;
>  }
>  
> +static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
> +		       arm_lpae_iopte *ptep, size_t size)
> +{
> +	struct iommu_dirty_bitmap *dirty = walk_data->data;
> +
> +	if (!iopte_leaf(*ptep, lvl, walk_data->iop->fmt))
> +		return 0;
> +
> +	if (iopte_writeable_dirty(*ptep)) {
> +		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
> +		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
> +			iopte_set_writeable_clean(ptep);
> +	}
> +
> +	return 0;
> +}
> +
>  static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  					 unsigned long iova, size_t size,
>  					 unsigned long flags,
> @@ -821,7 +838,9 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
>  	struct io_pgtable_cfg *cfg = &data->iop.cfg;
>  	struct io_pgtable_walk_data walk_data = {
> -		.dirty = dirty,
> +		.iop = &data->iop,
> +		.data = dirty,
> +		.visit = visit_dirty,
>  		.flags = flags,
>  		.addr = iova,
>  		.end = iova + size,
> @@ -836,7 +855,7 @@ static int arm_lpae_read_and_clear_dirty(struct io_pgtable_ops *ops,
>  	if (data->iop.fmt != ARM_64_LPAE_S1)
>  		return -EINVAL;
>  
> -	return __arm_lpae_iopte_walk_dirty(data, &walk_data, ptep, lvl);
> +	return __arm_lpae_iopte_walk(data, &walk_data, ptep, lvl);
>  }
>  
>  static void arm_lpae_restrict_pgsizes(struct io_pgtable_cfg *cfg)
> -- 
> 2.47.0
> 

