Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE1D9D2F002
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=; b=X36AkpUpz+hSea9C1fsMQ35Zqy
	Ief7WAfqEXNRdh20Er7SLJLSCDnzyved19D8jnN7bQ50kwfC92pDzgB5CJkw+TPQxboOqR5NQRvjD
	zG2rK7mw6RNf1Rg19fMmORlLjD2C97qpJa00urCvUMCJ6zeKZdgTANtK03e5d37xCmPy1OwPBgE7I
	z2f3Jb4FweOFPV/6aV1wF0Bl8FeqGb77rd1II6ao0lxE6C1QA6c39mc1dmZRKTW+OhyyBjVka7HkO
	rkJGh1MQeerEiwqDfKPTAbgEgWBOd5B/S0I8wXkmx89XmIoKnwS3KGvFe/F6ro68vv1aTxhxqBlaV
	4UGm2v3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhlo-0000000EBnZ-3DeM;
	Tue, 27 Jan 2026 12:02:08 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhlg-0000000EBn8-43z6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:02:04 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-11f36012fb2so7830459c88.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 04:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769515319; cv=none;
        d=google.com; s=arc-20240605;
        b=k2NJ0LU/fQQ4LKui8Tf6qY8umxArhR2Ub8eVf9XYQlr5ZKpZMgvrdGxcHnHDA5ixJU
         pLUPlQyxvV+nDlfkQh7p831ldIjzJbUonZb6wT/84BsvfsiCgH5t+fjkqMK/J+yTujsO
         C2PiWappptWjG3rkX5zwhg5gYP2zrJvV1bwQRWZu4gH1jIoGjQIwszIEVV3JRNas/zA1
         6jyrC9HDh8T+GAYTdO3OuWPsxsN8NdMBVz7ykfWKmri5+XRdzr+VsbtED1HqjGDNUbyp
         4USsdirmIjkjarrAXbY96cUuBe6ctttLO0dRQ0NJN/v1Sz1Rf1136yI5oWNds0Jf9ag0
         HeGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=;
        fh=k1VNzqahAGnfdPrw2N3GkTJP7iBcmIzvTq/K6L1Bz7w=;
        b=HouO6F8tH5a71Fes2n9xdV51JKHMzIM/OpxGYLo8fun1bXrXRbD7gjcWRuzuNr4bA1
         97vnF2qcicIuJWY8Kmj+MhTH4z/ikUrYIsp7wmJUk68fjCS8gvxPk/xu0iEYQwA5ArbE
         gdste6v+W0asD4JqQjJWja5GIzbYO8I4FjtBgv/+eyjDYI6QZB+UDeJzkxY80Ag7z7yz
         Q1i/xHJv+1vRA+6wQsaPNw/3vztAxgsofWP4I9uocEr6lLOdKseTJAsNuDI6k3CkY/Hs
         kmaxPyJQpy/kg9JnAYx+lUHCwys3WBoKNPUMa25EkZ7IXIbWdwpkcbu2mQFaFCXSJVCG
         oCtQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769515319; x=1770120119; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=;
        b=NzAKU+KdTfkVOwKt3lW8K2zg42l6zQBoXjxww/WEOlip8L5fBuBwT+coVxqMpEqkK9
         GN3WywoI9aN204EgnkYin8OjST9VCwGXcOpo+IEGx3+qKZxGt0y24QXBX4UiSLEqwow3
         GyCQh3/OgrLUxBnU4dzumSf4vMsEI7bOqv3nNY+lCTxR+GFLnK7/qv3lzK3uMh7T2jvW
         LyDfv4Kq+Ib5k6loJDhX0CHCakV/OqFoDrGoc39iegPh6KxAjrk4eaGjznKSGJ7lA4n0
         RI3L19pwjcpW6WBwaKS29HW0QXyoP2umb+bNXx8pRgmVPTvoLhuf3f+j2Z9dq20eo9t7
         8svg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515319; x=1770120119;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3siXZ/0ghE6QlqdH+UHYvDHgwatyqmAkbtWEXRaWQU=;
        b=hhd3T5+UH7dlh6ZyAohhIu0XeWVG5SE1HlG47TZFUEah1+YW+yvl3VMx+dwGXVUR4Q
         KR5ezjG+3nouonuycMiLL52IBk76gJDIJ5Kez+tgLAHsVoMExPvnKcSlPuIbSyFgpAgS
         IZ7SAG/PLxwhla2DTEt1LKeMKEdcWXRWSQ41Gn5+JwG5veT8rLF16B6C9Xhz23Ad2OY4
         pgTpXpdmayu+XL9iNNXaevvhyKpjDz2Aji8bpL0rHcviQLwY2fIWlTuKSJ9K84KTVtJC
         EFnSB8wEgPBFvNKtdI6MZ4KBzfAIs+tJc7lmVihNBRji435UY2xuk3dNnovWBi7sHitJ
         eioA==
X-Forwarded-Encrypted: i=1; AJvYcCU92MLc7qJygSgtULdIZQt9gJdK4xo5+wcyFT7MKZs0m2ID1JTS7bHzkRO7SoAHkHRaF1w1MJkYOXtBD9sv7oeL@lists.infradead.org
X-Gm-Message-State: AOJu0YwFFV19O7nZW1D0Orue/7N8cVkk6ndNjKK8h3XN8DRzJR154buH
	DgOarQu4t7FoEAibWJPQCq5Juq0h0U9ruV5gqx/vy/DNTJbCrpRplB3UuadJbzyeEjAeZZvfP0L
	iXg5G3yIE9LIjM10wvtuYwVjw7DZshpiMPugcfcws
X-Gm-Gg: AZuq6aKi7Dl2xzRr3/tikQkaxHtrvY6UinHkKJJXfHZRhjHAJo5WIHW6dXGZNU39f1k
	uj40QFyakwruqE5Q5D5vDHTZd3B9KBROTkh3tZIwZm6vjQzdr7QUT/NwOMuCOoGJYFlXzyZdpn1
	/5dxeEyynVbLPBaCKslw+tBKsystAL8qj9SFTw01bXfTfx+XjtD4gly5x7UinHEzR31svK/AuFQ
	LwTzbZWSB1PDtcUPPOznNCKajyCEE+oL21QssDZpafyqcBnX0StYLyUj7wk1RHw9D6RXbZirdZe
	91ABCWtBi+98gibrGpzFVKDXig==
X-Received: by 2002:a05:7022:672a:b0:11b:baa5:f4d1 with SMTP id
 a92af1059eb24-124a005f62bmr729353c88.6.1769515319003; Tue, 27 Jan 2026
 04:01:59 -0800 (PST)
MIME-Version: 1.0
References: <20260126002936.2676435-1-elver@google.com> <20260126002936.2676435-3-elver@google.com>
 <d3295c84-da15-4695-8110-7e04cfaf1419@app.fastmail.com> <aXfGcIpeXQNRUI-A@elver.google.com>
 <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
In-Reply-To: <7478d2cf-9636-45c8-8ffa-8e3a3ba9baf8@app.fastmail.com>
From: Marco Elver <elver@google.com>
Date: Tue, 27 Jan 2026 13:01:22 +0100
X-Gm-Features: AZwV_QjFMCCyrciERqYsJr6V_OTfZKrtTgGTvPsn4bCRYZIickpLNe1DBnbTFdg
Message-ID: <CANpmjNNWoSdE_Lo9CJV3sAR+j8qz3_sq7LoaqYO6cVuOtdTBzA@mail.gmail.com>
Subject: Re: [PATCH 2/3] arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
To: Arnd Bergmann <arnd@arndb.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_040201_314139_03E33BAC 
X-CRM114-Status: GOOD (  28.84  )
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

On Mon, 26 Jan 2026 at 23:24, Arnd Bergmann <arnd@arndb.de> wrote:
>
> On Mon, Jan 26, 2026, at 20:54, Marco Elver wrote:
> > On Mon, Jan 26, 2026 at 08:56AM +0100, Arnd Bergmann wrote:
> >> On Mon, Jan 26, 2026, at 01:25, Marco Elver wrote:
> >>
> >> How does this work with CC_HAS_TYPEOF_UNQUAL=false?
> >>
> >> As far as I can tell, TYPEOF_UNQUAL() falls back to __typeof__
> >> on gcc-13, clang-18 and earlier, and not strip out qualifiers.
> >
> > I think we only need to worry about Clang for LTO builds. But yeah, our
> > minimum supported Clang is 15, so between 15-18 it'd be broken.
>
> Right, I missed the #ifdef CONFIG_LTO check, so indeed gcc is
> fine here.
>
> >> With fd69b2f7d5f4 ("compiler: Use __typeof_unqual__() for
> >> __unqual_scalar_typeof()"), I would expect __unqual_scalar_typeof()
> >> to do the right thing already.
> >
> > It'd still be broken for Clang 15-18, so it won't help much. We need
> > this to work for more than "scalar", so even though it'll work for Clang
> > 19+ given the redefinition to __typeof_unqual__, we should deprecate the
> > _Generic-based __unqual_scalar_typeof() sooner than later.
> >
> > I was able to make this work for older compilers:
> >
> ...
> >  #define __READ_ONCE(x)                                                       \
> >  ({                                                                   \
> >       auto __x = &(x);                                                \
> > -     auto __ret = (TYPEOF_UNQUAL(*__x) *)__x, *__retp = &__ret;      \
> > -     union { TYPEOF_UNQUAL(*__x) __val; char __c[1]; } __u;          \
> > +     auto __ret = (__read_once_typeof(*__x) *)__x, *__retp = &__ret; \
> > +     union { __read_once_typeof(*__x) __val; char __c[1]; } __u;     \
> >       *__retp = &__u.__val;                                           \
>
> >
> > Thoughts?
>
> Looks better than __unqual_scalar_typeof() to me. Would it make
> sense to do the same __read_once_typeof() in the asm-generic
> version of __READ_ONCE()? I don't remember if we discussed it
> in the thread leading up to dee081bf8f82 ("READ_ONCE: Drop
> pointer qualifiers when reading from scalar types").
> We probably didn't have __auto_type back then.

I don't see the point for the asm-generic __READ_ONCE(): it's not
wrong to cast to 'const volatile volatile T*' nor 'const volatile
const T*' etc., which is dereferenced directly and not stored in any
temporary variable when used in READ_ONCE(). I actually don't know why
__unqual_scalar_typeof() is used in the asm-generic __READ_ONCE(),
which just adds 'const volatile' right back.

And __READ_ONCE_SCALAR() appears to be gone, where the
qualifier-stripping resulted in better code-gen. Then there's alpha,
but I think nobody cares sufficiently about it.
Did I miss some variant?

For this arm64 LTO variant we do need the qualifier stripping because
of the temporary __val.

And I'm hoping that once we update minimum compiler versions, we can
delete all these typeof-hacks and just use typeof_unqual().

