Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3284EC98302
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Jan 2026 21:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ma34RY04McdLUFikJCMfVhGXi6rphMQdbOsKxFr4Zac=; b=STreMTkdgCSqccMEaBo4eYdQ8T
	0hLvPLKq8Fewee1ShIp0G04Iz3WjtiLsPfaqkFaRYyLOALN6T7sf7BZHANAGnJK4gkS4GVxC9hw1U
	NomM7QLR8O8P2JGOXUuPZnA+46aPkw81wcNBCk8V5GDHV0e5baLjb6whCA/qpkdIGP+miTyAApIal
	y2YK1ytP9Y+/TlMhbDq4qPz+V/ttF4RwoH5DAe7FWqTcnIygKYFOzNjEbt69WSdMn20z8p5JmFKp4
	zuw6yDR0v/474bOuJi1NQtRqxCu2jZ2/2p3ZRasq9vMwcdC/8zjdOAngkc/qih1Oo86EQywCnkbBZ
	TGTvpPAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrpx-0000000ExML-34AX;
	Fri, 16 Jan 2026 21:58:33 +0000
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vgrpv-0000000ExLz-22cT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Jan 2026 21:58:32 +0000
Received: by mail-oi1-x22d.google.com with SMTP id 5614622812f47-45c838069e5so1521637b6e.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 16 Jan 2026 13:58:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768600710; x=1769205510; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ma34RY04McdLUFikJCMfVhGXi6rphMQdbOsKxFr4Zac=;
        b=fCpcYNZBEPHEkZos4Z6k5rmvywzDj9vZoyGNTKoR+O925zetYYb7YEqlkm63+T0orZ
         8HXpS7iAZFuaXT0wHLC7WQP73kwpOoxhw4CRuteM/1MDuhoDTsGPQ+F1ID4ZLmRCmoc0
         BEg1EKZiaNwR/m9BmLdKAK7ykKA06zRUuB8FFAdnKtODh0bBWOIYXqQhyHlKQGpzVZEK
         XAxF9WVCkoegzA2c5N7Lhsydr0a2/hC7auyEffpaRHpVs4PQTRsvldLWnLAsJ588+P7J
         l9VR3FJWW1b+U6rXB0e+tCPlxFEx4VpK218Ks93+2/X0+48NVU5BMTGNX9zubP+vgCHL
         qmqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600710; x=1769205510;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ma34RY04McdLUFikJCMfVhGXi6rphMQdbOsKxFr4Zac=;
        b=CZfg0HPH+m0w25MJdMAmz87w3W9vzwKaMlvyzhfz1v8PLNalO4FzVmC8BnG5B+Rb0Q
         2HSFnIuhYYSoxSuwA1MiJMDlUlV9iEbn2B4C+fYNQ6yPk5FDl8l0hiQk9DejUzphYY3I
         ZNQlKnFGtvXJmHvNqexPSKK6p8anYx1rRRdOgxZ90QUzWiix5CPpDMJ+RUn4rT01u7d/
         yjL+o1sfXlGw88ux7+UcGiD8idiB579zghITHbgC1ikAEf8JhDTb46mYYk5UjNWEGz34
         hpiygDTz6VXJ3rYtjCqL8pwAYV6K8t+bV61jt5SLXJl7c93QZ0ksSstdqoKX5JBEFZiZ
         keew==
X-Forwarded-Encrypted: i=1; AJvYcCVpbs6eZGO0KCB34AUhh5zIkX6OsAXB2/B+z4qfAQtdmNZ3+bGUbzgsB+EpqYkShyMgaqo9s4l3Ii965CrMKFbx@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4rumH884CwbT32BHkrailw/TZp4VkANpig4ZpoxTUfbzsAChN
	N1ZeD46DnrQ4NDnFxn6xK+fwtxhoSW69ZFVzleVF0fE3RWdwgr8jvtrY8wysbzi9yfWJ04NRHos
	zNlqgMmIdRohI719jxHnU4Oy5V0uC2EiguiZml/U=
X-Gm-Gg: AY/fxX5c4qoOKMjthq7fxEiJzYSIj2xeEeFK2P7iE+OGoWXhxfUV5XV/qK3dpXINVEs
	ZSmjIx1RnMjWwu2uB52Xs2zeeZLRpWbFtbifXcFhK7fkMEVCdme1ZitEn4WTkTccMkpsb+CGVjE
	Xn/E3cZftyYrBFZZUzbh7hQIqkFphGVlksa1LlZHnYqvXPyehT5hmpkNMsZ4NJg2e7D3X6w0YdQ
	/nWB+8/iWRa/CYoUVsFt0ioq3Bane9ykwhsbi8KNE/b1YaPspycW7cEyGowPum9tnANFv6JtzZn
	rYQfizqFp/FJha0p0IkhqtWze2Acbbu8S8ZipksYP64aoGqLwXp81vBs6/P1L8O4HaU=
X-Received: by 2002:a05:6808:1246:b0:450:d143:b79f with SMTP id
 5614622812f47-45c9c1640a1mr1606572b6e.66.1768600709648; Fri, 16 Jan 2026
 13:58:29 -0800 (PST)
MIME-Version: 1.0
References: <20251117160841.334224-1-andrealmeid@igalia.com> <aV1YnOetDHhKe4hz@willie-the-truck>
In-Reply-To: <aV1YnOetDHhKe4hz@willie-the-truck>
From: Ryan Houdek <sonicadvance1@gmail.com>
Date: Fri, 16 Jan 2026 13:58:18 -0800
X-Gm-Features: AZwV_QgIzlk9Vu0n1w2Ze_uuMZBXHHoLQpZ_jtujJKRM7yjMorufM13CTfXkDCU
Message-ID: <CABnRqDf5EQUoXu=pJ6mj4-JfwAzEfcAE2cYrNzJANFycx7cMUA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/1] arch: arm64: Implement unaligned atomic emulation
To: Will Deacon <will@kernel.org>
Cc: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	Mark Brown <broonie@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
	Billy Laws <blaws05@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260116_135831_546055_F062CC1F 
X-CRM114-Status: GOOD (  53.50  )
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

Hey there,
I'll try and explain some of the requirements here from the FEX side.


On Tue, Jan 6, 2026 at 10:46=E2=80=AFAM Will Deacon <will@kernel.org> wrote=
:
>
> Hi Andre,
>
> On Mon, Nov 17, 2025 at 01:08:40PM -0300, Andr=C3=A9 Almeida wrote:
> > This patch proposes adding kernel-side emulation for unaligned atomic
> > instructions on ARM64. This is intended for x86 emulators (like FEX)
> > that struggle to effectively handle such operations in userspace alone.
> > Such handling is required as x86 permits such unaligned accesses (albei=
t
> > sometimes with a performance penalty as in the case of split-locks[1])
> > but ARM64 does not and will raise a bus error.
>
> As discussed at LPC, I'm not thrilled with the idea of emulating these
> historical warts of x86 on arm64 and having to carry that code forward
> forever. The architecture provides a bunch of helpful instructions for
> emulating x86 code but for esoteric things like split-lock atomics, I
> think we need to draw a line. After all, you can still buy an x86
> machine if you want one and they tend to be cheaper and more reliable ;)

Indeed.

>
> > User applications that wish to enable support for this can use the new
> > pctrl() flag `PR_ARM64_UNALIGN_ATOMIC_EMULATE`. Some optimizations and
> > instructions were left for future revisions of this patchset.
> >
> > Emulators like FEX attempt to emulate this in userspace, but with
> > caveats in two areas:
> >
> >  * Performance
> >
> > It should first be noted that due to x86's TSO (total store order)
> > memory model, ARM64 atomic instructions must be used for all memory
> > accesses.
>
> Just a nit on terminology because it's getting in the way a bit here and
> I'm genuinely unsure as to what you're saying. The Arm architecture uses
> "atomic instructions" to refer to read-modify-write instructions such as
> CAS and SWP. You presumably don't need to use those for everything;
> rather I assume you're using LDAPR for plain loads and STLR for plain
> stores?

Semantics aside, yes, FEX uses all of the LRCPC1/2/3/4 instructions,
plus atomic memory instructions to emulate the x86 memory model.
Falling back all the way to ARMv8.0 instructions as required.

>
> > This results in unaligned loads/stores being much more common
> > than one would expect and the overhead of emulating them significantly
> > impacting performance.
>
> FEAT_LSE2 should solve this for LDAPR and STLR in the vast majority of
> cases, no?

This is a very sweeping statement. FEAT_LSE2 reduces around 12% of
unaligned memory accesses,
but because it only works at a 16B granularity, it doesn't cover the
vast majority of memory accesses.
It also means that we have "split-lock" style emulation at both
cache-line granularity AND 16B granularity;
unlike x86.
This means the overhead on systems even with LSE2 is unacceptable.

>
> > For this common case of unaligned loads/stores, code backpatching is us=
ed
> > in FEX to avoid repeated overhead from handling the same faulting acces=
s.
> > This replaces faulting unaligned atomic ARM64 instructions with regular
> > load/stores and memory barriers.
>
> I'm assuming this is only the case on systems without FEAT_LSE2?

We are required to backpatch even on LSE2 systems, as previously
stated, LSE2 isn't good enough.

>
> > This comes at a cost of introducing significant performance problems if=
 a
> > function like memcpy ends up being patched because it very infrequently
> > happens to be used with unaligned memory. This is severe enough to make
> > games like Mirror's Edge and Assassin's Creed: Origin unplayable withou=
t
> > application-specific configuration.
> >
> > Microbenchmarks[2] measure a 4x decrease in overhead with kernel-side
> > handling compared to userspace, and this figure is currently even large=
r
> > when FEX is ran under Wine. Such a dramatic decrease would make it
> > reasonable for FEX to default to the no-backpatching path and provide
> > consistent performance.
>
> I wonder if you can defer backpatching until you've got some idea about
> the likelihood of the access being misaligned? Or is that what you mean
> by "application-specific configuration"?

Not really. If an access ends up being misaligned once, it's basically
guaranteed to always
hit unaligned accesses. The heuristic would do nothing.

Application-specific configuration here means manually inspecting what a ga=
me
is doing, seeing if the code requires TSO semantics or not in the general c=
ase,
and then having a configuration inside of the emulator to disable TSO
for that code.
I have yet to work through the 145,370 games on Steam to quantify which cod=
e
requires TSO emulation versus not to make an encompassing set of
application profiles.

These application profiles are of course a hack because we are then no
longer emulating
the memory model fully. So we're throwing away correctness on ARM hardware =
to
allow users to have a viable gameplay experience.

>
> >  * Correctness:
> >
> > x86 atomic accesses can cross 16-byte (LSE2) granules, but there is no
> > ARM64 instruction that would allow for direct atomic emulation of this.
>
> I'm assuming these are relatively rare and apply only to locked
> instructions so don't, for example, occur in memcpy() as you mentioned
> above?

These are common, and do easily occur in hand-rolled memcpy/memset
operations easily.
FEAT_LRCPC instructions have the same unaligned fault semantics as
atomic instructions
with FEAT_LSE2. These are used for even trivial memory accesses like
`mov rax, [rdx]`.

>
> > As such, a lock must be taken for correctness. While this is easy to
> > emulate in userspace within a process, correct atomic cross-granule
> > operations on shared memory mapped into multiple processes would requir=
e
> > a lock shared between all FEX instances which cannot be implemented
> > safely in userspace as is (robust futexes do not work here as they are
> > under the control of the emulated x86 program). Note, this is a less
> > coarse restriction than split locks on x86, which are only concerned
> > with accesses crossing a 64 byte cacheline size.
>
> Even in the kernel, I'm having a hard time to convince myself that a
> global lock gives you correctness here because you're _not_ serialising
> with concurrent aligned accesses that could still be conflicting with
> the faulting accesses if mixed-size concurrency is in use.
>
> I've struggled to come up with an example that goes wrong, but if we
> imagine a 64-bit SWP that straddles a 16-byte boundary and is trying to
> set each 32-bit half of a zero-initialised location to 2:
>
>         SWP     (2, 2)
>
> This will trap, but another CPU could concurrently execute a pair of
> ordered, aligned 32-bit SWPs on each half, which will not trap:
>
>         SWP     (1, _)  // Set the upper 32-bit word to 1
>         DMB     ISH
>         SWP     (_, 1)  // Set the lower 32-bit word to 1
>
> My reading of the code is that:
>
>   1. The 64-bit SWP reads upper =3D 0, lower =3D 0
>   2. The 64-bit SWP writes upper to 2
>   3. The first 32-bit SWP executes, setting upper to 1 and returning 2
>   4. The second 32-bit SWP executes, setting lower to 1 and returning 0
>   5. The 64-bit SWP fails to write lower as it is no longer zero and so
>      returns (0, 1)
>
> In which case, the value in memory is (1, 1) but the old value of (0, 1)
> returned by the 64-bit SWP doesn't make sense in that case.
>
> What did I miss?

This is fine, as the kernel lock will ensure that all memory accesses that =
are
participating are coherently visible.

1) All unaligned accesses participate in the lock
  - If they cross an alignment granule (16B/64B)
2) All aligned accesses can not observe a tear
  - They will only see one half of the atomic straddling the granule
  - So even if it "tears" because another thread has written an
aligned half, the same would have happened on real x86 hardware.

>
> I also notice that your patch doesn't implement support for CAS and I
> worry that letting out partial updates from supposedly atomic stores
> could cause additional issues there. A CAS that reports failure could
> actually have mutated memory, which then feeds into the next iteration
> of the CAS loop in userspace.

I believe that's just because this patch is a simplification of our
full patch series
that we are shipping in downstream.

>
> Anyway, my lack of understanding aside, this doesn't look like an ABI we
> should be committing to on arm64.
>
> Cheers,
>
> Will

