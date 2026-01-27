Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DF0D2F036
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 14:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhshd5OZQ3rINSAnt7Pm+c6X8anVL8a4fk783Hki388=; b=uV0aCvVlFN8F5XaFdMC0RAt7u6
	mJFq3uTGMCCu+3xfQs4eUTZ31HYuFEWDlMcFzMcAWOl0zuDAMf7Gq2xZ1cR5rRLK72TE/FMGvenZK
	+tdifrZrW9PMAR2jkgoHf0vdh60+ZbTrF7DaddoY5WLz+k4pW4+CfRQKYhUHitDOVtM2XbrwZ2Mau
	073RYrzSvmB9mJo/0wdXNBh+QkBnhL8Z1Tm1igCxigfsdr+1alEnjrBoIggSG8mLd0jGIxYglWWiZ
	l23ODM6txU7xI+R+DBJkUn6PxVBeUzcY9R1gzKqJ5q+mU7khHJLyDoku3oifZYsumRISc+QVaps5k
	GQfpOtYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk5V-0000000EOm5-2DzQ;
	Tue, 27 Jan 2026 14:30:37 +0000
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkk5R-0000000EOlW-0gLN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 14:30:35 +0000
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-4359a316d89so4286066f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 06:30:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769524231; x=1770129031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vhshd5OZQ3rINSAnt7Pm+c6X8anVL8a4fk783Hki388=;
        b=C5Y+yT0vwhg/3ADc/0ykWs42xWHJ7ydkL4bp3KIpkOK2gXvZaE6j9Ef7NYSCAETARg
         5FCAVH3jY4du41ljR+6GSfW5L/o0Bub+IgnQKzvAVUr2DrTR1qfcp+mOyqyGYKpVeeFy
         YGiR6m+mvkMQ0CKDB8l4nsSdEJQfvVCmJcTg+2uUfdyfZkSwekOHxJqTLoHD0/xBSDoc
         WajVA4pjmYxpte5QAzwtzva/SYIlaB/n3TRGMzO/cWC8Y3RltkYctnlu0W2r2CHKgJTf
         ElmaeDnm1xJw2nQi9FMuMmMLbF2HelaZEhzmJtv0M1m5BB89efFAJof7xW5jaxWZbMT7
         t1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769524231; x=1770129031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vhshd5OZQ3rINSAnt7Pm+c6X8anVL8a4fk783Hki388=;
        b=h+67DA5KA3yBSHVyOhE4muGGE5Lt59qhxvKTjX03sSzXj8CVH5IvQ2Hy9u3VBEHBVT
         vQ1Plia1vPcKwxcvB/JLbc7cC3fIzLAJE5m6UnSDuUId25E7matwkVlsIiY39XwloSt+
         2kMSoT48PJk7UO+fs57R21kIGiCkXjuqP1tnnP59e6bdbxqKFIyNT7P1Ls1CDeK4vkuq
         yYz5k0ZcgrJA5EbwUOf+CdjM4p7MEcpbpSd4UGPtnxdjGX89n9uIgwMAHTjYj62VgV8s
         lKzuiWzIjw0U+Re2s1mrPmpFyW1yd6oRp2Wc62+PUwjGhIfcjQw5BdoOVqofaFuJkflU
         RsWw==
X-Forwarded-Encrypted: i=1; AJvYcCXkuS2Wc7zubu6OfciS1nPNMt/+5TTMjIAr37PEsVeQK3OcSIyzDkQZh5S9HHlmoGZO7/mtz1rjyBkog7PvFu9E@lists.infradead.org
X-Gm-Message-State: AOJu0Yw9B4OCIhntXmSh1ev4EiAkaCFPvYYGYdW7vBbUw5AeWDJEqOsV
	nzIQOGWaOB5molXM5Mhp1oplXKdK3FxbPyKYH19KVOux0uu451X1iJj6
X-Gm-Gg: AZuq6aKoaFPc7jbctAL850dpZi/HAIgVzpDUih1TkuqZgejpW23jYNU3CZz4XfErHc/
	I0a0GZrZ/ajxAVWRj1LGUUZov9t6P2Sx0kIGDzu4fnC7NPj0NNvYTl5VIeq8ntxXQArFGCjwNiW
	93ir2LRPT5OLhLqbDvvNs835T8hDZD2vE0wIkGDPJ6fn/nn9QIyETKuVWisyjjLCKPu4qHq4d6o
	vzlS2qbn/UxdUyVCDMPyHuvOBrtaWCKVjv2LLUc79dXUncMBx+mNeytza55Zh7TDc6Nwq7nNgu7
	95UKpzzJxzaAx4/whzRKE2xaEHzZURRYuGhEakvzo6hy8ZjgfdZYHR8mGL+vVRMd0lcbh5izGK8
	/cLbwiHnpYMWD4cHei0WgLKv9sFVDaHpaD5M0qrN/IfnD/R64qV4ji7GcN7J3s5srGPGD5ErRYW
	eGSA6e/u30HJJ3M3/Z+NE8fbnOUGSv5ezCsOLcs0ANUVR54TLFmAD+
X-Received: by 2002:a05:6000:3102:b0:435:97fc:6f1c with SMTP id ffacd0b85a97d-435dd08fbe9mr3025222f8f.25.1769524230765;
        Tue, 27 Jan 2026 06:30:30 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435b1c246ecsm39449626f8f.10.2026.01.27.06.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 06:30:30 -0800 (PST)
Date: Tue, 27 Jan 2026 14:30:26 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Ingo Molnar <mingo@kernel.org>, Thomas
 Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, Waiman
 Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>,
 llvm@lists.linux.dev, Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
Message-ID: <20260127143026.32429f32@pumpkin>
In-Reply-To: <CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
References: <20260126002936.2676435-1-elver@google.com>
	<20260126002936.2676435-3-elver@google.com>
	<d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com>
	<aXfGcIpeXQNRUI-A@elver.google.com>
	<7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
	<CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_063033_587695_546E6963 
X-CRM114-Status: GOOD (  35.40  )
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

On Tue, 27 Jan 2026 13:01:22 +0100
Marco Elver <elver@google.com> wrote:

> On Mon, 26 Jan 2026 at 23:24, Arnd Bergmann <arnd@arndb.de> wrote:
> >
> > On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:  
> > > On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:  
> > >> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> > >>
> > >> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> > >>
> > >> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> > >> on gcc-13, clang-18 and earlier, and not strip out qualifiers.  
> > >
> > > I think we only need to worry about Clang for LTO builds. But yeah, our
> > > minimum supported Clang is 15, so between 15-18 it'd be broken.  
> >
> > Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
> > fine here.
> >  
> > >> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> > >> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> > >> to do the right thing already.  
> > >
> > > It'd still be broken for Clang 15-18, so it won't help much. We need
> > > this to work for more than "scalar", so even though it'll work for Clang
> > > 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> > > _Generic-based __unqual_scalar_typeof() sooner than later.
> > >
> > > I was able to make this work for older compilers:
> > >  
> > ...  
> > >  #define __READ_ONCE(x)                                                       \
> > >  ({                                                                   \
> > >       auto __x = &(x);                                                \
> > > -     auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;      \
> > > -     union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;          \
> > > +     auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret; \
> > > +     union { __read_once_typeof(*__x) __val; char __c[1]; } __u;     \
> > >       *__retp = &__u.__val;                                           \  
> >  
> > >
> > > Thoughts?  
> >
> > Looks better than __unqual_scalar_typeof() to me. Would it make
> > sense to do the same __read_once_typeof() in the asm-generic
> > version of __READ_ONCE()? I don't remember if we discussed it
> > in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop
> > pointer qualifiers when reading from scalar types").
> > We probably didn't have __auto_type back then.  
> 
> I don't see the point for the asm-generic __READ_ONCE(): it's not
> wrong to cast to 'const volatile volatile T*' nor 'const volatile
> const T*' etc., which is dereferenced directly and not stored in any
> temporary variable when used in READ_ONCE(). I actually don't know why
> __unqual_scalar_typeof() is used in the asm-generic __READ_ONCE(),
> which just adds 'const volatile' right back.

That looks historic, once upon a time the code was:
	typeof(x) __x = __READ_ONCE(x);
	smp_read_barrier_depends();
	__x;
but const needed stripping and someone decided to cast the result back
to the original type.
Of course that is pointless since the qualifiers aren't relevant on an
'rvalue' so are then discarded.
Then the barrier and temporary variable got removed.
(The barrier was only needed for alpha - which has its own __READ_ONCE()).

In the arm LTO version the ?: will also remove the qualifiers.

> 
> And __READ_ONCE_SCALAR() appears to be gone, where the
> qualifier-stripping resulted in better code-gen.

The qualifier stripping was needed to read a 'const' variable.
Looks to me like the 'better code gen' happened earlier.
The 'earlier' version took the address of the on-stack volatile
variable.

So you may not need to remove the const/volatile qualifiers at all.

	David




