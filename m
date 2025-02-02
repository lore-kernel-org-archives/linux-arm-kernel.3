Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0557DC02190
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Feb 2025 06:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjlJ37q+gVBxHg8p/iKgIH4lKOr26qVR6N2QdXuX3CE=; b=zoegN4n5u8xFCnGPnLqnSeWCVN
	d+jnAzd70uEGa3W4ttMROpttRfJ/sLsbT09D4RnZx0fN22zy6W6yNRRitKHgm2I+NlqQfjLhIxf1S
	Rvm4UaStbf2H3UjXtkYRuDFsz/y7Bs1O1XD48t2RE7hyVnCoxVHHt8VzLsTWoJR2rYnEb+uhDVah/
	rLo0sB8756OVVl+ctSx96h1hDBmhwODfMPu/DIx+u5UK721K/8E5vVAA/M/Istuxljr7cG78NbW0S
	Xo1HtT1KYdSFM6drPz2B9nA12vmVWx2M09l+iBu3v5YczGhtJC2F+R/lEjvw1oli25c5qzb2trl91
	UENZEdeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1teT3V-0000000DPnk-3fI6;
	Sun, 02 Feb 2025 06:02:05 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teT2A-0000000DPiJ-1t8V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Feb 2025 06:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738476040;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YjlJ37q+gVBxHg8p/iKgIH4lKOr26qVR6N2QdXuX3CE=;
	b=gdyZsOl0TibpCENSXUvm/n4Fs+YsnYzTCEGBC/9MErTw/UjxcJohhvdBTLU+FreWlFjXqm
	bRDtdG1YwZjOfoAx/cRW9Y1QhjK1H7xIPNZ6yP0zkASO7wY413cyMNlYDIFrJFbR6tp4VD
	ysnA/OJYXxYYjYka6wLbC2LtN0GAT/U=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-275-7vYYjv3mOXqP7la4NMllmA-1; Sun, 02 Feb 2025 01:00:36 -0500
X-MC-Unique: 7vYYjv3mOXqP7la4NMllmA-1
X-Mimecast-MFC-AGG-ID: 7vYYjv3mOXqP7la4NMllmA
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2162259a5dcso109154735ad.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 01 Feb 2025 22:00:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738476035; x=1739080835;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YjlJ37q+gVBxHg8p/iKgIH4lKOr26qVR6N2QdXuX3CE=;
        b=OfsMSzCdIJwrRgJIDXDlYN2to/a7WKkeAyZDCf523VcAqsrG1D5cN1K3tIJgbWroPX
         Wob6eGpiI0qGac3YpTnsfCHgU5IW5vszPFYNrVffmw0t6bDkP8WNjQelIqcP2+EDy9/R
         1DbzyGC97zgwp/0w/VBU+j8UkGVKIVrnuq/Dw8Ru5JteAWgsoZVCOvwOyRsM1X2niov+
         VHA+bKKOeXmBztZeqfcyAyhnPqZHwvgeMmNvOqLbPEXSUCl4LGzcQzptlElw9FPDqWco
         CjqOFaV+WgNTfDsr0irjd6gN4pzC8Jw7rUxbxXCzrXmarIjSBDI5i2nIp6mVZe6BAoW6
         Rwgw==
X-Forwarded-Encrypted: i=1; AJvYcCWfdFt5mv9bDfcOkuvU7VrwZKlRhz7FOqMKDKrIZZuI8szKYcjhq3YOizt5LspZlLdYKyeP3ldjxAIWRmFviMY/@lists.infradead.org
X-Gm-Message-State: AOJu0YxwRnXbM5QXOy8HZLiLqrF+z7QLuhhvpZylnOSZzv21VH52hWRu
	BObfppGNjaUBHdk3DFps9+WUSW/NBwz+CE61R0poZYDh2lAaObR5uASiP9ho9pg0kQyhvMaeXZZ
	zoi+0wyZFEZlBrZxmwwzua2Y8cxiH8vuLgaDaQ6DK9pA0bdcsUMt4fCBcLOgVf+w9M/vZXKLD
X-Gm-Gg: ASbGnctqJp+wYoDqqp2lOO1Ay5lt+KzaOewVBrQI/tooXX5FLHuAlA60x3jRpK62LtU
	0L36Ql1FTxt6THyxnLOCzo13lP5k+Yoz6iZwiA/+4GFKNJaFDQdvc4y8XBI38ucNEsSaLzqV5+r
	Q1D7R0RG4TM0xJT6j7o7QpfnIXQb0F53cjFTiaWbdrKDebGiZUwtqWhUmHa5OZInea1KEdImBHf
	UjySlZWWUCTxJxsde/q3SWnPNNXDS3KarIqRZ8HGegihgVZm7fySJVl2T+dd1G9NgOgTsT4b7Z5
	sslg0A==
X-Received: by 2002:a17:903:2286:b0:216:2bd7:1c36 with SMTP id d9443c01a7336-21dd7c4c5fdmr262741525ad.1.1738476035650;
        Sat, 01 Feb 2025 22:00:35 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8sh+1yR6eIL3z2ruF+In49PMNICNRbXw6lt1qSpPO4OvbSNdtKO0P+Pt1zVlA9G23+OiuCw==
X-Received: by 2002:a17:903:2286:b0:216:2bd7:1c36 with SMTP id d9443c01a7336-21dd7c4c5fdmr262741275ad.1.1738476035348;
        Sat, 01 Feb 2025 22:00:35 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.64])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f8489adf7csm6566390a91.13.2025.02.01.22.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 01 Feb 2025 22:00:34 -0800 (PST)
Message-ID: <4cd1b360-6902-4800-93a2-905cfd8ca7f8@redhat.com>
Date: Sun, 2 Feb 2025 16:00:25 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 28/43] arm64: rme: Allow checking SVE on VM instance
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-29-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20241212155610.76522-29-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: k989gFNilg6iREPMQ5HQGGSxPek4-H5ObBuuW7anuy4_1738476036
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250201_220042_608644_37356707 
X-CRM114-Status: GOOD (  20.31  )
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
> From: Suzuki K Poulose <suzuki.poulose@arm.com>
> 
> Given we have different types of VMs supported, check the
> support for SVE for the given instance of the VM to accurately
> report the status.
> 
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
>   arch/arm64/include/asm/kvm_rme.h | 2 ++
>   arch/arm64/kvm/arm.c             | 5 ++++-
>   arch/arm64/kvm/rme.c             | 5 +++++
>   3 files changed, 11 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 90a4537ad38d..0d89ab1645c1 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -85,6 +85,8 @@ void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
>   u32 kvm_realm_vgic_nr_lr(void);
>   
> +bool kvm_rme_supports_sve(void);
> +
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>   int kvm_init_realm_vm(struct kvm *kvm);
>   void kvm_destroy_realm(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 134acb4ee26f..6f7f96ab781d 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -456,7 +456,10 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   		r = get_kvm_ipa_limit();
>   		break;
>   	case KVM_CAP_ARM_SVE:
> -		r = system_supports_sve();
> +		if (kvm_is_realm(kvm))
> +			r = kvm_rme_supports_sve();
> +		else
> +			r = system_supports_sve();
>   		break;

kvm_vm_ioctl_check_extension() can be called by ioctl(KVM_CHECK_EXTENSION) on the
file descriptor of '/dev/kvm'. kvm is NULL and kvm_is_realm() returns false in
this case.

kvm_dev_ioctl
   kvm_vm_ioctl_check_extension_generic  // kvm is NULL
     kvm_vm_ioctl_check_extension

>   	case KVM_CAP_ARM_PTRAUTH_ADDRESS:
>   	case KVM_CAP_ARM_PTRAUTH_GENERIC:
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 5831d379760a..27a479feb907 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -20,6 +20,11 @@ static bool rme_supports(unsigned long feature)
>   	return !!u64_get_bits(rmm_feat_reg0, feature);
>   }
>   
> +bool kvm_rme_supports_sve(void)
> +{
> +	return rme_supports(RMI_FEATURE_REGISTER_0_SVE_EN);
> +}
> +

If rme_supports() becomes a public helper, it can be directly used. In turn,
kvm_rme_supports_sve() can be dropped. RMI_FEATURE_REGISTER_0_SVE_EN is obvious
to indicate the corresponding feature.

>   static int rmi_check_version(void)
>   {
>   	struct arm_smccc_res res;

Thanks,
Gavin


