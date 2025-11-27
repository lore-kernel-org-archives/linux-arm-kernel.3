Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA09D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 15:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+r6HGIbjJ8U66pCtMmlsrmidBPBR0x/BrqVx4Tdz3PI=; b=Xp8PHrrZiWy0ZxD/Jb1h5iLn7q
	VDSFF5myxerUjWLum8tDUHQK78axUqRUx16Mvfg17to2vsqmElF6T8eArxCREzqoTX6Ne53EVD+jD
	6xJBkGiKTM44nP6awR6KEodjbdwwE4TVKY9kJingb9QYjQB/lMSG1eIuHQaHho4VCcoUET11WKORV
	DcgqKyyoJD6XIxu8PdvLFRt/K8RGb14GkZ7tz+X0JkmO3nqwZrJQHZ+zOCFcB3odevVi9+q9s+xPF
	mWam6dKkkDkyrH/AlneSAT0Occvb3OV4SJ8jCEoiXvqNWJK4PXNMRelM5Z3nOYgGISIEiGpwL2VJw
	66cvRKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdXA-0000000GomN-18fm;
	Thu, 27 Nov 2025 15:03:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOdX7-0000000Golx-3SB5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 15:03:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3AC6D442C0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 15:03:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19DB7C2BC87
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 15:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764255825;
	bh=kCEm4GR/zwNR9rHeJSjydPKPfpVvfouHJVBR53dTjws=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=i52T/awuVZcFUUDHDpoSYshqmL2+RrjqYQ8heVH43ejg6qNeYk27U4sn6rKlOKRMm
	 ZEPPLyaO5ZcGv9feGe2Tsr0m17Pwox02Ch03acKBDRNPkIwJJClSvdsqFSXsPR1DHQ
	 lQyr38MOr8RuWIbtHI+v9lX3hfTjkb+TyOp6oNaV3apMjBdr7TSfHDBipgfiR4pV2G
	 wWVsdYqpzhsR6Kb8N9BKDulORuOZ7/KpETAFbsg9QRPnyrjGWFY9PdqgMUjFMbXy5f
	 KzQTxYcPINxqHYmA4CIxGvbk13gt7tbfBjX4KxmNigX6HmccrziLhsfsCftGomaQ2w
	 /hip6mQ1y4+HA==
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-37902f130e1so8205721fa.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 07:03:45 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVFcIsGpI6kvN5a7CkF9ippaJapcblUHWSrSVxF0antorrCgMD4PxEoaQmycw5nAUjDOKSQG2mdHQR5xQD7eIyr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy5YOLx4drZFS2DyHs7lpm11C4+wnN6C8x2h0oOpY1+h1nMGSWV
	1fHhHIV6KI9RJ2dDhKCgA/QBs9IlCQTegu56QYMI+2OTMlVdCYnQWXQmMt8D3OrVM6D1klrOJ1o
	sNyDgVCeeHhAKuuH/OTQWITeiXGTEmqU=
X-Google-Smtp-Source: AGHT+IE0CqLKalayP2qWN2oTCyIrY03jlnudZUHDl/nVVAo1gdGKw7f/yVfNzS4qoJo/JRyFnfd9dI/ZjLOS6526PFE=
X-Received: by 2002:a05:651c:889:b0:37c:297:8979 with SMTP id
 38308e7fff4ca-37cd928a140mr65163681fa.41.1764255823252; Thu, 27 Nov 2025
 07:03:43 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
 <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com> <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com>
In-Reply-To: <e996fdd5-7113-4327-a884-336dd5f77c4d@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Nov 2025 16:03:31 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
X-Gm-Features: AWmQ_bn-NrKf-eBxo6WjCr91AEF65Wk-h-Ip08zz4jH6J3ynDD4eNE08GDI4DSs
Message-ID: <CAMj1kXGyYMy2xhcdNicHkMfWBnEjyhc+xg8ciuR-6WXDxDpZxg@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize kstack
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jeremy Linton <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_070345_925991_8A65F10A 
X-CRM114-Status: GOOD (  32.80  )
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

On Thu, 27 Nov 2025 at 15:18, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/11/2025 12:28, Ard Biesheuvel wrote:
> > On Thu, 27 Nov 2025 at 13:12, Ryan Roberts <ryan.roberts@arm.com> wrote:
> >>
> >> On 27/11/2025 09:22, Ard Biesheuvel wrote:
> >>> From: Ard Biesheuvel <ardb@kernel.org>
> >>>
> >>> Ryan reports that get_random_u16() is dominant in the performance
> >>> profiling of syscall entry when kstack randomization is enabled [0].
> >>>
> >>> This is the reason many architectures rely on a counter instead, and
> >>> that, in turn, is the reason for the convoluted way the (pseudo-)entropy
> >>> is gathered and recorded in a per-CPU variable.
> >>>
> >>> Let's try to make the get_random_uXX() fast path faster, and switch to
> >>> get_random_u8() so that we'll hit the slow path 2x less often. Then,
> >>> wire it up in the syscall entry path, replacing the per-CPU variable,
> >>> making the logic at syscall exit redundant.
> >>
> >> I ran the same set of syscall benchmarks for this series as I've done for my
> >> series.
> >>
> >
> > Thanks!
> >
> >
> >> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
> >> performance cost of turning it on without any changes to the implementation,
> >> then the reduced performance cost of turning it on with my changes applied, and
> >> finally cost of turning it on with Ard's changes applied:
> >>
> >> arm64 (AWS Graviton3):
> >> +-----------------+--------------+-------------+---------------+-----------------+
> >> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng | fast-get-random |
> >> |                 |              | rndstack-on |               |                 |
> >> +=================+==============+=============+===============+=================+
> >> | syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |      (R) 11.93% |
> >> |                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |      (R) 11.00% |
> >> |                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |      (R) 11.39% |
> >> +-----------------+--------------+-------------+---------------+-----------------+
> >> | syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |      (R) 10.44% |
> >> |                 | p99 (ns)     | (R) 152.81% |         1.55% |       (R) 9.94% |
> >> |                 | p99.9 (ns)   | (R) 153.67% |         1.77% |       (R) 9.83% |
> >> +-----------------+--------------+-------------+---------------+-----------------+
> >> | syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |      (R) 10.39% |
> >> |                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |      (R) 10.72% |
> >> |                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |      (R) 11.03% |
> >> +-----------------+--------------+-------------+---------------+-----------------+
> >>
> >
> > What does the (R) mean?
> >
> >> So this fixes the tail problem. I guess get_random_u8() only takes the slow path
> >> every 768 calls, whereas get_random_u16() took it every 384 calls. I'm not sure
> >> that fully explains it though.
> >>
> >> But it's still a 10% cost on average.
> >>
> >> Personally I think 10% syscall cost is too much to pay for 6 bits of stack
> >> randomisation. 3% is better, but still higher than we would all prefer, I'm sure.
> >>
> >
> > Interesting!
> >
> > So the only thing that get_random_u8() does that could explain the
> > delta is calling into the scheduler on preempt_enable(), given that it
> > does very little beyond that.
> >
> > Would you mind repeating this experiment after changing the
> > put_cpu_var() to preempt_enable_no_resched(), to test this theory?
>
> This has no impact on performance.
>

Thanks. But this is really rather surprising: what else could be
taking up that time, given that on the fast path, there are only some
loads and stores to the buffer, and a cmpxchg64_local(). Could it be
the latter that is causing so much latency? I suppose the local
cmpxchg() semantics don't really exist on arm64, and this uses the
exact same LSE instruction that would be used for an ordinary
cmpxchg(), unlike on x86 where it appears to omit the LOCK prefix.

In any case, there is no debate that your code is faster on arm64. I
also think that using prandom for this purpose is perfectly fine, even
without reseeding: with a 2^113 period and only 6 observable bits per
32 bit sample, predicting the next value reliably is maybe not
impossible, but hardly worth the extensive effort, given that we're
not generating cryptographic keys here.

So the question is really whether we want to dedicate 16 bytes per
task for this. I wouldn't mind personally, but it is something our
internal QA engineers tend to obsess over.

