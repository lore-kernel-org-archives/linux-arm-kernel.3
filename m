Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B909E77173
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 08:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=38VOcmtNIf+FGDDeC2rlfe3RwwgSY9ulk0n9SpJxDqk=; b=Yc2N4J/FAoA7lRmwNsNOMk70xy
	7Ixf7GqdWTJnrNGtM85SIlNnojT6xub0b3u7lH2qcHEiAf6QLIw/lw1ivGyybcR2fBQsMU0dXtVGY
	6hgScCYgWeyIExxsNpL+HI8+ovp3ua/1T2tKEjvbWMueMzy8mjJPvZb8LZ5c6+KOdy4x9Fi1Mh4cT
	cjisWqi8PgInXFaD+D5vLvubXHSeK5ENyJZo4sJoTK1fSQdRim+OelHkT2/pOV16XfleD/+dSgBkq
	alW1qa2+BGOIGb8o3fz8GBcwjbo3bHNQHZWSMvP5RKZ+2lANt9XRv4UNNIwgaKXQJhgPZuj48rRQu
	D9xrrxKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYwK-00000006rzd-2ish;
	Mon, 09 Dec 2024 08:16:24 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKYus-00000006rkh-0N1m
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 08:14:55 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-434e5e71a08so71565e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 09 Dec 2024 00:14:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733732092; x=1734336892; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=38VOcmtNIf+FGDDeC2rlfe3RwwgSY9ulk0n9SpJxDqk=;
        b=AfWwUkfym+QJxm/wBsH3Xm6wquC/z+OYN9AYsSHPMpQl1jKocJh8DIdDvwqt1MWhgX
         p149mMTm3FYNdpEKHJJE3DQ7o+BKOeWdg8DrwwUvkDVta28nIargeEEXl4RDHl1IrbQj
         aSHfMPcguizzhb8FuhUdZNJpm2b1o19wod38OADCgndmR4sBjL/9lotClWgv+B34LBZe
         CaERpYxGzcohJFLxNYdhAcxycbi8NyjlrSvDg9FIeR3j4dN/nftc9rNnz1f76qITKorN
         4O6saYy+BVH4viDc7bP/iIToYYPyUjc4KIU5MOvBRTYJ0vgbZvvYkvqb93+QvcD0TChE
         ryBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733732092; x=1734336892;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=38VOcmtNIf+FGDDeC2rlfe3RwwgSY9ulk0n9SpJxDqk=;
        b=MTfqdrI0pwjXGxQN4yZMo6u/x7Jki8A/7GneAxlXAIbcIThyVcmMrQRVOH8lZMSdOk
         FkVax6wAd3jhWB499AN4+yflGzxP9sIXB734wptk8Ljuxny1/n3gxxAsOJyN3LM57WnM
         0JCe0XQjY+ls3LhmMZLNYU6d4EcjOdeBqunYCgyhjHlbeWE0488J1scIofHQ7ot9o0f5
         jK5ZgEgO4Oq465PjQDOSpJEaIb6nAZwrARApwweP+OfRxF0yrY2YiUkxXk9XwZ9IBQgN
         xonewriAX2Cz7AwyULkhYjrwWpCkPHavzC2CPALl1zSLn4Yk5rAKrOG/GoGfLPKOt4Kg
         a/CQ==
X-Forwarded-Encrypted: i=1; AJvYcCVNdUbLSk1ztvsBmZJJ9I127IJcYc3wq9XZCG69F1vZD4PH68RHvM7i/IDHJQZCtV8VaaMm+bnB58w4G+FnUzR9@lists.infradead.org
X-Gm-Message-State: AOJu0YwxLKijxGpU16dpAxrrvtNKzDbL2772R7L3Rj3keUSyRRdjtyvj
	9kIhJJtooIMzJuhCKNnF8BBzDWmOvqF/m7lgPYs2E23OMxcA79c789/f59Jl+OwJ9NayROefoO7
	eF0wcqV0jDsturmE7R81T3qob7H1lxw57IsjH0QH6X3cC86LOGw==
X-Gm-Gg: ASbGncvt10URrmjWORUqtUC7lkBM+IsrH8Hbo9K8qWlI9JZZ5myxOW0WQBQFn1ixyzj
	YLuumAAzKHLGZ5JAKpgPO1U21W3wEHg==
X-Google-Smtp-Source: AGHT+IECcCGIULUtAZnSfmvAEsNbU/UmcoDuc/+jvY7I76xPVuvbxulGInOe9FXP6l0BfMl0Nn0opoQej/DRcojogCg=
X-Received: by 2002:a05:600c:6c4e:b0:434:9fac:3408 with SMTP id
 5b1f17b1804b1-434e8347d19mr2398065e9.2.1733732092346; Mon, 09 Dec 2024
 00:14:52 -0800 (PST)
MIME-Version: 1.0
References: <20241202154742.3611749-1-tabba@google.com> <20241202154742.3611749-5-tabba@google.com>
 <Z1MwAomiLhnMn--k@google.com>
In-Reply-To: <Z1MwAomiLhnMn--k@google.com>
From: Fuad Tabba <tabba@google.com>
Date: Mon, 9 Dec 2024 08:14:15 +0000
Message-ID: <CA+EHjTy6Y6w9RyU2Vn8O+DDviSJf=P-Y4c+xVFqY-3GmHBv3kQ@mail.gmail.com>
Subject: Re: [PATCH v4 04/14] KVM: arm64: Use KVM extension checks for allowed
 protected VM capabilities
To: Quentin Perret <qperret@google.com>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	maz@kernel.org, oliver.upton@linux.dev, james.clark@linaro.org, 
	will@kernel.org, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, broonie@kernel.org, 
	kristina.martsenko@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_001454_127547_D23CB512 
X-CRM114-Status: GOOD (  16.28  )
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

Hi Quentin,

On Fri, 6 Dec 2024 at 17:10, Quentin Perret <qperret@google.com> wrote:
>
> On Monday 02 Dec 2024 at 15:47:31 (+0000), Fuad Tabba wrote:
> > diff --git a/arch/arm64/kvm/hyp/nvhe/pkvm.c b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > index fb733b36c6c1..59ff6aac514c 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/pkvm.c
> > @@ -329,34 +329,20 @@ static void pkvm_init_features_from_host(struct pkvm_hyp_vm *hyp_vm, const struc
> >
> >       bitmap_zero(allowed_features, KVM_VCPU_MAX_FEATURES);
> >
> > -     /*
> > -      * For protected VMs, always allow:
> > -      * - CPU starting in poweroff state
> > -      * - PSCI v0.2
> > -      */
> > -     set_bit(KVM_ARM_VCPU_POWER_OFF, allowed_features);
>
> For my understanding, why do we drop this bit?

Since the hypervisor is responsible for the power state of protected
VMs. This should either be a separate patch or I should explain it in
the commit message. Any preference?

Thanks,
/fuad

> >       set_bit(KVM_ARM_VCPU_PSCI_0_2, allowed_features);
> >
> > -     /*
> > -      * Check if remaining features are allowed:
> > -      * - Performance Monitoring
> > -      * - Scalable Vectors
> > -      * - Pointer Authentication
> > -      */
> > -     if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64DFR0_EL1_PMUVer), PVM_ID_AA64DFR0_ALLOW))
> > +     if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PMU_V3))
> >               set_bit(KVM_ARM_VCPU_PMU_V3, allowed_features);
> >
> > -     if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64PFR0_EL1_SVE), PVM_ID_AA64PFR0_ALLOW))
> > -             set_bit(KVM_ARM_VCPU_SVE, allowed_features);
> > -
> > -     if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_API), PVM_ID_AA64ISAR1_ALLOW) &&
> > -         FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_APA), PVM_ID_AA64ISAR1_ALLOW))
> > +     if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_ADDRESS))
> >               set_bit(KVM_ARM_VCPU_PTRAUTH_ADDRESS, allowed_features);
> >
> > -     if (FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPI), PVM_ID_AA64ISAR1_ALLOW) &&
> > -         FIELD_GET(ARM64_FEATURE_MASK(ID_AA64ISAR1_EL1_GPA), PVM_ID_AA64ISAR1_ALLOW))
> > +     if (kvm_pvm_ext_allowed(KVM_CAP_ARM_PTRAUTH_GENERIC))
> >               set_bit(KVM_ARM_VCPU_PTRAUTH_GENERIC, allowed_features);
> >
> > +     if (kvm_pvm_ext_allowed(KVM_CAP_ARM_SVE))
> > +             set_bit(KVM_ARM_VCPU_SVE, allowed_features);
> > +
> >       bitmap_and(kvm->arch.vcpu_features, host_kvm->arch.vcpu_features,
> >                  allowed_features, KVM_VCPU_MAX_FEATURES);
> >  }
> > --
> > 2.47.0.338.g60cca15819-goog
> >
>

