Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D76C6E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B95bOgoo9xr1fzCcAj11xs8eX1WhbVvkY5/fLcOASRk=; b=krrSFcium3zRQvhR9C4TobxJGo
	Fq8FLY6H+qgFI6pJUenYgrZeInDJ0cDz8CGKNqSVa2kW0lcU5JIo84wEcc00ppHh92YoQHUTH8A2r
	c75VEDLKLIpelNAwnp6M4F51uFN30Ys1PMt7xFnm7orT5Of8ww11ywgOoscOQtpOTYdEebxwQYBo+
	XEFpGwRUnahlhNyFzGRgy2jo1vMWgICpcQCxQJA7b765q9Y0GYPvcbqZOeis7lRwt2L5tHF39W8lH
	H21ctBtfChcybAWXDRe2oxeLGBO5P+d2ZR1heCh5PtFEHarYoCoIZIVtyE/lAbqd+5v9vHIHl/6PE
	vYeRbt0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbrb-00000002IIw-2d2b;
	Fri, 06 Dec 2024 17:11:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJbqa-00000002IG4-0LLh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 17:10:33 +0000
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-5cf6f804233so2760638a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Dec 2024 09:10:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733505030; x=1734109830; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=B95bOgoo9xr1fzCcAj11xs8eX1WhbVvkY5/fLcOASRk=;
        b=0+8DI1A9MSJqQehR80Klz3jlg3f8YISeD8aQZgBV+93yjJBNlR95X6J8SYrMCghA46
         NU+GEMEBAp70oRGStRkyl9V57td5smKkZDzL2PCk+Ey7k3D1QhGsf512TvXVkxb3Nzm4
         2G2Ldg9gILLXkqL6zVuHI49LUDNiw0je29bJeXN4293rVC4+fCIdQxxXLSdzOMi/QZsh
         +nEOVJLBJB8Mj6OCcFF9BpJ0f4+rlY0EuWLI/wKT45aCa6HjHcLas/snKGvcjD+CGTkr
         pqgIbhw1hrZaB4MmkMvEhVxPYECX+8x2MYeM0vYazFW7xDAhBIRub7s+4QS5BXSVS5TY
         62Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733505030; x=1734109830;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B95bOgoo9xr1fzCcAj11xs8eX1WhbVvkY5/fLcOASRk=;
        b=UD3dKClE9LwVRbgzOb2R55fUMmX9q2l5s+MfoSiHTcISguGijiEJnZ/snXCqVbaZvx
         KWvIWmPrgmGay+c1qb6q43lo/07b00t0VADGG3jxSVkGwx4P+s6A516sKKaN3sem9xZs
         bfAt/0cCqae8LWNYf8mjNs5u501+9LFSZ6cb4vj9OQ+gGqFEWfrR05FLfqSbMHHfQs4z
         xZE972LFAJmnVz8j84Ygae4X3O8OF7jEFli0+4oStM56bHOUN8aUuzEEO3ysX/GE4oOS
         h4Tl6IdY6gppklqsfE4zIxiC4e3PaRRoiTz/HRccc/T8tVO7BcNiNFpdHNR4gw9t8iw0
         eNvg==
X-Forwarded-Encrypted: i=1; AJvYcCUAe8yGisdLtcRvYNHA1wvWeSyg/7R/mb3ual/kgjxzzS8/zl5wmkgzGB3kfAui+lLT+cqKKg02MwLJdEgsAEyk@lists.infradead.org
X-Gm-Message-State: AOJu0YzYlhJguPsFvnqUTu3kpg0s5H3ReURc0oVTpp8LEV35Yhpsh3Qm
	vXN6oSv4uf6wQFsfgcXZil0nSs/cmSMyxWgrb7RGvIsq4Tgh2gWo+qHfkv+EXQ==
X-Gm-Gg: ASbGnctEJBVYhfPSCllffAOA1nrU6ZcsaedBcci3lLDDqYn3YhkKHCGmWav5vnQtMMA
	vx0YsWCscj4BtqN4bAg/7ASP0D1+94sedRGJuuQkVxC11456wdwrRr5kaswSsjDSdKhSTdCgemC
	6ZVnaJ7/izja1FiLJhgGTUYZNXxcds0C+PmSx+EVAl7gTzatfd0sxDHVuGA1R270GeYR5oBFI49
	dWdKwgcdGOWQJLTjkHREFb3dG8SFfu1vNHUxHHDEl7hixBVlP/d0QyJM0TBDZ0mDzP6W9M0y0Y/
	444ZA9y+
X-Google-Smtp-Source: AGHT+IGnuHB5ICLuzG6mtiwbXrV3pRKWr5Ln6X/XDkBvgaGXRwlNrtHngS7/Y9V4qXxe1GWH1CS/Bg==
X-Received: by 2002:a17:906:1ba1:b0:aa6:4a5b:b72d with SMTP id a640c23a62f3a-aa64a5bb77emr36267466b.23.1733505028919;
        Fri, 06 Dec 2024 09:10:28 -0800 (PST)
Received: from google.com (61.134.90.34.bc.googleusercontent.com. [34.90.134.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa625e58dbcsm264604666b.15.2024.12.06.09.10.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 09:10:28 -0800 (PST)
Date: Fri, 6 Dec 2024 17:10:26 +0000
From: Quentin Perret <qperret@google.com>
To: Fuad Tabba <tabba@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org,
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org,
	kristina.martsenko@arm.com
Subject: Re: [PATCH v4 04/14] KVM: arm64: Use KVM extension checks for
 allowed protected VM capabilities
Message-ID: <Z1MwAomiLhnMn--k@google.com>
References: <20241202154742.3611749-1-tabba@google.com>
 <20241202154742.3611749-5-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202154742.3611749-5-tabba@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_091032_119250_8D871DEC 
X-CRM114-Status: GOOD (  13.34  )
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

On Monday 02 Dec 2024 at 15:47:31 (+0000), Fuad Tabba wrote:
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index fb733b36c6c1..59ff6aac514c 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -329,34 +329,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
>  
>  	bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
>  
> -	/*
> -	 * For protected VMs, always allow:
> -	 * - CPU starting in poweroff state
> -	 * - PSCI v0.2
> -	 */
> -	set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);

For my understanding, why do we drop this bit?

>  	set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
>  
> -	/*
> -	 * Check if remaining features are allowed:
> -	 * - Performance Monitoring
> -	 * - Scalable Vectors
> -	 * - Pointer Authentication
> -	 */
> -	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), PVM_ID_AA64DFR0_ALLOW))
> +	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PMU_V3))
>  		set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
>  
> -	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), PVM_ID_AA64PFR0_ALLOW))
> -		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
> -
> -	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), PVM_ID_AA64ISAR1_ALLOW) &&
> -	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), PVM_ID_AA64ISAR1_ALLOW))
> +	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_ADDRESS))
>  		set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
>  
> -	if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI), PVM_ID_AA64ISAR1_ALLOW) &&
> -	    FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPA), PVM_ID_AA64ISAR1_ALLOW))
> +	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_GENERIC))
>  		set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
>  
> +	if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SVE))
> +		set_bit(KVM_ARM_VCPU_SVE, allowed_features);
> +
>  	bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
>  		   allowed_features, KVM_VCPU_MAX_FEATURES);
>  }
> -- 
> 2.47.0.338.g60cca15819-goog
> 

