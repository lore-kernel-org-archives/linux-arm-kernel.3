Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D6A4C02192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 17:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cUinW45xP5e5WNhMH3KfMBEndfX+Wq9Gq0wkIWuPQkM=; b=IPLqlvxG50rKNZ
	d4DGHShQWPIlSWrLOiS+1suXG34Kq41hMmGjbeY27VLsz+kTfUxy0xOetCJUBuh6hlmbm3UCJxeNO
	JXN4COYV144j7kKM8zLIuZNNpyTYGc9kHFZxlgluo6VKEnzCVoFWD5Uu6Wdm/LZfgZYQwK29Rl0nP
	aK/AEIzaerrsOLbHXt7Ww7tMJFuLNpn24+SLYzf9lTl4REfmrwgltdrl9MHNrm3TFrBDOgMsRhU34
	2AwbmXiXNJ0o60Om35nPBUkii/KXt9Ur0s616vA8FpuVF2h6jRwa5mAUu3xaClaZMa9SeVpTXTXxq
	apyn6opVkfAvx+oQWBXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBoI-00000007U04-1GqJ;
	Wed, 29 Jan 2025 17:25:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdBmx-00000007TbP-1XCg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 17:23:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738171422;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cUinW45xP5e5WNhMH3KfMBEndfX+Wq9Gq0wkIWuPQkM=;
	b=I3bAWx54rCorILOhbHxkyJWp3CX1p+bjvafSd9mEXnFeVpi4rpI8JfJ79xnEE6YiEg3NnA
	IF65reYuPPsyD6NPtXSV5DMxfUktk3bTOV/FDsRBei9v5KpClYf6XNoTZFTdrxGAbz2wRH
	m4nqVlI1DjJKTpzfHP2LlmnaRBIbz70=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-117-YDTEjTRBM2q77zjIVbsPyA-1; Wed, 29 Jan 2025 12:23:39 -0500
X-MC-Unique: YDTEjTRBM2q77zjIVbsPyA-1
X-Mimecast-MFC-AGG-ID: YDTEjTRBM2q77zjIVbsPyA
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4361b090d23so36494845e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 09:23:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738171418; x=1738776218;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cUinW45xP5e5WNhMH3KfMBEndfX+Wq9Gq0wkIWuPQkM=;
        b=q8vi1OVlvr6wcTGjlGr7DlbHcR5OX8cdolSUWDVv51mnNNptfkb7uSpfQYWOZpraKZ
         ebdBqJQOMp4Xg1oyRIH22W+BByWQHeSYIt3JMs/MVyC9V2+7MfY3Nn4RzbICinSlMZVG
         wEHW6iO9H5hGH5vhWIo2M0AzhayH/TbncoeeSqOD10NGfA6a44OTDXD5SNlEp4U33Xyd
         VovFciLI/yejHWbCmWwN1GQ+XfjTXpe6h1bYquXJjBWMKcg+E84vhgroXdCIkNiVVALq
         iMwh6QStTniUCdeCV2XJ1A8GuLeBYi344NPa0//PXZS8KwNqsaIR6x0ooUPZijBONpRp
         sJcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWEujSZZxT/UIzOALbtFU9XK940KjSy7OjZJQjDANhzFqfSVKXPH6gxom4qIfHzmXoky/qFtzty1OV45qwRfpKI@lists.infradead.org
X-Gm-Message-State: AOJu0YyfwTPqXoVCNt9LzW8lCVwOB7OJkK0bCtLBH4RM4XHMiojHYiNI
	+yBUqDXfq26LY1as0cLsZgEpMS6TtBTq9ZmXw72kVEJGhTucs/ErpWn9HzRU2pHkKGxkTqeOGh7
	o0CThSRt/3PUNkRBTkUSBzmqHHl0zApKn0zrOIgvHRMjJxTMY1Njelpb6D9uJv7QM0XqYh7jf
X-Gm-Gg: ASbGnct3wL5hmDQErK7OmKJfwktHf64QgbEAHn3PnMnXQiDt/ygo3qblbFTd2YlsGqw
	xE8HibxG+qOXc2MRkheajZ5Jhwu1D8dfa56hNlZqrku96Rs6zx+6tnt3Eb4DJvjx/zC4tLf/j3B
	wk5YvAoFFmqQn4KEbVnqJXPom2AAiYvtf/WHAFs3ddBmB7fplDesWWsw4r0JF/NqVor4AMCrdkP
	yjO/jpY8astX7cK7I3B8ARMndCrjngn77vKJVZHE2Q5oycN6dmK8rTRHciFrbKDsQFy0/3nfpRN
	U5jgxXYDfyPR/7zMN0KFpAILsKNi3xMHOK1J8oP4GVmjaAcWtTwx
X-Received: by 2002:a05:600c:468d:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-438dc429eb0mr37292765e9.29.1738171418192;
        Wed, 29 Jan 2025 09:23:38 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEpj2GyirYUousb08KORRhwwxL2nA/aWckunw7W2c2Pu3YOW2k9PIs9cw16oemlKH4tI9rx+g==
X-Received: by 2002:a05:600c:468d:b0:434:f270:a513 with SMTP id 5b1f17b1804b1-438dc429eb0mr37292495e9.29.1738171417820;
        Wed, 29 Jan 2025 09:23:37 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-438dcc24cefsm29536565e9.15.2025.01.29.09.23.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 09:23:36 -0800 (PST)
Message-ID: <21ac88b0-fe93-4933-893c-7ffb09267e7b@redhat.com>
Date: Wed, 29 Jan 2025 18:23:33 +0100
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
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250129145800.GG5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HeIayrCFh9FaHEp3lZI3tlVrsfCeEkdCZ289apj8-VU_1738171418
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_092343_480850_882464A8 
X-CRM114-Status: GOOD (  24.45  )
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




On 1/29/25 3:58 PM, Jason Gunthorpe wrote:
> On Wed, Jan 29, 2025 at 02:44:12PM +0100, Eric Auger wrote:
>> Hi,
>>
>>
>> On 1/11/25 4:32 AM, Nicolin Chen wrote:
>>> For systems that require MSI pages to be mapped into the IOMMU translation
>>> the IOMMU driver provides an IOMMU_RESV_SW_MSI range, which is the default
>>> recommended IOVA window to place these mappings. However, there is nothing
>>> special about this address. And to support the RMR trick in VMM for nested
>> well at least it shall not overlap VMM's RAM. So it was not random either.
>>> translation, the VMM needs to know what sw_msi window the kernel is using.
>>> As there is no particular reason to force VMM to adopt the kernel default,
>>> provide a simple IOMMU_OPTION_SW_MSI_START/SIZE ioctl that the VMM can use
>>> to directly specify the sw_msi window that it wants to use, which replaces
>>> and disables the default IOMMU_RESV_SW_MSI from the driver to avoid having
>>> to build an API to discover the default IOMMU_RESV_SW_MSI.
>> IIUC the MSI window will then be different when using legacy VFIO
>> assignment and iommufd backend.
> ? They use the same, iommufd can have userspace override it. Then it
> will ignore the reserved region.
In current arm-smmu-v3.c you have
        region = iommu_alloc_resv_region(MSI_IOVA_BASE, MSI_IOVA_LENGTH,
                                         prot, IOMMU_RESV_SW_MSI,
GFP_KERNEL);

in arm_smmu_get_resv_regions()
If you overwrite the default region, don't you need to expose the user
defined resv region?

>
>> MSI reserved regions are exposed in
>> /sys/kernel/iommu_groups/<n>/reserved_regions
>> 0x0000000008000000 0x00000000080fffff msi
>  
>> Is that configurability reflected accordingly?
> ?
>
> Nothing using iommufd should parse that sysfs file.
Right but aren't you still supposed to populate the sysfs files
properly. This region must be carved out from the IOVA space, right?
>  
>> How do you make sure it does not collide with other resv regions? I
>> don't see any check here.
> Yes this does need to be checked, it does look missing. It still needs
> to create a reserved region in the ioas when attaching to keep the
> areas safe and it has to intersect with the incoming reserved
> regions from the driver.
>
>>> + * @IOMMU_OPTION_SW_MSI_START:
>>> + *    Change the base address of the IOMMU mapping region for MSI doorbell(s).
>>> + *    It must be set this before attaching a device to an IOAS/HWPT, otherwise
>>> + *    this option will be not effective on that IOAS/HWPT. User can choose to
>>> + *    let kernel pick a base address, by simply ignoring this option or setting
>>> + *    a value 0 to IOMMU_OPTION_SW_MSI_SIZE. Global option, object_id must be 0
>> I think we should document it cannot be put at a random place either.
> It can be put at any place a map can be placed.
to me It cannot overlap with guest RAM IPA so userspace needs to be
cautious about that

Eric
>
> That also needs to be checked when creating a domain, it can't be
> outside the geometry.
>
> Jason
>


