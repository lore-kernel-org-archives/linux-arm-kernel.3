Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AFEED116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:54:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rDvZWMaEJ7qiFYzf5QHvGpUfV6X47c66PVJLPnZe19E=; b=KbS8xLuUNDRmgPh4qa4J4ifmRj
	nxuwPR85U7ZKzSr+WJxIOe9ibZBp5CI/ddDF1v19N5tnDhHrADtl/u6fjrsishOyHqWA9EH+aJcro
	jJrSQ5P5pqyzTO151RrkODIenu4DtSkyzc3TAjLNoNGFHhKMypyxm05vSWxmJOMaQ339JtGRbwCZB
	1aAAg4uV4HperO+V4IMeJ89RRjy61OOHkeYU2h7mvzUdfqni9UwezuKAoFckB0+2udh2MFKgjSW1K
	5rL7hCCH2O3qsdl8sOnABPdQppNrASNouxIOr5VztbmQq2GyjOi8hNOyC5QUKg5DFAqHa9wcFVC3b
	rQqaKltQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOuF5-00000000CKJ-2lry;
	Fri, 28 Nov 2025 08:54:15 +0000
Received: from mail-qt1-x832.google.com ([2607:f8b0:4864:20::832])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOuF2-00000000CJZ-1m6W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 08:54:13 +0000
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-4ee243b98caso429801cf.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 00:54:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764320051; x=1764924851; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rDvZWMaEJ7qiFYzf5QHvGpUfV6X47c66PVJLPnZe19E=;
        b=TKOcXsh0Hm8y9iuOQ/1TcwzFGqdDh5JMSAbYuNd7wGDJ0dwHFu6yKgFvagU42NAj71
         JrhcgnFcUwdstlOodRLqKQRmigZux9L9liQZ5Z9Y0p8MEwU+zP1f6nCoPNJsNjzmrV/n
         LT6bTXk3pnMj7L0S8zxBLouQAHDNQZj4hPsGId2TO9r/9C1lt4Xg0ZnhCjFf+lhUxrSx
         yTKDE4dV9vwcBuuey5U9hARoz6RdpB/A5OSvjrhXBuzygDu/il1kTtz1WuPLdHH0H8vX
         BIj+jzr2UT71pTUQdUVjwRqJBUZeQFqEmi5fBXwFZ5Kuab1STxNBlg81Pa633Ce82FCZ
         klgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764320051; x=1764924851;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rDvZWMaEJ7qiFYzf5QHvGpUfV6X47c66PVJLPnZe19E=;
        b=SuP9DCJAYQJV2zA7a1tkjnuComGt5z9FFKXILWpthDddYQrdjw5A2AGrro/Yib16xg
         mfXYfrMhFCSwl3GbFgAxIZiBRxqoQpsy/Kk2pF2UpIlxtukKKevY3Db4rQj6Z9afXmhO
         IFDTXodwetyDzSSKSrHX7NHaxKBaEHWPxDshxIMzLcmkICBKfLZZYP9ktaDtauxTv6zm
         q7G/zFHEnI4CWjtTZS1yonG2xCFkkiHzxh7iCgq1MU/FrI73dLavehwEvjhas0BZOySl
         GkoYoMCmnOlT0eSXZsxNqD2vBGPSx2IZDUdDLJ8q0KMeg64w50nxHFXSf4F3//fLshle
         feZA==
X-Forwarded-Encrypted: i=1; AJvYcCUEmtLGr6j1/5J+ZLujXwAHHSEHE0m34AOstuIO+IfWsGuwjQA2PJ+7kkWqqwk0XKVWpIurbPuqwmAyzIfapNcK@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm/nvo2zvSCTa286Mj4En++8G5V4PKUrf87NXo1bErY9LXkKuZ
	+X+r4O3ZiJi06JJgfcclZUuGC2v0hIS/dxnO2tDm3Be4wEij7JrhCNPBfFEERby4i3hjAUIXJo7
	e/AWL5BSYHUQrGuW5kF3lYngt9IQq+s4LkZnQvHdZQRni335pj25oWujs
X-Gm-Gg: ASbGnctR3iVQVFDkiKb4YbuyDrCDij/auWjvcMcv2uMm9wzVKtfrYAKhpbNhC3wBLqp
	j8bI4rUd2FWazY8MAVCaxUyn3qT9fwu2M6Z/zJ3fW9r+FU9JKJX+e6eDz7zB8qwm6RJ6NHMRkIU
	4lHn8cme2DinOCqfK/zcckwCgPT7snszBEmSM6PdG7sjxWg8hsLiChdKDWA7qkLQ60zLSYO5RJg
	4EWdsr30ArJYkV2xcWeRZVCFXd7KHnSVx2tUzDZUV/ym894INUPKiW7zmYZQSALFP1uI4nqjRgJ
	tUyYGA==
X-Google-Smtp-Source: AGHT+IHPym1ODtpAi9CMgE0hTp4o0fYMzlmczHF3vLdk+9RNCcByYNv22XLMdnl+3/yYSpI5Pmaxpz+/OUvckY3j+Sk=
X-Received: by 2002:a05:622a:198e:b0:4b7:9b06:ca9f with SMTP id
 d75a77b69052e-4efd0c63439mr8008681cf.2.1764320050941; Fri, 28 Nov 2025
 00:54:10 -0800 (PST)
MIME-Version: 1.0
References: <20251127122210.4111702-1-tabba@google.com> <20251127122210.4111702-5-tabba@google.com>
 <86345zr24c.wl-maz@kernel.org> <CA+EHjTz9fJ2892TNn-hy3aiQA6Cxj6xuFUBKQhpDOnsHkDtdwQ@mail.gmail.com>
 <86wm3apmxu.wl-maz@kernel.org>
In-Reply-To: <86wm3apmxu.wl-maz@kernel.org>
From: Fuad Tabba <tabba@google.com>
Date: Fri, 28 Nov 2025 08:53:34 +0000
X-Gm-Features: AWmQ_bkR-70oLk2BukczwycCfDcP-ZO9JBqbtZx5xbkCA_MuBEHdD2g3hg0iJ9g
Message-ID: <CA+EHjTzg=BQNKDDgbGjSOQ7GuRW1JAoyXNygHTYPba5g7_0Fgw@mail.gmail.com>
Subject: Re: [PATCH v1 4/5] arm64: Inject UNDEF when accessing MTE sysregs
 with MTE disabled
To: Marc Zyngier <maz@kernel.org>
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, catalin.marinas@arm.com, will@kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_005412_479359_5BD133E6 
X-CRM114-Status: GOOD (  44.73  )
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

On Fri, 28 Nov 2025 at 08:43, Marc Zyngier <maz@kernel.org> wrote:
>
> On Thu, 27 Nov 2025 14:41:24 +0000,
> Fuad Tabba <tabba@google.com> wrote:
> >
> > Hi Marc,
> >
> > On Thu, 27 Nov 2025 at 14:17, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > On Thu, 27 Nov 2025 12:22:09 +0000,
> > > Fuad Tabba <tabba@google.com> wrote:
> > > >
> > > > When MTE hardware is present but disabled via software (arm64.nomte or
> > > > CONFIG_ARM64_MTE=n), HCR_EL2.ATA is cleared to prevent use of MTE
> > > > instructions. However, this alone doesn't fully emulate hardware that
> > > > lacks MTE support.
> > > >
> > > > With HCR_EL2.ATA cleared, accesses to certain MTE system registers trap
> > > > to EL2 with exception class ESR_ELx_EC_SYS64. To faithfully emulate
> > > > hardware without MTE (where such accesses would cause an Undefined
> > > > Instruction exception), inject UNDEF into the host.
> > > >
> > > > Signed-off-by: Fuad Tabba <tabba@google.com>
> > > > ---
> > > >  arch/arm64/kvm/hyp/nvhe/hyp-main.c | 44 ++++++++++++++++++++++++++++++
> > > >  1 file changed, 44 insertions(+)
> > > >
> > > > diff --git a/arch/arm64/kvm/hyp/nvhe/hyp-main.c b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > index 29430c031095..f542e4c17156 100644
> > > > --- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > +++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
> > > > @@ -686,6 +686,46 @@ static void handle_host_smc(struct kvm_cpu_context *host_ctxt)
> > > >       kvm_skip_host_instr();
> > > >  }
> > > >
> > > > +static void inject_undef64(void)
> > > > +{
> > > > +     unsigned long sctlr, vbar, old, new;
> > > > +     u64 offset, esr;
> > > > +
> > > > +     vbar = read_sysreg_el1(SYS_VBAR);
> > > > +     sctlr = read_sysreg_el1(SYS_SCTLR);
> > > > +     old = read_sysreg_el2(SYS_SPSR);
> > > > +     new = get_except64_cpsr(old, system_supports_mte(), sctlr, PSR_MODE_EL1h);
> > > > +     offset = get_except64_offset(old, PSR_MODE_EL1h, except_type_sync);
> > > > +     esr = (ESR_ELx_EC_UNKNOWN << ESR_ELx_EC_SHIFT) | ESR_ELx_IL;
> > > > +
> > > > +     write_sysreg_el1(esr, SYS_ESR);
> > > > +     write_sysreg_el1(read_sysreg_el2(SYS_ELR), SYS_ELR);
> > > > +     write_sysreg_el1(old, SYS_SPSR);
> > > > +     write_sysreg_el2(vbar + offset, SYS_ELR);
> > > > +     write_sysreg_el2(new, SYS_SPSR);
> > > > +}
> > > > +
> > > > +static bool handle_host_mte(u64 esr)
> > > > +{
> > > > +     /* If we're here for any reason other than MTE, then it's a bug. */
> > > > +
> > > > +     if (read_sysreg(HCR_EL2) & HCR_ATA)
> > > > +             return false;
> > > > +
> > > > +     switch (esr_sys64_to_sysreg(esr)) {
> > > > +     case SYS_RGSR_EL1:
> > > > +     case SYS_GCR_EL1:
> > > > +     case SYS_TFSR_EL1:
> > > > +     case SYS_TFSRE0_EL1:
> > >
> > > How about other things, such as DC GVA? Don't you need to trap and
> > > UNDEF it (which has the side effect of also trapping DC ZVA)?
> > >
> > > Same question for all the DC {C,I,CI}GVA{C,P} instructions.
> >
> > As far as I could tell, none of these are trapped by ATA. The spec
> > says that in the absence of MTE, their behavior is undefined --- which
> > is the same for the ones I'm actually handling here...
> >
> > The reasons I've only handled these is that, when booting a system
> > with a misadvertised MTE, the kernel accesses these registers, and
> > injecting an UNDEF resulted in a nicer failure mode.
>
> But it all comes down to *why* is MTE disabled. Is it because the user
> cannot be arsed with MTE's abysmal^Wstellar performance? Or because
> this is a memory corruption vector on a misconfigured platform?
>
> > What do you suggest, drop this patch (and the one before it), since
> > trying to access MTE is UNDEF, and the kernel that does it is just
> > shooting itself in the foot (no security implications)? Or edit the
> > commit message to make it clear that this is best effort, based on
> > what ATA traps?
>
> No, what I am simply pointing out that that there is more to MTE than
> what gets trapped by ATA, and my hunch is that when MTE is disabled on
> machine that actually has it, it is because something is deeply broken
> with tag management (I have one such machine).
>
> So depending which side of the problem you're on, this could be either
> perfectly valid, or just missing the point.

I see your point. Of course, my main concern is security and
protecting the guest and the hypervisor from a malicious host (and of
course the other way around, but that's the case in non-protected mode
as well). When MTE is disabled, I think most (if not all) MTE-related
instructions are UNDEFINED.

As far as I know, for the devices I've run into, the reason to disable
MTE has been either performance or lack of support. So for that case,
I think that this solution is enough. On the other hand, if the
hardware is broken, then we can try to mitigate as much as possible,
but I think that at the end there is so much we can do.

So for now, I would think that this is enough. If we encounter cases
that require more hardening, we could add that later.

What do you think?
/fuad

> Thanks,
>
>         M.
>
> --
> Without deviation from the norm, progress is not possible.

