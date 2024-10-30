Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59DD4D6B6B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 17:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7UYLjFAMj81rJ/LVUvePRD+K/hBtRYfZ9cIPVkpzOQ4=; b=p2Uib9dlZoWvuWFV051REQ8EvQ
	UJXZWeA8zo/43TeI985nsIAur6wg9jc33257pBmQlukZqaHNVT4Xg3frfcVg0LseRjalX+bF0HBQ6
	HMm+YeOKv7JqaKywzkzPTt0HHGbE1D8rqKFc8w2eow7CC+7y1ucck7gB8wkVHF0L1Y5RiSOcLCj2j
	9dMCZ8NCF8Z/WsPEswk1MpCB5SntEXt0U4eiSLmYf+EKuUW7KfUOKh7urYvLIrEmdynCZcb9Nri5x
	UB/IQ4fQG7A+XCNALt+snFrwu9s73PeXQE7Xb5YUdlHzl+x0ZTsAFi1StTtF/5Lw5yMkeMJ5rT7X5
	yiHjcFSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6CWy-00000001Hjt-2gwd;
	Wed, 30 Oct 2024 17:30:52 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6BWb-000000014Mo-0X8e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 16:26:26 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4315ee633dcso258685e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 09:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730305583; x=1730910383; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7UYLjFAMj81rJ/LVUvePRD+K/hBtRYfZ9cIPVkpzOQ4=;
        b=pjAhtjq2RexO5xQOjd8APe46MzRSGz5Pet43tnFa9XJPjFgkJYZHJp3uYS0KHBLhcS
         ElA9ptCLRpbQESu13KpxxsKC26LdcORYT7LZIiTWz0euOZ29pLHL3JMseQepqbbuldOO
         qrlNa56yCcqvRgKIRtT7BhqKw5YWY7aSwPCzJw67PTbY3xW1c1vWQRF84wR9NBxgKv3+
         R3mrtwe4AdcTM1ouvNocFeex+lPR5m8YAadwWimr5VtEjknDEwsOIFxYhhmFTfjcbkPd
         t8jtG9H/an4PSYcLi4gdvVD+DR3nR70Ra7UeLdwaeb6PJDxcAM2132lgxrX9sxYtEejT
         tFoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730305583; x=1730910383;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7UYLjFAMj81rJ/LVUvePRD+K/hBtRYfZ9cIPVkpzOQ4=;
        b=PY0WAkYx4gmVzVfm/MeF+WTZmGwyP5uhjduyWMTC0B//W5ySuywG60eaSlbED8cCqU
         IYPI7kNxNoaw2XHzRx6kkj2aEbt24KUHzkYGRb22uqHxxYKFMlNTHmBGWZMe2TUg2Cc1
         dS3RECQjl+BQkKJbVCuz4+wbFhMrzlXUVPCGz/hhsnTkSuX5N3CsIhZGxSv/7J4AwU62
         3EGNu9Oby20EnjrYdf4IsqJ4Q9C2c5gHyZ8+mf9gd9ARjIrwriYxstahN0eT3ZFPyJo4
         aErCN8Yds0H+mgbZx5JBLbZejLIMAkWn2/HG4+xOsQ3uZUONAw5kttORrun8hcXIGDI0
         xnlg==
X-Forwarded-Encrypted: i=1; AJvYcCUkLqnFzlXEnX2qYud9FvUvh4NNAN2/Bc0Ap3XZNySPIilvfXHyll0wCBkzzBR1YiS0k+M3MyxHXKLDzCZisYD2@lists.infradead.org
X-Gm-Message-State: AOJu0YyCEy3Hm1E9Wr+MbOsWvaSIwjJK63ZHfHINHKeyOc6HNbVl8i7U
	6D6j8nnsVhu0jchKG4dODQmACe8Wv5D19Hpzoc5mEHjPml8CHI7NUhblf9Xxww==
X-Gm-Gg: ASbGncsUAj9P2APdK4aHjUvBNNzF4lea8pOgLhO8FPiiJ32dCBpYzzwXNnMKTcD9AMR
	K3lACjaPKqIR/fEpWm/HtmhZ+RmwGrp5u2Vg5y5+9A+FeFmS/rtLtnYKmSApoImnAt3V+AE41Gk
	HVKLXqU6Y7eR7/w9EQ5s65t6I8QySjawkhtNVm86t6yk0+NPGzG8StcarwvsROyuWJv8nG1uZ9l
	UTV8VGhlpXJYhxYiAW7luVv5maycBNwPxMUH+uJK4DU6ocSiNS7Z/YktDUMOOWu8wwOzP9fcz98
	Cs2WYglF7Q==
X-Google-Smtp-Source: AGHT+IF5k+xhEFV5HljKvzF9cSpzzYGRlJbocUjKE5hnuGSngP/vDOPF5xH9U8BJE4SMib7JrVlCvw==
X-Received: by 2002:a05:600c:1e04:b0:431:43a1:4cac with SMTP id 5b1f17b1804b1-431b4a21ba1mr10153235e9.3.1730305582787;
        Wed, 30 Oct 2024 09:26:22 -0700 (PDT)
Received: from google.com (88.140.78.34.bc.googleusercontent.com. [34.78.140.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38058bb4287sm15691567f8f.114.2024.10.30.09.26.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2024 09:26:21 -0700 (PDT)
Date: Wed, 30 Oct 2024 16:26:16 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: acpica-devel@lists.linux.dev, Hanjun Guo <guohanjun@huawei.com>,
	iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
	Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robert Moore <robert.moore@intel.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Sudeep Holla <sudeep.holla@arm.com>, Will Deacon <will@kernel.org>,
	Alex Williamson <alex.williamson@redhat.com>,
	Eric Auger <eric.auger@redhat.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Michael Shavit <mshavit@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>, patches@lists.linux.dev,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [PATCH v3 6/9] iommu/arm-smmu-v3: Implement
 IOMMU_HWPT_ALLOC_NEST_PARENT
Message-ID: <ZyJeKPvMRBaKpMeJ@google.com>
References: <0-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
 <6-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6-v3-e2e16cd7467f+2a6a1-smmuv3_nesting_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_092625_187954_94059984 
X-CRM114-Status: GOOD (  18.81  )
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

On Wed, Oct 09, 2024 at 01:23:12PM -0300, Jason Gunthorpe wrote:
> For SMMUv3 the parent must be a S2 domain, which can be composed
> into a IOMMU_DOMAIN_NESTED.
> 
> In future the S2 parent will also need a VMID linked to the VIOMMU and
> even to KVM.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Tested-by: Nicolin Chen <nicolinc@nvidia.com>
> Reviewed-by: Kevin Tian <kevin.tian@intel.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 996774d461aea2..80847fa386fcd2 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -3114,7 +3114,8 @@ arm_smmu_domain_alloc_user(struct device *dev, u32 flags,
>  			   const struct iommu_user_data *user_data)
>  {
>  	struct arm_smmu_master *master = dev_iommu_priv_get(dev);
> -	const u32 PAGING_FLAGS = IOMMU_HWPT_ALLOC_DIRTY_TRACKING;
> +	const u32 PAGING_FLAGS = IOMMU_HWPT_ALLOC_DIRTY_TRACKING |
> +				 IOMMU_HWPT_ALLOC_NEST_PARENT;
>  	struct arm_smmu_domain *smmu_domain;
>  	int ret;
>  
> @@ -3127,6 +3128,14 @@ arm_smmu_domain_alloc_user(struct device *dev, u32 flags,
>  	if (IS_ERR(smmu_domain))
>  		return ERR_CAST(smmu_domain);
>  
> +	if (flags & IOMMU_HWPT_ALLOC_NEST_PARENT) {
> +		if (!(master->smmu->features & ARM_SMMU_FEAT_NESTING)) {
> +			ret = -EOPNOTSUPP;
> +			goto err_free;
> +		}
> +		smmu_domain->stage = ARM_SMMU_DOMAIN_S2;
> +	}
> +
>  	smmu_domain->domain.type = IOMMU_DOMAIN_UNMANAGED;
>  	smmu_domain->domain.ops = arm_smmu_ops.default_domain_ops;
>  	ret = arm_smmu_domain_finalise(smmu_domain, master->smmu, flags);
> -- 
> 2.46.2
> 

