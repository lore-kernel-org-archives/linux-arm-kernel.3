Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25628CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 10:32:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nY54d2Pu4LAFj+a++6dsUx2wBC2sVN/1x6Y0JSM7R6A=; b=XHg05m5sBqK0W+m1OQ+SUgT8TC
	IXHWVyplaajRhXamTR2e4BVHH/sNIeGu7MtX7DQ9K/h1OzJ8qzYSTU8QT2Qx2k5S7GJhrmwO1iYga
	kqLsX6KlMEZQrUxNQcXFtm2dYplBBqXvPLETZXhi9RmENG8MuMTgozyBlMwruYgeBMUq2pcB1Lh/7
	g9ze7Kd2gNSxPNJtkLNBVNup99d5HMlzGbHhMWM+vHUvOJQgiX6mYlCsMWpOtiL0O1FuDsL+f9vNk
	aATzdBrLg6EvRO5YZcdmlVcaBqSbnRuJuZkRDyiBsOc3FiZyzvPnwMN3XvePLoi3UwA8UJ5mHHrEA
	CwH7vxCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ89Z-00000008aQd-0gdz;
	Wed, 12 Nov 2025 10:32:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ89Y-00000008aQ7-0Kfb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 10:32:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1FD96020F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:32:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92589C116B1
	for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 10:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762943556;
	bh=ywubOylLCebiTSUrMRLnw9fCTyEak2lItra9Lxo4L9o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=lozUXJCCBKuEa9qQ4I0eArY7t6Npnh8rBdaPFD6MqAKwV6BmGNA+b2+z8M4nu8fV+
	 RoGM2BQUIPMWWhx2wf833+y4HqznotSAJeVZ+Ck87uGOmxy3D0FbdZaBZwtvTNCnOu
	 1VjmITr5UP6qo2B6GAQgZQIoq//thkwgw5C5j/IeN+jzzvV7NvO6pPb8qltA2an6FM
	 cLxpj21KNmjdeWgGa1GAEMl9dHq8sMjeYapP9Gf/VaF+R8WOidl9BrvtI/w99u47iS
	 WXoB8b8Bdl206A56coAA145gNbCesYyTAzmXnUtnFTZs3MX/3ohNhHrpTeFv9YD/ZH
	 IHoPc6t/WXcJg==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-5957d759726so102328e87.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Nov 2025 02:32:36 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVb+Nd4TOPAoDSy+LWrq1Bt13Dn3ICNlYALdekVduiL+ptP4ZlRIf9bgBdATl2RE0YsdnLnl+4alq8KrPegETnW@lists.infradead.org
X-Gm-Message-State: AOJu0YwkBxalcM+PnhAkRz4p886AeSIXI8TDqoCzZtiC2q3nFDZcJhrb
	ztWF7TthUhsFwdQYPdcEFnn1Y4o6AhRTyttg9aUmnexabd0UXs4hAqtMFr1uMzyC7u5ArURtac0
	f6zqUDwT2Zvhc20XFP+2xktijY/H4Nxg=
X-Google-Smtp-Source: AGHT+IFMI1NWnlseQ2188hDT4d4Fwv2qI5ssFRnfdwUkxpJylGlSWzLDUQSzBOICWQAiTDvP3niRGlzQ+YcXKWMiwj8=
X-Received: by 2002:a05:6512:61cd:10b0:595:7a6c:7dd3 with SMTP id
 2adb3069b0e04-5957a6c81cbmr478959e87.5.1762943554915; Wed, 12 Nov 2025
 02:32:34 -0800 (PST)
MIME-Version: 1.0
References: <20251109234726.638437-1-ebiggers@kernel.org> <20251109234726.638437-3-ebiggers@kernel.org>
 <CAMj1kXE1mhu7u5RwhCBA_RUGV6JSDV-GQPpq+thE-0-oVxrmfw@mail.gmail.com>
 <CAMj1kXHoH2K0dpqyrgFJ-OBmP2QrUWZD3aCfaA_eoPzGsLbPMw@mail.gmail.com> <20251111194603.GB1748@sol>
In-Reply-To: <20251111194603.GB1748@sol>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Wed, 12 Nov 2025 11:32:23 +0100
X-Gmail-Original-Message-ID: <CAMj1kXHZ9vaMHNvBb1ByjazwqJANv0pATGE7q0X=RmgsxS5i+w@mail.gmail.com>
X-Gm-Features: AWmQ_bk9G0YzBoCkb5nXtZ33vCph-hbQkuXNLFM_L9tnc29akWRGwOHjoeGq1aU
Message-ID: <CAMj1kXHZ9vaMHNvBb1ByjazwqJANv0pATGE7q0X=RmgsxS5i+w@mail.gmail.com>
Subject: Re: [PATCH 2/9] lib/crypto: polyval: Add POLYVAL library
To: Eric Biggers <ebiggers@kernel.org>
Cc: linux-crypto@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"Jason A . Donenfeld" <Jason@zx2c4.com>, Herbert Xu <herbert@gondor.apana.org.au>, 
	linux-arm-kernel@lists.infradead.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Tue, 11 Nov 2025 at 20:47, Eric Biggers <ebiggers@kernel.org> wrote:
>
> On Tue, Nov 11, 2025 at 08:42:29AM +0100, Ard Biesheuvel wrote:
> > On Mon, 10 Nov 2025 at 16:21, Ard Biesheuvel <ardb@kernel.org> wrote:
> > >
> > > Hi,
> > >
> > > On Mon, 10 Nov 2025 at 00:49, Eric Biggers <ebiggers@kernel.org> wrote:
> > > >
> > > > Add support for POLYVAL to lib/crypto/.
> > > >
> > > > This will replace the polyval crypto_shash algorithm and its use in the
> > > > hctr2 template, simplifying the code and reducing overhead.
> > > >
> > > > Specifically, this commit introduces the POLYVAL library API and a
> > > > generic implementation of it.  Later commits will migrate the existing
> > > > architecture-optimized implementations of POLYVAL into lib/crypto/ and
> > > > add a KUnit test suite.
> > > >
> > > > I've also rewritten the generic implementation completely, using a more
> > > > modern approach instead of the traditional table-based approach.  It's
> > > > now constant-time, requires no precomputation or dynamic memory
> > > > allocations, decreases the per-key memory usage from 4096 bytes to 16
> > > > bytes, and is faster than the old polyval-generic even on bulk data
> > > > reusing the same key (at least on x86_64, where I measured 15% faster).
> > > > We should do this for GHASH too, but for now just do it for POLYVAL.
> > > >
> > >
> > > Very nice.
> > >
> > > GHASH might suffer on 32-bit, I suppose, but taking this approach at
> > > least on 64-bit also for GHASH would be a huge improvement.
> > >
> > > I had a stab at replacing the int128 arithmetic with
> > > __builtin_bitreverse64(), but it seems to make little difference (and
> > > GCC does not support it [yet]). I've tried both arm64 and x86, and the
> > > perf delta (using your kunit benchmark) is negligible in either case.
> >
> > Sigh. I intended to only apply the generic patch and the kunit test,
> > but applied the whole series in the end, which explains perfectly why
> > x86_64 and arm64 performance are identical, given that the generic
> > code isn't even used.
> >
> > So trying this again, on a Cortex-A72 without Crypto Extensions, I do
> > get a ~30% performance improvement doing the below. I haven't
> > re-tested x86, but given that it does not appear to have a native
> > scalar bit reverse instruction (or __builtin_bitreverse64() is broken
> > for it), there is probably no point in finding out.
> >
> > Not saying we should do this for POLYVAL, but something to keep in
> > mind for gf128mul.c perhaps.
> >
> >
> > --- a/lib/crypto/polyval.c
> > +++ b/lib/crypto/polyval.c
> > @@ -42,11 +42,48 @@
> >   * 256-bit => 128-bit reduction algorithm.
> >   */
> >
> > -#ifdef CONFIG_ARCH_SUPPORTS_INT128
> > +#if defined(CONFIG_ARCH_SUPPORTS_INT128) ||
> > __has_builtin(__builtin_bitreverse64)
> >
> >  /* Do a 64 x 64 => 128 bit carryless multiplication. */
> >  static void clmul64(u64 a, u64 b, u64 *out_lo, u64 *out_hi)
> >  {
> > +       u64 a0 = a & 0x1111111111111111;
> > +       u64 a1 = a & 0x2222222222222222;
> > +       u64 a2 = a & 0x4444444444444444;
> > +       u64 a3 = a & 0x8888888888888888;
> > +
> > +       u64 b0 = b & 0x1111111111111111;
> > +       u64 b1 = b & 0x2222222222222222;
> > +       u64 b2 = b & 0x4444444444444444;
> > +       u64 b3 = b & 0x8888888888888888;
> > +
> > +#if __has_builtin(__builtin_bitreverse64)
> > +#define brev64 __builtin_bitreverse64
> > +       u64 c0 = (a0 * b0) ^ (a1 * b3) ^ (a2 * b2) ^ (a3 * b1);
> > +       u64 c1 = (a0 * b1) ^ (a1 * b0) ^ (a2 * b3) ^ (a3 * b2);
> > +       u64 c2 = (a0 * b2) ^ (a1 * b1) ^ (a2 * b0) ^ (a3 * b3);
> > +       u64 c3 = (a0 * b3) ^ (a1 * b2) ^ (a2 * b1) ^ (a3 * b0);
> > +
> > +       a0 = brev64(a0);
> > +       a1 = brev64(a1);
> > +       a2 = brev64(a2);
> > +       a3 = brev64(a3);
> > +
> > +       b0 = brev64(b0);
> > +       b1 = brev64(b1);
> > +       b2 = brev64(b2);
> > +       b3 = brev64(b3);
> > +
> > +       u64 d0 = (a0 * b0) ^ (a1 * b3) ^ (a2 * b2) ^ (a3 * b1);
> > +       u64 d1 = (a0 * b1) ^ (a1 * b0) ^ (a2 * b3) ^ (a3 * b2);
> > +       u64 d2 = (a0 * b2) ^ (a1 * b1) ^ (a2 * b0) ^ (a3 * b3);
> > +       u64 d3 = (a0 * b3) ^ (a1 * b2) ^ (a2 * b1) ^ (a3 * b0);
> > +
> > +       *out_hi = ((brev64(d0) >> 1) & 0x1111111111111111) ^
> > +                 ((brev64(d1) >> 1) & 0x2222222222222222) ^
> > +                 ((brev64(d2) >> 1) & 0x4444444444444444) ^
> > +                 ((brev64(d3) >> 1) & 0x8888888888888888);
>
> Yeah, that's an interesting idea!  So if we bit-reflect the inputs, do
> an n x n => n multiplication, and bit-reflect the output and right-shift
> it by 1, we get the high half of the desired n x n => 2n multiplication.
> (This relies on the fact that carries are being discarded.)  Then we
> don't need an instruction that does an n x n => 2n multiplication or
> produces the high half of it.
>
> The availability of hardware bit-reversal is limited, though.  arm32,
> arm64, and mips32r6 have it.  But all of those also have a "multiply
> high" instruction.  So the 30% performance improvement you saw on arm64
> seems surprising to me, as umulh should have been used.  (I verified
> that it's indeed used in the generated asm with both gcc and clang.)
>

Yeah - it might be just the compiler making a mess of things. GCC is
already considerably faster than Clang doing the u128 arithmetic (75
vs 67 MB/s on RPi4). But the bit reverse code manages 85 MB/s [which
is only 26% faster btw, so a bit less than when I tried this the other
day].

I re-tested Apple M2 (which doesn't need this code, but for
comparison), and there the GCC generated u128 code is as fast or
slightly faster than the Clang generated bitreverse code.

So I guess this is more a matter of fixing the u128 related codegen on Clang.


> The available bit-reversal abstractions aren't too great either, with
> __builtin_bitreverse64() being clang-specific and <linux/bitrev.h>
> having a table-based, i.e. non-constant-time, fallback.  So presumably
> we'd need to add our own which is guaranteed to use the actual
> instructions and not some slow and/or table-based fallback.
>

__builtin_bitreverse64() does exist on x86 too, but generates a huge
pile of code, so the mere availability is not a good reason to use it
either.

> I'll definitely look into this more later when bringing this improvement
> to GHASH too.  But for now I think we should go with the version I have
> in my patch.
>

For now, definitely. And I'll see if I can file a Clang bug somewhere.
But I don't think we'll be making use of bitreverse for GHASH either.

