Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FB55C282D6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SvHiAzkhpGOwKIBXJW3ZvTlN3vuL1LXpAI2oO3MJds=; b=JnbfVkAP2GmPQBXu7QrQKAfxr3
	+FmTgmIWaoxS80cDtKC9AwhkR2hsaJlsm2qoiz7YEvcSF7yIFohJ1FzVdUtPmR3JiDnvt8d7FVdOU
	VcYmlOmVPIwDfd/4Fclk7tBLp11qkgVFtjSiLVZdX8ezhzKRb/avYcMmWytTQK42f5z+ZSohZwni/
	Brx4qg4eWg7dwK7AcqBtsIOjoU+4tsRsGo3fuHXiB0hb5w82kBH3giG11YBpXCR/gZeLFbnkUl071
	XFx5/3R6eiN6A1c4rx9fJnOfPXNQQ0+vLyYeAyVdeX/R/H4VWhNumSg/Ararcm5/mMZx5idjvSnVE
	7rfz4XTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6Y-00000004ZNp-3ZOB;
	Tue, 04 Mar 2025 12:10:34 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQoL-00000004Syp-1MFk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:51:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741089103;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9SvHiAzkhpGOwKIBXJW3ZvTlN3vuL1LXpAI2oO3MJds=;
	b=X1QWNwFXVJEhGhNsXwOuEC/OKX+gGCHdNn3aawFlcbaHAwIk0ZkVFzLJy8QnKqFJoYsz/4
	gIalbrwtSAVeokDbqG/mv+t5OHeZiAehtBL6uEnsZsLzzTmacoqc3oSOhnZ7ROoa0viFCB
	sDhPxd0IHAt8fZl6ZqbweulPup5IZYo=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-b5LajK4hMa-nrgKfUgJKZA-1; Tue, 04 Mar 2025 06:51:37 -0500
X-MC-Unique: b5LajK4hMa-nrgKfUgJKZA-1
X-Mimecast-MFC-AGG-ID: b5LajK4hMa-nrgKfUgJKZA_1741089097
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-223725aa321so7029925ad.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 03:51:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741089097; x=1741693897;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9SvHiAzkhpGOwKIBXJW3ZvTlN3vuL1LXpAI2oO3MJds=;
        b=DEtEtwgXRvWc4ZPhpFAFoJ/a4zaAP3JPArvqxXmdutIrWgEeyWMcxbD/l4S7c60Vdh
         J6YHX7Pbyjn+IwirgBEACE2lCS6UcyeVs64CP8wSl7QPOmIwnBGsFoCTRvU0EdS7Hqqd
         KzLJq7lcRny7wtGmVj5bTpnLhtGnuxi8Yjcp05uKPMbfSSi9W0/Ld3eyOZaQTVtCHh+B
         mGnXmVE7LRJsbb+CY2sVB1lSVjz19fyaMp09ff+FMI+qKtfHjo7BQtVul2Uen2vehO7W
         e0wHNKQJ2DNSvxn+pwk650Ncga9zX7/MLqTCTboEYYdG5zeGtsrXJbb8qNvZ37jr+Sz8
         eW1g==
X-Forwarded-Encrypted: i=1; AJvYcCVSAuF3Vup8eHh1Mxxtjn/HdHcuNYXe/AgtwfE1gfm//wMgw17hp8GsP+zYUjFN2pHi1aqhskHwKcwYXofDhWWa@lists.infradead.org
X-Gm-Message-State: AOJu0YxcDPUPced51AvpZ0qErdtbHldG1cJSNhiBbhTaQCiO1bD5/lD1
	Heu+ZSy3Vpb2sor6shUsP/1T7Cw7nX4twcLecg7QT/WEtoSeIhYPif7jdjnrj2FY6cmGfHJHu2u
	qoalGkDBcePLey5AgfEehKQhiezQFyK8q2fD2SabPXGOl8wit9AgrCzAHRvXVBRQOzfsY7zxk
X-Gm-Gg: ASbGnctQzeo33+jQUsIikg1ztNgeIGS2VC2BmtoKd75R/hH4mxe8/aO9oW11jJrEpc0
	vsVDQCOqnccuJAAlDrM9Z75OtFAkvOY7pcEniA3xwf3HhTBHklnyAhSawsxx2ilxAO2ThvXe9n2
	b/P2jaXoy8tYgPjhzOsdeqrJN0U+/meYo/Q7/SHsog4rWDiK6e7OwF8EiQ7MRsK35srU4YWjy8Q
	YowYISSVpGf+LEsXjc7aoinjShBtB3wfZDredvQEFuZiObbGTqH/8yWnnrqfh3wPKHU00wNyN45
	rBKnMhjhSgqNYVbw0w==
X-Received: by 2002:a17:902:d48f:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2236924786cmr286756925ad.32.1741089095300;
        Tue, 04 Mar 2025 03:51:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGqkDc//0lhtuEEGTLRirsOl+2zU34lz3XcWjEj6faC+59ETLrTC0850jV9RLUFK6Nc4S9jqg==
X-Received: by 2002:a17:902:d48f:b0:220:c164:6ee1 with SMTP id d9443c01a7336-2236924786cmr286756495ad.32.1741089094965;
        Tue, 04 Mar 2025 03:51:34 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2235052beaasm93466525ad.233.2025.03.04.03.51.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Mar 2025 03:51:34 -0800 (PST)
Message-ID: <32a09a27-f131-44dd-8959-abb63b2089a8@redhat.com>
Date: Tue, 4 Mar 2025 21:51:26 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 34/45] kvm: rme: Hide KVM_CAP_READONLY_MEM for realm
 guests
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
 <20250213161426.102987-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: U7NADZZkOK0U0U1c78y5L9bZBf9vKLmSvKhOXawzVLs_1741089097
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_035145_438195_A431D38A 
X-CRM114-Status: GOOD (  15.71  )
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
> For protected memory read only isn't supported. While it may be possible
> to support read only for unprotected memory, this isn't supported at the
> present time.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 

It's worthy to explain why KVM_CAP_READONLY_MEM isn't supported and its
negative impact. It's something to be done in the future if I'm correct.

 From QEMU's perspective, all ROM data, which is populated by it, can
be written. It conflicts to the natural limit: all ROM data should be
read-only.

QEMU
====
rom_add_blob
   rom_set_mr
     memory_region_set_readonly
       memory_region_transaction_commit
         kvm_region_commit
           kvm_set_phys_mem
             kvm_mem_flags                                    // flag KVM_MEM_READONLY is missed
             kvm_set_user_memory_region
               kvm_vm_ioctl(KVM_SET_USER_MEMORY_REGION2)

non-secure host
===============
rec_exit_sync_dabt
   kvm_handle_guest_abort
     user_mem_abort
       __kvm_faultin_pfn					   // writable == true
         realm_map_ipa
           WARN_ON(!(prot & KVM_PGTABLE_PROT_W)

non-secure host
===============
kvm_realm_enable_cap(KVM_CAP_ARM_RME_POPULATE_REALM)
   kvm_populate_realm
     __kvm_faultin_pfn					  // writable == true
       realm_create_protected_data_page

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 1f3674e95f03..0f1d65f87e2b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -348,7 +348,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ONE_REG:
>   	case KVM_CAP_ARM_PSCI:
>   	case KVM_CAP_ARM_PSCI_0_2:
> -	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_MP_STATE:
>   	case KVM_CAP_IMMEDIATE_EXIT:
>   	case KVM_CAP_VCPU_EVENTS:
> @@ -362,6 +361,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_COUNTER_OFFSET:
>   		r = 1;
>   		break;
> +	case KVM_CAP_READONLY_MEM:
>   	case KVM_CAP_SET_GUEST_DEBUG:
>   		r = !kvm_is_realm(kvm);
>   		break;

Thanks,
Gavin


