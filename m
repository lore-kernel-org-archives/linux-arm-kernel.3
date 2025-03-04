Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3966C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H7DJBIx3iIusUVOEMB5nnJFYTmd3nur6e8lzlUxwqLk=; b=U9lV53n0RpmsorwDQwEj0YFG2Z
	e+V+PsTZsXzeeVzaSLRWxWBouw6Vr/N4ES1lvYD4jEmsK497zAMW3PJ3oX3GrP3AbM/Hvj4RXpMer
	iGadM/EBcV+9kshc1auIacRLAHlJVqewiN0ByNoxiootBqdsQoHCNQj4/3oxDu62d2E6t4yHRu6EY
	WwflEx0HUUXrhv8gujYRNAJmtb/tOKGJlhaFiX51KrC7QKuaCVZCv0fFxmdDts+vS/4sQWtBnZMW1
	yAOvUvOI3EsSvasuL1+g1BBLUBk6nuycTx9IRedsNEvbIRER/YgRtEgc2TeWYsTrtH5zKVWHFhWk1
	tLPqSGsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNtO-00000003hem-1NQt;
	Tue, 04 Mar 2025 08:44:46 +0000
Received: from mail-yw1-x1142.google.com ([2607:f8b0:4864:20::1142])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNrn-00000003hOk-1B1G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 08:43:08 +0000
Received: by mail-yw1-x1142.google.com with SMTP id 00721157ae682-6fd30144fe1so37821387b3.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 04 Mar 2025 00:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741077786; x=1741682586; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H7DJBIx3iIusUVOEMB5nnJFYTmd3nur6e8lzlUxwqLk=;
        b=BipQV+E7IgZNwhaMrCfxMCHknlOAjHqqSW8wenxDCYzs7aSTmKfN482ujEHIqZ7lIL
         itPwvrZkzeJLT9qYuNgGkxlqH6HSHfxwMSkofxFXPGQmvzEsCZTVYecPuhHn69DxQbH1
         N5Lm/fItkgPCPjvzhL02Cx/mAqQv6nZIfrpV7kE6HBOzTYd083GNbyI7lj4EXID6Fm0L
         9mmcZQMS0i+ANo/TgisY+TSLp+fd69OiVrE+R6CORChkPGLSxc20loH11Obnum83T+HW
         VtrELTBBgaUy3tdH+LWTjZ8JN51XiUDa7H+th/v6LEcZOzUbRn9uDPrCP1qu8eMUKnXV
         3NTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741077786; x=1741682586;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H7DJBIx3iIusUVOEMB5nnJFYTmd3nur6e8lzlUxwqLk=;
        b=aV1Ak6RfMcI5O2cQvu44BpcYXKLuq3sxy2MeJN1F65bEALuqioxayjSwDXy4yeKVZt
         QHkUobZtUNZoD8TZ9n3JOVUDd+eyZt/bmJOVI6ni43eRG1NwfhaJgNEGTolYe396Deuk
         vrruBn9UouvQHZv/gDJUaKmVYd1rG6ufGF3zkPRuyDkfN7u9+dZfM3SDH97U7CFGCIix
         TQHooriVs1YWiSjd4T52bcpYGmHtIqd2Rxt6aQV4YBaQkzfEi3Xv4BswHOaM0Itt5V5X
         g4d3uhx2a2jBxseO6otN1pMbdx6sgoZpxaDtRPWZ+vobq1cMJ3MKfMvskWJ75o5HkVCJ
         NMnw==
X-Forwarded-Encrypted: i=1; AJvYcCWQUrcqfNwzdTrwx6+9E4Mwd1/RWRezuJaNKsBTs+MBBZIhpiTjHDdnpC+SMH5K7ZOob++LCwxXa6r4t5UNPz7e@lists.infradead.org
X-Gm-Message-State: AOJu0YyRPdjjTIkDucnqEQRi8y2OTz9gQla05hihh9/UDrDXY0U1uqzd
	89KQYoPC3hszRBv8mDnVeHkaCy0W8AKRfWaIwx6jj8GFzdIi0sJO8J5yAkZvcTAgJFLGLeC/LOy
	8J9zW7P/mPRH/Igot8lqx4II49EA=
X-Gm-Gg: ASbGncsIpTjwld07A2+zkbujIsp9B+2HRY2oAwOFphMvrGS/xIlv4KqzUpUIry7EfNo
	LWJ+BIEDJHqIzqRnpq8epoBI8E68NSizYnpFjIZikipYLfyN0qMH3+BJ8kZ8pW09DILMsj+/bYX
	uu5zgErbZvqMBHwlPW3Z9U/787eA==
X-Google-Smtp-Source: AGHT+IFwKhleghfxmR4fo46mZcDQS529bArSvfkTfmrf2+HZom9bVtkcaUWWW29c+BaFyOYjznUloBGTXBdQLw3Z1i8=
X-Received: by 2002:a05:690c:6303:b0:6fd:3f88:e0a9 with SMTP id
 00721157ae682-6fd49e2a409mr227818067b3.0.1741077786117; Tue, 04 Mar 2025
 00:43:06 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
In-Reply-To: <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 16:41:29 +0800
X-Gm-Features: AQ5f1Jq2_mS0v23bn6W1X-IWDb9MW8dDTnlwz6_dNKl9ybY4p55hAFXAjC92mhs
Message-ID: <CADxym3bS6XdGFhKeEm5TKD-_ubEQB+yTrd=7_L_CDn4xthe-Vg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Peter Zijlstra <peterz@infradead.org>
Cc: rostedt@goodmis.org, mark.rutland@arm.com, alexei.starovoitov@gmail.com, 
	catalin.marinas@arm.com, will@kernel.org, mhiramat@kernel.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	eddyz87@gmail.com, yonghong.song@linux.dev, john.fastabend@gmail.com, 
	kpsingh@kernel.org, sdf@fomichev.me, jolsa@kernel.org, davem@davemloft.net, 
	dsahern@kernel.org, mathieu.desnoyers@efficios.com, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, samitolvanen@google.com, 
	kees@kernel.org, dongml2@chinatelecom.cn, akpm@linux-foundation.org, 
	riel@surriel.com, rppt@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, netdev@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_004307_322247_B1AB0A81 
X-CRM114-Status: GOOD (  35.15  )
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

On Tue, Mar 4, 2025 at 3:47=E2=80=AFPM Menglong Dong <menglong8.dong@gmail.=
com> wrote:
>
> On Tue, Mar 4, 2025 at 2:16=E2=80=AFPM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
> >
> > On Tue, Mar 04, 2025 at 06:38:53AM +0100, Peter Zijlstra wrote:
> > > On Tue, Mar 04, 2025 at 09:10:12AM +0800, Menglong Dong wrote:
> > > > Hello, sorry that I forgot to add something to the changelog. In fa=
ct,
> > > > I don't add extra 5-bytes anymore, which you can see in the 3rd pat=
ch.
> > > >
> > > > The thing is that we can't add extra 5-bytes if CFI is enabled. Wit=
hout
> > > > CFI, we can make the padding space any value, such as 5-bytes, and
> > > > the layout will be like this:
> > > >
> > > > __align:
> > > >   nop
> > > >   nop
> > > >   nop
> > > >   nop
> > > >   nop
> > > > foo: -- __align +5
> > > >
> > > > However, the CFI will always make the cfi insn 16-bytes aligned. Wh=
en
> > > > we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
> > > > like this:
> > > >
> > > > __cfi_foo:
> > > >   nop (11)
> > > >   mov $0x12345678, %reg
> > > >   nop (16)
> > > > foo:
> > > >
> > > > and the padding space is 32-bytes actually. So, we can just select
> > > > FUNCTION_ALIGNMENT_32B instead, which makes the padding
> > > > space 32-bytes too, and have the following layout:
> > > >
> > > > __cfi_foo:
> > > >   mov $0x12345678, %reg
> > > >   nop (27)
> > > > foo:
> > >
> > > *blink*, wtf is clang smoking.
> > >
> > > I mean, you're right, this is what it is doing, but that is somewhat
> > > unexpected. Let me go look at clang source, this is insane.
> >
> > Bah, this is because assemblers are stupid :/
> >
> > There is no way to tell them to have foo aligned such that there are at
> > least N bytes free before it.
> >
> > So what kCFI ends up having to do is align the __cfi symbol to the
> > function alignment, and then stuff enough nops in to make the real
> > symbol meet alignment.
> >
> > And the end result is utter insanity.
> >
> > I mean, look at this:
> >
> >       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall=
_level+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
> >       56:       66 2e 0f 1f 84 00 00 00 00 00   cs nopw 0x0(%rax,%rax,1=
)
> >
> > 0000000000000060 <__cfi___probestub_initcall_level>:
> >       60:       90                      nop
> >       61:       90                      nop
> >       62:       90                      nop
> >       63:       90                      nop
> >       64:       90                      nop
> >       65:       90                      nop
> >       66:       90                      nop
> >       67:       90                      nop
> >       68:       90                      nop
> >       69:       90                      nop
> >       6a:       90                      nop
> >       6b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
> >
> > 0000000000000070 <__probestub_initcall_level>:
> >       70:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall=
_level+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4
> >
> >
> > That's 21 bytes wasted, for no reason other than that asm doesn't have =
a
> > directive to say: get me a place that is M before N alignment.
> >
> > Because ideally the whole above thing would look like:
> >
> >       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall=
_level+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
> >       56:       66 2e 0f 1f 84          cs nopw (%rax,%rax,1)
> >
> > 000000000000005b <__cfi___probestub_initcall_level>:
> >       5b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
> >
> > 0000000000000060 <__probestub_initcall_level>:
> >       60:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall=
_level+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4
>
> Hi, peter. Thank you for the testing, which is quite helpful
> to understand the whole thing.
>
> I was surprised at this too. Without CALL_PADDING, the cfi is
> nop(11) + mov; with CALL_PADDING, the cfi is mov + nop(11),
> which is weird, as it seems that we can select CALL_PADDING if
> CFI_CLANG to make things consistent. And I  thought that it is
> designed to be this for some reasons :/
>
> Hmm......so what should we do now? Accept and bear it,
> or do something different?
>
> I'm good at clang, so the solution that I can think of is how to

*not good at*

> bear it :/
>
> According to my testing, the text size will increase:
>
> ~2.2% if we make FUNCTION_PADDING_BYTES 27 and select
> FUNCTION_ALIGNMENT_16B.
>
> ~3.5% if we make FUNCTION_PADDING_BYTES 27 and select
> FUNCTION_ALIGNMENT_32B.
>
> We don't have to select FUNCTION_ALIGNMENT_32B, so the
> worst case is to increase ~2.2%.
>
> What do you think?
>
> Thanks!
> Menglong Dong
>
> >
> >
> >

