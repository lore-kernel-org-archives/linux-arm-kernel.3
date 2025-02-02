Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A5C5C0218F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 23:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e1dos8mPCCNcJjz8w4voHe85/j4TJkmhqF45HVaBd4U=; b=kxT288pjpWj/WFDpPprEqaHsds
	Ng/RSX6bAX4CZJZXQRF3FJrRUdKe19YT2C0sTjC17SxFYPZCLI/0VVvjWktk61XqbX2V1UJEQjhp9
	FIf8OlBWgQFp7iPtMBW1CZNfqUpwlLvnmZqZn4ftOfQEkvHTpSOAf0Sa8T842xtoq/QNjjyucMVtb
	9FHNUSDMQtLuUJGOV7YwB39YtZK4Jl02OFQ53SvUmQ6GfXCe2eBABaQ/k4N0/VP+Ckccg5OA53VuX
	J7qWa5CZMiDPtKhqpky6XizHanSLCXSTGyKw8pzK9j75dvwq+V0RlAnzMJ+5yWOy0iA6eteYsYZxP
	u5wNGDnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tejCr-0000000EHla-0ZgK;
	Sun, 02 Feb 2025 23:16:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tejBV-0000000EHf7-43SR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 23:15:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738538124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=e1dos8mPCCNcJjz8w4voHe85/j4TJkmhqF45HVaBd4U=;
	b=KeaaxaV9Q03bbJjlcMGJl0ejq5dguI85UEZqQ3VVBeXMYdQJ5DC6uWPzI8NgBV/F8Vm+xz
	HTSskg36EMYv5B9poIaejL9+YuOb86DmFIh/wV8u2WOh2pSgCXF5IhrIA3PKPxKMG9prpJ
	AFHOFTbf1kdYeYrI/GaZAZ5wxjS2FSY=
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-544-DjvPEEoWOOqUO2jV16HtTw-1; Sun, 02 Feb 2025 18:15:23 -0500
X-MC-Unique: DjvPEEoWOOqUO2jV16HtTw-1
X-Mimecast-MFC-AGG-ID: DjvPEEoWOOqUO2jV16HtTw
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-216311faa51so67361425ad.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 02 Feb 2025 15:15:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738538122; x=1739142922;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e1dos8mPCCNcJjz8w4voHe85/j4TJkmhqF45HVaBd4U=;
        b=amg7NoOhOoZSGuOMn0MjYSRfE+MfLXoVZl5w1uw+aMibEOrH0jDFjT2M5FoGj8sDOs
         EnfygOhqwfYDHCpWCyz8OkgRcFGeHd+EwbjC3K5hsZ7zeTqAyUGSRT/6cn9Cwnaa+WqH
         x5ne/BMBqCbB8i35nxtSYd16tEAvlrFM64ta5SGGp+r8e18TxnNiSFJzS3Br9wwlWLK/
         tz6nqCZ2zlQpE23yrv8oKekW7pUpDDb9+SOUYLLFqdy3658rWjhhL3n52bstNQes7qKd
         lLzt/tB3EYgpxQ0qO69fPcJgzFGJP3Ot1FnhaInwJMBUjAzlv8X/8idyAwWEpCyzU+mI
         mobg==
X-Forwarded-Encrypted: i=1; AJvYcCUMLxLqy3e6EZAEIPPu2RKsPofwbPfThhlilT0QtSKQIIBJqPln88dnzXhKl4vtIn0Uhf4K7/QijbcWDUvFcg3f@lists.infradead.org
X-Gm-Message-State: AOJu0Yw35LhjYuP9XPI7Nmlech13/51nIeSTgdzZPV7ejwG+AWz4Bq5B
	OpRdnjhrfjYkxwsK7x2FYRpwDA3dDv8YTvvIU3u6OxHUmdzZ3vgBhPmd9rC8Npd6xlJebwe2jB3
	EqiKt20ueUjQYT89fEbA6WMD/amC9k3pS4ay8eWdYAA3JVHRt1rbA8GD5njD5smbFqoiH4Cjr
X-Gm-Gg: ASbGncsvleZUFgqXiSdxNuC4J8F4Pb2QndxcaomQKx0cyQUl4zVpbOBNGPzO08k1qM/
	o26xPRqXp30ecpgtV/8+/LWRL89rw0OmfN2Z+9sFhmePJOvflrxsP5lyiWsu6Eol5BvI61WUQhb
	++lJee75rD1/L+CCPAuauSGgeWL34iF2xBhKcLzp4yMTtegvryuPp06t6Xs4uEbnjBG9b8xka/D
	cjJol3GKnL9ESpDeFicwRDTyfBJ41qpEOMjD/aAkfjoiX7tEYzfwFcONmFSZ3Ip8DlHxzU8YesD
	9rkyow==
X-Received: by 2002:a17:903:120a:b0:216:3f6e:fabd with SMTP id d9443c01a7336-21edd7eafccmr173599045ad.7.1738538122331;
        Sun, 02 Feb 2025 15:15:22 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE2mf76DirOg9TZyfOkrJfXsutpQ6g81h2feZA7/LYyJlI04cSOqf6NavNatW10Gphrl5eu/w==
X-Received: by 2002:a17:903:120a:b0:216:3f6e:fabd with SMTP id d9443c01a7336-21edd7eafccmr173598665ad.7.1738538121968;
        Sun, 02 Feb 2025 15:15:21 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21de32ea5fesm62974185ad.132.2025.02.02.15.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 02 Feb 2025 15:15:21 -0800 (PST)
Message-ID: <34990c4f-b65e-4af2-8348-87ea078afc16@redhat.com>
Date: Mon, 3 Feb 2025 09:15:12 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 34/43] arm64: RME: Propagate number of breakpoints and
 watchpoints to userspace
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-35-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-35-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 8zSj2iWLx0ksF_7Udc7rbOJeNcxnv4celinnTfH52Vc_1738538122
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_151526_095132_BF5BF3ED 
X-CRM114-Status: GOOD (  20.88  )
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

On 12/13/24 1:55 AM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> The RMM describes the maximum number of BPs/WPs available to the guest
> in the Feature Register 0. Propagate those numbers into ID_AA64DFR0_EL1,
> which is visible to userspace. A VMM needs this information in order to
> set up realm parameters.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h |  2 ++
>   arch/arm64/kvm/rme.c             | 22 ++++++++++++++++++++++
>   arch/arm64/kvm/sys_regs.c        |  2 +-
>   3 files changed, 25 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 0d89ab1645c1..f8e37907e2d5 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
>   u32 kvm_realm_vgic_nr_lr(void);
>   
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val);
> +
>   bool kvm_rme_supports_sve(void);
>   
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index e562e77c1f94..d21042d5ec9a 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -63,6 +63,28 @@ u32 kvm_realm_vgic_nr_lr(void)
>   	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
>   }
>   
> +u64 kvm_realm_reset_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
> +{
> +	u32 bps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_BPS);
> +	u32 wps = u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_NUM_WPS);
> +	u32 ctx_cmps;
> +
> +	if (!kvm_is_realm(vcpu->kvm))
> +		return val;
> +
> +	/* Ensure CTX_CMPs is still valid */
> +	ctx_cmps = FIELD_GET(ID_AA64DFR0_EL1_CTX_CMPs, val);
> +	ctx_cmps = min(bps, ctx_cmps);
> +
> +	val &= ~(ID_AA64DFR0_EL1_BRPs_MASK | ID_AA64DFR0_EL1_WRPs_MASK |
> +		 ID_AA64DFR0_EL1_CTX_CMPs);
> +	val |= FIELD_PREP(ID_AA64DFR0_EL1_BRPs_MASK, bps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_WRPs_MASK, wps) |
> +	       FIELD_PREP(ID_AA64DFR0_EL1_CTX_CMPs, ctx_cmps);
> +
> +	return val;
> +}
> +

The the filed ID_AA64DFR0_EL1_WRPs_MASK of the system register ID_AA64DFR0_EL1 is
writtable, as declared in sys_reg.c. We need to consolidate the field when the
system register is written.

         ID_FILTERED(ID_AA64DFR0_EL1, id_aa64dfr0_el1,
                     ID_AA64DFR0_EL1_DoubleLock_MASK |
                     ID_AA64DFR0_EL1_WRPs_MASK |
                     ID_AA64DFR0_EL1_PMUVer_MASK |
                     ID_AA64DFR0_EL1_DebugVer_MASK),

>   static int get_start_level(struct realm *realm)
>   {
>   	return 4 - stage2_pgtable_levels(realm->ia_bits);
> diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
> index a4713609e230..55cde43b36b9 100644
> --- a/arch/arm64/kvm/sys_regs.c
> +++ b/arch/arm64/kvm/sys_regs.c
> @@ -1806,7 +1806,7 @@ static u64 sanitise_id_aa64dfr0_el1(const struct kvm_vcpu *vcpu, u64 val)
>   	/* Hide SPE from guests */
>   	val &= ~ID_AA64DFR0_EL1_PMSVer_MASK;
>   
> -	return val;
> +	return kvm_realm_reset_id_aa64dfr0_el1(vcpu, val);
>   }
>   
>   static int set_id_aa64dfr0_el1(struct kvm_vcpu *vcpu,

Thanks,
Gavin


