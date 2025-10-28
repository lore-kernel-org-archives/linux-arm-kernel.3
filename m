Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7750FCCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 17:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bf2z3SV0EQFH+NyJBVxm2kYHrg6mEHvbE757ZmlP2HM=; b=jC4rzaWrvtdKq6eHc31P7GafDJ
	BW5+wc699xgf9iaWKrJ0k54kecVvANzqaMLjv7O+Zbg9o3bMFfpPL2+R/38f62GpUhNJtXJDPDEB8
	YBZl2Fo8jgnBgbpd6mV/ZNyRR69yPlD7g36Fx4+reJp2qmz72REYTjPTnKVZBlGT2k45XnK+bNVdW
	hw7ZmlE/dcFgQ4PYHp1h6Gf8Mj7pbP97qJngia5glddlgcIqbtDvwnJ3DDvuGTWSxF/LVdc0z/cJs
	VGUM54o6FnU1GGXA9J+YcETSuT4Tacqh4ebeEePFem0U2X6cZz1GWCCGlFbGB5nItNkjtoOAb+JNT
	R0IizpJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn8o-0000000GNO3-1pLh;
	Tue, 28 Oct 2025 17:05:50 +0000
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDn8m-0000000GNN6-0skR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 17:05:49 +0000
Received: by mail-qt1-x82e.google.com with SMTP id d75a77b69052e-4ed0c8e4dbcso15741cf.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 28 Oct 2025 10:05:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761671147; x=1762275947; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bf2z3SV0EQFH+NyJBVxm2kYHrg6mEHvbE757ZmlP2HM=;
        b=H6axk1N8OE3jEfYfg6gXkAaaCuw81nmQLGcy2zhLTbGaykA+V8TsQm4QQNUXvyhpGT
         rShSxB20Pm9fp+kBCU40gV6hAeYPs9KjPKBB1bwIyo5hC/RVU+Z/ZbQ5tnO8SuV0SCAa
         5VALSetV5kwGFqjLK6lM++9yyilwYanCuFLbTV1WngWuwdEoV9A3RtszejGgom5RNXYW
         RoTnrDYpZYCkHeWJY5XVPZuShmhaOAnvt9MIu50Im2Ik1wHiXrAc+JB8lSrOI0T0MDky
         tsDn54f0eCIf5H0422l18u0ndOg7f1+Sae3a3QRJK35p7at1CwUTrfdH7DEZ+pMXkMek
         KrHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761671147; x=1762275947;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bf2z3SV0EQFH+NyJBVxm2kYHrg6mEHvbE757ZmlP2HM=;
        b=d+mY10jQJVOpkSNn71N7MDOn1zW90HdVj875kvo2tvEvF6AZiHnftjUkZsnPK4848v
         230bK1eJhZs8MRTBgh1DRxIjyAUzJjXVW4wyf+9NG+5YydBPetYyWn4A0u82/Ood0DyA
         NhDFiEGoTznN0+bclp686Q+VJsJ0uxmL6T4qrlSo+0xJP0vvc9T67/Fc2toCdTK/TD7G
         njyoxONUDwKFfvDLFgRLvVJ0K4wmfG3az1bxRIBFMp5iWJmxnVUSchw8M7pcrbCaXNsA
         voH4pP2GZACZ9Ixs1ir+nlFL1Mpw1DhiiQHo7i1YGf3D6aBTpc6gKo4Ud0clhrnhNR5h
         iOjg==
X-Forwarded-Encrypted: i=1; AJvYcCWZ5zDc2ErBVlQapuW0agp+g3qetp56pRRrWCvNccYnkV5FW5z6fMzTa5mQuyK2lnFcyXHZX436sDQTtXSKAy+s@lists.infradead.org
X-Gm-Message-State: AOJu0YwFFsgXKWQKcqEq9hQ7+PLiSDslbnOolEfL1slyHildPcqUzu+j
	mM+pav1qo9X/mk1msDIwPK0Vs556CNIAyUip3CAw6xmNtiHFgXt2RSl5q3oHQ7D6WKQ1L3vXVWK
	rUlcM4cnUs4ELCvfsGegQVc0UVB994U9I2N3WTiGl
X-Gm-Gg: ASbGncvMHJS7A8gEyKAY7gSsYP4LAtW+XSBCdq+w8bMrBg2M4qQiBZdw76Fn2zgoNvE
	HSyT9V1HOOtju6gnuMfbOXSVRhXVRg83UaVmXDQBkCLUjL6GUUAcHFwWfH6xMJE3Uz/TWZVNpxk
	yeeT91zUKqJ127Ez3QddLVTqH7EUlzR9pnRyhRqdl5WchyAqZfsiK8XyROLCat9Btyl6Haow0kG
	YvfKlaYhSgX9obsOcDCpzh46tiZqPqc4UdW8HHWhdITdfZmHoi//5MZnhWcUw==
X-Google-Smtp-Source: AGHT+IGnY2q/qW4n//fPnWZOK39ysZoDAJatQaFWpDai28muI3fakRyU9rfMXBXhQMs1gaa0OISkshUNrKoqf5k61r0=
X-Received: by 2002:a05:622a:1b26:b0:4b3:1617:e617 with SMTP id
 d75a77b69052e-4ed09f6156dmr6051941cf.11.1761671146391; Tue, 28 Oct 2025
 10:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20251027113943.1282568-1-tabba@google.com> <20251027113943.1282568-3-tabba@google.com>
 <86y0ovuwn8.wl-maz@kernel.org>
In-Reply-To: <86y0ovuwn8.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Tue, 28 Oct 2025 17:05:09 +0000
X-Gm-Features: AWmQ_bncQG7II35IK71jUNPHsUYcvYPp771U9qg-aPTyfjBogXSI_xu2S7Lw39E
Message-ID: <CA+EHjTzQBfqyxtzp+4UHyCFxoEfKG4RXLfLLz==Y6t6omfckfw@mail.gmail.com>
Subject: Re: [PATCH v1 2/4] KVM: arm64: Add compile-time type check for
 register in __vcpu_assign_sys_reg()
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, will@kernel.org, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_100548_258518_EBC8DC45 
X-CRM114-Status: GOOD (  33.29  )
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

On Tue, 28 Oct 2025 at 10:51, Marc Zyngier <maz@kernel.org> wrote:
>
> On Mon, 27 Oct 2025 11:39:41 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > The 'r' (register) and 'val' (value) parameters in
> > __vcpu_assign_sys_reg() can be easily transposed. The register ID is an
> > enum, whereas the value is a u64. This has led to bugs in the past, and
> > the risk was increased by the historically inconsistent parameter
> > ordering of the vcpu_write_sys_reg() function.
> >
> > To prevent this class of bugs, add a compile-time type compatibility check
> > to prevent the 'r' parameter from having a 'u64' type.
> >
> > This directly catches the erroneous transposition (passing the 'u64'
> > value as 'r') while remaining flexible, as it does not force 'r' to
> > be a specific enum type.
>
> I don't think that's enough. It is too easy to pass a u32 and
> accidentally bypass this check. I really think we should redefine the
> register identifiers to be a fixed value structure, something like
> this:
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 7501a2ee4dd44..18f65dbff2379 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -624,6 +624,12 @@ enum vcpu_sysreg {
>         NR_SYS_REGS     /* Nothing after this line! */
>  };
>
> +struct vcpu_sys_reg {
> +       enum vcpu_sysreg reg;
> +};
> +
> +static const struct vcpu_sys_reg vcpu_sys_reg_SCTLR_EL1 = { SCTLR_EL1 };
> +
>  struct kvm_sysreg_masks {
>         struct {
>                 u64     res0;
>
> and then enforce that whatever is interpreted as a system register is
> actually one of these structures (with some creative cpp wrapping to
> make it less awkward).
>
> In a way, this is similar to what we are doing for page table
> manipulation, where pte_t is a structure wrapping a u64.
>
> If we move to such construct, it becomes impossible to swap value and
> register, and we can stop worrying about that.
>
> Thoughts?

I looked into this some more, and the issue is that the number of
callers who refer to members of `enum vcpu_sysreg` is really big, as
well as the functions that access its value (in if or switch
statements). It can be done, but the amount of code churn would be
huge, that in practice I don't think would be practical.

Another check I thought of, which is more robust and would catch all
cases we have encountered in practice is something along the lines of:

BUILD_BUG_ON(!__builtin_types_compatible_p(typeof(reg), enum vcpu_sysreg) &&
    !__builtin_types_compatible_p(typeof(reg), int));

This ensures that you cannot pass anything other than an enum value,
or an int, as a sysreg. U32 and U64 would trigger a build error. I
tested this, no callers needed to be changed and it did catch the bug
I am trying to avoid. It's not as robust as wrapping in a struct, but
it doesn't result in any churn.

What do you think?
/fuad


>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

