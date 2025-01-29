Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14280C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 13:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ehaLD59VOlGQNJVYY9S7cn8vnhal1Jf6t1sz+p8LqBk=; b=zrrs4Ld6ZIDjs6
	7BMAVBE4TzEZAnFxhJGhlhmCq32unJDOMfZs94OdFDWamWauPgUiwJuecGtB1KMKZMPvU2+EetRR9
	cp5ajmKUpv2D+2Fpwl0WcuCkYEkYPPhbBPZsr6mbGpjnT8SQ4uCHW69678RyEjPslgmIkrDFmtfYz
	DtOfnx5BFg/FvR+ukV1u+IdAc2ZYRejNVPmjNBpbpDPU01fLM3w14DRIkhDgLmgBEfgiRl5OH8YMc
	0++ehp8bxD+HAq/wc4T+wjTfqo1Pr/X+rtrN0z+J8SIuyjG4FCmfi4EgB0/HqysoVAzpgeiEgPbuJ
	7heZw0eSJ2OCB5Ac1+5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td7vZ-00000006zco-0urE;
	Wed, 29 Jan 2025 13:16:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td7uE-00000006zPu-34KA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 13:15:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738156497;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ehaLD59VOlGQNJVYY9S7cn8vnhal1Jf6t1sz+p8LqBk=;
	b=hyCBSyc2dbfVYlLdCBleC8pvK6boNQ8oZ5S3bZY/I5XhSac88FXzNfJM42Et0QJWIftSa+
	2DjLmAKXrPCEuTmSPR0luW1wGHsMZ34wN9igzGwvsVe1JVlwcLf92RAoN/C9BdKT92tCuj
	bWjbQ1HDHwIcdct6fp3/DAW4pyHhXS4=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-C34adFmJP3aL137r1rlPqQ-1; Wed, 29 Jan 2025 08:14:56 -0500
X-MC-Unique: C34adFmJP3aL137r1rlPqQ-1
X-Mimecast-MFC-AGG-ID: C34adFmJP3aL137r1rlPqQ
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-467a0a6c846so140521371cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 05:14:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738156495; x=1738761295;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ehaLD59VOlGQNJVYY9S7cn8vnhal1Jf6t1sz+p8LqBk=;
        b=fTW/MpUQ5UpTf6llwWBEMsWfiYcjvt8ym0Wix3BUBF8Y2lhL3ZvJpGfTDWFkHmM3iy
         8SOfaL1iASZUnYRR8vCDeQNaZZZKOAXpfwDF0mtOEBVw3OecYUQHSmsxJVrF7vqbZ48K
         jBBXy4hXlCdkp4dFqN9k1Fxu+joOcYm9h7+Tl5KJdcETZ8YZZDHuB4pUopBUTLd/PnQl
         pGOTx3DNJ7JvlDOn3OM11TZ9us+W8F3KFtZqfLuZBqCs8Cv3tJBIiJ5DuMOwvcsPIrxq
         VJ5xXcP6rcU7ZtUpy/eJlA/fbPBmGW/N2P2Dx95SUg7nXqfTPOiLAF4iSP7gxrXhZuah
         kziQ==
X-Forwarded-Encrypted: i=1; AJvYcCWg8UrUGO0wwwm5UkQmxbrg/dk8UM4CdbxiCTD1VvxxyCU/k+Uf5nRJGF4DEt6THpeChJ8beHWFaDmzq2UV5sPw@lists.infradead.org
X-Gm-Message-State: AOJu0YyddOy9jid/lSP0//PUkchT+FG3hedoxaY6fifIQNftGJvfZW5e
	QMZkDZnO/J58qpqRkuily7lN3rN4I7RYl+3mDi6T8VByGqrKpVBnnTSnjP4jzuENxciUWbyFJQc
	yz71nbqfPA3lGxzRGg8XboprSbLB+LEbLe638LJIknQmYBIYygEGgaWJ0shBIZM3R0/zgHrsO
X-Gm-Gg: ASbGncsONFBJMTiUzjSfSPtsVh6oLTDmNgybR+gtp2Z9vWmFtRccQGlCE737iYyHMwN
	6eI6Hsp243WZnwXfAOP1ZlnJScOY8FmTjnW1P34rDlNB3QEXjAUhHWZFWE4xFDnoHQBtrZNaATc
	dbp60t0+OyMgFfSiHPOE6jy+RInGtfxGFO/lP4wlPHAtaGphK4Sa2Mlad0PbtEgL/+6YoETDdmD
	BZMya79CmbmPEHxMLoeO07e65FxvZAyrxeC7GYbm+3cc7wZ64M82no7XNTVcCAzN6jAY8ndvUEB
	Q9dhb3RftrNp/4rqj6B5zZUIyY037NGt1hXMaf3L7OLEkgwBL5He
X-Received: by 2002:a05:622a:1f95:b0:466:8f68:a606 with SMTP id d75a77b69052e-46fd0b8933fmr51420151cf.40.1738156495644;
        Wed, 29 Jan 2025 05:14:55 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0hlzQVzABYE1rVWDmtCfFtRMGLzg436MgJYB4YxGHvMQN+tBbfqahN31khaEjfZ7znX/xmg==
X-Received: by 2002:a05:622a:1f95:b0:466:8f68:a606 with SMTP id d75a77b69052e-46fd0b8933fmr51419521cf.40.1738156495253;
        Wed, 29 Jan 2025 05:14:55 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e66b870b1sm61901531cf.75.2025.01.29.05.14.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 05:14:54 -0800 (PST)
Message-ID: <2b7f6c5e-434b-4f36-beb1-94af12362c8d@redhat.com>
Date: Wed, 29 Jan 2025 14:14:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 06/13] iommufd: Make attach_handle generic
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
 <c708aedc678c63e2466b43ab9d4f8ac876e49aa1.1736550979.git.nicolinc@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <c708aedc678c63e2466b43ab9d4f8ac876e49aa1.1736550979.git.nicolinc@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: G4524OQUgxqwLqRCcPcLrW0bOInmSeZg79_H931XBIg_1738156496
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_051458_920734_E0C84854 
X-CRM114-Status: GOOD (  27.92  )
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

Hi,


On 1/11/25 4:32 AM, Nicolin Chen wrote:
> "attach_handle" was added exclusively for the iommufd_fault_iopf_handler()
> used by IOPF/PRI use cases, along with the "fault_data". Now, the iommufd
> version of sw_msi function will resue the attach_handle and fault_data for
reuse
> a non-fault case.
>
> Move the attach_handle part out of the fault.c file to make it generic for
> all cases. Simplify the remaining fault specific routine to attach/detach.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>
> ---
>  drivers/iommu/iommufd/iommufd_private.h |  40 +-------
>  drivers/iommu/iommufd/device.c          | 105 +++++++++++++++++++++
>  drivers/iommu/iommufd/fault.c           | 120 +++---------------------
>  3 files changed, 122 insertions(+), 143 deletions(-)
>
> diff --git a/drivers/iommu/iommufd/iommufd_private.h b/drivers/iommu/iommufd/iommufd_private.h
> index b6d706cf2c66..063c0a42f54f 100644
> --- a/drivers/iommu/iommufd/iommufd_private.h
> +++ b/drivers/iommu/iommufd/iommufd_private.h
> @@ -472,42 +472,12 @@ void iommufd_fault_destroy(struct iommufd_object *obj);
>  int iommufd_fault_iopf_handler(struct iopf_group *group);
>  
>  int iommufd_fault_domain_attach_dev(struct iommufd_hw_pagetable *hwpt,
> -				    struct iommufd_device *idev);
> +				    struct iommufd_device *idev,
> +				    bool enable_iopf);
>  void iommufd_fault_domain_detach_dev(struct iommufd_hw_pagetable *hwpt,
> -				     struct iommufd_device *idev);
> -int iommufd_fault_domain_replace_dev(struct iommufd_device *idev,
> -				     struct iommufd_hw_pagetable *hwpt,
> -				     struct iommufd_hw_pagetable *old);
> -
> -static inline int iommufd_hwpt_attach_device(struct iommufd_hw_pagetable *hwpt,
> -					     struct iommufd_device *idev)
> -{
> -	if (hwpt->fault)
> -		return iommufd_fault_domain_attach_dev(hwpt, idev);
> -
> -	return iommu_attach_group(hwpt->domain, idev->igroup->group);
> -}
> -
> -static inline void iommufd_hwpt_detach_device(struct iommufd_hw_pagetable *hwpt,
> -					      struct iommufd_device *idev)
> -{
> -	if (hwpt->fault) {
> -		iommufd_fault_domain_detach_dev(hwpt, idev);
> -		return;
> -	}
> -
> -	iommu_detach_group(hwpt->domain, idev->igroup->group);
> -}
> -
> -static inline int iommufd_hwpt_replace_device(struct iommufd_device *idev,
> -					      struct iommufd_hw_pagetable *hwpt,
> -					      struct iommufd_hw_pagetable *old)
> -{
> -	if (old->fault || hwpt->fault)
> -		return iommufd_fault_domain_replace_dev(idev, hwpt, old);
> -
> -	return iommu_group_replace_domain(idev->igroup->group, hwpt->domain);
> -}
> +				     struct iommufd_device *idev,
> +				     struct iommufd_attach_handle *handle,
> +				     bool disable_iopf);
>  
>  static inline struct iommufd_viommu *
>  iommufd_get_viommu(struct iommufd_ucmd *ucmd, u32 id)
> diff --git a/drivers/iommu/iommufd/device.c b/drivers/iommu/iommufd/device.c
> index dfd0898fb6c1..38b31b652147 100644
> --- a/drivers/iommu/iommufd/device.c
> +++ b/drivers/iommu/iommufd/device.c
> @@ -352,6 +352,111 @@ iommufd_device_attach_reserved_iova(struct iommufd_device *idev,
>  	return 0;
>  }
>  
> +/* The device attach/detach/replace helpers for attach_handle */
> +
> +static int iommufd_hwpt_attach_device(struct iommufd_hw_pagetable *hwpt,
> +				      struct iommufd_device *idev)
> +{
> +	struct iommufd_attach_handle *handle;
> +	int rc;
> +
> +	if (hwpt->fault) {
> +		rc = iommufd_fault_domain_attach_dev(hwpt, idev, true);
why don't we simply call iommufd_fault_iopf_enable(idev)
also it looks there is a redundant check of hwpt_fault here and in

iommufd_fault_domain_attach_dev

Besides the addition of enable_iopf param is not documented anywhere

> +		if (rc)
> +			return rc;
> +	}
> +
> +	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> +	if (!handle) {
> +		rc = -ENOMEM;
> +		goto out_fault_detach;
> +	}
> +
> +	handle->idev = idev;
> +	rc = iommu_attach_group_handle(hwpt->domain, idev->igroup->group,
> +				       &handle->handle);
> +	if (rc)
> +		goto out_free_handle;
> +
> +	return 0;
> +
> +out_free_handle:
> +	kfree(handle);
> +	handle = NULL;
> +out_fault_detach:
> +	if (hwpt->fault)
> +		iommufd_fault_domain_detach_dev(hwpt, idev, handle, true);
> +	return rc;
> +}
> +
> +static struct iommufd_attach_handle *
> +iommufd_device_get_attach_handle(struct iommufd_device *idev)
> +{
> +	struct iommu_attach_handle *handle;
> +
> +	handle =
> +		iommu_attach_handle_get(idev->igroup->group, IOMMU_NO_PASID, 0);
> +	if (IS_ERR(handle))
> +		return NULL;
> +	return to_iommufd_handle(handle);
> +}
> +
> +static void iommufd_hwpt_detach_device(struct iommufd_hw_pagetable *hwpt,
> +				       struct iommufd_device *idev)
> +{
> +	struct iommufd_attach_handle *handle;
> +
> +	handle = iommufd_device_get_attach_handle(idev);
> +	iommu_detach_group_handle(hwpt->domain, idev->igroup->group);
> +	if (hwpt->fault)
> +		iommufd_fault_domain_detach_dev(hwpt, idev, handle, true);
same here, pretty difficult to understand what this

iommufd_fault_domain_detach_dev does
To me calling iommufd_auto_response_faults and iommufd_fault_iopf_disable would be more readable or rename iommufd_fault_domain_detach_dev().
Also compared to the original code, there is a new check on handle. Why is it necessary.

Globally I feel that patch pretty hard to read. Would be nice to split if possible to ease the review process.

Thanks

Eric

> +	kfree(handle);
> +}
> +
> +static int iommufd_hwpt_replace_device(struct iommufd_device *idev,
> +				       struct iommufd_hw_pagetable *hwpt,
> +				       struct iommufd_hw_pagetable *old)
> +{
> +	struct iommufd_attach_handle *old_handle =
> +		iommufd_device_get_attach_handle(idev);
> +	struct iommufd_attach_handle *handle;
> +	int rc;
> +
> +	if (hwpt->fault) {
> +		rc = iommufd_fault_domain_attach_dev(hwpt, idev, !old->fault);
> +		if (rc)
> +			return rc;
> +	}
> +
> +	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> +	if (!handle) {
> +		rc = -ENOMEM;
> +		goto out_fault_detach;
> +	}
> +
> +	handle->idev = idev;
> +	rc = iommu_replace_group_handle(idev->igroup->group, hwpt->domain,
> +					&handle->handle);
> +	if (rc)
> +		goto out_free_handle;
> +
> +	if (old->fault)
> +		iommufd_fault_domain_detach_dev(old, idev, old_handle,
> +						!hwpt->fault);
> +	kfree(old_handle);
> +
> +	return 0;
> +
> +out_free_handle:
> +	kfree(handle);
> +	handle = NULL;
> +out_fault_detach:
> +	if (hwpt->fault)
> +		iommufd_fault_domain_detach_dev(hwpt, idev, handle,
> +						!old->fault);
> +	return rc;
> +}
> +
>  int iommufd_hw_pagetable_attach(struct iommufd_hw_pagetable *hwpt,
>  				struct iommufd_device *idev)
>  {
> diff --git a/drivers/iommu/iommufd/fault.c b/drivers/iommu/iommufd/fault.c
> index 06aa83a75e94..1d9bd3024b57 100644
> --- a/drivers/iommu/iommufd/fault.c
> +++ b/drivers/iommu/iommufd/fault.c
> @@ -60,42 +60,17 @@ static void iommufd_fault_iopf_disable(struct iommufd_device *idev)
>  	mutex_unlock(&idev->iopf_lock);
>  }
>  
> -static int __fault_domain_attach_dev(struct iommufd_hw_pagetable *hwpt,
> -				     struct iommufd_device *idev)
> -{
> -	struct iommufd_attach_handle *handle;
> -	int ret;
> -
> -	handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> -	if (!handle)
> -		return -ENOMEM;
> -
> -	handle->idev = idev;
> -	ret = iommu_attach_group_handle(hwpt->domain, idev->igroup->group,
> -					&handle->handle);
> -	if (ret)
> -		kfree(handle);
> -
> -	return ret;
> -}
> -
>  int iommufd_fault_domain_attach_dev(struct iommufd_hw_pagetable *hwpt,
> -				    struct iommufd_device *idev)
> +				    struct iommufd_device *idev,
> +				    bool enable_iopf)
>  {
> -	int ret;
> +	int rc = 0;
>  
>  	if (!hwpt->fault)
>  		return -EINVAL;
> -
> -	ret = iommufd_fault_iopf_enable(idev);
> -	if (ret)
> -		return ret;
> -
> -	ret = __fault_domain_attach_dev(hwpt, idev);
> -	if (ret)
> -		iommufd_fault_iopf_disable(idev);
> -
> -	return ret;
> +	if (enable_iopf)
> +		rc = iommufd_fault_iopf_enable(idev);
> +	return rc;
>  }
>  
>  static void iommufd_auto_response_faults(struct iommufd_hw_pagetable *hwpt,
> @@ -127,86 +102,15 @@ static void iommufd_auto_response_faults(struct iommufd_hw_pagetable *hwpt,
>  	mutex_unlock(&fault->mutex);
>  }
>  
> -static struct iommufd_attach_handle *
> -iommufd_device_get_attach_handle(struct iommufd_device *idev)
> -{
> -	struct iommu_attach_handle *handle;
> -
> -	handle = iommu_attach_handle_get(idev->igroup->group, IOMMU_NO_PASID, 0);
> -	if (IS_ERR(handle))
> -		return NULL;
> -
> -	return to_iommufd_handle(handle);
> -}
> -
>  void iommufd_fault_domain_detach_dev(struct iommufd_hw_pagetable *hwpt,
> -				     struct iommufd_device *idev)
> +				     struct iommufd_device *idev,
> +				     struct iommufd_attach_handle *handle,
> +				     bool disable_iopf)
>  {
> -	struct iommufd_attach_handle *handle;
> -
> -	handle = iommufd_device_get_attach_handle(idev);
> -	iommu_detach_group_handle(hwpt->domain, idev->igroup->group);
> -	iommufd_auto_response_faults(hwpt, handle);
> -	iommufd_fault_iopf_disable(idev);
> -	kfree(handle);
> -}
> -
> -static int __fault_domain_replace_dev(struct iommufd_device *idev,
> -				      struct iommufd_hw_pagetable *hwpt,
> -				      struct iommufd_hw_pagetable *old)
> -{
> -	struct iommufd_attach_handle *handle, *curr = NULL;
> -	int ret;
> -
> -	if (old->fault)
> -		curr = iommufd_device_get_attach_handle(idev);
> -
> -	if (hwpt->fault) {
> -		handle = kzalloc(sizeof(*handle), GFP_KERNEL);
> -		if (!handle)
> -			return -ENOMEM;
> -
> -		handle->idev = idev;
> -		ret = iommu_replace_group_handle(idev->igroup->group,
> -						 hwpt->domain, &handle->handle);
> -	} else {
> -		ret = iommu_replace_group_handle(idev->igroup->group,
> -						 hwpt->domain, NULL);
> -	}
> -
> -	if (!ret && curr) {
> -		iommufd_auto_response_faults(old, curr);
> -		kfree(curr);
> -	}
> -
> -	return ret;
> -}
> -
> -int iommufd_fault_domain_replace_dev(struct iommufd_device *idev,
> -				     struct iommufd_hw_pagetable *hwpt,
> -				     struct iommufd_hw_pagetable *old)
> -{
> -	bool iopf_off = !hwpt->fault && old->fault;
> -	bool iopf_on = hwpt->fault && !old->fault;
> -	int ret;
> -
> -	if (iopf_on) {
> -		ret = iommufd_fault_iopf_enable(idev);
> -		if (ret)
> -			return ret;
> -	}
> -
> -	ret = __fault_domain_replace_dev(idev, hwpt, old);
> -	if (ret) {
> -		if (iopf_on)
> -			iommufd_fault_iopf_disable(idev);
> -		return ret;
> -	}
> -
> -	if (iopf_off)
> +	if (handle)
> +		iommufd_auto_response_faults(hwpt, handle);
> +	if (disable_iopf)
>  		iommufd_fault_iopf_disable(idev);
> -
> -	return 0;
>  }
>  
>  void iommufd_fault_destroy(struct iommufd_object *obj)


