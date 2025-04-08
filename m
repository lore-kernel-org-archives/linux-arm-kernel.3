Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C446BC3600C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 05:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iIblNaCDqbuIOdoWiMsvT5bzQtdq7ut/Mrgb9e4M8PA=; b=Y7K3CeGBPWyb92yNHHbmXrKdFe
	Ibxm+SOrobhMQecrPiEt9iaE6mLsdxFjIDRaagBkElRuEZaH7ca8T5ub8DNJIWo8aT34lkr73cwXg
	LVjBR7J8OEl2gqCvv0RvI4PB/nObYkRRaq+uSrx6FmDmGfimMLdrod75b6QH/atHkSniHdlnLPDA0
	hUSq52GiShMBztXcGbCkYQc74C0YFnmvqKv4dCrLO0KsljS826MH7R+AfCuZNC/uwfrIN4ufoizur
	VjoBlRPNgAngTlstOxUsHgb0f1CIuhsbjfuiFz/Z52T19QVPhKS0XdlW1dtBoR10J9Rt1LvDx852F
	wTv3ABZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21Zi-00000002mik-034H;
	Tue, 08 Apr 2025 05:32:42 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u21Xw-00000002mYh-0le8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Apr 2025 05:30:53 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2242ac37caeso79645ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 22:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744090250; x=1744695050; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=iIblNaCDqbuIOdoWiMsvT5bzQtdq7ut/Mrgb9e4M8PA=;
        b=ekE4kcR0/RjJRM8anbilDMd9eNfhUd2Za0OakE4FaJUCtnoghSk1m6o7MoQQoEgpIS
         XFPn1XQTprunpL+kCjEgXx1KsteYcrnZdTTW9HBJcpdFnhAoS3P/xp1vWNBg4u1YXQxa
         FHS6DDhIDgsaWSGd7y2iRbqkV+ICNtuyxaLg5MoVOCGh8lLqloZTMD/QLXdQzoCPi73T
         q+bM9897fea2GmDgFJ/O+HqB/VoTM+rKJfiNdl48UmaWRkxxkvCy8HFXbsH/6hxzRj3A
         UosnMpYHjqSZXjDLyU9xeHztCzF/UwC4+ppCz7vRi/qfdt44a+05Hb9S//dsqrZzwDYv
         pOBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744090250; x=1744695050;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iIblNaCDqbuIOdoWiMsvT5bzQtdq7ut/Mrgb9e4M8PA=;
        b=lQpWKXnR5Wf9RDSJ2ljfJVmpOTARCnnwhMNYqVN0+W9kPkkBA3gLlfs0vhO+KQg9bq
         b/qa7tJarZ+n1BQX6GETCGhXBogDDUCwGi5ch3ACXNTQrZ5gKTJYiWq2mxffD9hmjy85
         w+gYXpPgBfZ/z7hOiXEDy6Zesp//IEMTrm9maVmoFRHe0Vnn2G6wo1wj8MpZ+IxHwbho
         ARFvbbk+/pcwadBO1rEdYoCPTSg8fGbSlSCbYp9xI3F7Q5nUxgLW3qVmvcKQoE8koMwB
         K43SBZK7IArK0IlIDGbSSGiidkFR9Bpfn2Kjp5oGh2b5ShoTFLKbbRfOISmDlqyXbJuK
         EswQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBHKAm93b2COlPYDWDaj2iJsjKWWub6p7GtcnHSmPE4Qpt/NOeh0coauYtzQbGyceNon+Q+TaVeg4fbGevrA1Z@lists.infradead.org
X-Gm-Message-State: AOJu0YxdBA7wtWq8Vk2SU0j9V8rP5fiLeDMFV/0sXm1lyZrM5/QUggVf
	LoX7sp/9j1TebyNG3fWrzIvB/hRLaPuU2lFk+n1kiFFfpyxLMEiZvGzhpv/y8A==
X-Gm-Gg: ASbGncu+Cd9MlLIe+kNP6X8c672dRubCAH6X0sQZn2jqYxzUROSp5bowzfg5zV44b9l
	APoV4Wyk8FhLObKRIqdjM1x3oy72KUC489yUECh6EQuUgSuJdvtwcrDcBfYU+HPFuEvI0Wzn/rm
	d+4gQBqnZgRG9+3OuxN7oJUPtyVLCB0pjznfQaSoBd61BCVW6FaR9RdA/J/ubrl90fSepk8lnqU
	8wH+uCGBpAC7mwrlZu6DwQjra7wOeNLWvBj0uePHzs9ulf6ed0Ix6PzseVDjsNHCw7uTXyF38g3
	bU2bSq9RxhtbsAtip+soRfDsRr4gFLZm6YvpcJ5If5VfelW9aEfr0lgFNg0G9K9h+Eg0tshlC5A
	48Ok=
X-Google-Smtp-Source: AGHT+IEVENxuSQ9koyTDCtEVC43uFdSdVMF6wPG/+02fUSwR03JHFDiN0ICdqRcuMfCQhrHrrYOGyQ==
X-Received: by 2002:a17:903:22d2:b0:223:3b76:4e25 with SMTP id d9443c01a7336-22ab804c493mr1114505ad.17.1744090250071;
        Mon, 07 Apr 2025 22:30:50 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d97ee90asm9907314b3a.57.2025.04.07.22.30.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 22:30:49 -0700 (PDT)
Date: Tue, 8 Apr 2025 05:30:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, will@kernel.org,
	robin.murphy@arm.com, jgg@ziepe.ca, nicolinc@nvidia.com,
	jsnitsel@redhat.com, kevin.tian@intel.com, ddutile@redhat.com
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add missing S2FWB feature detection
Message-ID: <Z_S0gVMuAqrv3R_v@google.com>
References: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250408033351.1012411-1-aneesh.kumar@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_223052_225218_4173A871 
X-CRM114-Status: GOOD (  18.24  )
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

On Tue, Apr 08, 2025 at 09:03:51AM +0530, Aneesh Kumar K.V (Arm) wrote:
> Commit 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> introduced S2FWB usage but omitted the corresponding feature detection.
> As a result, vIOMMU allocation fails on FVP in arm_vsmmu_alloc(), due to
> the following check:
> 
> 	if (!arm_smmu_master_canwbs(master) &&
> 	    !(smmu->features & ARM_SMMU_FEAT_S2FWB))
> 		return ERR_PTR(-EOPNOTSUPP);
> 
> This patch adds the missing detection logic to prevent allocation
> failure when S2FWB is supported.
> 
> Fixes: 67e4fe398513 ("iommu/arm-smmu-v3: Use S2FWB for NESTED domains")
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 358072b4e293..c7d297ceabdb 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4405,6 +4405,8 @@ static int arm_smmu_device_hw_probe(struct arm_smmu_device *smmu)
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR3);
>  	if (FIELD_GET(IDR3_RIL, reg))
>  		smmu->features |= ARM_SMMU_FEAT_RANGE_INV;
> +	if (FIELD_GET(IDR3_FWB, reg))
> +		smmu->features |= ARM_SMMU_FEAT_S2FWB;
>  
>  	/* IDR5 */
>  	reg = readl_relaxed(smmu->base + ARM_SMMU_IDR5);

Indeed. Looks like setting the feature flag was missed previously.

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

