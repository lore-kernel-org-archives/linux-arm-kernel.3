Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35DA0C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 14:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0HTz7i0csHEzPxGHorQVXPbwITXujz+YYUQK1Bj5/w=; b=2ND6L1cJrE+8B1yPloeJmEAld/
	tuAF4K5N8ws5jgsukImgSdHci31JIlBqj10+9sdWZ6MHjBDaMbI8o71HcMYTdHUZdEEQ+jJunhIl6
	ocblqUJslUh1YXBXf38KOxAHK1Et+/DhA827+bdVs8zxS+/QM0lCeHBvQgVPOegwjlvvxaLSNvVku
	pYUo96IOduYCQPZZ1qVSWlhXpsHR28b3gAaLAa64Nk6bfciOXEx3F9H51VMhcGzRVje2wBp68B602
	HJgWmiLhNVp4zy/Kcxma+548Nwtauwsww+dIGeAPcpGmJ92wIF6YiueNJIKOSdc2WR7mXSWe2/b9L
	NliNRHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Zw-00000005hsq-34wO;
	Tue, 22 Sep 2026 14:34:40 +0000
Received: from mail-lf2-x11.google.com ([2a00:1450:4864:36::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x91Zn-00000005hml-3Y5G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 14:34:33 +0000
Received: by mail-lf2-x11.google.com with SMTP id 2adb3069b0e04-5b5e4f13d76so4588620e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 07:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790087668; x=1790692468; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0HTz7i0csHEzPxGHorQVXPbwITXujz+YYUQK1Bj5/w=;
        b=MmoYbiD3Ojnnbi54BlP4QcZFvhiJq4VPiZQ+v9lDZAGH5D6Ti5nGuLKZMxQ0HOTCAT
         WvqrWlqT7cPgoQWpc7EZJtgxl+eumPJr5ivXFEKZdpAi/XNu49TjUXODQ6MUlEEeAaqE
         aB/G8bB7ro1a5Swsr061X1co3wi+bFVPRSVqfDl1rsdhVl478hzLxruPCC39CKb5yF4x
         zC4mGHUPkhCaR3xIq2YV9msQbijzDJmU5Zmi3sX1lIj+AnEznVA6vE1JV1ejLZXGwGkI
         ng3RthnTVgxAeGBtnwWqZp1y9fizekJNfRf1R/DWo4yg+bbx2b1EhzBd4AM1ZxIdjHJe
         NxYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790087668; x=1790692468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0HTz7i0csHEzPxGHorQVXPbwITXujz+YYUQK1Bj5/w=;
        b=u1w8rQQwbKyDgdfpUf5/P1JTyA9XavIo4kbq450Py17XO5iVv4yN3cIpfzyW72OOMm
         OGkD5Uru9Kxbvu267dvyg7d8MBmoqBkjIBzGdeB52BJAnmbYn3FiwY0ViCxXW4LuERSu
         GfJEsnmgjKQ0l1jrU63dUv7pyvnuA1bAR7ejlVY+Mb8PBN3DlZm06GUOSEQdMcOqXgeX
         36W2/v36I2v1FtE7lq+PiYjwqF7nSh51guo4r5qYNBYNU0SwC2aHExoyfxd9jT5rlT3e
         kXfrEEHYs7DPz1zW0G5KudD+KL5/v7iaRw0XiBPLD1weHaJhIMhEFE1V03SsSyH+Z8D+
         AE3g==
X-Forwarded-Encrypted: i=1; AKwUvByWAoOy8kGqNfhVz6cIirSS6BJbmpFfFIrerXYjK3nCkzXLgUHbpEJSfcPAEJrPyVAABS/gt2XKOv6YEAzyzRfa@lists.infradead.org
X-Gm-Message-State: AFuF++lVZrhJwH3QIaGf44YuHTclg/Qi5BnCPiVqQgoQ9+dw/OuUnxbk
	XhuQav0+luHLmsXC3rYFF5OXvANvPNNzOELigNg65h/P8FdyCI0EfH11gpj7IgwsxQ==
X-Gm-Gg: AYBFou1MHHUMJRBbzXY5yyS1CyLeTuKhahMNSSiwxWZ7MXweskw/6xE1IcdtKfOf9Io
	s2XCjc7lYVQc2oXAPnhVl94rBSYf+8ZKQTj/VtS3sSzGz2P4wDG5MkNMawTYank+TWIpf2JeFs4
	KbcWoNldYAkcB35PoedMy090TUhKgfSNwyIAA5TY2FM7n0/eXGqllwtYQF/Yc2DZfcmoQ8NZgd3
	CTelgrC5qr9pQWSpA9UzMgAReNWc0B+tmx+n91KzdB1WOqpI6yihbZU3y2KOWzXR1NzV/2e1FTS
	qfnyJC8uEKtZKUdgsK/3Ij08dBKmEEU5p5PLllXCsfftx7hQaB2UBM1UHgS6GyBY4KjuxsK4vNv
	ScMiLgW9wIHZ2oXvg6w/bS6HZ7vHcEmW7rx5RV9nq+psd4jelOsOGB+U5f/3i4WvbBoPtxJpOfE
	XGl+7+VsrTVJglrgsvrkIrFGg4xDaYf0MMVie6IZSFN0jdACHKtdSbGaE+T73UoJ0hUmxpNT+lB
	wqnCSbUuLNllyM8z7ywii4BbPLt4THlRrHAhmWo6y5Nsu3Vyui/PQ==
X-Received: by 2002:a05:6512:3e1b:b0:5b6:1a7c:21 with SMTP id 2adb3069b0e04-5b8c184e320mr4889993e87.36.1790087667742;
        Tue, 22 Sep 2026 07:34:27 -0700 (PDT)
Received: from google.com (135.91.155.104.bc.googleusercontent.com. [104.155.91.135])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b8d46e871dsm604660e87.60.2026.09.22.07.34.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 07:34:27 -0700 (PDT)
Date: Tue, 22 Sep 2026 15:34:22 +0100
From: Vincent Donnefort <vdonnefort@google.com>
To: Fuad Tabba <fuad.tabba@linux.dev>
Cc: maz@kernel.org, oupton@kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, joey.gouly@arm.com,
	seiden@linux.ibm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com,
	mark.rutland@arm.com, steven.price@arm.com, qperret@google.com,
	tabba@google.com
Subject: Re: [PATCH v3 04/18] KVM: arm64: Disable steal time for protected VMs
Message-ID: <arKR7gJaeCpWqA5j@google.com>
References: <20260914113338.159227-1-fuad.tabba@linux.dev>
 <20260914113338.159227-5-fuad.tabba@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914113338.159227-5-fuad.tabba@linux.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_073431_916726_5E8CAB7A 
X-CRM114-Status: GOOD (  21.77  )
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

On Mon, Sep 14, 2026 at 12:33:24PM +0100, Fuad Tabba wrote:
> pKVM doesn't support steal time for protected guests, and
> KVM_CAP_STEAL_TIME already reads 0 for them on the VM file descriptor,
> but kvm_arm_pvtime_supported() doesn't know the VM, so the host still
> accepts the KVM_ARM_VCPU_PVTIME_CTRL attribute, whose IPA would point
> kvm_update_stolen_time() at the guest's private memory on every vCPU
> load. Pass the VM in and return false for a protected one, so the
> attribute returns -ENXIO as it does where steal time isn't implemented.
> 
> Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>

Reviewed-by: Vincent Donnefort <vdonnefort@google.com>

> ---
>  arch/arm64/include/asm/kvm_host.h |  2 +-
>  arch/arm64/kvm/arm.c              |  2 +-
>  arch/arm64/kvm/pvtime.c           | 10 +++++-----
>  3 files changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 27fe0cd5b2d7a..286489a69dff5 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1346,7 +1346,7 @@ long kvm_hypercall_pv_features(struct kvm_vcpu *vcpu);
>  gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu);
>  void kvm_update_stolen_time(struct kvm_vcpu *vcpu);
>  
> -bool kvm_arm_pvtime_supported(void);
> +bool kvm_arm_pvtime_supported(struct kvm *kvm);
>  int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
>  			    struct kvm_device_attr *attr);
>  int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 8b080804bc90b..db36815630790 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -447,7 +447,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>  		r = system_supports_mte();
>  		break;
>  	case KVM_CAP_STEAL_TIME:
> -		r = kvm_arm_pvtime_supported();
> +		r = kvm_arm_pvtime_supported(kvm);
>  		break;
>  	case KVM_CAP_ARM_EL1_32BIT:
>  		r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
> diff --git a/arch/arm64/kvm/pvtime.c b/arch/arm64/kvm/pvtime.c
> index 4ceabaa4c30bd..053fe831fa541 100644
> --- a/arch/arm64/kvm/pvtime.c
> +++ b/arch/arm64/kvm/pvtime.c
> @@ -67,9 +67,9 @@ gpa_t kvm_init_stolen_time(struct kvm_vcpu *vcpu)
>  	return base;
>  }
>  
> -bool kvm_arm_pvtime_supported(void)
> +bool kvm_arm_pvtime_supported(struct kvm *kvm)
>  {
> -	return !!sched_info_on();
> +	return !!sched_info_on() && (!kvm || !kvm_vm_is_protected(kvm));
>  }
>  
>  int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
> @@ -81,7 +81,7 @@ int kvm_arm_pvtime_set_attr(struct kvm_vcpu *vcpu,
>  	int ret = 0;
>  	int idx;
>  
> -	if (!kvm_arm_pvtime_supported() ||
> +	if (!kvm_arm_pvtime_supported(kvm) ||
>  	    attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>  		return -ENXIO;
>  
> @@ -110,7 +110,7 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
>  	u64 __user *user = (u64 __user *)attr->addr;
>  	u64 ipa;
>  
> -	if (!kvm_arm_pvtime_supported() ||
> +	if (!kvm_arm_pvtime_supported(vcpu->kvm) ||
>  	    attr->attr != KVM_ARM_VCPU_PVTIME_IPA)
>  		return -ENXIO;
>  
> @@ -126,7 +126,7 @@ int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
>  {
>  	switch (attr->attr) {
>  	case KVM_ARM_VCPU_PVTIME_IPA:
> -		if (kvm_arm_pvtime_supported())
> +		if (kvm_arm_pvtime_supported(vcpu->kvm))
>  			return 0;
>  	}
>  	return -ENXIO;
> -- 
> 2.39.5
> 

-- 
Vincent

