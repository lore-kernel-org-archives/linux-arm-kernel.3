Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0E44D358EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 10:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=; b=GtD/98/3RUO3UheuU2N3moEAWu
	6PAoM+BSFbHaifmZAWD07R28S2Bx9qIxlZ2EbdTCZiUAIEjIItELzFKIBRVSeYdqMb2cq08KLYyFf
	OZphlOc5oRvCMqSbj7gooLJJRg0jCgxCPtB2hXqSg9oUj6mbt3F/dREJMpzoVZ/WGGV/SVHio6AfC
	HEnF2bbUqvF0WnIZi/Q+Zw0Q061Uu7bzCgzuA2J51BvW7Ufz1Gv7haSKy++eODdRZ9FUS+t8QyICh
	d+dHkYGyVeSNQIa5HQs8iSjof6CaBGYcNt+Wc/mqRKgq4J4pgXYdCMuhcTweGC/CRwBJvDwaAjCG9
	RAyyR8+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlP1l-0000000HZ1u-2nBq;
	Thu, 29 Jan 2026 10:13:29 +0000
Received: from mail-dy1-x1336.google.com ([2607:f8b0:4864:20::1336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlP1j-0000000HZ16-15lm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Jan 2026 10:13:28 +0000
Received: by mail-dy1-x1336.google.com with SMTP id 5a478bee46e88-2b71515d8adso837247eec.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Jan 2026 02:13:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769681606; cv=none;
        d=google.com; s=arc-20240605;
        b=fFLwhq/vAZxDkX7PS0Da63LfpHst2ROJbJ5vgEzrTsWJXKxTdVkmslpsJYAm9OP0sH
         YzJy/03lxnBkcvM4qOmOFBVY+ApNSyaiQq+LwRkEN5UvZiwZlJsycjXaoF5HMPpYfuIq
         AU2oQj+urlh2cox4N1acKaQsvsPqeXBtCkZULlSFFdYuaT4ZAPWc4N15JI8UNaky4ir/
         RLZoZ1eGjuzUDdqVuBmlfRquxj1cz2L/49URXp6VZIKp4+2s6t4CYTMvUXdfwISkLZu5
         iegrO9arC6UKtsE6xjoXg9ZumTMPrhtRBJ/5vyucWbWqjZbDpSdT/WG4CFSZ7DMObVvS
         EhNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=;
        fh=KGLW+UG6mPkYQqpjeI8brMTv0iAwNUjjipEgg7vBzzM=;
        b=gZeG1FyM1ltPTc4+O2oJhWZv//C83qukn/ydT8dGdRZWpKbXp8hwdZnsrMOe9o0Yzb
         aqprXuOZgarY2aPa/PVkxld1IPuZg9rkNdQccvfNRLC+xVrtkVVeW/Gpp/b/OPKxr7cO
         88GOz/h7iVSlmnnP4lcrqxU62uK8ImDm4U0oaN82pjvLqiENFN+QJrUdw2D1tzdNGJ5X
         RDt83IoOC0LaKCZ3pqgcFXWQunJGci86S47r9TFKK6pWNibBaXXxQIjmvfywQOgvdvK4
         kKLhSgO65w4USKnnUJfYvRImmmHlijXG7HkwV82dIePDLb2VXzC5f40RQopOW/GVIQYG
         +fDA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769681606; x=1770286406; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=;
        b=r55TgGfQKEUsSn+5vfDApCXmu+nd1UzGCWNWBnRtHGbNU8OX+P7CqIv659awzrg3b9
         PkQz2gWq/pkiQ7U3S3unQgwLvwjgNW81H8t+8D+iPeT8gxMbJfy6BIKp6rGdbEm73Y9e
         zKxq/9EHTd84UKNB6FzeFuMnU7MO+mxGDWNzyMqFCmtSc8NQt8bN55DHxiLFzKniU5sM
         LM8UJyuuXN7KmoAprvZxzEDM7sXMtsNnWI1EEZK2Rf1dMIWHnX8WxzGtzMj+LBr4lu9X
         N8ndVnYYes8MIQf6bBYZ+UWLfik0pZRaOKWFBOiON9OSc7UUmcR5vd2n3lwCXMbtVNL3
         KWNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769681606; x=1770286406;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lc+XjDBA+a8aHFibRHjswsqkmvLkJszDVJ8RfsBnEd4=;
        b=RiXQe2p+SOZlN0X2RM13/RRau9vr4HK1DjMCSlCy5UfD+HMvpFvzCzLvUmaNSjBjvc
         1HR5MNtTAFuD7aNSKNjjZcdTfmCsRerTTaTz8SuDCIm7dqdJ85wsOq0/L+9a14P1U+Ku
         kih3H/y76QOQ1/vrra1vKR/ELjHcVtii0WvQlZPvoaPIywvxJQB5srgb0jWkdZchccPR
         OD7gzyon2PhgrBWddNSPzYCHIxqo2dWp/G008KUTF61NjWOplwef5awd6atRoh3Pp3Jo
         jus9UPDV+1+M46iiAfx5c0WHbbCdm4k8vnZY9sI+X6EE1xmhd3ewqFSdGL5HQKoZEQSE
         2Jmw==
X-Forwarded-Encrypted: i=1; AJvYcCUMOhgDNanb8kkiXMYRAiah+dyfl1JStaeBc8oBmu3XcXgAtm2OfHX12rlrgc0mZZP1Wc6wW7QqxSboKmNaGHCN@lists.infradead.org
X-Gm-Message-State: AOJu0YzVB5I/xSE7hhZfQdzULgXJA0sQM1RUJxkvMlDhiRWjf8/5LeXk
	n3frl/P87pq8OF1FTtBuGCjfdGP6m/mSr6WO8m58fsHl6ExvTR9XVkEt//iSNtHFNlS7LeeWfGs
	wU1e/ZfqFHjaEziwMNaD+fwGc6wNLYFySJOw9PWR2
X-Gm-Gg: AZuq6aIxD0q9zidnvjH5/r7Gj+jk9mBa/ouIjts9mYRRHwnM++GmLWdMUwlZYEsQ83Z
	rXhAoDb0O9hA6ECBQ8QJuFcw78MUKl6Pwg1wvf3nMcK/JMOZExpRmtEK9h6dwb0HVtNf+hya+QW
	t2rwDaBDl7ojgI+sY7cWZTML4DPBMq7cH/tVk+LgSO/ce48c8Cy1hby4jsOPPvcVxuuIsDo1Cwl
	OCA1HFfo+A++Yrz+xGYTqYMwOBeh9kDgCJ3XBxDuwP8ebv/YzBnFO50hVLSnVks2vgfR7jTPfvy
	HfAyXGdU4KpXUslsSkP2n2uSavw8zYADQz0=
X-Received: by 2002:a05:7022:23a8:b0:11b:9d52:9102 with SMTP id
 a92af1059eb24-124a008b0a3mr4817016c88.6.1769681605889; Thu, 29 Jan 2026
 02:13:25 -0800 (PST)
MIME-Version: 1.0
References: <20260129005645.747680-1-elver@google.com> <20260129005645.747680-3-elver@google.com>
 <20260129100332.500248d3@pumpkin>
In-Reply-To: <20260129100332.500248d3@pumpkin>
From: Marco Elver <elver@google.com>
Date: Thu, 29 Jan 2026 11:12:49 +0100
X-Gm-Features: AZwV_Qjm1big2o3mYTbTc-InA_aDqnDfx4wWvQeXqTlFIP_0-3CqkH0h_lrLByU
Message-ID: <CANpmjNPL662LMLw9o-fqQCBkhD=oG-UTHSQb8XeXtXduhh1dQQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260129_021327_336311_EE9C8F3E 
X-CRM114-Status: GOOD (  33.46  )
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

On Thu, 29 Jan 2026 at 11:03, David Laight <david.laight.linux@gmail.com> wrote:
>
> On Thu, 29 Jan 2026 01:52:33 +0100
> Marco Elver <elver@google.com> wrote:
>
> > Rework arm64 LTO __READ_ONCE() to improve code generation as follows:
> >
> > 1. Replace _Generic-based __unqual_scalar_typeof() with more complete
> >    __rwonce_typeof_unqual(). This strips qualifiers from all types, not
> >    just integer types, which is required to be able to assign (must be
> >    non-const) to __u.__val in the non-atomic case (required for #2).
> >
> > Once our minimum compiler versions are bumped, this just becomes
> > TYPEOF_UNQUAL() (or typeof_unqual() should we decide to adopt C23
> > naming).  Sadly the fallback version of __rwonce_typeof_unqual() cannot
> > be used as a general TYPEOF_UNQUAL() fallback (see code comments).
> >
> > One subtle point here is that non-integer types of __val could be const
> > or volatile within the union with the old __unqual_scalar_typeof(), if
> > the passed variable is const or volatile. This would then result in a
> > forced load from the stack if __u.__val is volatile; in the case of
> > const, it does look odd if the underlying storage changes, but the
> > compiler is told said member is "const" -- it smells like UB.
> >
> > 2. Eliminate the atomic flag and ternary conditional expression. Move
> >    the fallback volatile load into the default case of the switch,
> >    ensuring __u is unconditionally initialized across all paths.
> >    The statement expression now unconditionally returns __u.__val.
> >
> ...
> > Signed-off-by: Marco Elver <elver@google.com>
> > ---
> > v2:
> > * Add __rwonce_typeof_unqual() as fallback for old compilers.
> > ---
> >  arch/arm64/include/asm/rwonce.h | 24 ++++++++++++++++++++----
> >  1 file changed, 20 insertions(+), 4 deletions(-)
> >
> > diff --git a/arch/arm64/include/asm/rwonce.h b/arch/arm64/include/asm/rwonce.h
> > index fc0fb42b0b64..712de3238f9a 100644
> > --- a/arch/arm64/include/asm/rwonce.h
> > +++ b/arch/arm64/include/asm/rwonce.h
> > @@ -19,6 +19,23 @@
> >               "ldapr" #sfx "\t" #regs,                                \
> >       ARM64_HAS_LDAPR)
> >
> > +#ifdef USE_TYPEOF_UNQUAL
> > +#define __rwonce_typeof_unqual(x) TYPEOF_UNQUAL(x)
> > +#else
> > +/*
> > + * Fallback for older compilers to infer an unqualified type.
> > + *
> > + * Uses the fact that auto is supposed to drop qualifiers. Unlike
>
> Maybe:
>         In all versions of clang 'auto' correctly drops qualifiers.
> A reminder in here that this is clang only might also clarify things.

Will add.

> > + * typeof_unqual(), the type must be complete (defines an unevaluated local
> > + * variable); this must trivially hold because __READ_ONCE() returns a value.
>
> Not sure that is needed.

Trying to warn against someone copy-pasting this as a TYPEOF_UNQUAL
fallback implementation. typeof() and typeof_unqual() do happily take
incomplete struct declarations. E.g. this works:

struct foo;
...
struct foo *f;
typeof_unqual(*f) *x = f;

Whereas with the __rwonce_typeof_unqual() fallback this doesn't work.
I can try to make it clearer.

> > + *
> > + * Another caveat is that because of array-to-pointer decay, an array is
> > + * inferred as a pointer type; this is fine for __READ_ONCE usage, but is
> > + * unsuitable as a general fallback implementation for TYPEOF_UNQUAL.
>
> gcc < 11.0 stops it being used elsewhere.
> Something shorter?
>         The arrary-to-pointer decay doesn't matter here.

Ack.

Thanks!

