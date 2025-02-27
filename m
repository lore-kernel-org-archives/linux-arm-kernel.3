Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 476F4C282C5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jKfAa0Y4QqMGJoYxTlrv1q30VfaaUBgzdpc7bbsXTMU=; b=tQsraPbGtDINvDvMo4ovRRHqi/
	okFzyGdolXHQ9DrzZhnxrZC9qS3ypmi5c4K3avcW1USnU9TmRmJLbeKRyEroTCxqtYFxHKDJXXe8T
	6Ul5jKUVPAO21jy5Uz1ZoA8aDP8dcpahlck8SCMPSDy4gxiUZbniq9rLQQDMbJB9KTkX2DBVsFUXx
	vAry2OOc+ZweOgn9hGBL52e3rQRNY5W4ynP+2Ko7OonwnK7A8y0Ou4gWRHcRbYNFkNMk2AwiOQ9mG
	6psi7pQEgQKaatESbITh/8HQkqPt+ZAN2fD5lOAXpMM62ESm9BtvrhCkycqRoojKxgYtX/TkDJESl
	fp96j0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnf1j-00000007lW5-3ZqD;
	Thu, 27 Feb 2025 14:38:15 +0000
Received: from mail-qt1-x833.google.com ([2607:f8b0:4864:20::833])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tndIw-00000007QFO-2WgX
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 12:47:55 +0000
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-471fa3b19bcso266431cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Feb 2025 04:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1740660473; x=1741265273; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jKfAa0Y4QqMGJoYxTlrv1q30VfaaUBgzdpc7bbsXTMU=;
        b=VTBwX2irrY9THAcauHTfN3RiURoJlan7KbvLKgNwrCg/+jV9LDhXzIWLB2PBlVUcKM
         Yjk4NWcL0XKlWnYDMrINVj2gnSB/SITyHXDLlXZx6f6cE9IFCImuMoFQ9PEEzZHC/9xl
         +OjCyNgyZ/Li3JU/CqBu/2DgAELdKDUgev0JkHpMAE1jDYkBeGBKCUuqkwXLvPq764q1
         GFHnIw83hCl1IauU5CLs6Zkvxqw74moNvF5WjQog+9JaT1vLaY9fdLmEYNySlkvbZvJM
         7v/jm7gR1mr37pChQLT6IcONMXARv3WGMGohT5hUKoEW15zrUyIeoYSv6VXxwuRMXSk5
         us9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740660473; x=1741265273;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jKfAa0Y4QqMGJoYxTlrv1q30VfaaUBgzdpc7bbsXTMU=;
        b=nfjGMkrYXPLK84hjJr6vez0cF3VvGXErlRF4EJNRkYNz6nb/skwm+acgFy0+hVue5E
         IVanr79HNOezkoG2ZmVujlMLTCIAGnl20cEXX6wvIKkDzqIj8Un3qjduHwe/vk3oTvA0
         pm8R2XhoCu0qoG6JseaodSdAYrGJNFIGSWnscIR2JO/rP/23BBPCRT9DZlnjJ+SCYkrA
         bA2AiyIjogoOPIDauAdzA45ue/3j+oDGbsqu1huTQtm43whmGWn7e0vc+yJujXCIZ9Gq
         JomH6ErGqi7g4K5RXelhtqSy17NsfAp7PYQ59Wpc8LmKPfzyNVmi7YBq3w7hgwrOxN0C
         /nig==
X-Forwarded-Encrypted: i=1; AJvYcCUJcojaN7Cnjvd7kux/UqS8wz4BN4s0PlpSC9/yDO9R9y0bz58R7EUXjTeTgUZezFrt9IvgaWYvGlOHKrGo/NOy@lists.infradead.org
X-Gm-Message-State: AOJu0YyzJQfVfJi9Eh/rN3psHie5SRDMZHWi5R28Dsow6FYW8Yu/mUC2
	lZcIobr3YTDUVXAzknuZfYf5s88hPcI34+15nC2Lv0u8aiuuPp7y8Q5h1k9a/YKzMYZM5GwI7cG
	J9KB5OA81to3WymPUElSTc2Ko/FME/UH17TFJ
X-Gm-Gg: ASbGncsiawezZPozNpwvW38siluhVA7WxG8Uga431q6khtbflhI/O13MTkOG1m95ipj
	zO2VPkypKrGPTAKsWl1zK9yID4r4V40aam62QN6Y/+KljFderPxoG0dwu5NmU/UvQb6e0bC58kP
	CZIiE=
X-Google-Smtp-Source: AGHT+IHWUM9StvpMxTR1veAWbKD3F0IvKPiFCSnfuUozdIUs6NKdtI7rvvBzOdmVI68lbvumaPJTvMO7DJi2qSftbmE=
X-Received: by 2002:ac8:5943:0:b0:46d:f29d:4173 with SMTP id
 d75a77b69052e-4742e10ab22mr3399631cf.16.1740660472515; Thu, 27 Feb 2025
 04:47:52 -0800 (PST)
MIME-Version: 1.0
References: <20250226215520.1759218-1-tabba@google.com> <20250226215520.1759218-5-tabba@google.com>
 <8634fzr3m1.wl-maz@kernel.org>
In-Reply-To: <8634fzr3m1.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Feb 2025 04:47:16 -0800
X-Gm-Features: AQ5f1Jrj0OYH1ko9OQCBTsbltlCUH5L-oDvJ4j9ZT42gtFRD7R39beJcLhGtUNY
Message-ID: <CA+EHjTzPH_K1BUrNW9EkaFWj3qCdr4uwJS1pZhCYYfi2Uecu=Q@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] KVM: arm64: Create each pKVM hyp vcpu after its
 corresponding host vcpu
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, mark.rutland@arm.com, will@kernel.org, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com, 
	catalin.marinas@arm.com, broonie@kernel.org, qperret@google.com, 
	vdonnefort@google.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_044754_646294_1F2C6B5D 
X-CRM114-Status: GOOD (  33.22  )
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

Hi Marc,

On Thu, 27 Feb 2025 at 04:09, Marc Zyngier <maz@kernel.org> wrote:
>
> On Wed, 26 Feb 2025 21:55:20 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Instead of creating and initializing _all_ hyp vcpus in pKVM when
> > the first host vcpu runs for the first time, initialize _each_
> > hyp vcpu in conjunction with its corresponding host vcpu.
> >
> > Some of the host vcpu state (e.g., system registers and traps
> > values) is not initialized until the first time the host vcpu is
> > run. Therefore, initializing a hyp vcpu before its corresponding
> > host vcpu has run for the first time might not view the complete
> > host state of these vcpus.
> >
> > Additionally, this behavior is inline with non-protected modes.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_host.h      |  2 +
> >  arch/arm64/include/asm/kvm_pkvm.h      |  1 +
> >  arch/arm64/kvm/arm.c                   |  4 ++
> >  arch/arm64/kvm/hyp/include/nvhe/pkvm.h |  6 ---
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c         | 54 +++++++++++++++-----------
> >  arch/arm64/kvm/pkvm.c                  | 28 ++++++-------
> >  6 files changed, 53 insertions(+), 42 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> > index 3a7ec98ef123..4a0e522f6001 100644
> > --- a/arch/arm64/include/asm/kvm_host.h
> > +++ b/arch/arm64/include/asm/kvm_host.h
> > @@ -869,6 +869,8 @@ struct kvm_vcpu_arch {
> >  #define VCPU_INITIALIZED     __vcpu_single_flag(cflags, BIT(0))
> >  /* SVE config completed */
> >  #define VCPU_SVE_FINALIZED   __vcpu_single_flag(cflags, BIT(1))
> > +/* pKVM VCPU setup completed */
> > +#define VCPU_PKVM_FINALIZED  __vcpu_single_flag(cflags, BIT(2))
> >
> >  /* Exception pending */
> >  #define PENDING_EXCEPTION    __vcpu_single_flag(iflags, BIT(0))
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index eb65f12e81d9..abd693ce5b93 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -19,6 +19,7 @@
> >  int pkvm_init_host_vm(struct kvm *kvm);
> >  int pkvm_create_hyp_vm(struct kvm *kvm);
> >  void pkvm_destroy_hyp_vm(struct kvm *kvm);
> > +int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
> >
> >  /*
> >   * This functions as an allow-list of protected VM capabilities.
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index b8e55a441282..cd7a808eeb64 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -833,6 +833,10 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
> >               ret = pkvm_create_hyp_vm(kvm);
> >               if (ret)
> >                       return ret;
> > +
> > +             ret = pkvm_create_hyp_vcpu(vcpu);
> > +             if (ret)
> > +                     return ret;
> >       }
> >
> >       mutex_lock(&kvm->arch.config_lock);
> > diff --git a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > index e42bf68c8848..ce31d3b73603 100644
> > --- a/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > +++ b/arch/arm64/kvm/hyp/include/nvhe/pkvm.h
> > @@ -43,12 +43,6 @@ struct pkvm_hyp_vm {
> >       struct hyp_pool pool;
> >       hyp_spinlock_t lock;
> >
> > -     /*
> > -      * The number of vcpus initialized and ready to run.
> > -      * Modifying this is protected by 'vm_table_lock'.
> > -      */
> > -     unsigned int nr_vcpus;
> > -
> >       /* Array of the hyp vCPU structures for this VM. */
> >       struct pkvm_hyp_vcpu *vcpus[];
> >  };
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index 6efb9bf56180..4ef3748dc660 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -245,10 +245,12 @@ struct pkvm_hyp_vcpu *pkvm_load_hyp_vcpu(pkvm_handle_t handle,
> >
> >       hyp_spin_lock(&vm_table_lock);
> >       hyp_vm = get_vm_by_handle(handle);
> > -     if (!hyp_vm || hyp_vm->nr_vcpus <= vcpu_idx)
> > +     if (!hyp_vm || hyp_vm->kvm.created_vcpus <= vcpu_idx)
>
> Why is it reasonable to trust kvm.created_vcpus here? It looks like
> something that is under direct control of the host, and that could be
> arbitrarily changed to allow dereferencing the vcpus[] array past its
> actual boundaries.
>
> What guarantees that it is stable at load-time?
>
> I have similar misgivings about the init and teardown paths.

This is the hypervisor's view of created_vcpus
(hyp_vm->kvm.created_vcpus), i.e., not the host's (not
host_kvm->created_vcpus). We read it once from the host at
__pkvm_init_vm(). We should know that it wouldn't overflow the vcpus
array since it's the value of created_vcpus (nr_vcpus) we use when we
calculate the vm_size in __pkvm_init_vm(), and try to map the
corresponding amount of donated memory for the hyp_vm (all in
__pkvm_init_vm()).

Since it's all hyp values, it should be fine, right?

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

