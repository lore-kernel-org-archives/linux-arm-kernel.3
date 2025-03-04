Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50600C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUEeo/X+MxYcAZNwznFspnaWG5EWN4eG0J5QKgSy/vw=; b=bYxUJd0hODegArRepkdaydFO7O
	onAuTjJhBkNZWnxSQ21KHEgoVQeIQBnnhbuTz2jsFXzw9rJ1EFZsLND+CHARBrD+K7g4SibuC3lAM
	7J+sWni3U8BPDeB5pAUwJNp4eRfCUGw/4ilCkYdH0yMu1w7YjUE0zmwXBl7jGK+S2NRNzcwZHe3Nu
	qLdv51NXIM0ILwTqOUHxCCT4nitoJ9cQ0R9J3dSF3Zr9d1Bsl9bP3L8+LjYwDY/MCvyD5eP+Cju4M
	OWlJy61ZdSqxOKQOoIF1zkPScflgxEGqx9WfJtyV+JhVUQi4OGi91P1ddc4sme9IIK/HPE05fBRfN
	EbgIzQkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLyB-00000003JrU-2Qhg;
	Tue, 04 Mar 2025 06:41:35 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLhF-00000003FzG-47Nl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:24:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741069445;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UUEeo/X+MxYcAZNwznFspnaWG5EWN4eG0J5QKgSy/vw=;
	b=d4OoVye9D4qRh8/YTKNhCmIAhwO+ofR5jMczGG0SaVv1ifvBSuzD06+oMNYD2F7YtQO5Ux
	ctxaRQlUKonWF3Sq/iu4yQb/vgR69xtHYeWlpXbnIAwX4tJ57VblLQ/krvEDlrouDM9APi
	9A+djSQUJKBD+xkxb3jykU+YtYUuogQ=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-582-dknDXPJ6N9SXR3G3Q3LWPA-1; Tue, 04 Mar 2025 01:24:02 -0500
X-MC-Unique: dknDXPJ6N9SXR3G3Q3LWPA-1
X-Mimecast-MFC-AGG-ID: dknDXPJ6N9SXR3G3Q3LWPA_1741069441
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2235a1f8aadso81096285ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:24:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741069441; x=1741674241;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UUEeo/X+MxYcAZNwznFspnaWG5EWN4eG0J5QKgSy/vw=;
        b=RvB5KdncK7Lv/hsy5DjvnAeO2Hd6kmW+UvhljKyVlqBIklkZkuDBOzanxGCw5ivlN7
         6bZrPZPPJG0tL0F8s+Y3IUz8EES06GYkAxXRFBH1C5mh8eBBimpjlGEiQvSFWMTZD728
         VJVpHwuX4ciMQZAVPyoh3Zpekcv2ZilnlyxLRimSdHHZ7GQcRpR3c83wIPf4OXyKIAWR
         SYNLiDvM7ff3XN1e17P1CuuTUj4CG2BnHgF2uwxjfXv35poi4Kio68YTy/JDV/hSYmeM
         5Wmok7AreC283hemUFvA/YgRFzUcUminaedaEs/5C7pcKl0WVzGL5/aIx6xHlfiI6YvJ
         z7qA==
X-Forwarded-Encrypted: i=1; AJvYcCUA0+cGVf2JB3Rumv3JpCJjBsnCaRNzGS2Q8SMaisvoDnpi6HFN+U9Ti63E25D5NbIzmsRMR8jkTUxdRNafpehK@lists.infradead.org
X-Gm-Message-State: AOJu0YyX+Zf5PY0F6pk3nwlpDbBjOX1xCwa9VTlNEncY6zHfLoUMYJ6t
	xRZrB5LRdXeqouoqEzoq4PfmJ5u4KJrZSHH6UsgaJnxe7ihdZiu+b3KtSZwrLkctjbaAdeecPgu
	TrW7a7oYWhRKVU6EOzci3IpgAnku8MmZWqOex+WKGBPUrMbQbFHxTqwgx1WL0DhTcPkVLtjT/
X-Gm-Gg: ASbGncs4B7UsqWBlLGk0ZB7JyYtYQM1zrcy3XdMV/kqdRPGC66NPR/P+ACGZIKSgf7l
	FleOemXzyQqiRrQjJBRcoKgDVka1BwjMvr4Y6AfOJRviCiari54OqWO00xy1q6Fczzb0wkw0g80
	dKxwWB8+VhsXdkJRsv/qn59qA5jGtMtJHGh28zMN0SfMWJletdAdAWwMSkDvuiXyrjOsuuBrlVs
	IYtsQL53k6yQOJ3vxnsv0pYQbdzNESg4pi/DCBB4slSpwiz84r9QvBH2cWYvHG9mVuykznXMi8x
	XaTKpF54Zy00l4HYCQ==
X-Received: by 2002:a17:902:ec92:b0:21f:6ce6:7243 with SMTP id d9443c01a7336-2236922454fmr215973865ad.51.1741069441096;
        Mon, 03 Mar 2025 22:24:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGeWcLcszVzswCV3IlHec2C4u9Iv8biEcHW4AvArM9d+exFu3qcTvk3+Js7kBLoNIjChH7Sog==
X-Received: by 2002:a17:902:ec92:b0:21f:6ce6:7243 with SMTP id d9443c01a7336-2236922454fmr215973585ad.51.1741069440784;
        Mon, 03 Mar 2025 22:24:00 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501d323bsm87972535ad.3.2025.03.03.22.23.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:24:00 -0800 (PST)
Message-ID: <9d32bfed-31f2-49ad-ae43-87e60957ad74@redhat.com>
Date: Tue, 4 Mar 2025 16:23:52 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 30/45] arm64: RME: Always use 4k pages for realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-31-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-31-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ffAZvwOkS2n_tU1i3cT4vzh8Es218Wi9qZ4oepa4Xec_1741069441
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_222406_098606_E8409690 
X-CRM114-Status: GOOD (  23.62  )
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

On 2/14/25 2:14 AM, Steven Price wrote:
> Always split up huge pages to avoid problems managing huge pages. There
> are two issues currently:
> 
> 1. The uABI for the VMM allows populating memory on 4k boundaries even
>     if the underlying allocator (e.g. hugetlbfs) is using a larger page
>     size. Using a memfd for private allocations will push this issue onto
>     the VMM as it will need to respect the granularity of the allocator.
> 
> 2. The guest is able to request arbitrary ranges to be remapped as
>     shared. Again with a memfd approach it will be up to the VMM to deal
>     with the complexity and either overmap (need the huge mapping and add
>     an additional 'overlapping' shared mapping) or reject the request as
>     invalid due to the use of a huge page allocator.
> 
> For now just break everything down to 4k pages in the RMM controlled
> stage 2.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/mmu.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 

The change log looks confusing to me. Currently, there are 3 classes of stage2 faults,
handled by their corresponding handlers like below.

stage2 fault in the private space: private_memslot_fault()
stage2 fault in the MMIO space:    io_mem_abort()
stage2 fault in the shared space:  user_mem_abort()

Only the stage2 fault in the private space needs to allocate a 4KB page from guest-memfd.
This patch is changing user_mem_abort(), which is all about the stage2 fault in the shared
space, where a guest-memfd isn't involved. The only intersection between the private/shared
space is the stage2 page table. I'm guessing we want to have enforced 4KB page is due to
the shared stage2 page table by the private/shared space, or I'm wrong.

What I'm understanding from the change log: it's something to be improved in future due to
only 4KB pages can be supported by guest-memfd. Please correct me if I'm wrong.

> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 994e71cfb358..8c656a0ef4e9 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -1641,6 +1641,10 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (logging_active || is_protected_kvm_enabled()) {
>   		force_pte = true;
>   		vma_shift = PAGE_SHIFT;
> +	} else if (vcpu_is_rec(vcpu)) {
> +		// Force PTE level mappings for realms
> +		force_pte = true;
> +		vma_shift = PAGE_SHIFT;
>   	} else {
>   		vma_shift = get_vma_page_shift(vma, hva);
>   	}

Thanks,
Gavin


