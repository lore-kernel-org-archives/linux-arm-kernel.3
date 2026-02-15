Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8305AE63F08
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 15 Feb 2026 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=; b=ZU9HSLx9JYI12qxq1z5vJaXaeS
	u0xHP+9SDBTBtJWgvc80SVacREEZUM8QLl07ZCLjQy+H5VKV9Lr22WK6FiUh08OOe9V43Bl128L9c
	h88+phxP++nAPHv/B/kQnnmrDkETtY4Ni8HCb4jWotwvazNeG92qXrTLqVX7ZBvGwspR+0U85z5/D
	XDFL2zLpgl3aYO7wa5XQvhgMRAWNZwIMJkTgcGd2Y5Sygr0Jue9ykfT3/FlKoQF8IDspfzT6+ulBq
	uwrd9b0V44okdA/E5PZYhUXWtiTft0R1wZA4F1bbJ/XYRPCLoN4F46fo2EkcCutgXfdnR4wnEZCd4
	dDf0trbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrk6M-00000005gzx-1jE7;
	Sun, 15 Feb 2026 21:56:26 +0000
Received: from mail-dl1-x1231.google.com ([2607:f8b0:4864:20::1231])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrk6J-00000005gza-18OT
	for linux-arm-kernel@lists.infradead.org;
	Sun, 15 Feb 2026 21:56:24 +0000
Received: by mail-dl1-x1231.google.com with SMTP id a92af1059eb24-126ea4b77adso3108701c88.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 15 Feb 2026 13:56:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771192581; cv=none;
        d=google.com; s=arc-20240605;
        b=i6OGT2ET6CyaPbwtGFtKEsryCv7B1U//gH+23hpaMOFuV/xmTjELwoDUgtvWACsABv
         vvkoLeMgdY+SUexsojQ0BOz4/+dQ2n9MROcQoCV3QBvdlK3jymgMsARWblTaeD1Y3Kde
         Q3uX9pWEF7iZ9EFPEVYWoU3DhtI3Xw524bWaEWFK7WVctMiVNHkAEUqM4kBoCV8gazIg
         oaXWIqGLywGZZMZDb9BTMiizjMGd4ISDB3RLhWUzRYRpEP1S/vBXI8mLL2tVdDRgj3UZ
         uD7nRcnQhZfeVii0+k4NRcInymNCOmzyMlgA1F/ANjWT4+87hW2/3EQN1lChC0Yslfev
         IWvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=;
        fh=VySX1yA3LrE+dGLvDVLMSTgHpkQFZg3nbUUsy2Oat24=;
        b=JLLnQUA4GzTzWfRWfcDamdMNQrexhPxuYI+O22ay6KmXL7A8t46kFkXoG5sVgDqoYl
         7hpyTfFpTZXX5eRS2Uexujmsbtmxyq3ViTdIhgp6L0cCfqgnKDHUdMzgwW8uWjfruy19
         NdkgExsi/JhkvOf3vwYmUkHkdYJ78tVVW2JO/ENYAG+y6jWTR5Bdha/tIi+gqpLAkw4T
         N0tSjuJG0q7ec0eGLItN+cG9epL5icOONJwK/lAPtL9h0NosGjkrqEa3vg/dXRoZTnrC
         uRy2VA2SueQcl2nUmtG7kGyL9sZSnDJgr01lr4mKREJEcFXRW5SAFJuprTBZtsGXeSVa
         jP9g==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771192581; x=1771797381; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=;
        b=eXzMZnhqHI3J42fiUlEGL/RrFh3Ktf+I0OIpkxI5fruAbKzVPWEPo7EvGkIm6uEnUt
         2IOi4YlZaDbJyBlrM2o23K+HZeCzrUKy5diKjCz8q6cO5QjRmPBwz8r8qQgN5Skhcj7Z
         TbY4lnkk4PW8SeyLG6RMwzC1T4faeiD+jSc8rxFjA7fq4HvNJiGIOA1I6cga9dp3LY3L
         BaLjwLWiwQFwMB7d0lrx3fw5Nt4y3TW6NRP7rh7V6uXxy6qCi13wFnjRkaZzeRFGJWXP
         LlxvpNL6HkKZMG+AorQJbPHWecCW8YFVk1Ih2UQ/DaasVckDRmZG7wgn1WKdni/aR6I5
         mZUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771192581; x=1771797381;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3sGaoxNVIXwIz0KLIh86Pin3iEwGO92cPe1xTLryvn0=;
        b=LjfwPuVgbiDUmKZ2M9BmSZ/OhhciyBAxogG+po9YBbYxa2hWsRBjTH90/CUVOjcVJ/
         53Mykp/Z4OlxQ1mHnS/dgxreZcOPorwZfPSPf34JB9meLypnWRTSPIXN3GsJXrphRwjY
         ezbL0eAMH0e3sflG7vcqsY3yfvebCmWDB0gFjyg8tEnVwB9vo2WY4i9iDVIvdBqqnmOY
         H9c9X3YQKhUyPPjLxdG+HYXGbWq2Rac3AcGYj1Sif9BhXejyB34i7IQ8gXqRXCCK4pEl
         QD/JBRWuGrsh+JrmsEMNBHvDT/fr8CwCka0Exz3KOs24uvG5ySsXkXkAcB4kbzIURVdU
         ZcLg==
X-Forwarded-Encrypted: i=1; AJvYcCXYjL4ZO83uqzSY4f6mKiUyl+MLg9yR2AXbDfYTZStod1higs2b4Q59z0sywAeQl2AVBRXgIfI7l4W5PlMP3RCG@lists.infradead.org
X-Gm-Message-State: AOJu0YyV176f6IGC/sM4/wPBTwca4XyMkog7yN4/rtLJ/E8cm3YQiZUF
	httBVejO3cVeUE1ys7ivwumd7z+wTIFmaPNR6YzIIpfrSuae2xtaq4xzijkrTtp/fel3zJI4kX6
	DcWnFnHskytt8hxDPV8bzXub3OzSIGlnaFqfx05SG
X-Gm-Gg: AZuq6aJoN997jSh4UfUHZuUny7CVokIWQlYIUoyq+ZyKGAYCEcrn0ChEeJ7MhG+kUeA
	GnS1kHYTFm7vk8HYsum0OUkktr45ewKVrfu4IWmKeoKmliKp7vXPgnK1iR+vXb0XacYmS0xAdDt
	acJlLBDVj6iHKYVxsrYwTufXZqR8MNjsXEc0Y08NH2jAMae6g5F2ul9FRrXaIW9uHVfNLjrEvgg
	o5M//IHIhObM1mcutHEQAqM+jGMgxOcUAUClE57saYN3r0MKOze48IDFpOOyToI0m0m+nffiUiH
	9ErptDVqx/DHc4ZKIolh4sbDalKI/CjjDkuZr0c=
X-Received: by 2002:a05:7022:698d:b0:127:366c:8727 with SMTP id
 a92af1059eb24-1273982c9a7mr3858541c88.40.1771192580702; Sun, 15 Feb 2026
 13:56:20 -0800 (PST)
MIME-Version: 1.0
References: <20260130132951.2714396-1-elver@google.com> <20260130132951.2714396-4-elver@google.com>
 <aYDFOIskB20CbztD@willie-the-truck> <20260202192923.0707e463@pumpkin>
 <aYHgNSF5a3F7UGU_@willie-the-truck> <CANpmjNNzx-zc_-ZPgwe5DoWLmexw5irT2n+XMUqxTrfwxTxTmg@mail.gmail.com>
 <20260204131400.GI2995752@noisy.programming.kicks-ass.net>
 <aYNUmEfDzq7lTFFr@willie-the-truck> <CANpmjNPHnt6eY-OfkTr5TksHaOon2GyLUokvagcMRa23B6i6_Q@mail.gmail.com>
 <20260206182650.6c21b0ff@pumpkin>
In-Reply-To: <20260206182650.6c21b0ff@pumpkin>
From: Marco Elver <elver@google.com>
Date: Sun, 15 Feb 2026 22:55:44 +0100
X-Gm-Features: AaiRm52TaMQeR8grnhXihV-a9M4jdnZTVuSJ1xV8IMKlu2UE36vvlBNc2AapGhA
Message-ID: <CANpmjNNFXdMM6cL+HBsiXr2WUA=mttR1jDRMqNYD7+YZs6vRKg@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] arm64, compiler-context-analysis: Permit alias
 analysis through __READ_ONCE() with CONFIG_LTO=y
To: David Laight <david.laight.linux@gmail.com>
Cc: Will Deacon <will@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Waiman Long <longman@redhat.com>, Bart Van Assche <bvanassche@acm.org>, llvm@lists.linux.dev, 
	Catalin Marinas <catalin.marinas@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, Boqun Feng <boqun@kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Al Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_135623_346695_5FDCA1FE 
X-CRM114-Status: GOOD (  46.29  )
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

On Fri, 6 Feb 2026 at 19:26, David Laight <david.laight.linux@gmail.com> wrote:
> On Fri, 6 Feb 2026 16:09:35 +0100
> Marco Elver <elver@google.com> wrote:
>
> >  On Wed, 4 Feb 2026 at 15:15, Will Deacon <will@kernel.org> wrote:
> > >
> > > On Wed, Feb 04, 2026 at 02:14:00PM +0100, Peter Zijlstra wrote:
> > > > On Wed, Feb 04, 2026 at 11:46:02AM +0100, Marco Elver wrote:
> > > > > On Tue, 3 Feb 2026 at 12:47, Will Deacon <will@kernel.org> wrote:
> > > > > [...]
> > > > > > > > What does GCC do with this? :/
> > > > > > >
> > > > > > > GCC currently doesn't see it, LTO is clang only.
> > > > > >
> > > > > > LTO is just one way that a compiler could end up breaking dependency
> > > > > > chains, so I really want to maintain the option to enable this path for
> > > > > > GCC in case we run into problems caused by other optimisations in future.
> > > > >
> > > > > It will work for GCC, but only from GCC 11. Before that __auto_type
> > > > > does not drop qualifiers:
> > > > > https://godbolt.org/z/sc5bcnzKd (switch to GCC 11 to see it compile)
> > > > >
> > > > > So to summarize, all supported Clang versions deal with __auto_type
> > > > > correctly for the fallback; GCC from version 11 does (kernel currently
> > > > > supports GCC 8 and above). From GCC 14 and Clang 19 we have
> > > > > __typeof_unqual__.
> > > > >
> > > > > I really don't see another way forward; there's no other good way to
> > > > > solve this issue. I would advise against pessimizing new compilers and
> > > > > features because maybe one day we might still want to enable this
> > > > > version of READ_ONCE() for GCC 8-10.
> > > > >
> > > > > Should we one day choose to enable this READ_ONCE() version for GCC,
> > > > > we will (a) either have bumped the minimum GCC version to 11+, or (b)
> > > > > we can only do so from GCC 11. At this point GCC 11 was released 5
> > > > > years ago!
> > > >
> > > > There is, from this thread:
> > > >
> > > >   https://lkml.kernel.org/r/20260111182010.GH3634291@ZenIV
> > > >
> > > > another trick to strip qualifiers:
> > > >
> > > >   #define unqual_non_array(T) __typeof__(((T(*)(void))0)())
> > > >
> > > > which will work from GCC-8.4 onwards. Arguably, it should be possible to
> > > > raise the minimum from 8 to 8.4 (IMO).
> >
> > That looks like an interesting option.
> >
> > > That sounds reasonable to me but I'm not usually the one to push back
> > > on raising the minimum compiler version!
> > >
> > > > But yes; in general I think it is fine to have 'old' compilers generate
> > > > suboptimal code.
> > >
> > > I'm absolutely fine with the codegen being terrible for ancient
> > > toolchains as long as it's correct.
> >
> > From that discussion a month ago and this one, it seems we need
> > something to fix __unqual_scalar_typeof().
> >
> > What's the way forward?
> >
> > 1. Bump minimum GCC version to 8.4. Replace __unqual_scalar_typeof()
> > for old compilers with the better unqual_non_array hack?
> >
> > 2. Leave __unqual_scalar_typeof() as-is. The patch "compiler: Use
> > __typeof_unqual__() for __unqual_scalar_typeof()" will fix the codegen
> > issues for new compilers. Doesn't fix not dropping 'const' for old
> > compilers for non-scalar types, and requires localized workarounds
> > (like this patch here).
> >
> > Either way we need a fix for this arm64 LTO version to fix the
> > context-analysis "see through" the inline asm (how this patch series
> > started).
> >
> > Option #1 needs a lot more due-diligence and testing that it all works
> > for all compilers and configs (opening Pandora's Box :-)). For option
> > #2 we just need these patches here to at least fix the acute issue
> > with this arm64 LTO version.
>
> Option 3.
>
> Look are where/why they are used and change the code to do it differently.
> Don't forget the similar __unsigned_scalar_typeof() in bitfield.h.
> (I posted a patch that nuked that one not long ago - used sizeof instead.)
>
> The one in minmax_array (in minmax.h) is particularly pointless.
> The value 'suffers' integer promotion as soon as it is used, nothing
> wrong with 'auto _x = x + 0' there.
> That will work elsewhere.

Agreed that getting rid of __unqual_scalar_typeof() in favor of 'auto'
where possible is the way to go.

Unfortunately I spent the last week occasionally glancing at this
arm64 READ_ONCE problem, and could not come up with something that
avoids using typeof_unqual() or __unqual_scalar_typeof(). I'm inclined
to go with the unqual_non_array hack, but not make this available as a
macro for general use - we have too many of these horrid macros, don't
want to add more to this hack pile.

