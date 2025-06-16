Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2F0FC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 21:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nbJOiRet1tK2+kvy2xbNTvVOXK/uFfHNcA+YMImy1oY=; b=vodkMPDta8cpzhJ9++kCA5k7OC
	Hc1KRIT2RZ8NW5R13WSSyKjrUVn+vyh3pD5msNrhgzHkVngBrtSCQsF/uyPqKHL7ZF84dOWkIq3jB
	m9GqMXYCZJSsFOKbfoZHt+jkWb7JrxH6N2J9SIdIYm6sbb7mHrTxh/92JWctSXu2Dp/yiUk7RP7Ow
	a9FaMp+HLNQJVg4Y1/wajA1fZyG03SRAePdurkT9TVONBXBR9ZFaTGT9A3M8lhYThxldeqK6OPC7z
	V+azrWKgPgQvMixmFMAdENm1ZL3hW63AIgFYvPrXpjC6woWrTb68W4jzkgy+zqHznzGESsfmcbZQR
	EY/zzPVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHqx-00000005dpk-1dtp;
	Mon, 16 Jun 2025 21:58:55 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHiN-00000005cMk-2gEs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 21:50:05 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-235e389599fso71435ad.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 14:50:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750110603; x=1750715403; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nbJOiRet1tK2+kvy2xbNTvVOXK/uFfHNcA+YMImy1oY=;
        b=eZlVZvSyPMBr1+TO/pcRQ9Fj6OYdVQ9zoRM0c+9hoCLDbJTmwENhy4w5K5UwOJ/ZLO
         tP9DU4sT0ele1O+E3d3g12QxdbBTRkEU5FY2ugSMaSS7ZIoRmw3i4Ik42bqSdRJodU+Q
         GB9VnE590ZM247feMnc75JXChyFJ+vAeVy6yyqCLyMB1NeAvAL0ts8DEcLHspvmKOGmN
         KLqy2Xg37HvBFuX4cf2BQdTgBZlARiYmKTJCPCBfSNRirR9raCh96kuLTg9YuToneJ+F
         JMlPdbfwPFd9wzjaCrPWsIh+4NFm4ye8vrlnaXK7HUqkfCKaO3hc8secDu0RxT8CsQaI
         icNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750110603; x=1750715403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nbJOiRet1tK2+kvy2xbNTvVOXK/uFfHNcA+YMImy1oY=;
        b=cdVdci/IOWrMz6i9LB7GdyvPZ+p+kXd5ND0JEP1oSXwjBc5QDyQQYG1zZoUf+aMqYR
         +SZwDAbh+tIK0sgceqF7nPNpQ+cSyfZNH0YRPZkLdhI2kFKMCZL8W1nPU91L749XskdV
         z9VW8UYbkPVS/BiAPzu87oISZHzQY1xRPMjeg8wr/FmMaRtvHXr2lJ2b5+lU90jg71Ci
         jIHkED7Zgp0qvCOoPDkqQxpD//epLwwd38uDnEVt8T0ioiAX1uTjQpSe4ZUYGdE4Wm1z
         qmsvlO2ghFs+YPqFeyhBYKSbsWlB4AGTds8yMKuSqAwSxXl6s9TV9Be82+mab2RzUNtj
         0riA==
X-Forwarded-Encrypted: i=1; AJvYcCUWLeh0uBIplD//FpFL8VJ9nJUPf8z98KxzRyvOROy/Yju1r6o64BA+9X+HKLNq85X7+LBPDcJnNG7tsmSwPWiW@lists.infradead.org
X-Gm-Message-State: AOJu0YwapFaHg0pJDlPH3WczTU8p+Dk/+AeEwwlDOIKgKDKxul+8fU9u
	JnIAUgkdgIxSSS3xtZ8Mmhs4kweP5j3aTHEa4iikLjeIbMt+hrCn4c1SJ/gHmJYmaA==
X-Gm-Gg: ASbGncu6cS7DUceIIeHFBLbogtFTdfN8LhL5ncngt/PmZjn/T76mWC6lRoYz93Pq5Hc
	TJWnQUHqlIXzxB9ZGSSgNdc/OBLIO+3LkwHowBRCb49mFWqcFGd8DIuvB2/5LjyWLkFjZxjVmYr
	T9sCp3KjVbO2lAyPfNU/qAkBL/oEfVa180AD0x26wG4N4heXGxp7dBNyTH0enivdKmkD4qSKIcC
	8uX+Y6WT1QneQJfUCpOy5nOts4eQJtCS9zjPDmLbmsnLRVizfwlsjE34vYBSJI8sf5gC8sdRAcq
	f7ixSwQ1YZrWkt4EX3mmmNpi4BsLjWzVx/nsm7FoUsLl9u57hbtN9wflMSAgh6BEWfhGiQZSrJU
	f0qu9nVrie+ykhovte4yY
X-Google-Smtp-Source: AGHT+IF5kh8T4/erotyg7EIWicbLom/nqSTy/PmeD+RjMgee3aQrbG4s0yxcVK37VjyTfpjXDUZbBw==
X-Received: by 2002:a17:902:e74f:b0:21f:631c:7fc9 with SMTP id d9443c01a7336-2366c4f491bmr6774135ad.0.1750110602745;
        Mon, 16 Jun 2025 14:50:02 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88c1f5sm66411465ad.25.2025.06.16.14.49.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 14:50:02 -0700 (PDT)
Date: Mon, 16 Jun 2025 21:49:53 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, will@kernel.org,
	robin.murphy@arm.com, joro@8bytes.org, yi.l.liu@intel.com,
	peterz@infradead.org, jsnitsel@redhat.com,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org, patches@lists.linux.dev,
	baolu.lu@linux.intel.com
Subject: Re: [PATCH v2 05/14] iommufd: Return EOPNOTSUPP for failures due to
 driver bugs
Message-ID: <aFCRgUeP8NJ_f-Q9@google.com>
References: <cover.1749882255.git.nicolinc@nvidia.com>
 <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <623bb6f0e8fdd7b9c5745a2f99f280163f9f1f5a.1749882255.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_145003_682368_2B31C0D4 
X-CRM114-Status: GOOD (  17.79  )
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

On Fri, Jun 13, 2025 at 11:35:17PM -0700, Nicolin Chen wrote:
> It's more accurate to report EOPNOTSUPP when an ioctl failed due to driver
> bug, since there is nothing wrong with the user space side.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/device.c       | 2 +-
>  drivers/iommu/iommufd/hw_pagetable.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index ed0dc539d490..e9b6ca47095c 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -1483,7 +1483,7 @@ int iommufd_get_hw_info(struct iommufd_ucmd *ucmd)
>  		 */
>  		if (WARN_ON_ONCE(cmd->out_data_type ==
>  				 IOMMU_HW_INFO_TYPE_NONE)) {
> -			rc = -ENODEV;
> +			rc = -EOPNOTSUPP;
>  			goto out_free;
>  		}
>  	} else {
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index 8565a6f596b2..fe789c2dc0c9 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -264,7 +264,7 @@ iommufd_hwpt_nested_alloc(struct iommufd_ctx *ictx,
>  	hwpt->domain->cookie_type = IOMMU_COOKIE_IOMMUFD;
>  
>  	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
> -		rc = -EINVAL;
> +		rc = -EOPNOTSUPP;
>  		goto out_abort;
>  	}
>  	return hwpt_nested;
> @@ -321,7 +321,7 @@ iommufd_viommu_alloc_hwpt_nested(struct iommufd_viommu *viommu, u32 flags,
>  	hwpt->domain->cookie_type = IOMMU_COOKIE_IOMMUFD;
>  
>  	if (WARN_ON_ONCE(hwpt->domain->type != IOMMU_DOMAIN_NESTED)) {
> -		rc = -EINVAL;
> +		rc = -EOPNOTSUPP;
>  		goto out_abort;
>  	}
>  	return hwpt_nested;

Much clearer retvals.
Reviewed-by: Pranjal Shrivastava <praan@google.com>

> -- 
> 2.43.0
> 

