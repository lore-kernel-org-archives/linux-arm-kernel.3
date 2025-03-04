Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDC18C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 04:37:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koAfnbIioMA+14AQ61if+zlW74/NZhlzHrW6k45ApV8=; b=L3o3VJQdOrDV6d17OarG2P93kY
	kMJfYM98R9yn3pccdldikW/po+uk3/EjdXp8zdtqnusYGiOAGGP+aH+oX2rDEv/c8DEw+V8QppR79
	2MTWJwO3OXHQ/gJ6hIXapQILw9YpHc4viC6Kq0OxhOjxoFW5QBIL/G9KloCE7IlwGHHy7b+ATW7/m
	bYjaeto0Q/J/ahhiALZzzluH830WoLBf+LGGLLagpje8b8GHu4b9BnOPcRplTUhJ/r61S9WxHQ1lh
	6/0lvbhXnrUvHEB8f7nKzTMNM8gXZNmSnoWuZu0WXBeQL0L6ssIL0NGF4OplZHNG+Y1USGtTNsypO
	XY+tFi1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpK1k-000000032X9-1HQr;
	Tue, 04 Mar 2025 04:37:08 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpK0A-000000032Jo-1FpQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 04:35:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741062929;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=koAfnbIioMA+14AQ61if+zlW74/NZhlzHrW6k45ApV8=;
	b=FwfmCUJjvcLCfCYezs6lbGIHZ5TB8VMmZiCl1DR0oupSHGLNEQCwH6l5dctzoBGiuzLXia
	WRnpSMZ2cwsgfi5mIc/24XWNm5gOJF/tjKivH3341ljMoULnUju3TNKEr1/2kSrX7kXBOy
	OTfm3mq7u3zO2+o3rB734udZiXpT9Yk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-454-cFirLQ0COy6a7UEjvfQrWA-1; Mon, 03 Mar 2025 23:35:19 -0500
X-MC-Unique: cFirLQ0COy6a7UEjvfQrWA-1
X-Mimecast-MFC-AGG-ID: cFirLQ0COy6a7UEjvfQrWA_1741062918
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22339923628so93635795ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 20:35:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741062918; x=1741667718;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=koAfnbIioMA+14AQ61if+zlW74/NZhlzHrW6k45ApV8=;
        b=kZzibCfRdcLh3URhl08DEkLwF4eLxEiPLIIfy/iLEu6p5DMydr5uR5xhUDubo1r/yq
         k8f8kL12stu/EWR+XU03yiQFzAs+TvS+iHbj29sxSHi6HA/Okuk24EMAbhy7LCdcVgCz
         ss1ctTAi53WEyGsSSFedvb53CCtxBGaFjm7nNJr8lUlIuTVWnR1I6vARnmuGGh/+frlU
         9z36MzGYgQ7YnCTufOtuN1Xd/cYGupamtE+bSjjKVzolUUsXOhgEheBD7lLVjQdvcxRx
         R+3dLM4p4BKDJMXHO9B5/gLCjDUk34Mok/ax5qW6XoO/6hsCY+3bd9AI0MRIj7Jfg+Vx
         oJ3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXhpwO64B0xwcW6isbGgiY3jYPjdvKFJphbql8cfUj1CH3fUoyB5pux04kQtO6p9ZNYcdowdjU7Ck0uT4tYx+WQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyKskFBW+T9JT0+zUFMWCQnC26b8zAGwoKbRAF9PqCknL3wyFhk
	kXAbOt6/qBCrNRUfTb6+FlvXfte8fhPd7u6GEJxgXdd4DCG/ajMKUaxfIEFb9pFu1vZnnaJbovF
	HDgxc7YCXn2pDQaeLLR1WuzSolMIXnSjxKPjgxLbPfB0LR86Dq6c4Onyxt2ho8MwcKVD8MfY6
X-Gm-Gg: ASbGncuqcGINAu2uDsHCAdmib0+HWMq3pjavrietMztwFt2GqZKqlrlxNNrle1+bNvZ
	PbJuV4+AfAodIbS3mY/iQPgtArbQm8IicvDieXxTcMOyBEpJo/MHqu44aH1l2nWyX4+5uCfvpWd
	Iy/L92zbtTOWUFRt7lb2DX+gGDCF2w1MOW+zp4apGyVrZeRYKomgdqzlNueOpZUWL3naugHzpUF
	2xh/6LOlMVqII7YO/+MSO5PKbIfdnMQ5L5K1yliyoHBaftNSYM+/6Gwm41zlckO4L1Bieo6eRHr
	AoDPi0gXnVuI0+SQfA==
X-Received: by 2002:a05:6a00:1913:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-7366e54bffdmr3139288b3a.2.1741062917991;
        Mon, 03 Mar 2025 20:35:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFQXRcbRKs/P20up2fdaG8YXNHl5+RMV13H5szfYcd+4TW2P2h1zQR3oil9dzOG5dukT3+nLg==
X-Received: by 2002:a05:6a00:1913:b0:736:3ea8:4813 with SMTP id d2e1a72fcca58-7366e54bffdmr3139257b3a.2.1741062917556;
        Mon, 03 Mar 2025 20:35:17 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-aee7dcb4611sm9141977a12.0.2025.03.03.20.35.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 20:35:16 -0800 (PST)
Message-ID: <b89caaaf-3d26-4ca4-b395-08bf3f90dd1f@redhat.com>
Date: Tue, 4 Mar 2025 14:35:08 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 18/45] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
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
 <20250213161426.102987-19-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-19-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pekkEagev5Gs6_SFjTHXAUmqFLGJBsIYo52OEh1KeA4_1741062918
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_203530_418419_FD2F863A 
X-CRM114-Status: GOOD (  34.02  )
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

On 2/14/25 2:13 AM, Steven Price wrote:
> The guest can request that a region of it's protected address space is
> switched between RIPAS_RAM and RIPAS_EMPTY (and back) using
> RSI_IPA_STATE_SET. This causes a guest exit with the
> RMI_EXIT_RIPAS_CHANGE code. We treat this as a request to convert a
> protected region to unprotected (or back), exiting to the VMM to make
> the necessary changes to the guest_memfd and memslot mappings. On the
> next entry the RIPAS changes are committed by making RMI_RTT_SET_RIPAS
> calls.
> 
> The VMM may wish to reject the RIPAS change requested by the guest. For
> now it can only do with by no longer scheduling the VCPU as we don't
> currently have a usecase for returning that rejection to the guest, but
> by postponing the RMI_RTT_SET_RIPAS changes to entry we leave the door
> open for adding a new ioctl in the future for this purpose.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> New patch for v7: The code was previously split awkwardly between two
> other patches.
> ---
>   arch/arm64/kvm/rme.c | 87 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 87 insertions(+)
> 

With the following comments addressed:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 507eb4b71bb7..f965869e9ef7 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -624,6 +624,64 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start, u64 size,
>   		realm_unmap_private_range(kvm, start, end);
>   }
>   
> +static int realm_set_ipa_state(struct kvm_vcpu *vcpu,
> +			       unsigned long start,
> +			       unsigned long end,
> +			       unsigned long ripas,
> +			       unsigned long *top_ipa)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct realm *realm = &kvm->arch.realm;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	phys_addr_t rd_phys = virt_to_phys(realm->rd);
> +	phys_addr_t rec_phys = virt_to_phys(rec->rec_page);
> +	struct kvm_mmu_memory_cache *memcache = &vcpu->arch.mmu_page_cache;
> +	unsigned long ipa = start;
> +	int ret = 0;
> +
> +	while (ipa < end) {
> +		unsigned long next;
> +
> +		ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end, &next);
> +

This doesn't look correct to me. Looking at RMM::smc_rtt_set_ripas(), it's possible
the SMC call is returned without updating 'next' to a valid address. In this case,
the garbage content resident in 'next' can be used to updated to 'ipa' in next
iternation. So we need to initialize it in advance, like below.

	unsigned long ipa = start;
	unsigned long next = start;

	while (ipa < end) {
		ret = rmi_rtt_set_ripas(rd_phys, rec_phys, ipa, end, &next);

> +		if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {
> +			int walk_level = RMI_RETURN_INDEX(ret);
> +			int level = find_map_level(realm, ipa, end);
> +
> +			/*
> +			 * If the RMM walk ended early then more tables are
> +			 * needed to reach the required depth to set the RIPAS.
> +			 */
> +			if (walk_level < level) {
> +				ret = realm_create_rtt_levels(realm, ipa,
> +							      walk_level,
> +							      level,
> +							      memcache);
> +				/* Retry with RTTs created */
> +				if (!ret)
> +					continue;
> +			} else {
> +				ret = -EINVAL;
> +			}
> +
> +			break;
> +		} else if (RMI_RETURN_STATUS(ret) != RMI_SUCCESS) {
> +			WARN(1, "Unexpected error in %s: %#x\n", __func__,
> +			     ret);
> +			ret = -EINVAL;

			ret = -ENXIO;

> +			break;
> +		}
> +		ipa = next;
> +	}
> +
> +	*top_ipa = ipa;
> +
> +	if (ripas == RMI_EMPTY && ipa != start)
> +		realm_unmap_private_range(kvm, start, ipa);
> +
> +	return ret;
> +}
> +
>   static int realm_init_ipa_state(struct realm *realm,
>   				unsigned long ipa,
>   				unsigned long end)
> @@ -863,6 +921,32 @@ void kvm_destroy_realm(struct kvm *kvm)
>   	kvm_free_stage2_pgd(&kvm->arch.mmu);
>   }
>   
> +static void kvm_complete_ripas_change(struct kvm_vcpu *vcpu)
> +{
> +	struct kvm *kvm = vcpu->kvm;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +	unsigned long base = rec->run->exit.ripas_base;
> +	unsigned long top = rec->run->exit.ripas_top;
> +	unsigned long ripas = rec->run->exit.ripas_value;
> +	unsigned long top_ipa;
> +	int ret;
> +

Some checks are needed here to ensure the addresses (@base and @top) falls inside
the protected (private) space for two facts: (1) Those parameters originates from
the guest, which can be misbehaving. (2) RMM::smc_rtt_set_ripas() isn't limited to
the private space, meaning it also can change RIPAS for the ranges in the shared
space.

> +	do {
> +		kvm_mmu_topup_memory_cache(&vcpu->arch.mmu_page_cache,
> +					   kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu));
> +		write_lock(&kvm->mmu_lock);
> +		ret = realm_set_ipa_state(vcpu, base, top, ripas, &top_ipa);
> +		write_unlock(&kvm->mmu_lock);
> +
> +		if (WARN_RATELIMIT(ret && ret != -ENOMEM,
> +				   "Unable to satisfy RIPAS_CHANGE for %#lx - %#lx, ripas: %#lx\n",
> +				   base, top, ripas))
> +			break;
> +
> +		base = top_ipa;
> +	} while (top_ipa < top);
> +}
> +
>   int kvm_rec_enter(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -873,6 +957,9 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu)
>   		for (int i = 0; i < REC_RUN_GPRS; i++)
>   			rec->run->enter.gprs[i] = vcpu_get_reg(vcpu, i);
>   		break;
> +	case RMI_EXIT_RIPAS_CHANGE:
> +		kvm_complete_ripas_change(vcpu);
> +		break;
>   	}
>   
>   	if (kvm_realm_state(vcpu->kvm) != REALM_STATE_ACTIVE)

Thanks,
Gavin


