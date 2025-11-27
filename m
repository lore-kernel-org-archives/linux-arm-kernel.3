Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7819D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:42:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPCyrID5c/tHs4/7/55sixEXvWOHWzu46qNqSyPa2CE=; b=kgPNObSt/1POro0LCL1fVm/DDI
	HHniOPQORunIWCuRhekQJ6knDVALQH4CwgagMuDgixqODkoPKIq1m6hILGTpEaUdsMm/5KeGHI3mn
	9owLMtYxQXSuo5DdXys6rw7RGs0MxQTA9A5yjBvJCNz6F1p00uvipPh6mrr7Du/QrTfTMP3ho5TRk
	53hK3XAKcwJBh1AW9X5+DJxJRnZHc93ZwxBbRgUrxbTHdGtrKnV31ekp2jYrZOjoAMWOcRiXxPVQ8
	5/3lZyxlOT/DIiaXzk4XHP/6JCgp3xVZpZoUxGuaasO/qL4mWBYBCih1Wu6sFgyuPA4wSd5yDI+i5
	rhHWrg/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdC9-0000000GnXT-3qjO;
	Thu, 27 Nov 2025 14:42:05 +0000
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdC7-0000000GnWd-1yG1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:42:04 +0000
Received: by mail-qt1-x82f.google.com with SMTP id d75a77b69052e-4edb8d6e98aso387491cf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 06:42:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764254521; x=1764859321; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=CPCyrID5c/tHs4/7/55sixEXvWOHWzu46qNqSyPa2CE=;
        b=cPVeG5mnBxpmwpAXCi1dtJAadPLA1sUMppiWXHgLebXJnAa8lVQ4Y/lqPts9yoKJHt
         pc0ZiBl8XjkH9BNi4tZ51ZkB8YMmTB/mmM7HpuIuabt0sWJ0oAoPNHNCHlFK0lQu9Cbk
         wcRNcVZbYKwkIBYIFCZO4gSwfOx89qxNyRb8emRepEZnkqfAvqxlkcFROnqF22OTdq9x
         NLx0x0Kk4mx2rLxZhTWmJNsDAOL9I4PPUkc2djs5mQfIAAUyRhfe3Ts7RrGOuX4R+6+3
         QXhPX7YlyfJ9loLPlgGsvreJCUCpalqG4xkNetc9604NaeV6yVFGP/cwLO8rSDuAS8bA
         IjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764254521; x=1764859321;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CPCyrID5c/tHs4/7/55sixEXvWOHWzu46qNqSyPa2CE=;
        b=gsxgJgO92AQqJflH/e2W7JtGJapbqaBBO7ecIUCM/Dyda8nHmGM4Wa3+JYqA6o8Ccw
         8WSsRXVF3ENwRLpXPof6IwZvPyeD26cncDdn56V0nlTAOL9HxUdYt521a00PtABnOF7r
         +v0xm4aBziG83V/s0e83JzDjXCxaQRawauNYA2gCBzzSpyh905mY3irmXRUDHSiE41QG
         09VNuZ2lyaN/YeZXWVECNqEaOxuXsZSXg8B6uvAzilfQPfmZdqX1QNXPDjUE33ZG9b9V
         9c9bLmk/MlGrOCey20jZ3cZ5mSmKY+4f6d5SMr6N32YFR1VxC3Wn/gbj9KZyHTQDHIvL
         60+A==
X-Forwarded-Encrypted: i=1; AJvYcCVuEOqz9/Io4ixK7Cky8qBY+nLvj89DVnHzl7qhM0lKz0XY5jNnmXdRC3sNIMDsyaE6op3NscYIJhsltX4s7Y0e@lists.infradead.org
X-Gm-Message-State: AOJu0YykmogtJVHUUVNu5lwXMEsa3se/QsWurPe/QGO4qJaTKbme6lg7
	hbCeOsUhB8/Z6Lp/5z1DGu0oHuYg7IRVmD75o99fH9OP85Bo4ze9NE9O2hb+t63ynWcX4Ez6MqL
	uU3aPoaUKVAEBfoC9cjNAJCAK0HMRqwTDniXbd9rQ5igAgcQsEagUJU7zu5E=
X-Gm-Gg: ASbGnctm/mZBnoxGge0UKySGxnp+Wgu1pUfKkOXMpLZ5y794gWV11UwfYRe3A2kH8YG
	NWqe8Lr8iUhjuA7OiQtJ5n/Iv/zbaQ5TImFN9ft5W2BpDz5JR5tLLBMLcmnEtdf9E2qyRDFbqYF
	of8R3Jo6UnM6tBhsEmqeegqfgt22z9Ngj7HNkL3YIvRu0zEtroZdvtdb0jxoOq4oBMorEEvQzl5
	Cl4lQdQOf9r2MkJ2cFUt4wo2/THBbTGqEQ9lgxBlNPLMpKYJ5eLFTcf0cFOUvr0IErjHuk=
X-Google-Smtp-Source: AGHT+IEvOReB+QeleLtSN0F2f5YKf6WqFvgp/w6xqbY/X02DfIQnSyuKWL8wM7Xf0Dv/gF9wW71/cQ4fRe46i351NDg=
X-Received: by 2002:a05:622a:54b:b0:4ee:40fb:d2e7 with SMTP id
 d75a77b69052e-4efd0cc5434mr4659811cf.20.1764254521051; Thu, 27 Nov 2025
 06:42:01 -0800 (PST)
MIME-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com> <20251127122210.4111702-5-tabba@google.com>
 <86345zr24c.wl-maz@kernel.org>
In-Reply-To: <86345zr24c.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Thu, 27 Nov 2025 14:41:24 +0000
X-Gm-Features: AWmQ_bmXs4f0B9KhCjDSmGn5zPBptXNndJQXBS9Qk5J98RtBGlIoKV9rr83Hjg4
Message-ID: <CA+EHjTz9fJ2892TNn-hy3aiQA6Cxj6xuFUBKQhpDOnsHkDtdwQ@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] arm64: Inject UNDEF when accessing MTE sysregs
 with MTE disabled
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_064203_559600_763367D0 
X-CRM114-Status: GOOD (  28.49  )
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

On Thu, 27 Nov 2025 at 14:17, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 27 Nov 2025 12:22:09 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > When MTE hardware is present but disabled via software (arm64.nomte or
> > CONFIG_ARM64_MTE=n), HCR_EL2.ATA is cleared to prevent use of MTE
> > instructions. However, this alone doesn't fully emulate hardware that
> > lacks MTE support.
> >
> > With HCR_EL2.ATA cleared, accesses to certain MTE system registers trap
> > to EL2 with exception class ESR_ELx_EC_SYS64. To faithfully emulate
> > hardware without MTE (where such accesses would cause an Undefined
> > Instruction exception), inject UNDEF into the host.
> >
> > Signed-off-by: Fuad Tabba <tabba@google.com>
> > ---
> >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 44 ++++++++++++++++++++++++++++++
> >  1 file changed, 44 insertions(+)
> >
> > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > index 29430c031095..f542e4c17156 100644
> > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > @@ -686,6 +686,46 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
> >       kvm_skip_host_instr();
> >  }
> >
> > +static void inject_undef64(void)
> > +{
> > +     unsigned long sctlr, vbar, old, new;
> > +     u64 offset, esr;
> > +
> > +     vbar = read_sysreg_el1(SYS_VBAR);
> > +     sctlr = read_sysreg_el1(SYS_SCTLR);
> > +     old = read_sysreg_el2(SYS_SPSR);
> > +     new = get_except64_cpsr(old, system_supports_mte(), sctlr, PSR_MODE_EL1h);
> > +     offset = get_except64_offset(old, PSR_MODE_EL1h, except_type_sync);
> > +     esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
> > +
> > +     write_sysreg_el1(esr, SYS_ESR);
> > +     write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > +     write_sysreg_el1(old, SYS_SPSR);
> > +     write_sysreg_el2(vbar + offset, SYS_ELR);
> > +     write_sysreg_el2(new, SYS_SPSR);
> > +}
> > +
> > +static bool handle_host_mte(u64 esr)
> > +{
> > +     /* If we're here for any reason other than MTE, then it's a bug. */
> > +
> > +     if (read_sysreg(HCR_EL2) & HCR_ATA)
> > +             return false;
> > +
> > +     switch (esr_sys64_to_sysreg(esr)) {
> > +     case SYS_RGSR_EL1:
> > +     case SYS_GCR_EL1:
> > +     case SYS_TFSR_EL1:
> > +     case SYS_TFSRE0_EL1:
>
> How about other things, such as DC GVA? Don't you need to trap and
> UNDEF it (which has the side effect of also trapping DC ZVA)?
>
> Same question for all the DC {C,I,CI}GVA{C,P} instructions.

As far as I could tell, none of these are trapped by ATA. The spec
says that in the absence of MTE, their behavior is undefined --- which
is the same for the ones I'm actually handling here...

The reasons I've only handled these is that, when booting a system
with a misadvertised MTE, the kernel accesses these registers, and
injecting an UNDEF resulted in a nicer failure mode.

What do you suggest, drop this patch (and the one before it), since
trying to access MTE is UNDEF, and the kernel that does it is just
shooting itself in the foot (no security implications)? Or edit the
commit message to make it clear that this is best effort, based on
what ATA traps?

Cheers,
/fuad

>
> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

