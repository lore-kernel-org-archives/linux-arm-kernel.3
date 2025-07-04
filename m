Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A135CC8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:18:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pfAyq8gycikWXRNwIODTLXhKhyUIzGBWvmEXVr9wTQ8=; b=LUY4P86gXozYgPSnj+Ssj9qTzK
	JKpneiyCDyM81+NhOdyXY6qtNwzHsFIwLWuM5SlMXM5evtVTNAvEo6rWX/3lb3ndJ2/oqHLxxBfZ8
	tA/L2+qQWis4BHHi6jh2xi/qQgGQns2kZUSo5ks/++/w7HGhLFC1i/mXkyQwfypMBfVR6EIcP/sG5
	QydfLAwCVmHwN5ougJC+GMQ99pgu9fAe9TZAaYxPrLB6MWQPpibkCsgWF8SlwhDEB3ou8+fA9Dhlg
	QkyGm/wnZSUz3gaaKQbny92/MK2PR5rOqDo7DG+pAnDYGogiYoxHhUZoGteYmC/e/FLemuE4VhwK6
	2Ut6lmCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhFR-0000000EeH2-2g3L;
	Fri, 04 Jul 2025 14:18:41 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgzc-0000000EbNi-3JUI
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 14:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751637739;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=pfAyq8gycikWXRNwIODTLXhKhyUIzGBWvmEXVr9wTQ8=;
	b=bLKEvhBqxLn80kyV8fL3yNdgFh24zGtsxrB370WB0/RgOrt9+zYhxbR20+pFARnkCWpwdx
	UXmCJHHC3HIK2VUOY7P1WUONGPxYoR4Tyk/GYefRoWnQFzDg395d9OFSxSxRjMntBgluH3
	kQp1zGtugPYlsV9wrAOOfkLKJu48D3o=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-15-gUDPScBJOGOIOd-sBKUBpA-1; Fri, 04 Jul 2025 10:02:18 -0400
X-MC-Unique: gUDPScBJOGOIOd-sBKUBpA-1
X-Mimecast-MFC-AGG-ID: gUDPScBJOGOIOd-sBKUBpA_1751637737
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4535ad64d30so7809675e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 04 Jul 2025 07:02:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751637737; x=1752242537;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:from:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=pfAyq8gycikWXRNwIODTLXhKhyUIzGBWvmEXVr9wTQ8=;
        b=TvFQ+W67MqVlPHAQiSpf3rQcWhRg2XLi2S0cNlTJHP5IdBaYBWVs0CTRVT4j6VsuJn
         v8JoIHKkNNJyRJIp2ZAzkrbbk4+LL/hC1U+rnJArGsKm6MT43trJ958D4pGDc28hGeou
         HHTwJGgqycRrRGJXreqt5Obo2yPfkHWN51jYrbkgWTyYxx8uTCSSVbyQRv1gO7nq9N2v
         nK873cIayODtLnRws7mnNdk6LhrgS2YSLghGGJQIBanP0n/qnP8f7PQMGXWUu15T7VB7
         UNSLk2s3Z13JTwh1M0NtawoHBey4lS+o7Udg/bRnmcYuIjv8MLpxXLJbuhelMuCLxJVO
         e57Q==
X-Forwarded-Encrypted: i=1; AJvYcCVgWIoFOzfTj3uPmU9w+PkaWTEYoPSeJYyd3qc5xsUkKNA8T9pYTdCeVv7aNCSzLZH9H4vbTx6Gez4asGs2ee0H@lists.infradead.org
X-Gm-Message-State: AOJu0YwbKkp3LXWPDuRjrielW75MhXWFip8+8DLwBPiiBDv6jczJLWG/
	pXOg2ahQlUwsUqyGUAtQw3mni/K3v8wNz3mpsPNhDY9O/tMer8Sguo0oraZPxvMFerc8GquJ933
	TVAs4iylFh+VnjiUz10nRk2xOECN8E10cOXzlrlgI0j+QA5ELE3qTBGYDg97cpYu5QMbVRjjeI6
	Mu
X-Gm-Gg: ASbGncsnoEItsvSDXqRbQRC4Kh8IUjc7o0pklCmFKLvxRMNa+qX7bAUMOPJ4Pj0gZBM
	av2u/1Wx+IMSyrraa2BrbyKo4WsKmFxD89SIzAiS5eyD2MdRxyYV5APA9tzjLcOENjW+PV/ibs7
	3t5I2FeRJikM+j3m5HTVEiyJAY360N+SbiyvvQF4wB8oRDbPtFEnyZACraMEK41kwMX9zcRmBlb
	FLEPFTIAxVFlEZyGy2Pa+qrlpwnN3hisxGyFP5rMkiqcgf9OwBYM0RwHOlGl03MZljFhxYtmgQk
	o7CXwWSxNHdbvI2fD31mc0/VoQqV6iYZ9af3mg7g/eG5PM7jSM58XAUMIvaQZqu7x/N81s3eERO
	mrOZ2EDTG1voaxF1z6mNuEtXp/QUexJaQcAmIjFIAjkgoxKc=
X-Received: by 2002:a05:600c:8582:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454b5110ec7mr17312145e9.12.1751637736815;
        Fri, 04 Jul 2025 07:02:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE+P0Nfr25RkBoVa/EoYZgkHPHVRA3QXbSx1KJI0Z4OIMAoOnHBEyqeTXs8zZiy7MJ6Xprz9w==
X-Received: by 2002:a05:600c:8582:b0:453:745:8534 with SMTP id 5b1f17b1804b1-454b5110ec7mr17309895e9.12.1751637734516;
        Fri, 04 Jul 2025 07:02:14 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f2c:5500:988:23f9:faa0:7232? (p200300d82f2c5500098823f9faa07232.dip0.t-ipconnect.de. [2003:d8:2f2c:5500:988:23f9:faa0:7232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454b1893479sm27322725e9.39.2025.07.04.07.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jul 2025 07:02:14 -0700 (PDT)
Message-ID: <00e2cdba-0fa3-48da-9596-7a2020bd1858@redhat.com>
Date: Fri, 4 Jul 2025 16:02:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 2/6] KVM: arm64: Update the check to detect device
 memory
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
References: <20250621042111.3992-1-ankita@nvidia.com>
 <20250621042111.3992-3-ankita@nvidia.com>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 WNyWQQ==
Organization: Red Hat
In-Reply-To: <20250621042111.3992-3-ankita@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -CdEu3_pXs84fczwx7LTufOfq1DeG4cxEZbJlH88apU_1751637737
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_070220_924617_957DA772 
X-CRM114-Status: GOOD (  25.01  )
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

On 21.06.25 06:21, ankita@nvidia.com wrote:
> From: Ankit Agrawal <ankita@nvidia.com>
> 
> Currently, the kvm_is_device_pfn() detects if the memory is kernel
> mapped through pfn_is_map_memory. It thus implies whether KVM can
> use Cache Maintenance Operations (CMOs) on that PFN. It is a bit
> of a misnomer as it does not necessarily detect whether a PFN
> is for a device memory. Moreover, the function is only used at
> one place.
> 
> It would be better to directly call pfn_is_map_memory. Moreover
> we should restrict this call to VM_PFNMAP or VM_MIXEDMAP. Otherwise
> the VMA has struct pages in it and mapped in the kernel VA.
> 
> Suggested-by: Jason Gunthorpe <jgg@nvidia.com>
> Signed-off-by: Ankit Agrawal <ankita@nvidia.com>
> ---
>   arch/arm64/kvm/mmu.c | 10 ++++------
>   1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 1601ab9527d4..5fe24f30999d 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -193,11 +193,6 @@ int kvm_arch_flush_remote_tlbs_range(struct kvm *kvm,
>   	return 0;
>   }
>   
> -static bool kvm_is_device_pfn(unsigned long pfn)
> -{
> -	return !pfn_is_map_memory(pfn);
> -}
> -
>   static void *stage2_memcache_zalloc_page(void *arg)
>   {
>   	struct kvm_mmu_memory_cache *mc = arg;
> @@ -1492,6 +1487,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	enum kvm_pgtable_prot prot = KVM_PGTABLE_PROT_R;
>   	struct kvm_pgtable *pgt;
>   	struct page *page;
> +	vm_flags_t vm_flags;
>   	enum kvm_pgtable_walk_flags flags = KVM_PGTABLE_WALK_HANDLE_FAULT | KVM_PGTABLE_WALK_SHARED;
>   
>   	if (fault_is_perm)
> @@ -1619,6 +1615,8 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   
>   	vfio_allow_any_uc = vma->vm_flags & VM_ALLOW_ANY_UNCACHED;
>   
> +	vm_flags = vma->vm_flags;
> +
>   	/* Don't use the VMA after the unlock -- it may have vanished */
>   	vma = NULL;
>   
> @@ -1642,7 +1640,7 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
>   	if (is_error_noslot_pfn(pfn))
>   		return -EFAULT;
>   
> -	if (kvm_is_device_pfn(pfn)) {
> +	if (vm_flags & (VM_PFNMAP | VM_MIXEDMAP) && !pfn_is_map_memory(pfn)) {

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Cheers,

David / dhildenb


