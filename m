Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0EF2C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 06:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEUnRTvQ08kI5I5Akg5OcMZWx7icrdrdgfCIPtytf6Y=; b=2wC4MfSIuT56jUIGP7j55Fp8Oh
	GpNi8mkuOs2mXJlAji3MdhY/W0GELqtJuVAyvVUmueX6q9U7/oKRLW8MZAH57XBaaFZwR9H8obdzv
	rFkvHqlD/fRhyor9CRDM0n6AHcIoE/QYVVYliQ9YQ1vAkP0CHxY1RylcixxPOeJ0NBX5+r/v7eqMP
	wOGd7L61GjwDpAtuMypjj22OJD7F9bn1khRARcGvJbIRuJ9ddzKZ6fLZiVZctYOG7G/MiMfuMfQWX
	T8XUJRvLeLUpysfonkZiOXj+Yb31ly5dORX43oiKOrex7WI8bjB6CL+xRTtpmTz6VTxvxff8XQQtq
	3dNBcbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiSOH-00000008SpL-1jLk;
	Sun, 03 Aug 2025 06:40:17 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiRuw-00000008Qmd-44pY
	for linux-arm-kernel@lists.infradead.org;
	Sun, 03 Aug 2025 06:10:00 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-76bc5e68d96so2640048b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 02 Aug 2025 23:09:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=csie.ntu.edu.tw; s=google; t=1754201397; x=1754806197; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vEUnRTvQ08kI5I5Akg5OcMZWx7icrdrdgfCIPtytf6Y=;
        b=Sz53OdSur3ZDmPOlJjsI6RXEQjV61p4FaYZ/DZsCXBUtpgQTWBPpskFDNwkJ1ts2TJ
         R+WTimvYz9pUWTUfCJ6EiAtPCheCvzYkpQKf4DCtHEvVdeF/ykU/12PeCfJZgN01AGuM
         iCwaXg0O+cK1oqFNnE9mGcsBecqNJyrXeGZQslDADtWFgGsoXQAnVeatzOBW+WE7+5dt
         YTn2OavTHoIjRWBARRLhb3x5ROj2+FTV7PRgJLYmlP6PC4Hen9GkQJdebiYIRyLoXf7b
         YVk2EFXab6CmbWwLgEyD0aodSfV38CI/ra3Vp32fIt3ePnvLNkFA2tIlFgZ8dH+gI8CJ
         qcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754201397; x=1754806197;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vEUnRTvQ08kI5I5Akg5OcMZWx7icrdrdgfCIPtytf6Y=;
        b=AZtO0FZpskIuNgymc0MVgnuXK+QybmGYXe9UifOV5BioLxEtlw6rlbfOdAWzBUzbao
         +sn9dvu9KYN45tUgtCB8gh+xSqTNqewn2ugaOQ0LogmKV3/d0+Ro9B15Oz8Dn5QFdjsA
         N7iZxo8FekF4hdt5y/hcRUgkr64nD3djgHitLBr80GCgxeEZe36RV5SCaDFsnJvHDKTY
         T/wgo8WhpQMErZQ8lNLvEm2pTioqJ/SGR9KhEC3Zl7qIoDy+UqzHlXgSJaCTWa/2GI0a
         Mh02d34loSEtzay8W+rj0hbVO4r+S6fXDrhGbtLZF03OqDQljzeG6rqsn50gSi0BENue
         jEqw==
X-Forwarded-Encrypted: i=1; AJvYcCXTqU4DezouHp7rPTnGgttP+Ss1ak/bQD+kRZFupL649Ma2GOqYo37XJ8OFXKIHNGs6IhvryJJAeBnEQ9hHtmqH@lists.infradead.org
X-Gm-Message-State: AOJu0YypUQXYrwu1kgZ7ICZcYop1bubjwOLcCZd3x7OlnrAw3WivfY6r
	I0x4g8nK7T3khPp++AdiSB57DjjV6W4FpBFjQROsqXTEm9QGvpKdP/ZBhNNiyc+XHMVEHkMzFce
	K7ClTEbJwOBJl77R++GP//rWn2diTyfJgSoMORSySAmdAn7mfYR8Zv/C1EtOUWE/c5tTbvw==
X-Gm-Gg: ASbGncuGDTPDZ5bEynBmmXvHxsrpNLy/6nio0AoeJA3Y8RlKGLnpvczjDPZi1gDwLw8
	FFFupAm6yVmoKB8dHM5Ibclhm0tzDfDCGcb5K5R0fHFGop7BUT71tUWB1uSGFNMD2nRHLcT4/id
	7hGS5Y/4E8SfrqW8UY4Qvy4hYV6/Tw/lhz6tLH1gus5EkMyFMLVLmR+XqtFL8t1/CiD5ZwQzisH
	g8JZmNa6/A8UByOm8biEgfw/fjDyc3ngjnvxRHGRVXsNTtU/G0QrWXispDHTjWIr+565h5jBihX
	cGlteuKq0mDx8S9UIR0PnDaAGNL9cnuW8b3rKlHyYdGj/dfNnQFfR5yOpDudlesZtLoMAlIS87r
	+9THwpf/5G/dj+80spUUal+TdyXW9NUMq4fqAfTSuv+B1K5Auf2Yslr3tJAH3j24NVikMd1w=
X-Google-Smtp-Source: AGHT+IFX2BKlJOxqOQLOCKoNLPbIsC/9RtXyDmT1nriD6O07Iw2g1QDl1QbnMj8/V1anMVtcYFA7gA==
X-Received: by 2002:a05:6a20:244a:b0:240:4d5:8fe1 with SMTP id adf61e73a8af0-24004d59411mr232493637.12.1754201397049;
        Sat, 02 Aug 2025 23:09:57 -0700 (PDT)
Received: from zenbook (1-162-100-196.dynamic-ip.hinet.net. [1.162.100.196])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b42306f1de3sm6304516a12.62.2025.08.02.23.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Aug 2025 23:09:56 -0700 (PDT)
Date: Sun, 3 Aug 2025 14:10:44 +0800
From: Wei-Lin Chang <r09922117@csie.ntu.edu.tw>
To: Fuad Tabba <tabba@google.com>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Cc: maz@kernel.org, oliver.upton@linux.dev, will@kernel.org, 
	mark.rutland@arm.com, joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, vdonnefort@google.com, qperret@google.com, 
	sebastianene@google.com, keirf@google.com, smostafa@google.com
Subject: Re: [PATCH v1 1/8] KVM: arm64: Rename pkvm.enabled to
 pkvm.is_protected
Message-ID: <szsqsx77mjo4kdawzcboud4eawuvz3sye4grmx5n74qzze26ap@xbfwc44ruetx>
References: <20250729120014.2799359-1-tabba@google.com>
 <20250729120014.2799359-2-tabba@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250729120014.2799359-2-tabba@google.com>
X-Gm-Spam: 0
X-Gm-Phishy: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250802_230959_298143_654483FD 
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

Hi Fuad,

I am reading some pKVM code and would like to ask for help on some
questions to make sure my understanding is correct:

While looking at the code I don't see pkvm.enabled, or now
pkvm.is_protected really assigned, is pkvm development going to add the
ability to let the user pick whether they want to start a protected VM
(host EL1 can't access VM memory and registers, mostly) or not (like
nVHE mode VMs) in the future?

Also, since when running pKVM (kvm-arm.mode=protected) the user can't
yet choose the VM to be protected or not, the current state is that all
VMs started by pKVM is protected, is that understanding correct?

Sorry if I missed anything.

Thanks,
Wei-Lin Chang

On Tue, Jul 29, 2025 at 01:00:06PM +0100, Fuad Tabba wrote:
> The 'pkvm.enabled' field in struct kvm_protected_vm is confusingly named.
> Its purpose is to indicate whether a VM is a pKVM protected VM, not
> whether the VM itself is enabled or running.
> 
> For a non-protected VM, the VM can be fully active, yet this field would
> be false. This ambiguity can lead to incorrect assumptions about the VM's
> operational state and makes the code harder to reason about.
> 
> Rename the field to 'is_protected' to make it unambiguous that the flag
> tracks the protected status of the VM.
> 
> No functional change intended.
> 
> Signed-off-by: Fuad Tabba <tabba@google.com>
> ---
>  arch/arm64/include/asm/kvm_host.h | 4 ++--
>  arch/arm64/kvm/hyp/nvhe/pkvm.c    | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 3e41a880b062..55dc7cd83e40 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -252,7 +252,7 @@ struct kvm_protected_vm {
>  	pkvm_handle_t handle;
>  	struct kvm_hyp_memcache teardown_mc;
>  	struct kvm_hyp_memcache stage2_teardown_mc;
> -	bool enabled;
> +	bool is_protected;
>  };
>  
>  struct kvm_mpidr_data {
> @@ -1522,7 +1522,7 @@ struct kvm *kvm_arch_alloc_vm(void);
>  
>  #define __KVM_HAVE_ARCH_FLUSH_REMOTE_TLBS_RANGE
>  
> -#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.enabled)
> +#define kvm_vm_is_protected(kvm)	(is_protected_kvm_enabled() && (kvm)->arch.pkvm.is_protected)
>  
>  #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>  
> diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> index 338505cb0171..6198c1d27b5b 100644
> --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> @@ -406,7 +406,7 @@ static void init_pkvm_hyp_vm(struct kvm *host_kvm, struct pkvm_hyp_vm *hyp_vm,
>  	hyp_vm->host_kvm = host_kvm;
>  	hyp_vm->kvm.created_vcpus = nr_vcpus;
>  	hyp_vm->kvm.arch.mmu.vtcr = host_mmu.arch.mmu.vtcr;
> -	hyp_vm->kvm.arch.pkvm.enabled = READ_ONCE(host_kvm->arch.pkvm.enabled);
> +	hyp_vm->kvm.arch.pkvm.is_protected = READ_ONCE(host_kvm->arch.pkvm.is_protected);
>  	hyp_vm->kvm.arch.flags = 0;
>  	pkvm_init_features_from_host(hyp_vm, host_kvm);
>  }
> -- 
> 2.50.1.487.gc89ff58d15-goog
> 

