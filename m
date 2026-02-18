Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8505E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 20:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SULxcRNXykPTvauwd8uvSy6xGyLA70tlHn3TpRn1HzQ=; b=vI/q2vRvXWpGTNbYSqBlugc/+R
	DyrS8RvAuq32b1sKdTfk5Mu+wYpFrl2peTx62MUdayKygnljDIQqDMIK5FmuLwL5EIqnV2ZhHreQy
	JPySiqrY4SukTn9cIWyKu3W+7RFvtg8W+eaShG7xlrR/H6fGLN2ix3rqLx9f4OMKprekYTaec6bgJ
	Mu7o36dXRrDrvoVp3LQx+ncPyfRk+MXDYgA9XtKm3778O40sbboCKL966IINwLlog02Qnhmbe2dzb
	fUHmeqQwqGcNvALo8Q5RlHP0BNJ0bK6PQixCz9X8MJmGRjPc92YhYlshG0WQa+eW5hNLOqRXS7cn1
	VbOfKVQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vso0m-0000000AMgs-3vwr;
	Wed, 18 Feb 2026 20:19:04 +0000
Received: from mail-ej1-x642.google.com ([2a00:1450:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vso0k-0000000AMgM-3lD7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Feb 2026 20:19:04 +0000
Received: by mail-ej1-x642.google.com with SMTP id a640c23a62f3a-b8fbb24a9a9so185775066b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 12:19:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1771445940; x=1772050740; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SULxcRNXykPTvauwd8uvSy6xGyLA70tlHn3TpRn1HzQ=;
        b=PLMMVkt6ykS5BdnB0lXCYOa8VY4D9kde9Ei0UluNqKlP/PjWvX+YIxMJMjZ7MAUGxR
         Q4mGfN4O0sQhWgBTgVtejrMnPHlm8scNXJoZ6y0eCzFfmmdgK6OwJTZ9ljnX1DYttsjW
         U+sYXliC/brZP4Sq8fDlpwa9u8onG81tiQl/U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771445940; x=1772050740;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SULxcRNXykPTvauwd8uvSy6xGyLA70tlHn3TpRn1HzQ=;
        b=IUdN3P1tmyoB90MnfJJWQPjz3aFPHkphNrIUgCYzgO7eVSIXb2LnCnm7r6TT2CxSA1
         w5gdOB4PJ3nvbcQnQugixABj2LRKNbHx1ijTUJ6Ku56hfc97dIidFaeVrRD64//yCp5E
         sj1G3DGgWQupNlVtOfWxCZc9EP1e9MWboQsYqKTQ+3ydec/vw2a+ghpCUHpQ3GjZkNFH
         mQHhiCIh9lYks2vZSVbVrT4IkQuvJLKGhTVrLB+ojCzt5fPViSw5LRHqwJbWIsrjv92n
         NuHkvldjbNOapYVq9kD8HV51jxVj/T7spPwUlmnUrJKGr1lYMST4MJ3J5EF0l3eugHl1
         xC2w==
X-Forwarded-Encrypted: i=1; AJvYcCUNQxm1bIPuEoxm2kX5R5moc6uXERGeBFFOmTSnBjE8P5PEx7L160ChFWZex2X9LdQhLezocHxolDpwjEIUVDV2@lists.infradead.org
X-Gm-Message-State: AOJu0YwYtAW6OavsWJugYVdlSUOCJo5a1VgoOjKJYx2qbh2tFPEKdbXl
	qNtU+5lSnnn2eyAeQY1mPttrKLIxHYsXr2meO2iQIjYo3GiiL58bfg8qujs1bgqFKZE1nVi5dak
	vsm8D0rMPeg==
X-Gm-Gg: AZuq6aJoYbbgzExHdaqreOFKPpbHnDYVJNC3IzgS7GqwzkntoqRyXKYMS/1owkJwikq
	+Xq1r8JoWf0B9DyzboFxWGsSiR80BJ8c9v3MssYv4LAtEUcFfTUTs1sg3LW8F84R43U6CZP028K
	QKajfl7/0XoNBq8PPtzn/cVxOuiQQ8bZ+gh0TzvEdwMtcwP4unqhcPZfBkg3zlm7BL1Yb2xijYj
	YQZjMknQgoJWXXz6q3rQTTi+x2GnuqCa7bjWP0ccgvKDxQwDgT4rdvBya5/Bgl9bxtfOpwxYdZ9
	CUNw8KxjDxhl8VaG+AzfWn4Fs7prapanhhkF2aicQzeMGQmgadL1kEL2jUYx+FCevuorT7BQ3sj
	No1depUjgQPb4bpCNhDC34NZotAqtDwgFEP2l0xt+gHJxbR9Nk/89R7lYnlxPFVAdjX9ZocKyq7
	A25QADZrq6Tp9jkgWj0imBgo06791+hhD1xBCA5qStEoPXaAFSB3F3d/fRdMEnUtdCxSYUvY7F
X-Received: by 2002:a17:907:6d03:b0:b88:440b:65c4 with SMTP id a640c23a62f3a-b903cff38b2mr157175366b.25.1771445940039;
        Wed, 18 Feb 2026 12:19:00 -0800 (PST)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com. [209.85.218.41])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8fc735d66esm467060166b.4.2026.02.18.12.18.57
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Feb 2026 12:18:57 -0800 (PST)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b8fa79b9fcdso55781566b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Feb 2026 12:18:57 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUkFRDNiu9ojgcV9h4f/1K/02P6StMdujyi9mOH03Zuyh3ABXmARebX9r6G51Zik85qVbYu85/ZGrIZX1ZHTO1k@lists.infradead.org
X-Received: by 2002:a17:906:fe09:b0:b8f:e98e:ff5d with SMTP id
 a640c23a62f3a-b903ce88e4emr213862566b.13.1771445937188; Wed, 18 Feb 2026
 12:18:57 -0800 (PST)
MIME-Version: 1.0
References: <20260206182650.6c21b0ff@pumpkin> <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
 <20260215221656.68b2fc1d@pumpkin> <CANpmjNOnOqq2k41=iNsgZLXAzspVQhcTZ88Nvms_c_0M+7b7YQ@mail.gmail.com>
 <CAHk-=wioS+vB8aBxWBgdEfXqDq5Ynr9gyY=GhU7gxO9G_C+_6g@mail.gmail.com>
 <20260216110915.4f0d5490@pumpkin> <CAHk-=wjJQQfWpAxigafuyrgxg8CdQWSimVYMk16_j0vWwEkjag@mail.gmail.com>
 <20260216174324.75d47e37@pumpkin> <CAHk-=wgQ8DOxaNY5cBWg+sUkM5Kk6rKYGRHXsZQLtknO_UX+QA@mail.gmail.com>
 <CAHk-=whFGxN0nUffzCsR_NZnQ5TTu+8QFGSfca1j42kDK1a1tw@mail.gmail.com> <aZYUUsROBSpoPtav@tardis.local>
In-Reply-To: <aZYUUsROBSpoPtav@tardis.local>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 18 Feb 2026 12:18:40 -0800
X-Gmail-Original-Message-ID: <CAHk-=wihuAnUwoqh-KGRQ5WTmu39Zdhjzk-VbFNOx-yKjyvQoA@mail.gmail.com>
X-Gm-Features: AaiRm50CUFiXxS4bOK8f8-OJtB3blsf2VcJ1-Ft-EZ2UkUuahsamp9XOBwWr4tk
Message-ID: <CAHk-=wihuAnUwoqh-KGRQ5WTmu39Zdhjzk-VbFNOx-yKjyvQoA@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Boqun Feng <boqun@kernel.org>
Cc: David Laight <david.laight.linux@gmail.com>, Marco Elver <elver@google.com>, 
	Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_121903_010442_2DBBFB63 
X-CRM114-Status: GOOD (  28.23  )
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

On Wed, 18 Feb 2026 at 11:34, Boqun Feng <boqun@kernel.org> wrote:
>
> > I  just checked a few test-cases, and I don't think anything has changed.
> >
> > All the trivial things where __atomic_load_n(__ATOMIC_RELAXED) *could*
> > do better than just our old code using "cast pointer to volatile"
> > resulted in no better code generation.
> >
>
> By any chance, could you share the test cases? It'll be really helpful
> to represent what semantics we really want to compiler/language folks.

Lol, it was just a one-liner test where I compared a volatile pointer
with a regular pointer and a __atomic_load_n(), I didn't even save it.
It was checking two different bits in the same word.

It was something trivial like "(*ptr & 1) && (*ptr & 2)".

With a "volatile", that obviously has to give two loads, because
that's the required behavior of "the load is visible as an IO".

But what I want from __atomic_load_n() is that it does all the
optimizations that *hardware* is allowed to do on a load.  Loads are
not "visible as an IO", but they have ordering requirements, and they
cannot be torn.

That means that basic CSE is obviously allowed, so loading the pointer
value twice results in the compiler just doing a single load.

But it has a subtler meaning: while CSE is allowed, a load has to be
done at least once. That means that you can combine them, but you
can't hoist them outside loops and mke them go away entirely inside
the loop.

So my basic test-case is literally just check for that trivial case.
And the atomics fail that completely. Which makes them entirely
pointless. They don't generate any better code than "volatile" does.

And if they don't generate better code, then they are worthless
complexity and garbage.

And yes, that "check two different bits" actually comes from real use,
ie it comes from my annoyance with "test_bit()" kind of semantics.

[ Time passes ]

Bah. Based on the above, I just recreated a trivial test-case of what
I think *should* work. Here:

    #ifdef BAD
    #define ACCESS(p) (*(p))
    #elif defined(VOLATILE)
    #define ACCESS(p) (*(volatile unsigned long *)(p))
    #else
    #define ACCESS(p) __atomic_load_n(p,__ATOMIC_RELAXED)
    #endif

    static inline bool test_bit(int n, unsigned long *p)
    {
        return (1ul << n) & ACCESS(p);
    }

    int myfn(unsigned long *a)
    {
        while (!test_bit(3, a))
                /* Busy loop doing nothing*/ ;
        return test_bit(1, a) && test_bit(2,a);
    }

and then just do something like this:

    gcc -O2 -c -DVOLATILE t.c && objdump --disassemble --no-show-raw-insn t.o

to see what gcc generates.

The -DVOLATILE case works:

0000000000000000 <myfn>:
   0: mov    (%rdi),%rax
   3: test   $0x8,%al
   5: je     0 <myfn>
   7: mov    (%rdi),%rdx
   a: xor    %eax,%eax
   c: and    $0x2,%edx
   f: je     1b <myfn+0x1b>
  11: mov    (%rdi),%rax
  14: shr    $0x2,%rax
  18: and    $0x1,%eax
  1b: ret

Look, it loops until bit three is set, then it ands bits 1 and two,
but it has up to three loads to do this all.

With just plain loads (the -DBAD case), you get this:

0000000000000000 <myfn>:
   0: mov    (%rdi),%rax
   3: test   $0x8,%al
   5: je     13 <myfn+0x13>
   7: not    %rax
   a: test   $0x6,%al
   c: sete   %al
   f: movzbl %al,%eax
  12: ret
  13: jmp    13 <myfn+0x13>

which just results in an endless loop if bit three wasn't set, because
the atomic load was hoisted outside the loop. Plus there was no
guarantee that you couldn't have TOCTOU races (which this example
doesn't show). So that BAD case really is unacceptable, because it's
actively buggy.

And the __atomic_load_n() case generates pretty much the same thing as volatile:

0000000000000000 <myfn>:
   0: mov    (%rdi),%rax
   3: test   $0x8,%al
   5: je     0 <myfn>
   7: mov    (%rdi),%rdx
   a: xor    %eax,%eax
   c: and    $0x2,%edx
   f: jne    18 <myfn+0x18>
  11: ret
  12: nopw   0x0(%rax,%rax,1)
  18: mov    (%rdi),%rax
  1b: shr    $0x2,%rax
  1f: and    $0x1,%eax
  22: ret

except it's actually randomly worse for some unfathomable reason.

So tell me: why should anybody ever use that "modern" thing that
generates worse code?

What I *WANT* is something like this:

0000000000000030 <myfn>:
  30: mov    (%rdi),%rax
  33: test   $0x8,%al
  35: je     30 <myfn2>
  37: not    %rax
  3a: test   $0x6,%al
  3c: sete   %al
  3f: movzbl %al,%eax
  42: ret

and I can make the compiler do that by just doing the CSE myself and
not using a test_bit() helper.

But until the atomics do this *trivial* case right, there is
absolutely no way that we'll use them in the kernel.

And no, clang does no better than gcc. It's possible that the C
standards have specified the semantics of atomics badly and compilers
are forced to generate crap - I wouldn't be surprised.

But more likely it's that nobody cares, and compilers generate crap
because the atomics are complicated enough that it's not worth the
pain to do anything better.

But as long as nobody cares about those code generations issues,
"volatile" is simply superior.

It is standard and portable, doesn't rely on modern compilers, and it
generates equivalent or better code.

I feel like I'm not asking for much. I'm literally asking for an
__atomic_load_n() that is better than volatile

Right now it is WORSE.

              Linus

