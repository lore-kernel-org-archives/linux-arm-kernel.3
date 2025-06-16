Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8983C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 20:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bylXQEyRsEC9se7T35uUhgi7mwDCmJDoSYBlOu6gy74=; b=kFEJY7Z9rlP4+ecT8LIU2josN1
	34XSHM5c+s3syl0cknMDaIlLeoI3TLHc2hIW/TwhYs/cXx8/JAFMDN7oza+qg0u1kznNcIVVxMjJ5
	TUMkeHGyocNn4teeHBXgEQDMsAiOgm3TFMMjWY+rsHSr8gKH/9ti4N8/XaPxRJs0CCnK2H6C4yvGv
	WmMEVbh4FydiKYNkI5XRoeK6Ke37mkf2RlwoTm07M+ll8/f7gdll375XwMBMZtWjPjqXRBFSxicid
	f4suXIUeQDqZG0JV6/N5TzlMc+R5DQ9E3cFQXZla/RhBWxH1SjXwpPILVhrF2GwTVVwl7/4TLB4sO
	jCvg/L1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRGsh-00000005WSt-3Kzr;
	Mon, 16 Jun 2025 20:56:39 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRGqS-00000005WHJ-3oLc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 20:54:22 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-2348ac8e0b4so17005ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 13:54:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750107259; x=1750712059; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bylXQEyRsEC9se7T35uUhgi7mwDCmJDoSYBlOu6gy74=;
        b=CLMR6XIKDmsCPOx4frkn5SjWTSnFSr0syG4xpxh8MpUnBDqa5u9tZnfP/Kn1o7muFF
         ZYFpjvo8sCtdUzeK+R0pN1ke59Sld9JMuzdlaQbMGUqE13O8d7CP4nshk1vxKhRo0/sw
         r9NHSGzgjFMwqUQDnCXimAraI3ihrjx7waQ+uqynKXB78yOLOBWw0RE5w3gEGbF7G75j
         6AzAxZ+ib71pblhMpnkq6EAt2bZpLC1haK4pByQbvzRD3St+/8/sj06kLob8HM2P3Min
         j69mJLvfSJKosqb8/UkdKSDrm2h/otkDQluY1lLWLM/v8r8algBMYmR7vH6TYIvzwUNS
         tJyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750107259; x=1750712059;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bylXQEyRsEC9se7T35uUhgi7mwDCmJDoSYBlOu6gy74=;
        b=w7+FrQWdduGptMvrFF0Q8zsDytGcOzx7mhNhElKuZIKen8nawEW9smCPXymvxLei9U
         fi+31Nwjuz44CDSV7Dtsl9UpneYt5WaX7gNR1wHX6zk7MR4s1LSl6nwLCVH9zQBLLxCM
         H+Wq7XCOzTyOQtBWjxiq4wRnv3VyaImzrU8oi90pwx7kNZjEOnDnpOXjDe5/J0QNXY8P
         W12GBjkfRGMDtINyobAOhi7lEe5xS7OyxGR8ukasUTUvW2PYQZOdr2hd1otf52cTmRXA
         gTUja7uw9HaK1RV2m9I0ZAzHHOsF9eUcxxv1+x6IOcv43QdtRttMQ4c9gg8eu+zjzoyh
         /NhQ==
X-Forwarded-Encrypted: i=1; AJvYcCW4rbdAIYnVWlMiKr7cjd6ZbqTFOeFoVGb1xz6VZCLbEXADbj0OeN68uvN9h/9PIzp16zlUNzXH9xeSMBb0eXyJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxPBtYaxN/+Ftr3n75jRISrT+rfpNi5YNky1O+wT1cD2Ga/NKgG
	TwdhFezHweKW1LzHGfBsFRulV7UrLvRvEWmVhOQKId7QGhc4p3ppMZllahHaKAIqjw==
X-Gm-Gg: ASbGnctll6Hqm/MtTb17l+QLTDhk68q5uOnu8AxiINRbqkIQ4mthMNwil0BIY89lzXa
	1dUuv2+mN8c9vsuMfOh+EAu2UXbLzpUBz2Nkn1ENMxSdzfV37FRlJIZczb0YEGhKwOr/0F88nrV
	KpGrr5YLPKe10ytdTsezKV7RbUw9qXPBvylp78xJH9llSkJSTlxCkrO/LfS+4Jc1MWo7x/M1YbH
	EUOdLNe0dmwIj5yXNC/EjZiuACvU9DsGV2Sq6xOnIyqSnzpalfXvC5DqJBCUC2F7fmHJTc3DxiT
	Ql0kwyOaWgyCltT7CquHVekNr605PMs65+7SGxmCVjgUMiv3EDpNVTagShjf/lgOM5VUj57Yp8k
	eANRMRrj48KRKFyDjxyLP
X-Google-Smtp-Source: AGHT+IF85pxVw9iF4idB17Pc9J6nncgf4wJ2a0JAQZ7KU8U2NL+V9q0BdH+v8rwfWv0L8lWMxivrUQ==
X-Received: by 2002:a17:902:e54f:b0:22c:3cda:df11 with SMTP id d9443c01a7336-2366c5bfaaamr6196145ad.10.1750107259136;
        Mon, 16 Jun 2025 13:54:19 -0700 (PDT)
Received: from google.com (232.98.126.34.bc.googleusercontent.com. [34.126.98.232])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74890083bb2sm7561368b3a.94.2025.06.16.13.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 13:54:16 -0700 (PDT)
Date: Mon, 16 Jun 2025 20:54:07 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Xueqi Zhang <xueqi.zhang@mediatek.com>
Cc: Yong Wu <yong.wu@mediatek.com>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	Ning li <ning.li@mediatek.com>, linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, iommu@lists.linux.dev
Subject: Re: [RFC PATCH 7/8] iommu/arm-smmu-v3: Invoke rpm operation before
 accessing the hw
Message-ID: <aFCEb744WpRpcDxM@google.com>
References: <20250616025628.25454-1-xueqi.zhang@mediatek.com>
 <20250616025628.25454-8-xueqi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250616025628.25454-8-xueqi.zhang@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_135420_952274_DAD88208 
X-CRM114-Status: GOOD (  30.04  )
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

On Mon, Jun 16, 2025 at 10:56:13AM +0800, Xueqi Zhang wrote:

Hi Xueqi,

> Invoke rpm operation before accessing the SMMU hw.
> 
> Signed-off-by: Xueqi Zhang <xueqi.zhang@mediatek.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 84 ++++++++++++++++++++-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h |  3 +
>  2 files changed, 85 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> index 154417b380fa..88912b0f8132 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
> @@ -122,6 +122,22 @@ static void parse_driver_options(struct arm_smmu_device *smmu)
>  	} while (arm_smmu_options[++i].opt);
>  }
>  
> +static int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
> +{
> +	if (smmu && smmu->impl && smmu->impl->smmu_power_get)
> +		return smmu->impl->smmu_power_get(smmu);
> +
> +	return 0;
> +}
> +
> +static int arm_smmu_rpm_put(struct arm_smmu_device *smmu)
> +{
> +	if (smmu && smmu->impl && smmu->impl->smmu_power_put)
> +		return smmu->impl->smmu_power_put(smmu);
> +
> +	return 0;
> +}
> +

I've been working on enabling PM runtime for arm-smmu-v3 for a while, 
I just posted the RFCv3 for that series [1]. I see that you need some
implementation specific rpm calls too, I think it would be nice if we
could align on this?

Perhaps, you could rebase this on top of my series OR we can collaborate
for the runtime PM series where you can contribute only the rpm patches
from this series to handle your implmentation? 
Let me know what you think! 

>  /* Low-level queue manipulation functions */
>  static bool queue_has_space(struct arm_smmu_ll_queue *q, u32 n)
>  {
> @@ -2082,23 +2098,35 @@ static irqreturn_t arm_smmu_gerror_handler(int irq, void *dev)
>  static irqreturn_t arm_smmu_combined_irq_thread(int irq, void *dev)
>  {
>  	struct arm_smmu_device *smmu = dev;
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret)
> +		return IRQ_NONE;
>  
>  	arm_smmu_evtq_thread(irq, dev);
>  	if (smmu->features & ARM_SMMU_FEAT_PRI)
>  		arm_smmu_priq_thread(irq, dev);
>  
> +	arm_smmu_rpm_put(smmu);
>  	return IRQ_HANDLED;
>  }
>  
>  static irqreturn_t arm_smmu_combined_irq_handler(int irq, void *dev)
>  {
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret)
> +		return IRQ_WAKE_THREAD;
>  
>  	arm_smmu_gerror_handler(irq, dev);
>  
>  	if (smmu->impl && smmu->impl->combined_irq_handle)
>  		smmu->impl->combined_irq_handle(irq, smmu);
>  
> +	arm_smmu_rpm_put(smmu);
>  	return IRQ_WAKE_THREAD;
>  }
>  
> @@ -2255,6 +2283,11 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  	struct arm_smmu_domain *smmu_domain = cookie;
>  	struct arm_smmu_device *smmu = smmu_domain->smmu;
>  	struct arm_smmu_cmdq_ent cmd;
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu);
> +	if (ret)
> +		return;
>  
>  	/*
>  	 * NOTE: when io-pgtable is in non-strict mode, we may get here with
> @@ -2271,6 +2304,8 @@ static void arm_smmu_tlb_inv_context(void *cookie)
>  		arm_smmu_cmdq_issue_cmd_with_sync(smmu, &cmd);
>  	}
>  	arm_smmu_atc_inv_domain(smmu_domain, 0, 0);
> +
> +	arm_smmu_rpm_put(smmu);
>  }
>  
>  static void __arm_smmu_tlb_inv_range(struct arm_smmu_cmdq_ent *cmd,
> @@ -2353,6 +2388,11 @@ static void arm_smmu_tlb_inv_range_domain(unsigned long iova, size_t size,
>  			.leaf	= leaf,
>  		},
>  	};
> +	int ret;
> +
> +	ret = arm_smmu_rpm_get(smmu_domain->smmu);
> +	if (ret)
> +		return;

I'm afraid we aren't going for a hard rpm_get in such functions in our
design as per the the discussions in the rpm series[1]. It would be 
great if you could review that too and drop some comments there, I'd be
happy to understand and collaborate to meet your requirements as well :)

[...]

>  static const struct of_device_id arm_smmu_of_match[] = {
> diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> index f45c4bf84bc1..cd96ff9cbc54 100644
> --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> @@ -792,6 +792,7 @@ struct arm_smmu_device {
>  
>  	struct rb_root			streams;
>  	struct mutex			streams_mutex;
> +
>  	const struct arm_smmu_v3_impl	*impl;
>  };
>  
> @@ -1004,6 +1005,8 @@ struct arm_smmu_v3_impl {
>  	int (*combined_irq_handle)(int irq, struct arm_smmu_device *smmu_dev);
>  	int (*smmu_evt_handler)(int irq, struct arm_smmu_device *smmu_dev,
>  				u64 *evt, struct ratelimit_state *rs);
> +	int (*smmu_power_get)(struct arm_smmu_device *smmu);
> +	int (*smmu_power_put)(struct arm_smmu_device *smmu);
>  };
>  
>  struct arm_smmu_device *arm_smmu_v3_impl_init(struct arm_smmu_device *smmu);
> -- 
> 2.46.0
> 

Thanks,
Praan

[1] https://lore.kernel.org/all/20250616203149.2649118-1-praan@google.com/

