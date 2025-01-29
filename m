Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25CC6C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:53:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pxbyXuurc0dvUCpLFnEXoKIL7HoI7M2OYxW0aVnbFr4=; b=zbCAB6D0sdiN2Q
	Z321PuotK2QbzZyMT21C3MLSwmvN0OMNediWkaLG6YTrLF50SHfLDAYCGZ7KvVrTAwlhwQ+jIbQMp
	/InxeN8z1POaLdw2GWxtw0g9/TX3ktI33Buy3DlWblutga7t7FRmTWlLWcsD4dxCPANbULbCf2c1S
	aHXzY7S4PEo/EE29mE13Q2aJlv56H8fUNEB4Qur2oBspdQC6bS6db58zZiiVlQXYrC+vzV6OLe8Li
	aVdrH/nbEU/1tWyrd6kPxUqX/5dRnNZ9ZmH4/+xc8BWI3/Q1unwbBhrw4zTa0yIt/iTAbp2cgJpb8
	4XMO3argrglsfGqtVBtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCFM-00000007YI2-1ygm;
	Wed, 29 Jan 2025 17:53:04 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdCBt-00000007Xlr-0UrK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:49:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738172968;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pxbyXuurc0dvUCpLFnEXoKIL7HoI7M2OYxW0aVnbFr4=;
	b=MCqNaypsSaPTi+c3BmEtDLd4fat9cTJA4RGJgRNM80RpOSRu39OMe9meaEmtaw5Z+Z5Bf8
	KKEYM6bz9EqNPVZ6KU904unco4+yyTgeeL4vUCCCLBFnD19FaWmdADsiwwljvViXOUsZmo
	Mrqsg2VtIoILOvhc+QY+CE9xqllD0t0=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-217-zIEl7i5EPLSh1l6N7-U_yA-1; Wed, 29 Jan 2025 12:49:27 -0500
X-MC-Unique: zIEl7i5EPLSh1l6N7-U_yA-1
X-Mimecast-MFC-AGG-ID: zIEl7i5EPLSh1l6N7-U_yA
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-38c24ac3706so5456919f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 09:49:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738172966; x=1738777766;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pxbyXuurc0dvUCpLFnEXoKIL7HoI7M2OYxW0aVnbFr4=;
        b=j6+adJXJPVEBm0yxvICzF1a1sZ3zgFNbxd1wOHIlGh5kY1b7caapdq5I2G8hSBRi/B
         Z2YWpCcdjIjK6sfKZ1ZIuaRFVRLo7wwzEzMf+XNoSnWiaU8zdATygqDis4a9IPim8GDT
         1k3eCP12/b+7OKJqnKPcv+t8Ci6XpG6yNS0ouqZAjjOZVZenf10DGSgYHBWrykaUlrH+
         LK0DNUkPH2Xa5Zb5eGho+mYUXxHtwzbLB6X8iB5qnIuP0RokGGdlKqZ7Ug4TvODPHzr7
         Jt/tsiOSZy+yiTO+mHthg+f9/PrGYzwVdeu7xPmwis3fnAEPWkd9WeA73EnVOkiT+6bh
         9DDQ==
X-Forwarded-Encrypted: i=1; AJvYcCWM/s3NAT8PTKs7HKuIsckX9LSZ6Vr9qmdrBw+FYy4kSAuKXwrONRunhxz4qAfPLjQPe2T6A1ZTBYQoOMwdEN2r@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq5MR7b/Ip/zA/EDmpctBT0lCmEY5nxeb5kA/lqqo5i01cDOAL
	HgJZ+vpEVD4CBFGxRBRBdCtZFZXjPnW6HeadAHVegtldrfGcH4veZiPiBqQQRgmlfD9gRk1nlgO
	F0tT8cE0GPtCtKWBFpifc0nwJHJI4+UlBpdv/W7imIeNovl3hKl9zf70eED1pH+DjHZyVcjRQ
X-Gm-Gg: ASbGnctw9oZNVQhPEN8PS6wYSowHoJBejlY+zn6N6F4Thi12BWk6nFk5YrNRk2cXXkA
	w0aLU/2+A42RHD53jC4CZI4m+szgQMyzWNKcdLpqdLfDW7hDQtdx22yO9iqRB+gvfJATgBhUIEP
	swEYe53IHFBUSpjC7RjdwyZJ4YNaemgWma55/jx9K6NrIvxwks/91cU9mWTA97dcA2Ulg344Kju
	yXLF1mTJAply6sc9o/b/mP7cZc4YaV8ic00ZoE6V8Jr7Zyq/FRO7d4wVs6OhL2e+Ld4SHz2biKX
	2/IvKSA+Rou4ktkgBNMJLTRZsUOKwdaz9OLrfFaedctgTt/gaOFd
X-Received: by 2002:a05:6000:2a9:b0:385:eb85:f111 with SMTP id ffacd0b85a97d-38c51960449mr4176479f8f.14.1738172965838;
        Wed, 29 Jan 2025 09:49:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHZcuNSD2hPNqWa4PCH0KoHBYwz7G9outfVdx7sBB1yVqyndStjqCH81h7BEeHjltUf96/lwQ==
X-Received: by 2002:a05:6000:2a9:b0:385:eb85:f111 with SMTP id ffacd0b85a97d-38c51960449mr4176452f8f.14.1738172965407;
        Wed, 29 Jan 2025 09:49:25 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438d7aa605asm39995085e9.1.2025.01.29.09.49.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 09:49:24 -0800 (PST)
Message-ID: <6f630a23-e1b5-48de-81a6-43cbb1e6cabd@redhat.com>
Date: Wed, 29 Jan 2025 18:49:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 09/13] iommufd: Add IOMMU_OPTION_SW_MSI_START/SIZE
 ioctls
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, will@kernel.org,
 robin.murphy@arm.com, kevin.tian@intel.com, tglx@linutronix.de,
 maz@kernel.org, alex.williamson@redhat.com, joro@8bytes.org,
 shuah@kernel.org, reinette.chatre@intel.com, yebin10@huawei.com,
 apatel@ventanamicro.com, shivamurthy.shastri@linutronix.de,
 bhelgaas@google.com, anna-maria@linutronix.de, yury.norov@gmail.com,
 nipun.gupta@amd.com, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, kvm@vger.kernel.org,
 linux-kselftest@vger.kernel.org, patches@lists.linux.dev,
 jean-philippe@linaro.org, mdf@kernel.org, mshavit@google.com,
 shameerali.kolothum.thodi@huawei.com, smostafa@google.com, ddutile@redhat.com
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <d3cb1694e07be0e214dc44dcb2cb74f014606560.1736550979.git.nicolinc@nvidia.com>
 <0521187e-c511-4ab1-9ffa-be2be8eacd04@redhat.com>
 <20250129145800.GG5556@nvidia.com>
 <21ac88b0-fe93-4933-893c-7ffb09267e7b@redhat.com>
 <20250129173909.GI5556@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250129173909.GI5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: NF8MgDma54ecCbvvKNDplVcNlca2rPrl9c0wbvu_Q5w_1738172966
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_094929_227980_88330956 
X-CRM114-Status: GOOD (  21.84  )
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




On 1/29/25 6:39 PM, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 06:23:33PM +0100, Eric Auger wrote:
>>>> IIUC the MSI window will then be different when using legacy VFIO
>>>> assignment and iommufd backend.
>>> ? They use the same, iommufd can have userspace override it. Then it
>>> will ignore the reserved region.
>> In current arm-smmu-v3.c you have
>>         region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
>>                                          prot, IOMMU_RESV_SW_MSI,
>> GFP_KERNEL);
>>
>> in arm_smmu_get_resv_regions()
>> If you overwrite the default region, don't you need to expose the user
>> defined resv region?
> If it was overriden inside iommufd then the user told the kernel what
> range to use to override it. I don't need to go back and report back
> to userspace information that it already gave to the kernel..

Looks strange to me because info exposed in sysfs is wrong then. What if
someone else relies on this info, either at kernel level through the
get_resv_regions callback or from user space.
>
>>> Nothing using iommufd should parse that sysfs file.
>> Right but aren't you still supposed to populate the sysfs files
>> properly. This region must be carved out from the IOVA space, right?
> The sysfs shouldn't be changed here based on how iommufd decides to
> use the iova space. The sysfs reflects the information reported from
> the driver and sw_msi should be understood as the driver's
> recommendation when you view it from sysfs.
>
> The actual reserved regions in effect for an iommufd object are
> queried directly in iommufd and do not have a sysfs representation.
>
>>>>> + * @IOMMU_OPTION_SW_MSI_START:
>>>>> + *    Change the base address of the IOMMU mapping region for MSI doorbell(s).
>>>>> + *    It must be set this before attaching a device to an IOAS/HWPT, otherwise
>>>>> + *    this option will be not effective on that IOAS/HWPT. User can choose to
>>>>> + *    let kernel pick a base address, by simply ignoring this option or setting
>>>>> + *    a value 0 to IOMMU_OPTION_SW_MSI_SIZE. Global option, object_id must be 0
>>>> I think we should document it cannot be put at a random place either.
>>> It can be put at any place a map can be placed.
>> to me It cannot overlap with guest RAM IPA so userspace needs to be
>> cautious about that
> Yes, userspace needs to manage its own VM memory map to avoid
> overlaps, but from an API perspective it can be placed anywhere that a
> map can be placed.
OK

Eric
>
> Jason
>


