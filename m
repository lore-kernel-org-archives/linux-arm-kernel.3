Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F05FCFD376
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 10:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAWUGal8r0TJ/pike5gdxba0ufPv3h+nhQ/fIs6IyWQ=; b=DW4yqGeSEs61z4mBuO6miPOMG9
	+kac8YiKg9NpwmPh9KNPhbTxeQMtsdlY3fwwT1nytNR4GahlgwIA7K3gO0/bzz+DNiw1WzBo9MHTP
	4Gt1Dwb2IuaugyZUdO3Mfc1glQYyoZkWzCZ/EPg7O+8CE2Fm68lERaggNe3VI1M5p1oUveEOSdODY
	NyZgG1IjiyVsm7KYCVN/jhYIZFbAnXUQw4elFNpz30FoEunFUlhQVoF3sVnJQO+MODW4KVCsMVLi0
	ldC2LGiR3xo083b7drpklonkAcrGY/loJCBhv9rCi1jAmzxyLFEDPIF/u43CghxynWM1k5s64UOhu
	dcaCQV1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvNl-00000000GBx-1vKU;
	Fri, 28 Nov 2025 10:07:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOvNi-00000000GBT-2Qa4
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 10:07:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE42843B52
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 10:07:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF5FEC16AAE
	for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 10:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764324433;
	bh=DcI3SqYd60/jLU6X61RjF6uGbetJVnz0CM4nTUTStm4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=RUE2ZSj9bBkQcMwhtOk56eQ8oAEEvDKU7+ybwKKR9GQ5wm+Tl1aVZrcInBlC+m/NX
	 WCkdDSRLolth+UEmNEnhnSrjTsTulRLDTSyputPd4H3uMK4tS3uCUN9hDq0LQ3izqG
	 tfjT5mwQzGnkPCE993/7olTApfXHIlTH/4qNkSpBAFEnaHmXOlVs0Tgo/s2P1fAdun
	 RGRuezKZv0CLTdDJF1KZP+yWO2LMC+5j+x2zEW//QWWHDhgr2HUEgLoxrnS52+l3rd
	 xsF6BOcOQiNBqzZ3UApzT1798kvXO3tunvjeBYnRS9N0vV8ic3pbfpgF45MHNSjiOi
	 iNyT8rZBqHwiA==
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5959187c5a9so1519690e87.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 28 Nov 2025 02:07:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUSXiSnMu8CgaiuxDWr3LIiCviE08VXmC6ly5gCCSOn+KWvLdozub9GAw9V/YGhYj0x/MxFDtAFCtBidwFeGcE9@lists.infradead.org
X-Gm-Message-State: AOJu0YwQhAHkCA7j3iU6ITYyAVL8IswLdhOFUD2uWgsIrDv0nCGpxm4Y
	qANOVEVjJ9/a7Ugarsckn/azgap1OghuSjRcqGCGGBT2TeY57POap0CkJ5THbhIHoMULt5AWRfW
	+R+af5gpNhv6JSqV2w8z5UHgqD2F/28U=
X-Google-Smtp-Source: AGHT+IGZBMJ2mGE6v7bB0x5twczN9e3Um2hxW0AgYCKawZoApNZZh6zfoAi5b33de18LPEabr1Ll62ey1P5tZLGjnQ4=
X-Received: by 2002:a05:6512:2398:b0:594:2654:5e65 with SMTP id
 2adb3069b0e04-596a3edac23mr9083046e87.26.1764324432079; Fri, 28 Nov 2025
 02:07:12 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
 <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com> <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
 <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com>
In-Reply-To: <f95593ac-d4cf-4e06-9a94-cc5133897c59@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Fri, 28 Nov 2025 11:07:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE8msLjM83iKLQjRSQ+4cqj4iFS_CLxwfjj6adZ_AUBVg@mail.gmail.com>
X-Gm-Features: AWmQ_bnzkSjqH55aYCETk5GnAT95A5Up3auoNkGs2YlbYjrebvcPZ3Gi6rtSDTg
Message-ID: <CAMj1kXE8msLjM83iKLQjRSQ+4cqj4iFS_CLxwfjj6adZ_AUBVg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize kstack
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-hardening@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Kees Cook <kees@kernel.org>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, Jeremy Linton <jeremy.linton@arm.com>, 
	Catalin Marinas <Catalin.Marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_020714_664319_46F18E76 
X-CRM114-Status: GOOD (  32.64  )
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

On Thu, 27 Nov 2025 at 16:57, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/11/2025 15:03, Ard Biesheuvel wrote:
> > On Thu, 27 Nov 2025 at 15:18, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 27/11/2025 12:28, Ard Biesheuvel wrote:
> >>> On Thu, 27 Nov 2025 at 13:12, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>>>
> >>>> On 27/11/2025 09:22, Ard Biesheuvel wrote:
> >>>>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>>>
> >>>>> Ryan reports that get_random_u16() is dominant in the performance
> >>>>> profiling of syscall entry when kstack randomization is enabled [0].
> >>>>>
> >>>>> This is the reason many architectures rely on a counter instead, and
> >>>>> that, in turn, is the reason for the convoluted way the (pseudo-)entropy
> >>>>> is gathered and recorded in a per-CPU variable.
> >>>>>
> >>>>> Let's try to make the get_random_uXX() fast path faster, and switch to
> >>>>> get_random_u8() so that we'll hit the slow path 2x less often. Then,
> >>>>> wire it up in the syscall entry path, replacing the per-CPU variable,
> >>>>> making the logic at syscall exit redundant.
> >>>>
> >>>> I ran the same set of syscall benchmarks for this series as I've done for my
> >>>> series.
> >>>>
> >>>
> >>> Thanks!
> >>>
> >>>
> >>>> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
> >>>> performance cost of turning it on without any changes to the implementation,
> >>>> then the reduced performance cost of turning it on with my changes applied, and
> >>>> finally cost of turning it on with Ard's changes applied:
> >>>>
> >>>> arm64 (AWS Graviton3):
> >>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng | fast-get-random |
> >>>> |                 |              | rndstack-on |               |                 |
> >>>> +=================+==============+=============+===============+=================+
> >>>> | syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |      (R) 11.93% |
> >>>> |                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |      (R) 11.00% |
> >>>> |                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |      (R) 11.39% |
> >>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>> | syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |      (R) 10.44% |
> >>>> |                 | p99 (ns)     | (R) 152.81% |         1.55% |       (R) 9.94% |
> >>>> |                 | p99.9 (ns)   | (R) 153.67% |         1.77% |       (R) 9.83% |
> >>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>> | syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |      (R) 10.39% |
> >>>> |                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |      (R) 10.72% |
> >>>> |                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |      (R) 11.03% |
> >>>> +-----------------+--------------+-------------+---------------+-----------------+
> >>>>
> >>>
> >>> What does the (R) mean?
> >>>
> >>>> So this fixes the tail problem. I guess get_random_u8() only takes the slow path
> >>>> every 768 calls, whereas get_random_u16() took it every 384 calls. I'm not sure
> >>>> that fully explains it though.
> >>>>
> >>>> But it's still a 10% cost on average.
> >>>>
> >>>> Personally I think 10% syscall cost is too much to pay for 6 bits of stack
> >>>> randomisation. 3% is better, but still higher than we would all prefer, I'm sure.
> >>>>
> >>>
> >>> Interesting!
> >>>
> >>> So the only thing that get_random_u8() does that could explain the
> >>> delta is calling into the scheduler on preempt_enable(), given that it
> >>> does very little beyond that.
> >>>
> >>> Would you mind repeating this experiment after changing the
> >>> put_cpu_var() to preempt_enable_no_resched(), to test this theory?
> >>
> >> This has no impact on performance.
> >>
> >
> > Thanks. But this is really rather surprising: what else could be
> > taking up that time, given that on the fast path, there are only some
> > loads and stores to the buffer, and a cmpxchg64_local(). Could it be
> > the latter that is causing so much latency? I suppose the local
> > cmpxchg() semantics don't really exist on arm64, and this uses the
> > exact same LSE instruction that would be used for an ordinary
> > cmpxchg(), unlike on x86 where it appears to omit the LOCK prefix.
> >
> > In any case, there is no debate that your code is faster on arm64.
>
> The results I have for x86 show it's faster than the rdtsc too, although that's
> also somewhat surprising. I'll run your series on x86 to get the equivalent data.
>

OK, brown paper bag time ...

I swapped the order of the 'old' and 'new' cmpxchg64_local()
arguments, resulting in some very odd behavior. I think this explains
why the tail latency was eliminated entirely, which is bizarre.

The speedup is also more modest now (~2x), which may still be
worthwhile, but likely insufficient for the kstack randomization case.

https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/log/?h=lockless-random-v2

