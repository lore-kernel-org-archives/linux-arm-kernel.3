Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E01D9C369DC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 00:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V61xkxPc38oYjgZEUT4lB2Jdszj4oz3OEIRZu6N5HPs=; b=3/AdbV6VIr4TBIdxL4A8+1UjiN
	N5hUXjT1U6oS5klffbLZ/U5G+0be6LgVQ7C5zdb+5iUT8OoKqMnnYbumXoWMjOhoEb0SdFbFWZ21o
	oLWtmGNZVtzb2C7zaGabAoKWDKZgri1Bkii/AJUfLs6rOTGVHAfIpvCYMZQ5iZkIm3bxJR3IlZoij
	1aVb5ZniBIByF5iYWlhhP1t1IiHP0u/MawAfTykzlq67TPKsHzlk/jflz6Ct+az3XUuJwkD48p4gc
	hh1wiKYVtYqByXHwH1fBL+QkmayAHkuOj7c8JQJUX/hwPGBPNhqnbpwuhptI9w0zakYZfTDwvVNPb
	lVpLnWYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAeAv-00000000OIY-0Fbb;
	Fri, 02 May 2025 00:22:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAdMn-00000000HJc-2Yoy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 May 2025 23:30:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746142254;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=V61xkxPc38oYjgZEUT4lB2Jdszj4oz3OEIRZu6N5HPs=;
	b=CUNTGs3r4VrwR//lImqk2Lgrr+aIoFJduIe8NWCd2Ml1yplw519Ubqu+2Y8Y632c84BsGJ
	ZvK+p3nxNh4f4/sHpOMfjjk5SA2PwVMqILkChy+O83t2IUL3Lr+JRW7xIYyk7e5WtZKmtH
	B70O31qY+YMSdzCdB8t1q8qtmVUvLbE=
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-342-FjTG5kUsObSMmyVAauSnjw-1; Thu, 01 May 2025 19:30:53 -0400
X-MC-Unique: FjTG5kUsObSMmyVAauSnjw-1
X-Mimecast-MFC-AGG-ID: FjTG5kUsObSMmyVAauSnjw_1746142252
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-b1c122308dcso1630287a12.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 May 2025 16:30:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746142252; x=1746747052;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V61xkxPc38oYjgZEUT4lB2Jdszj4oz3OEIRZu6N5HPs=;
        b=h7f9229L9tgTrhPaQj2YRvw6JI8UDlL+rm8OyLH3PGj+M/5AZn7ztfmLAwe/TERtpG
         FkinzuVJIoRfH11ODeFTYjNrcLpf1xrYvets+d1ywvScypv7xWv+EHBeNSOdPQgqbp0K
         bTE6rTJWmrvVfJm+0Rcbgvc5BMiNDnzE1id7CtZ0W+2Rd4ua9NXO/aXohG3pxW5Lt7Rv
         5jsFapxush56Xk/ojCDrOVclEqwCis7vcQj5iezxX+FaLLRipl0Wimz65ygxUkhH72QD
         3t1tQiRg/ve8LKogxYDMKOGgbWRCi8eyWNmhYQUNbkgMf5O7bee4pcF2YESfSPA8ytDy
         3HiQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKg7ESQNH46iREwpXMG165FJDQo0GORr5WY4bByT/LBxnqp2oK1Zxug4q1dh42YGeIo94ra7fDIt5WdCsnGrHv@lists.infradead.org
X-Gm-Message-State: AOJu0YzVY1HsaudYLhutQNfsMQ8hKtQBNPwCZqrXnFUeYAinzzGlInv8
	owu47GHv2aeQq10x8ajY5NOqNMTC1O2zungdvNmOURGG53RgDcJIyll6ymw0rhe+UxxIv37R2me
	0/2iBkS4rNg4amy5CScm7AzPcmmtEppirDL+9cWmJ8JVnxpDQxvcmP21JRmbWgs6cV5HUmPna
X-Gm-Gg: ASbGnctN+4OeUAXoBaLdYgGnQFYls/Mf8s0AUXDReBkat3zQZ88h+oMDAiZpP2rgEi5
	/9PnWsFksgtHWE40DafYushFdIyKmI9uyFGanSLdM9Hb2TYq5UBolc36T67l6BkhyDvVWFC9l5K
	cNb7eX2YR1aOG1KZsJPcUyIQ7m/vx6zQYcdoEqal+ewtrlo6ahripPAzKO0xyyviO6cAYOymjow
	TPYRXrpoaudBFnDUURrLkmjM1BmbzfUb80POeZ7oQcGLt7QPHS8MOgHpyg7lzreFZAAIkRn38V/
	HlsxCXBU6MQG
X-Received: by 2002:a05:6a20:394d:b0:1f3:2c55:8d8a with SMTP id adf61e73a8af0-20cde952da6mr1047586637.12.1746142252566;
        Thu, 01 May 2025 16:30:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2dZAV7HsuZ8oKI3zYsiz7ja1Xpp36L3rGRrA0ckr87PI6dc2juV/UWU2b7kcpP5iRZnp7dw==
X-Received: by 2002:a05:6a20:394d:b0:1f3:2c55:8d8a with SMTP id adf61e73a8af0-20cde952da6mr1047551637.12.1746142252156;
        Thu, 01 May 2025 16:30:52 -0700 (PDT)
Received: from [192.168.68.51] ([180.233.125.65])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b1fa82422e0sm228551a12.13.2025.05.01.16.30.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 May 2025 16:30:51 -0700 (PDT)
Message-ID: <6799bc5f-cc4a-446e-b47b-1cbabbc0b518@redhat.com>
Date: Fri, 2 May 2025 09:30:42 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 39/43] arm64: RME: Provide register list for
 unfinalized RME RECs
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
References: <20250416134208.383984-1-steven.price@arm.com>
 <20250416134208.383984-40-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250416134208.383984-40-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PiiwQ0qszp4BY6ee228wuJVsUAZYHvS5Ti6VVhJ0sSI_1746142252
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250501_163057_730257_50ED376F 
X-CRM114-Status: GOOD (  24.99  )
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

On 4/16/25 11:42 PM, Steven Price wrote:
> From: Jean-Philippe Brucker <jean-philippe@linaro.org>
> 
> KVM_GET_REG_LIST should not be called before SVE is finalized. The ioctl
> handler currently returns -EPERM in this case. But because it uses
> kvm_arm_vcpu_is_finalized(), it now also rejects the call for
> unfinalized REC even though finalizing the REC can only be done late,
> after Realm descriptor creation.
> 
> Move the check to copy_sve_reg_indices(). One adverse side effect of
> this change is that a KVM_GET_REG_LIST call that only probes for the
> array size will now succeed even if SVE is not finalized, but that seems
> harmless since the following KVM_GET_REG_LIST with the full array will
> fail.
> 
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/kvm/arm.c   | 4 ----
>   arch/arm64/kvm/guest.c | 9 +++------
>   2 files changed, 3 insertions(+), 10 deletions(-)
> 

With below comment addressed.

Reviewed-by: Gavin Shan <gshan@redhat.com>

> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 4780e3af1bb9..eaa60ba6d97b 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -1832,10 +1832,6 @@ long kvm_arch_vcpu_ioctl(struct file *filp,
>   		if (unlikely(!kvm_vcpu_initialized(vcpu)))
>   			break;
>   
> -		r = -EPERM;
> -		if (!kvm_arm_vcpu_is_finalized(vcpu))
> -			break;
> -
>   		r = -EFAULT;
>   		if (copy_from_user(&reg_list, user_list, sizeof(reg_list)))
>   			break;
> diff --git a/arch/arm64/kvm/guest.c b/arch/arm64/kvm/guest.c
> index dd379aba31bb..1288920fc73d 100644
> --- a/arch/arm64/kvm/guest.c
> +++ b/arch/arm64/kvm/guest.c
> @@ -671,12 +671,9 @@ static unsigned long num_sve_regs(const struct kvm_vcpu *vcpu)
>   {
>   	const unsigned int slices = vcpu_sve_slices(vcpu);
>   
> -	if (!vcpu_has_sve(vcpu))
> +	if (!vcpu_has_sve(vcpu) || !kvm_arm_vcpu_sve_finalized(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> -
>   	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
>   		+ 1; /* KVM_REG_ARM64_SVE_VLS */
>   }

KVM_REG_ARM64_SVE_VLS is exposed even SVE isn't finalized. See set_sve_vls() where
it's required that SVE isn't finalized, or -EPERM is returned. So this would be
something like below:

	if (!vcpu_has_sve(vcpu))
		return 0;

	if (!kvm_arm_vcpu_sve_finalized(vcpu))
		return 1;	/* KVM_REG_ARM64_SVE_VLS */

	return slices * (SVE_NUM_PREGS + SVE_NUM_ZREGS + 1 /* FFR */)
		+ 1; /* KVM_REG_ARM64_SVE_VLS */

> @@ -692,8 +689,8 @@ static int copy_sve_reg_indices(const struct kvm_vcpu *vcpu,
>   	if (!vcpu_has_sve(vcpu))
>   		return 0;
>   
> -	/* Policed by KVM_GET_REG_LIST: */
> -	WARN_ON(!kvm_arm_vcpu_sve_finalized(vcpu));
> +	if (!kvm_arm_vcpu_sve_finalized(vcpu))
> +		return -EPERM;
>   
>   	/*
>   	 * Enumerate this first, so that userspace can save/restore in

Since KVM_REG_ARM64_SVE_VLS can be exposed before the vCPU is finalized, it'd better to
move the check after the followup block where KVM_REG_ARM64_SVE_VLS index is copied
to user space.

	/*
          * Enumerate this first, so that userspace can save/restore in
          * the order reported by KVM_GET_REG_LIST:
          */
         reg = KVM_REG_ARM64_SVE_VLS;
         if (put_user(reg, uindices++))
                 return -EFAULT;
         ++num_regs;

	if (!kvm_arm_vcpu_sve_finalized(vcpu))
		return num_regs;

Thanks,
Gavin
	


