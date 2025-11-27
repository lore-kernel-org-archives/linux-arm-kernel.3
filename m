Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39380CFD2F6
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 12:28:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MvfwXe2Mf8FUlFLeBqgZhfHYtO29JeK8D9Uzrleo7/U=; b=izyhq4OgtL+hIYkdleJvViAqAi
	tgVKSFkEULJkyOyzvtsEs3SDkN/6Ei66R5RRLUjfogcQQvQH4/CTeLTAZaLLNyDpqJHSoClLOA/U+
	IsoY+kH5qFWg9jzUDNeS9iLJGymUkYJIRzEDr5J7e8uAwWw2sCAtpaMxcAEWpC3hcqCnomwUHcHnP
	NE7PwOCYWbmdn4kCAI4k5AxMTqpoa/RYrKmgnJi9H9ziYXm/yF2Aq+Et1uiDnfw01iIl6jGW+lfZ5
	XzvPBbnN7GwyyfOtiWIz/s1CLmarhm4slw7ku+Tg7PUdB1iVBkLa6/pfEYfvUTyT+LxP63Y1I5kfo
	n2o+JEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb6f-0000000GYZ9-36xF;
	Thu, 27 Nov 2025 12:28:17 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOb6c-0000000GYXQ-42Yn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 12:28:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 211B860141
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 12:28:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBD32C4CEFB
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 12:28:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764246493;
	bh=03x7nuNurMzXmkq+Cijj0uxU3ohs1Dneqg9mhCsCT4o=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jIxB/TE6yV3ikaADzp8LmDFnG16uWYNvQh3C3KK4pgi0au5CXtQJhxqANcM44Dq3K
	 XH+N1szD9PZd82nBj//r1UlSCOgfPDr25X1c2Mep8muYbPdcP6+uEL+ToasuAsbxJd
	 eWZ7jNyP2s6SfkTZaY/oOavJvvCoD3G35D936oHoDboFZqaHCsmLKB6X2NS96gszY3
	 ecNBfxdqH5P7/1GZP9A2bLT9B5NsaMP6fR0jUb7R+5tcqEL+0khJ942oDHM2xX0tba
	 gnLka99Qpg4Jwtx/DFlujM4IejZElJbN9J6N46F64Zx4b88xqnYvkAIsiJ6LBgifWj
	 QfgrgKvRRICDg==
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-37d056f5703so8204451fa.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Nov 2025 04:28:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUhIPcaI/HeNn0AzD6I6jKAXqealceWNBy+CfXNAZimSkFb1exehaEhM3YUe76Hi0cAQigjT/PKTcLeRXesOi1N@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9NeNAnc82Wa53VplsXt5xXCI72S9juIzWk8FQzQ4pHpPgsalg
	IRAXbJCYaX8S79x/dFLChcF2U3vVKLYTsieXyLeWA2iAVa6r4tk516czOTTJYre9V1UvLhQ08OV
	+ZXP/m2cDBsnyJnO+jva9vccWALlPVB4=
X-Google-Smtp-Source: AGHT+IFA0+PVUE0F6GGRF9ajKJXJy+eXvu7hElIL5Rsb4T68yBbHrCsHP9TXWsdWPmFgB2o9+/fhUKUChfOh4FuHvio=
X-Received: by 2002:a2e:a305:0:b0:37a:3963:ce8f with SMTP id
 38308e7fff4ca-37cd9277728mr58817541fa.33.1764246492134; Thu, 27 Nov 2025
 04:28:12 -0800 (PST)
MIME-Version: 1.0
References: <20251127092226.1439196-8-ardb+git@google.com> <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
In-Reply-To: <b1dae5a7-27bd-42de-bcce-9fd3c2b1c178@arm.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Thu, 27 Nov 2025 13:28:00 +0100
X-Gmail-Original-Message-ID: <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
X-Gm-Features: AWmQ_bkvQdGVqMLdFK4tLi9RnqueG0TpDGy18JbPzbYmag-P5jYjqDApAz03hgo
Message-ID: <CAMj1kXE-Qm4DQNAcg8Tg7YM4EMdLBu_UJm7M8Cpk3t5g7XqP5w@mail.gmail.com>
Subject: Re: [RFC/RFT PATCH 0/6] Improve get_random_u8() for use in randomize kstack
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: Ard Biesheuvel <ardb+git@google.com>, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Kees Cook <kees@kernel.org>, Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Jeremy Linton <jeremy.linton@arm.com>, Catalin Marinas <Catalin.Marinas@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, "Jason A. Donenfeld" <Jason@zx2c4.com>
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

On Thu, 27 Nov 2025 at 13:12, Ryan Roberts <ryan.roberts@arm.com> wrote:
>
> On 27/11/2025 09:22, Ard Biesheuvel wrote:
> > From: Ard Biesheuvel <ardb@kernel.org>
> >
> > Ryan reports that get_random_u16() is dominant in the performance
> > profiling of syscall entry when kstack randomization is enabled [0].
> >
> > This is the reason many architectures rely on a counter instead, and
> > that, in turn, is the reason for the convoluted way the (pseudo-)entropy
> > is gathered and recorded in a per-CPU variable.
> >
> > Let's try to make the get_random_uXX() fast path faster, and switch to
> > get_random_u8() so that we'll hit the slow path 2x less often. Then,
> > wire it up in the syscall entry path, replacing the per-CPU variable,
> > making the logic at syscall exit redundant.
>
> I ran the same set of syscall benchmarks for this series as I've done for my
> series.
>

Thanks!


> The baseline is v6.18-rc5 with stack randomization turned *off*. So I'm showing
> performance cost of turning it on without any changes to the implementation,
> then the reduced performance cost of turning it on with my changes applied, and
> finally cost of turning it on with Ard's changes applied:
>
> arm64 (AWS Graviton3):
> +-----------------+--------------+-------------+---------------+-----------------+
> | Benchmark       | Result Class |   v6.18-rc5 | per-task-prng | fast-get-random |
> |                 |              | rndstack-on |               |                 |
> +=================+==============+=============+===============+=================+
> | syscall/getpid  | mean (ns)    |  (R) 15.62% |     (R) 3.43% |      (R) 11.93% |
> |                 | p99 (ns)     | (R) 155.01% |     (R) 3.20% |      (R) 11.00% |
> |                 | p99.9 (ns)   | (R) 156.71% |     (R) 2.93% |      (R) 11.39% |
> +-----------------+--------------+-------------+---------------+-----------------+
> | syscall/getppid | mean (ns)    |  (R) 14.09% |     (R) 2.12% |      (R) 10.44% |
> |                 | p99 (ns)     | (R) 152.81% |         1.55% |       (R) 9.94% |
> |                 | p99.9 (ns)   | (R) 153.67% |         1.77% |       (R) 9.83% |
> +-----------------+--------------+-------------+---------------+-----------------+
> | syscall/invalid | mean (ns)    |  (R) 13.89% |     (R) 3.32% |      (R) 10.39% |
> |                 | p99 (ns)     | (R) 165.82% |     (R) 3.51% |      (R) 10.72% |
> |                 | p99.9 (ns)   | (R) 168.83% |     (R) 3.77% |      (R) 11.03% |
> +-----------------+--------------+-------------+---------------+-----------------+
>

What does the (R) mean?

> So this fixes the tail problem. I guess get_random_u8() only takes the slow path
> every 768 calls, whereas get_random_u16() took it every 384 calls. I'm not sure
> that fully explains it though.
>
> But it's still a 10% cost on average.
>
> Personally I think 10% syscall cost is too much to pay for 6 bits of stack
> randomisation. 3% is better, but still higher than we would all prefer, I'm sure.
>

Interesting!

So the only thing that get_random_u8() does that could explain the
delta is calling into the scheduler on preempt_enable(), given that it
does very little beyond that.

Would you mind repeating this experiment after changing the
put_cpu_var() to preempt_enable_no_resched(), to test this theory?

