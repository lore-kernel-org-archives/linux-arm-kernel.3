Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76704EE20AF
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 15:10:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=; b=Aqo0m1lwfWJNbAiTznsmf99/nu
	zTAG47MU+ESZnP3RXDTI4znNOpHebk4Gbli4tH9fMgxPgT0OfnOCO+nYIqxwGGWyxYtFT/aG+BlpX
	DKSstu29OMYfZGUgqpoMoe3BCu71KVpJ/rH2VpmJEmDU/PMiox4vscE2xcEf0uBsrL33dKvEw8Cgh
	OnTu30N5XSDqNlHUt6JNTSIEYAS1OwE9QBc3T+bAzNYHOrYSQ8ZBeAeY9OIoKev/hoA0z9Ceve6PU
	gS5pYVBptg1HKTLNHVsCOyM2+4Tp9b/ldCBkOHv2S7dcJUUfz1BM1fNm1DoQNOHOu6wrJPYD1iXph
	YgObn1KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNTM-0000000BTlA-1wyv;
	Fri, 06 Feb 2026 15:10:16 +0000
Received: from mail-dl1-x1232.google.com ([2607:f8b0:4864:20::1232])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voNTJ-0000000BTj8-3Fck
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 15:10:15 +0000
Received: by mail-dl1-x1232.google.com with SMTP id a92af1059eb24-1249b9f5703so1009209c88.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Feb 2026 07:10:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770390612; cv=none;
        d=google.com; s=arc-20240605;
        b=jmPUq6TLjBRVpKWm3kjsl28BYNQpB5v9GLxFRtLT+Q3Y7xP/h1lzTaPwpBEbqJHsrG
         4ITKgdK95ULTB9u4KlIWMocndnl0SioReqpLf8NCT2TZgQDiVLr89Xw8Su2Q/5POiUGy
         rmWPks154SAdT+7+PXdjH9nd2der+WFAKQwyNIGBJJ4bR5mhpzWL2NzQPWg1pCLKZAAi
         ha9eBKBFZlLbq7HzZjftEXhRmQaMije4wPrOwbm3+EyZlDVuAnpPYHpRS8H4JbwPR4Dy
         vaNNpdLl/3qvjkYCWWHMdEa9Wx/s6/cTMTK430ufS3U/KlFslEw13evQo6dOICXbt9IA
         rTbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=;
        fh=waYQmLAQCJhKF90NJBeg3ZHgdF9dx0HwSoyWVRsCgMA=;
        b=VHyCrKubrp+YLQietfAXaBbYjQq8q47hBk09jGfasrpcX4NAT1gAOEY1mzJFaTZzt/
         KP2hkkZivBCjCcYZWBlrF/AYkg6igd6ziNKfrhyXpS58BL2ogJIFaNK9wosTiZNGJ07Y
         dx7g6A7kSfGMLlt90ZKCPa74XPx44Wd1ibuakq9z3tv0aa/ginL7zgmjZWplb61dCSb6
         bufoNBfyCpjxz0wrdWG6V91HJRSi9Sz8HybDPi5rnUrUTspwWqyEYr1Fn2SoMJP0R2qj
         4zd0J5m3K6pw73hCPNYCUDUeFgH/kleHwligHOLZGprwFJcCJyCW9mQqqmOi6EfrAZ5q
         O9pA==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770390612; x=1770995412; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=;
        b=Myebi3MCCMBtO0PT9VcejTSgBe6prfxnOGqHhyJvpJtn+9HfsdLiiVI7d2jzs6GrY+
         U8ikJUfu568Xq1lLV0LzhRKCLdRRFBmYi60LykiUYKUCUH7V9bu5uhboMJNrKAxtG/VG
         ayRu1IdTp70iWP0RM3xFjVP1RgIdPxmUo+1mYMAhachbsJEahH2MDQZWeVuFc2Eyj40v
         ov+efev9ms1q2OChuv7MgWyv+toaEyb+7+PrRYDvzJqY3T+FGZ2fRETMhb2YYYhxwY8Z
         aqfYwKavR97CH2KqIB6w1sgh56nWVOEh1U6OtpRfZudTVv17iyJT5iR/uRq+YUKxw2m/
         6EBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770390612; x=1770995412;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y5EOtP23Wj4Wr86ex38l7FSPeU805ZsXp9nGXrF2rGc=;
        b=lTb6sQk8YTw37h5gSAwM1yVTE5S0dZsljDoaUA55n/0QbfXQ09KcjfgVBk20/kcs8L
         MgJk4uplggAmeWZi4ZzQYlOyMbAeSZzF3YS+fo1UfcoHCMSC2fkIQKYdjvXsDSPKR6Mj
         qADSiGqRHkV2Li0afz0k+Y9FOiEFW59667rZ8Hg7txx315E/saQ3NMbyb6ei+//Hh1yn
         H9XMKkhX2r8DGbHRjzGYUvXtjvWYq8vtOyVwQluDHXBShr7FIo5GnaDTZVpi1u0LLl4i
         kEY+MyDpM82CCJvuFB9+dm4w5RCdK8IyLefSPHF47r3cjsaNYjJFKbdTkXLGkt+mYYHv
         +rAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUGBk6IL8qnLKd7rSPlotzJQW2kMDqHj9ouSg7hFPQpok+mWYOf4tPHPYWZe8plTHAMv73sW2S+OZEnRUVkaxhG@lists.infradead.org
X-Gm-Message-State: AOJu0YwJdO4wMNrdIb0HviKC3gP+QM5WexGUzssYJFqwJVP3epAcYFGd
	06MwbwOsbzFwi55stm6io1LjLU3xWYyQnWp1qQMTtGlOai9hxrWP2G2S44ObHyBwNJ1824ioaZy
	rieDQPj7O2bBupFa8MKNNawQkvYhWvGaSKpTB0rDR
X-Gm-Gg: AZuq6aKJ4cqawEYcQNjvofq1ENAvEinDlMIzepAxEYV+HIi4xtW1x6i7XKZypw8OO9J
	UPZf47J1dUmgb2efhnuJgc2AN5oRviv789+4xpdipxGX7MuomOEFr1M0LiVOKe9CyEASMh2A/v4
	vnv0XdBUliYANhKWOO1eJodV43V6DVPxQ2uUkWek1bynAK4l6XJs7hiqD2DJ6SbzWKX56kGZoY5
	4vG+80QwKW21J7qyxMKHWoTWDuNACkweSCcTVen4qVfJc29WbawaIsVhhcRMD3Nc7yRFaXM4tZU
	XtNksjpiapFzZSOOSBuuhNfcghMRL7TTDqzz0g==
X-Received: by 2002:a05:7022:4395:b0:11f:2c9e:87f8 with SMTP id
 a92af1059eb24-12703fe8d42mr1356108c88.34.1770390611792; Fri, 06 Feb 2026
 07:10:11 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net> <aYNUmEfDzq7lTFFr@willie-the-truck>
In-Reply-To: <aYNUmEfDzq7lTFFr@willie-the-truck>
From: Marco Elver <elver@google.com>
Date: Fri, 6 Feb 2026 16:09:35 +0100
X-Gm-Features: AZwV_QjGWgNCD8_CbzAKGRGQz6hSk-9w0IVxQz6j51nG9zFrUKiXSKoq5saBYLA
Message-ID: <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: Will Deacon <will@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, David Laight <david.laight.linux@gmail.com>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_071013_837512_A332C7B0 
X-CRM114-Status: GOOD (  35.88  )
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

 On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
>
> On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > [...]
> > > > > > What does GCC do with this? :/
> > > > >
> > > > > GCC currently doesn't see it, LTO is clang only.
> > > >
> > > > LTO is just one way that a compiler could end up breaking dependency
> > > > chains, so I really want to maintain the option to enable this path for
> > > > GCC in case we run into problems caused by other optimisations in future.
> > >
> > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > does not drop qualifiers:
> > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > >
> > > So to summarize, all supported Clang versions deal with __auto_type
> > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > __typeof_unqual__.
> > >
> > > I really don't see another way forward; there's no other good way to
> > > solve this issue. I would advise against pessimizing new compilers and
> > > features because maybe one day we might still want to enable this
> > > version of READ_ONCE() for GCC 8-10.
> > >
> > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > years ago!
> >
> > There is, from this thread:
> >
> >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> >
> > another trick to strip qualifiers:
> >
> >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> >
> > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > raise the minimum from 8 to 8.4 (IMO).

That looks like an interesting option.

> That sounds reasonable to me but I'm not usually the one to push back
> on raising the minimum compiler version!
>
> > But yes; in general I think it is fine to have 'old' compilers generate
> > suboptimal code.
>
> I'm absolutely fine with the codegen being terrible for ancient
> toolchains as long as it's correct.

From that discussion a month ago and this one, it seems we need
something to fix __unqual_scalar_typeof().

What's the way forward?

1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
for old compilers with the better unqual_non_array hack?

2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
__typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
issues for new compilers. Doesn't fix not dropping 'const' for old
compilers for non-scalar types, and requires localized workarounds
(like this patch here).

Either way we need a fix for this arm64 LTO version to fix the
context-analysis "see through" the inline asm (how this patch series
started).

Option #1 needs a lot more due-diligence and testing that it all works
for all compilers and configs (opening Pandora's Box :-)). For option
#2 we just need these patches here to at least fix the acute issue
with this arm64 LTO version.

