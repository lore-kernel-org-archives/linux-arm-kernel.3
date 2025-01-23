Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97109C02182
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 17:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fOKblc3FZS7ikfIHW19sV5gSa/Sm7uYNFXMWgCbP3w=; b=jo99F0xHuq0SBq
	H35dd8B7WAcF7352uBKh2eMBoc3YdrDhX04Xn17WIMS/GetYKe921BU3pybUv3Z6FWuVdGGvVeG2H
	6KttStSrAnhbe7FFUkklGuMq7OWknWVkAUT5AZBjcX6Vy63pmhkCv5mky5hclfDtzfjDrXO9a4mu0
	7TxMeH3PdMUhwoX1W4SZziZ5vlwNRlTseHJw4tF3yN1QZ6jwYHWrXQG2kkTNogm7NCmREreG+MR+E
	L97UNA1JFsSAXHrMDeU4T9AuD1W7AFjvykzR0jXowlC2WRxinhRbjO9fTROfT71wiecEpUeuFguRV
	OaxMVGEbMF+L/WM4D++A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0m9-0000000Ctwk-1icP;
	Thu, 23 Jan 2025 17:13:53 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tb0kq-0000000CtiD-2l2d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 17:12:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737652350;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8fOKblc3FZS7ikfIHW19sV5gSa/Sm7uYNFXMWgCbP3w=;
	b=eKbOPKdXZK3AfpHIHsRX+MNNjhDFGwl57uacrqGaAfIWP06FyUUvMmZ0on8QOrAiOauR+i
	GFsYCZfSxRyuW24aWkPdjcBJR5JtFtntqGq40ZvHHr7JITNV7BiXWo7QImvdArYWryUzPK
	rWtXAfobAqthNIdHOKMCfjq1yofjbp0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-BRltncKrPlyig3bg7Cz50Q-1; Thu, 23 Jan 2025 12:11:02 -0500
X-MC-Unique: BRltncKrPlyig3bg7Cz50Q-1
X-Mimecast-MFC-AGG-ID: BRltncKrPlyig3bg7Cz50Q
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-436328fcfeeso9369635e9.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Jan 2025 09:11:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737652261; x=1738257061;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8fOKblc3FZS7ikfIHW19sV5gSa/Sm7uYNFXMWgCbP3w=;
        b=v2xT/OL2AQDneNMZpu8a/P7yPZHhvZzy+xeiJ1+bcKFpwrPe6zkrZl0D8XLq8+4kd5
         2W/dpE8bfDBJnntOwm14LyzdUg8mJ2o5tOAqv/edEwJO6fs71mju3RHLaevrPrVmiQfs
         +ydJyb8XUxACrgTmcKe+Mksgsrv+mXm9E6kqKs3x8Tj0G1XaeEJx66kYQEclKpiOPmCL
         GaSPveojVVHaLgN1wELJVMtHqPn4HoDkmgIW7jgOAxsQjEvBuI16KpOKT1eGv0i15wJ8
         6GuX3kmZY4AVsIuxTO1XFJ2apxmSO65QQaYZg4WDR8qEgJYi8hLo3iNF4ERw2fVxApNC
         pFOg==
X-Forwarded-Encrypted: i=1; AJvYcCXa45CNQVGILX07ic3lSZOYqXbEQKmE9OHBt8JR4w8DQUFdmpTDQi+OmCciKQDNVP0jGPxwrE1dAbeC47RmDrNt@lists.infradead.org
X-Gm-Message-State: AOJu0YxLi639hnPypcOZvc1RoVM9+0TMuMKBdGx4gheDiOjH4arkm/cz
	mPa5cEuVMxrEpGVj9ok321/nd82zfxo7zFTRMoE+jVbE5KqrXotODDM5cVAbRgXeBQcWfhwq4IO
	SzKun5X5MYMHwSNsQGOZmfNYRy6BLveCodo0y5u1svAUFWPEHeK8yUn6eEL9V6WcuoJCcwfR4
X-Gm-Gg: ASbGnctxtEYV0Rlbsxa01xI0R9tY4L/5qXQbPI+LAZ6tHW5TPuBdSjkDmy+BgTEpHmJ
	593tGdKRTNYLpe0uGdgmQW/1d6bOeDLIUJJt9taZzYZY1RyxZeNLrso0QTPWZLo3CADy7p5RrJG
	985EWXK3Liv8tyx0+DZVV2BYg52092qxbbPz0KZG9XB8cKKhJfdiTnr9AuomZE2Rz9h+B2SQM93
	YZd4U4HyUVg6Fj0Rz5G77H+LpOfZFUoH+KcKXIyvzeRDDGjDVNsw6Xz8OkaInFHOsg2VszDfEhj
	+EP9onyYbWFIMW+5bXikuw9ZVIJ+8ZpDC8cR2PFF6A==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr280615825e9.0.1737652261100;
        Thu, 23 Jan 2025 09:11:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEve2JNXs/aOVwoBIaoWNaT3prodhge18rjmwvoIe2mZAtYGf3exTDDbW8BsosdzSW8HiTIkw==
X-Received: by 2002:a05:600c:c87:b0:434:ff30:a159 with SMTP id 5b1f17b1804b1-438912d54b1mr280615385e9.0.1737652260533;
        Thu, 23 Jan 2025 09:11:00 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438b31d9a39sm67975795e9.31.2025.01.23.09.10.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Jan 2025 09:10:59 -0800 (PST)
Message-ID: <fa9b443d-e068-41bc-ad03-9f04818c72e0@redhat.com>
Date: Thu, 23 Jan 2025 18:10:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 02/13] genirq/msi: Rename
 iommu_dma_compose_msi_msg() to msi_msg_set_msi_addr()
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
 <242034456c0bfcd7ecf75cb29d8e5c99db0675d6.1736550979.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <242034456c0bfcd7ecf75cb29d8e5c99db0675d6.1736550979.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CHt5li1wzFFfOJWPEfOO3Q8v_Q1NUMUhskMGZuHJDv8_1737652261
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_091232_760916_790F6082 
X-CRM114-Status: GOOD (  23.30  )
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




On 1/11/25 4:32 AM, Nicolin Chen wrote:
> From: Jason Gunthorpe <jgg@nvidia.com>
>
> The new function is used to take in a u64 MSI address and store it in the
> msi_msg. If the iommu has provided an alternative address then that is
> replaced instead.
>
> All callers have a tidy u64 already so this also consolidates the repeated
> low/high code into a small helper.
>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/msi.h               | 18 ++++++++----------
>  drivers/irqchip/irq-gic-v2m.c     |  5 +----
>  drivers/irqchip/irq-gic-v3-its.c  | 13 +++----------
>  drivers/irqchip/irq-gic-v3-mbi.c  | 12 ++++--------
>  drivers/irqchip/irq-ls-scfg-msi.c |  5 ++---
>  5 files changed, 18 insertions(+), 35 deletions(-)
>
> diff --git a/include/linux/msi.h b/include/linux/msi.h
> index d442b4a69d56..f6369748fc6e 100644
> --- a/include/linux/msi.h
> +++ b/include/linux/msi.h
> @@ -296,13 +296,8 @@ static inline void msi_desc_set_iommu_msi_iova(struct msi_desc *desc,
>  #endif
>  }
>  
> -/**
> - * iommu_dma_compose_msi_msg() - Apply translation to an MSI message
> - * @desc: MSI descriptor prepared by iommu_dma_prepare_msi()
> - * @msg: MSI message containing target physical address
> - */
> -static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
> -					     struct msi_msg *msg)
> +static inline void msi_msg_set_msi_addr(struct msi_desc *desc,
> +					struct msi_msg *msg, u64 msi_addr)
nit: msi_msg_set_addr(ess) may be enough as the populated fields are
address_lo/hi
>  {
>  #ifdef CONFIG_IRQ_MSI_IOMMU
>  	if (desc->iommu_msi_page_shift) {
> @@ -310,11 +305,14 @@ static inline void iommu_dma_compose_msi_msg(struct msi_desc *desc,
>  			       << desc->iommu_msi_page_shift;
>  
>  		msg->address_hi = upper_32_bits(msi_iova);
> -		msg->address_lo = lower_32_bits(msi_iova) |
> -				  (msg->address_lo &
> -				   ((1 << desc->iommu_msi_page_shift) - 1));
> +		msg->address_lo =
> +			lower_32_bits(msi_iova) |
> +			(msi_addr & ((1 << desc->iommu_msi_page_shift) - 1));
> +		return;
>  	}
>  #endif
> +	msg->address_hi = upper_32_bits(msi_addr);
> +	msg->address_lo = lower_32_bits(msi_addr);
>  }
>  
>  int msi_domain_insert_msi_desc(struct device *dev, unsigned int domid,
> diff --git a/drivers/irqchip/irq-gic-v2m.c b/drivers/irqchip/irq-gic-v2m.c
> index be35c5349986..6599c56873ad 100644
> --- a/drivers/irqchip/irq-gic-v2m.c
> +++ b/drivers/irqchip/irq-gic-v2m.c
> @@ -87,9 +87,6 @@ static void gicv2m_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  	struct v2m_data *v2m = irq_data_get_irq_chip_data(data);
>  	phys_addr_t addr = gicv2m_get_msi_addr(v2m, data->hwirq);
>  
> -	msg->address_hi = upper_32_bits(addr);
> -	msg->address_lo = lower_32_bits(addr);
> -
>  	if (v2m->flags & GICV2M_GRAVITON_ADDRESS_ONLY)
>  		msg->data = 0;
>  	else
> @@ -97,7 +94,7 @@ static void gicv2m_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  	if (v2m->flags & GICV2M_NEEDS_SPI_OFFSET)
>  		msg->data -= v2m->spi_offset;
>  
> -	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), msg);
> +	msi_msg_set_msi_addr(irq_data_get_msi_desc(data), msg, addr);
>  }
>  
>  static struct irq_chip gicv2m_irq_chip = {
> diff --git a/drivers/irqchip/irq-gic-v3-its.c b/drivers/irqchip/irq-gic-v3-its.c
> index 92244cfa0464..8c3ab7b471ca 100644
> --- a/drivers/irqchip/irq-gic-v3-its.c
> +++ b/drivers/irqchip/irq-gic-v3-its.c
> @@ -1809,17 +1809,10 @@ static u64 its_irq_get_msi_base(struct its_device *its_dev)
>  static void its_irq_compose_msi_msg(struct irq_data *d, struct msi_msg *msg)
>  {
>  	struct its_device *its_dev = irq_data_get_irq_chip_data(d);
> -	struct its_node *its;
> -	u64 addr;
> -
> -	its = its_dev->its;
> -	addr = its->get_msi_base(its_dev);
> -
> -	msg->address_lo		= lower_32_bits(addr);
> -	msg->address_hi		= upper_32_bits(addr);
> -	msg->data		= its_get_event_id(d);
>  
> -	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(d), msg);
> +	msg->data = its_get_event_id(d);
> +	msi_msg_set_msi_addr(irq_data_get_msi_desc(d), msg,
> +			     its_dev->its->get_msi_base(its_dev));
>  }
>  
>  static int its_irq_set_irqchip_state(struct irq_data *d,
> diff --git a/drivers/irqchip/irq-gic-v3-mbi.c b/drivers/irqchip/irq-gic-v3-mbi.c
> index 3fe870f8ee17..513479da9ee3 100644
> --- a/drivers/irqchip/irq-gic-v3-mbi.c
> +++ b/drivers/irqchip/irq-gic-v3-mbi.c
> @@ -147,22 +147,18 @@ static const struct irq_domain_ops mbi_domain_ops = {
>  
>  static void mbi_compose_msi_msg(struct irq_data *data, struct msi_msg *msg)
>  {
> -	msg[0].address_hi = upper_32_bits(mbi_phys_base + GICD_SETSPI_NSR);
> -	msg[0].address_lo = lower_32_bits(mbi_phys_base + GICD_SETSPI_NSR);
>  	msg[0].data = data->parent_data->hwirq;
> -
> -	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), msg);
> +	msi_msg_set_msi_addr(irq_data_get_msi_desc(data), &msg[0],
> +			     mbi_phys_base + GICD_SETSPI_NSR);
>  }
>  
>  static void mbi_compose_mbi_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	mbi_compose_msi_msg(data, msg);
>  
> -	msg[1].address_hi = upper_32_bits(mbi_phys_base + GICD_CLRSPI_NSR);
> -	msg[1].address_lo = lower_32_bits(mbi_phys_base + GICD_CLRSPI_NSR);
>  	msg[1].data = data->parent_data->hwirq;
> -
> -	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), &msg[1]);
> +	msi_msg_set_msi_addr(irq_data_get_msi_desc(data), &msg[1],
> +			     mbi_phys_base + GICD_CLRSPI_NSR);
>  }
>  
>  static bool mbi_init_dev_msi_info(struct device *dev, struct irq_domain *domain,
> diff --git a/drivers/irqchip/irq-ls-scfg-msi.c b/drivers/irqchip/irq-ls-scfg-msi.c
> index c0e1aafe468c..2ac6d89b4cb4 100644
> --- a/drivers/irqchip/irq-ls-scfg-msi.c
> +++ b/drivers/irqchip/irq-ls-scfg-msi.c
> @@ -87,8 +87,6 @@ static void ls_scfg_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
>  {
>  	struct ls_scfg_msi *msi_data = irq_data_get_irq_chip_data(data);
>  
> -	msg->address_hi = upper_32_bits(msi_data->msiir_addr);
> -	msg->address_lo = lower_32_bits(msi_data->msiir_addr);
>  	msg->data = data->hwirq;
>  
>  	if (msi_affinity_flag) {
> @@ -98,7 +96,8 @@ static void ls_scfg_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
>  		msg->data |= cpumask_first(mask);
>  	}
>  
> -	iommu_dma_compose_msi_msg(irq_data_get_msi_desc(data), msg);
> +	msi_msg_set_msi_addr(irq_data_get_msi_desc(data), msg,
> +			     msi_data->msiir_addr);
>  }
>  
>  static int ls_scfg_msi_set_affinity(struct irq_data *irq_data,


