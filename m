Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 764F3C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MLjKK0cvD8Zt+dIvBMKOKHc8gKJeqqPNHGFjCQlnXE=; b=hqCtmEb2Q9gXC/el6kDowN0OxF
	3Bh/hgv17liPKnbUsi4Q5Is56ilgH6pfr93D9lfrx+NIzD8fgZcTHS5SilOe5sIoSvZBAbM9njLLt
	kHOfKVrKCJgCYDG8fsBDI2HzYSawYqsrfB+1eO4ocQJ3s0a7SJDKcD6aUdaJw/yS8ugxJ2j+KEDBk
	YzHv1S2QEY12A0FuYYaTDQhzpZzZYVUG2a05r88plvBW7Go4T/N9fhKXdVRXF6FTRzhciHQ0S+KOt
	xtfrSCwItkahnG1TCfYGFfD1TmWIC0y13aVcNZwPKSSnLoriLW0WxKlKG4QTGqOGiIeGv/TQMZR0g
	TAE1l6tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpNIh-00000003ZGX-0ZEg;
	Tue, 04 Mar 2025 08:06:51 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpN1n-00000003Vpy-1ppq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 07:49:24 +0000
Received: by mail-yb1-xb43.google.com with SMTP id 3f1490d57ef6-e60dfd01557so1670256276.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 23:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741074562; x=1741679362; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2MLjKK0cvD8Zt+dIvBMKOKHc8gKJeqqPNHGFjCQlnXE=;
        b=LMGQr55eKr9ijpQrLTpdn+DCOJSFrpr61DOWSYqb1b1gg+e0deJnqJzCOkfjiQwR29
         NRr65yEofSX7oAWCnQQJ9xWnalI92/cf3DOkIXhfEd4DkmqXV6hOuT1a4uR6akj1i19L
         XLzekF4FjLeSsjncXcRi8SrojmSQ36hssOFeQg3w6eblUc4fxq5oSA4FXHHRYaiEeshh
         8M64ioD2t1TE5Fj1/ec3RDml947dbnmzEJhefUB+2wi72YicLp0x5+YJfX9WxGJa7b3b
         nDFOH1kclKGiiNwEYJ2d0v+EjpFIxRihrQQjBqBbzuggRLRT+de+I6rzuWTpTeYFlcbr
         y2iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741074562; x=1741679362;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2MLjKK0cvD8Zt+dIvBMKOKHc8gKJeqqPNHGFjCQlnXE=;
        b=OsrwdsZZ/v6y7T7ebUIB2kon+23gUh+iZuuXDB0WR4l8+E5AwTOXBMjI9E5/11eiYp
         1ul1XjFpBCvM+xUt+WWW8LDAABQU6HrMKv4/FqhBMXtnpHcqMRW/6VFPPlpUIVA//XeK
         jFPGwXoahSTW4jIL0WnMfGRfUWeVmflDIqYub4Mt41kZFJENu8060NnBAt9WcbkDWjKC
         RBGEOejhNot1toX7EGPvYx/OaD/ltn+wulEwFdBCrx99NNSijQX9W+MSPzD62HuD2rzj
         8kLRUjfzr8OulzrQyjpOZshbdmJSYD73ThhmfaT5D+Fgo4eWa1wnGG8oKT8ZKuNTpOQe
         Ke5w==
X-Forwarded-Encrypted: i=1; AJvYcCVpaxQNSXq+ihXXWz51puCbxloT0i9Y6U6tmACA4+0K5bTQ+LCJgbWdPs2RDTjv8ryjHMZEzbkfgqVWg+Tps2RC@lists.infradead.org
X-Gm-Message-State: AOJu0YwFXINz27WXFNdNPmrm0vgh+XxnoVEwP9DaseiHmsGVo7XCyiag
	Nn+AIl0Qthp8uNwHJfdvwL5BzQ3gMw0yasNMpKwyZHnbMRVyJITctO1dGiAA77WTlfPndjr2YTU
	M7SEHmkBF9sxn7G4jBVGAjzY3qd0=
X-Gm-Gg: ASbGncvqmGarpFR4iRKCAjCWplVwp8+ekEWAjimQz0bcG+sRC9j/rS3Wk09KIwWEwD7
	Mf9ytulxPPbHYkG5dqreLzUrDpHDa2WHuD+/duTj6+2KwurVP2oLNW7XzGfZi6NmZ7maEuDHxUC
	l47ZNYv6haGSFadBmAL9g5nUeBeQ==
X-Google-Smtp-Source: AGHT+IERTf+79jPOAvgx5KP2sLqUID7azBWzz7vasRRAB5uE+reXBmF+MEHBwltFPdH76/XUj+vMxqm/piVzmLTWLrk=
X-Received: by 2002:a05:690c:3705:b0:6fd:42bc:4f48 with SMTP id
 00721157ae682-6fd4a03af71mr198978757b3.21.1741074561900; Mon, 03 Mar 2025
 23:49:21 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
In-Reply-To: <20250304061635.GA29480@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 15:47:45 +0800
X-Gm-Features: AQ5f1JoFjrmEt-nBO6x3FpzDHAp0t94q6jSotwVIU7T4XlsHd98OlAn-MH-sW3s
Message-ID: <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250303_234923_475615_546F816E 
X-CRM114-Status: GOOD (  28.78  )
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

On Tue, Mar 4, 2025 at 2:16=E2=80=AFPM Peter Zijlstra <peterz@infradead.org=
> wrote:
>
> On Tue, Mar 04, 2025 at 06:38:53AM +0100, Peter Zijlstra wrote:
> > On Tue, Mar 04, 2025 at 09:10:12AM +0800, Menglong Dong wrote:
> > > Hello, sorry that I forgot to add something to the changelog. In fact=
,
> > > I don't add extra 5-bytes anymore, which you can see in the 3rd patch=
.
> > >
> > > The thing is that we can't add extra 5-bytes if CFI is enabled. Witho=
ut
> > > CFI, we can make the padding space any value, such as 5-bytes, and
> > > the layout will be like this:
> > >
> > > __align:
> > >   nop
> > >   nop
> > >   nop
> > >   nop
> > >   nop
> > > foo: -- __align +5
> > >
> > > However, the CFI will always make the cfi insn 16-bytes aligned. When
> > > we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
> > > like this:
> > >
> > > __cfi_foo:
> > >   nop (11)
> > >   mov $0x12345678, %reg
> > >   nop (16)
> > > foo:
> > >
> > > and the padding space is 32-bytes actually. So, we can just select
> > > FUNCTION_ALIGNMENT_32B instead, which makes the padding
> > > space 32-bytes too, and have the following layout:
> > >
> > > __cfi_foo:
> > >   mov $0x12345678, %reg
> > >   nop (27)
> > > foo:
> >
> > *blink*, wtf is clang smoking.
> >
> > I mean, you're right, this is what it is doing, but that is somewhat
> > unexpected. Let me go look at clang source, this is insane.
>
> Bah, this is because assemblers are stupid :/
>
> There is no way to tell them to have foo aligned such that there are at
> least N bytes free before it.
>
> So what kCFI ends up having to do is align the __cfi symbol to the
> function alignment, and then stuff enough nops in to make the real
> symbol meet alignment.
>
> And the end result is utter insanity.
>
> I mean, look at this:
>
>       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall_l=
evel+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
>       56:       66 2e 0f 1f 84 00 00 00 00 00   cs nopw 0x0(%rax,%rax,1)
>
> 0000000000000060 <__cfi___probestub_initcall_level>:
>       60:       90                      nop
>       61:       90                      nop
>       62:       90                      nop
>       63:       90                      nop
>       64:       90                      nop
>       65:       90                      nop
>       66:       90                      nop
>       67:       90                      nop
>       68:       90                      nop
>       69:       90                      nop
>       6a:       90                      nop
>       6b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
>
> 0000000000000070 <__probestub_initcall_level>:
>       70:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall_l=
evel+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4
>
>
> That's 21 bytes wasted, for no reason other than that asm doesn't have a
> directive to say: get me a place that is M before N alignment.
>
> Because ideally the whole above thing would look like:
>
>       50:       2e e9 00 00 00 00       cs jmp 56 <__traceiter_initcall_l=
evel+0x46>     52: R_X86_64_PLT32      __x86_return_thunk-0x4
>       56:       66 2e 0f 1f 84          cs nopw (%rax,%rax,1)
>
> 000000000000005b <__cfi___probestub_initcall_level>:
>       5b:       b8 b1 fd 66 f9          mov    $0xf966fdb1,%eax
>
> 0000000000000060 <__probestub_initcall_level>:
>       60:       2e e9 00 00 00 00       cs jmp 76 <__probestub_initcall_l=
evel+0x6>      72: R_X86_64_PLT32      __x86_return_thunk-0x4

Hi, peter. Thank you for the testing, which is quite helpful
to understand the whole thing.

I was surprised at this too. Without CALL_PADDING, the cfi is
nop(11) + mov; with CALL_PADDING, the cfi is mov + nop(11),
which is weird, as it seems that we can select CALL_PADDING if
CFI_CLANG to make things consistent. And I  thought that it is
designed to be this for some reasons :/

Hmm......so what should we do now? Accept and bear it,
or do something different?

I'm good at clang, so the solution that I can think of is how to
bear it :/

According to my testing, the text size will increase:

~2.2% if we make FUNCTION_PADDING_BYTES 27 and select
FUNCTION_ALIGNMENT_16B.

~3.5% if we make FUNCTION_PADDING_BYTES 27 and select
FUNCTION_ALIGNMENT_32B.

We don't have to select FUNCTION_ALIGNMENT_32B, so the
worst case is to increase ~2.2%.

What do you think?

Thanks!
Menglong Dong

>
>
>

