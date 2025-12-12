Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BFD3D43367
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Dec 2025 03:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=htlgSQTH253RGZOf4q7z2W7H7mWQ7XMZ2k1zpUcQBpY=; b=FcDFfEWA0BMTKHVKiuF+g5rSn3
	p9lyBEsoofjwiUyOLTL+lgwU9TZcp+v8svZ25u5g2yAdc+MMRnK8CIKmbMliNjqdQQ3GKnx8txA6T
	p6UsQChaHkOjyXgzlEimWpPbyJMPG0WrikhaqoUQtxEp+NWhsz6GMUWivFH0CKggGXoDyIybDStEc
	xJygLdmDH608gvDCAyE7P4ohYFE9MDN4X1N29zrhpzDm0mr8vxhbdNbOY1JkIsA+kefF9eTd8fMKC
	vR4o0fIR1zwkDv187W5PF1ep0nCQPINXhx5LDOQB2WBkEBfxQrtjVXPYGpIB6POYy+y6sR5RR6uK8
	vVeecW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtXc-0000000Ha9W-2gYt;
	Fri, 12 Dec 2025 03:10:00 +0000
Received: from mail-oo1-xc33.google.com ([2607:f8b0:4864:20::c33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTtXZ-0000000Ha8R-3RIf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Dec 2025 03:09:59 +0000
Received: by mail-oo1-xc33.google.com with SMTP id 006d021491bc7-65b3d3ac972so485848eaf.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 11 Dec 2025 19:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1765508992; x=1766113792; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=htlgSQTH253RGZOf4q7z2W7H7mWQ7XMZ2k1zpUcQBpY=;
        b=gggkSJskDd+yHwU3cNOF5KPy+6uv1CO/iIfVNT3CI7Y8RhRm3vdZH9PuFanyBH2mf6
         8TB/bgCDUPMJCRFWbicvTjHMA+xlXujys6Xw0Gt9riRdoT9/+WZ1u8s7AeL7fcJHXhEz
         LNQ48XzRt/CX9HYVIwBo92dkUHu6jxq+7weF8rx53W2wN0zKJwpSdYstNR/cv6tTMCml
         Zz3QnCF6uOjDi6oPa3t01riFElM94hhtkYxvS4o2tl8OPWgXMIgxM/FbpSuOmSWzaWQo
         Rxfu6FEQDj3gUIuNHdl3vJ0Rh+piStjGFqW16+dE7QWqokZ5i1U+P50pF1qZ8+hgwExf
         3oAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765508992; x=1766113792;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=htlgSQTH253RGZOf4q7z2W7H7mWQ7XMZ2k1zpUcQBpY=;
        b=eeGV46yEpsxQTMFRTCeyKSDfxfk1ml8D/+CW6g4YA8mhYTvf8Q//pTJ8NC2EKKDJqx
         NsR509N/Luk9K/YskhlvVcMGZTwk2xxKRJ8TTZKtNNVTOQ2hZVR0XRh9l5r2SIHSqr3I
         OrHy7QLq7cFayrFaUXpuSgkPEy8bgwXm6P6saHihdMn5N4gFPyv8Asnqdw2FLSBljX0J
         0yn5ZcYisw1pkSHfB6rszFnOWEv6rDb7TOZhh+5lLZmwDV8eqAd+dwbsUGusNOYgy1wp
         sJ13WdPaLhDb0lR9Zpwc7m4zmsxiZgeZESWtuhCQF5t5L5Yt8BZ60ibOgk87anyVg3Jk
         MPfw==
X-Forwarded-Encrypted: i=1; AJvYcCVx1uTq1I+0Qd0Q41GzFrNO4zSojwi7Z13f3pBF7MC6GpM6PXyxes5Yu4VoQjsPc1TmO8WHTdDnwXbp73bx+A+T@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/sKLy8kRVvXqOKA+CNLptg3tdLcmOWbeA/F+nDfeCdHk19M8u
	KMax6V922JyEdbHQyYQTcdsKff01E3GPdsx0Ckh9LDld1gPVz4+H0VZSkmCcaU0+QMb7V2rKW4X
	S7VGnDfTxXtW4dRTRWX/mnZWKIBaoSWbKKNNBclaMUQ==
X-Gm-Gg: AY/fxX6ir+/PRx4Y2Udpi2vMxi3l8BHHlvNzUHgWKHIdg55YDTK1E9kNEpZxO3aIM41
	bdbDNew5IBuCmI5tcpgOfIGF6kV+GVywTKicBerduU3B8YOnnemCX3WEoo/xr5WO9Nf5DvQGa+v
	9KryVIc5QqgJxIJo/k+jIRGE00tQH83q4S6OYdlVdyIRUZxyZLB7s3noKW2bMw61ygejtp8se7m
	UhwWil8deqpn0fCgv4AbYri/yviR0Lagjr7CxrIXfPzVbZlIA3KD+7x5gNGk8HT242D/GH4IQ==
X-Google-Smtp-Source: AGHT+IFVkrMw+28f7TODH4JvGZsNBLmGs+M2MEYxCg+3VtEPM0ROFv0R1vaHJEkPE4yan/fqdRQg74XhYgNULD2II7M=
X-Received: by 2002:a05:6820:a05:b0:659:9a49:8eab with SMTP id
 006d021491bc7-65b4523b519mr283704eaf.47.1765508992017; Thu, 11 Dec 2025
 19:09:52 -0800 (PST)
MIME-Version: 1.0
References: <20251127125305.89961-1-cuiyunhui@bytedance.com>
 <20251127125305.89961-6-cuiyunhui@bytedance.com> <DEP4X1DAIOU5.2WLIV4BMWLMRR@ventanamicro.com>
 <CAEEQ3wmAn=9w=fR=OMTMF17_tAcEnsdJWL_w8fw-3wA-Bfi6xw@mail.gmail.com>
 <DEPGLFUVHA0O.XSZVD2T1ENLD@ventanamicro.com> <CAEEQ3wngwxjiytt7g6XY0bC1PL4A1NEmirML7FiqXMA4_K0irw@mail.gmail.com>
 <DEULRAM55E2G.1464D4JSWL3SZ@ventanamicro.com>
In-Reply-To: <DEULRAM55E2G.1464D4JSWL3SZ@ventanamicro.com>
From: yunhui cui <cuiyunhui@bytedance.com>
Date: Fri, 12 Dec 2025 11:09:40 +0800
X-Gm-Features: AQt7F2r04q4KyXTdxf6PPEz-PTJYjAYHJDLZcMkvacVGv4tRIIhxTLFECsm6mkU
Message-ID: <CAEEQ3wmEVVHC=S795dFsQ9iM5Xkz-KOBe_CxXbvzyDBUo3wU6A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 5/8] riscv: smp: use NMI for CPU stop
To: =?UTF-8?B?UmFkaW0gS3LEjW3DocWZ?= <rkrcmar@ventanamicro.com>
Cc: conor@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, luxu.kernel@bytedance.com, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	jassisinghbrar@gmail.com, conor.dooley@microchip.com, 
	valentina.fernandezalanis@microchip.com, catalin.marinas@arm.com, 
	will@kernel.org, maz@kernel.org, timothy.hayes@arm.com, lpieralisi@kernel.org, 
	arnd@arndb.de, kees@kernel.org, tglx@linutronix.de, viresh.kumar@linaro.org, 
	boqun.feng@gmail.com, linux-arm-kernel@lists.infradead.org, 
	cleger@rivosinc.com, atishp@rivosinc.com, ajones@ventanamicro.com, 
	linux-riscv <linux-riscv-bounces@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_190958_146476_C47A1ED6 
X-CRM114-Status: GOOD (  31.88  )
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

Hi Radim,

On Wed, Dec 10, 2025 at 10:22=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkrcm=
ar@ventanamicro.com> wrote:
>
> 2025-12-08T19:40:39+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> > Hi Radim,
> >
> > On Thu, Dec 4, 2025 at 9:16=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 <rkr=
cmar@ventanamicro.com> wrote:
> >>
> >> 2025-12-04T13:28:45+08:00, yunhui cui <cuiyunhui@bytedance.com>:
> >> > Hi Radim,
> >> >
> >> > On Thu, Dec 4, 2025 at 12:07=E2=80=AFPM Radim Kr=C4=8Dm=C3=A1=C5=99 =
<rkrcmar@ventanamicro.com> wrote:
> >> >>
> >> >> 2025-11-27T20:53:02+08:00, Yunhui Cui <cuiyunhui@bytedance.com>:
> >> >> > Use NMI instead of IPI for CPU stop if RISC-V SSE NMI is supporte=
d.
> >> >> >
> >> >> > Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> >> >> > ---
> >> >> > diff --git a/drivers/firmware/riscv/riscv_sse_nmi.c b/drivers/fir=
mware/riscv/riscv_sse_nmi.c
> >> >> > @@ -58,6 +58,7 @@ static int local_nmi_handler(u32 evt, void *arg=
, struct pt_regs *regs)
> >> >> >       type =3D atomic_read(this_cpu_ptr(&local_nmi));
> >> >> >
> >> >> >       NMI_HANDLE(LOCAL_NMI_CRASH, cpu_crash_stop, cpu, regs);
> >> >> > +     NMI_HANDLE(LOCAL_NMI_STOP, cpu_stop);
> >> >>
> >> >> Please document the intended preemption design for all SSE events,
> >> >> because it will be a nightmare if we forget some assumptions in the
> >> >> coming years.  (That includes the relative priorities of RAS/PMU/..=
.)
> >> >
> >> > Actually, LOCAL_NMI_CRASH, LOCAL_NMI_STOP, LOCAL_NMI_BACKTRACE,
> >> > LOCAL_NMI_KGDB, ... are all implemented via the single SSE event
> >> > SBI_SSE_EVENT_LOCAL_SOFTWARE_INJECTED. Per the SSE design, no
> >> > preemption will occur among CRASH, STOP, BACKTRACE, and KGDB events.
> >>
> >> That is how it is.  I don't understand why it must be like that.
> >>
> >> For example: PMU_OVERFLOW has lower event_id than SOFTWARE_INJECTED, s=
o
> >> it will currently interrupt NMI_CRASH as they both have priority 0,
> >> although NMI_CRASH probably shouldn't be masked by anything, and shoul=
d
> >> preempt everything.
> >> NMI_BACKTRACE, on the other hand, probably shouldn't have that high
> >> priority as there seem more important events (e.g. RAS and NMI_CRASH).
> >>
> >> The issues can be avoided by event priorities, masking, or deemed as
> >> non-issue, but I think it would be beneficial to provide some reasonin=
g
> >> behind the design, as the choices don't seem obvious to me.
> >
> > Indeed, it is necessary to consider the priority among different
> > events. Should different priorities also be assigned to NMI_CRASH,
> > NMI_BACKTRACE, NMI_STOP, and NMI_KGDB?
>
> I think it would be beneficial to document the desired behavior even if
> we can't (currently?) implement it, because like you said, SSE can't
> directly express the priority when multiplexing SOFTWARE_INJECTED.
>
> >                                        Do these operations need to be
> > visible to the BIOS?
>
> BIOS shouldn't care what lower privilege wants to do.
> SBI could define more events for software use, though.
>
> >                      Could you kindly provide some good suggestions?
>
> I think it would be good practice to explicitly set a unique priority
> when registering SSE events.  Maybe through a global priority enum, and
> make sure that all event registrations are passing a value from that
> enum.

Yes, each distinct event should have a preset priority. I noticed that
SBI_SSE_EVENT_LOCAL_PMU_OVERFLOW in Cl=C3=A9ment's patchset
(https://lore.kernel.org/all/20251105082639.342973-5-cleger@rivosinc.com/)
also does not explicitly set a priority.
As you mentioned, a "global priority enum" is required. I will also
respond to Cl=C3=A9ment's email.

>
> That would make sure that different events interact like we expect them
> to, but it doesn't solve the multiplexing issue of SOFTWARE_INJECTED.
>
> If we're fine with all SOFTWARE_INJECTED sub-handlers having the maximal
> priority (higher than RAS/PMU/UNKNOWN_NMI/...), then we could hope that
> lower imporance handlers (e.g. BACKTRACE) won't hang, so the higher
> importance handlers (e.g. CRASH) would eventually run.
> We're dealing with low-occurrence scenarios, so this might be "good
> enough for now"...

Currently, x86 also handles multiple local NMI events, including
BACKTRACE, via a single NMI vector. We might as well set the priority
of SOFTWARE_INJECTED to the highest.

>
> Situation would get simpler if we could avoid some sub-handlers;
> alternatively, it would get more complicated if SOFTWARE_INJECTED had
> lower priority than some other event -- we'd make CRASH partially
> recover its high priority image by masking other SSE events during its
> execution (and we'd need warding amulets against hangs and starvation).
>
> Thanks.

Thanks,
Yunhui

