Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC9DC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 23:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ejh1GDPAKVllO6gllmhAfMEyCPmPMUvWgSEqENGci+A=; b=nFfkwABDFi9NgHFccm1/jN46nf
	ktVlro6Vkmv4mM/wQT5xJbyX3fMk0bopTSYXVx008XVWGxMW2AebqunUSMYhpK09l058Ghc15Wrvf
	/RD9IOhYYqBKjnYAHRu1VkHjxjKKJGxYgK8vFyBAPtj2EphfwAkao/9MvYdIhaDrpTZG4PKAsJOl3
	BP/HT11dbW4ewiLR+RXZ+48P8YmOV1A6VK5AqCTOOpTluEvkbcl3g6jCVE7dgWYiD+T2BmFt+r09R
	7YLVYdpGWp7P2e0SGRKH96zDsnLPLx2yO53O90868TJX1S6Qh0TvaQaZDTjggdzr/u6bXo8h5Brho
	/I6JsRoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tossw-0000000GoRc-1gL3;
	Sun, 02 Mar 2025 23:38:14 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tosrL-0000000Go9C-3ERe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Mar 2025 23:36:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1740958592;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ejh1GDPAKVllO6gllmhAfMEyCPmPMUvWgSEqENGci+A=;
	b=Nh9A4hTbeDfQ97vBAXy71M9ouLGGjXnTTZ/avMJmUZnqKrUzitzqbO5wF9eKwzewP+WknH
	UUUfcNjnReYiCh97VRN746u5sGB/oNwa9rdXjf8yZQvk4VhjpwgQriZnyqBF+7yGTSPwB6
	4yKA0zl4XYgbOxsw4jYqet9c0qzp4vk=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173--g89oMzSOTyr3-Yb9EQd5g-1; Sun, 02 Mar 2025 18:36:31 -0500
X-MC-Unique: -g89oMzSOTyr3-Yb9EQd5g-1
X-Mimecast-MFC-AGG-ID: -g89oMzSOTyr3-Yb9EQd5g_1740958590
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-22379af38e0so27482675ad.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Mar 2025 15:36:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740958590; x=1741563390;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ejh1GDPAKVllO6gllmhAfMEyCPmPMUvWgSEqENGci+A=;
        b=Zlys4RWNAmT/CFxUrMXuHvh7i+JOm2iHqqlEBiZDEoWb4YIH5iipWfSxehGTN5W3E9
         NC/nCa16PkMw0v881NqOmJuy2msD/BYSiOdfpVUVmtBnG03FMo0RKwIfUlju4f++bLGC
         2vpHntIpJQ1VxA93STgffQaya34t+pFn1H378bnIkqil+u/0uYfrg0b/Pjos5XeasyFv
         BX1/q5/bo7XJgcoj+3SS3r3+zjDwPtDaustd9m8TgZD5t/3Pw/s1HRjdpsVwEk8qTEX4
         wcJd7EceugiRKnqQuKy56h1VysjCQJp8LvO2RkT9/Mz7VpV64CGmdbZJmuUYxJfDTq/z
         wtmA==
X-Forwarded-Encrypted: i=1; AJvYcCVkeytdE9/fn5nsY0XXsO47O//5ihBu+6H0QeED8GjRjn3X63mZEzdKLFmkiN2jfiVpfooczPB3DXMbOwOX+Zvj@lists.infradead.org
X-Gm-Message-State: AOJu0YxbILxX6Sc9hV6llWWGYSoUPqKDSmM62k5rcbom0tyU4Nj1w/h7
	cqyBS1LAz66d+srMh+3ElWYOgc5+d6Mfa/rWWynvkUUjA40dVt6gK4dhCF9IKgIVlM+1/Yo3Es3
	+vsJwIumg1rAIgWZtIkOMDUFzfNrium7ssOOJJb3DzDTfqwny8IdOXCaAsF5eNYSkZ8HNO8lF
X-Gm-Gg: ASbGncuXtltxIQhGGgo56p4QMOVaz2Stw13muxTfXHYhFwV/GluFuyBMUlu7fRf2AqO
	LcDO2M7R8aRTcEyOqHPZe9H91HIKOMqi43r/JIHhr2LizVopOX+08vn40rD4GriNpHksr5469Du
	WQkbGuOi9enL1/LiC9fhx9i/HQCi9PhM4ZqFsLazRfFitK+llsk89/Jf61YYShGRh6Qp8zSI6pd
	gBRbH8FesQ0n8Z+TLP14eXHIhSZ7rMk9GseiPg54tGLwCtvIPmdzJz9MLNxzqGw6+8YNzqJjeL4
	AEw6nl/o2PJl/5tm4A==
X-Received: by 2002:a17:902:d48c:b0:21a:8300:b9ce with SMTP id d9443c01a7336-2236926a62emr202778645ad.49.1740958590129;
        Sun, 02 Mar 2025 15:36:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEddAUa+nONgsuM9Tynj/Y7d+u/KE8b7znylUvPdW2+N+R2Tk2a3TFLdpAdjVAFLYlLTeS4vg==
X-Received: by 2002:a17:902:d48c:b0:21a:8300:b9ce with SMTP id d9443c01a7336-2236926a62emr202778335ad.49.1740958589841;
        Sun, 02 Mar 2025 15:36:29 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223501fbd47sm65995365ad.67.2025.03.02.15.36.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Mar 2025 15:36:28 -0800 (PST)
Message-ID: <8bf9ba6c-a8b2-42aa-9802-8e968bec1cd5@redhat.com>
Date: Mon, 3 Mar 2025 09:36:20 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 01/45] KVM: Prepare for handling only shared mappings
 in mmu_notifier events
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Sean Christopherson <seanjc@google.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
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
 <20250213161426.102987-2-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-2-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SRNUFSsbYSWSf5J4hIjBL9i674BA67N1FafAhiiA2oI_1740958590
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_153635_896183_4EBACFF9 
X-CRM114-Status: GOOD (  18.36  )
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
> From: Sean Christopherson <seanjc@google.com>
> 
> Add flags to "struct kvm_gfn_range" to let notifier events target only
> shared and only private mappings, and write up the existing mmu_notifier
> events to be shared-only (private memory is never associated with a
> userspace virtual address, i.e. can't be reached via mmu_notifiers).
> 
> Add two flags so that KVM can handle the three possibilities (shared,
> private, and shared+private) without needing something like a tri-state
> enum.
> 
> Link: https://lore.kernel.org/all/ZJX0hk+KpQP0KUyB@google.com
> Signed-off-by: Sean Christopherson <seanjc@google.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   include/linux/kvm_host.h | 2 ++
>   virt/kvm/kvm_main.c      | 7 +++++++
>   2 files changed, 9 insertions(+)
> 
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 3cb9a32a6330..0de1e485452c 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -266,6 +266,8 @@ struct kvm_gfn_range {
>   	gfn_t end;
>   	union kvm_mmu_notifier_arg arg;
>   	enum kvm_gfn_range_filter attr_filter;
> +	bool only_private;
> +	bool only_shared;
>   	bool may_block;
>   };

The added members (only_private and only_shared) looks duplicated to the
member of attr_filter, which can be set to KVM_FILTER_SHARED, KVM_FILTER_PRIVATE,
or both of them. More details can be found from the following commit where
attr_filter was by dca6c88532322 ("KVM: Add member to struct kvm_gfn_range
to indicate private/shared").

I'm guessing Sean's suggestion was given before dca6c88532322 showed up.

>   bool kvm_unmap_gfn_range(struct kvm *kvm, struct kvm_gfn_range *range);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index faf10671eed2..4f0136094fac 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -593,6 +593,13 @@ static __always_inline kvm_mn_ret_t __kvm_handle_hva_range(struct kvm *kvm,
>   			 * the second or later invocation of the handler).
>   			 */
>   			gfn_range.arg = range->arg;
> +
> +			/*
> +			 * HVA-based notifications aren't relevant to private
> +			 * mappings as they don't have a userspace mapping.
> +			 */
> +			gfn_range.only_private = false;
> +			gfn_range.only_shared = true;
>   			gfn_range.may_block = range->may_block;
>   			/*
>   			 * HVA-based notifications aren't relevant to private

Thanks,
Gavin


