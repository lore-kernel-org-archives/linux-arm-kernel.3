Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3F48C79F9F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSwPcNo8o0N6KCcNlfNXq5S6yUSOj9uBi5hsA/QPZGo=; b=xgLIuspVPlSeraov5d334G2uNR
	bzqGGHO6LYDwrxvrwa76YEv+BnEMmi256ylHZt3MhcNF+gtOiVYPHhK4AVdOfYR3yorVylqE6Zjy5
	SVO4n+rMrE5Nw8UXDz5m2PdtoQZgnjRBh5XuMillfhkgELJtlwKcAGcppHY4LG6Lep9GVrt8aLKLE
	NhQg5ukdtov/Cj7Bifx0IMQj+OdEKUmPU7Fxv5YvQx82JJK8Wdp4D9hmPNdZPuKp2fEpZmTsve6KV
	jR6XcImtGRjyYFad3IZQYChhJFCfOQiqQ/bDPdzaEnq3udPDcT8o+7Xlp8XvSGdT+T2vop2bDlKrF
	lhW4ZSVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclqD-0000000BZ15-1dCr;
	Mon, 05 Jan 2026 14:45:53 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclqA-0000000BZ0K-0GJE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:45:51 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-477632d9326so86151375e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 05 Jan 2026 06:45:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767624348; x=1768229148; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XSwPcNo8o0N6KCcNlfNXq5S6yUSOj9uBi5hsA/QPZGo=;
        b=Mjuf7FF+r6KAz71+Xosnx7graUoYAntEs3f9gYGo6WnallDaW7F0zsP7uZPBZA7dU7
         U3HnhY1uzVY9qR4bG1c++1tN4wqPWa8sZaARU7JKbxW7L89k5zcNnvfU9Vfzef1uxKLQ
         S3W+9VQFETEwJqnsczuLi9XhjOSL9LdPgPqGKpOKZqdnWkUEs7FIxwYSbCDNbrLgVyoK
         vxfzDt+zW9GT8op2M9sMIYMazQBqBSjtevnwSLewNGRNb0GoDmNLI2xm9PiMQfpW9ZYN
         26ZYzyvZVnyM/CF+mfDaUL9jO7GO/z53ZzwxHjoGZyNz9v8CgWfSCXZmh54PenBoSrBR
         vfbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767624348; x=1768229148;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XSwPcNo8o0N6KCcNlfNXq5S6yUSOj9uBi5hsA/QPZGo=;
        b=uxYjOsg32GAAnOQT9xWOcHTI0PSpJMdjFKI0O5UCexyUVhH4Lx4uEQKtOcNMKcFDDE
         /XOdJ/FEWsN9r4P8w74B9fg+IlIEVAdK9po5Ox2ArATPCOKcxwPKMFGH9d5zom29c14M
         Itvfi+7CbJqe9/ePVQTJJma+6OAMHlSG3gIEvpUgNzp6Yy6iUB+qlHbjpzoDUvHRTXMf
         3ygv1TkabuVS5Hd7UFDgKiUIOFWWD7NcTXimozJgFCvwwSi1j7LeHU9R46JyriEAYO1g
         Hx2aMavw0M7TFXhs5fIC90f4zJunByfyAkS1Xyo7U/xYh1dtHjMGpHrx6DckNcXY69PG
         7owQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJnhJOOR+OVvv+XU55zg55lPVMHrb2rfI21qqosDiH37NW5FimYKe1WUXcrFXcWhQ4XpiMibailhk01aLlveD7@lists.infradead.org
X-Gm-Message-State: AOJu0YxkuLIXMdJLlGVLV0z6kDGT4KhPb8OMrRGfh1L8KUNocD9sNi6o
	/TTK5kd64kf95dVFwvCddvRydLWyNWnXNEqrUJtZLfLXP/o5GajF+zYS
X-Gm-Gg: AY/fxX7LhED3SldAP1YvX6rumWwW90ZXh8hdHzKy/GvgP9PVCONsKLnDsk2mFAmyrpJ
	9nKD5/7wf1EUxh/LUHjL+VyzPJjFZXEf0oO4mR60xLKlQy4eRo9L1nBX1JADOfQavMTfGzT0b2j
	7DlwHIvKxftJC1hq0z9F06Yl6idd0uunxf7x2Fz01ljS8LjANtKYXbMHeapcmYaCWTu6JROsxAc
	ReXlA8scI5142bJisMN5HN6MeG/t2MyejuZyoaMmdV1DMHplj3+BnpsBXFDxZagD5mwFXFDf3jY
	ZabEMllv663d3mDHD8yhQym9vVEAejc8Og7pYy/IU++kJTJEChEsMgGVWL3DWMruMfHqhreZmVI
	FmuadYzV+TixT2XiLymTO4L8qxu4W1i3x3tDQebNExPFVUL+ytiycCR8tFdWZJxxF68MUO0y5OV
	w/SpkIcYIWK+P2kHBfRFUuuUTfLwcG59FpQMq73Lsk4ChiSz7UhAFTSPQaUiyg+cA=
X-Google-Smtp-Source: AGHT+IEzQJ2d8LdW+ZAISEQqtjJZ6hu3kCqntkmy/4NpDB13AhMox7IMuU26/rlmQkOaOYroxoA3pQ==
X-Received: by 2002:a05:600c:1991:b0:477:5af7:6fa with SMTP id 5b1f17b1804b1-47d195aa354mr674903875e9.32.1767624347886;
        Mon, 05 Jan 2026 06:45:47 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d6d452c69sm195826845e9.9.2026.01.05.06.45.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jan 2026 06:45:47 -0800 (PST)
Date: Mon, 5 Jan 2026 14:45:45 +0000
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
Message-ID: <20260105144545.45f2b0ba@pumpkin>
In-Reply-To: <60c5d7b1-1ab7-490c-8cb8-dfd50cf23856@arm.com>
References: <20260102131156.3265118-1-ryan.roberts@arm.com>
	<20260102131156.3265118-4-ryan.roberts@arm.com>
	<20260104230136.7aaf8886@pumpkin>
	<60c5d7b1-1ab7-490c-8cb8-dfd50cf23856@arm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_064550_151277_3B43F8F7 
X-CRM114-Status: GOOD (  51.96  )
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

On Mon, 5 Jan 2026 11:05:18 +0000
Ryan Roberts <ryan.roberts@arm.com> wrote:

> On 04/01/2026 23:01, David Laight wrote:
> > On Fri,  2 Jan 2026 13:11:54 +0000
> > Ryan Roberts <ryan.roberts@arm.com> wrote:
> >   
> >> Previously different architectures were using random sources of
> >> differing strength and cost to decide the random kstack offset. A number
> >> of architectures (loongarch, powerpc, s390, x86) were using their
> >> timestamp counter, at whatever the frequency happened to be. Other
> >> arches (arm64, riscv) were using entropy from the crng via
> >> get_random_u16().
> >>
> >> There have been concerns that in some cases the timestamp counters may
> >> be too weak, because they can be easily guessed or influenced by user
> >> space. And get_random_u16() has been shown to be too costly for the
> >> level of protection kstack offset randomization provides.
> >>
> >> So let's use a common, architecture-agnostic source of entropy; a
> >> per-cpu prng, seeded at boot-time from the crng. This has a few
> >> benefits:
> >>
> >>   - We can remove choose_random_kstack_offset(); That was only there to
> >>     try to make the timestamp counter value a bit harder to influence
> >>     from user space.
> >>
> >>   - The architecture code is simplified. All it has to do now is call
> >>     add_random_kstack_offset() in the syscall path.
> >>
> >>   - The strength of the randomness can be reasoned about independently
> >>     of the architecture.
> >>
> >>   - Arches previously using get_random_u16() now have much faster
> >>     syscall paths, see below results.
> >>
> >> There have been some claims that a prng may be less strong than the
> >> timestamp counter if not regularly reseeded. But the prng has a period
> >> of about 2^113. So as long as the prng state remains secret, it should
> >> not be possible to guess. If the prng state can be accessed, we have
> >> bigger problems.  
> > 
> > If you have 128 bits of output from consecutive outputs I think you
> > can trivially determine the full state using (almost) 'school boy' maths
> > that could be done on pencil and paper.
> > (Most of the work only has to be done once.)
> > 
> > The underlying problem is that the TAUSWORTHE() transformation is 'linear'
> > So that TAUSWORTHE(x ^ y) == TAUSWORTHE(x) ^ TAUSWORTHE(y).
> > (This is true of a LFSR/CRC and TOUSWORTH() is doing some subset of CRCs.)
> > This means that each output bit is the 'xor' of some of the input bits.
> > The four new 'state' values are just xor of the the bits of the old ones.
> > The final xor of the four states gives a 32bit value with each bit just
> > an xor of some of the 128 state bits.
> > Get four consecutive 32 bit values and you can solve the 128 simultaneous
> > equations (by trivial substitution) and get the initial state.
> > The solution gives you the 128 128bit constants for:
> > 	u128 state = 0;
> > 	u128 val = 'value returned from 4 calls';
> > 	for (int i = 0; i < 128; i++)
> > 		state |= parity(const128[i] ^ val) << i;  
> 
> What is const128[] here?

Some values you prepared earlier :-)

> > You done need all 32bits, just accumulate 128 bits.  
> > So if you can get the 5bit stack offset from 26 system calls you know the
> > value that will be used for all the subsequent calls.  
> 
> It's not immediately obvious to me how user space would do this, but I'll take
> it on faith that it may be possible.

It shouldn't be possible, but anything that leaks a stack address would
give it away.
It is also pretty much why you care about the cycle length of the PRNG.
(If the length is short a rogue application can remember all the values.)

> > 
> > Simply changing the final line to use + not ^ makes the output non-linear
> > and solving the equations a lot harder.  
> 
> There has been pushback on introducing new primitives [1] but I don't think
> that's a reason not to considder it.

That is a more general issue with the PRNG.
ISTR it was true for the previous version that explicitly used four CRC.
Jason should know more about whether the xor are a good idea.

> 
> [1] https://lore.kernel.org/all/aRyppb8PCxFKVphr@zx2c4.com/
> 
> > 
> > I might sit down tomorrow and see if I can actually code it...  
> 
> Thanks for the analysis! I look forward to seeing your conclusion... although
> I'm not sure I'll be qualified to evaluate it mathematically.

I need to drag out the brian cells from when I learnt about CRC (actually
relating to burst error correction) over 40 years ago...
 
> FWIW, I previously had a go at various schemes using siphash to calculate some
> random bits. I found it to be significantly slower than this prng. I've so far
> taken the view that 6 bits of randomness is not much of a defence against brute
> force so we really shouldn't be spending too many cycles to generate the bits.
> If we can get to approach to work, I think that's best.

Indeed.
A single 32bit CRC using (crc + (crc >> 16)) & 0x3f could be 'good enough'.
Especially if the value is 'perturbed' during (say) context switch.
The '16' might need adjusting for the actual CRC, especially if TAUSWORTHE()
is used - you don't want the value to match one of the shifts it uses.

prandom_u32_state() is defined as:
#define TAUSWORTHE(s, a, b, c, d) ((s & c) << d) ^ (((s << a) ^ s) >> b)
	state->s1 = TAUSWORTHE(state->s1,  6U, 13U, 4294967294U, 18U);
	state->s2 = TAUSWORTHE(state->s2,  2U, 27U, 4294967288U,  2U);
	state->s3 = TAUSWORTHE(state->s3, 13U, 21U, 4294967280U,  7U);
	state->s4 = TAUSWORTHE(state->s4,  3U, 12U, 4294967168U, 13U);
	return (state->s1 ^ state->s2 ^ state->s3 ^ state->s4);
This is equivalent to:
#define TAUSWORTHE(s, a, b, c, d) ((s & ~c) << d) ^ (s >> a) ^ (s >> b)
	state->s1 = TAUSWORTHE(state->s1,  7, 13,   1, 18);
	state->s2 = TAUSWORTHE(state->s2, 25, 27,   7,  2);
	state->s3 = TAUSWORTHE(state->s3,  8, 21,  15,  7);
	state->s4 = TAUSWORTHE(state->s4,  9, 12, 127, 13);
which makes it clear that some low bits of each 's' get discarded reducing
the length of each CRC to (I think) 31, 29, 28 and 25.
Since 'b + d' matches the bits discarded by 'c', two of those shifts are
actually just a rotate, so there isn't really much 'bit stirring' going on.

By comparison CRC-16 (for hdlc comms like x25, isdn and ss7) reduces to:
u32 crc_step(u32 crc, u8 byte_val)
{
    u8 t = crc ^ byte_val;
    t = (t ^ t << 4);
    return crc >> 8 ^ t << 8 ^ t << 3 ^ t >> 4;
}
Much more 'stirring'.

	David



