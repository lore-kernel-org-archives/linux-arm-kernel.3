Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F925C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:18:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vluR2PPVFCeXo4Pv8qn9Rh/dHaN7yGoTkb474FlFpf8=; b=sGnA3rivLI1z/V3Ry8MOBC7yqj
	WtqAA5Bo6chvsgtgaXNuY0ipUeXXJaR1Niej+xM/VM+aPQ4iZFImOEC9wemvyHpg7HWDXttZiJm/j
	xzxxKRW4I3rAecgrOKWq5yRVpHpoy1+TIKB59v4xUTyodFdNH06UvCt70d4xfBcJt46qfR7+lb9jw
	GEIa2ekcBWbmmSmlN5inT/d/HwSmMv6CgW5xAm5XI4YtdAN87CWRMxn47Q4MSX3QssIXrfZq7XWCy
	Fbvf+s3pz5S6kiyU9QgCiUG9O6IWopL/BXHd9JuKcEAIX60Rhz6wlicSrIhElWiEicqorcwJpKsho
	CaAglplg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGvm-00000002kVK-03lw;
	Tue, 04 Mar 2025 01:18:46 +0000
Received: from mail-yw1-x1141.google.com ([2607:f8b0:4864:20::1141])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpGp4-00000002jgs-2YEL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:11:51 +0000
Received: by mail-yw1-x1141.google.com with SMTP id 00721157ae682-6fd65f1d262so18500047b3.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Mar 2025 17:11:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741050709; x=1741655509; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vluR2PPVFCeXo4Pv8qn9Rh/dHaN7yGoTkb474FlFpf8=;
        b=U4Rr5JOWUKnwsVpP53AbuWctdepYqBQPxQ+dzKDKy/uL5+TG95e9+nltFspaAoYwFC
         4cgLl1cRPk+UoTvee7UpPkAXIvU5J+qREP73rbwRJMs1DOjbOOVRy4NG2UXEHe5O7V5q
         Sz6lwRdlLZhnFqtmYIESv5d1QYyp6JKAxwHmT+sVjecluviommEs0iXmbs/PPeWhK+Z8
         aSmm4qdS/aHheIVkDwUUZhAwvQ1TNdeBLwvvFSi0aBuZL+YdIXHnxTR4dare7bLz1yvY
         VnT2r02lytrGs01H4OG7RK6IH1UBeWRz9hrCMZ170urPnzHb8VQ4MyxITVQ4eStJNtmd
         nq0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741050709; x=1741655509;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vluR2PPVFCeXo4Pv8qn9Rh/dHaN7yGoTkb474FlFpf8=;
        b=B1GydvSpXki7NwUwTfHDEM63Hfnr06Q/RkKUSfHBz9U7bWc9GqUo8JJydiC2mtQyA0
         j+UZg86wthRGsGNSbeBCxHxsoYdnbBo1xHEWJ3Ne0vXRFjMVdNHkA/MfpO3Ed+NEE/cT
         YGJQ/YIAh3OtB9uG6+4twXVfebNbBZEyUsC6yeJGhOxq7oPCgtUhsKXS13G4uKLFogCG
         K1CDtUFJiE++cO9pXUh0/9IZ3V5jNuf+nPM83eOid6mb/RFTRKnTD1tOE4acUm7UhCl4
         NJEAPmr1aTv++BZVSCVT9/zZ4OHO9PgPYFY7nNVJy4uEP4RNSC5VOugB+k+2DjPtvV2V
         XQAw==
X-Forwarded-Encrypted: i=1; AJvYcCWjUmSWlV/yQXbvsGFuDbfHFhgUnquZQrPYSJO3jmPINHtvJhAgOuDC7dR7xqeEH8tRfSTMKAtMbcL98uO5EruY@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3wD3j7DO8GAGgttOUQb7I7BGjlp/gmwseT3C1NMPsaseyNnXQ
	QMpw08pBDE8OheFHyorvKyQQb+RK8OmcrKA4MeDftd+zr7Lzdhq6vcZl4OcCUoCyFjEOT8agKBS
	qjS9NHIE6PLXpd9r9g166FQlkPMw=
X-Gm-Gg: ASbGncunwXA8bfxnQGs+CFFNMch35lCpFKA2qRmoKsTWN6LKdLiavMTUN++QPl2HYqc
	NU2Al2G/BVXrnw70Ox4A9rPXiLnehgnE/mh4j5mQv+v3ezp7V5LXxj6OMI4Ese9ucVVNCfZ9R4o
	bRw/6Sg4AY2ZIcnJzRgIAjUbl7aQ==
X-Google-Smtp-Source: AGHT+IEqUJezS4KkYf0hWTwJ3JT9iuB+Kta0och/jWyl/2qKN2Gk9IsJypM5kJk2wrbNcnQ46yEh3gTwcTGIDUZLWQo=
X-Received: by 2002:a05:690c:3808:b0:6f9:78c0:3a5f with SMTP id
 00721157ae682-6fd4a10ff41mr214699267b3.19.1741050709491; Mon, 03 Mar 2025
 17:11:49 -0800 (PST)
MIME-Version: 1.0
References: <20250303132837.498938-1-dongml2@chinatelecom.cn>
 <20250303132837.498938-2-dongml2@chinatelecom.cn> <20250303165454.GB11590@noisy.programming.kicks-ass.net>
In-Reply-To: <20250303165454.GB11590@noisy.programming.kicks-ass.net>
From: Menglong Dong <menglong8.dong@gmail.com>
Date: Tue, 4 Mar 2025 09:10:12 +0800
X-Gm-Features: AQ5f1JpFMtKlVjq9NnfZ6GpKN1o8CsUv-3k7tk0XiqG3kcbonZw3mKyWyXRBiyA
Message-ID: <CADxym3aVtKx_mh7aZyZfk27gEiA_TX6VSAvtK+YDNBtuk_HigA@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20250303_171150_648719_4BFB61F6 
X-CRM114-Status: GOOD (  34.58  )
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

On Tue, Mar 4, 2025 at 12:55=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
>
> On Mon, Mar 03, 2025 at 09:28:34PM +0800, Menglong Dong wrote:
> > For now, the layout of cfi and fineibt is hard coded, and the padding i=
s
> > fixed on 16 bytes.
> >
> > Factor out FINEIBT_INSN_OFFSET and CFI_INSN_OFFSET. CFI_INSN_OFFSET is
> > the offset of cfi, which is the same as FUNCTION_ALIGNMENT when
> > CALL_PADDING is enabled. And FINEIBT_INSN_OFFSET is the offset where we
> > put the fineibt preamble on, which is 16 for now.
> >
> > When the FUNCTION_ALIGNMENT is bigger than 16, we place the fineibt
> > preamble on the last 16 bytes of the padding for better performance, wh=
ich
> > means the fineibt preamble don't use the space that cfi uses.
> >
> > The FINEIBT_INSN_OFFSET is not used in fineibt_caller_start and
> > fineibt_paranoid_start, as it is always "0x10". Note that we need to
> > update the offset in fineibt_caller_start and fineibt_paranoid_start if
> > FINEIBT_INSN_OFFSET changes.
> >
> > Signed-off-by: Menglong Dong <dongml2@chinatelecom.cn>
>
> I'm confused as to what exactly you mean.
>
> Preamble will have __cfi symbol and some number of NOPs right before
> actual symbol like:
>
> __cfi_foo:
>   mov $0x12345678, %reg
>   nop
>   nop
>   nop
>   ...
> foo:
>
> FineIBT must be at foo-16, has nothing to do with performance. This 16
> can also be spelled: fineibt_preamble_size.
>
> The total size of the preamble is FUNCTION_PADDING_BYTES + CFI_CLANG*5.
>
> If you increase FUNCTION_PADDING_BYTES by another 5, which is what you
> want I think, then we'll have total preamble of 21 bytes; 5 bytes kCFI,
> 16 bytes nop.

Hello, sorry that I forgot to add something to the changelog. In fact,
I don't add extra 5-bytes anymore, which you can see in the 3rd patch.

The thing is that we can't add extra 5-bytes if CFI is enabled. Without
CFI, we can make the padding space any value, such as 5-bytes, and
the layout will be like this:

__align:
  nop
  nop
  nop
  nop
  nop
foo: -- __align +5

However, the CFI will always make the cfi insn 16-bytes aligned. When
we set the FUNCTION_PADDING_BYTES to (11 + 5), the layout will be
like this:

__cfi_foo:
  nop (11)
  mov $0x12345678, %reg
  nop (16)
foo:

and the padding space is 32-bytes actually. So, we can just select
FUNCTION_ALIGNMENT_32B instead, which makes the padding
space 32-bytes too, and have the following layout:

__cfi_foo:
  mov $0x12345678, %reg
  nop (27)
foo:

And the layout will be like this if fineibt and function metadata is both
used:

__cfi_foo:
        mov     --      5       -- cfi, not used anymore if fineibt is used
        nop
        nop
        nop
        mov     --      5       -- function metadata
        nop
        nop
        nop
        fineibt --      16      -- fineibt
foo:
        nopw    --      4
        ......

The things that I make in this commit is to make sure that
the code in arch/x86/kernel/alternative.c can find the location
of cfi hash and fineibt depends on the FUNCTION_ALIGNMENT.
the offset of cfi and fineibt is different now, so we need to do
some adjustment here.

In the beginning, I thought to make the layout like this to ensure
that the offset of cfi and fineibt the same:

__cfi_foo:
        fineibt  --   16  --  fineibt
        mov    --    5    -- function metadata
        nop(11)
foo:
        nopw    --      4
        ......

The adjustment will be easier in this mode. However, it may have
impact on the performance. That way I say it doesn't impact the
performance in this commit.

Sorry that I didn't describe it clearly in the commit log, and I'll
add the things above to the commit log too in the next version.

Thanks!
Menglong Dong

>
> Then kCFI expects hash to be at -20, while FineIBT must be at -16.
>
> This then means there is no unambiguous hole for you to stick your
> meta-data thing (whatever that is).
>
> There are two options: make meta data location depend on cfi_mode, or
> have __apply_fineibt() rewrite kCFI to also be at -16, so that you can
> have -21 for your 5 bytes.
>
> I think I prefer latter.
>
> In any case, I don't think we need *_INSN_OFFSET. At most we need
> PREAMBLE_SIZE.
>
> Hmm?

