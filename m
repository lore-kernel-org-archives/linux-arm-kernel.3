Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7EF3C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 03:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qa/VDd/mSdDHpuvSCZ3/ODd1JXeFiiam1MgWlPeSiGs=; b=lj8UiH4ECPmRrS3vgBtLj+Bnce
	0IN8m01uMpzRJgJVTr+CEHWFHTJoVGxjRa/vQURvO4kZIlgRd2Hbgn+VoQn7RqiNXvEnIT4TNE5li
	k3S8cgCZw0fAXFLMbhXCmA8G613ejdRgQlqppgGLXlnPSB5fi/6BQBrvIHbUKCP81d2ReoZsYY9/F
	YmvkHTxz0GLojAMIifCg2NO2/OA9ifPJuyrI0ECyPrLfI1e2YzNTq9OKDknJldCDzycOdTcE7H9AK
	UiXZRmc2PCRCs7YENrtJPAYJL4j+T7Izs8uqiRkaJskRj25zCu5rsQ9ffInJLyO2SEFRK8m3tXaRE
	H049XAiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSWi-0000000EfXq-1odC;
	Fri, 20 Jun 2025 03:34:52 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSSUT-0000000EfKZ-2F6d
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 03:32:35 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-235ca5eba8cso244845ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 20:32:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750390353; x=1750995153; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qa/VDd/mSdDHpuvSCZ3/ODd1JXeFiiam1MgWlPeSiGs=;
        b=0lSEg1QN41wN11Q04RpiqB967PDz75jHUuemU5cJ/ScvOpz5Ws66UKKGLyx3bENxVb
         ImnYfZL5sitWSxiOMWa929W0W7NjCkc4S0U5plY9Wk/wwgNlyyIAa5bOjciZkQy53OoZ
         e8XZb0++JJ+dTvwszByC6N96Jlqr9SIm/XZAX5moXbpKwDoZR5pz49c4gLO1qXP/puzg
         3EhTU2YoeQ2G/j1AKWdJiOoNKoqs99pu6FyQTykK2yuK43Qe1loBFPEfwmkVrVj9+VfJ
         ZWJMWrXM5E8GUor6SLD4F5p9SpQAFaUyoYsY3zONt5vDn7T3Pz21FTpi3Xo6XrMidNiO
         GlBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750390353; x=1750995153;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qa/VDd/mSdDHpuvSCZ3/ODd1JXeFiiam1MgWlPeSiGs=;
        b=Hji0L3dhw6JRxTbvL5vppw4W0mGriJG/ryH6s8uqpp12ROsHyaNEsjKYGGI69i7D4o
         esu7bxYf/J4ataJLyGA09S0GWTXf+SHT6ZHuC7LZFYctbDX/0I6eQZPLw3fUsApIbQK/
         gkOrQsChyss/8mWTgkrxc6w3Dc0tFE8jb2W83OInWZgPofkl475surEf4BZXeXb5cF5Z
         yPkoFhZPR7BovvAXsbRRuEMDE0U2fFr1Hk25r3m3fPfI3luBzto5UdB4gkCHZRhQK0iG
         fFc81yNWN/7ldP1p2/D76HfvYstcGZKIoNfBlElS9VRzkiUAPNiV6MC+VrlNF8qaz/7Z
         fAiw==
X-Forwarded-Encrypted: i=1; AJvYcCUUEkqg9YAwbdVNz2v56o2L41M8/Lxii1LDgdu3ryYCms0O6L9G2eNh7c9AF4UExZi8XPrRLHx1GXHVzgwXXPJx@lists.infradead.org
X-Gm-Message-State: AOJu0Yyans1x1kjktRv+H0QzbGFzo7DbqlhehVCPbQ+hE6kzI1IxpC3S
	0uSe4BI8NkLSHxWXtkMbrwtD/a9YO8+x9vtmtqxE80m5m9YVfschmZbxBfI9ZaSiBA==
X-Gm-Gg: ASbGncv2X7CErFBDM5z1CZ+eH+hvpgTQh7B5fnbMRTjtPZ8sRY6CTtAx0OAIH8tuEBT
	5Q8TIKFTOhnQ8VVlghDzi2vGyheTJBdBXgI4NvKEH9T40CYMeXqhKm6ae9q3Eh5WLW7Tiq/jY/K
	Qc0JqtPe+r8C45wWU3E9/+zW4u/HtTm7Mr5aPpBKdzcRYY/1EsN1Kw6RFW6gs+ufki/FoDU4JHc
	iLelfzCFm55ayAKu8kTnkPUJiO2+S/8f3eH05L/rMM52EsT+7voRC7panN8UySPbwfhQn5uz5mm
	h0V/RLBV+dB4C086/G5/pHUxXoYU0+fPVd+t+sN6ysKwGNEu/AXF5VcMcfXJL5VSRm5lJBpyWIb
	QU2VgYwhNyWpKuzjfwUr6raHR9df9too=
X-Google-Smtp-Source: AGHT+IERsl+HTUr1rqxITuYHKylDMvSd/CxPtRuNjbrAMl+KyO4xPzytclG3wi1xtC95QCov1vt9OA==
X-Received: by 2002:a17:903:1667:b0:215:f0c6:4dbf with SMTP id d9443c01a7336-237cc9fd3d7mr4672645ad.14.1750390351828;
        Thu, 19 Jun 2025 20:32:31 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83ce860sm6966175ad.65.2025.06.19.20.32.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 20:32:31 -0700 (PDT)
Date: Fri, 20 Jun 2025 03:32:19 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, kevin.tian@intel.com,
	corbet@lwn.net, will@kernel.org, bagasdotme@gmail.com,
	robin.murphy@arm.com, joro@8bytes.org, thierry.reding@gmail.com,
	vdumpa@nvidia.com, jonathanh@nvidia.com, shuah@kernel.org,
	jsnitsel@redhat.com, nathan@kernel.org, peterz@infradead.org,
	yi.l.liu@intel.com, mshavit@google.com, zhangzekun11@huawei.com,
	iommu@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-tegra@vger.kernel.org, linux-kselftest@vger.kernel.org,
	patches@lists.linux.dev, mochs@nvidia.com, alok.a.tiwari@oracle.com,
	vasant.hegde@amd.com, dwmw2@infradead.org, baolu.lu@linux.intel.com
Subject: Re: [PATCH v6 20/25] iommu/arm-smmu-v3-iommufd: Add hw_info to
 impl_ops
Message-ID: <aFTWQ4v6aZABpzeV@google.com>
References: <cover.1749884998.git.nicolinc@nvidia.com>
 <f36b5e42bac83d0cdf5773cad1c3a44c3eaed396.1749884998.git.nicolinc@nvidia.com>
 <aFP4zHIVT6epJeLb@google.com>
 <20250619185325.GB17127@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250619185325.GB17127@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_203233_564872_096F132D 
X-CRM114-Status: GOOD (  22.02  )
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

On Thu, Jun 19, 2025 at 03:53:25PM -0300, Jason Gunthorpe wrote:
> On Thu, Jun 19, 2025 at 11:47:24AM +0000, Pranjal Shrivastava wrote:
> > I'm not sure if I get this right.. if the user (while porting a VMM or
> > something) mistakenly passes *type == IOMMU_HW_INFO_TYPE_INTEL_VTD here,
> > they'll get impl-specific info?
> 
> It should call the impl hw_info which should fail?
> 
> +static void *tegra241_cmdqv_hw_info(struct arm_smmu_device *smmu, u32 *length,
> +				    u32 *type)
> +{
> +	if (*type != IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV)
> +		return ERR_PTR(-EOPNOTSUPP);
> 
> If impl ops is null/etc then it fails:
> 
> +             if (!impl_ops || !impl_ops->hw_info)
> +                     return ERR_PTR(-EOPNOTSUPP);
> 
> Where does IOMMU_HW_INFO_TYPE_INTEL_VTD return something?
> 

I mean, the check in the driver (for e.g. arm-smmu-v3) is:

 if (*type != IOMMU_HW_INFO_TYPE_DEFAULT &&
     *type != IOMMU_HW_INFO_TYPE_ARM_SMMUV3)

     // call impl_ops

My point is that in-case someone passed INTEL_VTD type, we would end up
calling impl_ops->hw_info and then the impl_ops->hw_info shall check for
the type to return -EOPNOTSUPP. Either we should clearly mention that
each impl_op implementing hw_info *must* add another type and check for
it OR we could have sub-types for implementations extending a main type
somehow?


> > I agree in that case the impl-specific
> > driver needs to check the type, but shouldn't we simply return from here
> > itself if the type isn't arm-smmu-v3?
> 
> Then how do you return IOMMU_HW_INFO_TYPE_TEGRA241_CMDQV?
> 

The current version is just fine with a doc string mentioning type
checks within impl_ops->hw_info OR we could have sub-types for
implementations extending some architectural IOMMU. 

I'm just trying to avoid weird bug reports in the future because some
impl didn't check for their type.

> Jason

Thanks
Praan

