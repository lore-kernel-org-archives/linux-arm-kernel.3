Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1090DCFD63F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nTerFL81XHMixYnvh7u2MldwUCD+ZWdDPLrHKRPjXbw=; b=ufT4ZncSVQie1zh9elICDtisy+
	6qF2iNWGxUhSgE2rjU5Flp3ElJXtOt/UZNUHntptylhOLWZBazdoUU1KigRPjgUfEKpHeaJ52/s/+
	WH2kqRsG/RPkEJwe5QYqhttJhUc/YQgkgjkmSQ7Q76akvnQGn7PvfLsRK6y9ZXIvoT9ZqZHUvq3Vn
	OHyEwHz3By8ozqQMv4iMPEM+W7QpzUkpJa5gNELNP8GK5alnDg5MVjEk5oIh4w/WWb0Iwt99IPAP2
	D1osycG6ONi9FtuCH7GYyar9Uou39kETgt6NnhnwyRyYNEcVOjLPOOAdFESZDfVvTmQG7eIf2Lber
	Iv2eAstA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUAP-0000000F39X-2KAK;
	Wed, 07 Jan 2026 14:05:41 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUAN-0000000F38P-07K6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:05:40 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so12175695e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Jan 2026 06:05:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767794737; x=1768399537; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nTerFL81XHMixYnvh7u2MldwUCD+ZWdDPLrHKRPjXbw=;
        b=aThHVx6AJeGLSuq5b70chTCQFgykfRzdD0FhcTZnEgbd05O8ZN+RpDMsOBhB3RRJtU
         aDi1g+JIp46IAJkqiR/wHP6Amh1hS2unkfaciNhP0hQ3YUWxYMCzV8jRXvwxwNkmylRL
         4PnmqyZDy4mMpiBiIPysmNs44NLzxgKNoZochTtynoM/W4bb8anbL2bvo+pNdvtL9Lcw
         aOwgYhRNZk4FdVOCjicIyqx905lVt4vlT3c5afqwV9XmEdZW56PM/OscxOHMHhZBeo2T
         kA3TDzkjzr33h2RnS9Vzk3B47Eld7f5jcDM9dmVpocwwriCbgAGTd9JRAslfXX+3TYYd
         oApA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767794737; x=1768399537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nTerFL81XHMixYnvh7u2MldwUCD+ZWdDPLrHKRPjXbw=;
        b=A1JKzHbKmQ9YrZjUiWNpErSnJcbEgkRWl8kVnWhzZFXnvqm+LiAMicLnZ6+r5ayCyT
         ApjkVL0RJCKN4GrxdnJWQ82tdRYVTkl26oQ3RWwW9FPxL3IBBLWDDuvG5oYI2zTSi+OS
         S2BSXjx4j2FJoKZoZTQPq6x6DF254BjbDzaMmV6SpzwZsOxsnX9+bJfWEYhSSYLacGGy
         amTvR27dodmP+1F+orjlobOVMMTmVTMz/M3Peccp6ZsOayM0o7h7xeJ4NDzrN52Mu6Pr
         tb3B4PDQeOx6+VMtYiJ5H024Y8JzneiUJQEs7WNH7JMh3YihExf6s/yUdt6qRKtSKJun
         Tvxg==
X-Forwarded-Encrypted: i=1; AJvYcCW8KEjy8iCgkZJbZ5t/xaz07fljfvzNVeR12HgY3kBAm6PhOGaGlowpox546pqcDwdHXzLPD0yJ4BYhvvSvvGa2@lists.infradead.org
X-Gm-Message-State: AOJu0YydGSJLdDzvpMt/SQT4f/nBdcCz4EgfhK9xqaB4ByQQp8kyOKu2
	a5IzwroIEyt6D5xrzt0UuKvOjrcMvk2OrrDmip/B5EDUAVutV11nbmO1
X-Gm-Gg: AY/fxX4M3yOxtsOqAub/r7pwjs7NYKuXLAPE01R8K/x6KGphkiamx9SipxqpBCGrzJb
	a2yVTyu6j6XDKYdTN6ZJBVIxaBEobNh9Tywr6viccyQE053DEHdLHD/Lg3VaDTWnsydqdrWuy8k
	IaJF/+CCvBQM4huVc4kvvd7JHktdg7uHyjwKSOsT2rSbU4fhxSCuYrtG/lRbu+9ukD7Sv5bg48+
	FsceLmrx1VZ92qLF1qqyo3+8Uop9ztYsyU+dJc5S83upGIBUtffF6LDfFRL6LjXmMEwmfGF4WMS
	FjUmjOdwJQgDNneTSxYVPAXhyka2q+D93xb9tBWhMaSI4Yk6Y9Z6b0SQnPgt8FWPta4DVry4Pzs
	5Gq3CbUxPZLUafMhKOMDwWnv1pr/YR6fGV81AN8BX6XfMyvadsAhnSA+tG21nZ89zMTVAasIU/i
	lNxSK/wAkcbEjBdB1Pnc8nkLuGKvPTE+Q5vdNhJ6c37S2/Sy5ajTTU
X-Google-Smtp-Source: AGHT+IFJHEaZoRkhHw4zj9EBxNV/rp8ncSP4Ef47XQLiJPMu3j1wMm2BAE3otGmVGJMIybtQwjSgsQ==
X-Received: by 2002:a05:600c:8b6d:b0:47a:814c:eea1 with SMTP id 5b1f17b1804b1-47d84b4a7b4mr30796025e9.35.1767794736254;
        Wed, 07 Jan 2026 06:05:36 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d87167832sm13555455e9.7.2026.01.07.06.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 06:05:35 -0800 (PST)
Date: Wed, 7 Jan 2026 14:05:33 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon
 <will@kernel.org>, Huacai Chen <chenhuacai@kernel.org>, Madhavan Srinivasan
 <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, Paul Walmsley
 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik
 <gor@linux.ibm.com>, Alexander Gordeev <agordeev@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, Kees Cook
 <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Rutland <mark.rutland@arm.com>, "Jason A.
 Donenfeld" <Jason@zx2c4.com>, Ard Biesheuvel <ardb@kernel.org>, Jeremy
 Linton <jeremy.linton@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, loongarch@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH v3 3/3] randomize_kstack: Unify random source across
 arches
Message-ID: <20260107140533.2b3c46a1@pumpkin>
In-Reply-To: <20260104230136.7aaf8886@pumpkin>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_060539_117420_4BE1A236 
X-CRM114-Status: GOOD (  44.43  )
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

On Sun, 4 Jan 2026 23:01:36 +0000
David Laight <david.laight.linux@gmail.com> wrote:

> On Fri,  2 Jan 2026 13:11:54 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
> > Previously different architectures were using random sources of
> > differing strength and cost to decide the random kstack offset. A number
> > of architectures (loongarch, powerpc, s390, x86) were using their
> > timestamp counter, at whatever the frequency happened to be. Other
> > arches (arm64, riscv) were using entropy from the crng via
> > get_random_u16().
> > 
> > There have been concerns that in some cases the timestamp counters may
> > be too weak, because they can be easily guessed or influenced by user
> > space. And get_random_u16() has been shown to be too costly for the
> > level of protection kstack offset randomization provides.
> > 
> > So let's use a common, architecture-agnostic source of entropy; a
> > per-cpu prng, seeded at boot-time from the crng. This has a few
> > benefits:
> > 
> >   - We can remove choose_random_kstack_offset(); That was only there to
> >     try to make the timestamp counter value a bit harder to influence
> >     from user space.
> > 
> >   - The architecture code is simplified. All it has to do now is call
> >     add_random_kstack_offset() in the syscall path.
> > 
> >   - The strength of the randomness can be reasoned about independently
> >     of the architecture.
> > 
> >   - Arches previously using get_random_u16() now have much faster
> >     syscall paths, see below results.
> > 
> > There have been some claims that a prng may be less strong than the
> > timestamp counter if not regularly reseeded. But the prng has a period
> > of about 2^113. So as long as the prng state remains secret, it should
> > not be possible to guess. If the prng state can be accessed, we have
> > bigger problems.  
> 
> If you have 128 bits of output from consecutive outputs I think you
> can trivially determine the full state using (almost) 'school boy' maths
> that could be done on pencil and paper.
> (Most of the work only has to be done once.)
> 
> The underlying problem is that the TAUSWORTHE() transformation is 'linear'
> So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
> (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
> This means that each output bit is the 'xor' of some of the input bits.
> The four new 'state' values are just xor of the the bits of the old ones.
> The final xor of the four states gives a 32bit value with each bit just
> an xor of some of the 128 state bits.
> Get four consecutive 32 bit values and you can solve the 128 simultaneous
> equations (by trivial substitution) and get the initial state.
> The solution gives you the 128 128bit constants for:
> 	u128 state = 0;
> 	u128 val = 'value returned from 4 calls';
> 	for (int i = 0; i < 128; i++)
> 		state |= parity(const128[i] ^ val) << i;
> You don't need all 32bits, just accumulate 128 bits.  
> So if you can get the 5bit stack offset from 26 system calls you know the
> value that will be used for all the subsequent calls.

Some of the state bits don't get used, so you only need 123 bits.
The stack offset is 6 bits - so you need the values from 19 calls.

> Simply changing the final line to use + not ^ makes the output non-linear
> and solving the equations a lot harder.
> 
> I might sit down tomorrow and see if I can actually code it...

Finally done:

#include <stdio.h>
#include <unistd.h>
#include <fcntl.h>

typedef unsigned int u32;
typedef unsigned long long u64;
typedef unsigned __int128 u128;

struct rnd_state { u32 s1; u32 s2; u32 s3; u32 s4; };
u32 prandom_u32_state(struct rnd_state *state)
{
#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
        state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
        state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
        state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
        state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);

        return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
}

#define X(n, hi, lo) [n] = (u128)0x##hi << 64 | 0x##lo
u128 map[128] = {
        X(  1, 23acb122e4a76, e206c3f6fe435cb6),
	...
        X(127, 00d3276d8a76a, e560d1975675be24) };

u128 parity_128(u128 v)                 
{                               
        return __builtin_parityll(v) ^ __builtin_parityll(v >> 64);
}

int main(int argc, char **argv)
{
        struct rnd_state s = {};
        u128 s0, v, r = 0;

        read(open("/dev/urandom", O_RDONLY), &s, sizeof s);
        // Remove low bits that get masked by the (s & c) term.
        s.s1 &= ~1; s.s2 &= ~7; s.s3 &= ~15; s.s4 &= ~127;
        s0 = (((u128)s.s4 << 32 | s.s3) << 32 | s.s2) << 32 | s.s1;
        v = prandom_u32_state(&s);
        v |= (u128)prandom_u32_state(&s) << 32;
        v |= (u128)prandom_u32_state(&s) << 64;
        v |= (u128)prandom_u32_state(&s) << 96;

        for (int n = 0; n < 128; n++)
                r |= parity_128(v & map[n]) << n;

        printf("%016llx%016llx\n", (u64)(s0 >> 64), (u64)s0);
        printf("values%s match\n", r == s0 ? "" : " do not");

        return r != s0;
}

I've trimmed the initialiser - it is very boring.
The code to create the initialiser is actually slightly smaller than it is.
Doable by hand provided you can do 128bit shift and xor without making
any mistakes.

I've just done a quick search through the kernel sources and haven't found
many uses of prandom_u32_state() outside of test code.
There is sched_rng() which uses a per-cpu rng to throw a 1024 sized die.
bpf also has a per-cpu one for 'unprivileged user space'.
net/sched/sch_netem.c seems to use one - mostly for packet loss generation.

Since the randomize_kstack code is now using a per-task rng (initialised
by clone?) that could be used instead of all the others provided they
are run when 'current' is valid.

But the existing prandom_u32_state() needs a big health warning that
four outputs leak the entire state.
That is fixable by changing the last line to:
        return state->s1 + state->s2 + state->s3 + state->s4;
That only affects the output value, the period is unchanged.

	David



