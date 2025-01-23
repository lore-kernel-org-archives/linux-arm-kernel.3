Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B94DC02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 17:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f2lz1JhxCiAQPWfDUtfyCfkikpyW82hyEvi1Or2PPgU=; b=XAm3G6I4i6b4uv
	MQmxyDvpE2s+qDt+F+bxuFtx6hSDoBPblJRU3WX5+z8UdJ9dExfgWU6QLBXuYjtXpAPrb9IFfZjTg
	jFILyliHDaW32sQRaHVZBeflZpLOQIGPeJFTHHlZPH5IXx97M6kUyqO7o/HgofiuxeDB2ZrT3tfC5
	FiWOKwrch09NShUbAIDKSo+yC8xuAXLol+Ley8RJwaziaXKKs8DDIEDhZyJF0CfqO29i+CssR1c3N
	Nh17WhcWMzEyeQ5FEp6zXFcV33mA/+Kuebtgs2v6OwFbGuofOSb7ivvKbx7smC67u368XkMyaJjaT
	CWRHPrV1VY3j3IIkhWkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0of-0000000CuVE-3CFy;
	Thu, 23 Jan 2025 17:16:29 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0kt-0000000Ctj1-0XnZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 17:12:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737652354;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f2lz1JhxCiAQPWfDUtfyCfkikpyW82hyEvi1Or2PPgU=;
	b=T3p9y0nHATDF3oK5JeVZ6nPt0lVMEntPUyX9bAlMnttb8t4YF73LW9X6eS1fv4jrN6b+Bg
	yQ7V1QDAID2ZKHWJyfiGARlhYtayLNflYRwkpNcpB0au5oOnswVyThLQfwt1d/K8WDO9NY
	pkpOtzWbqit762HdsqQwat7hpOwIR1c=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-410-jEtXJIk0O5mN0XTun6E09Q-1; Thu, 23 Jan 2025 12:10:56 -0500
X-MC-Unique: jEtXJIk0O5mN0XTun6E09Q-1
X-Mimecast-MFC-AGG-ID: jEtXJIk0O5mN0XTun6E09Q
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-38a35a65575so737663f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 09:10:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737652255; x=1738257055;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f2lz1JhxCiAQPWfDUtfyCfkikpyW82hyEvi1Or2PPgU=;
        b=HPZurcfxzL9/KltgqFkRuNzNcef/RnOsd/W9I6AwAPP8huBvKka0JOC3VkztcuIzE2
         MQCJSBW39j1ip1YYw6K3GiNP6P0McRZSNdfc6A4+DkTnzqI80JkwbfiP3rzWkjIkq2Ts
         zpszpNOA5hAdWwagunJog5SNu1Ja2X08o6p86e6NeF5eOok8K22mPz4KxdKxOEJ41xbc
         tqn/pSoCXWPu+QlCtiZ9D6ibvDEB3ny1P/+m+ITDe/8JNuTrsnGrLAo8HQt8kVhEzhDZ
         ME2OlwKdr6sFQ4k5fYLXEbPDK7TNe2SyPVMjWTvqUDlSwudNFSHjdlVs6JUV5XtT6uE7
         jqCQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUW0IDAaFKC420y61JEVA+1ESVw0ZS/ByxKB0alCiug+w8624KwwZbsTMozxVntIHhK9BQ57HMTteQeBWvTKRb@lists.infradead.org
X-Gm-Message-State: AOJu0YyPqIBhsoa6L0c3itbT8bpvgMKXZqzHvY3m315UUjyXlV6gd15L
	ZczT6I9QwjhlhWN0SwpXCSi7ci0okleOrEPFttIjXjXiBYNogay7/1n/Ur5jCq7t6DpAeDXqITg
	zmHdro49cDNh15Jp6kAPBBnipxHuAsYNw3F2yfyFckfgoFc1sW5vg4o2epC11GdwVri6XY2qy
X-Gm-Gg: ASbGncudo5gQxW2fjdqtz4osp+GJrZr11lPNHYGVYpzrN0IOUAmh5D6qcZIVrWEePpr
	eGtniteV5haMnOEufGY4yn154USm9QXB9lIKqe9fjK2Bz5o//AGDafgM96TtAGnipw7IRHixtLH
	rRrlRQDLOsoRl0/Igs7Q2gSClm1g7BxafF1/wUvJ2x9XXZuLnkR7tLtJgkzAx69Ef96IQxB8eQD
	PLgc30oYZLFgQI5zNZ8qTcTptRwPdDUuQbH3E+lZPpJy6+WtmnI00dhQxb8inxdEGWQ9BpMyAsY
	H/K0t7eSLMvGehHGRTyQJaXOaoLuAjy4imV+9M2R4A==
X-Received: by 2002:a5d:6da4:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38bf57a9932mr29480865f8f.41.1737652255069;
        Thu, 23 Jan 2025 09:10:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK/5MgTOgXIu9+Lg1LjrltVZkaY8JHUprLufh35bjJjxTwBW+dXwhnf8hS5iSt70eBgqDsvw==
X-Received: by 2002:a5d:6da4:0:b0:38b:e32a:10a6 with SMTP id ffacd0b85a97d-38bf57a9932mr29480826f8f.41.1737652254632;
        Thu, 23 Jan 2025 09:10:54 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d9a39sm67975795e9.31.2025.01.23.09.10.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:10:53 -0800 (PST)
Message-ID: <1b48e138-3134-442a-9796-e3a33b106221@redhat.com>
Date: Thu, 23 Jan 2025 18:10:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 01/13] genirq/msi: Store the IOMMU IOVA directly in
 msi_desc instead of iommu_cookie
To: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, jgg@nvidia.com, kevin.tian@intel.com,
 tglx@linutronix.de, maz@kernel.org, alex.williamson@redhat.com
Cc: joro@8bytes.org, shuah@kernel.org, reinette.chatre@intel.com,
 yebin10@huawei.com, apatel@ventanamicro.com,
 shivamurthy.shastri@linutronix.de, bhelgaas@google.com,
 anna-maria@linutronix.de, yury.norov@gmail.com, nipun.gupta@amd.com,
 iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
 jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
 shameerali.kolothum.thodi@huawei.com, smostafa@google.com, ddutile@redhat.com
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <671b2128c193fc9ac9af0f4add96f85a785f513a.1736550979.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <671b2128c193fc9ac9af0f4add96f85a785f513a.1736550979.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VrWTFF8TNC0brDlyaShQkV_nId8QaQCdaGEi7cTy-uY_1737652255
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_091235_238563_828CE28D 
X-CRM114-Status: GOOD (  33.50  )
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
Reply-To: eric.auger@redhat.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


Hi Nicolin,

On 1/11/25 4:32 AM, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
>
> All the iommu cases simply want to override the MSI page's address with
those which translate MSIs
> the IOVA that was mapped through the iommu. This doesn't need a cookie
> pointer, we just need to store the IOVA and its page size in the msi_desc.
>
> Instead provide msi_desc_set_iommu_msi_iova() which allows the IOMMU side
> to specify the IOVA that the MSI page is placed during
> iommu_dma_prepare(). This is stored in the msi_desc and then
iommu_dma_prepare_msi()
> iommu_dma_compose_msi_msg() is a simple inline that sets address_hi/lo.
>
> The next patch will correct the naming.
>
> This is done because we cannot correctly lock access to group->domain in
> the atomic context that iommu_dma_compose_msi_msg() is called under. Today
> the locking miss is tolerable because dma_iommu.c operates under an
> assumption that the domain does not change while a driver is probed.
>
> However iommufd now permits the domain to change while the driver is
> probed and VFIO userspace can create races with IRQ changes calling
> iommu_dma_prepare/compose_msi_msg() and changing/freeing the iommu_domain.
and is it safe in iommu_dma_prepare_msi()?
>
> Removing the pointer, and critically, the call to
> iommu_get_domain_for_dev() during compose resolves this race.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h     |  6 ------
>  include/linux/msi.h       | 45 +++++++++++++++++++++++----------------
>  drivers/iommu/dma-iommu.c | 30 +++++---------------------
>  3 files changed, 32 insertions(+), 49 deletions(-)
>
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 318d27841130..3a4215966c1b 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -1513,7 +1513,6 @@ static inline void iommu_debugfs_setup(void) {}
>  int iommu_get_msi_cookie(struct iommu_domain *domain, dma_addr_t base);
>  
>  int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr);
> -void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg);
>  
>  #else /* CONFIG_IOMMU_DMA */
>  
> @@ -1529,11 +1528,6 @@ static inline int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_a
>  {
>  	return 0;
>  }
> -
> -static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> -{
> -}
> -
>  #endif	/* CONFIG_IOMMU_DMA */
>  
>  /*
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index b10093c4d00e..d442b4a69d56 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -184,7 +184,8 @@ struct msi_desc {
>  	struct msi_msg			msg;
>  	struct irq_affinity_desc	*affinity;
>  #ifdef CONFIG_IRQ_MSI_IOMMU
> -	const void			*iommu_cookie;
you may add kernel doc comments above
> +	u64				iommu_msi_iova : 58;
> +	u64				iommu_msi_page_shift : 6;
>  #endif
>  #ifdef CONFIG_SYSFS
>  	struct device_attribute		*sysfs_attrs;
> @@ -285,28 +286,36 @@ struct msi_desc *msi_next_desc(struct device *dev, unsigned int domid,
>  
>  #define msi_desc_to_dev(desc)		((desc)->dev)
>  
> -#ifdef CONFIG_IRQ_MSI_IOMMU
> -static inline const void *msi_desc_get_iommu_cookie(struct msi_desc *desc)
> -{
> -	return desc->iommu_cookie;
> -}
> -
> -static inline void msi_desc_set_iommu_cookie(struct msi_desc *desc,
> -					     const void *iommu_cookie)
> +static inline void msi_desc_set_iommu_msi_iova(struct msi_desc *desc,
> +					       u64 msi_iova,
> +					       unsigned int page_shift)
>  {
> -	desc->iommu_cookie = iommu_cookie;
> -}
> -#else
> -static inline const void *msi_desc_get_iommu_cookie(struct msi_desc *desc)
> -{
> -	return NULL;
> +#ifdef CONFIG_IRQ_MSI_IOMMU
> +	desc->iommu_msi_iova = msi_iova >> page_shift;
> +	desc->iommu_msi_page_shift = page_shift;
> +#endif
>  }
>  
> -static inline void msi_desc_set_iommu_cookie(struct msi_desc *desc,
> -					     const void *iommu_cookie)
> +/**
> + * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
> + * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> + * @msg: MSI message containing target physical address
> + */
> +static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
> +					     struct msi_msg *msg)
>  {
> -}
> +#ifdef CONFIG_IRQ_MSI_IOMMU
> +	if (desc->iommu_msi_page_shift) {
> +		u64 msi_iova = desc->iommu_msi_iova
> +			       << desc->iommu_msi_page_shift;
> +
> +		msg->address_hi = upper_32_bits(msi_iova);
> +		msg->address_lo = lower_32_bits(msi_iova) |
> +				  (msg->address_lo &
> +				   ((1 << desc->iommu_msi_page_shift) - 1));
> +	}
>  #endif
> +}
>  
>  int msi_domain_insert_msi_desc(struct device *dev, unsigned int domid,
>  			       struct msi_desc *init_desc);
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 2a9fa0c8cc00..bf91e014d179 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -1815,7 +1815,7 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
>  	static DEFINE_MUTEX(msi_prepare_lock); /* see below */
>  
>  	if (!domain || !domain->iova_cookie) {
> -		desc->iommu_cookie = NULL;
> +		msi_desc_set_iommu_msi_iova(desc, 0, 0);
>  		return 0;
>  	}
>  
> @@ -1827,33 +1827,13 @@ int iommu_dma_prepare_msi(struct msi_desc *desc, phys_addr_t msi_addr)
>  	mutex_lock(&msi_prepare_lock);
>  	msi_page = iommu_dma_get_msi_page(dev, msi_addr, domain);
>  	mutex_unlock(&msi_prepare_lock);
> -
> -	msi_desc_set_iommu_cookie(desc, msi_page);
> -
>  	if (!msi_page)
>  		return -ENOMEM;
> -	return 0;
> -}
>  
> -/**
> - * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
> - * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> - * @msg: MSI message containing target physical address
> - */
> -void iommu_dma_compose_msi_msg(struct msi_desc *desc, struct msi_msg *msg)
> -{
> -	struct device *dev = msi_desc_to_dev(desc);
> -	const struct iommu_domain *domain = iommu_get_domain_for_dev(dev);
> -	const struct iommu_dma_msi_page *msi_page;
> -
> -	msi_page = msi_desc_get_iommu_cookie(desc);
> -
> -	if (!domain || !domain->iova_cookie || WARN_ON(!msi_page))
> -		return;
> -
> -	msg->address_hi = upper_32_bits(msi_page->iova);
> -	msg->address_lo &= cookie_msi_granule(domain->iova_cookie) - 1;
> -	msg->address_lo += lower_32_bits(msi_page->iova);
> +	msi_desc_set_iommu_msi_iova(
> +		desc, msi_page->iova,
> +		ilog2(cookie_msi_granule(domain->iova_cookie)));
> +	return 0;
>  }
>  
>  static int iommu_dma_init(void)


