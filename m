Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63B14C35FFA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Mar 2025 23:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pqUvfgCQOghdtTuF5HGBJ7Mi+2WRJ2Z/XQlW4JgLaXg=; b=hGW0NEqx9J4C6JJ5o5rrtVu7HL
	aP1zb5QK6Wn6MEV9+veJcL7BIZiSAj/cYhmo6TbnWHmd/tmNoNIlhLvdKUYD5TyxbFFt/YraYJxtp
	ZVTzBDxNzjGJ0jbOVVbOMzStdZ+qefvwbRAdz4/ofzE/f5ZZAwvF6CFs4VmDi4Fk4SFk2ksT6t+MZ
	KKFO4j/UOzjXC2LuiomzcnzrVU8L+i1uoie1/xssdgmGXkTTOeju/npvZrdjZc70ou2gs7hpX8Wmd
	4K+sXvh1Iaeoj9CAonu+/i0DEdTe82IQieUOAZzSWXYntFNXRQHyEZO9ZUbatcVQ8gWIFNtADr9GG
	tgC/qfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2wB-0000000AUCP-086n;
	Wed, 19 Mar 2025 23:35:03 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv2sT-0000000ATD7-2ghp
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Mar 2025 23:31:14 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7c55500d08cso25881485a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 19 Mar 2025 16:31:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1742427072; x=1743031872; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pqUvfgCQOghdtTuF5HGBJ7Mi+2WRJ2Z/XQlW4JgLaXg=;
        b=Ub5g95vmickMFIGf23wpXssCNf+Eg8SeyyV0wqN4pX2tOHNexrDFBPz0HaQMwKGMfX
         +KlGb77Lu3i7S38cERuSj71lppmqUwad8vCKUHWAXvuVAAmevSuX49LavLmManQn358I
         gjHZOVzzI+zcyMaFbNOjgJE9b9MIngInr+VqWSUNoE6luBJG1H++/TqC+lAvk2E4TQkK
         s5J57ecv8BesYvKb4RaPXBfzJ5TgSpF18M5Y4Wq6UiNLJbrt6BdhPoCc8tBSt3zOs0ZE
         fd+jCwDgwqDGETAp4Lwjb+Nm4rt9oDljCw+f91ZBD6v9PD8uWAgO8CHJiFjl8Tn+1Ir9
         OAgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742427072; x=1743031872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pqUvfgCQOghdtTuF5HGBJ7Mi+2WRJ2Z/XQlW4JgLaXg=;
        b=etL75crqiFu4+v5OC5EXbBnhR4OeTxKXjU7XLSDCLSu6E1or1SLINbPemeIDCxZazw
         TPM31LbOr2yA/l2IBG3Gn//nPBaEX2Sjo5LKxBTAmg0SYx+nvty6RdWc3aMjNu1mCe4C
         Zc9CKtavuFijrVDw1OwG8yx9kS0fuRwZmSlIo3Ig5vBIAE1IhtEgfZt3d6V0u8j3jtKZ
         d/+PIkp+D2BREWVKvvk7rU5M5xx6S/M2ygG610YTgU0XLLiNaN5w4tZEQ53Kbm4EgWNy
         Y854d+xmKtSmbDCPkCAayiXLGMy4SjiEGb2sBkJxudMqPhmPNuw/RqFWcKVj/xcOyzCE
         Neyg==
X-Forwarded-Encrypted: i=1; AJvYcCVJfBiLZ/AD6feLxBrqNXEvKqfLVwvITMkFSZAO5HFN9TYNoMcPYENHEj2tqxhGc6nrklCE4Ryeon6BFNvl0a0F@lists.infradead.org
X-Gm-Message-State: AOJu0YxGRB/C7vN+qrzeftolQP8dMn1IdSBiWn8gothnVdh+tsB/bYD/
	yRMSNwjg4v7RVAZlwEkZs/4PM1EI8ud+Ab+gLkXqb0LM/wcz5TGNsGKyGD5FQPY=
X-Gm-Gg: ASbGnctFvuJhVRXLyS4N3KPoQo963IH4rt1UQienbI3fnARhj5HWxtskgcClSUol3Pz
	r5iWZy+d7suJ3q52nkSoDiIFD8XgFVHw9FJapGePLGPX1e73TMdivGYzz2BTgx6a+tthm8dO+Ye
	svXMkHve7PfgU3o394ZmQTWeY4qHLW14wjiPQqOqankIDSytbRNpI5Xr5dH0pPfEsncGdWtj2Xt
	1UTCumGRhBqpeoh44oC/ZiU5BtRusJ76VanpL/zkPe3cWjHNk1dyUyOwqgoikXGr75AWgRn6H6y
	Y/6lXxm0Nbzr5orXUcNi77nE5YBSHNtGLNCXqm5I2vYNMU1FNEHbcQU5LRxNApSTivmCswH7eaA
	SOWn+lFp3FxNbYhuFVA==
X-Google-Smtp-Source: AGHT+IGNIMXR9mOReHrVF+QcyuezWXU/5MU0g6sktMSQ902CBz/Kbj5Gj4SCICqdqfl7AjCygX5vIA==
X-Received: by 2002:a05:620a:1a28:b0:7c5:47d3:10c2 with SMTP id af79cd13be357-7c5a84a2882mr665758285a.52.1742427072577;
        Wed, 19 Mar 2025 16:31:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c573b3a042sm926026885a.0.2025.03.19.16.31.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 16:31:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tv2sR-00000000cc7-0ov1;
	Wed, 19 Mar 2025 20:31:11 -0300
Date: Wed, 19 Mar 2025 20:31:11 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Cc: kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linuxarm@huawei.com,
	kevin.tian@intel.com, alex.williamson@redhat.com, maz@kernel.org,
	oliver.upton@linux.dev, will@kernel.org, robin.murphy@arm.com,
	nicolinc@nvidia.com, jean-philippe@linaro.org,
	jonathan.cameron@huawei.com
Subject: Re: [RFC PATCH v3 3/5] iommu/arm-smmu-v3-iommufd: Pass in kvm
 pointer to viommu_alloc
Message-ID: <20250319233111.GE126678@ziepe.ca>
References: <20250319173202.78988-1-shameerali.kolothum.thodi@huawei.com>
 <20250319173202.78988-4-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250319173202.78988-4-shameerali.kolothum.thodi@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_163113_685209_15DBDA42 
X-CRM114-Status: GOOD (  13.81  )
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

On Wed, Mar 19, 2025 at 05:32:00PM +0000, Shameer Kolothum wrote:
> diff --git a/drivers/iommu/iommufd/viommu.c b/drivers/iommu/iommufd/viommu.c
> index 69b88e8c7c26..e157d786f295 100644
> --- a/drivers/iommu/iommufd/viommu.c
> +++ b/drivers/iommu/iommufd/viommu.c
> @@ -47,7 +47,8 @@ int iommufd_viommu_alloc_ioctl(struct iommufd_ucmd *ucmd)
>  		goto out_put_hwpt;
>  	}
>  
> -	viommu = ops->viommu_alloc(idev->dev, hwpt_paging->common.domain,
> +	viommu = ops->viommu_alloc(idev->dev, idev->kvm,
> +				   hwpt_paging->common.domain,
>  				   ucmd->ictx, cmd->type);
>  	if (IS_ERR(viommu)) {
>  		rc = PTR_ERR(viommu);

This has a lifetime issue on the kvm pointer.

Because nothing is taking a refcount on the kvm we are relying on the
caller to hold the kvm refcount for the lifetime of the
iommufd_device_bind()/unbind() which is creating the idev.

However, the lifetime of the viommu object is not linked to the
lifetime of the idev. So the idev could be destroyed, and the kvm
refcount put before the viommu is destroyed.

Probably the right answer is to take a refcount on the kvm for the
viommu object somewhere along this path.

Jason

