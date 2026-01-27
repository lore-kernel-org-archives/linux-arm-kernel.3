Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080B0D2F033
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 15:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=; b=Pp6oWf3yJuf8DRRZX2V5Yd/Egd
	Hq5GIMS2jn5maFgkklXoNthudP1rYWwhJtkoeA4nn9vulT4toWs7YOoHVlnIhuikjQs4dI1/3tuJP
	h9tu8+Vr9oOCYUhptd3vSRUbNVezjcpo755R/Tl9RFFUyvoZOnNHWrd1xLHs2ajPH59RSxNts9Soa
	+/hCl9xrySuFXhe9yIXiktM30BuLAQZ8ZGhTMbIPov2KaH5gdL3IYADHDFXZDW+FOUpXffoB1gd2O
	EHrJHkDSEOl4MJHwW0ff4XDGwZewj2T5v0YybTqx0NRHShbuV3LAagetQu0tDOAMlDRd5UFKtTb7I
	ZvhAcepw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkdG-0000000EUtz-1quI;
	Tue, 27 Jan 2026 15:05:32 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkkd8-0000000EUt7-2lG7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 15:05:29 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-1233b953bebso891846c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 07:05:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769526322; cv=none;
        d=google.com; s=arc-20240605;
        b=E8pqX/bFtWYCJ6gXO+8VJFkUxr6t+xL3HY5Q2B5zPvLm4VzA4I/xrKMLrdPay7vVhc
         KrvDyIjntrqHOgcNinv2ZkWdsTOTXh3LWzja2TAL7mruZc04dl/ftX0wliZcSJIYbiUO
         ROnq652cOUsEsixAcystxihB7iJas6tABQNpQxMK8fe9w1G2R0UDnwNqIRoP6Kx7GfBz
         B9z+jpjFc3T5vpkEHwDI/E4FKm49i43X1FVsOL1WbBFDPFqcGRMF2rldNAdprbTLcLFA
         ZuRe5PQMxyO1ZcAgG0nNSwrEcw6u5SLoGDRl1HGdmN5XGPoVsYqP6dJ+SFkVvhdNkBkm
         P81g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=;
        fh=wGsvda0SkDxJSc/lJhtMEi3jL/bVFMFom5l1l5INkow=;
        b=Pfi4ED+INfgJLb7MEEtKqKaH9tuiwDL69srbYIrC/E/ciKJMTrvs/4bYv8zxBYmxvb
         dKJlzbo1Mdgw0YcBLfQJPFqgGVHin0jR+08ZhsucoRpG1K7BdVzxaG3zX5rAvj4INER3
         Ox/sFWgO8j6bjLCYOwni1lzOJPa/DPFNtapSxY3/pGwDT2RBuQ3a11PG4ImPCwDsca39
         ceZ2GbhbaiSGLGsI7P712T67nHYElL9zFe2GXfShAj4PmT+BQPrO583j3VNcmv+1wZO9
         TXwIyrtsYJf6BPieV+IfLgxbrbciQKKpYht+t5krz1vbFTU8xc+Jv4ZNw6ZDJ2p0+0L1
         3/wQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769526322; x=1770131122; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=;
        b=gAtsZK9DFeUZLYOWM1dv5Ftm1WBApATxikQeI6qLweAGMSLYMcJt7zZPg4YIrMOx5m
         THz+jrDQyzRtqTSFgZWWvZ5WvGODUvXjmu81cKTui42GtzEelia9Gn9vEQXUF5DljMrS
         QGS7KygpUG+UVRl5cXCPbZbCSQHqPPWp8MYF2Xh9p8xOM1ZeJiHgj6rwfgRVGmW0UV0F
         YayBnLbx7R+q+W9GPvdcxHd6qEc+BOq9MsayNV8zQSsRAqeGULmCqXmbljwUYjRjsbLO
         V/DnVradyUdIpfBfqZUgjlZ9jcXqHV1s3MRnn8q9elxw0l4v/TYuXb8uYl+rygT5/bPE
         velQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769526322; x=1770131122;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZojKbYgn1eECXdcNapnzyuqfvAMY57q50RdG9AWWOW0=;
        b=suts4GybsJdZsUtg2W3B04RRJB/MifGAM6FbvyBCxzrybk3s1z9GI4mdWXizxk7bq3
         A1oVNLx0L4sJa/Y5SLXOko2IG4XY+T2MbnFghKI6ZAV59kT4aqjhR5dj02iNg2/DQa3f
         2KR5TBAosiV2/qIQlG5FgLDBF3Z04v6IYXX62JKAx0wINZKIaqhesG5RlA3NUiV8APIa
         FnuWgZcIt8NFOMh02KC/Ik5rUBjCMYjD9mCL6UShFmb/atMnYnCz+j4EI/clYt8Bz53Y
         mVPkpF35phhfb9xyMOqfnoe3UZ6jAQ62LPv6xi4zRIzxZTp0Lgw19K4x1Zc1mDdgYyYr
         8Nhg==
X-Forwarded-Encrypted: i=1; AJvYcCXo0iem7E712/2BX6Ade1F1vERGt24v1WQnSWjxgh3laDhq/Wvgye20bolrVFFlmTFQ/Wx0qf6QtjVAsolsEx4P@lists.infradead.org
X-Gm-Message-State: AOJu0Yx7tF4elyIkFGcv9KZ3hmDm7nOYs9XnkOgpCJkEdt5VzHXcsy6z
	q8E1AOTmLEWogg1NmMuFFWbQIlHDHWnicaUDUmrNgwQLy9GVMHmgR2ZBR3Nqj/IxKi8i75XkP+4
	Ml5Qw54rg9nMGXTx+theCAyws9ktQm+AauY5YHYRY
X-Gm-Gg: AZuq6aL3EpFCVYcBpyqDK+9w7viI9hkHg0TGwnnrXD3rVwi2MARRjVfuiYOKQ9O/wnY
	pyncsbWWZmP+0/EtKzuTWD8gel6acXloolvCt9YAgjyoU8uep8xEQnelfsZZi6Imf7X1jpRs69L
	j3vPIJX5hXElkadapiZXWJxUOFTArnhAfT6Pg+WsUgL49Ct/v6uqdcxh2cO3P/qKn5dD2xqAAlz
	BAmSRG6gg8NMtYQs15EyPN5QTk/Eny26wm84yIKFDlOsjTjC8WBTXK+SWb/uTMzKfCwcq4RM6Ah
	Vzv0xW4ZA0qk7YU+/nlSI3huzwNfwnaI9cns
X-Received: by 2002:a05:7022:6889:b0:119:e56b:c74b with SMTP id
 a92af1059eb24-124a0078feemr1167440c88.16.1769526321283; Tue, 27 Jan 2026
 07:05:21 -0800 (PST)
MIME-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com> <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com> <aXfGcIpeXQNRUI-A@elver.google.com>
 <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com> <CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
 <20260127143026.32429f32@pumpkin>
In-Reply-To: <20260127143026.32429f32@pumpkin>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 16:04:45 +0100
X-Gm-Features: AZwV_QjkVcqcin6Gi2JYj2B3wWNoUiG-N9J56-PyOvmC4Ux7-7iPyngI5z7-NvM
Message-ID: <CANpmjNP6qRm0M9Za-=Lm8N87o-GukO5nQeAVpW=bbXRnip4Fvg@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_070526_964201_B03CC77C 
X-CRM114-Status: GOOD (  43.40  )
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

On Tue, 27 Jan 2026 at 15:30, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Tue, 27 Jan 2026 13:01:22 +0100
> Marco Elver <elver@google.com> wrote:
>
> > On Mon, 26 Jan 2026 at 23:24, Arnd Bergmann <arnd@arndb.de> wrote:
> > >
> > > On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:
> > > > On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> > > >> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> > > >>
> > > >> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> > > >>
> > > >> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> > > >> on gcc-13, clang-18 and earlier, and not strip out qualifiers.
> > > >
> > > > I think we only need to worry about Clang for LTO builds. But yeah, our
> > > > minimum supported Clang is 15, so between 15-18 it'd be broken.
> > >
> > > Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
> > > fine here.
> > >
> > > >> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> > > >> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> > > >> to do the right thing already.
> > > >
> > > > It'd still be broken for Clang 15-18, so it won't help much. We need
> > > > this to work for more than "scalar", so even though it'll work for Clang
> > > > 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> > > > _Generic-based __unqual_scalar_typeof() sooner than later.
> > > >
> > > > I was able to make this work for older compilers:
> > > >
> > > ...
> > > >  #define __READ_ONCE(x)                                                       \
> > > >  ({                                                                   \
> > > >       auto __x = &(x);                                                \
> > > > -     auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;      \
> > > > -     union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;          \
> > > > +     auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret; \
> > > > +     union { __read_once_typeof(*__x) __val; char __c[1]; } __u;     \
> > > >       *__retp = &__u.__val;                                           \
> > >
> > > >
> > > > Thoughts?
> > >
> > > Looks better than __unqual_scalar_typeof() to me. Would it make
> > > sense to do the same __read_once_typeof() in the asm-generic
> > > version of __READ_ONCE()? I don't remember if we discussed it
> > > in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop
> > > pointer qualifiers when reading from scalar types").
> > > We probably didn't have __auto_type back then.
> >
> > I don't see the point for the asm-generic __READ_ONCE(): it's not
> > wrong to cast to 'const volatile volatile T*' nor 'const volatile
> > const T*' etc., which is dereferenced directly and not stored in any
> > temporary variable when used in READ_ONCE(). I actually don't know why
> > __unqual_scalar_typeof() is used in the asm-generic __READ_ONCE(),
> > which just adds 'const volatile' right back.
>
> That looks historic, once upon a time the code was:
>         typeof(x) __x = __READ_ONCE(x);
>         smp_read_barrier_depends();
>         __x;
> but const needed stripping and someone decided to cast the result back
> to the original type.

I think the bigger issue was 'volatile': "Passing a volatile-qualified
pointer to READ_ONCE() is an absolute
trainwreck for code generation [...]" per dee081bf8f82.

While the above with the temporary is gone for the asm-generic
version, the arm64 LTO still has the temporary and we need some
qualifier-stripping helper.

And a similar pattern also still exists for the asm-generic variant of
__smp_load_acquire() and friends.

> Of course that is pointless since the qualifiers aren't relevant on an
> 'rvalue' so are then discarded.
> Then the barrier and temporary variable got removed.
> (The barrier was only needed for alpha - which has its own __READ_ONCE()).
>
> In the arm LTO version the ?: will also remove the qualifiers.
>
> > And __READ_ONCE_SCALAR() appears to be gone, where the
> > qualifier-stripping resulted in better code-gen.
>
> The qualifier stripping was needed to read a 'const' variable.
> Looks to me like the 'better code gen' happened earlier.
> The 'earlier' version took the address of the on-stack volatile
> variable.
>
> So you may not need to remove the const/volatile qualifiers at all.

Yeah, I think so too (for the asm-generic variant that is). But I
won't mix up the arm64 fixes with possible asm-generic ones to avoid
this blowing up too much. I don't see a dependency on the asm-generic
cleanup, so we can clean it up separately; but I think it's purely
cosmetic unlike this arm64 LTO version.

