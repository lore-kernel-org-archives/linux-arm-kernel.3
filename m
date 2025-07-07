Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38FF9C83F07
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Jul 2025 08:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f7c7kcapdipGzN+LXmUUJUXr31N87a9KtvvPVxgC4NM=; b=Xtx7mw/2JwhavuyXdvnFie1HGD
	lEJBQ30Vd/2zRfYlM4hu5+buV3P/oBaiYpFcYy5RHJhX8Fso3eBI7UcOTuegCqTTCPNqNqMERhdpL
	Pr0h8gVOP2GtkUyQUXB9nUmyZ71PtmRcMH1TgEkE2CYPyqZxSevRhv4icu4uAaHNRkDT+PZQn7YUH
	huls80W8HSZiRTIUm3k1dQvDuiTTiRkhOsXkD2WzkeAqcDZDvOM0pDMMY9LIiZm3WsgVpWWO5pz72
	Gq5E5K1zsOJFCJQO4W3Tj3IgyWOb7IGaSD9uiL5yQ6/1dJAU8mro0uNeoVOm0vYqYS6LupAcLE095
	fMUNSqCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgyv-00000001pBP-0mvE;
	Mon, 07 Jul 2025 08:13:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYgKn-00000001hEH-2zdk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Jul 2025 07:32:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751873535;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=f7c7kcapdipGzN+LXmUUJUXr31N87a9KtvvPVxgC4NM=;
	b=GChS/ReClB7fMhYdDZ8HuDV+w9ymtrgQXF+CQAuz/h00ljorIzi2qfHu/hnScxxBF4oict
	mKGz0N2Bf6ElfCo8zSGubK45aCLiPn8uQoRFLugOOrSA8Hbj0x+31v4ijZj5hHO3K7y9i8
	jFeLNhDxDthtNkbGKyzNSUR8jqAnFcU=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-QRtkuRr6PVyeMnVYv5gdTg-1; Mon, 07 Jul 2025 03:32:14 -0400
X-MC-Unique: QRtkuRr6PVyeMnVYv5gdTg-1
X-Mimecast-MFC-AGG-ID: QRtkuRr6PVyeMnVYv5gdTg_1751873533
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a5780e8137so1963125f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Jul 2025 00:32:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751873533; x=1752478333;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=f7c7kcapdipGzN+LXmUUJUXr31N87a9KtvvPVxgC4NM=;
        b=vDQelynXbhWk0UkZetulq6j73/sgt32Jo7eUTtvh9zeIja95BKiPYxcB3QNm1j4w9Y
         zeUqNTegkMOctR4sQ2f7wC8G7SBMA3iPMal/GwqPS1JlC+ZWMLs9gJ/XrbRHWYCNMVuh
         9B9TvD/sovju65V94Yxae9HJaPgPRyBdJtnFZL7f7N7ZyKc5ZCWYoz7Udq8wWDtHil62
         DD9Y6fePcP8KVpg05Vw2ikuRV2knNz2mH1/bHIUQHn7hd4pv3aUqgr6Ia5pFw4s/6xcQ
         Q1YxajA4imBtdWr9yJx2oDPzyB/lTTRFZ9snM7OizE29WQe1/0hKanHv8RrWniUYsbbz
         q9bw==
X-Forwarded-Encrypted: i=1; AJvYcCVGnoB/8RQMq8qS5DyM1tHi9aM/HkkqY+8WMlALcBPRVdMzD7atOLxJi4+uhpSFYxUvpeHe9AGI6Yy1xx0bIUir@lists.infradead.org
X-Gm-Message-State: AOJu0Yyn3k+OCEzip99uHczaEws9nU8XO0LlQkmcMa78hEZ5XJ4jrL5G
	OI08VdKOu/RDLNIZQwudZiBb7hENs5S75aViggpPL8jnC6EwEw7QFBsi8Zt8oFWiwzqy08JVQET
	vCGqsAxykt2REcIWsRFLBy+iumKHskl3XcqiyD00z7rC2AWZMjdYGLXhBdNICnDff3ZgFT8RV17
	SM
X-Gm-Gg: ASbGncs4WzsDDl1hDhLZyYqIIc0zyBd+jlT3xcqhCQ8vD448wiaPlp+wJNl/qx1RZOY
	6L92lQWFr5sL/ex1zYmyY5YYapD4dw6WJ8X+kBXDpjf5GAODC1th+41EVb+PB+7eD2U2yHSvU6W
	vAGoPC5e9XrtpdAGcHF3Grp9KNcpeyz2RRB/gGeX20cqLCsjWexGHbUX1H0Qs9s6ve2L3JN6WpT
	41NxTGzBG3h7cg7LjOwqqtGQbAXENZteH8Q7x99V9xB9DaFcmuARMMaupbd298NYQakqbaoE3ac
	CuyS2W+pDEvuk2BVu9ly9lM+/FVrDy4vKRRckjYBpaC+7Ed+r/TQO7NFA5j3CZ/olzwH1eB+tRY
	cINj6BiY0sH9CjyoX7y8q7XZVW28gK0pH9xWtttcjoDJb6AJIXg==
X-Received: by 2002:a05:6000:40cb:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3b4955752fbmr9538407f8f.15.1751873532568;
        Mon, 07 Jul 2025 00:32:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9pDpcgsWo3W1gFqKSOjmmiloG68Kg9wmzzGbxMe2KDyxi5JHosLzkHDN/zYD6U/48G1NrmA==
X-Received: by 2002:a05:6000:40cb:b0:3a4:f722:a46b with SMTP id ffacd0b85a97d-3b4955752fbmr9538341f8f.15.1751873531926;
        Mon, 07 Jul 2025 00:32:11 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f38:1d00:657c:2aac:ecf5:5df8? (p200300d82f381d00657c2aacecf55df8.dip0.t-ipconnect.de. [2003:d8:2f38:1d00:657c:2aac:ecf5:5df8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a99693f2sm134974555e9.5.2025.07.07.00.32.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Jul 2025 00:32:11 -0700 (PDT)
Message-ID: <19e3e53c-71e7-456e-a684-916c994872f7@redhat.com>
Date: Mon, 7 Jul 2025 09:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/6] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org,
 ddutile@redhat.com, seanjc@google.com
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, tabba@google.com, qperret@google.com,
 kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, maobibo@loongson.cn
References: <20250705071717.5062-1-ankita@nvidia.com>
 <20250705071717.5062-6-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250705071717.5062-6-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 86Gc7e8gIX8PG1xe0dkgq80HEkRqd8ynBPFuzTsPb5E_1751873533
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_003217_826988_2C30F175 
X-CRM114-Status: GOOD (  22.67  )
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

On 05.07.25 09:17, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Today KVM forces the memory to either NORMAL or DEVICE_nGnRE
> based on pfn_is_map_memory (which tracks whether the device memory
> is in the kernel map) and ignores the per-VMA flags that indicates the
> memory attributes. The KVM code is thus restrictive and allows only for
> the memory that is added to the kernel to be marked as cacheable.
> 
> The device memory such as on the Grace Hopper/Blackwell systems
> is interchangeable with DDR memory and retains properties such as
> cacheability, unaligned accesses, atomics and handling of executable
> faults. This requires the device memory to be mapped as NORMAL in
> stage-2.
> 
> Given that the GPU device memory is not added to the kernel (but is rather
> VMA mapped through remap_pfn_range() in nvgrace-gpu module which sets
> VM_PFNMAP), pfn_is_map_memory() is false and thus KVM prevents such memory
> to be mapped Normal cacheable. The patch aims to solve this use case.
> 
> Note when FWB is not enabled, the kernel expects to trivially do
> cache management by flushing the memory by linearly converting a
> kvm_pte to phys_addr to a KVA, see kvm_flush_dcache_to_poc(). The
> cache management thus relies on memory being mapped. Moreover
> ARM64_HAS_CACHE_DIC CPU cap allows KVM to avoid flushing the icache
> and turns icache_inval_pou() into a NOP. These two capabilities
> are thus a requirement of the cacheable PFNMAP feature. Make use of
> kvm_arch_supports_cacheable_pfnmap() to check them.
> 
> A cachebility check is made by consulting the VMA pgprot value.
> If the pgprot mapping type is cacheable, it is safe to be mapped S2
> cacheable as the KVM S2 will have the same Normal memory type as the
> VMA has in the S1 and KVM has no additional responsibility for safety.
> Checking pgprot as NORMAL is thus a KVM sanity check.
> 
> No additional checks for MTE are needed as kvm_arch_prepare_memory_region()
> already tests it at an early stage during memslot creation. There would
> not even be a fault if the memslot is not created.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Sean Christopherson <seanjc@google.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: David Hildenbrand <david@redhat.com>
> Tested-by: Donald Dutile <ddutile@redhat.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


