Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20B7BC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 14:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=41DS6NhU0zxHo0sjvBCG7EzuBprQ0MM39VMITq82vi0=; b=Pl6tYIuXXyt0rh
	zNJEe7DgH2OhdVC8oK3M6bDK/iJiNIrVGy74juh6+Wl0bNsppRBlOCyGeK7iRDLrWFDAKwIe3TxR0
	eqj4/FjFM59tI8vozlt00jmeDF1plE33kbic+y2F6mSbwjLsWpiJeS/481PwISStUbV+67to4PAEC
	fLAmBLp2O9gVWQKEdIPs6bUNsXayNW8frpo1KQW5BIq/2eBHWLoDZeUKwHlyZkVF6D0ib9wKSzLvf
	HLA5IurNUtC5+28GefoLNz/oGKj80iVgy9CjcpfrfXs1t6/XRg25Rce7qurUnVu2TC2KCIPP6SUx8
	CmR3DgLEocBRmaWYrFlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td9UN-00000007Bk5-1Uw1;
	Wed, 29 Jan 2025 14:56:23 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td9T3-00000007BVN-0MU0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 14:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738162499;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=41DS6NhU0zxHo0sjvBCG7EzuBprQ0MM39VMITq82vi0=;
	b=fhSQsRfXzTx3tcRba6MG5SylUtN2vWjf07LfQ7VO4iJfePH0NSSniEhe0gY5bQ1aQ/zdFm
	wzjCioeUosKnXi5GF1GorNf1xbmvDychdPuUESSlc95MeGUXKhM22e7Zp8ySEhv77Mm5Sl
	wxuz59K7nso6HcEBf+pNDEGs2UcyRB0=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-223-669jKqBAPqCMXKDzAVYBQg-1; Wed, 29 Jan 2025 09:54:58 -0500
X-MC-Unique: 669jKqBAPqCMXKDzAVYBQg-1
X-Mimecast-MFC-AGG-ID: 669jKqBAPqCMXKDzAVYBQg
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7b6e5c9ef38so153353585a.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 29 Jan 2025 06:54:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738162498; x=1738767298;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=41DS6NhU0zxHo0sjvBCG7EzuBprQ0MM39VMITq82vi0=;
        b=Pt3/TWpRH4ERbfnOzcYo/fgzLed1YOWnv5d/Z+WqQcEneybDRGE1Oge00ol/YJSrek
         gMUVsFDia2UmcWbaeL4+KTn3IgLLeaX/qs/IbWwI64U4yiFuLlev6XsBFTKH8wvTqHqg
         V3Pm4VM3TXb0SMSJfspFejaSIgpBPIFyafR/BXxzqBs+EoUKH27fT/BooUZhPCyQwWU/
         +0XknfxJPtjwDFG4kkiw88gYnVh5GhWDP0pgvXFl5kCEvZt0eVZMDyTaV1aJUcnK3IcH
         TOPnjjGI0TR8I9yjIVNRsFZJj/FRWLOVpaywmUBpXWZxSkpAbAYhSJLKmrNJ+6S7ADJr
         2AWg==
X-Forwarded-Encrypted: i=1; AJvYcCVysf3niH5tQkMlzwI+9aAD5oq9aJkE1OurIS2Q9zHmjYWZYLzPpIFwr4SDWO22yO+v/ydZ1zBXHWsO7H45TPGs@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4JEEmAlkNndc3cm9YbYzSICMRrMNHlDOAM1uzu8jvj5oVXFa6
	0ue0wG5azmvFOEK8NmaYOi4ekPO2AYf7b8wI33v1uoQj2RUMCl7ggPoOqvSyNBOyyTF5Wez2blE
	zYTKYBHVUhiznXCfujFLATXClCN4vApVtuIaBRqkASKvgP+CzxPmI6wMkGxjWaXNjd1S/bmo2
X-Gm-Gg: ASbGncsdI68wj9ZnYYYliu9620PwOOgTOfLpz62PPol7+d5SDFnS51PebPCiHmUxgVT
	EDqEWNc8Rg5OIAIMjEY5qb1INyhMjOvCn8cBhd6D/vsvrgeUMV7Z878C+6WrvHgdWAQufaJLDgp
	4eVNroCmDxspSjHr/yffp2Pz+i/BkOjzTzPsxuPF9+dCiXXuk79G9BXOUOadH7Ljg5RtKQdC6LW
	+1uiKhB4u+KYrQLWM7MiaEAv2FqwFtvYwgOMsPdUktAnz7Ee+/xq7kuU+XEe0obvb+yDTI5cbnk
	e+LcxqLC1jGO0b/Ft9c1zVLDqECDP5Ng4HAZ4posnBoB7k40r9bu
X-Received: by 2002:a05:620a:3951:b0:7b6:d710:22ad with SMTP id af79cd13be357-7bffc653717mr574628285a.27.1738162497767;
        Wed, 29 Jan 2025 06:54:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHPWgJozhXbMPe2UuS+N7int1mBv1T30ENqy//KBekCyuXuA7cZhOllIHHQgTzUZoQnKd9qwQ==
X-Received: by 2002:a05:620a:3951:b0:7b6:d710:22ad with SMTP id af79cd13be357-7bffc653717mr574623385a.27.1738162497407;
        Wed, 29 Jan 2025 06:54:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9af0d281sm629855985a.99.2025.01.29.06.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jan 2025 06:54:56 -0800 (PST)
Message-ID: <de6b9dc1-dedd-4a3d-9db7-cb4b8e281697@redhat.com>
Date: Wed, 29 Jan 2025 15:54:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFCv2 00/13] iommu: Add MSI mapping support with nested
 SMMU
To: Jason Gunthorpe <jgg@nvidia.com>,
 Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, "will@kernel.org" <will@kernel.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "tglx@linutronix.de" <tglx@linutronix.de>, "maz@kernel.org"
 <maz@kernel.org>, "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "joro@8bytes.org" <joro@8bytes.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "reinette.chatre@intel.com" <reinette.chatre@intel.com>,
 "yebin (H)" <yebin10@huawei.com>,
 "apatel@ventanamicro.com" <apatel@ventanamicro.com>,
 "shivamurthy.shastri@linutronix.de" <shivamurthy.shastri@linutronix.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "anna-maria@linutronix.de" <anna-maria@linutronix.de>,
 "yury.norov@gmail.com" <yury.norov@gmail.com>,
 "nipun.gupta@amd.com" <nipun.gupta@amd.com>,
 "iommu@lists.linux.dev" <iommu@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "kvm@vger.kernel.org" <kvm@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "patches@lists.linux.dev" <patches@lists.linux.dev>,
 "jean-philippe@linaro.org" <jean-philippe@linaro.org>,
 "mdf@kernel.org" <mdf@kernel.org>, "mshavit@google.com"
 <mshavit@google.com>, "smostafa@google.com" <smostafa@google.com>,
 "ddutile@redhat.com" <ddutile@redhat.com>
References: <cover.1736550979.git.nicolinc@nvidia.com>
 <4946ea266bdc4b1e8796dee1b228bd8f@huawei.com>
 <20250123132432.GJ5556@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250123132432.GJ5556@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: aRDmek5wahflPZB6SUeQrNBnrV5li8INP0CEvHV7ROM_1738162498
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_065501_207621_2048E21A 
X-CRM114-Status: GOOD (  23.88  )
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


Hi Jason,

On 1/23/25 2:24 PM, Jason Gunthorpe wrote:
> On Thu, Jan 23, 2025 at 09:06:49AM +0000, Shameerali Kolothum Thodi wrote:
>
>> One confusion I have about the above text is, do we still plan to support the
>> approach -1( Using RMR in Qemu)
> Yes, it remains an option. The VMM would use the
> IOMMU_OPTION_SW_MSI_START/SIZE ioctls to tell the kernel where it
> wants to put the RMR region then it would send the RMR into the VM
> through ACPI.
>
> The kernel side promises that the RMR region will have a consistent
> (but unpredictable!) layout of ITS pages (however many are required)
> within that RMR space, regardless of what devices/domain are attached.
>
> I would like to start with patches up to #10 for this part as it
> solves two of the three problems here.
>
>> or you are just mentioning it here because
>> it is still possible to make use of that. I think from previous discussions the
>> argument was to adopt a more dedicated MSI pass-through model which I
>> think is  approach-2 here.  
> The basic flow of the pass through model is shown in the last two
> patches, it is not fully complete but is testable. It assumes a single
> ITS page. The VM would use IOMMU_OPTION_SW_MSI_START/SIZE to put the
> ITS page at the correct S2 location and then describe it in the ACPI
> as an ITS page not a RMR.
This is a nice to have feature but not mandated in the first place, is it?
>
> The VMM will capture the MSI writes and use
> VFIO_IRQ_SET_ACTION_PREPARE to convey the guests's S1 translation to
> the IRQ subsystem.
>
> This missing peice is cleaning up the ITS mapping to allow for
> multiple ITS pages. I've imagined that kvm would someone give iommufd
> a FD that holds the specific ITS pages instead of the
> IOMMU_OPTION_SW_MSI_START/SIZE flow.
That's what I don't get: at the moment you only pass the gIOVA. With
technique 2, how can you build the nested mapping, ie.

         S1           S2
gIOVA    ->    gDB    ->    hDB

without passing the full gIOVA/gDB S1 mapping to the host?

Eric


>
> Jason
>


