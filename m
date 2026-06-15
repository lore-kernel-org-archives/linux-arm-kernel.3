Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44A5CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 17:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DgnKfmS6z6l4miIjnb0HLgh5uoK/WiMJTbt1y/kDYuI=; b=sYpWbmXFfoLSSrPF00/rZZzakl
	yzHMFi4W+eL8EXzD4zuWXTcGzciYVCnrtjtrJazeFeUCDFS0+tZwb3rGxGjfYW+bssX0ByEYzXPaF
	hRvD7a6w1TFy1FGyKhitfkvISdEkozoVO6vl0SL1hqfLOKaXfPB0Jym1I3eeNI219ypdPF/PbKQX6
	5mEEE1aLiV0xOB6mqe3lMzgJfacsHkVDQolfHSgERDeu7OccznOsiL8HwP9O3sOKdX6Rj+RwAWWlw
	uANh6B7kD+bUoC+lnAIjw8zw2vjDHmUafwZQcDsGkpImY29yH3HrA9Qptz7yozLGWcfzEJmkdY9+q
	fZNcs5TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAjL-0000000EcY0-1CtG;
	Mon, 15 Jun 2026 17:04:11 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAjJ-0000000EcXe-28uD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 17:04:10 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-490bd64ca95so2595e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Jun 2026 10:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781543048; x=1782147848; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DgnKfmS6z6l4miIjnb0HLgh5uoK/WiMJTbt1y/kDYuI=;
        b=VYemLUAM2tZEhrV4Q54Twtt2HQV0Q7cxxVVKaSwrHiSJql/+3nFaEejMQerp7prc3g
         Oa7unO1HQ9ZJMTmMRLuAdJnU9aUBvLABbSAjMQkPw9GzM5L8GpvzrtvqvzUVbSQallKh
         EH59SLR0lOIkhsI/ApObjce9xxMqa5rhbUGJvGt0hDNT4BvDbo3d+DdxTkykXCJpKYZo
         An8C0CGirnfHTGzJjHcJdAgAoiPwoP1IV1SZV1pp7JFB/tRV6Skl3I0G79eslKH4e40/
         HNCAg9B1OhEX4Wmp4acBF/N6aXe5+eOMd33St0P4FShks8CrhiNLeOUAHMBVovsFYmho
         OEgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781543048; x=1782147848;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DgnKfmS6z6l4miIjnb0HLgh5uoK/WiMJTbt1y/kDYuI=;
        b=c+OEaZPFgxFsK7JTwNShItsr70OP/75eZpQd7lzu9tmP798oGU8kc733Z+seIwBr1S
         wtPM0Tw5F2pHH7rHnrVaSrU+FxYGkSsZq437jjcettizcQ3X4rY2d7GnTA6ZBdPtH/OE
         TfOJr+XtwYhyzV0OtW8s2ciKA6Mqfm5vP7rmaBeIskZBxA02L3VH92lbOdKrtWG8ATtr
         Igw83YrligWK/fjlVte716NdnwqHdl5vBQAyRFJWxH+/O2PLZ+RtLvSUFNukrcFUxndh
         icBRpqT/B6dRGZIMEMpFFhNahsHJ/YyQdHJhzAKrkivuwQaBu3/yyck6L175N6XEWGYb
         VyHw==
X-Forwarded-Encrypted: i=1; AFNElJ803V6AXFA59FHy+T2/7+7eP+zFzzDqykEl8WLTqiAqYbXzEn9rQ3Qa5v4tCewk/KWVIjcM7JoU3jNrJ8CmgGbN@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3L/tsWfI2640gH3J0vMjzMfpHKG7ebJNLjIF3FTIB489+0LuP
	DPZfxJ8QEJETYmMfObyzdBejSL4FVi2B7aGYKBV2++sVpj1SDAVOZfImI9hYae2RhA==
X-Gm-Gg: Acq92OE7rmqdmIgfd+Qlau7kj7jYNPDtcJYhD5Q1ud3EvcR8wWO04DZLz7fq+ndtvqp
	tylYRbqjyoQ5k0fiFSVykLD/M0cRf/H5PpVeIYlemg1mw/vX2upKHL7S3KDiNCT+/1lFWEXl49C
	tGvAufgA3c32ZBwY+c4PA9Dnm2iIQ1WvqPoWRKUtnjL8TVQxLNQmnd5X59xVAgUso9M115mTKIF
	8rhc3ctAbGOFABgMF3wdfdjw7dF7UKAJzBweeROzrcVmy+RBA8IowGUoG8Bz2XB/9O9ez+yvgP0
	g6etJg2OJZsgkHA8gbQkNAyhFlvdVdr6ItiwqUTk2/NicmbA3NBcmJVWam5socso0cqfn0BMJXX
	792ng5TfxsLvWTgzcoVH2VG5gsDz8ucZvzf1eznB3RKMNWemQTc4UaKYmEi0G+KHkJwxMYfqgiz
	z0rnfuqGEbQiGGUR283iZKfY2S06Lt23zoFJKcZGDXgk18nvU6r2CElqvtGIx88EME0R51iGlG
X-Received: by 2002:a05:600c:5254:b0:490:c2b6:de6a with SMTP id 5b1f17b1804b1-4922fcc2476mr52405e9.11.1781543046944;
        Mon, 15 Jun 2026 10:04:06 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2cf5d9sm31931222f8f.32.2026.06.15.10.04.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 10:04:06 -0700 (PDT)
Date: Mon, 15 Jun 2026 17:04:02 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: iommu@lists.linux.dev, Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Nicolin Chen <nicolinc@nvidia.com>,
	Daniel Mentz <danielmentz@google.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 05/12] iommu/arm-smmu-v3: Cache and restore MSI config
Message-ID: <ajAwgvSr1EbSj0tP@google.com>
References: <20260601215909.3958732-1-praan@google.com>
 <20260601215909.3958732-6-praan@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601215909.3958732-6-praan@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_100409_566001_CFE3869C 
X-CRM114-Status: GOOD (  24.64  )
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

On Mon, Jun 01, 2026 at 09:59:02PM +0000, Pranjal Shrivastava wrote:
> The SMMU's MSI configuration registers (*_IRQ_CFGn) containing target
> address, data and memory attributes lose their state when the SMMU is
> powered down. We'll need to cache and restore their contents to ensure
> that MSIs work after the system resumes.
> 
> To address this, cache the original `msi_msg` within the `msi_desc`
> when the configuration is first written by `arm_smmu_write_msi_msg`.
> This primarily includes the target address and data since the memory
> attributes are fixed.
> 
> Introduce a new helper `arm_smmu_resume_msis` which will later be called
> during the driver's resume callback. The helper would retrieve the
> cached MSI message for each relevant interrupt (evtq, gerr, priq) via
> get_cached_msi_msg & re-config the registers via arm_smmu_write_msi_msg.
> 
> Reviewed-by: Nicolin Chen <nicolinc@nvidia.com>
> Signed-off-by: Pranjal Shrivastava <praan@google.com>

Reviewed-by: Mostafa Saleh <smostafa@google.com>

Thanks,
Mostafa

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 37 +++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 8682be5060ed..93cee32f6c99 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -4551,6 +4551,9 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
>  	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
>  	phys_addr_t *cfg = arm_smmu_msi_cfg[desc->msi_index];
>  
> +	/* Cache the msi_msg for resume */
> +	desc->msg = *msg;
> +
>  	doorbell = (((u64)msg->address_hi) << 32) | msg->address_lo;
>  	doorbell &= MSI_CFG0_ADDR_MASK;
>  
> @@ -4559,6 +4562,40 @@ static void arm_smmu_write_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
>  	writel_relaxed(ARM_SMMU_MEMATTR_DEVICE_nGnRE, smmu->base + cfg[2]);
>  }
>  
> +static void arm_smmu_resume_msi(struct arm_smmu_device *smmu,
> +				unsigned int irq, const char *name)
> +{
> +	struct msi_desc *desc;
> +	struct msi_msg msg;
> +
> +	if (!irq)
> +		return;
> +
> +	desc = irq_get_msi_desc(irq);
> +	if (!desc) {
> +		dev_err(smmu->dev, "Failed to resume msi: %s", name);
> +		return;
> +	}
> +
> +	get_cached_msi_msg(irq, &msg);
> +	arm_smmu_write_msi_msg(desc, &msg);
> +}
> +
> +static void arm_smmu_resume_msis(struct arm_smmu_device *smmu)
> +{
> +	if (!(smmu->features & ARM_SMMU_FEAT_MSI))
> +		return;
> +
> +	if (!dev_get_msi_domain(smmu->dev))
> +		return;
> +
> +	arm_smmu_resume_msi(smmu, smmu->gerr_irq, "gerror");
> +	arm_smmu_resume_msi(smmu, smmu->evtq.q.irq, "evtq");
> +
> +	if (smmu->features & ARM_SMMU_FEAT_PRI)
> +		arm_smmu_resume_msi(smmu, smmu->priq.q.irq, "priq");
> +}
> +
>  static void arm_smmu_setup_msis(struct arm_smmu_device *smmu)
>  {
>  	int ret, nvec = ARM_SMMU_MAX_MSIS;
> -- 
> 2.54.0.1013.g208068f2d8-goog
> 
> 

