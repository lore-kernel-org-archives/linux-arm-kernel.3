Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EA02C54E71
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 13:58:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Coxx2aEBIqRB645mhtV+IgPRr+CylFQ+cGu0rui4m0s=; b=nJcyPbsLUStxYftYjmXCyBInlc
	BRAXJqmMFfsOhwlmaPq1uzvJtBVFYkjvHsvMpuJ4/U9LW+8gCx58fWdzswAdHObVGJ7K1EFXsdJgT
	Q+TX87zf1NHNTDiULlcu0SahvJcK9I1Xa6IwhNu6kITqE19HlxbYXHnq/sJ0JPQ7Mxugsii5d1EEs
	CC1h0rZcReq9BaQv9sIHV+JxpkEdZ13j6yoeF/9U/WhFMESd7uR0+yK+tPlxwilJLbWZGpyqXmle2
	tnbbTnbKxrClutlzLZ3UBHHblH9dUaFGIUemSM8+SKQAA5GPb0ZfwzWkW+j6L0STtVL4BjaOFA84z
	wTNMNacA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjxi-0000000G1NB-1aEr;
	Wed, 21 May 2025 13:58:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHjK9-0000000FuiO-45hM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 May 2025 13:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747833452;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=Coxx2aEBIqRB645mhtV+IgPRr+CylFQ+cGu0rui4m0s=;
	b=E7um03hi/Nz91NxbHAACFsfQ7/qevgrElTE35D4yvv7tx6FHaz2LIBXPDvzZEFW1+61J/I
	b6t8Es9Ayv/ZoPGHcTBpuTsMcDHV4t/jadK19S8sD0acOO8X5sZ/JOJswUw2O1abbuRXpb
	r1GPl6ZZuZnxQhWGdp42tlD95xQ65a8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-yyiVe4JjMYSQHeovVepVbg-1; Wed, 21 May 2025 09:17:31 -0400
X-MC-Unique: yyiVe4JjMYSQHeovVepVbg-1
X-Mimecast-MFC-AGG-ID: yyiVe4JjMYSQHeovVepVbg_1747833450
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-442cd12d151so47922055e9.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 May 2025 06:17:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747833450; x=1748438250;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Coxx2aEBIqRB645mhtV+IgPRr+CylFQ+cGu0rui4m0s=;
        b=UbGzbpiyPjm4xJl4usfctomsNB7JUCno/yMO55E/z4EfH4imWAkHV1hnz9yIzs1de0
         0Qljny5gK+yfBc5poDewCFU6SKBWhOTHIhxudcSTlcnzfasDk/SI1gP3xU9D1BCtQ+8U
         KFBLFsi/AfRCIfGgqraNsLTBmO2O7Eo+bPxexn4LqkopVSqafhxdX/Z6lJG7JzA3jhMX
         g1eOTg7RrDfM97q0xiB9kDVnPIXleVV7rtlA9EGQvU7RMZf0vRTRj6egQig6vS3COOiE
         U2zvHUoofVr22onQF50Fl7RkxDohjNuQQffX6Bdh5j1S1tKYeSJh08Kr0xsPKyxJ/DPv
         YK4w==
X-Forwarded-Encrypted: i=1; AJvYcCVGhUeuvdF4C3dRCrkmrxyqE3Q9wOWK4d2CXTF3KSmJOm+zRVxq229yTICpV9DkEA2C7ZQW7GUOcAPciCYKhASW@lists.infradead.org
X-Gm-Message-State: AOJu0YzN/sYxqKNKl4QnSwzmxs03BBuLfN5sXI4ubrV3p9Gk7ynYO91w
	2W2nQhdTyyXMCNYmP9Nr+h2F31wmsqXwdYoOBvKHggkqma67lFdmZqqPBR84oogZ1ZoKgjeWoQX
	4uz+oxCtk1BMOC3DVl+PvPDuytYRYofH7uHSSGL1BXKsoQ3UjviHC+eDPfeGaumcmvOACYlIRrR
	tX
X-Gm-Gg: ASbGnctKCk6GbPMISRqFZ8/5BGGBYQKMKu4xo/F5iQZ6MJtzPzh2m78doDS2yhEU4v2
	YJ3JExbBMy/bB5GZjS7e4gByzLGbiO3SNk+tZHOiCIJP0j24LocSXnIaPxWMakIrlmHzI+epSrT
	utK213tgKOHnCFxTB0FSHK2sF9D8OAfmDoGD5MiyiOBSpdal5wqzE1drvRvbEBfgS24KNddzYqM
	QEfNtsaa8DiVnpHX/ndOUwItFvSHR7eDHlNlJrmjWB1FX0Il1PMsOQW70YSHWYHtB/nODtsgLDb
	k2dOduDBslt8tksTP/5hc6bu4ITWCB0XJWOZLel/PcVDAxCEHxa1LNBh1CagjZwj0HbMrBcpHgm
	4JVu7l1MxLwwah4e55MyJTwr+mGmIKzpCsNkmzIk=
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr201632325e9.12.1747833449491;
        Wed, 21 May 2025 06:17:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeTvtRM9vsH0rx7yrcgJiEKJ2q99qlmz+CtY4GE46ewWI4BIjJPn0Gdy7a/BJ9+neXKRuaEA==
X-Received: by 2002:a05:600c:45cf:b0:43c:f470:7605 with SMTP id 5b1f17b1804b1-442fd610128mr201631645e9.12.1747833448945;
        Wed, 21 May 2025 06:17:28 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60? (p200300d82f259c00e2c76eb58a511c60.dip0.t-ipconnect.de. [2003:d8:2f25:9c00:e2c7:6eb5:8a51:1c60])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb85bb20sm186557675e9.0.2025.05.21.06.17.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 May 2025 06:17:28 -0700 (PDT)
Message-ID: <a2aacca8-cc70-451c-be2b-44911ca3caaa@redhat.com>
Date: Wed, 21 May 2025 15:17:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/5] kvm: arm64: New memslot flag to indicate cacheable
 mapping
To: ankita@nvidia.com, jgg@nvidia.com, maz@kernel.org,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org,
 ryan.roberts@arm.com, shahuang@redhat.com, lpieralisi@kernel.org
Cc: aniketa@nvidia.com, cjia@nvidia.com, kwankhede@nvidia.com,
 kjaju@nvidia.com, targupta@nvidia.com, vsethi@nvidia.com,
 acurrid@nvidia.com, apopple@nvidia.com, jhubbard@nvidia.com,
 danw@nvidia.com, zhiw@nvidia.com, mochs@nvidia.com, udhoke@nvidia.com,
 dnigam@nvidia.com, alex.williamson@redhat.com, sebastianene@google.com,
 coltonlewis@google.com, kevin.tian@intel.com, yi.l.liu@intel.com,
 ardb@kernel.org, akpm@linux-foundation.org, gshan@redhat.com,
 linux-mm@kvack.org, ddutile@redhat.com, tabba@google.com,
 qperret@google.com, seanjc@google.com, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 maobibo@loongson.cn
References: <20250518054754.5345-1-ankita@nvidia.com>
 <20250518054754.5345-4-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250518054754.5345-4-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Uyb1cznzQvO9tI0L6J5Ht0Ig81XRHxysx3AkKMyi4os_1747833450
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_061734_088927_F6CC3701 
X-CRM114-Status: GOOD (  19.39  )
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

On 18.05.25 07:47, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Introduce a new memslot flag KVM_MEM_ENABLE_CACHEABLE_PFNMAP
> as a tool for userspace to indicate that it expects a particular
> PFN range to be mapped cacheable.
> 
> This will serve as a guide for the KVM to activate the code that
> allows cacheable PFNMAP.
> 
> CC: Oliver Upton <oliver.upton@linux.dev>
> CC: Catalin Marinas <catalin.marinas@arm.com>
> CC: Jason Gunthorpe <jgg@nvidia.com>
> Suggested-by: Marc Zyngier <maz@kernel.org>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>   include/uapi/linux/kvm.h | 1 +
>   virt/kvm/kvm_main.c      | 6 ++++--
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index b6ae8ad8934b..9defefe7bdf0 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -51,6 +51,7 @@ struct kvm_userspace_memory_region2 {
>   #define KVM_MEM_LOG_DIRTY_PAGES	(1UL << 0)
>   #define KVM_MEM_READONLY	(1UL << 1)
>   #define KVM_MEM_GUEST_MEMFD	(1UL << 2)
> +#define KVM_MEM_ENABLE_CACHEABLE_PFNMAP	(1UL << 3)
>   
>   /* for KVM_IRQ_LINE */
>   struct kvm_irq_level {
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index e85b33a92624..a3e77fe57cc4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -1524,12 +1524,14 @@ static void kvm_replace_memslot(struct kvm *kvm,
>    * only allows these.
>    */
>   #define KVM_SET_USER_MEMORY_REGION_V1_FLAGS \
> -	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY)
> +	(KVM_MEM_LOG_DIRTY_PAGES | KVM_MEM_READONLY | \
> +	 KVM_MEM_ENABLE_CACHEABLE_PFNMAP)
>   
>   static int check_memory_region_flags(struct kvm *kvm,
>   				     const struct kvm_userspace_memory_region2 *mem)
>   {
> -	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES;
> +	u32 valid_flags = KVM_MEM_LOG_DIRTY_PAGES |
> +			  KVM_MEM_ENABLE_CACHEABLE_PFNMAP;

Should we have some kind of kvm_arch_supports ... check? Because anybody 
else except arm64 will not respect this?

-- 
Cheers,

David / dhildenb


