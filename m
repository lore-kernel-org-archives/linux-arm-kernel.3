Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B58C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Jul 2025 09:29:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wb1oowbSA1sVzCsjHghmLIDKPJGVzvuDr0F84v8tpM=; b=2w86h4BAubrCjoHi8VAZpRWzVc
	P/eMlX8sH92UDmJYvsdqf1zdLL7oM+vuuJo0qOg3Fll3eWKHGn85bCi6ABYC+RjKTSVOAKRKgaxYz
	GdOeSvlQcxySOB4uAaeaQhZNPxRGCsE+/YKr0MkByErth5/RAO8nf6O6xaWXByd9tA/0OZ+LAsOus
	AU7OfwnrjA1cn1pmwtPeAG0b1s8JPAlAiNbUNqXv47UhuFINNHP1m3eStcigxMDtvpYO86EQTt42y
	X4ydJPMjckG5Hf0Qejy3ZZJ4txaNxL8jf5YKAWjn+Vv8g2ztzVM/DzueVvNbKpoZ7IN/tUQPuMDeT
	YQ52/AYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaA3s-0000000EIwV-2nV1;
	Fri, 11 Jul 2025 09:28:56 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ua96B-0000000E8Kn-2pFL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Jul 2025 08:27:16 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-235e389599fso147345ad.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Jul 2025 01:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1752222435; x=1752827235; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wb1oowbSA1sVzCsjHghmLIDKPJGVzvuDr0F84v8tpM=;
        b=gxPr/fRfRq5xSjb+9fj/XMJ1hzBJzyJ/TBXymY95ZaV+uj33GuTr5IjON64gfo0vht
         Mf7A35KurrUWHiLDCbgV0zQBk61j13DNKQrYGna/bzMFS7+UGsTlGV88DauE/b0jcCLf
         a27/hJ8cML+NiI9LCCqkg0Ine4uEU3I3FS7nJ8ibq/KxHys7pqtM76gKEFhoU7atmX0R
         1R9VslalZ1F6bp/FxbrlgVpVg+8GyJwnlkQhOK1X0Q9/Wgch/7v+Amj2S4oJxVdRNU7O
         GD2FtcIgkY6kTttCvkzd5XmeaNiPDrXml6YkpAQRFtn+aPeneXFe9+taq9MuEw1Z/2DX
         whQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752222435; x=1752827235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wb1oowbSA1sVzCsjHghmLIDKPJGVzvuDr0F84v8tpM=;
        b=EyfvWp8RkNZK9uwLsxz2ffFGCZRtvlrjP4JATEzzfg6JehlWrGT3ehGkO0vJoZFQK3
         6WAi0BJoWT32A/8tJ4vD2NvfGfjm8jXJQrOjkcKMWmkAiepA65miF67b3hH7JgdVdX3q
         e9jlDhOItZko06UnrSLY50MSrFuYELMDqM/uv7uLSh7DDZATDuR+EDMbIJ763cPRxAqK
         8QDuxYL72z9UeN70eEyt/Dtg58SpCB7nG3/vHHj9nk/x+S0k4ECNUHiYq2Ez/eoSV5fU
         s4d/nuf3f0Cty7IE63lu+OGrBOdhwObECUSnW+PcTFOwwYCvMJHWPmobe0+q776vHLvv
         F9zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUqqp2eJDAVk6LS+bep7rMqZg3Ak7cqGDwDS67pEj7vlup19Uv5mzmGNDZCIwg7Xjbn8327qEdLZxKLyPmLHXXB@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8H16uKKSS/3NaU2tSWCdOSCvMJC/ztUoSsvd13GpBkr0XNrPe
	dVCLA7ICXXsjkB+lEoti2vGql8bg1qBFkjcmsHMNIGFHSowMdHaXcVMaxPnRvNzKcA==
X-Gm-Gg: ASbGncstTWbYokeNQi4bFb4VieU/CuD1KRtzKtrLXocHaPOmTFFwCkLiWbfhFAduVU7
	KT1HpYr9obi/7LeTNmc0U8g5ceAdnFxMwyhGNFeeJdQAVAlzZ5NN012gLBLMeXu+hS/CPwIDtjT
	1PBTxLXBjIgCFBpB7we0nGhG3hdIBwNJvctgJMfdl/uv/Hq+8NlE+W2VjbW5E1sIFMXVffCBZp9
	2UvBXkouNy5sBIHYDk8AiReIlXgBLhAwig/c7rrLEoZrlpELGVeginamqeXlhjvG36BO6hBBhhb
	epHH1v3xfM+RbxL6HkpZlhpTKJ5+OZDPOnfCW+xT+CBHR0imJHzXeleCXdOy8jyD7RgruFhahca
	7ImsrIA+C5pI0/Qpd8nPtvDXlgUZHJczcrWjZUiAPQWMZKEcD2vvM/Lvv
X-Google-Smtp-Source: AGHT+IGeQ9pS0bpSEY5lDbAotdJ5VOyrB44rPnDqbo9ssdh5gUYxMq4qPQG8JgMf7SMyjdyq4iZMZg==
X-Received: by 2002:a17:903:2b0b:b0:237:ef9c:ffd9 with SMTP id d9443c01a7336-23dee1c636bmr2323505ad.2.1752222434466;
        Fri, 11 Jul 2025 01:27:14 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de42aefe2sm42788465ad.65.2025.07.11.01.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Jul 2025 01:27:13 -0700 (PDT)
Date: Fri, 11 Jul 2025 08:27:08 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: will@kernel.org, joro@8bytes.org, jgg@nvidia.com, kevin.tian@intel.com,
	baolu.lu@linux.intel.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH rc] iommu/arm-smmu-v3: Revert vmaster in the error path
Message-ID: <aHDK3PIpwWvkwJtB@google.com>
References: <20250710233003.1662029-1-nicolinc@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250710233003.1662029-1-nicolinc@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250711_012715_710828_CB5BE180 
X-CRM114-Status: GOOD (  18.34  )
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

On Thu, Jul 10, 2025 at 04:30:03PM -0700, Nicolin Chen wrote:
> The error path in the arm_smmu_attach_prepare() was introduced with the
> arm_smmu_enable_iopf(). Due to a rebase issue, it forgot to include the
> revert of the vmaster.
> 
> Move kfree(state->vmaster) to the error path, to prevent memory leak.
> 
> Fixes: cfea71aea921 ("iommu/arm-smmu-v3: Put iopf enablement in the domain attach path")
> Cc: stable@vger.kernel.org
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks!
Praan

> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 181d07bc1a9d..3c79cdbbd9e7 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -2906,8 +2906,8 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  
>  		master_domain = kzalloc(sizeof(*master_domain), GFP_KERNEL);
>  		if (!master_domain) {
> -			kfree(state->vmaster);
> -			return -ENOMEM;
> +			ret = -ENOMEM;
> +			goto err_free_vmaster;
>  		}
>  		master_domain->domain = new_domain;
>  		master_domain->master = master;
> @@ -2941,7 +2941,6 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  		    !arm_smmu_master_canwbs(master)) {
>  			spin_unlock_irqrestore(&smmu_domain->devices_lock,
>  					       flags);
> -			kfree(state->vmaster);
>  			ret = -EINVAL;
>  			goto err_iopf;
>  		}
> @@ -2967,6 +2966,8 @@ int arm_smmu_attach_prepare(struct arm_smmu_attach_state *state,
>  	arm_smmu_disable_iopf(master, master_domain);
>  err_free_master_domain:
>  	kfree(master_domain);
> +err_free_vmaster:
> +	kfree(state->vmaster);
>  	return ret;
>  }
>  
> -- 
> 2.43.0
> 
> 

