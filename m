Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77AB1C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 17:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GB1ZFeK0F7/foKhy2m/gacA/n223vC5lbnfCSum8o78=; b=Pqq0MYU3WDJmtAEKnMr+ApoZN/
	TpIf1bNZtsHT0sAizhebHv7kX98cGSDhKqhs8QqMVIeedVW3rQUG60Ok/tsSHcafol/icCV7hEzZr
	6bRsJNKMIU9qufi546TCvXcR9P3AnCWlfs6GDSIT8FV96ax+Eq1g/jrwEl4oanbaRllJO53aVwSSn
	Me79gD824DIsZHgBR0U+hw52YkBIFEsW+4AsR/NJqas5KG7nA651Xxjnrqj6fopIboAu73OGDy8K/
	8/qsLRemGyLu6sJ64sphOQjHUAjb3oKdJdldDPboSu65ScBVdiAYyDAsCab2u+mEGc2DkCgsB5C+A
	jQVY6OLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSIfM-0000000DfsK-1BIb;
	Thu, 19 Jun 2025 17:03:08 +0000
Received: from mail-qt1-x834.google.com ([2607:f8b0:4864:20::834])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGMv-0000000DIEr-43SF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 14:35:59 +0000
Received: by mail-qt1-x834.google.com with SMTP id d75a77b69052e-47e9fea29easo350261cf.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 19 Jun 2025 07:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750343756; x=1750948556; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GB1ZFeK0F7/foKhy2m/gacA/n223vC5lbnfCSum8o78=;
        b=FFg0aj+0ZsLHm6Dd5AXhJLieS/mhSxSCDRL4C+dbKDeiHguc5CDgi0qBFNhh+DjTGC
         AkFp/PMTlVkRaIoXnp7LDLafIg1UYvV1wCc4ROWvdra16b9qf21CDQoQ7lqTRXe4Xwrq
         d+85XJ4Ks3UHxOLcm1V583PGZZSZasxrzPoOuIWfqRLOYvYZfN4yTaahnGN7Ja4s1DVu
         F1QP2xUZ3oplLxF9YCnZJ+y5sS/3SAJ8UavvrtjVlycPn997BgBa1T2XXEtcrHJFGwwM
         jMhdFjxuY99COOe1HzBmyy1rS29pmAGWpiK4q2DJSia88somr3muv2yguB3W9qu1xzdD
         8iPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343756; x=1750948556;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GB1ZFeK0F7/foKhy2m/gacA/n223vC5lbnfCSum8o78=;
        b=eJaLE/oKYr+jS7asc2h1fkaSeXPq9H+NuUmyoLlDLig7LQOgY9L5UBI1+Ho5cbUvLv
         C9yWIcdkDYYd4EP8VZ+TGYTkf+3fZyaJb8teBJ/9kUMUvSTqs+kCaioViOGRsAVqZC9x
         GycNO8CClf1RoTNww9wIsHDQR8+E9Un90UD0soS0OCrTaPjiwnwfHVLGKeL1pg0NLeaj
         W7duMy9pSLOLs7rOb/yXGV54PVIkjtqVLB94xupttw/8nCy4myXcsk25DlcvONiKCckD
         Sw3/8oMzxP3wA4xL7nIpGgetZEpdEn5KJjWmV3H8Z54TkBVSsHXgUjwrVst+7COzs89l
         miKA==
X-Gm-Message-State: AOJu0YzfgBuhzt9kOOm+KAyqGAyZv1NTQc/GXUQ32BAXhqEMqc8Y9SVD
	WJtfkeG+K/PZcfczYUoFR8rtiISepbAnPPdb2NrqTIqzNHgCRg9l2q2BSqiRrAWqQvqK3aWsaK1
	BIxNdYBcB0sAnBTHZRN2uDf3QO+D+q8D7oSIUGt8yqMSmXbPXny8DhjYhARk=
X-Gm-Gg: ASbGncs+4smyXyYliKDWuDsmad6dcMxB8z9CPTnuakViYRTdHFxG78sovNJ6NK/Lv5i
	CdcUYLds/rbBiKf4W9879LMGx+sQpC+s96R5HllFKdfq/GAokVxP17hHXJIW6ukvNHtwazAcQm4
	UL3jyZHoRLzzGez7ihDMOrNRC/7jIYBPnS73LnXECn/tg=
X-Google-Smtp-Source: AGHT+IFOXuR0RhkMrX3ZxxsSI6jbCIoGAFGDxUMS3k8eUMINFPUVszvTwPwAd5BnYl5dVCeTXrzjtZb+swp4bOehBSs=
X-Received: by 2002:a05:622a:34b:b0:4a6:f9d2:b547 with SMTP id
 d75a77b69052e-4a76ebb4dbfmr3964161cf.20.1750343755818; Thu, 19 Jun 2025
 07:35:55 -0700 (PDT)
MIME-Version: 1.0
References: <20250619134817.4075340-1-mark.rutland@arm.com>
In-Reply-To: <20250619134817.4075340-1-mark.rutland@arm.com>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 19 Jun 2025 15:35:18 +0100
X-Gm-Features: Ac12FXyjFicj4m99JQKlEGx3CWSSdfG3VGA9blZkYP0rHuRThVuDKKDqEPvH6Ts
Message-ID: <CA+EHjTxtH3JDsOmQLvw4oVMmvixTbADuVTs9ckLYwTU+EfryYg@mail.gmail.com>
Subject: Re: [PATCH] KVM: arm64: Remove kvm_arch_vcpu_run_map_fp()
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, broonie@kernel.org, 
	catalin.marinas@arm.com, kvmarm@lists.linux.dev, maz@kernel.org, 
	oliver.upton@linux.dev, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_073558_026303_BA8971D0 
X-CRM114-Status: GOOD (  28.66  )
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

On Thu, 19 Jun 2025 at 14:48, Mark Rutland <mark.rutland@arm.com> wrote:
>
> Historically KVM hyp code saved the host's FPSIMD state into the hosts's
> fpsimd_state memory, and so it was necessary to map this into the hyp
> Stage-1 mappings before running a vCPU.
>
> This is no longer necessary as of commits:
>
> * fbc7e61195e2 ("KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state")
> * 8eca7f6d5100 ("KVM: arm64: Remove host FPSIMD saving for non-protected KVM")
>
> Since those commits, we eagerly save the host's FPSIMD state before
> calling into hyp to run a vCPU, and hyp code never reads nor writes the
> host's fpsimd_state memory. There's no longer any need to map the host's
> fpsimd_state memory into the hyp Stage-1, and kvm_arch_vcpu_run_map_fp()
> is unnecessary but benign.
>
> Remove kvm_arch_vcpu_run_map_fp(). Currently there is no code to perform
> a corresponding unmap, and we never mapped the host's SVE or SME state
> into the hyp Stage-1, so no other code needs to be removed.
>
> Signed-off-by: Mark Rutland <mark.rutland@arm.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Fuad Tabba <tabba@google.com>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Mark Brown <broonie@kernel.org>
> Cc: Oliver Upton <oliver.upton@linux.dev>
> Cc: Will Deacon <will@kernel.org>
> Cc: kvmarm@lists.linux.dev
> ---
>  arch/arm64/include/asm/kvm_host.h |  1 -
>  arch/arm64/kvm/arm.c              |  4 ----
>  arch/arm64/kvm/fpsimd.c           | 26 --------------------------
>  3 files changed, 31 deletions(-)

Tested-by: Fuad Tabba <tabba@google.com>
Reviewed-by: Fuad Tabba <tabba@google.com>

Thanks!
/fuad

> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 5ccca509dff1a..f7ad74404202b 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -1482,7 +1482,6 @@ int kvm_vm_ioctl_get_reg_writable_masks(struct kvm *kvm,
>                                         struct reg_mask_range *range);
>
>  /* Guest/host FPSIMD coordination helpers */
> -int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu);
>  void kvm_arch_vcpu_load_fp(struct kvm_vcpu *vcpu);
>  void kvm_arch_vcpu_ctxflush_fp(struct kvm_vcpu *vcpu);
>  void kvm_arch_vcpu_ctxsync_fp(struct kvm_vcpu *vcpu);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index de2b4e9c9f9fb..1502faa460863 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -825,10 +825,6 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>         if (!kvm_arm_vcpu_is_finalized(vcpu))
>                 return -EPERM;
>
> -       ret = kvm_arch_vcpu_run_map_fp(vcpu);
> -       if (ret)
> -               return ret;
> -
>         if (likely(vcpu_has_run_once(vcpu)))
>                 return 0;
>
> diff --git a/arch/arm64/kvm/fpsimd.c b/arch/arm64/kvm/fpsimd.c
> index 8f6c8f57c6b9c..15e17aca1dec0 100644
> --- a/arch/arm64/kvm/fpsimd.c
> +++ b/arch/arm64/kvm/fpsimd.c
> @@ -14,32 +14,6 @@
>  #include <asm/kvm_mmu.h>
>  #include <asm/sysreg.h>
>
> -/*
> - * Called on entry to KVM_RUN unless this vcpu previously ran at least
> - * once and the most recent prior KVM_RUN for this vcpu was called from
> - * the same task as current (highly likely).
> - *
> - * This is guaranteed to execute before kvm_arch_vcpu_load_fp(vcpu),
> - * such that on entering hyp the relevant parts of current are already
> - * mapped.
> - */
> -int kvm_arch_vcpu_run_map_fp(struct kvm_vcpu *vcpu)
> -{
> -       struct user_fpsimd_state *fpsimd = &current->thread.uw.fpsimd_state;
> -       int ret;
> -
> -       /* pKVM has its own tracking of the host fpsimd state. */
> -       if (is_protected_kvm_enabled())
> -               return 0;
> -
> -       /* Make sure the host task fpsimd state is visible to hyp: */
> -       ret = kvm_share_hyp(fpsimd, fpsimd + 1);
> -       if (ret)
> -               return ret;
> -
> -       return 0;
> -}
> -
>  /*
>   * Prepare vcpu for saving the host's FPSIMD state and loading the guest's.
>   * The actual loading is done by the FPSIMD access trap taken to hyp.
> --
> 2.30.2
>

