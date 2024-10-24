Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F59CE8E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 16:26:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Ll4GC/Z+nsHOSL1Eq+RD0EPZsJaL6027ckST22ktgk=; b=ihjrv+QEdKaG6HHBSd0ccNM0hB
	JyACZ9loCWxi0q6SP79GPev7m6II9h1Jcme+PtpiopXXLL5mV6pPXyLTV++jeJRCSJxM047Kbf7DE
	bdAvRp3FG++zKtrr65ChwD5r/TC6l2YxmXXvIyOQgpLd9ZQp8zAWlt2moURfmN4nKFX3VSQwK7waq
	BNTWOrtS1XWKaDrQ/7B7wuowq+uWicT3pYHcSDVFEPozWXlV4N5K4QDxZblYFH1Ld8yEEyQzYlrxp
	IL3XsE2UjxpzcIk8qmZn0tUsqZJl7rycJcIBsl1NUYYhr1w4InLSFvmOtqK/OjWJPe2tIXMFwWL0I
	qfpRhS7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t40fK-000000015Rd-3L6b;
	Thu, 24 Oct 2024 16:26:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t40di-000000014uO-3Ejt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 16:24:47 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4314c452180so15357135e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 24 Oct 2024 09:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729787084; x=1730391884; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+Ll4GC/Z+nsHOSL1Eq+RD0EPZsJaL6027ckST22ktgk=;
        b=la1gJtdU2PGH50ToQEqU591zTjwDlzoGhHZ1BlmhdMgmtr++tnzJryGr2XD1ZyyxHa
         +GFVfdNVX5DnEZI6+6iWi0s8UMDTKcf0LWIMMqd+j41avrB7zawKyd6l/ei3jbFponjj
         NtEsbbUzzgJivSwqGr4EBOh5/HJr3m6s2fzGGYX6/NfDUT1slMGFdQOZC7rJ2Ff9xNRl
         S/G1Pomo7k0ddwG5+c87U9Bfs/CA9fym0CIVlBCKIHSr1nnXSFunOuCX1ywqLzCk/7mH
         acjag8Nj0iYPJG4PSBt3uOiJvnadZyXDIOLtPYCL3ynf1DKtEfY5o1K2637yTCB0Lp/2
         6yMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729787084; x=1730391884;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+Ll4GC/Z+nsHOSL1Eq+RD0EPZsJaL6027ckST22ktgk=;
        b=fTt0c45d3469qSQ0Wp6tzBlcbWY7U8i5ePl2BaDhJDFLEqi+5EkpMWkRIrweqFoAJ6
         ajru/dLWsKDsJdf/u5MLO5gNdiV9byoPAjlSjyKAdstB22I2ubnzq9puOn783Fh8eSku
         lw5Yd2bj45qb3Sde/T2GieicydAtQTJ1zf3xHhwS4lO+eFZ60LuYzfwF3JYmJ1S4CLfR
         /mQsItM6bkrgA1411wITzdz8LxhKYd1BcmhsGL1d9dGBs4JtaB6IXUEIszCzri0G+FLA
         fDmWiwe39RITDBoW45jlgVfgqjFDnbJVeVoOVDhMaYVayh/DCwDpzqc1xauTZhoTCecc
         WlKw==
X-Forwarded-Encrypted: i=1; AJvYcCW6nj+xG3mwv8T89Vvgy7ANzqFdSUhTG/1YVkHQ42smIGk2UM+o8XBMaNty3uyfg/GPM4J2afLFiZ2TkG+pmRZL@lists.infradead.org
X-Gm-Message-State: AOJu0YzL/hN6kNNUSiAwIxehrqp5qJWyY4qBjUxhcpp1AyEQ1fI7QW/6
	CnTluprZEb3PrwFIRKL7wSV3WRlZtRyffG6g8epMpCCB3tF2opZ0FoBsk9tCnzB5Vhiu87AgRua
	isdWDgKUm9xrufuY5lwlvjixqeXQ=
X-Google-Smtp-Source: AGHT+IE6yaGrr6D8biWQ/8kA/SbDNpPPefW5qxNaY83edHlmZV3ZNgLnpvIIARvcssk1h4h2GEo6irsBCBElsx8qu14=
X-Received: by 2002:adf:f7d1:0:b0:37d:3baa:9f34 with SMTP id
 ffacd0b85a97d-3803ab67450mr2253587f8f.1.1729787084103; Thu, 24 Oct 2024
 09:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20241019092709.128359-1-xukuohai@huaweicloud.com>
 <CAADnVQLOY-eHby6CMNXr3FvwPm85W-tWDxiWnRaR_U_=71ADuA@mail.gmail.com>
 <CANk7y0jiuiHSMTEZ_JCb4QpEPzhkK4ikicDGFa1F30DinZta8A@mail.gmail.com>
 <7226e7b8-ed73-4adb-9016-30031f1121ca@huaweicloud.com> <47082e78-e234-4487-95f2-0066e19f21dd@huaweicloud.com>
In-Reply-To: <47082e78-e234-4487-95f2-0066e19f21dd@huaweicloud.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Thu, 24 Oct 2024 09:24:32 -0700
Message-ID: <CAADnVQKcwTstR5y3e1wNj-Agq7DuPNYOdQWkf33cLOBYiYGiug@mail.gmail.com>
Subject: Re: [PATCH bpf] bpf, arm64: Fix stack frame construction for
 struct_ops trampoline
To: Xu Kuohai <xukuohai@huaweicloud.com>
Cc: Puranjay Mohan <puranjay12@gmail.com>, bpf <bpf@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Puranjay Mohan <puranjay@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_092446_834463_C2FC43CD 
X-CRM114-Status: GOOD (  27.69  )
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

On Thu, Oct 24, 2024 at 6:48=E2=80=AFAM Xu Kuohai <xukuohai@huaweicloud.com=
> wrote:
>
> On 10/23/2024 11:16 AM, Xu Kuohai wrote:
> > On 10/23/2024 7:37 AM, Puranjay Mohan wrote:
> >> On Wed, Oct 23, 2024 at 12:50=E2=80=AFAM Alexei Starovoitov
> >> <alexei.starovoitov@gmail.com> wrote:
> >>>
> >>> On Sat, Oct 19, 2024 at 2:15=E2=80=AFAM Xu Kuohai <xukuohai@huaweiclo=
ud.com> wrote:
> >>>>
> >>>> From: Xu Kuohai <xukuohai@huawei.com>
> >>>>
> >>>> The callsite layout for arm64 fentry is:
> >>>>
> >>>> mov x9, lr
> >>>> nop
> >>>>
> >>>> When a bpf prog is attached, the nop instruction is patched to a cal=
l
> >>>> to bpf trampoline:
> >>>>
> >>>> mov x9, lr
> >>>> bl <bpf trampoline>
> >>>>
> >>>> This passes two return addresses to bpf trampoline: the return addre=
ss
> >>>> for the traced function/prog, stored in x9, and the return address f=
or
> >>>> the bpf trampoline, stored in lr. To ensure stacktrace works properl=
y,
> >>>> the bpf trampoline constructs two fake function stack frames using x=
9
> >>>> and lr.
> >>>>
> >>>> However, struct_ops progs are used as function callbacks and are inv=
oked
> >>>> directly, without x9 being set as the fentry callsite does. Therefor=
e,
> >>>> only one stack frame should be constructed using lr for struct_ops.
> >>>
> >>> Are you saying that currently stack unwinder on arm64 is
> >>> completely broken for struct_ops progs ?
> >>> or it shows an extra frame that doesn't have to be shown ?
> >>>
> >>> If former then it's certainly a bpf tree material.
> >>> If latter then bpf-next will do.
> >>> Pls clarify.
> >>
> >> It is not completely broken, only an extra garbage frame is shown
> >> between the caller of the trampoline and its caller.
> >>
> >
> > Yep, exactly. Here is a perf script sample, where tcp_ack+0x404
> > is the garbage frame.
> >
> > ffffffc0801a04b4 bpf_prog_50992e55a0f655a9_bpf_cubic_cong_avoid+0x98 (b=
pf_prog_50992e55a0f655a9_bpf_cubic_cong_avoid)
> > ffffffc0801a228c [unknown] ([kernel.kallsyms]) // bpf trampoline
> > ffffffd08d362590 tcp_ack+0x798 ([kernel.kallsyms]) // caller for bpf tr=
ampoline
> > ffffffd08d3621fc tcp_ack+0x404 ([kernel.kallsyms]) // garbage frame
> > ffffffd08d36452c tcp_rcv_established+0x4ac ([kernel.kallsyms])
> > ffffffd08d375c58 tcp_v4_do_rcv+0x1f0 ([kernel.kallsyms])
> > ffffffd08d378630 tcp_v4_rcv+0xeb8 ([kernel.kallsyms])
> > ...
> >
> > And this sample also shows that there is no symbol for the
> > struct_ops bpf trampoline. Maybe we should add symbol for it?
> >
>
> Emm, stack unwinder on x86 is completely broken for struct_ops
> progs.
>
> It's because the following function returns 0 for a struct_ops
> bpf trampoline address as there is no corresponding kernel symbol,
> which causes the address not to be recognized as kerneltext. As
> a result, the winder stops on ip =3D=3D 0.
>
> unsigned long unwind_get_return_address(struct unwind_state *state)
> {
>          if (unwind_done(state))
>                  return 0;
>
>          return __kernel_text_address(state->ip) ? state->ip : 0;
> }
>
> Here is an example of broken stack trace from perf sampling, where
> only one stack frame is captured:
>
> ffffffffc000cfb4 bpf_prog_e60d93d3ec88d5ef_bpf_cubic_cong_avoid+0x78 (bpf=
_prog_e60d93d3ec88d5ef_bpf_cubic_cong_avoid)
> (no more frames)

you mean arch_stack_walk() won't see anything after ip=3D0,
but dump_stack() will still print the rest with "?" (as unreliable).

That's bad indeed.

> To fix it, I think kernel symbol should be added for struct_ops
> trampoline.

Makes sense. Pls send a patch.


As far as this patch please add an earlier example of double tcp_ack trace
to commit log and resubmit targeting bpf-next.

