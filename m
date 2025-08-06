Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D81B7C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 00:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I4DgF6Vw8xGQncqmkZy1+xUkx+suIzKaCcwcVTdjpkA=; b=WABEUrKT+hzamVFLzr35GTO7DY
	hUl+WmfreJxYWbJp8SJI1lAPypwLQm1/g/1lbNkL6cRsLZRAqwfg5hQOWFAndPOd9QYkrz2o8nrTD
	8PXYhoKoFrdD4P09a+hFYi7i0RBkWfaU3xONHgN0Z92QHszV5DP5mwyU3Zh3HLDqWqF0TebFT1Xn9
	XjIVOd+iQzfVaH8agoh8X/xWAjtqexPTAYdr2fm0kj5Aqf4nPJry7NhWLgJ97YNE4HVd8sMLJkHXa
	7MbQV7T5nuwEqOBH8i7/dAYfBbEOz5GmqGMiqdVJezKumjAfAUbuiOzaQ84/Mcq71jpIjLoiPcWcC
	zYkckt3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujo4Z-0000000Gs5Y-17qK;
	Thu, 07 Aug 2025 00:01:31 +0000
Received: from mail-qk1-x72e.google.com ([2607:f8b0:4864:20::72e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujo21-0000000Gruy-1z0m
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 23:58:54 +0000
Received: by mail-qk1-x72e.google.com with SMTP id af79cd13be357-7e806613af8so53862085a.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 06 Aug 2025 16:58:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1754524730; x=1755129530; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=I4DgF6Vw8xGQncqmkZy1+xUkx+suIzKaCcwcVTdjpkA=;
        b=Fp65SFmhmLHx20M4IcSucbXLjg6scyHrliWdfmB33GzAw8xFY4iporTykzqsobG0NH
         6ZC3OzM94XI+Jj79aQppJudRDcgm82TaRziR8dTPshvVeZmd5j9DeDiYDLmkGY4YTZv0
         4zMpwAcOqTnXhIe2ayxIp0YFuEy3u7EZnr3oEyiTPE+HoiUUrRDAdt9AUXgc7bOSNg/R
         NvLmnWl8vBMMzi6R+bKn9H4hML7YTa8Cikpv6NTfrDbpeCeUaGSKokICLbJZIyOj7Udd
         zusKuKSiefrI50YkZknLlOnKCOY2UGQJpkylqU0yuU4/Jzhwsv0YEK7PTyPxeGSRXfAl
         KA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754524730; x=1755129530;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=I4DgF6Vw8xGQncqmkZy1+xUkx+suIzKaCcwcVTdjpkA=;
        b=CvSATNsMCnLuM0SAZMhOMZay6DWsUFjilqEJMw1pkV8lf1b4IqkPoqeWPGULLv0Lrz
         GtTdybhIBDNtEC+8a+upY2gnocrnaDCbVa519fChnuN2CFgMqf7r0pPgoVh7fqzdOxxy
         YLA5DIntMFioNmjTp5At5EzFQEix6/pI468JCatKOCBptq12c4qA7uD/jSp5T3aF2Lcs
         XxPjWiwQn/rg9ehl8hGU+aASMTHWKBUYOa2YoGDBTucaa8O1zOXB2qfEw0dKJCJDPpYi
         eiF3uaLw6NPjVVIMN98+xn9qj/n3b4vgD5SI60rtonOkyVBSxYmrWEsC+/n2PcfTz3VS
         E8pg==
X-Forwarded-Encrypted: i=1; AJvYcCXGo00ZwlJ47UdGsLK9d3y/RLFXvou9FSq7Eb92p3uSzuWJ3u5n7A+h49YL6Oqyl35Yo362A4Zjb+Cov7RJhq+t@lists.infradead.org
X-Gm-Message-State: AOJu0YzbK/l4oWm2NL9kfEirj3NvDr1w0Rl6Ar38GcE9HFPhZPoyyCK7
	9qlv287iolBg1LPKymwo6k+/Fy3MF37ciOFtmw1YyI6XJq9WqbpRQg4LQM6+EtjULrw=
X-Gm-Gg: ASbGncu9MEB7KKZytygQ1Smj4Rby5+Gx62ob2+CxSEvZ8kLuhVNA5Sy/S9HuLpwaQdJ
	d16QWyBQVB+xBLUdNafnpRulFFR183eCTxs0Kb58uB/dXVKrZL3zdhZSppqIWpyEju4JCKbMrkM
	rksM2i+F1EU+0MUn4dA2of7Vm7+pa3xPRZEc5m8DW8UkbpcERBjcV8K8ctdZ91B/iRPVNefygBo
	fxL/+LFuHiFBLRhH6VwCgJpRBrMW7858/EKszFiuHNuacIWNFM0OSy5OqLtSZHwh/ep0aOkvi3A
	JUUOkGdsJjK5LIy+yQfchaDSvVgK3hnXtWFqJ6XVeLdZI2Ufu4QdYeSOr4L0X4Ng/iH/CVLdR9Y
	oQZCxztoZtSSh+6N9zZVhA99LyfJAMSOJCHKZ1pzqHja+QKPDO1arYFgLvE17Q3bNjRX5
X-Google-Smtp-Source: AGHT+IGnS032BQYfbSfwSqYTvKso8Ea62PyX+fE1vpQVHfXPFL26cVNK4i9ZyLJUzr/PgtuVEArJEg==
X-Received: by 2002:a05:620a:4045:b0:7e6:97a2:ea7d with SMTP id af79cd13be357-7e81677da93mr625181985a.62.1754524729857;
        Wed, 06 Aug 2025 16:58:49 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7e80b869d4bsm310283985a.24.2025.08.06.16.58.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Aug 2025 16:58:49 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1ujo1w-00000001sk1-2RDU;
	Wed, 06 Aug 2025 20:58:48 -0300
Date: Wed, 6 Aug 2025 20:58:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shyam Saini <shyamsaini@linux.microsoft.com>
Cc: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, virtualization@lists.linux.dev,
	will@kernel.org, jacob.pan@linux.microsoft.com,
	eric.auger@redhat.com, code@tyhicks.com,
	eahariha@linux.microsoft.com, vijayb@linux.microsoft.com,
	bboscaccy@linux.microsoft.com
Subject: Re: [PATCH v3 3/3] arm-smmu: select suitable MSI IOVA
Message-ID: <20250806235848.GD377696@ziepe.ca>
References: <20250806215539.1240561-1-shyamsaini@linux.microsoft.com>
 <20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250806215539.1240561-4-shyamsaini@linux.microsoft.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_165853_682966_47A9EC74 
X-CRM114-Status: GOOD (  17.21  )
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

On Wed, Aug 06, 2025 at 02:55:39PM -0700, Shyam Saini wrote:
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3642,17 +3642,30 @@ static int arm_smmu_of_xlate(struct device *dev,
>  static void arm_smmu_get_resv_regions(struct device *dev,
>  				      struct list_head *head)
>  {
> -	struct iommu_resv_region *region;
>  	int prot = IOMMU_WRITE | IOMMU_NOEXEC | IOMMU_MMIO;
>  
> -	region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
> -					 prot, IOMMU_RESV_SW_MSI, GFP_KERNEL);
> -	if (!region)
> -		return;
> -
> -	list_add_tail(&region->list, head);
> +	static const u64 msi_bases[] = { MSI_IOVA_BASE, MSI_IOVA_BASE2 };
>  
>  	iommu_dma_get_resv_regions(dev, head);
> +
> +	/*
> +	 * Use the first msi_base that does not intersect with a platform
> +	 * reserved region. The SW MSI base selection is entirely arbitrary.
> +	 */
> +	for (int i = 0; i != ARRAY_SIZE(msi_bases); i++) {
> +		struct iommu_resv_region *region;
> +
> +		if (resv_region_intersects(msi_bases[i], MSI_IOVA_LENGTH, head))
> +			continue;
> +
> +		region = iommu_alloc_resv_region(msi_bases[i], MSI_IOVA_LENGTH, prot,
> +						 IOMMU_RESV_SW_MSI, GFP_KERNEL);
> +		if (!region)
> +			return;
> +
> +		list_add_tail(&region->list, head);
> +		return;
> +	}
>  }

I think this whole series looks pretty good, but I would suggest to
put this in a helper..

'iommu_set_sw_msi()' perhaps, must be called after iommu_dma_get_resv_regions()

Then maybe the constants can just be placed in the .c file inside the
helper function.

Jsaon

