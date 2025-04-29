Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81112C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Apr 2025 21:51:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=; b=p0I+vH+HC97DSF4IAUHIUPPEgn
	iqtChiwl4r2zagDmO9fdqlSVyT6DDz817a17WQwsDPfHoV9qdpyZvqqapBYm4IGh7o2Xm2HQhNVTQ
	TvkzP83M7/QTaHdyyAIkn/fiZbXbXgz2fx/5f0EBKM/NWvaivsmo5Lj1KxvDu14hIYu2Cd1xpvCzB
	HSLPrhi/TPvMHKNc0UIjWqVB2/9pVbxybPtGYsTMQg7oKu5/qWbRz8p7EPVYK2A4RupJoOldaypNo
	XL3+oakUMAMTIGVhLTLHCf2vnP/l1z89Phk/6k7NHqe0ye6KjI4RbrZOrZ6E996qz0arBKSH8/ty7
	BvuDoAsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9sqs-0000000AuUB-40Bs;
	Tue, 29 Apr 2025 21:50:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9so2-0000000AtqS-01OZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Apr 2025 21:47:59 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2263428c8baso82455ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Apr 2025 14:47:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1745963277; x=1746568077; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=;
        b=C0HO1ojprxctw3tn5hA2iR9T+fW6Otoq2NAh6Un1qU8GQqPpqDrYnEP9ZfpU6HDbrj
         blufKWEX/RNCiP9gBz6sJ4e7oiIxarPAdaSxhT43Z6DIg/u/OjBRUCuNwLYjUsrs5zUs
         dSHtd7wujb0egmESM3qJLehGIonWdUUNulxbT4Pb3zb161DNwfeu5hQFXz4lUbDQBgWO
         dwFhY3ceQMtWWV+tOSh+wtafmEnZ1u5pAXpmw+U8CsSCklsbBq4Rvef1Fry7uEgKFW1y
         D7SYvv5xz9EmRlrQZXxGAy3renWfVTeOQOXQK6GSX049peommNV8hC1KsGvP6IHFi4D0
         hrfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745963277; x=1746568077;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lCmXc+ODhBacc+4C2xK0F/Ie+nOBoW/7aTrNsgbeX88=;
        b=FC/zWZVxZV+UgvTljTbn/XnmFH/74zak2agWAgUOsuW0skU+0ZKmlS54WhDlSG9gGL
         03RgUFQu9zdaW+YrdlOy3aOoaHb8WnSMgvV42tTbkaNbyFtcKkQ1JO5c1KITAL+aZbpG
         ml9MALHRj9bnmd643Gz3RxPJ5OOMtxrt1lBsUXpDvdtljoYK3kOqtVOKK4VlWC4EQ96M
         r2Z+ANlITyamo548iqg+eu6+b57zVKw8J3/mY/mjK++CRXcrwId7G+FG1LEKf1EO5qIV
         OLstLagVZ7l0c2ijf5aXe9LsRrxT9nJuJsPcD6BrvZ5Ef0bFz1hOKNd2rM6nCm0iQQPv
         RLSw==
X-Forwarded-Encrypted: i=1; AJvYcCUjYHPcug16retjdlOGjeXZxDRZINDylT5gVKcWQDBJv7mjLnLrftJVsC+jCFzAkztb5EzKnHylf8fLGAtl15OE@lists.infradead.org
X-Gm-Message-State: AOJu0YzLzQumsNr093Ey0KRZACSOIxk3jEcEMmHp3ey8z7hKLeBztinQ
	iCPHUVldG8NOXNDhJHrMwwPL8LM2QkXj8YosJLSbnLMJwpAo0cz3HLSoRY3OEg==
X-Gm-Gg: ASbGncskz1RIU0csAQJTGMj+m0+CVb4xfAqQZfmS8eNsjzTA1FcpqWoYYpXfwxHi2CG
	eAD+aaPDZrkdqZptxpfhv2vHtwdqzkF4v/ZaM35WBE3/XIQUYI9/wMv6ynJn8b1QINKCCv5rGlO
	i1uvVb0hfOTomWLBpFUOLhL/8J6JDF3Zbqa7+1q5fqL3FDsCA9uSPKDfF2W076/dKwKn85ryb/r
	/lXTHmc0TXDno4Kqdo08/nUzRa7L6hr6ah3bsHzZj+z1B2Hyd1xWFMurcnTAIyjzJXZvF1WDMz0
	NE5WapDRyfcrfJ5EsHEb5wMXKGGuWGyQHUAO4R8BeukoRR5nKh6i655JvvSgnvyH3TZhemrv
X-Google-Smtp-Source: AGHT+IFMqCAjaX52HtimqP3RondUOuNsl/Pw968hKtIW8LO6HydfSjoFrb+e/I5aVwqY3qXA13e21w==
X-Received: by 2002:a17:902:f649:b0:216:7aaa:4c5f with SMTP id d9443c01a7336-22df53e42e4mr308665ad.3.1745963277038;
        Tue, 29 Apr 2025 14:47:57 -0700 (PDT)
Received: from google.com (2.210.143.34.bc.googleusercontent.com. [34.143.210.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a34a119ffsm32042a91.21.2025.04.29.14.47.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 14:47:56 -0700 (PDT)
Date: Tue, 29 Apr 2025 21:47:46 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: jgg@nvidia.com, kevin.tian@intel.com, corbet@lwn.net, will@kernel.org,
	bagasdotme@gmail.com, robin.murphy@arm.com, joro@8bytes.org,
	thierry.reding@gmail.com, vdumpa@nvidia.com, jonathanh@nvidia.com,
	shuah@kernel.org, jsnitsel@redhat.com, nathan@kernel.org,
	peterz@infradead.org, yi.l.liu@intel.com, mshavit@google.com,
	zhangzekun11@huawei.com, iommu@lists.linux.dev,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
	linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
	mochs@nvidia.com, alok.a.tiwari@oracle.com, vasant.hegde@amd.com
Subject: Re: [PATCH v2 18/22] iommu/tegra241-cmdqv: Use request_threaded_irq
Message-ID: <aBFJAhpnPoUh-wQC@google.com>
References: <cover.1745646960.git.nicolinc@nvidia.com>
 <fb97e2407ebad5240f3981bbf4121a75ccd1ea57.1745646960.git.nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fb97e2407ebad5240f3981bbf4121a75ccd1ea57.1745646960.git.nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_144758_037187_D552E99D 
X-CRM114-Status: GOOD (  18.32  )
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

On Fri, Apr 25, 2025 at 10:58:13PM -0700, Nicolin Chen wrote:
> A vIRQ can be reported only from a threaded IRQ context. Change to use
> to request_threaded_irq to support that.
> 
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Pranjal Shrivastava <praan@google.com>

> ---
>  drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> index dd7d030d2e89..ba029f7d24ce 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/tegra241-cmdqv.c
> @@ -824,8 +824,9 @@ __tegra241_cmdqv_probe(struct arm_smmu_device *smmu, struct resource *res,
>  	cmdqv->dev = smmu->impl_dev;
>  
>  	if (cmdqv->irq > 0) {
> -		ret = request_irq(irq, tegra241_cmdqv_isr, 0, "tegra241-cmdqv",
> -				  cmdqv);
> +		ret = request_threaded_irq(irq, NULL, tegra241_cmdqv_isr,
> +					   IRQF_ONESHOT, "tegra241-cmdqv",
> +					   cmdqv);
>  		if (ret) {
>  			dev_err(cmdqv->dev, "failed to request irq (%d): %d\n",
>  				cmdqv->irq, ret);
> -- 
> 2.43.0
> 

