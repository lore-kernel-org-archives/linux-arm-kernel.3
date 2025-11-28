Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EAA6CFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9SvAWpESg1WIIxFsWOfpdh/W/L/oT9dF07KyYosAPMY=; b=IOu74fKEdtgBlZSC0T3CxT2WV+
	C9pPimi4AhbmTjAZ6GcL3QhJdV8H1QfqIg2aZXMGyflJopq/NV7BR4C8Wpiv+z1FKmpxuCAWX+td/
	odsUdQbGkSjgd8MNTNB838tjQrv0FHfYcGIujWwzhjUbObl7bNYlPcCR41dd1VruIzAVLvAJ6Si6W
	qei1y7O6BAjoMAUixBIHKNXePKscQhmntRQ1KtvLW3TfJFuwukHo3di2ajEOlc7wceksKd67C0or1
	OCakRrA26cVS3pBUmPmv4gOwpIItPGnUI5cbRIMXkijBwNgi4mKVPPz1y/qM4UnH0oe3p0FTuvGl3
	J+dTljIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvqI-00000000IiH-2jm4;
	Fri, 28 Nov 2025 10:36:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvqF-00000000Iha-47Gd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:36:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1327E43F7F
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 10:36:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3FECC19422
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 10:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764326202;
	bh=EhHdmmI1N3N0X1uQJ02Rc3Q7qCv0EEOweTqO0/Q78iA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ADtA5/Erv1MdOF1rk4stEjxYWt8l/KT+13uA3PrlFDHgmY1ZQ5fTnKEceqHKbw5eT
	 KnGzTfjOwc7TBFyM7iXKizjF50CuJMd4lMfvQAI0QA4WYZV4lwuNOK/SOAaMv0BocZ
	 lvjjbr6tfgC0q2rMJ9uo7gVTj22WR9ieHfLzVQj7/70LslQXeo6/u45A/rKZiDbk5K
	 qwm8gq48WnmKCU4dgqVpRIB1f+k64jH3Q7CF8sVXn25/9Ih+aG+oAs4DUiKxssYsa6
	 Keoptb+GtwNbxfO0I2uBkREwkHn2kt3W46roH2iQY61Mif9Qn/ekvIXVBBzgUm2FCp
	 RmyB+pnnazPaA==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37b999d0c81so13961481fa.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 02:36:42 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYzC4NryH5ug9F6spjQ31d7QGJlDNElhXjYQVfNjNbcRq/KwyPdFprzuH5hjy7CM33ohI0tPKyDIvHbc+DVla4@lists.infradead.org
X-Gm-Message-State: AOJu0YxQiYXnSvg7KQl42EWcgc3OHqIb8IgFknEfzU8Y6xkJYpjSA0ze
	itz7RWv4r6y+829CvnlIKkq/srq2Qy6F6Q4+neN9Ia1dMMfP78KFyPceS7ufWvOH2L5Si5wCOYh
	HGTema8KlcRv69ivkYuknebuTZNFM/1k=
X-Google-Smtp-Source: AGHT+IEeFp+DvQfNR57BKZvOkkucP6Mp+pyisPC08iIxqkOqx44J9V+etHIbwFA6FaNj5J809+5cnmOCxmJixYVG8DY=
X-Received: by 2002:a05:651c:41c9:b0:37c:c84a:98f5 with SMTP id
 38308e7fff4ca-37d07394236mr44596401fa.0.1764326201189; Fri, 28 Nov 2025
 02:36:41 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com> <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
 <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com> <CAMj1kXE8msLjM83iKLQjRSQ+4cqj4iFS_CLxwfjj6adZ_AUBVg@mail.gmail.com>
 <177c5c01-82d7-461c-93c3-2c9f7bcb3403@arm.com>
In-Reply-To: <177c5c01-82d7-461c-93c3-2c9f7bcb3403@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Nov 2025 11:36:29 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGNMfx+uT8J4ZYppiV62-21heG1ZSoAs9Zd3yxnysMwpg@mail.gmail.com>
X-Gm-Features: AWmQ_bkbKxudMr9bR_NLbhtOY1NgXOwN1TRiRI12C4_mW-o6SD-FlSUGr1NrE70
Message-ID: <CAMj1kXGNMfx+uT8J4ZYppiV62-21heG1ZSoAs9Zd3yxnysMwpg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize kstack
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_023644_061958_147BCA94 
X-CRM114-Status: GOOD (  41.28  )
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

On Fri, 28 Nov 2025 at 11:32, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 28/11/2025 10:07, Ard Biesheuvel wrote:
> > On Thu, 27 Nov 2025 at 16:57, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 27/11/2025 15:03, Ard Biesheuvel wrote:
> >>> On Thu, 27 Nov 2025 at 15:18, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>
> >>>> On 27/11/2025 12:28, Ard Biesheuvel wrote:
> >>>>> On Thu, 27 Nov 2025 at 13:12, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>>>
> >>>>>> On 27/11/2025 09:22, Ard Biesheuvel wrote:
> >>>>>>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>>>>>
> >>>>>>> Ryan reports that get_random_u16() is dominant in the performance
> >>>>>>> profiling of syscall entry when kstack randomization is enabled [0].
> >>>>>>>
> >>>>>>> This is the reason many architectures rely on a counter instead, and
> >>>>>>> that, in turn, is the reason for the convoluted way the (pseudo-)entropy
> >>>>>>> is gathered and recorded in a per-CPU variable.
> >>>>>>>
> >>>>>>> Let's try to make the get_random_uXX() fast path faster, and switch to
> >>>>>>> get_random_u8() so that we'll hit the slow path 2x less often. Then,
> >>>>>>> wire it up in the syscall entry path, replacing the per-CPU variable,
> >>>>>>> making the logic at syscall exit redundant.
> >>>>>>
> >>>>>> I ran the same set of syscall benchmarks for this series as I've done for my
> >>>>>> series.
> >>>>>>
> >>>>>
> >>>>> Thanks!
> >>>>>
> >>>>>
> >>>>>> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
> >>>>>> performance cost of turning it on without any changes to the implementation,
> >>>>>> then the reduced performance cost of turning it on with my changes applied, and
> >>>>>> finally cost of turning it on with Ard's changes applied:
> >>>>>>
> >>>>>> arm64 (AWS Graviton3):
> >>>>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>>>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng | fast-get-random |
> >>>>>> |                 |              | rndstack-on |               |                 |
> >>>>>> +=================+==============+=============+===============+=================+
> >>>>>> | syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |      (R) 11.93% |
> >>>>>> |                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |      (R) 11.00% |
> >>>>>> |                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |      (R) 11.39% |
> >>>>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>>>> | syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |      (R) 10.44% |
> >>>>>> |                 | p99 (ns)     | (R) 152.81% |         1.55% |       (R) 9.94% |
> >>>>>> |                 | p99.9 (ns)   | (R) 153.67% |         1.77% |       (R) 9.83% |
> >>>>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>>>> | syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |      (R) 10.39% |
> >>>>>> |                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |      (R) 10.72% |
> >>>>>> |                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |      (R) 11.03% |
> >>>>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>>>>
> >>>>>
> >>>>> What does the (R) mean?
> >>>>>
> >>>>>> So this fixes the tail problem. I guess get_random_u8() only takes the slow path
> >>>>>> every 768 calls, whereas get_random_u16() took it every 384 calls. I'm not sure
> >>>>>> that fully explains it though.
> >>>>>>
> >>>>>> But it's still a 10% cost on average.
> >>>>>>
> >>>>>> Personally I think 10% syscall cost is too much to pay for 6 bits of stack
> >>>>>> randomisation. 3% is better, but still higher than we would all prefer, I'm sure.
> >>>>>>
> >>>>>
> >>>>> Interesting!
> >>>>>
> >>>>> So the only thing that get_random_u8() does that could explain the
> >>>>> delta is calling into the scheduler on preempt_enable(), given that it
> >>>>> does very little beyond that.
> >>>>>
> >>>>> Would you mind repeating this experiment after changing the
> >>>>> put_cpu_var() to preempt_enable_no_resched(), to test this theory?
> >>>>
> >>>> This has no impact on performance.
> >>>>
> >>>
> >>> Thanks. But this is really rather surprising: what else could be
> >>> taking up that time, given that on the fast path, there are only some
> >>> loads and stores to the buffer, and a cmpxchg64_local(). Could it be
> >>> the latter that is causing so much latency? I suppose the local
> >>> cmpxchg() semantics don't really exist on arm64, and this uses the
> >>> exact same LSE instruction that would be used for an ordinary
> >>> cmpxchg(), unlike on x86 where it appears to omit the LOCK prefix.
> >>>
> >>> In any case, there is no debate that your code is faster on arm64.
> >>
> >> The results I have for x86 show it's faster than the rdtsc too, although that's
> >> also somewhat surprising. I'll run your series on x86 to get the equivalent data.
> >>
> >
> > OK, brown paper bag time ...
> >
> > I swapped the order of the 'old' and 'new' cmpxchg64_local()
> > arguments, resulting in some very odd behavior. I think this explains
> > why the tail latency was eliminated entirely, which is bizarre.
> >
> > The speedup is also more modest now (~2x), which may still be
> > worthwhile, but likely insufficient for the kstack randomization case.
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=lockless-random-v2
>
> Ahh, so we were never taking the slow path. That would definitely explain it.
>
> I had a go at running this on x86 but couldn't even get the kernel to boot on my
> AWS Sapphire Rapids instance. Unfortunately I don't have access to the serial
> console so can't tell why it failed. But I used the exact same procedure and
> baseline for other runs so the only difference is your change.
>
> I wonder if this issue somehow breaks the boot on that platform?
>

It does. That is how I noticed myself :-)

init_cea_offsets() fails to make progress because
get_random_u32_below() returns the same value every time.
Interestingly, it didn't trigger with KASLR disabled, which made the
debugging sessions all the more fun ...

> Anyway, I'll chuck this update at the benchmarks, but probably won't be until
> next week...
>

Sure. thanks.

