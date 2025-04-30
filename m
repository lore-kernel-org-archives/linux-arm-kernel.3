Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838C9C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 12:13:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7tFgFXzqc2ivrCQjcqTMjWCPkQCLYsEDRrk0U+aYhgw=; b=gBWzxmbN+wtBarjNUbBnLK1tGJ
	XuCMDHExVdAdVc+1NggXj+beec2pQmn1l0rK6tMQZ41F57jW5sBdEKwBRf7y4dPpCTY4m/IwUguXa
	pBJ5OxSsTAW8JdZ9IVFPc2Vs9jmMytJ5Y4wJlTYV5mDGlsLm+IHnfOcdOHu+xY1N31aUzgKCRmmEl
	Y0lOmTnZBn0grGB78k574XU/K04DBoNvXyjzi6YJbawZMwfPUuE5SY3I5Bx4GDIWz/z7eC8QlVnbW
	6WUIeKvKY23cqdx/gR5eIChvMVoTczauqxAG6OpKwK5uMi3CbDU/eYmPnD9fQ54z/Xj5B6kkoqtoH
	tkb9uVsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6JW-0000000CnTl-3tbp;
	Wed, 30 Apr 2025 12:13:22 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA6Ha-0000000Cn7C-0Wt3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 12:11:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746015081;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7tFgFXzqc2ivrCQjcqTMjWCPkQCLYsEDRrk0U+aYhgw=;
	b=GL18b2IC2gkkQb65yB8bclS/XWPzzpx6rrq4QXIRPCjsUPl03/qSGrz6SgIkNjhRc9pMp2
	YHuAmBzzUgLZs/EyATlXwNy4LcfEpT3j4BsZn6EJWN6LgemUGZLItx6uNkfVcVzjvNelUo
	npGRxmrJFiW+2ief4NdvMSa+yNZnJLE=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-E2Mhv3oOODu1S9BBDViQng-1; Wed, 30 Apr 2025 08:11:19 -0400
X-MC-Unique: E2Mhv3oOODu1S9BBDViQng-1
X-Mimecast-MFC-AGG-ID: E2Mhv3oOODu1S9BBDViQng_1746015079
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-224364f2492so52275225ad.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Apr 2025 05:11:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746015078; x=1746619878;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7tFgFXzqc2ivrCQjcqTMjWCPkQCLYsEDRrk0U+aYhgw=;
        b=k97rz5piCcGsf89IrcyAwjxzGY2rnx8Nttf4lhmNEpTWAERtwzR7+sssENAHvNod33
         xTZ7/9KoOUZxfP9MgzmnI4z4calyZ7HAwQbIGTvMXPjWMm33RF/sL6VMHu/ztQ7hH4Qb
         ccHGYg900V19vuPwMOnyCxVslGKQBTHETIxaF5v3K8XrrmSCdboK5ZjPg5AoVcrY2nZu
         iFRMHILDRn+t85GUPJioikHZUnEYLVqaU12QC6Vi8dCmdyhKRGLyxGIZO4U0t40LpB1y
         7Z+ISwRb4+d1+N+BNjlxd49O5Ija6JCC2yX+oCydAv113Xe2ryPMQIs33X2nc7bRni3b
         gmpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXzpFH/i93cNPVsBHGFtsdedIwYZV2Von6mf6n0EYixhDcfSgVoJZzMYvpgTWTvokVAP5Kk4TfxJFDfgWWhUoTY@lists.infradead.org
X-Gm-Message-State: AOJu0YwhPPj8ZUwGKdad4RdiSL1PEDgsxHzn/pJWp1mKec0/kdnuBA2p
	TQUOrDWMBP+YMfpe2n6i+qXA/2g8KieOwTY8hyttlXgDepbObA13te1cjHtngEOoEvLZ3J8VV3c
	HUuGvHpLLjdnjPAgUHBsT/ChRwBPtnF3RPgrzc1T32HwmiTSXoLp75uE5weOOOno/5W2heZql
X-Gm-Gg: ASbGnct5eOE4VEVK/b/Ip2S0sTr0y+EqxCWjtqxlhYt1A1YnqhMMfj1UT0nzBJAu5u2
	u/EQ6gUL4F777YpBBnjeNHU5Dd0CwISx4EJfiJjzl6P3q28Cv5Z3m4QhSq+IYQUI9R87gaBACxI
	gt0agV479n/w8Y+dHtnC0ie2fOI4tCo7GUdDNoj7whnTfbgT138fWjH3ImvVY1W9TP7ybVaLyy+
	BkxMwger+3t9NN2QbYhP7XpAlTfMyDX1YaZc8C0R9COPoO3GhVdWOmRfihhdM/q40WzEVmCbVIv
	ahlyjarrfRcn
X-Received: by 2002:a17:902:ebcc:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22df578bcebmr38849565ad.14.1746015078600;
        Wed, 30 Apr 2025 05:11:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHL6LT3h1gUo31SZA1COwvt+3Fy8+QNcJQ2pDlfoosU3yDt8W0PlDXI1jufTia5Y9HcVnFrHw==
X-Received: by 2002:a17:902:ebcc:b0:223:f408:c3f8 with SMTP id d9443c01a7336-22df578bcebmr38849145ad.14.1746015078260;
        Wed, 30 Apr 2025 05:11:18 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db50e89acsm120641205ad.113.2025.04.30.05.11.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Apr 2025 05:11:17 -0700 (PDT)
Message-ID: <b5770d9b-4f17-4be8-95a7-1549322debb2@redhat.com>
Date: Wed, 30 Apr 2025 22:11:09 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 17/43] arm64: RME: Handle RMI_EXIT_RIPAS_CHANGE
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-18-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-18-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qFqClQa4S6qckHUg7DbAmfoX1i0gKNepnYIDPeCwzNc_1746015079
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_051122_243143_95825B2C 
X-CRM114-Status: GOOD (  32.99  )
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

On 4/16/25 11:41 PM, Steven Price wrote:
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
> Changes since v7:
>   * Rework the loop in realm_set_ipa_state() to make it clear when the
>     'next' output value of rmi_rtt_set_ripas() is used.
> New patch for v7: The code was previously split awkwardly between two
> other patches.
> ---
>   arch/arm64/kvm/rme.c | 88 ++++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 88 insertions(+)
> 

One nitpick below, either way:

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index bee9dfe12e03..fe0d5b8703d2 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -624,6 +624,65 @@ void kvm_realm_unmap_range(struct kvm *kvm, unsigned long start,
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
> +		if (RMI_RETURN_STATUS(ret) == RMI_SUCCESS) {
> +			ipa = next;
> +		} else if (RMI_RETURN_STATUS(ret) == RMI_ERROR_RTT) {

--->

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

<--- This block of code have been existing in multiple functions. I guess
it would be worthy to introduce a helper for it if you agree. Alternatively,
it's definitely something to do in the future, after this series is merged :)

> +			break;
> +		} else {
> +			WARN(1, "Unexpected error in %s: %#x\n", __func__,
> +			     ret);
> +			ret = -ENXIO;
> +			break;
> +		}
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
> @@ -863,6 +922,32 @@ void kvm_destroy_realm(struct kvm *kvm)
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
> @@ -873,6 +958,9 @@ int kvm_rec_enter(struct kvm_vcpu *vcpu)
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


