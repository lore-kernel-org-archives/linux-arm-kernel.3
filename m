Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B853C36010
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DZGfkkPmnNx5Vcse4K7FbD7duuc9vXIWCD4w41JK8tg=; b=Czo+FRbJZJjUwBnaNveu1K5tae
	9PKLTMQOgZY6NUrA+AnoBI2RaP4i77TzdtZFeKFHz63/FHndBEp/7SRcTsYGDdlzl5XCe+WZ254K+
	oJwGmWmQwGZafWDgtK6aafbVhov8A9EMtpEG1V+wags6/xDAh80zvgwCjXBzWzW2vTmAwcHrHGzyk
	0xXkTYBwV9FlrPJJbb2xwcxIxZJxpJznorPAEji7CAQxDGZCCDUAbN9B7CMlRh8gE+0sBETauUMdp
	he35Gz84TbhywCMn2qVFwMzc1gnQN4oSbl8uge44fUd6L6aZQ4SIsryBGPw7PrmZtcQ0ubIvOyZiy
	9R7Gfibg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1iKl-0000000H6wI-0ej0;
	Mon, 07 Apr 2025 08:59:59 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1i5M-0000000H3ZE-2GzE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:44:05 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2263428c8baso325175ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:44:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744015444; x=1744620244; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DZGfkkPmnNx5Vcse4K7FbD7duuc9vXIWCD4w41JK8tg=;
        b=B22QFVF3hCBSVd42asjpvYPnttRfGRbnhdDlvAN6qzIBlUdexFEkUK375FBzGhqAgt
         P2lqUvz05gkAmbGjSTCgGVmvdNpbzRTelWGIz5YVULftEfOqDr2LzViAt41v+KwoO6Ac
         97XTJYJRCSTJ8dTcRAH+zG8+rlR5nDlCt7nRMelHYCT76FFTeDXKOMirpX4+Hu4BnAC5
         0GEU5LOMB02WLIGyKgwVKYhMhJGPcuXdKKdBxL1IWkQiWs5tWZVNJo5FsgtRvCdRh/xX
         PFMv/Z8wCMSpf6GylTJ4Z3s/mtNC77K+xit9YCG/aL1GRL5oEm4f6UgMiEHMpexen4JR
         2q7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744015444; x=1744620244;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DZGfkkPmnNx5Vcse4K7FbD7duuc9vXIWCD4w41JK8tg=;
        b=MT8PYl2rnUhVNpW7+D8xcAOUep5/9HSULW2WjtG9u/YqvitQqBhp83XWAoFSxEXUa+
         kFUXaqKnu24g47K84aNq/GIpASbkNUtL7FNAL3mcjNSI4HAOQgfupYFomfSxPoX3Ufco
         Yk/vAzsjRjUD/1j2yoj07azRmWC++cZWjNSold2Nqe9vFhDZteaXrETagkJ94B6MzsH+
         PKVzu32i/hDNu9wGdx3EekVJzZCMjfWA7DUcSbWhb2vxEcQhALQd4qpsZ/qKaiWhRUVP
         UmG2WZV1YthvIXb1qj5HNNk7WN3P/OvOWjZ9PQxGvKx6UAdsWkoZhkdpccu0yA+Y3lcC
         gLuw==
X-Forwarded-Encrypted: i=1; AJvYcCWsDqwSsBe9kb/uAYSAgztIe6LX3M11VZJlQHdJDc418XQO8YSdlUnpuFUwia4cV4b+D6gtlLgzdPDdyi6zRWPx@lists.infradead.org
X-Gm-Message-State: AOJu0YySVbJGz1qijGYNsiPqmhIfb50Su/2wO6QH6R3lpbu8uWz8w1c4
	cZFDeGnZRCrd0ADGOUuv46V5hWNt/i/gozQKv00KPYDvwQAp/cfryE1KEgibbw==
X-Gm-Gg: ASbGncuBfVWdFBBYAOY9gWS3ghrVuF0CjaXhToYSEciLQ4SyfMDg0hZs0eBy5POqFaF
	/7JftbsCplpwNN2HeDN+7mUvEFR9JhEPTpZJVkeEnupiDF3+5KfKuDzWDyI9+WATTw95bZhmyKy
	mhntcdf5ZvWqYmh4hCW/xhXYO0mTRlfj2dwTKtg0fYnHqS8BnL/bNLMtTJaE8QE7wx4yCO9lRzc
	pMBaerUVsTUtTjVB7evpmUzvasnuejytvr3AvezFE1pffKygK42K5kR/KP8DzU8fVMRH8YfPk5R
	M8HOgUbvH2wg3MsHxVM6cUxJAo9WcKgzqVqUQ+EZWEX0oK6kXfFq+HmJKDmiWllp5dLXN5WlYcl
	5bwzFmjzQiXF2aw==
X-Google-Smtp-Source: AGHT+IG8wjhur4IfqDYDYICfFUkplKu7lJpQ3Db3dou+cam/uidrheTR7PdDzM6iKfGDeqVg7o/0Iw==
X-Received: by 2002:a17:902:c3c1:b0:223:37ec:63be with SMTP id d9443c01a7336-22a95e499damr3284425ad.4.1744015443341;
        Mon, 07 Apr 2025 01:44:03 -0700 (PDT)
Received: from google.com (188.152.87.34.bc.googleusercontent.com. [34.87.152.188])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3058494a321sm8298964a91.19.2025.04.07.01.44.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:44:02 -0700 (PDT)
Date: Mon, 7 Apr 2025 08:43:55 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, robin.murphy@arm.com, jgg@nvidia.com, joro@8bytes.org,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, shameerali.kolothum.thodi@huawei.com
Subject: Re: [PATCH v1 2/4] iommu/arm-smmu-v3: Share
 arm_smmu_cmdq_issue_cmd_with_sync() with vsmmu
Message-ID: <Z_OQS-4P8HfL7M4s@google.com>
References: <cover.1741150594.git.nicolinc@nvidia.com>
 <e9e8df0b9dadfb8c716b8b9072657327ab14898c.1741150594.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e9e8df0b9dadfb8c716b8b9072657327ab14898c.1741150594.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_014404_581688_431F5615 
X-CRM114-Status: GOOD (  16.06  )
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

On Tue, Mar 04, 2025 at 09:04:01PM -0800, Nicolin Chen wrote:
> Allow arm-smmu-v3-iommufd to call it for S2 cache invalidations.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>
Thanks
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h | 2 ++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 4 ++--
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index e08c4ede4b2d..3336d196062c 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -984,6 +984,8 @@ void arm_smmu_install_ste_for_dev(struct arm_smmu_master *master,
>  int arm_smmu_cmdq_issue_cmdlist(struct arm_smmu_device *smmu,
>  				struct arm_smmu_cmdq *cmdq, u64 *cmds, int n,
>  				bool sync);
> +int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> +				      struct arm_smmu_cmdq_ent *ent);
>  
>  #ifdef CONFIG_ARM_SMMU_V3_SVA
>  bool arm_smmu_sva_supported(struct arm_smmu_device *smmu);
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 310bb4109ec9..0462eb1b2912 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -929,8 +929,8 @@ static int arm_smmu_cmdq_issue_cmd(struct arm_smmu_device *smmu,
>  	return __arm_smmu_cmdq_issue_cmd(smmu, ent, false);
>  }
>  
> -static int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> -					     struct arm_smmu_cmdq_ent *ent)
> +int arm_smmu_cmdq_issue_cmd_with_sync(struct arm_smmu_device *smmu,
> +				      struct arm_smmu_cmdq_ent *ent)
>  {
>  	return __arm_smmu_cmdq_issue_cmd(smmu, ent, true);
>  }
> -- 
> 2.43.0
> 
> 

