Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55096CD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 22:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JuphiYUJfrLeym0MaEZq4JVcplgaKtFBRjbJ+g8kmg=; b=DkSg/mKYDGi7P3jg6Ey5mPHEtx
	nWWkRRoIfURVinhS0xUb4iOQkSjkmPr/IiZHfpXIygXxLGe8kzkD6MvVoCSVZ/9SxvKN+f7HXBJyF
	9n6vhI7z5kEunBO3i8c2qVd0v7XSVXwuoGDUSYzbwB41ZCpMv87YuMp6EEyHeMlcK200e12jzYi9T
	rPW0Bzo+2bBnrCfswoSXbC8eqi7aWpY4a9iQXfxnbk9+TRLfl6VReK5NMNL3qmMDUZfogE3j8fD+p
	3NkFMC83JAxUlSvxT7eRObezGQ4SfeMQ7oqyfqb58R5MBXBmusXru3rD9drgknL68Mbwrq0gsWYXl
	6yCuy/Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6f1-0000000H7Y2-0Kyl;
	Mon, 18 May 2026 22:42:07 +0000
Received: from mail-vs1-xe29.google.com ([2607:f8b0:4864:20::e29])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP6es-0000000H7Vt-3ASG
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 22:42:00 +0000
Received: by mail-vs1-xe29.google.com with SMTP id ada2fe7eead31-632e479586aso2105885137.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 15:41:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779144117; cv=none;
        d=google.com; s=arc-20240605;
        b=OW662GQGGZv+/7jqzEGs2TRyEwk7yH9KOVWU1TxXwo1g2u1wjE2scXZ/S1oc+8Bpg8
         oNEKAH6IvsLBuh9dr5Wo7gIDsmFraoD6x0HcjShEc3V0kBxahVKzvf6agLrdQG78SC0N
         P0IMEnLecDUcyARynHVrVBAwRHB2cAbG3Jcj9mIx/q/4yFhi7hrxFApdg9/+b1TNHWP9
         Ll4wp2S0QGuJf47LeaO7VB+RrDpteeIw+/9oc5mIRwmZ7jSafGclYLa72razh0XmKhoT
         bnxIO7DlcOeSA4yplvxZjT0b7iKyMTUJxm/n8Y3YQUYaCtNCQJM7WWmpppBHnTb32lPQ
         K64w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2JuphiYUJfrLeym0MaEZq4JVcplgaKtFBRjbJ+g8kmg=;
        fh=HziSBJtpI/D2JHy65xw6jJhR38/Z/38g0ZoPQt1sP4g=;
        b=YS1fhcU5irfLaVY2pWFPSPBYD9lT854X6zkWYSThpv+8XwEePn2JoV9SnaQAsVKdja
         BpOOJL2nyKP1T+HXJyKHWusRmMvFRKQdVkmfOdOKWpGweQJVF8pG6DQ3wG5NB7tt4bq5
         BflRtXsBPn8IDAdOKzv/E1peUAEyV2R/BP00g3KqENmC2+5hjHeOzn4k9j3+Hjuj0T2j
         BoFUv7SWdVK0glRPL4vJmGv9bj2LGcYT9FFSPqLPQuM4+vPa5gCgJAWYZJY28poRP5b4
         dB0V0iiDCW8EhlvdSSfY9OvdsNkhfe5JA3XzduYh2BCBHf6Ad9Hw0SCGBDnzVbv90qT2
         ztLw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779144117; x=1779748917; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2JuphiYUJfrLeym0MaEZq4JVcplgaKtFBRjbJ+g8kmg=;
        b=FdSvaTo7TfO12dGtOs9a4tcBP0xdAltgKOIQpVusnAlhPJq2ahoT06OLr4kq9ucz7a
         jDaOpQTEFxpMP+aLCEJ7ysaHMM+G/1F+sTZXSpTQDx+dxX3t1H0zud+6BY5Mspwypll4
         vjVptJzxmOASTo6MbuNhy2KSZD+cKeTYIZC03f5FXQIkPlx2X8s8cpYOEZud1lolFAKG
         imifoxTPepCmCgeNX4wWhlI40AZLj1DmMBIp+MB6PXDF/MDkm02bWoaObyxz9Vj0Z5Sb
         8xmhjn/SpSA5doLF6pPhAizRW8ivDT5myES4ON8mZKIipRGsUQME5ni1gbBraIPY5SW6
         xNpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779144117; x=1779748917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2JuphiYUJfrLeym0MaEZq4JVcplgaKtFBRjbJ+g8kmg=;
        b=fTIA2gbk/DTQstpwaYJJT0IyVklBu9c5COxo3xOHWc4mxre6jDZJiSASol9RqD1x5J
         wmnT3b+6yKoEFTRaZBTdL48xfjo4FYNNtL4Pu4C5B9ezsm3EFrSoXHxQDR27waBl0IfI
         I6kgRcepgKPYuoCzVrfxye8LdnxCsvOBvK4E1pDk22uidij5YzJ3NESM8gGOD+0xqLon
         Qc3sOKuSOb+Gz+T4I4ZsxD3jfiosl8IHwy4OKjANAFjKWCW+2pdzEQBR+m9YNR4VQ3sI
         hEFATwC+BB97po3aRS2h67E8ustUege+lGjmeyeOImak1J2iOUhWgc7UQzV3VPu/L76z
         M7gg==
X-Forwarded-Encrypted: i=1; AFNElJ+R2Ot/LtV2ScMsW+Y9Fnc7H+9hhzRYWlTt0d532aGC5mfBpHtsbJengdOkO90pPg2Ralhgzw1nCHR4C6TquPC8@lists.infradead.org
X-Gm-Message-State: AOJu0YytujkUf/P/gU+iDUVoSQ4XlBHb3X+HtFNoQ+TjBMpZS2IuEEZm
	sGe5PFZ6S/Xai9oBc2FbpAP5pcgedaKVlkKL2e3DBmus4SCvc9SoqARUok0SFAaf5S57V6tvoSv
	ZtFUGnJxQe3x49He4ZuEHpqn+kScmJgCnH7zaGeLM
X-Gm-Gg: Acq92OEQngS8VlNJyyA1qMr2gu68UZHGKcNtMa6qwXl7YnSXv2Q42ZzTOY0FLjwLS0m
	j7aysnV2XbAqIiRrxBnFrtsdyEgC+szsreNEkxi541bbACzCnPmQImK0oktDZLbNdsuCHgRIiba
	XEmihtkFvikJflSnriZKgZWHf24LMJHDfZ7vSICrpnpzRjJ5xHSPRG7HHHwEBvHnHUAAP470q5j
	WvWl9U0z8TgT7HMHakuKixvk0oMkfEK4mYsaAGxX/wOY3ZLnCAporg2z+u9hsUhLhv0/CUCSFQQ
	5ZegxH3kWRTL2smrfN4MTnVfmUcsI7dBMQ6XRcmR+2fCYiHU
X-Received: by 2002:a05:6102:1487:b0:610:6e69:5235 with SMTP id
 ada2fe7eead31-63a3f68e785mr9174240137.22.1779144116807; Mon, 18 May 2026
 15:41:56 -0700 (PDT)
MIME-Version: 1.0
References: <20260428183643.3796063-1-dylanbhatch@google.com>
 <20260428183643.3796063-4-dylanbhatch@google.com> <afIjFLbUrdxWA6eR@J2N7QTR9R3.cambridge.arm.com>
 <CADBMgpxBeYUdA5X8BPgkgz=KQyN=NQ760bXygwXfvVRScNzgbA@mail.gmail.com> <agbgMb6jrgiFFHRX@J2N7QTR9R3>
In-Reply-To: <agbgMb6jrgiFFHRX@J2N7QTR9R3>
From: Dylan Hatch <dylanbhatch@google.com>
Date: Mon, 18 May 2026 15:41:44 -0700
X-Gm-Features: AVHnY4JsJwEnbtNc1imGWs0_F9EdyMGaAqb0DMHOauZ1DW1pqAw4WpJ61m0d9WE
Message-ID: <CADBMgpzppDZudqGZk94HrBB6yP2ZZeXVE0bkM1dJkZo0rVGCBQ@mail.gmail.com>
Subject: Re: [PATCH v5 3/8] arm64: entry: add unwind info for various kernel entries
To: Mark Rutland <mark.rutland@arm.com>
Cc: Roman Gushchin <roman.gushchin@linux.dev>, Weinan Liu <wnliu@google.com>, 
	Will Deacon <will@kernel.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Indu Bhagat <ibhagatgnu@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Steven Rostedt <rostedt@goodmis.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Jiri Kosina <jikos@kernel.org>, Jens Remus <jremus@linux.ibm.com>, 
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>, Puranjay Mohan <puranjay@kernel.org>, 
	Song Liu <song@kernel.org>, joe.lawrence@redhat.com, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_154158_847140_FA39FA97 
X-CRM114-Status: GOOD (  54.06  )
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

On Fri, May 15, 2026 at 1:58=E2=80=AFAM Mark Rutland <mark.rutland@arm.com>=
 wrote:
>
> On Thu, May 14, 2026 at 08:30:43PM -0700, Dylan Hatch wrote:
> > On Wed, Apr 29, 2026 at 8:26=E2=80=AFAM Mark Rutland <mark.rutland@arm.=
com> wrote:
> > > On Tue, Apr 28, 2026 at 06:36:38PM +0000, Dylan Hatch wrote:
> > > > From: Weinan Liu <wnliu@google.com>
> > > >
> > > > DWARF CFI (Call Frame Information) specifies how to recover the ret=
urn
> > > > address and callee-saved registers at each PC in a given function.
> > > > Compilers are able to generate the CFI annotations when they compil=
e
> > > > the code to assembly language. For handcrafted assembly, we need to
> > > > annotate them by hand.
> > > >
> > > > Annotate minimal CFI to enable stacktracing using SFrame for kernel
> > > > exception entries through el1*_64_*() paths
> > >
> > > I thought we were only consuming SFrame when unwinding an exeption
> > > boundary?
> > >
> > > We shouldn't be taking exceptions _from_ the entry assembly functions
> > > unless something has gone horribly wrong, and so I don't see why we'd
> > > need CFI entries for the entry assembly functions.
> > >
> > > Am I missing some reason we need CFI entries for the entry assembly
> > > functions? I strongly suspect it is not necessary to add these, and I=
'd
> > > prefer to omit them.
> >
> > I believe the el1 entry functions are called in an exception, and are
> > called before call_on_irq_stack.
>
> Yes, but I don't think that matters. See below for more details.
>
> > Example stacktrace segment:
> >
> > [  262.119564]  handle_percpu_devid_irq+0xb4/0x348
> > [  262.119913]  handle_irq_desc+0x3c/0x68
> > [  262.120196]  generic_handle_domain_irq+0x20/0x40
> > [  262.120678]  gic_handle_irq+0x48/0xe0
> > [  262.121005]  call_on_irq_stack+0x30/0x48
> > [  262.121412]  do_interrupt_handler+0x88/0xa0
> > [  262.121779]  el1_interrupt+0x38/0x58
> > [  262.122089]  el1h_64_irq_handler+0x18/0x30
> > [  262.122617]  el1h_64_irq+0x6c/0x70
>
> The segment immediately above can be unwound using FP, as frame records
> were created consistently, and there are no exception boundaries. No CFI
> needed.

Ah right -- with the logic in stacktrace.c changed to use SFrame only
when recovering the next frame from a pt_regs, the FP alone is
sufficient if we know these entry functions won't take an exception.
This patch was originally implemented with an SFrame-only unwinder in
mind, so my mental model still hadn't back-propagated the new logic to
this patch :)

>
> It's legitimate to take an exception from parts of call_on_irq_stack(),
> so it makes sense for that to have CFI, but for the specific unwind
> segment above, CFI isn't necessary.
>
> Everything in the stacktrace segment above was executed *after* HW took
> the exception.
>
> << EXCEPTION BOUNDARY HERE >>
>
> Everything in the stacktrace segment(s) below was executed *before* HW
> took the exception.
>
> The unwinder knows that it has crossed this exception boundary by virtue
> of finding a FRAME_META_TYPE_PT_REGS frame record.
>
> > [  262.123159]  _raw_spin_unlock_irq+0x10/0x60 (P)
>
> The unwinder knows that the value of pt_regs::pc was *definitely* the PC
> at the time the exception was taken, so that entry is reliable. No CFI
> needed.
>
> > [  262.123720]  __filemap_add_folio+0x200/0x580 (L)
>
> The unwinder doesn't know whether the LR should be used, and needs CFI
> to determine that.
>
> After this point, an FP unwind can be used until we encounter the next
> exception boundary.

Right, and this is what is implemented in the final patch of this series.

>
> > [  262.124145]  filemap_add_folio+0xec/0x300
> > [  262.124674]  page_cache_ra_unbounded+0x128/0x368
> > [  262.125338]  do_page_cache_ra+0x70/0x98
> > [  262.125875]  page_cache_ra_order+0x460/0x4e0
>
> The segment immediately above can be unwound using FP. No CFI needed.
>
> > Here, el1h_64_irq is the last function that appears in the exception
> > stack before _raw_spin_unlock_irq and __filemap_add_folio are
> > recovered from the saved PC and LR, respectively. So we therefore need
> > the CFI annotations in order to unwind through the full exception
> > boundary.
> >
> > Is my interpretation here correct?
>
> Given you say "full exception boundary" here, I think we might be using
> the term "exception boundary" to mean different things.
>
> As per the example above, I'm using "exception boundary" to mean the a
> point between two entries in the stacktrace where HW took an exception.
>
> Did my comments on the example help?

I admit I may have been using the term "exception boundary" with a
vague definition, which was partly the source of my confusion. Thanks
for the example, it did help.

>
> > > > and irq entries through call_on_irq_stack()
> > >
> > > Needing some sort of unwind annotations for call_on_irq_stack() makes
> > > sense to me, but don't we need something for other assembly functions
> > > too?
> > >
> > > We can interrupt things like memset(); I assume we'll treat those as
> > > unreliable until annotated?
> >
> > While looking into adding these annotations, I noticed a pattern where
> > a sibling call is made to a local function:
> >
> > SYM_FUNC_START(__pi_memset)
> > alternative_if_not ARM64_HAS_MOPS
> >         b       __pi_memset_generic
> > alternative_else_nop_endif
> >
> >         mov     dst, dstin
> >         setp    [dst]!, count!, val_x
> >         setm    [dst]!, count!, val_x
> >         sete    [dst]!, count!, val_x
> >         ret
> > SYM_FUNC_END(__pi_memset)
> >
> > In this case, do we consider the stacktrace unreliable since
> > __pi_memset may not appear in the trace?
>
> This is a tail-call, and __pi_memset_generic() will not return to
> __pi_memset(). Once the branch to __pi_memset_generic() has been
> executed, it's fine for __pi_memset() to not show up in the trace.
>
> The key thing is that no more instructions from __pi_memset() itself
> will be executed unless it was called again (from its entry point).
>
> > Or is this not important because assembly functions cannot be directly
> > livepatched anyway?
>
> To the best of my knowledge, reliable stacktrace is only used to
> determine whether any thread is still within an old version of a
> patchable function (including where it's within a callee thereof).
>
> I am not aware of a case where we'd need to detect whether a thread is
> still within a non-patchable function, but I can't rule out that as a
> possibility.
>
> That's more of a question for the livepatching maintainers.
>
> Thanks,
> Mark.

Thanks,
Dylan

