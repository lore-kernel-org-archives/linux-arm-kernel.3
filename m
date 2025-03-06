Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A6D8C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 03:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Jsf4FJkD/oQcph6Un/Rvp8XZNnCIvEKvX+i6GNumRQ=; b=gFYb3iRgagQmmh8eKZVF0ESlXm
	oCV7Sk2KlwnyiaHwSrttzrGoxYpZC5lc2ZFTfe9IBiRifUp4mBN+xwv4HSWocRH2kQAf5Wo7kKV19
	o5ue7QgExaTlryKivyrQ92B+93ML8hsiJTKQ418PHXteNkP0PoEFlD5xDpKNvAkroKEdMk4qRg29l
	OKxYh5dAQybfAQ6HUxWWJjPGd/lagP1Pxhlwg9kC7gow9Hk0AUvbBqpw1t4tgGsKiHAD8tiVlqISD
	rL563D2RsNpO0tss/OwUm1Ic6+ucklfpc0DSG3ZAv3ikbTD+SAYU+uGXdTS98uieOU5IsnwMHVLyJ
	66sUnPQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1US-00000009tjT-48fA;
	Thu, 06 Mar 2025 03:01:41 +0000
Received: from mail-yw1-x1144.google.com ([2607:f8b0:4864:20::1144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq1Sp-00000009tXT-31T2
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Mar 2025 03:00:01 +0000
Received: by mail-yw1-x1144.google.com with SMTP id 00721157ae682-6feafc707d3so1780917b3.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 05 Mar 2025 18:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741229998; x=1741834798; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jsf4FJkD/oQcph6Un/Rvp8XZNnCIvEKvX+i6GNumRQ=;
        b=Yq0JVvi0c0feEjWmq0YBdHIC8GBr3sI6GLdPipfJUMJjbS1/tqxqvUeBMCZ+OBq6jA
         AHBUfMHZX6jqSU7ThN+hxzfqhFWH2H2ETdYLlQOb3bvWrt//EWTmxjvRN+ErbFr0hW+F
         AA1hVs8syuiGQrBPNWZwjMVsfOYr9F86NdnMvdh8NjosBoxmq4jaT/CA9Irww3EsFvki
         P3tJpB/XweAfJA6ZcPhs+h7aKUcNlpAXcuD5YYBnLclMETtgLj0UI+tIALd4EQ2JSg/L
         VOqwoYiJH5kjIgeqeIyGIt4L89ogkvWS/2OP4IuLJHT7e2ttKtj5lB4DrIEHUTKgnjO3
         hs3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741229998; x=1741834798;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jsf4FJkD/oQcph6Un/Rvp8XZNnCIvEKvX+i6GNumRQ=;
        b=PUSkeCa28gR97DzsW1OiFK4hPn+Hj5t8oyVq/+715Dkh0jTWu4YTdYXzxgYSXyHSIb
         bqPzBTLVUD9g4eJ5GLnGNe2XulRJXKkfJJ+y3Ocd/16U/dQaeFY7uqPThurQ0fcqWwmf
         bMWEtOrb0YDz2kUFcebQkx+dZI41kcax0cSGr7Y3sjNLDasa/FGzqUaQUzQqgb3XHe4x
         X85WhdFhUrG9M0OIcurTK5FrMEsnxemKYuaK0leY1Q2UoIsUU/BJnaKemDLcNUZprkEo
         it4ekx02s4KXqPTfmja7/++cl3kGj9a6o/8yQ+Y+Ra7hZnOEmwaDtRnoi5O6kdYGrY/l
         EiLQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKcso9/imCAzgq7DBmBhS0lAjR+eV9BqnE1GxVk2lh9qw2/aVCh1pvGInZbfaq+nBpiDZPEguhFv5+nDTanrPn@lists.infradead.org
X-Gm-Message-State: AOJu0Ywu4BWVPGUEvgcXo/AiqXnoGJdu59V97J6VQN2TSGncXiR8fUO+
	p7zCg9YGehhDXukT6vAVCyjNyg1vk9wqCwZzwNzqbXD55e10V8cayZ0yBhva38mBczNpuGsZMbq
	+vffrd1V4NoYpK1t20qfUJjft5q4=
X-Gm-Gg: ASbGncvxAD+ggAbPzuqhFQlghNnH2I8M0CH8BnX0Vun2C3yIV2q6SKodH+xZ9BKrUm/
	h00NqzWc0JS3Vbh+V1qhSigKZW7UDk8W0Pe2SlrogQTOm7WOpKr1ihGVvnPIR0QvC3FWEKKvAH9
	U52Sg1v8flC9PaJHirPXGNMXxh3A==
X-Google-Smtp-Source: AGHT+IFeoYjcATqNsYPiuA+luhOQkjmbzDn/LQX+nvbyZv2699UHF1GDqeNPtOjeUYjHowLaxUhtHEMTkQhU0GT/F40=
X-Received: by 2002:a05:690c:680f:b0:6fb:1e5a:fcd8 with SMTP id
 00721157ae682-6fda31222edmr79126807b3.28.1741229998289; Wed, 05 Mar 2025
 18:59:58 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
 <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
 <20250304053853.GA7099@noisy.programming.kicks-ass.net> <20250304061635.GA29480@noisy.programming.kicks-ass.net>
 <CADxym3bS_6jpGC3vLAAyD20GsR+QZofQw0_GgKT8nN3c-HqG-g@mail.gmail.com>
 <20250304094220.GC11590@noisy.programming.kicks-ass.net> <6F9EF5C3-4CAE-4C5E-B70E-F73462AC7CA0@zytor.com>
 <CADxym3busXZKtX=+FY_xnYw7e1CKp5AiHSasZGjVJTdeCZao-g@mail.gmail.com> <20250305100306.4685333a@gandalf.local.home>
In-Reply-To: <20250305100306.4685333a@gandalf.local.home>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Thu, 6 Mar 2025 10:58:18 +0800
X-Gm-Features: AQ5f1Jq_Oa1dQKvMfe98EdRc4mzdybzOfF6-Dlq5oONytu-pPWGY-R6eybChn8I
Message-ID: <CADxym3ZB_eQny=-aO4AwrHiwT264NXitdKwjRUYrnGJ2tH=Qwg@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] x86/ibt: factor out cfi and fineibt offset
To: Steven Rostedt <rostedt@goodmis.org>
Cc: "H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>, mark.rutland@arm.com, 
	alexei.starovoitov@gmail.com, catalin.marinas@arm.com, will@kernel.org, 
	mhiramat@kernel.org, tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, ast@kernel.org, 
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
X-CRM114-CacheID: sfid-20250305_185959_805166_26EDE017 
X-CRM114-Status: GOOD (  46.86  )
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

On Wed, Mar 5, 2025 at 11:02=E2=80=AFPM Steven Rostedt <rostedt@goodmis.org=
> wrote:
>
> On Wed, 5 Mar 2025 09:19:09 +0800
> Menglong Dong <menglong8.dong@gmail.com> wrote:
>
> > Ok, let me explain it from the beginning. (My English is not good,
> > but I'll try to describe it as clear as possible :/)
>
> I always appreciate those who struggle with English having these
> conversations. Thank you for that, as I know I am horrible in speaking an=
y
> other language. (I can get by in German, but even Germans tell me to swit=
ch
> back to English ;-)
>
> >
> > Many BPF program types need to depend on the BPF trampoline,
> > such as BPF_PROG_TYPE_TRACING, BPF_PROG_TYPE_EXT,
> > BPF_PROG_TYPE_LSM, etc. BPF trampoline is a bridge between
> > the kernel (or bpf) function and BPF program, and it acts just like the
> > trampoline that ftrace uses.
> >
> > Generally speaking, it is used to hook a function, just like what ftrac=
e
> > do:
> >
> > foo:
> >     endbr
> >     nop5  -->  call trampoline_foo
> >     xxxx
> >
> > In short, the trampoline_foo can be this:
> >
> > trampoline_foo:
> >     prepare a array and store the args of foo to the array
> >     call fentry_bpf1
> >     call fentry_bpf2
> >     ......
> >     call foo+4 (origin call)
>
> Note, I brought up this issue when I first heard about how BPF does this.
> The calling of the original function from the trampoline. I said this wil=
l
> cause issues, and is only good for a few functions. Once you start doing
> this for 1000s of functions, it's going to be a nightmare.
>
> Looks like you are now in the nightmare phase.
>
> My argument was once you have this case, you need to switch over to the
> kretprobe / function graph way of doing things, which is to have a shadow
> stack and hijack the return address. Yes, that has slightly more overhead=
,
> but it's better than having to add all theses hacks.
>
> And function graph has been updated so that it can do this for other user=
s.
> fprobes uses it now, and bpf can too.

Yeah, I heard that the kretprobe is able to get the function
arguments too, which benefits from the function graph.

Besides the overhead, another problem is that we can't do
direct memory access if we use the BPF based on kretprobe.

>
> >     save the return value of foo
> >     call fexit_bpf1 (this bpf can get the return value of foo)
> >     call fexit_bpf2
> >     .......
> >     return to the caller of foo
> >
> > We can see that the trampoline_foo can be only used for
> > the function foo, as different kernel function can be attached
> > different BPF programs, and have different argument count,
> > etc. Therefore, we have to create 1000 BPF trampolines if
> > we want to attach a BPF program to 1000 kernel functions.
> >
> > The creation of the BPF trampoline is expensive. According to
> > my testing, It will spend more than 1 second to create 100 bpf
> > trampoline. What's more, it consumes more memory.
> >
> > If we have the per-function metadata supporting, then we can
> > create a global BPF trampoline, like this:
> >
> > trampoline_global:
> >     prepare a array and store the args of foo to the array
> >     get the metadata by the ip
> >     call metadata.fentry_bpf1
> >     call metadata.fentry_bpf2
> >     ....
> >     call foo+4 (origin call)
>
> So if this is a global trampoline, wouldn't this "call foo" need to be an
> indirect call? It can't be a direct call, otherwise you need a separate
> trampoline for that.
>
> This means you need to mitigate for spectre here, and you just lost the
> performance gain from not using function graph.

Yeah, you are right, this is an indirect call here. I haven't done
any research on mitigating for spectre yet, and maybe we can
convert it into a direct call somehow? Such as, we maintain a
trampoline_table:
    some preparation
    jmp +%eax (eax is the index of the target function)
    call foo1 + 4
    return
    call foo2 + 4
    return
    call foo3 + 4
    return

(Hmm......Is the jmp above also an indirect call?)

And in the trampoline_global, we can call it like this:

    mov metadata.index %eax
    call trampoline_table

I'm not sure if it works. However, indirect call is also used
in function graph, so we still have better performance. Isn't it?

Let me have a look at the code of the function graph first :/

Thanks!
Menglong Dong

>
>
> >     save the return value of foo
> >     call metadata.fexit_bpf1 (this bpf can get the return value of foo)
> >     call metadata.fexit_bpf2
> >     .......
> >     return to the caller of foo
> >
> > (The metadata holds more information for the global trampoline than
> > I described.)
> >
> > Then, we don't need to create a trampoline for every kernel function
> > anymore.
> >
> > Another beneficiary can be ftrace. For now, all the kernel functions th=
at
> > are enabled by dynamic ftrace will be added to a filter hash if there a=
re
> > more than one callbacks. And hash lookup will happen when the traced
> > functions are called, which has an impact on the performance, see
> > __ftrace_ops_list_func() -> ftrace_ops_test(). With the per-function
> > metadata supporting, we can store the information that if the callback =
is
> > enabled on the kernel function to the metadata, which can make the perf=
ormance
> > much better.
>
> Let me say now that ftrace will not use this. Looks like too much work fo=
r
> little gain. The only time this impacts ftrace is when there's two
> different callbacks tracing the same function, and it only impacts that
> function. All other functions being traced still call the appropriate
> trampoline for the callback.
>
> -- Steve
>
> >
> > The per-function metadata storage is a basic function, and I think ther=
e
> > may be other functions that can use it for better performance in the fe=
ature
> > too.
> >
> > (Hope that I'm describing it clearly :/)
>

