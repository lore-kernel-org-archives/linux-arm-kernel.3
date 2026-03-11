Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50CBC1049515
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 10:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yebJ9YCpziYLTqYnhDBgUOk6iV8F2gnjHE9IcQ+90M8=; b=sNU5uRVfNg8Ovv9XhEP0C26bx1
	EoF8feOwnP+4BsLw17PJChQ0xCwT2Kq5rhv7QvXk8muoHAXwWUlt4L657jRpIWl4gL8ueRjW3tqoT
	aHOReCTpc1CpZwbC5IiriCifgSUjSYzAiBqP2iB5cJrm66LZefaWImQPt+eqZe6hVy3TsALw54LJA
	IWiGIuJ+GEAmlCMhGphoZRmFEa5UD4N52Ccf/EwQpXRHHhNOoE0NnrOzzuqaRHnTG0tcLSN/kSQq1
	9WNoKOCYnvA3xjGQajOF03HVrOUsO6Up2TAHGQBrFqFI6lKeWGKPconHEWFCEfJ/6WYmNdfnXRYNL
	Y7gUw1Mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GlM-0000000BQ0U-3ROF;
	Wed, 11 Mar 2026 10:26:01 +0000
Received: from mail-qt1-x830.google.com ([2607:f8b0:4864:20::830])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GlK-0000000BQ00-1XHT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 10:25:59 +0000
Received: by mail-qt1-x830.google.com with SMTP id d75a77b69052e-509062d829dso414131cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 03:25:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773224757; cv=none;
        d=google.com; s=arc-20240605;
        b=Ii0raRHiWhTcCA6po3wiilgWfA/KqmDpTHm7PB98N9dvm3t0l1SWRnk2J31wtwrbKA
         tn1n7SLasKpLJTPi0G+wkpXZeALTjw4Yy4GkY2vb2BYdGNe78tZuETUIlYQ8DtaHEIq7
         154xWR5jfR638yFOeLNP6H0DZdyrm5ZTT4/35s6oiEPtrLih/bUhp4KN/diOLI2gwUEG
         2XQqdR5dzrvTxzUNB8JgbJSUgmBiRkD4sAiWjBy9dQzpU358wzVBqra12LU+846jlJxD
         BjLd7fma1IcPUD2s54P7cm/O5FNb+cmPkaMB8aPjgRafbXSljO4Kmj3a6nmnD3znyDqI
         i8LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=yebJ9YCpziYLTqYnhDBgUOk6iV8F2gnjHE9IcQ+90M8=;
        fh=d+BSClluqEyknIhu6tQMomFX9BsCDsiQocyaMcKNuTU=;
        b=SWsiS3j6WmHV0NsFu9b4ZsWEXGpQKFnakBCSW9/4oUx7bns+zEf+UPyCpooF2Hufpk
         ZB6FL3azVPSzXlD5/L1Q7cErDE1MIwYBydhJ3bTUHBLcoitAE4dnGvkzb6rsJJZoRjCJ
         +1JwYHlvtwLsPhaJD3bsVAWqGMEHbcFsarNOKQ00uC9SPmN48QRB85R18D/+U3F5NW+W
         aCXOQzQt6jnNP42L1zxPyiMqpBJE8a0bng5jByM1aQSqlSG37H+J5FxUY6tfq9crdBTO
         MeyFBnjStfNwyhrzegZ2Qqoz9U2wsDoefgsHzKS/OP3FZ8L2orNmezSIwkfPx7l3Dp0Q
         Rsqg==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1773224757; x=1773829557; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=yebJ9YCpziYLTqYnhDBgUOk6iV8F2gnjHE9IcQ+90M8=;
        b=x/s1UI0XFHWT0DzWSgGoO32kzWyUhRQhpDFLh6V04PtQ1Z40vXQG1fKLMuCevkBhuD
         o8/B/h+RQDeFCZZcpEOrLThvobjoUlrgIYaIXeiiz/eEp+34sXcNzohJGzxY30wd/wxD
         wM+yjbvfUyJD/EAeXR1qNSv/8rUZgnJyswaKXxRlGD78/XO6N3SFihlM51jTHUapG/zp
         iC460bWseXFp4S4HiBBw6K8DSqZIjRfXKBNGkku5WQ84N4Y1sw/kfc0U4cDmXaY3kMN5
         4dLb6bVkht8yPTZDM+hm8Fg3N7UVS7fxupf7bZf/ihHmTxGzuszUpr4YIm6+MbpzbW1R
         n2vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773224757; x=1773829557;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yebJ9YCpziYLTqYnhDBgUOk6iV8F2gnjHE9IcQ+90M8=;
        b=VOHfcEOlAPj3eISlGZnJeGH2sVTQjAcVFa/4LzrCXkg1hv8hn5wMfpendYx3r3AdJo
         mEE3PYzLiuPKA7SG9qOz1QkFNnwNg8n3CMiG+PA7SpoqDqy2yf98QobOic+q6JS9Z2at
         FP351nzGoJfKOb804fAz6nM59l/JAsPQT1FPGdRKHeT1+T/DPYX8qRDQk8+jMgI7pPjS
         mSXf2NAu0k4IgJEdPFgtCHyPkXpDg8K0qSqUHgVk0MZpPYzaCs5L1TssEOwhmy69QtKL
         vN6fyNB4WGQMBuivZI7SGqtmQUANLIv/D+5QtYqD8l3XTvRp5+XI66WekRQlA8E7Aml6
         pUGg==
X-Forwarded-Encrypted: i=1; AJvYcCXs3qdnt59hJgO8B+fGaw1K2RTHatdhS/l7YWHVV8CMgg3UI/gMmELQiqvrsA4T/oQCm/Y4W9IuzuLvWv3JBDgm@lists.infradead.org
X-Gm-Message-State: AOJu0YwTDm0yPLCzddgkxNSKQ59AfIskqM8h+jdFU/PjoyQG0QD9PcNs
	vMxDH271q9KfAWFNMBUdDC/yxO7jdKxziX6Sp5gTG5L7mjqhdXNDzsq7S5nGPIOUdg4cFhzc+cU
	FOj5tg/LOPb/j6st9M3+yGHFfKzPQ7633FoIvvCg9
X-Gm-Gg: ATEYQzwUzneaqCdi52Gv60bfUCyyr0SRarBKiXi1uho5uIkhH8M9sTKcaNGDS3QW6CW
	6sl+OLW2PWp83ZvIGOlFx5lIbhjJ69NeMGew+mE67o3eO7wI/Z0jh9h3EaVjus4kE06Dtl5oftb
	zHKfncEAM/ADmo2IAg4djcgqw/l+IYReir7fvOi7wY6/DJmJkuOOYhF5GtfDkB9SzSv755X+ydQ
	hmVA1/b2fKuIPbW4ZliaGMcONAIjbjWehKgYwsdNKB1X6HxGSrA33FSo6eAMJkeSiklFBD8kK5d
	zVUSSsGaloAnMUrdKy4q4BzCx7Crsbt5+kIWrFPJA9OuIv+X
X-Received: by 2002:a05:622a:1a84:b0:501:4eae:dbfc with SMTP id
 d75a77b69052e-50939a1331fmr9273301cf.5.1773224756831; Wed, 11 Mar 2026
 03:25:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260305144351.17071-1-will@kernel.org> <20260305144351.17071-31-will@kernel.org>
In-Reply-To: <20260305144351.17071-31-will@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 11 Mar 2026 10:25:19 +0000
X-Gm-Features: AaiRm51vdHkDNojRuUoHaot0Yn8S1yI6_XmLto9_5Z_0EeFcRkb2eAqyUAQ5R7M
Message-ID: <CA+EHjTzzQzqLxwTAQCS3uXzSgJS9Yk-wbkF8dxzsJBXs4oBGJA@mail.gmail.com>
Subject: Re: [PATCH v3 30/36] KVM: arm64: Allow userspace to create protected
 VMs when pKVM is enabled
To: Will Deacon <will@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu <yuzenghui@huawei.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Quentin Perret <qperret@google.com>, 
	Vincent Donnefort <vdonnefort@google.com>, Mostafa Saleh <smostafa@google.com>, 
	Alexandru Elisei <alexandru.elisei@arm.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_032558_419783_2444E963 
X-CRM114-Status: GOOD (  28.92  )
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

On Thu, 5 Mar 2026 at 14:45, Will Deacon <will@kernel.org> wrote:
>
> Introduce a new VM type for KVM/arm64 to allow userspace to request the
> creation of a "protected VM" when the host has booted with pKVM enabled.
>
> For now, this depends on CONFIG_EXPERT and results in a taint on first
> use as many aspects of a protected VM are not yet protected!
>
> Signed-off-by: Will Deacon <will@kernel.org>

Reviewed-by: Fuad Tabba <tabba@google.com>

Cheers,
/fuad

> ---
>  arch/arm64/include/asm/kvm_pkvm.h |  2 +-
>  arch/arm64/kvm/Kconfig            | 10 ++++++++++
>  arch/arm64/kvm/arm.c              |  8 +++++++-
>  arch/arm64/kvm/mmu.c              |  3 ---
>  arch/arm64/kvm/pkvm.c             | 11 ++++++++++-
>  include/uapi/linux/kvm.h          |  5 +++++
>  6 files changed, 33 insertions(+), 6 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> index 7041e398fb4c..2954b311128c 100644
> --- a/arch/arm64/include/asm/kvm_pkvm.h
> +++ b/arch/arm64/include/asm/kvm_pkvm.h
> @@ -17,7 +17,7 @@
>
>  #define HYP_MEMBLOCK_REGIONS 128
>
> -int pkvm_init_host_vm(struct kvm *kvm);
> +int pkvm_init_host_vm(struct kvm *kvm, unsigned long type);
>  int pkvm_create_hyp_vm(struct kvm *kvm);
>  bool pkvm_hyp_vm_is_created(struct kvm *kvm);
>  void pkvm_destroy_hyp_vm(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 7d1f22fd490b..e71f7fb6e89a 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -82,4 +82,14 @@ config PTDUMP_STAGE2_DEBUGFS
>
>           If in doubt, say N.
>
> +config PROTECTED_VM_UAPI
> +       bool "Expose protected VMs to userspace (experimental)"
> +       depends on KVM && EXPERT
> +       help
> +         Say Y here to enable experimental (i.e. in development)
> +         support for creating protected virtual machines using KVM's
> +         KVM_CREATE_VM ioctl() when booted with pKVM enabled.
> +
> +         Unless you are a KVM developer, say N.
> +
>  endif # VIRTUALIZATION
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 3589fc08266c..c2b666a46893 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -203,6 +203,9 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  {
>         int ret;
>
> +       if (type & ~KVM_VM_TYPE_ARM_MASK)
> +               return -EINVAL;
> +
>         mutex_init(&kvm->arch.config_lock);
>
>  #ifdef CONFIG_LOCKDEP
> @@ -234,9 +237,12 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>                  * If any failures occur after this is successful, make sure to
>                  * call __pkvm_unreserve_vm to unreserve the VM in hyp.
>                  */
> -               ret = pkvm_init_host_vm(kvm);
> +               ret = pkvm_init_host_vm(kvm, type);
>                 if (ret)
>                         goto err_uninit_mmu;
> +       } else if (type & KVM_VM_TYPE_ARM_PROTECTED) {
> +               ret = -EINVAL;
> +               goto err_uninit_mmu;
>         }
>
>         kvm_vgic_early_init(kvm);
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 4e64528d86a6..7655e4c61c4e 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -881,9 +881,6 @@ static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
>         u64 mmfr0, mmfr1;
>         u32 phys_shift;
>
> -       if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> -               return -EINVAL;
> -
>         phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
>         if (is_protected_kvm_enabled()) {
>                 phys_shift = kvm_ipa_limit;
> diff --git a/arch/arm64/kvm/pkvm.c b/arch/arm64/kvm/pkvm.c
> index da0a45dab203..d1eb6e23367e 100644
> --- a/arch/arm64/kvm/pkvm.c
> +++ b/arch/arm64/kvm/pkvm.c
> @@ -219,9 +219,13 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm)
>         mutex_unlock(&kvm->arch.config_lock);
>  }
>
> -int pkvm_init_host_vm(struct kvm *kvm)
> +int pkvm_init_host_vm(struct kvm *kvm, unsigned long type)
>  {
>         int ret;
> +       bool protected = type & KVM_VM_TYPE_ARM_PROTECTED;
> +
> +       if (protected && !IS_ENABLED(CONFIG_PROTECTED_VM_UAPI))
> +               return -EINVAL;
>
>         if (pkvm_hyp_vm_is_created(kvm))
>                 return -EINVAL;
> @@ -236,6 +240,11 @@ int pkvm_init_host_vm(struct kvm *kvm)
>                 return ret;
>
>         kvm->arch.pkvm.handle = ret;
> +       kvm->arch.pkvm.is_protected = protected;
> +       if (protected) {
> +               pr_warn_once("kvm: protected VMs are for development only, tainting kernel\n");
> +               add_taint(TAINT_USER, LOCKDEP_STILL_OK);
> +       }
>
>         return 0;
>  }
> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
> index 65500f5db379..50348efe3384 100644
> --- a/include/uapi/linux/kvm.h
> +++ b/include/uapi/linux/kvm.h
> @@ -699,6 +699,11 @@ struct kvm_enable_cap {
>  #define KVM_VM_TYPE_ARM_IPA_SIZE_MASK  0xffULL
>  #define KVM_VM_TYPE_ARM_IPA_SIZE(x)            \
>         ((x) & KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
> +
> +#define KVM_VM_TYPE_ARM_PROTECTED      (1UL << 31)
> +#define KVM_VM_TYPE_ARM_MASK           (KVM_VM_TYPE_ARM_IPA_SIZE_MASK | \
> +                                        KVM_VM_TYPE_ARM_PROTECTED)
> +
>  /*
>   * ioctls for /dev/kvm fds:
>   */
> --
> 2.53.0.473.g4a7958ca14-goog
>

