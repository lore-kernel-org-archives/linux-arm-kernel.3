Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F2CE77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 15:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=76JkOCTX+61iBdbOfTSQ69p0QN49NOsEyzL0RHTQ/q4=; b=kkVrBb95A6y7NRlnx8ObREkkdL
	EE3F1YgwJpQWmV6Zn1TOf05UpOA6JR/W6nEDMWsJitMjTVZH3/pxf82LgG9dT/+N8QjnBkAcJd+Jq
	F/9dUJ+6pyO88QzzAG7bGn5vUfNsIn+EqO6XQa5IJ17aXMI6g7L2a8pFO/4+mEDnlYgUkDrbdPX9j
	+LLwRZ467Ix4k3G7SEiRs5I8z+kGogDrx2Unsj+B7japxoSVMYL6RltnDZHHPVn/e4WZKNfgJJsVe
	j7Uyf5DmabMbABGsuZ92WDVnyPtp0KhujayndVK2XdRcMVuotWS4dczSuRuSZH4S+9pWfaOwAOZAN
	hQw1DhaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOfAT-00000005LjC-1JtI;
	Fri, 20 Dec 2024 15:43:57 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOf9H-00000005LX0-2xQ8
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 15:42:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1734709362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=76JkOCTX+61iBdbOfTSQ69p0QN49NOsEyzL0RHTQ/q4=;
	b=iaBDsgwdnhnFh5AY502+4Rpo7Z/d+8seEef3f16bQtyfS2sX8MEcT2SqCUecGbsDkpljQZ
	P0rYgfl1SsK0TMmZU1IUyCXL7BYPb4TYjjKYEd98dlJ3vAyvYVn6svQPbrngAcfU9mUd81
	j9OTdAuMFvvjE6iBu7RetLZngH6DA6U=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-307-Hgc7avwoMaa-56lWpyBmNA-1; Fri, 20 Dec 2024 10:42:41 -0500
X-MC-Unique: Hgc7avwoMaa-56lWpyBmNA-1
X-Mimecast-MFC-AGG-ID: Hgc7avwoMaa-56lWpyBmNA
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-4361efc9d23so17316455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 20 Dec 2024 07:42:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734709360; x=1735314160;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=76JkOCTX+61iBdbOfTSQ69p0QN49NOsEyzL0RHTQ/q4=;
        b=pR81WPNZm90xExT0CHj0NeNZNPYzfxNdnA1fVlgc6w/nx3rXdaqyJ6nouApAexaJoY
         RAfOyQhIGcf9xra6GvEz9zhMJB+rS+cDCQkyWU2CnAAsy4DwwNOHkvNyKQ8BkhqruN0B
         YrqaKhjh0nQXUorIoGfvvF/hJA9/9EM0wKkG6xy6DcJGHeFwgTrVxN5wkNUGG3lu5J8g
         G+qFOokSn0jYadopTieHNewjO7UKT7RTxcsb2j7CU2UA8zNJppRbOYaUVwRQlnqBc4a4
         npd3YxkRTsWcSZD8pAPV+kLStxQgsy53M2nMNUP/otkcF3yKOi8SXbHAfpDyv03hNsCT
         Fgow==
X-Forwarded-Encrypted: i=1; AJvYcCX2d/hmgFLL58oOTa3v05R8b2Ef2JH5dqzL60v8wWroIUK+19dwfW/9726wETV2AVt9e4WGhEwidVanRRBMmBzV@lists.infradead.org
X-Gm-Message-State: AOJu0YzxdEL/jR7Hq8FVHkprozU+m9Lr4/fPq8jakeuf92NzqnzfG06a
	62tUzsR5lI37ku4xIOnzEQ9/uVq+Z0798X8w5ZZsTAVyNtuzGZAqkUk7lIz9X5FLaOHXY71d2az
	eG19P8Q1Vmrj/thvVfIQUOFB6hrOJrLTjpupKiO4DOZM1dvHvFzyaLoSaaOA59akgFv5nDIaW
X-Gm-Gg: ASbGnctxjguyOW1T+AiYh4CJW1AZoW4sg7Ghi4MBmKT61uDNcOL2gS/gt1AS833rRi6
	fFdP3ir1v+aH1gajt/mrirTocIdHqm/GIfKybJlb+FHPjeliCdJACuO+odbR3WGuKii15OCqRZE
	1m7w2RxeBlMYoBlkNk8J8wAZMrzdx3DXqhymaeluW4CMKVO/CK7GW0uVO5sw8eV87z7UKgLncxt
	/vLk0o+PvGyN4oWT3Ufo5CX+VWoShuMNsQnnM6IjkuaIEpIf+WxIKH7kpLyIQiHLxBH28OTiyC4
	pTdpTSZhfTA39ON8nBkaJv4clPGuSMAn8PxJM98JThYf9bzXjP4n8hPWHE/9FqtXam/wtEFQPBD
	OLXBBVj8Y
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436678f5775mr37979795e9.0.1734709359595;
        Fri, 20 Dec 2024 07:42:39 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFAN5T2i4qsjhDcC2lmS0U6OKdZwvAAA1+bS7ixeIsq/XePopkOgZMGgNPC00dsJF//r7wHOg==
X-Received: by 2002:a05:600c:a0a:b0:434:a04d:1670 with SMTP id 5b1f17b1804b1-436678f5775mr37979185e9.0.1734709359110;
        Fri, 20 Dec 2024 07:42:39 -0800 (PST)
Received: from ?IPV6:2003:cb:c708:9d00:edd9:835b:4bfb:2ce3? (p200300cbc7089d00edd9835b4bfb2ce3.dip0.t-ipconnect.de. [2003:cb:c708:9d00:edd9:835b:4bfb:2ce3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38a1c828897sm4277175f8f.20.2024.12.20.07.42.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Dec 2024 07:42:37 -0800 (PST)
Message-ID: <a2d95399-62ad-46d3-9e48-6fa90fd2c2f3@redhat.com>
Date: Fri, 20 Dec 2024 16:42:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] KVM: arm64: Allow cacheable stage 2 mapping using
 VMA flags
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
 <20241118131958.4609-2-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20241118131958.4609-2-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: WaUns7P0zn8dUIIP65r6DIiy9tfxrYW2qdMHTNRcJMA_1734709360
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_074243_825306_E3D6AB84 
X-CRM114-Status: GOOD (  31.40  )
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

On 18.11.24 14:19, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Currently KVM determines if a VMA is pointing at IO memory by checking
> pfn_is_map_memory(). However, the MM already gives us a way to tell what
> kind of memory it is by inspecting the VMA.

Do you primarily care about VM_PFNMAP/VM_MIXEDMAP VMAs, or also other 
VMA types?

> 
> This patch solves the problems where it is possible for the kernel to
> have VMAs pointing at cachable memory without causing
> pfn_is_map_memory() to be true, eg DAX memremap cases and CXL/pre-CXL
> devices. This memory is now properly marked as cachable in KVM.

Does this only imply in worse performance, or does this also affect 
correctness? I suspect performance is the problem, correct?

> 
> The pfn_is_map_memory() is restrictive and allows only for the memory
> that is added to the kernel to be marked as cacheable. In most cases
> the code needs to know if there is a struct page, or if the memory is
> in the kernel map and pfn_valid() is an appropriate API for this.
 > Extend the umbrella with pfn_valid() to include memory with no 
struct> pages for consideration to be mapped cacheable in stage 2. A 
!pfn_valid()
> implies that the memory is unsafe to be mapped as cacheable.


I do wonder, are there ways we could have a !(VM_PFNMAP/VM_MIXEDMAP) 
where kvm_is_device_pfn() == true? Are these the "DAX memremap cases and 
CXL/pre-CXL" things you describe above, or are they VM_PFNMAP/VM_MIXEDMAP?


It's worth nothing that COW VM_PFNMAP/VM_MIXEDMAP mappings are possible 
right now, where we could have anon pages mixed with PFN mappings. Of 
course, VMA pgrpot only partially apply to the anon pages (esp. caching 
attributes).

Likely you assume to never end up with COW VM_PFNMAP -- I think it's 
possible when doing a MAP_PRIVATE /dev/mem mapping on systems that allow 
for mapping /dev/mem. Maybe one could just reject such cases (if KVM PFN 
lookup code not already rejects them, which might just be that case IIRC).

> 
> Moreover take account of the mapping type in the VMA to make a decision
> on the mapping. The VMA's pgprot is tested to determine the memory type
> with the following mapping:
>   pgprot_noncached    MT_DEVICE_nGnRnE   device (or Normal_NC)
>   pgprot_writecombine MT_NORMAL_NC       device (or Normal_NC)
>   pgprot_device       MT_DEVICE_nGnRE    device (or Normal_NC)
>   pgprot_tagged       MT_NORMAL_TAGGED   RAM / Normal
>   -                   MT_NORMAL          RAM / Normal
> 
> Also take care of the following two cases that prevents the memory to
> be safely mapped as cacheable:
> 1. The VMA pgprot have VM_IO set alongwith MT_NORMAL or
>     MT_NORMAL_TAGGED. Although unexpected and wrong, presence of such
>     configuration cannot be ruled out.
> 2. Configurations where VM_MTE_ALLOWED is not set and KVM_CAP_ARM_MTE
>     is enabled. Otherwise a malicious guest can enable MTE at stage 1
>     without the hypervisor being able to tell. This could cause external
>     aborts.
> 
> Introduce a new variable noncacheable to represent whether the memory
> should not be mapped as cacheable. The noncacheable as false implies
> the memory is safe to be mapped cacheable.

Why not use ... "cacheable" ? This sentence would then read as:

"Introduce a new variable "cachable" to represent whether the memory
should be mapped as cacheable."

and maybe even could be dropped completely. :)

But maybe there is a reason for that in the code.

> Use this to handle the
> aforementioned potentially unsafe cases for cacheable mapping.
> 
> Note when FWB is not enabled, the kernel expects to trivially do
> cache management by flushing the memory by linearly converting a
> kvm_pte to phys_addr to a KVA, see kvm_flush_dcache_to_poc(). This is
> only possibile for struct page backed memory. Do not allow non-struct
> page memory to be cachable without FWB.
> 
> The device memory such as on the Grace Hopper systems is interchangeable
> with DDR memory and retains its properties. Allow executable faults
> on the memory determined as Normal cacheable.
> 
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
-- 
Cheers,

David / dhildenb


