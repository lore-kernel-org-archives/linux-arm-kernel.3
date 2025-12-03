Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47B1ED1BDD4
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 20:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zi2Tym97Iw47XsW0KDcn1kY+fahoY4a+WRZ6zbXd8IA=; b=3O73Vr7bRxyJtkUCcGP4f4VExi
	oS+jEETc8GpuVUZSvAx8zqcSUV/0fo1MDXwFCWMSAbWyY603tVDj5mu5dTuLqD208FNCkw4JAQEB7
	2UV5l30yMjDPZvDoE2EKWzB3JtVlBiglAgfE4w8Z9crzVUyx7sB5s10VRQ7NN4sP0ZOUbePONHHLG
	cXdiE1l/bPsK69Hhka95c5rhQrvOnKqkpmw9tPpSwiQjM3NhMrSt29ofXvHgpSsZ9Cjr5Cqromg86
	lUxI+VMIB/K5XK6arcxO5BhgOgYkZzwgLo/pGw1UGhw96JvFWIUOMAXD3gN39GGiYWahP33zU9EZw
	cmYOmVow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtOF-000000071ur-0WGv;
	Wed, 03 Dec 2025 20:23:55 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtOC-000000071uA-1Pmg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 20:23:53 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-477bf34f5f5so1338795e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 12:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764793430; x=1765398230; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zi2Tym97Iw47XsW0KDcn1kY+fahoY4a+WRZ6zbXd8IA=;
        b=f2isC1SQZIP/NjyZ9r0P8234xjd73MjbjBPEJBTPEN2k7Fv8G7+LgxkBg5NM7zwEdZ
         TGc+ui+GH9vvHOKMRjNEJQ++8rskrxlqCUnO3mbdUoDkbrEr6pH+vQrHCci3WMtpqyWX
         Z9tof0bvoU2XXjKXWHpQaqFiCLPiXqwfff2GSTrA0GO+0vikF0h2P9Mwmz6x1NR8GPYY
         wZdEVWIGBsYWSnX4EQlo83HoOz+CQs3THZfZRn8jRSRR9yLPnPqZocC8nKwnzbCCP4K2
         FfzgOhycMS+NBFCAZWWkOHHYcjlNuze4GCLiwL4XbhUBTpRsNNzkbJ6+wTfyGo50gsZ/
         C3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764793430; x=1765398230;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zi2Tym97Iw47XsW0KDcn1kY+fahoY4a+WRZ6zbXd8IA=;
        b=JB6JsqlU2HKTqkuHhX3hVoJnLQC+sjtlfer0syS/1sdwEXI5UzK0tHRiajcDzQHGJm
         1mBrU6IyeY/lgQaFT2rgVguVXMP2OpF8yHUc8yExM6ajJ8cHIUUiKptAH+5WrCcGLoqu
         goJenPKBp9Jw/SpzVJlWo39COAd6xTvTDUQNkQ4wIZBksNo16bFqTZAZu3xkSoMnv0Ro
         +xNQBSCyhP5G3PPaQ88eGKTAxtBI3mQ358TaaI3OA55cT12NgTbrriip/FCe4FuhUla5
         NGOEQJPFb+iDCOU8X9WfQmGkEcsQAoO7t2f3+DaBnjH2cwrfzRyy6L+pueNP0aTToN2q
         esEA==
X-Forwarded-Encrypted: i=1; AJvYcCW7QNRJeGUAeAW6fZDYinvOdZAu/tpp5gp+Gwmg6DOKiZtbcV7Sek9xOqclkgiM/lKWvIEwiSaLle/qRdXnmJ3X@lists.infradead.org
X-Gm-Message-State: AOJu0YzMAKZK8XCopMNvO3x1fecN3hf75a09O8AHNowwZQnylYC/o7+g
	WlsuRvaQ2v2v/LQiWD8dmghhK0+Pw5cVzMyOfdYb0LmRnhtdY629ziqDsHjRwu28
X-Gm-Gg: ASbGncvVNK3gMAMGEZbkj3bkcPgcFeaboD4JqINerElRepGs23W8JcLdix0LWw/37IU
	QvLPRhMnGO565el/k4YMlbRPmNNI+CrbQGZBMa5pi5XQ5AaTG7wALp3TUnBHfXtc3EMrF+WJRI2
	WT3zhpYZtNWYwq0gz+n+ITIjhZJYeE8u39MIBeCHAcoXq1tPaTLQoM+r1eWIbotpbo2iIV7rNAu
	BtpipPiP9An/7UMPsTwuiH+lErcBMMH23vZ76wnh6e3WOQ9mTq7wm9O1LCmYuaGFChWd9jRQr2B
	SQZOLkCzXnIpc7cdgdPB5Ym9kofX+N4btPNSCmThlPrhUFpLEmQH6xbtGX9qKMYtww0UKFah35M
	q1cXdiQSDhAtHPd4PPKM3fku1AD10Atj/KXlZOLG1z2Jf1SVe6SKPjuAaGABSjoog7n6DCBWgin
	c=
X-Google-Smtp-Source: AGHT+IHAWH1Cpvq5B81/xkivbTXgTXuutxLETKY/29bdgzeJHM6sjIXHH155EYl31r8m6eHuaFG7fg==
X-Received: by 2002:a05:6000:22c2:b0:428:4004:8241 with SMTP id ffacd0b85a97d-42f79851c93mr237747f8f.40.1764793429799;
        Wed, 03 Dec 2025 12:23:49 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm40900203f8f.12.2025.12.03.12.23.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:23:49 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 3 Dec 2025 21:23:47 +0100
To: Menglong Dong <menglong8.dong@gmail.com>
Cc: Steven Rostedt <rostedt@kernel.org>, Florent Revest <revest@google.com>,
	Mark Rutland <mark.rutland@arm.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>, Song Liu <song@kernel.org>
Subject: Re: [PATCHv4 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP
 ftrace_ops flag
Message-ID: <aTCcU509ajY9-Dgj@krava>
References: <20251203082402.78816-1-jolsa@kernel.org>
 <20251203082402.78816-2-jolsa@kernel.org>
 <CADxym3awpEbMiSKE5aDcyd2Cg1Cdo7++SLAMSuZmaggt3BSbUA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CADxym3awpEbMiSKE5aDcyd2Cg1Cdo7++SLAMSuZmaggt3BSbUA@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_122352_403775_ECDD8BC7 
X-CRM114-Status: GOOD (  36.69  )
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

On Wed, Dec 03, 2025 at 05:15:52PM +0800, Menglong Dong wrote:
> On Wed, Dec 3, 2025 at 4:24 PM Jiri Olsa <jolsa@kernel.org> wrote:
> >
> > At the moment the we allow the jmp attach only for ftrace_ops that
> > has FTRACE_OPS_FL_JMP set. This conflicts with following changes
> > where we use single ftrace_ops object for all direct call sites,
> > so all could be be attached via just call or jmp.
> >
> > We already limit the jmp attach support with config option and bit
> > (LSB) set on the trampoline address. It turns out that's actually
> > enough to limit the jmp attach for architecture and only for chosen
> > addresses (with LSB bit set).
> >
> > Each user of register_ftrace_direct or modify_ftrace_direct can set
> > the trampoline bit (LSB) to indicate it has to be attached by jmp.
> >
> > The bpf trampoline generation code uses trampoline flags to generate
> > jmp-attach specific code and ftrace inner code uses the trampoline
> > bit (LSB) to handle return from jmp attachment, so there's no harm
> > to remove the FTRACE_OPS_FL_JMP bit.
> >
> > The fexit/fmodret performance stays the same (did not drop),
> > current code:
> >
> >   fentry         :   77.904 ± 0.546M/s
> >   fexit          :   62.430 ± 0.554M/s
> >   fmodret        :   66.503 ± 0.902M/s
> >
> > with this change:
> >
> >   fentry         :   80.472 ± 0.061M/s
> >   fexit          :   63.995 ± 0.127M/s
> >   fmodret        :   67.362 ± 0.175M/s
> >
> > Fixes: 25e4e3565d45 ("ftrace: Introduce FTRACE_OPS_FL_JMP")
> > Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> > ---
> >  include/linux/ftrace.h  |  1 -
> >  kernel/bpf/trampoline.c | 32 ++++++++++++++------------------
> >  kernel/trace/ftrace.c   | 14 --------------
> >  3 files changed, 14 insertions(+), 33 deletions(-)
> >
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 015dd1049bea..505b7d3f5641 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> > @@ -359,7 +359,6 @@ enum {
> >         FTRACE_OPS_FL_DIRECT                    = BIT(17),
> >         FTRACE_OPS_FL_SUBOP                     = BIT(18),
> >         FTRACE_OPS_FL_GRAPH                     = BIT(19),
> > -       FTRACE_OPS_FL_JMP                       = BIT(20),
> 
> Yeah, the FTRACE_OPS_FL_JMP is not necessary. I added
> it in case that we maybe want to implement such "jmp" for
> ftrace trampoline in the feature. But it's OK to remove it now.
> 
> >  };
> >
> >  #ifndef CONFIG_DYNAMIC_FTRACE_WITH_ARGS
> > diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> > index 976d89011b15..b9a358d7a78f 100644
> > --- a/kernel/bpf/trampoline.c
> > +++ b/kernel/bpf/trampoline.c
> > @@ -214,10 +214,15 @@ static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
> >         int ret;
> >
> >         if (tr->func.ftrace_managed) {
> > +               unsigned long addr = (unsigned long) new_addr;
> > +
> > +               if (bpf_trampoline_use_jmp(tr->flags))
> > +                       addr = ftrace_jmp_set(addr);

I wanted to get rid of the  void * -> unsigned long casting in all the
places.. this way it has to be just on one place above, but maybe we
could have already direct_ops_add with unsigned long addr, will check

jirka

> 
> nit: It seems that we can remove the variable "addr" can use
> the "new_addr" directly?
> 
> > +
> >                 if (lock_direct_mutex)
> > -                       ret = modify_ftrace_direct(tr->fops, (long)new_addr);
> > +                       ret = modify_ftrace_direct(tr->fops, addr);
> >                 else
> > -                       ret = modify_ftrace_direct_nolock(tr->fops, (long)new_addr);
> > +                       ret = modify_ftrace_direct_nolock(tr->fops, addr);
> >         } else {
> >                 ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
> >                                                    new_addr);
> > @@ -240,10 +245,15 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
> >         }
> >
> >         if (tr->func.ftrace_managed) {
> > +               unsigned long addr = (unsigned long) new_addr;
> > +
> > +               if (bpf_trampoline_use_jmp(tr->flags))
> > +                       addr = ftrace_jmp_set(addr);
> 
> And here.
> 
> Thanks!
> Menglong Dong
> 
> > +
> [...]
> >

