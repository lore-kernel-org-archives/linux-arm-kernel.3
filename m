Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8222BD2AB1D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Oct 2024 10:30:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2jDWl88eqbUJdTnd/iT225VsyWB5sNzS8ii9Q3FUU+E=; b=3NyvlKt7qOSa7HWM+B+w+IYYYx
	PL/P/ayr4PLTtlIRXcy3SCZQeDTQ9+LeP1CwbEQIJfinbTflfw4ayoPRqu4tqkigl/baqNaZ+j+Aq
	U5qFdPr/O/xK8YbWVfHXC53RHV8od1tPahskwc+GK0VBUOC007LnZxUYFaLDisyP1zE09SbR4Vj4c
	3fnSrBLXdKonivGnPRPGHfVTQJtfKIIYMAlfLQzE9/8DFzq0QRFEidDV4rcLYAyaynJEXeEbr9mbC
	2zuj4Qz/gLrCi/sxXWSD0IKVZ+FQsDOo5OpxN7e4sg0MCPL1Ta5RhASPh2Ee5NZ31yQ1iN280LNek
	ef5Rtxww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5jUC-0000000E2Rn-3g20;
	Tue, 29 Oct 2024 10:30:04 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5j1k-0000000DxrU-3bEi
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Oct 2024 10:00:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 20A6FA42763
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 09:58:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4AB7C4CECD
	for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 10:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730196039;
	bh=vIPXjsUqI6HisFaD5e3T1+6vU/Ckcl0BQpGw086P6gw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=bkwWNBGK3ybEgtstc+fsNOBpqY398By4SOfObp8/pF5OFN9peYNyjSJDE8vocWpdM
	 64VUzPvWqBNqPFpv9DSf8hZULRqESYmdONZ6Zh0lhki68STxJrB7Tso6Ail17qU5Ym
	 yWs776uZHtnsufpH8GOj6d3v9xS66V31o9EVoZSD2KkHgdQ73L00fg10aMuPbDcpmu
	 zcjyekz+6vC1LlQBD7OrEVpifLGGH2R4y4IxR+EmxByUS98fJiZfAqaG917zls13Hb
	 uFQBrfRWbXyD2T9Z3q5a7u9MyGcMcNqQtclsb42Zzw0cwtyEFbn3XFOt/P+YGJMCOb
	 vUAgUg7yKqN9g==
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2fb51f39394so51786581fa.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Oct 2024 03:00:39 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWlY2aHZfAfSuFvsQ4TqtQDMfzfqoqJla+eGg4WZ8kkcrUKpkDZqmfVupwfd21xjwEPfeY1PrKuouJ+Fr04OTuZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyTGZckBQfL5ucW7GqEpqF7CIuhS5IvpOdpOATlOul/Bv4ahffr
	IIxojbhEmjaYy2zMM+3QSlrNq/OK0gIh2cuemjHA5H3IKi85v4T/dfdCssh5Lh8HKQnhSHm/Bv3
	nB3d40kibgDJE2dV7TbYGsv3bhkc=
X-Google-Smtp-Source: AGHT+IEv2f7Ljf5pVqXirJwrfDfhMrJaZsnX3FjHVnAe45g6dbvPnMbZ194jmmjiIFlWMdevuzci9mGXdnuc0ENnVSs=
X-Received: by 2002:a05:651c:2209:b0:2ef:17f7:6e1d with SMTP id
 38308e7fff4ca-2fcbdf689acmr49293801fa.4.1730196036055; Tue, 29 Oct 2024
 03:00:36 -0700 (PDT)
MIME-Version: 1.0
References: <mb61p4j4wwlap.fsf@kernel.org> <86ed4031zh.wl-maz@kernel.org>
 <CAMj1kXEX2TLdYCn3C-AXhfhjOe6cuzOmd0h5MbgXnzi7Q94T3w@mail.gmail.com> <86bjz32q2q.wl-maz@kernel.org>
In-Reply-To: <86bjz32q2q.wl-maz@kernel.org>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 29 Oct 2024 11:00:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFLRruq1gv+oiSz_LrfCt3j5ftv78prkxKV62tCXe0KVg@mail.gmail.com>
Message-ID: <CAMj1kXFLRruq1gv+oiSz_LrfCt3j5ftv78prkxKV62tCXe0KVg@mail.gmail.com>
Subject: Re: Supporting KVM_GUESTDBG_BLOCKIRQ or something similar on ARM64
To: Marc Zyngier <maz@kernel.org>
Cc: puranjay@kernel.org, Arnd Bergmann <arnd@arndb.de>, Arnd Bergmann <arnd@kernel.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, kvmarm@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, Sumit Garg <sumit.garg@linaro.org>, 
	puranjay12@gmail.com, Oliver Upton <oliver.upton@linux.dev>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Joey Gouly <joey.gouly@arm.com>, 
	Zenghui Yu <zenghui.yu@linux.dev>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241029_030041_047649_122035AC 
X-CRM114-Status: GOOD (  32.26  )
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

On Tue, 29 Oct 2024 at 10:53, Marc Zyngier <maz@kernel.org> wrote:
>
> On Tue, 29 Oct 2024 08:52:41 +0000,
> Ard Biesheuvel <ardb@kernel.org> wrote:
> >
> > On Mon, 28 Oct 2024 at 12:23, Marc Zyngier <maz@kernel.org> wrote:
> > >
> > > > Let's start a discussion about what needs to be done to support this on
> > > > arm64.
> > >
> > > A good start would be to define the semantics of such a flag:
> > >
> > > - what should it affect? the vcpu you are single-stepping? all vcpu?
> > >
> > > - should userspace to know that interrupts are pending?
> > >
> > > - should this result in any effect on the guest's view of time?
> > >
> > > - what of interactions on the rest of the system (such as devices)?
> > >
> >
> > Sorry to give a handwavy answer here, but approaching this from a
> > usability PoV (like what Puranjay is doing), it is really about
> > adhering to the principle of least surprise for the user.
> >
> > So in that sense, it is not really about blocking IRQs at all, as long
> > as we step over them rather than into them. How that is achieved is
> > not that relevant from the user PoV, and maybe KVM_GUESTDBG_BLOCKIRQ
> > is not the right solution for ARM at all.
>
> I definitely sympathise with the goal, but there is no simple way to
> let interrupts through while stepping (which is what your "step over"
> implies):
>
> - the hypervisor (in general) doesn't interact with the guest delivery
>   and handling of interrupts -- this is either very opaque (list
>   registers) or completely invisible (direct injection)
>
> - replacing the step with a breakpoint after the stepped instruction
>   requires us to decode the guest instructions to handle branching
>   effects
>

Yeah, and we still want to take non-IRQ/FIQ exceptions, so this does
not seem feasible to me.

> One possible mechanism would be to:
>
> - while stepping, add breakpoints to the interrupt vectors for the EL
>   we are stepping (3 breakpoints for any of the 4 possible exception
>   groups),
>
> - when any interrupt breakpoint hits, clear all 3, place a breakpoint
>   on the instruction that was about to be single-stepped (pointed to
>   by SPSR)
>
> - run to completion, until the breakpoint hits
>
> - disable the breakpoint, reinstall the previous 3 interrupt
>   breakpoints
>
> - single-step, rinse, repeat
>
> But then I'm asking myself the question: why is this KVM's job? It
> seems to me that this is what an external debugger would do when
> interacting with HW on bare metal.
>
> So can we implement this as part of the debugger's state machine?
>

Which debugger is that? The GDB stub in QEMU?

Setting a one-shot breakpoint on the address in SPSR when taking an
IRQ exception seems like a reasonable approach to me.

