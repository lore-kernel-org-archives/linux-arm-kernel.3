Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F5ACC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 01:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YAAI3E0WlUEH8QGHAO5vUmuOkyQG4sKUrRj2kW9NJz0=; b=qEokFUemvXs/flF6K4VbnzKtfQ
	mi7eb6vL5aSXBEmkOtde3S89Oonjg+8GDdJ6FETYzNiFnVGB8e1UpW9a99Zug5GBwr9OK7kygJACO
	NFjlTLCDBBKwED9aPpQfCfY08ty0gan5qJmNlRBLuaJpE1PjxwOAeFSs/iYp1Z1jMsBjHjXgL+LSn
	Vqzx1UlozLJaBe+R8rsAfX3JscXLVvB99OVVcSlVVeR1S/Nug4r3hMOBORpljrR7VGc7UiZeg/IHN
	aDb0q1Wng+/nby8i7tPEksdYN2ZjR70w5BChcEuo6VQvVL/Vv+CA368Ue84wiBFe0tZc2uj9yzDxb
	JDzDHqJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teOj0-0000000DGvI-3IQr;
	Sun, 02 Feb 2025 01:24:38 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teOhe-0000000DGq0-0Hq9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 01:23:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738459391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YAAI3E0WlUEH8QGHAO5vUmuOkyQG4sKUrRj2kW9NJz0=;
	b=FSj11SR+lGjmnG5VYaPgLqvBnlIhHUQoLJeP2PrwdHxT6z4FBWRLiM7efIQjuEX9AnkByh
	ygFYv9JnE7Pm/Ve9InkqZPJT/TrgatlYVMkN8Qk6p8Aum00q2iZ1mZFTQ/6vGfqfrluQYC
	Cyvs4pZUQS8lvVrE6xJL3dfyCZk097U=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-fHyHhoFeNwyushzhnPOWWQ-1; Sat, 01 Feb 2025 20:23:09 -0500
X-MC-Unique: fHyHhoFeNwyushzhnPOWWQ-1
X-Mimecast-MFC-AGG-ID: fHyHhoFeNwyushzhnPOWWQ
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef91d5c863so6399617a91.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 17:23:09 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738459389; x=1739064189;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAAI3E0WlUEH8QGHAO5vUmuOkyQG4sKUrRj2kW9NJz0=;
        b=dWASOcyvmOLdgMEfE5e1JKUIRfTgnE6BOq/W/0OxNTkVpengK5Wowyx/5QurN3Y88O
         hm8+zzAq/qXEwc0ylnHdMEm6+Jcp4Z8Ilp/AHo0PE47Teu8UlrAdgkYvsnVYQj9bIJeb
         6O4+YrSM7fcHYFnEd/GcF/T14UYL4MUJ4ObMcNHbowT9v6/Px+xCdCRiKbsPouoYrDSK
         00R0dQLiFQdT0bwv7jqmrQYcRGHU9F5B+fu+H1QmMK/nxDMfQkawvkytHjXGdUyOG+5q
         Z4mYUs46J/an4WCa0ICiYmL3oJe3lB0Y/3JZYHmPZXA/Wz7YrGa/R+vX7Qsho9rS3XdW
         eDPA==
X-Forwarded-Encrypted: i=1; AJvYcCWiDfQ8LFcU2gZQ7tIO5eXdtys2Q6rny/CfC6dXyjvYJ6IojFd/uCFZ8prTuXxLdPjyGElee4VgrrQL6jGNcL9Q@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz/ossk6SXifbEY5EkwfDoHWKl88wzIbOS9oRWMWP7WnICOtlj
	oFbM347E++3ms7aGx5nS7k4o7020Nd2ebhEtlgP/FeY914+mG7PGwUryq9Q9+nulSJDpnqE67xF
	i2YcyjvrHgIL/ZofvczishNsPj60fZLerdkxrw6yeobw55cVB03KYBpARMqJdeFUsHP9GoCcq
X-Gm-Gg: ASbGnctONpdnLv9LATqw1kmkzUPuFQ3aaFjwU5AcrcF2nhsxOWkmCwM6U1w3jJFdtnt
	X5I5AvmMBoFQwAdcwveRGLsJ7Fjz+smRFXv8VPVOu862UAhAFDskwPLysBQQzSxNt3DbUlepVHx
	6t2GicYEhfO5oogy0j0PzRgxoEidHWOd6SH6JDNtcLCmGPqie9ggKWHC3aNFXctxmMY5bHYvFR4
	yuesVcXwylsCBr8QSTR35O8kdg0DuhmsMbUZlyPmlt4NOVdVrnz/DVoRx2qIe3PUE2ysSu9TWUS
	nPWPKA==
X-Received: by 2002:a05:6a00:a84:b0:725:e405:6df7 with SMTP id d2e1a72fcca58-72fd0bf50d0mr22072042b3a.10.1738459388639;
        Sat, 01 Feb 2025 17:23:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF+rGTDJTNwVR5Fk0Ockt+Y4TXvcEQynR1IiX2sbu3+KwKdR5uE+ZGwPGUav29lR64slwel7g==
X-Received: by 2002:a05:6a00:a84:b0:725:e405:6df7 with SMTP id d2e1a72fcca58-72fd0bf50d0mr22072011b3a.10.1738459388254;
        Sat, 01 Feb 2025 17:23:08 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe631be3csm5660892b3a.7.2025.02.01.17.23.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 17:23:07 -0800 (PST)
Message-ID: <09f42dc3-9c43-49ef-b4eb-8aeab387f0fd@redhat.com>
Date: Sun, 2 Feb 2025 11:22:58 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 22/43] KVM: arm64: Validate register access for a Realm
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
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-23-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-23-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: qDaFfi9qU0_eua8D_4dU2b6ZAHq3oEoIfovcSlqfcTQ_1738459389
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_172314_259254_66ECA352 
X-CRM114-Status: GOOD (  25.24  )
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
>   arch/arm64/kvm/guest.c | 43 ++++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 43 insertions(+)
> 
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index 12dad841f2a5..1ee2fe072f1a 100644
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
> @@ -115,6 +133,9 @@ static int core_reg_size_from_offset(const struct kvm_vcpu *vcpu, u64 off)
>   	if (vcpu_has_sve(vcpu) && core_reg_offset_is_vreg(off))
>   		return -EINVAL;
>   
> +	if (kvm_is_realm(vcpu->kvm) && !kvm_realm_validate_core_reg(off))
> +		return -EPERM;
> +
>   	return size;
>   }
>   
> @@ -783,12 +804,34 @@ int kvm_arm_get_reg(struct kvm_vcpu *vcpu, const struct kvm_one_reg *reg)
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

It looks the core registers in kvm_arm_set_reg() has been validated for twice.

   ioctl(KVM_SET_ONE_REG)
     kvm_arm_set_reg
       validate_realm_set_reg
         kvm_realm_validate_core_reg        // 1
       set_core_reg
         core_reg_offset_from_id
         core_reg_addr
           core_reg_offset_from_id
           core_reg_size_from_offset
             kvm_realm_validate_core_reg    // 2
         copy_from_user

Besides, there are other types of registers that can be accessed by KVM_{GET, SET}_ONE_REG:
firmware and bitmap registers, SVE registers, timer registers, system registers. Need we
to hide any of them from the user space? As I can understand, the SVE registers are owned
by RMM at least and won't be exposed to user space.

Thanks,
Gavin



