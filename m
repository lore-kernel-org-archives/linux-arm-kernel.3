Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66808C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 17:48:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYPE9kAm4n5JaaAj3WmzYSVaYGMobSZ1mvZBnXOb9Jo=; b=upXLI2VeV0KEn/WZWbuyHh1II9
	xOCJkNqpWdjwn60Qo4GFzSMoyzN4kMpPP6cdR9Gs5VEaTDtFqyLz/W1gSKTX1uTtULxyPX+iZsCP+
	wuSeD+1SyFijhl3DPzkCqcJp3ZULGOqHSu/xAtYzxF6RjDjzCm3ruGGyUVib4wCyMNCQyNbsW/TZ7
	O7bYOJPKmkPH2yaZ84hw1dR+lc62qniIPt0mp/9i/z+NOz5EXq5eTabfhKwtm7Z7MUBJuyf5gZDXo
	DWsiBYR99MG+Hn6ZdBDroDcmbystS8vlhua0QsTMmu2nCDdbsCpdG7/W5R0Z/zS8ezqjfb1tZuKVd
	NW9WkN/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX1ZE-00000009AHQ-1Pb8;
	Wed, 02 Jul 2025 17:48:20 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0hj-0000000928e-1bBT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 16:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751475181;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BYPE9kAm4n5JaaAj3WmzYSVaYGMobSZ1mvZBnXOb9Jo=;
	b=AmF5GzXV+0X/pMaLKu4boIUsFImSJD5HnJpRmiA19IvJ2hKJuLiIHCO6FlxiqQRz9sAGjP
	B/Mp1iU16B21dZ0ooi3yhVmdQIQLCfqGAEWisz2KV5UeDNtoe3HDGu7KGBp0i3lK2vf6LN
	5P7Lm/y0HY3tKv9uxN7vO31VLA9LSSo=
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-192-aU-T8yv-OGG7GoeBBdEmAQ-1; Wed, 02 Jul 2025 12:52:58 -0400
X-MC-Unique: aU-T8yv-OGG7GoeBBdEmAQ-1
X-Mimecast-MFC-AGG-ID: aU-T8yv-OGG7GoeBBdEmAQ_1751475177
Received: by mail-oa1-f69.google.com with SMTP id 586e51a60fabf-2f3bc8c5573so2224534fac.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 02 Jul 2025 09:52:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751475177; x=1752079977;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BYPE9kAm4n5JaaAj3WmzYSVaYGMobSZ1mvZBnXOb9Jo=;
        b=oE0Zn7w8DdTZ4SYf3lYx+tvPYLe1qtLFXabzda1ssdBey2jpqn729HoEX1kdmgHFnd
         TsAJ/BYr/Pr2sRRZCphYHkNIB4M/KhZ8Bn4/nZVV1BYsLVtwPu25bO2KhQzYIYXebFj/
         8rGytB+0xGpsAYbFM3zUfQt6PUt0/0XEWprOR/xE1KAO66L+uNLSL+RWomil2bQToQWB
         0eg+SYqOfG9/NIV75h01/oSvGlCVkx+usFzIim2l59JxzT5z6mum7nYslVsg84cVNgxW
         hRYXCpXEKGl7UMqHGG/Chb6qnwWsplFZJIrusz4whD/886sMnxe38FgxCAfoMjjO+xMP
         kKhA==
X-Forwarded-Encrypted: i=1; AJvYcCWhPCLv4mkZz3KHxBF3ysySwVU2ZILmdlnRmJSs4bHZqaO+4SyyQv/QZkn9+fOg7fmaxpf6Fjdeotad6FPc20nt@lists.infradead.org
X-Gm-Message-State: AOJu0Yw03uJK/ERtCBz3LohGEgUTaMRGQLdwRV8hZHBka8lAMlMeBWyh
	WjRxwepz3b9ul2gcjs/x3UJF5+360Wjbkb0o3KLF/t/6TlF8bBPTi77sf7+/g6Rt7EsZyI90uSL
	exmhxx+MluwCoJu2Qg5ua43RG/crqNQAJn97dJQLDYNytHk/rMpg0XVdEA+naLNIf/HnFqnxyYN
	pd
X-Gm-Gg: ASbGnctH14QEFrFH6F4Z2qePUKPAjvk8/112FGRrGMQWvaUe/Vt459HYxiDTsBxQIUm
	adK42OoFW7HKFl6DndzhlbspjMeyDaddJ/eejfNl4PKx1Ct5xwcuLK0sSHRh55Pobh0lroYv/ST
	RHtxtgNddeijmsWW/tADtndhtydAn44T+VwiwHR3TDz3htW37UH9StfjjBAqZFsWPpTA5dTHExd
	43+9KOAKXcXRZvnMok8L814IZ0hwLs/tcKuqu1zPoqiCzuWPIfuVwIvZl9SytWPTzAgYQ8vQkCU
	L8/bFpr9G8eFwiU0eBeYny4=
X-Received: by 2002:a05:6870:c18c:b0:2ea:6ec5:f182 with SMTP id 586e51a60fabf-2f76cb4ee23mr82914fac.38.1751475177340;
        Wed, 02 Jul 2025 09:52:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH8xhPj4vbeCO6BR/7uWOvOuQ5ERydvemFdCvd/3yMMwrMEKbwcC+0fs0OrYA1xZmzNSwVtTg==
X-Received: by 2002:a05:6870:c18c:b0:2ea:6ec5:f182 with SMTP id 586e51a60fabf-2f76cb4ee23mr82872fac.38.1751475176870;
        Wed, 02 Jul 2025 09:52:56 -0700 (PDT)
Received: from [192.168.40.164] ([70.105.235.240])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-73afafee51bsm2562567a34.10.2025.07.02.09.52.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 09:52:56 -0700 (PDT)
Message-ID: <1a14ee0a-04af-407d-89a5-5222ee6da9c7@redhat.com>
Date: Wed, 2 Jul 2025 12:51:06 -0400
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 0/6] KVM: arm64: Map GPU device memory as cacheable
To: Ankit Agrawal <ankita@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
 "maz@kernel.org" <maz@kernel.org>,
 "oliver.upton@linux.dev" <oliver.upton@linux.dev>,
 "joey.gouly@arm.com" <joey.gouly@arm.com>,
 "suzuki.poulose@arm.com" <suzuki.poulose@arm.com>,
 "yuzenghui@huawei.com" <yuzenghui@huawei.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "ryan.roberts@arm.com" <ryan.roberts@arm.com>,
 "shahuang@redhat.com" <shahuang@redhat.com>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "david@redhat.com" <david@redhat.com>, "seanjc@google.com"
 <seanjc@google.com>
Cc: Aniket Agashe <aniketa@nvidia.com>, Neo Jia <cjia@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Krishnakant Jaju <kjaju@nvidia.com>,
 "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Andy Currid <acurrid@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 Dan Williams <danw@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Matt Ochs <mochs@nvidia.com>, Uday Dhoke <udhoke@nvidia.com>,
 Dheeraj Nigam <dnigam@nvidia.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "sebastianene@google.com" <sebastianene@google.com>,
 "coltonlewis@google.com" <coltonlewis@google.com>,
 "kevin.tian@intel.com" <kevin.tian@intel.com>,
 "yi.l.liu@intel.com" <yi.l.liu@intel.com>, "ardb@kernel.org"
 <ardb@kernel.org>, "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "tabba@google.com" <tabba@google.com>,
 "qperret@google.com" <qperret@google.com>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "maobibo@loongson.cn" <maobibo@loongson.cn>
References: <20250621042111.3992-1-ankita@nvidia.com>
 <SA1PR12MB7199F8346F2CA802E9F3965DB040A@SA1PR12MB7199.namprd12.prod.outlook.com>
From: Donald Dutile <ddutile@redhat.com>
In-Reply-To: <SA1PR12MB7199F8346F2CA802E9F3965DB040A@SA1PR12MB7199.namprd12.prod.outlook.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: nioSbLAvI8R71BqXJnFKiAC0LRAtA8KzbBh37Lj3C6I_1751475177
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_095303_502818_EFF8CF7E 
X-CRM114-Status: GOOD (  22.26  )
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



On 7/2/25 5:33 AM, Ankit Agrawal wrote:
>> Grace based platforms such as Grace Hopper/Blackwell Superchips have
>> CPU accessible cache coherent GPU memory. The GPU device memory is
>> essentially a DDR memory and retains properties such as cacheability,
>> unaligned accesses, atomics and handling of executable faults. This
>> requires the device memory to be mapped as NORMAL in stage-2.
>>
>> Today KVM forces the memory to either NORMAL or DEVICE_nGnRE depending
>> on whether the memory region is added to the kernel. The KVM code is
>> thus restrictive and prevents device memory that is not added to the
>> kernel to be marked as cacheable. The patch aims to solve this.
>>
>> A cachebility check is made by consulting the VMA pgprot value. If
>> the pgprot mapping type is cacheable, it is considered safe to be
>> mapped cacheable as the KVM S2 will have the same Normal memory type
>> as the VMA has in the S1 and KVM has no additional responsibility
>> for safety.
>>
>> Note when FWB (Force Write Back) is not enabled, the kernel expects to
>> trivially do cache management by flushing the memory by linearly
>> converting a kvm_pte to phys_addr to a KVA. The cache management thus
>> relies on memory being mapped. Since the GPU device memory is not kernel
>> mapped, exit when the FWB is not supported. Similarly, ARM64_HAS_CACHE_DIC
>> allows KVM to avoid flushing the icache and turns icache_inval_pou() into
>> a NOP. So the cacheable PFNMAP is made contingent on these two hardware
>> features.
>>
>> The ability to safely do the cacheable mapping of PFNMAP is exposed
>> through a KVM capability for userspace consumption.
>>
>> The changes are heavily influenced by the discussions among
>> maintainers Marc Zyngier and Oliver Upton besides Jason Gunthorpe,
>> Catalin Marinas, David Hildenbrand, Sean Christopherson [1]. Many
>> thanks for their valuable suggestions.
>>
>> Applied over next-20250610 and tested on the Grace Blackwell
>> platform by booting up VM, loading NVIDIA module [2] and running
>> nvidia-smi in the VM.
>>
>> To run CUDA workloads, there is a dependency on the IOMMUFD and the
>> Nested Page Table patches being worked on separately by Nicolin Chen.
>> (nicolinc@nvidia.com). NVIDIA has provided git repositories which
>> includes all the requisite kernel [3] and Qemu [4] patches in case
>> one wants to try.
>>
>> v8 -> v9
>> 1. Included MIXEDMAP to also be considered for cacheable mapping.
>> (Jason Gunthorpe).
>> 2. Minor text nits (Jason Gunthorpe).
> 
> Humble reminder for review.
> 

Apologies for the delay, I had some issues getting a Grace-Hopper to test on,
and a VM that needed to be adjusted(bigger file system) to run the 12.9.1 CUDA install script.

Anyhow, able to assign a G-H GPU to a VM under qemu-kvm, and in the
guest, successfully perform an 'nvidia-smi'.  Previously, without this patch
series in the host, the nvida-smi command would fail and hang the guest.
(qemu-kvm was qemu-10.0 -based)

If anyone wants more details, or want more tests run, feel free to ask;
I can probably keep the system for another day or two, but I'll have to
give it up by this Friday.

Tested-by: Donald Dutile <ddutile@redhat.com>


