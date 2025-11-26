Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C5BBD10F21
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 11:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=J+3L7npYoMe72LZAqOf/QcGS609azhf8MHMKeVgv2t0=; b=3o3yvByXxT9wTQ/xJ3ZIjv+TEZ
	cXnWErS9xxc9uNpSi3erJ1j4lggb5/3slsLeCm7dMwdpwJ0orJoLSjpRvSIhOpni9j0bD95EoQpOK
	L5iX85wUIEmFBUjLHYetYk/vcPKhf7eEVyCy2kA8mrqFyhf36SsF1Q8uuuyO8Lb3Q9TMR5suHUqcn
	QYaoKcVwfcP/nRJjaTXQG+JDIhFNhEwVmHMf9DrTOwa9m/68i8W0JjXjY9gpoHrqRUtkhbH4YtaQ3
	fDF3sLRv98pMqXwWl+yeis5kHUy98NlXkiEY7sD4BKQqHJOktoQBoZks8Y6SFwKIII+7cLbAVFv5y
	1P2EzyDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODH6-0000000EsBK-1pkl;
	Wed, 26 Nov 2025 11:01:28 +0000
Received: from mail-qt1-x836.google.com ([2607:f8b0:4864:20::836])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vODH3-0000000EsAS-1Sdb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 11:01:26 +0000
Received: by mail-qt1-x836.google.com with SMTP id d75a77b69052e-4ee243b98caso197771cf.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Nov 2025 03:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764154884; x=1764759684; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=J+3L7npYoMe72LZAqOf/QcGS609azhf8MHMKeVgv2t0=;
        b=CmhJ6V9QW157YwJ1Jn6h1DQGVmaBZnGY4KQW6uurPSDa11Z29GXFXP8mwpsoMEMBE5
         dVtYSLEfLNN4rVF3qWjqfT171p22f9rKYe5ig0Lugu3ZFbDWL8vulIYQTiWySRv1C+Lu
         Emw4GXNY/GLqYbgCYEtIyaYgwNFI//Req48RvCLlMjVB2uJOe8xOD5sFmonA8mEkzgbN
         RqssRYhyV0C4NL95MD4GuGcNfrmrg2UZgcqpPJKcYYHiEmbZ8BqLWXNMRgtlmMOjmyqD
         9LnfzZPbSY1O7F7GX+OOTDHXnODGtIjJkC3TtGpBtVzqsWdUBORYiO5IY7vwtXUNdn2k
         Kwkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764154884; x=1764759684;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J+3L7npYoMe72LZAqOf/QcGS609azhf8MHMKeVgv2t0=;
        b=UkVCbSaTUf8qIkBEtz3a835mWZACkZsZHxMG6lrA8ZqEx5HwtBQIuT6qncv/Dp33hJ
         GugaFfdNU1r2r9EEqbKoMRF3cofvlx4JoD+m2k8m5wk6VKzbbwuVTfJhoMCYTAe00aO6
         L7VqdTaxLRePA74nPUaVq8IMFHSbD+ktcw02D+KNzHSY8Jy7gRWaIyEV0slhu5F4QKw8
         +yb53w/7egOwYYNGwdile/T2wxnvn5p6V3HNcrTU+zUOPAv855wJDGsNkjLiVOEO3QsO
         79Qkl0xpGRUC0yPMRuZfGa2ZdRKYGpuJ3rGVApFyTP935k+PFsTYgfu8v/qcVT6JEsXR
         Icvg==
X-Forwarded-Encrypted: i=1; AJvYcCUzDKbamDVzSUck08UbcDOxCss0ftjcihYwq2ZSgflLN1PAqLAYmVTbmgI83Yr4pWDYhhwG3QioVMMTN3tC9f9F@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/ponrvtMH3eEB8GytuFTEpdGqLnYAvuxrD25nlno7idWpgvfQ
	eflcYw1o0kYW5YEoG2zwTsMjYWCCcnvqqutG9qVP2ShYxWtPDSOjIoXl3nqOQB1SWPf7Ongi62o
	RpRkeLa4ftpmyRun/u8nnNFmnoc+tuc+rg6PQtRWy
X-Gm-Gg: ASbGnctF//lcKFT5E2rfA4/zKopvg9nHsswOg3oHocIjKMx7OqCS1n3MKxce+LQ9oWe
	IwatR/EUj9voSLPi75VP/h7kVht7cwT0vimbqn9ngqZiy+b6ZzwmCdQOYeZ4lnOEcq7KbUoDBjh
	5rPNPskke9JKaUziUA2ueHMLp/HlSpeM9LEY6nDsUmim9QkVl63YzVXoyWEaFqNel5RR846BB61
	uihfWkiczJ6SoUa8I2JGNpF1UQoXDJ6FsuCT3AVTe8KckNNqWkq4Hwp9En+01OSYdRvUz8fosRa
	qiOU9SfbuaC0iAasvyHKgHfq
X-Google-Smtp-Source: AGHT+IGg8KtTFQs3f5lkDPEQIA1agApY+VFbSfmaMCBg+p4yvM2Tz8ctiRXqArvH+h7g2HfrS6qrMI4+M4gDyc1CPvk=
X-Received: by 2002:a05:622a:1496:b0:4ed:b665:3779 with SMTP id
 d75a77b69052e-4efc6c8b73bmr3738061cf.16.1764154883809; Wed, 26 Nov 2025
 03:01:23 -0800 (PST)
MIME-Version: 1.0
References: <20251118103807.707500-1-tabba@google.com> <20251118103807.707500-6-tabba@google.com>
 <867bvdqd4m.wl-maz@kernel.org>
In-Reply-To: <867bvdqd4m.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Wed, 26 Nov 2025 11:00:47 +0000
X-Gm-Features: AWmQ_bnId5eaZtSND4q_YYjMzwsJNTvFSJeX_rFs9ffPKuakqZ-zcAPUa1IB4is
Message-ID: <CA+EHjTxPxscVZryCoVAZYebgD82waEKiv0Z-CFG6H+CW3dAbXQ@mail.gmail.com>
Subject: Re: [PATCH v5 5/9] KVM: arm64: Include VM type when checking VM
 capabilities in pKVM
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	vladimir.murzin@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_030125_617494_768685FF 
X-CRM114-Status: GOOD (  38.27  )
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

On Wed, 26 Nov 2025 at 10:53, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 18 Nov 2025 10:38:02 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Certian features and capabilities are restricted in protected mode. Most
> > of these features are restricted only for protected VMs, but some
> > are restricted for ALL VMs in protected mode.
> >
> > Extend the pKVM capability check to pass the VM (kvm), and use that when
> > determining supported features. Moreover, extend the check to disallow
> > MTE for all VM types in protected mode.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/include/asm/kvm_pkvm.h | 10 ++++++----
> >  arch/arm64/kvm/arm.c              |  4 ++--
> >  arch/arm64/kvm/hyp/nvhe/pkvm.c    | 10 +++++-----
> >  3 files changed, 13 insertions(+), 11 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/kvm_pkvm.h b/arch/arm64/include/asm/kvm_pkvm.h
> > index 08be89c95466..7195be508d99 100644
> > --- a/arch/arm64/include/asm/kvm_pkvm.h
> > +++ b/arch/arm64/include/asm/kvm_pkvm.h
> > @@ -23,10 +23,12 @@ void pkvm_destroy_hyp_vm(struct kvm *kvm);
> >  int pkvm_create_hyp_vcpu(struct kvm_vcpu *vcpu);
> >
> >  /*
> > - * This functions as an allow-list of protected VM capabilities.
> > - * Features not explicitly allowed by this function are denied.
> > + * Check whether the specific capability is allowed in pKVM.
> > + *
> > + * Certain features are allowed only for non-protected VMs in pKVM, which is why
> > + * this takes the VM (kvm) as a parameter.
> >   */
> > -static inline bool kvm_pvm_ext_allowed(long ext)
> > +static inline bool kvm_pkvm_ext_allowed(struct kvm *kvm, long ext)
> >  {
> >       switch (ext) {
> >       case KVM_CAP_IRQCHIP:
> > @@ -43,7 +45,7 @@ static inline bool kvm_pvm_ext_allowed(long ext)
> >       case KVM_CAP_ARM_PTRAUTH_GENERIC:
> >               return true;
> >       default:
> > -             return false;
> > +             return !kvm || !kvm_vm_is_protected(kvm);
>
> I find this expression a bit unreadable. IMO it would be better if
> written as:
>
>                 return !(kvm && kvm_vm_is_protected(kvm));

Will change.

> which makes it "clear" that you claim to support everything when
> either kvm == NULL or described an unprotected VM.
>
> But it then begs the question:
>
> - in what circumstances is kvm == NULL? Is there any case outside of
>   kvm_vm_check_extension()?

kvm_vm_ioctl_check_extension() could be called without a VM. In which
case, we don't know if the check is for non-protected or protected.
This patch doesn't change the behavior of this part.

> - do you really support everything?

For non-protected, yes ... with the MTE caveat, which later patches fix.

> >       }
> >  }
> >
> > diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> > index 870953b4a8a7..10d853f2722e 100644
> > --- a/arch/arm64/kvm/arm.c
> > +++ b/arch/arm64/kvm/arm.c
> > @@ -87,7 +87,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
> >       if (cap->flags)
> >               return -EINVAL;
> >
> > -     if (kvm_vm_is_protected(kvm) && !kvm_pvm_ext_allowed(cap->cap))
> > +     if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, cap->cap))
> >               return -EINVAL;
> >
> >       switch (cap->cap) {
> > @@ -299,7 +299,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
> >  {
> >       int r;
> >
> > -     if (kvm && kvm_vm_is_protected(kvm) && !kvm_pvm_ext_allowed(ext))
> > +     if (is_protected_kvm_enabled() && !kvm_pkvm_ext_allowed(kvm, ext))
> >               return 0;
>
> But that's a change in semantics here. Calling this function outside
> of the context of a VM (kvm == NULL) will now report that *ALL*
> extensions are valid, instead of limiting it to the allow-list.
>
> With that, userspace can no longer detect what is available and what
> isn't before creating a VM with the correct VM type.

This patch doesn't change this semantic, since this patch moves the
NULL check into kvm_pkvm_ext_allowed().

> I don't think this is the right way to do this, unless you really want
> to break the existing UAPI (rhetorical question).

I agree, but I don't think this patch changes this behavior. Later on
in this series we expand the check to apply to non-protected VMs to
also restrict features that are not allowed in protected mode in
general -- something that until this series we didn't have.

Cheers,
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

