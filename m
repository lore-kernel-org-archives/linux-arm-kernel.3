Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1799C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:33:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LBn7YewcGLqcJwIQMeePqXaU86WOWyp8TwMnIsNgXlU=; b=gkgyP4mVfT2xyLQKcjI26lVOb3
	y4OMwqZPl4AtrNDO0J1536mEgjrgMHZSLnLzt2UwI7Zfhi5Bnv7A1q/gvg0+I9z1aJTyhQHH9IaIe
	9L79DUVvnJVvD3HNAwUR6ksAcw/FuSjmFrrvYnaguwe5w0kmBIAsw/N6H2YvMt+k44GlAOE/OpUMe
	HQ+1N/7uxEv7MpDbfzcNLxGOpku8NIoNT9g9uKdRGXjHZR74vLDIMcZqKZYdbKQQqGJPud8ljPyzD
	pyVQNfNuQMpeo9YDFUaqxC4EP+QOjbcARlvCq8H+0BSNo5DoWu6bNakDtbHwaBn7f5vVFvCWD2MLu
	LaEQ3Bvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhTW-0000000EgBy-2tqT;
	Fri, 04 Jul 2025 14:33:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhCR-0000000EdvM-2TW7
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 14:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751638534;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=LBn7YewcGLqcJwIQMeePqXaU86WOWyp8TwMnIsNgXlU=;
	b=KPGp4YUxZmelhHhypD15KA0oQZBizbl5cQeKFnjf7wlt5xR224Yd+DVAmVSui82WrEVgOo
	RfzIon9F3s5Mu7yVH6c1wkxSdLJ7JRbjpxiXbHViwlBUmZWCCsbZTJttE+hAOd9tTdlDw9
	vdA26+vqjT+/EJfgW+GNVO+laWB8oiA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-449-gdf_TfZuMXGPthFSQNom_Q-1; Fri, 04 Jul 2025 10:15:33 -0400
X-MC-Unique: gdf_TfZuMXGPthFSQNom_Q-1
X-Mimecast-MFC-AGG-ID: gdf_TfZuMXGPthFSQNom_Q_1751638532
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a4ff581df3so498547f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 07:15:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638532; x=1752243332;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=LBn7YewcGLqcJwIQMeePqXaU86WOWyp8TwMnIsNgXlU=;
        b=sda+sIRPEiS3DHUE+jlfOCNumpRzYwRWVv6EqZ4x0RSolLbAXpAeoDwJ7r09mB3xyp
         r/sBrT0aev1/Q3U0r9MblNKKp2hzCyDDopEtrF2QcpuYzh1feF5Ot2NdgmzmheDELIQx
         5sZPCTKwljyZSoYMAoJI6hZvRQ3COqh555uheJlLcu7QxSHPPKXAWzTtf2qX7+tfxd+T
         5Mg0Omq2yuf+AEPWiaPj4BE8W0TuXVnmgICBHblMb6eaQfcoo/MygyFCTtkleVxiYF9U
         HKjXF5Qjp9XVE7gJ+/lJdInEy29sTOSYIY/urNixMX/qj0271Jf/hzM2eigu2nJak08c
         TmSg==
X-Forwarded-Encrypted: i=1; AJvYcCUHT0H5xk1RGXmtF6x4FlFvGXr17UvYCVyHD74iIKd8v6byBK95T1r4kPN4/G1BADQJQLKKh/rI3iPml3bcp8Xw@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/R5VX80GvwQj1jsRw3rcjk2I/y1Y/9zToVC9wkS3wz/swoErl
	kyxG+T5BHuqx8rbjCU42mtLZZ2/JTr2nQSErKtcHUYWd0LMI/qRwCxDQXfzm9t0jlyHPck4+vKV
	jQ7rzqKeAf1Ap5eOct50Fw7R/N9i65LuclUUoK5TLzvNZCqx6wo4qBJmTXkNFqnNd5bcLKve4ut
	kl
X-Gm-Gg: ASbGncuyLQf9hy5cenHJi4Im8LxtSumYf3s5VOT7qeH5tt96gTPQ2cVeKUYS4WGIL+p
	jF7UHkH+p0L7Bsytg86jVDmdVfQ+cBr09JLYKYrAto1iLd/+mAG6sNc+9CPWG0BQUNKQ3CESwb2
	RBzuyLqjjZX0UAewz5KouaiKVUIjfUNZv7dl8kevts1tlctS/rdn9l9afm/0eTD/fIjwwOG3Jnb
	41vtI/Qf/luBDiBTDkochhu/s6T2V9UXmrI334562BWc3EHzDSqLEKm0xtUyPaTx/aKk++0gmm+
	mxGtxryGmIiP+KosbJTKAOvRE38H49M9SLOcoaorubUeo7tNEHbI5xLPxhb7HrmzchijA0qH4Sk
	zjRASMsjw2Mn+R0rxheKQWkVBbXSn/KYhi2XAGMSdSIIV7ek=
X-Received: by 2002:a05:6000:2386:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b48f763f20mr3038247f8f.0.1751638531789;
        Fri, 04 Jul 2025 07:15:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFFFZfrZGXx1jIEHCw4iULGVHb/HshXOPXs2ODzOAd6Gc9BaMJ2C1ZIpAirKVHX6TqTgT60YQ==
X-Received: by 2002:a05:6000:2386:b0:3a5:8977:e0fd with SMTP id ffacd0b85a97d-3b48f763f20mr3038165f8f.0.1751638531220;
        Fri, 04 Jul 2025 07:15:31 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a9bcef22sm57156535e9.19.2025.07.04.07.15.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:15:30 -0700 (PDT)
Message-ID: <29cc7d2a-b174-4ed3-ae1a-22db478c62ec@redhat.com>
Date: Fri, 4 Jul 2025 16:15:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 6/6] KVM: arm64: Expose new KVM cap for cacheable
 PFNMAP
To: Jason Gunthorpe <jgg@nvidia.com>, ankita@nvidia.com
Cc: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com,
 suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com,
 will@kernel.org, ryan.roberts@arm.com, shahuang@redhat.com,
 lpieralisi@kernel.org, ddutile@redhat.com, seanjc@google.com,
 aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com, kjaju@nvidia.com,
 targupta@nvidia.com, vsethi@nvidia.com, acurrid@nvidia.com,
 apopple@nvidia.com, jhubbard@nvidia.com, danw@nvidia.com, zhiw@nvidia.com,
 mochs@nvidia.com, udhoke@nvidia.com, dnigam@nvidia.com,
 alex.williamson@redhat.com, sebastianene@google.com, coltonlewis@google.com,
 kevin.tian@intel.com, yi.l.liu@intel.com, ardb@kernel.org,
 akpm@linux-foundation.org, gshan@redhat.com, linux-mm@kvack.org,
 tabba@google.com, qperret@google.com, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 maobibo@loongson.cn
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-7-ankita@nvidia.com>
 <20250704134413.GE1410929@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250704134413.GE1410929@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cugr5OdfzGTsylZ1ovcZr5r2oBPoXeNJeb_uQ6NaUXg_1751638532
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_071535_706436_BE448E77 
X-CRM114-Status: GOOD (  17.40  )
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

On 04.07.25 15:44, Jason Gunthorpe wrote:
> On Sat, Jun 21, 2025 at 04:21:11AM +0000, ankita@nvidia.com wrote:
>> From: Ankit Agrawal <ankita@nvidia.com>
>>
>> Introduce a new KVM capability to expose to the userspace whether
>> cacheable mapping of PFNMAP is supported.
>>
>> The ability to safely do the cacheable mapping of PFNMAP is contingent
>> on S2FWB and ARM64_HAS_CACHE_DIC. S2FWB allows KVM to avoid flushing
>> the D cache, ARM64_HAS_CACHE_DIC allows KVM to avoid flushing the icache
>> and turns icache_inval_pou() into a NOP. The cap would be false if
>> those requirements are missing and is checked by making use of
>> kvm_arch_supports_cacheable_pfnmap.
>>
>> This capability would allow userspace to discover the support.
>> It could for instance be used by userspace to prevent live-migration
>> across FWB and non-FWB hosts.
>>
>> CC: Catalin Marinas <catalin.marinas@arm.com>
>> CC: Jason Gunthorpe <jgg@nvidia.com>
>> CC: Oliver Upton <oliver.upton@linux.dev>
>> CC: David Hildenbrand <david@redhat.com>
>> Suggested-by: Marc Zyngier <maz@kernel.org>
>> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
>> ---
>>   Documentation/virt/kvm/api.rst | 13 ++++++++++++-
>>   arch/arm64/kvm/arm.c           |  7 +++++++
>>   include/uapi/linux/kvm.h       |  1 +
>>   3 files changed, 20 insertions(+), 1 deletion(-)
> 
> I don't know if any VMM will ever use this, but it looks OK

So, should we defer it to the point where we actually have a use case?

I mean, patch #4 could be simplified by modifying arm64 code in patch #5 
only. No need for a common kvm_arch function etc.

-- 
Cheers,

David / dhildenb


