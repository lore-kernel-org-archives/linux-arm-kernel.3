Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B75C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 05:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K5NVuBpJLlZnTOLyK2ct+nvinMD4r7ch0nzerHgxTzg=; b=3hM1teJMefzPSEYzHYyQQlUnTK
	Z5iCx2Rw3L5N6QcMUxbdlz9FAkhe6EcyrLkRRdzfxEYjtsFJCVQe0LncSVkVMuOJtwVLGB/UwCjAT
	69xrh42gvJSloOVLQzjrq4CW8pG6GQUeJJO0MoWT+OGUq+0LGng8p6DbPJZmVhF5+AIK4kiA7MShW
	EoExUFuTIfbHyuDL3uq5j+OueN06SXGP+UBhUcXXbTXamuLQhzJKxD/Er6GUea1BQBridfNUTHKLk
	PehRfFnwpjCyN25W3vE2YQw6SL1MT2ybGIYvh4KQpZnm/OKQI4ARcKwXJrTzDdecnIT3+AMm5Gja1
	COPuB1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKsS-000000038kH-394N;
	Tue, 04 Mar 2025 05:31:36 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpKqo-000000038XQ-2m6b
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 05:29:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741066193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K5NVuBpJLlZnTOLyK2ct+nvinMD4r7ch0nzerHgxTzg=;
	b=BbvRbR/SdaID1FaUt2dMWqEecqmXX1iUemD4ODsS5hXcJjtgGQDzGxItGpXbGG2SimG7W7
	kNwTytLl7z7B3W6HtOPTL10PGiwXPhH8Y4P7bFlgiQO0FsWslFiNvDVhM2Kmu+wYsD8VfY
	3B76kHlmCADaP54W2fIFRKBRRJKcPYc=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-341-faOGfkCkMX6KWMWSERrUVg-1; Tue, 04 Mar 2025 00:29:49 -0500
X-MC-Unique: faOGfkCkMX6KWMWSERrUVg-1
X-Mimecast-MFC-AGG-ID: faOGfkCkMX6KWMWSERrUVg_1741066189
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fe862ea448so16660284a91.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 21:29:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741066189; x=1741670989;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=K5NVuBpJLlZnTOLyK2ct+nvinMD4r7ch0nzerHgxTzg=;
        b=ENyFVHNBQMfL2BHHQejCKNZGxfdFOrQvbLPweD3JnjADUOKRJD8P4CDob5DtHjkUAD
         +mnM5SxbCoChUOh5bK36UrjoihbsyqAOWWIg5lu9i6IFgQvrSE9d34R2WtFR9E638Hd2
         2DyFHYz76g4oCZZGkwSInJxP+0oFq8s9GuydJpgsnmDWihlgK16oJzAm4DWVrvdpwC8U
         dEwDE0hR/xEBP1MTbEcEDIOfWof9mdsNOKLqVDpelORUFJ0z5mW1wTDGyKz9RdPOdLHZ
         hp3bbpeHZzmYDsiUmAX7FLz3g/Qb9BodcdrTAiJCSHNN//W9YKt3E1KO0//93gEqlYM4
         1GcA==
X-Forwarded-Encrypted: i=1; AJvYcCXAQfP2cV2rGiN1+l/6nt8Uo3IQg0NGncewtskgqw3T3g9WCajYoi6krSmc2vrKuH6fRWfm+nTWfogbFqHJwJno@lists.infradead.org
X-Gm-Message-State: AOJu0YwTh6vb+sj7b83NgypANj0kB6aUc4jflXA47bh5zZWGo3Y0dc1o
	HXzxG+K6w3koB6FOvFnuz91eu338EPGvGDpe6FzwgiNn3/J+BVXTc89f3ukJY0mH3mY1tZ8mIj1
	083alqe7sdwZH/hTSR7peRm9ttEztacVOY/+1FTEWlSOnfcT2HWOHdYZg06fR4ucgp8ojm6Jj
X-Gm-Gg: ASbGncuAAX80ImX4aWAPvDr/LVLCmX03rBQNj/KQQJyho8M+h7Ajuvi7OvnXaLHN0Zo
	EFkIA+UY7wKqd5irTTtX9ZEVqsuk5wyT7hKuHNdo5wmm0WcH4/TsTxyBNqCpqTby4FSawgi2+aM
	V9r8rNbFD3N1XLuHY6eVAaUOeNdluuiZR5SFh7hHNEWLqYT6WE7ycnfo1r3OOWI2mSlSAgGpBLt
	tdQAjq3syIK0Pd2rInqGDORYMOLJq2dL4yJc0yRzH45JplzKLSV8vor7sYduslMgzGfrirTr19J
	JkH15zl0P5CblAVevQ==
X-Received: by 2002:a05:6a21:3d83:b0:1f3:289e:36d9 with SMTP id adf61e73a8af0-1f3289e3a2fmr9220369637.40.1741066188754;
        Mon, 03 Mar 2025 21:29:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFWg73A+PEVA+mHDKOgju64xlHqN6DY26ozmlm+MoWJ+dQTX/kJaWOUjo5QtcrSQGbf6nj6HQ==
X-Received: by 2002:a05:6a21:3d83:b0:1f3:289e:36d9 with SMTP id adf61e73a8af0-1f3289e3a2fmr9220343637.40.1741066188462;
        Mon, 03 Mar 2025 21:29:48 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af174933aa5sm6247124a12.46.2025.03.03.21.29.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 21:29:47 -0800 (PST)
Message-ID: <b4cc58db-b9d8-4cdb-8954-8697972a54ae@redhat.com>
Date: Tue, 4 Mar 2025 15:29:38 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 23/45] KVM: arm64: Validate register access for a Realm
 VM
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
 <20250213161426.102987-24-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-24-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: LUWXDYrLwuiKQxA-gCyS6BL1-9YWcErHbJ4guEyar8w_1741066189
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_212954_812082_940BF16D 
X-CRM114-Status: GOOD (  25.92  )
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
> The RMM only allows setting the GPRS (x0-x30) and PC for a realm
> guest. Check this in kvm_arm_set_reg() so that the VMM can receive a
> suitable error return if other registers are accessed.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v5:
>   * Upper GPRS can be set as part of a HOST_CALL return, so fix up the
>     test to allow them.
> ---
>   arch/arm64/kvm/guest.c | 40 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 

The subject isn't 100% matching with what has been done in this patch.
It's actually to limit the scope for the write operations. The question
is do we need similar limitation for the read operations? If not, it's
nice to explain in the change log :)

> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 2196979a24a3..ff0306650b39 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -73,6 +73,24 @@ static u64 core_reg_offset_from_id(u64 id)
>   	return id & ~(KVM_REG_ARCH_MASK | KVM_REG_SIZE_MASK | KVM_REG_ARM_CORE);
>   }
>   
> +static bool kvm_realm_validate_core_reg(u64 off)
> +{
> +	/*
> +	 * Note that GPRs can only sometimes be controlled by the VMM.
> +	 * For PSCI only X0-X6 are used, higher registers are ignored (restored
> +	 * from the REC).
> +	 * For HOST_CALL all of X0-X30 are copied to the RsiHostCall structure.
> +	 * For emulated MMIO X0 is always used.
> +	 */
> +	switch (off) {
> +	case KVM_REG_ARM_CORE_REG(regs.regs[0]) ...
> +	     KVM_REG_ARM_CORE_REG(regs.regs[30]):
> +	case KVM_REG_ARM_CORE_REG(regs.pc):
> +		return true;
> +	}
> +	return false;
> +}
> +
>   static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>   {
>   	int size;
> @@ -783,12 +801,34 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   	return kvm_arm_sys_reg_get_reg(vcpu, reg);
>   }
>   
> +/*
> + * The RMI ABI only enables setting some GPRs and PC. The selection of GPRs
> + * that are available depends on the Realm state and the reason for the last
> + * exit.  All other registers are reset to architectural or otherwise defined
> + * reset values by the RMM, except for a few configuration fields that
> + * correspond to Realm parameters.
> + */
> +static bool validate_realm_set_reg(struct kvm_vcpu *vcpu,
> +				   const struct kvm_one_reg *reg)
> +{
> +	if ((reg->id & KVM_REG_ARM_COPROC_MASK) == KVM_REG_ARM_CORE) {
> +		u64 off = core_reg_offset_from_id(reg->id);
> +
> +		return kvm_realm_validate_core_reg(off);
> +	}
> +
> +	return false;
> +}
> +
>   int kvm_arm_set_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
>   {
>   	/* We currently use nothing arch-specific in upper 32 bits */
>   	if ((reg->id & ~KVM_REG_SIZE_MASK) >> 32 != KVM_REG_ARM64 >> 32)
>   		return -EINVAL;
>   
> +	if (kvm_is_realm(vcpu->kvm) && !validate_realm_set_reg(vcpu, reg))
> +		return -EINVAL;
> +
>   	switch (reg->id & KVM_REG_ARM_COPROC_MASK) {
>   	case KVM_REG_ARM_CORE:	return set_core_reg(vcpu, reg);
>   	case KVM_REG_ARM_FW:

Thanks,
Gavin


