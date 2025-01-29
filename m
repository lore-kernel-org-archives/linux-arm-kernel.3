Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631C2C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1IHY9dSHJw552myqEIIBi0r2yle1SPObfgdh6fdw+s=; b=e3P5XuWcUvqiJq
	7/BePmLw+WVDIHEtK3pSszY6pPppfOUK7/U0yqtRRkHoSEnD1+BOV6tZk5xZjq0YFyFfUFCN2sOR+
	eSRmiMZhJIyLEb208wlCJ/5KPca/JW3+SHwVMGwz6YN2KG6OkAxM0/1RkdaK2Uvqpg7eRxtW5srOg
	kny6yjDrSrRtXzwstOHbwjhqVru5R56PV25P5Dz5bE00efZlkBXVbq6l3eegGHjutT/fIZ8Y8+tsD
	eeQha+zL++4lp0BbxGOyccNN15GbqdZEYyh2KdNKf2fXW1pilUdKD69ZLDS7SntRWqDLZjNbZZi1s
	6IQ3rcluN0DEJjchdARw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7Oi-00000006wvQ-3ibQ;
	Wed, 29 Jan 2025 12:42:24 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7NO-00000006wqD-05yM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 12:41:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738154460;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=o1IHY9dSHJw552myqEIIBi0r2yle1SPObfgdh6fdw+s=;
	b=Otj0gGdD7+bo/6VxA4/56moPK6NIZ6hvZfULWYOo0UogzIRamLJQhbnE9MOBb7HFFVQ0Xk
	w7qQv192b1wivxaXpJwKIVpJEQTyJ2uU9Gf0u/cRYddhJdowSgYxLsCB+26pqruXh9b2qi
	Nk+aj5nhi4YDT7RQd7NcsEOjXynCtx4=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-HKIJqmQmMju6c3VX7uNTHQ-1; Wed, 29 Jan 2025 07:40:59 -0500
X-MC-Unique: HKIJqmQmMju6c3VX7uNTHQ-1
X-Mimecast-MFC-AGG-ID: HKIJqmQmMju6c3VX7uNTHQ
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-385d52591d6so310133f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 04:40:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738154458; x=1738759258;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=o1IHY9dSHJw552myqEIIBi0r2yle1SPObfgdh6fdw+s=;
        b=eEv5weSgfSHyKOscVCkoH2BeeevDey+vObrAo/MqYoKmTY+EMvKabFtvhZFpCKrCqO
         LLmiVxI45H3KEvRIBdS0VlxODj8JYS96S63REFm9wlB4U6bE/f4uyb80apbwOSOb6aIN
         h7pohvaSxx2BdQSvC0xAxU+cu1/1Twta6szZSG9SV6dMRlHHnZnwEaZLi72ditGZaJDE
         vbfxmDjXP8W+23V8YWed51mYxII9wz/0VOpjBMfkqoZt4EQCtPnb6T65P98JCpXoW98X
         WsMPBoAJULanObCQLFAQt5l2CvtOj9w5oP483aQ3kqvCiY9mw9LFXG8WRCwQrhJAVgrh
         X7sg==
X-Forwarded-Encrypted: i=1; AJvYcCXlL8anu1ow0BVQwFWWbf72Ct//6EhP04WT9N6o4Q/jjKJ5QmaXNdomTpmA/OR+swz9O+gTIdoHhKO8DNWDxvBS@lists.infradead.org
X-Gm-Message-State: AOJu0YxxxUPSyf0nwCIQ0FrYMQrrKTP34mW0eRjbKp7eYmCNgR+F12vF
	X8T7nTHhPWxmBH5rojVSpEAr76NOHi7W/0C/Etf6guJTbJzijHs2MCS5ebV4WZwjNsZIyVHYRUk
	vohLh+Ltw3/MbLwjrl1ZusjGzyJt6ReCsmYlHbUmqOlR+Gn/DQoYPjdT1FTVz5kR+aveN/fwt
X-Gm-Gg: ASbGncuAeql5/XtXuswyQc8WX8lKoLAmCIGZScELJpA6Q1MwAedhlLX/XqGtEjB72so
	vi0LDNk5sqSThiOAHUoP/pXyUp8HTU+sjia5bLMSfEnJfBh3G6VcMJCPSdXyM20zklizD2bKLuX
	Vi90Mo1qJn4l1N6UfokbUm7EgK8/tbdOoRT4I7jP0sAu0ce4rPCXuJGPmgPsDaFEMxzNbaM/ryC
	0smhvwjH+EBDoFA6MbWeJMAWrx1qaMbKfZCmNZybGWf5cfCjZYotT9WVNC0X52vzxd3C6N1qpGp
	UIXAeEX+1wd0uKxqqaVGYm9qqPCQ2p9w0azdgagPvqouFg7NG4x8
X-Received: by 2002:a5d:6481:0:b0:386:34af:9bae with SMTP id ffacd0b85a97d-38c49a051c8mr6025096f8f.4.1738154458355;
        Wed, 29 Jan 2025 04:40:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFPImj5mHPLCO6tRj8e3YjFQx2gbmUE76baovajKNeTFowKfkm4iVE7BpqlFB2vM0krIkmApg==
X-Received: by 2002:a5d:6481:0:b0:386:34af:9bae with SMTP id ffacd0b85a97d-38c49a051c8mr6025054f8f.4.1738154457927;
        Wed, 29 Jan 2025 04:40:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a1baf3esm17214328f8f.75.2025.01.29.04.40.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 04:40:57 -0800 (PST)
Message-ID: <fd878b3a-ea02-49e0-9b5f-524e7fa1ecdf@redhat.com>
Date: Wed, 29 Jan 2025 13:40:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 05/13] iommu: Turn fault_data to iommufd private
 pointer
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
 <3b26ce04e8ecb5e47f028fe5cae48e5235e68420.1736550979.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <3b26ce04e8ecb5e47f028fe5cae48e5235e68420.1736550979.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EWmspNhjplINf3QbOHkGoK4mOj0TW5W48e7rsVyJBOM_1738154458
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_044102_148945_07E271B9 
X-CRM114-Status: GOOD (  20.22  )
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
> A "fault_data" was added exclusively for the iommufd_fault_iopf_handler()
> used by IOPF/PRI use cases, along with the attach_handle. Now, the iommufd
> version of sw_msi function will resue the attach_handle and fault_data for
reuse
> a non-fault case.
>
> Rename "fault_data" to "iommufd_hwpt" so as not to confine it to a "fault"
> case. Move it into a union to be the iommufd private pointer. A following
> patch will move the iova_cookie to the union for dma-iommu too, after the
> iommufd_sw_msi implementation is added.
>
> Since we have two unions now, add some simple comments for readability.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  include/linux/iommu.h                | 6 ++++--
>  drivers/iommu/iommufd/fault.c        | 2 +-
>  drivers/iommu/iommufd/hw_pagetable.c | 2 +-
>  3 files changed, 6 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/iommu.h b/include/linux/iommu.h
> index 423fdfa6b3bb..b6526d734f30 100644
> --- a/include/linux/iommu.h
> +++ b/include/linux/iommu.h
> @@ -224,8 +224,10 @@ struct iommu_domain {
>  		      phys_addr_t msi_addr);
>  #endif
>  
> -	void *fault_data;
> -	union {
> +	union { /* Pointer usable by owner of the domain */
> +		struct iommufd_hw_pagetable *iommufd_hwpt; /* iommufd */
> +	};
> +	union { /* Fault handler */
>  		struct {
>  			iommu_fault_handler_t handler;
>  			void *handler_token;
> diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
> index 1fe804e28a86..06aa83a75e94 100644
> --- a/drivers/iommu/iommufd/fault.c
> +++ b/drivers/iommu/iommufd/fault.c
> @@ -431,7 +431,7 @@ int iommufd_fault_iopf_handler(struct iopf_group *group)
>  	struct iommufd_hw_pagetable *hwpt;
>  	struct iommufd_fault *fault;
>  
> -	hwpt = group->attach_handle->domain->fault_data;
> +	hwpt = group->attach_handle->domain->iommufd_hwpt;
>  	fault = hwpt->fault;
>  
>  	mutex_lock(&fault->mutex);
> diff --git a/drivers/iommu/iommufd/hw_pagetable.c b/drivers/iommu/iommufd/hw_pagetable.c
> index ce03c3804651..f7c0d7b214b6 100644
> --- a/drivers/iommu/iommufd/hw_pagetable.c
> +++ b/drivers/iommu/iommufd/hw_pagetable.c
> @@ -402,10 +402,10 @@ int iommufd_hwpt_alloc(struct iommufd_ucmd *ucmd)
>  		}
>  		hwpt->fault = fault;
>  		hwpt->domain->iopf_handler = iommufd_fault_iopf_handler;
> -		hwpt->domain->fault_data = hwpt;
>  		refcount_inc(&fault->obj.users);
>  		iommufd_put_object(ucmd->ictx, &fault->obj);
>  	}
> +	hwpt->domain->iommufd_hwpt = hwpt;
don't we want to reset this somewhere on release path?

Eric
>  
>  	cmd->out_hwpt_id = hwpt->obj.id;
>  	rc = iommufd_ucmd_respond(ucmd, sizeof(*cmd));


