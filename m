Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F50AC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 06:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boHxbjq3P2vU0fO6UUb8Hfrkk8ida9vHUjKzaMq4o5k=; b=qgs1v/QrIOKFICvbTKE8ixy1E/
	fgX6nNY8STKy1tfDA+VK0N0+ov3hw7aqxLV5RqEJ0Ug/dUezWC5TOSMFtd6BxWjQRfGlZL7xijyEr
	q3foNrvpnnXQFHDtYl/M6YwdCikaMjQmmpaoF0NeFaJSb/IYWorwZdH5fEfM5wdU1REC0qbs0EqUL
	Nb7geFti8IRP0dspqMpyYvBktpiUbUSGZx8CP3txRr4GrfH2uL+YA0TzKJC2a2/x79kg7RnhuoHVC
	umHpMtQeDJcp3DEK4T60TfkibEWGWF5tMRsUjwNxpzKofryjDbqhqTyfTcll5Qmv2KOjypvjzBkzN
	osuickAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLMx-00000003B81-3btz;
	Tue, 04 Mar 2025 06:03:07 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpLLN-00000003Ayu-0KEB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 06:01:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741068087;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=boHxbjq3P2vU0fO6UUb8Hfrkk8ida9vHUjKzaMq4o5k=;
	b=EUkq5IZrpr5zksZERM3x9cinzGEG6HM1jFScNNS+UZiLGn/IUheC/YkvQrpfUKuoJBKRnj
	wuVDoShCm5cp/JJlMusxl6PV6N1LBtm6uyv5akkWGOqFrQd4TqmM4SLvDyBFCpIHoL3vBn
	6n+YTWNoWGSRc4lEmezlJoNwiiuBFaU=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-553-cEAfmPAbPMauOjXSwBzSDA-1; Tue, 04 Mar 2025 01:01:26 -0500
X-MC-Unique: cEAfmPAbPMauOjXSwBzSDA-1
X-Mimecast-MFC-AGG-ID: cEAfmPAbPMauOjXSwBzSDA_1741068085
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-22379c2e96aso23793495ad.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 22:01:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741068085; x=1741672885;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boHxbjq3P2vU0fO6UUb8Hfrkk8ida9vHUjKzaMq4o5k=;
        b=mMVskIIcTf49C5mrmpYCKod9SCud0J+mW7DgvEbjT1fpaFhNoWfC/VE14aTeKwvwIe
         /ztvHBi6WUC14b7z0LkmsteMmjd5djEM6GZbSSGsnuwhU92lounpwmTyglYwLbxFAFg9
         UM2z/mt17C8eRI21o5eOFHzcZ4STbvF3d4fa4HnN06v1YiMqPosTDmXVf7qS9wcKgAnR
         FT/5fbPf+nzUkn607WpZDIY/LQaDh8ZNRjq9RfDdg6nCbqv2jsXhJdlW4BLN5/aRZCE+
         4/bR1oPP5o9nVX/4AfIpWwF99WUkYtdW4rQW7N8BOp46fMovY5RM5lTVZNlvNqahwiqw
         tsVA==
X-Forwarded-Encrypted: i=1; AJvYcCUppXBSL4eOvyDlM4u3hP3Kl0lgKyE0ZI064dlzw+2KwUMFkZsggUaO9FmaosL8r9D2DfXjc5OmSj3Qld9r7b9F@lists.infradead.org
X-Gm-Message-State: AOJu0YwzEPXret+8tZxGNLBqootTQf8WPXqSnbCGBi/yup9lPwiK34DZ
	5TLY+gA0HJmt67RKgbcHdcFin0HShjYjuDBKtY2zzUBG0kGttaheqoD/mdXyiC0FnBdq1fsORp5
	2jPZPr5zCVkxA6bPMP0AxGwQyDnrULJMf2TzJ5m6+OQo7TL1s7Y8CALjMD/GksOYnVX1/nPfE
X-Gm-Gg: ASbGncv9DbmGiMMuSUOZU5RkFmnZeRE1EUCnr0TgoyWDGtaxP218B5piMqtpEQ849rc
	KfQTMOZjAYPAKkwPW70EyAk+W/UPQ6cwlvks8vKv+rF+xKm0JylLcc5xpAM/Ll5eohpEzalBj38
	V890d7pjhGfOLdp+VrAJWk0vPn4QyqgA5NOFUlly5dVpVW6QtYvLzsoL2rVucS3w2a++8uBjhvw
	gD9ryoYwbTZFlRLRi0J8imHB9DlBw/WtYbpYdL1uPU1xc7NQa+/uH0hbhBXmSZX2hYkbFrl5y1n
	jJuL9VV/JUtsuguO9A==
X-Received: by 2002:a17:902:d543:b0:210:f706:dc4b with SMTP id d9443c01a7336-22368f8901emr239972435ad.13.1741068085385;
        Mon, 03 Mar 2025 22:01:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHElCuS6yRgRylUHMYlinoo6CRmRHfyntq1vELw6NqviCnDfsX3HH8S1d66GYPIYgVFC5KeFg==
X-Received: by 2002:a17:902:d543:b0:210:f706:dc4b with SMTP id d9443c01a7336-22368f8901emr239972065ad.13.1741068085037;
        Mon, 03 Mar 2025 22:01:25 -0800 (PST)
Received: from [192.168.68.55] ([180.233.125.164])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504dc6desm87837665ad.168.2025.03.03.22.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Mar 2025 22:01:24 -0800 (PST)
Message-ID: <12b5ba41-4b1e-4876-9796-d1d6bb344015@redhat.com>
Date: Tue, 4 Mar 2025 16:01:16 +1000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 28/45] arm64: rme: support RSI_HOST_CALL
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Joey Gouly <joey.gouly@arm.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-29-steven.price@arm.com>
From: Gavin Shan <gshan@redhat.com>
In-Reply-To: <20250213161426.102987-29-steven.price@arm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ygD1faYaG2Q0cVUNxeLdHHtjrzUmxnp30v2R0WfuQR8_1741068085
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_220129_193729_10FC8D3A 
X-CRM114-Status: GOOD (  23.38  )
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
> From: Joey Gouly <joey.gouly@arm.com>
> 
> Forward RSI_HOST_CALLS to KVM's HVC handler.
> 
> Signed-off-by: Joey Gouly <joey.gouly@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes since v4:
>   * Setting GPRS is now done by kvm_rec_enter() rather than
>     rec_exit_host_call() (see previous patch - arm64: RME: Handle realm
>     enter/exit). This fixes a bug where the registers set by user space
>     were being ignored.
> ---
>   arch/arm64/kvm/rme-exit.c | 22 ++++++++++++++++++++++
>   1 file changed, 22 insertions(+)
> 
> diff --git a/arch/arm64/kvm/rme-exit.c b/arch/arm64/kvm/rme-exit.c
> index c785005f821f..4f7602aa3c6c 100644
> --- a/arch/arm64/kvm/rme-exit.c
> +++ b/arch/arm64/kvm/rme-exit.c
> @@ -107,6 +107,26 @@ static int rec_exit_ripas_change(struct kvm_vcpu *vcpu)
>   	return -EFAULT;
>   }
>   
> +static int rec_exit_host_call(struct kvm_vcpu *vcpu)
> +{
> +	int ret, i;
> +	struct realm_rec *rec = &vcpu->arch.rec;
> +
> +	vcpu->stat.hvc_exit_stat++;
> +
> +	for (i = 0; i < REC_RUN_GPRS; i++)
> +		vcpu_set_reg(vcpu, i, rec->run->exit.gprs[i]);
> +
> +	ret = kvm_smccc_call_handler(vcpu);
> +
> +	if (ret < 0) {
> +		vcpu_set_reg(vcpu, 0, ~0UL);
> +		ret = 1;
> +	}
> +
> +	return ret;
> +}
> +

I don't understand how a negative error can be returned from kvm_smccc_call_handler().
Besides, SMCCC_RET_NOT_SUPPORTED has been set to GPR[0 - 3] if the request can't be
supported. Why we need to set GPR[0] to ~0UL, which corresponds to SMCCC_RET_NOT_SUPPORTED
if I'm correct. I guess change log or a comment to explain the questions would be
nice.

>   static void update_arch_timer_irq_lines(struct kvm_vcpu *vcpu)
>   {
>   	struct realm_rec *rec = &vcpu->arch.rec;
> @@ -168,6 +188,8 @@ int handle_rec_exit(struct kvm_vcpu *vcpu, int rec_run_ret)
>   		return rec_exit_psci(vcpu);
>   	case RMI_EXIT_RIPAS_CHANGE:
>   		return rec_exit_ripas_change(vcpu);
> +	case RMI_EXIT_HOST_CALL:
> +		return rec_exit_host_call(vcpu);
>   	}
>   
>   	kvm_pr_unimpl("Unsupported exit reason: %u\n",

Thanks,
Gavin


