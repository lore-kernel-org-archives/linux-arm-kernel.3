Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22959D6552E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 Nov 2024 17:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pg1WH4/I0jZVgF7EzjYgTyBHdR/uKOZ3f0DDPVvbwns=; b=KBIN6CasF9KD8GjXYmJs3+MvAD
	Wpo5w+FQIBn9Ch77fOi/Y1ln98ElK2XODNhmofj1GHsOQaBrgVr9qbUZS9frdhtDw37atKlZSWO/g
	u853Nn3QfR67A5IoV4lBd3+aFJXJkr2AQAqRpyAHJshAMgVIaP3ifQCubF10KpiZPFoAGh33V4885
	qAREU3jFIkJCe0DRfSqdT8pmvWii4picGsg51CWQiO50vhmnHL9iTnp6Pjcm4MkW2KnaMVCtqtexy
	Z98uM+yGbXsZ9s5JaxMJGxf+2FzFacZaL8FA+A6zu/J0kWLnSNEHp6JHk6pTmjPFpWWkrafkp47P/
	cw0tranA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz6N-0000000BGEh-0rwp;
	Tue, 26 Nov 2024 17:11:51 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFz5P-0000000BG5Q-2D6x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 Nov 2024 17:10:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732641049;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pg1WH4/I0jZVgF7EzjYgTyBHdR/uKOZ3f0DDPVvbwns=;
	b=TO64gHFFVF3WZ2Hy3LkLojzMAoMVIL7FzKP9qgL2OywrTH9ehwgNqMYUG9pgW8ysJ41nCs
	tCWMZ+l3W/7HC2N57mO4Iuh+FkOz+r9/FpUQCqqBOa2Gfn4+aIEijZ/BOVfywJcEf0OBOi
	Ne5nKc7DMj37nFBa5wuHZG9Cgq9hwas=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-120--Aa_ZBMQPoeME-_iqdvMaA-1; Tue, 26 Nov 2024 12:10:48 -0500
X-MC-Unique: -Aa_ZBMQPoeME-_iqdvMaA-1
X-Mimecast-MFC-AGG-ID: -Aa_ZBMQPoeME-_iqdvMaA
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-843eb4505e7so34739039f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 Nov 2024 09:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732641047; x=1733245847;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pg1WH4/I0jZVgF7EzjYgTyBHdR/uKOZ3f0DDPVvbwns=;
        b=TQPETs6OkXEC1I9NK2tAVArsO1ojZlwPRr+Lnw+AQW5s58ysNZE9oywLgnCzl/lwNc
         bhWv+kn9IBUhVWzKOim9JaIixruILCNp6bRt+8J+68c8/8KGsSFPOk8GpCK4Db30Zc8m
         GbiG5/pwmctFD6b3phkH59vcF0NZLV1LyhYzLPB1u2fIAQx/G5lgfnADlm1/DWJPQjEM
         n6NTo3FWhrbKq+lPVr4y8skqtGMrI3hTBrEvISP/P1JfziXEpWeH8iXufNZcBcIOW2CG
         j//gmxGDxWnxHlv8CDCcU6kBYG5JWDG11yibtJs6HmCNXNyLUcFYh+d6KoC9m9iRKJXF
         jAAw==
X-Forwarded-Encrypted: i=1; AJvYcCUtzgU/ZtDNYoq4oEM1wUPdmO8HLrF/30KTBJ9wlNgAW3WIZMAJPAL6mFSBnJRrnGNqz+X989iDdWWvokuSNSVj@lists.infradead.org
X-Gm-Message-State: AOJu0YzJs6y/qnXPCEIxP6JBa1cT2m1cSG6mPr8jC4xrVb5xZA0+TUDO
	FtaeY/grxkyHzowwAYiZTkrMkBIvRpu3Uzr9pQsuSMxvCLdWTn3HG3+LxSHzZc1zyiaKUAR601M
	iuKvnaH7oHgtV+JIk6ohaWd9cgi7GF/QOMzn0nxSdXyYJtiek/0foaX276dDT3/LMORbo8zTp
X-Gm-Gg: ASbGncvcK8AlCyADVoQvfSdT5p8yXzIejvhGVA4UJc6dSEcqTGi8uaweCNqNSn4o/um
	uBmWhg3qd2Klyg88LIyCZmtggFOjOG9uP6xcxAHv7xrS+L02zUWvN1b86vtZRiCka1/JAqzX5tB
	elztOpeCDzA5Gid4cLpw5psshbHdSzEAx6zrayr4Hzyk7nLXTsTiYQuDHszvEqZ+XbhiJIHHfLI
	3T9AIM9jhuNFfMPaKV3gwPw6SoQDyZgJNTKkOYX+HFLV2kbJM0=
X-Received: by 2002:a05:6e02:16ce:b0:3a7:8a39:269e with SMTP id e9e14a558f8ab-3a79aeea927mr188257395ab.18.1732641047498;
        Tue, 26 Nov 2024 09:10:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG6K6UNamiK6O/nxV7SHYbjCV/fiYY963jqY0jKdci5faeUGnSMsVF/gMvDkGoJTCkuUhR9iw==
X-Received: by 2002:a05:6e02:16ce:b0:3a7:8a39:269e with SMTP id e9e14a558f8ab-3a79aeea927mr188256395ab.18.1732641046931;
        Tue, 26 Nov 2024 09:10:46 -0800 (PST)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4e1efbcaa5bsm1792326173.78.2024.11.26.09.10.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Nov 2024 09:10:46 -0800 (PST)
Message-ID: <07252361-8886-4284-bdba-55c3fe728831@redhat.com>
Date: Tue, 26 Nov 2024 12:10:24 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/1] KVM: arm64: Map GPU memory with no struct pages
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
 apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
 mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
 alex.williamson@redhat.com, sebastianene@google.com, coltonlewis@google.com,
 kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
 akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
 kvmarm@lists.linux.dev, kvm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20241118131958.4609-1-ankita@nvidia.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <20241118131958.4609-1-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ILYntpeHmFEzDubkCSiWpwXZLTJyzlHhYdBWAM8yPpQ_1732641047
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_091051_637628_7C16C08E 
X-CRM114-Status: GOOD (  29.53  )
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

My email client says this patch: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using VMA flags
   is part of a thread for this titled patchPATCH.  Is it?

The description has similarities to above description, but some adds, some drops.

So, could you clean these two up into (a) a series, or (b) single, separate PATCH's?

Thanks.

- Don

On 11/18/24 8:19 AM, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Grace based platforms such as Grace Hopper/Blackwell Superchips have
> CPU accessible cache coherent GPU memory. The current KVM code
> prevents such memory to be mapped Normal cacheable and the patch aims
> to solve this use case.
> 
> Today KVM forces the memory to either NORMAL or DEVICE_nGnRE
> based on pfn_is_map_memory() and ignores the per-VMA flags that
> indicates the memory attributes. This means there is no way for
> a VM to get cachable IO memory (like from a CXL or pre-CXL device).
> In both cases the memory will be forced to be DEVICE_nGnRE and the
> VM's memory attributes will be ignored.
> 
> The pfn_is_map_memory() is thus restrictive and allows only for
> the memory that is added to the kernel to be marked as cacheable.
> In most cases the code needs to know if there is a struct page, or
> if the memory is in the kernel map and pfn_valid() is an appropriate
> API for this. Extend the umbrella with pfn_valid() to include memory
> with no struct pages for consideration to be mapped cacheable in
> stage 2. A !pfn_valid() implies that the memory is unsafe to be mapped
> as cacheable.
> 
> Also take care of the following two cases that are unsafe to be mapped
> as cacheable:
> 1. The VMA pgprot may have VM_IO set alongwith MT_NORMAL or MT_NORMAL_TAGGED.
>     Although unexpected and wrong, presence of such configuration cannot
>     be ruled out.
> 2. Configurations where VM_MTE_ALLOWED is not set and KVM_CAP_ARM_MTE
>     is enabled. Otherwise a malicious guest can enable MTE at stage 1
>     without the hypervisor being able to tell. This could cause external
>     aborts.
> 
> The GPU memory such as on the Grace Hopper systems is interchangeable
> with DDR memory and retains its properties. Executable faults should thus
> be allowed on the memory determined as Normal cacheable.
> 
> Note when FWB is not enabled, the kernel expects to trivially do
> cache management by flushing the memory by linearly converting a
> kvm_pte to phys_addr to a KVA, see kvm_flush_dcache_to_poc(). This is
> only possibile for struct page backed memory. Do not allow non-struct
> page memory to be cachable without FWB.
> 
> The changes are heavily influenced by the insightful discussions between
> Catalin Marinas and Jason Gunthorpe [1] on v1. Many thanks for their
> valuable suggestions.
> 
> Applied over next-20241117 and tested on the Grace Hopper and
> Grace Blackwell platforms by booting up VM and running several CUDA
> workloads. This has not been tested on MTE enabled hardware. If
> someone can give it a try, it will be very helpful.
> 
> v1 -> v2
> 1. Removed kvm_is_device_pfn() as a determiner for device type memory
>     determination. Instead using pfn_valid()
> 2. Added handling for MTE.
> 3. Minor cleanup.
> 
> Link: https://lore.kernel.org/lkml/20230907181459.18145-2-ankita@nvidia.com [1]
> 
> Ankit Agrawal (1):
>    KVM: arm64: Allow cacheable stage 2 mapping using VMA flags
> 
>   arch/arm64/include/asm/kvm_pgtable.h |   8 +++
>   arch/arm64/kvm/hyp/pgtable.c         |   2 +-
>   arch/arm64/kvm/mmu.c                 | 101 +++++++++++++++++++++------
>   3 files changed, 87 insertions(+), 24 deletions(-)
> 


