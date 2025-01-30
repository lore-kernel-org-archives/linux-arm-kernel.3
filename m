Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF07C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 18:05:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJkhJadLxY5yrIhxB85qCP1Lu/kxChzLsGRZICgpOvE=; b=oR1YStvoO66+8OODT61HccwKPb
	hxXEcaZS1rNyUHeMzLY9d6YUbxu1s5V5w7GCdes5KGolKLVrTBzAuwCf46hfl7YE8gBPB2T8xmIHo
	GcjaQHJCWu7qXOBaFHesatGVoj43Bp6Ml4wZ0R4VTdBRf4uPJeTGFfPjg9IIRf6ArUxOleIvvB/sP
	Rif7HOBxAj9rPyF7tqMbltyEMG2WamgyuP8yJcpc18ES3FT6Ou5F+bwdUD/tTYGeJmUU+QpiJ875f
	TZbLUpxeXu97BVYVO7SAVQOYobpHxiNGuu8T6h2zsLVwrH1uaiEoJktdLPEmiUdBgwj3SQTUDgmcV
	5anOWeCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYuW-00000009MPz-17FK;
	Thu, 30 Jan 2025 18:05:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdYpA-00000009Ld7-0fuk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 17:59:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A11B45C614A
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 17:58:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ACA7C4CEE2
	for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 17:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738259971;
	bh=BihflpWwQ9KIFupBmfTlZk9iajbzPlVGJYalKJ9g6Pk=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=sNKhAu7mexAuXWA/I+U75npBZk7p68nMcM/dvkLcJKrdpJOZiNjUCfF0KSWSPPt4n
	 T7DSVqB1Sc+gxZseBbO+Swuya7Qs1eTfwaI4VxC7M1QS7cGnosaRMPJ1POkthVQjh9
	 vleMtBEBr9w93jWTrlG0ysMRJK6TLSttd6yesomRYfpT3AJ6WpGA51bBD7Umzvr+/a
	 RGSZ4mgLijx2tD7Soe7HcujGZkg2eEl7nSLeoy5RILpRCta73FCK2CLSMQ6eLZmiEC
	 tTDGg3EswdG3epeLhA15AHAnsd170R9yMDObfK1vH5e54mI1RWCEYDEFuvaLm1Z5sd
	 ULxhbLfNrzlqQ==
Received: by mail-il1-f177.google.com with SMTP id e9e14a558f8ab-3a81324bbdcso7514205ab.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jan 2025 09:59:31 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVuVGPTK6E80Qthl2aK3rCJZPC/pTTneix4yMy80BWqnlhlHhx+ONBsRV/SB6XBBjfaZTmPmvNznyhB0NnWRBuM@lists.infradead.org
X-Gm-Message-State: AOJu0Yze6H4HVhLuKadaZ8RDGfzpXle/oZupiMrMUKclVZiz8/4UyaUp
	KtMpf/4uWiG5wOB3hjnxJP4LqdFob8liUMbXKeGCdB9vxLrqBiRR2bGOPGBiOrsAHLo0wQ3Ynpz
	EQaqq4qLirquicbHUAysQz4YmscY=
X-Google-Smtp-Source: AGHT+IHqVa57JGKmzgGGwdcIHANv+XQ3iMnue5+klM/H8VOXEra8cGpRyLQvVhgP6gOisOaz6JFvFMv76Hp7i/h93bc=
X-Received: by 2002:a05:6e02:1aa7:b0:3cf:cc8d:489b with SMTP id
 e9e14a558f8ab-3cffe4367c5mr65685805ab.14.1738259970707; Thu, 30 Jan 2025
 09:59:30 -0800 (PST)
MIME-Version: 1.0
References: <20250127213310.2496133-1-wnliu@google.com>
In-Reply-To: <20250127213310.2496133-1-wnliu@google.com>
From: Song Liu <song@kernel.org>
Date: Thu, 30 Jan 2025 09:59:19 -0800
X-Gmail-Original-Message-ID: <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
X-Gm-Features: AWEUYZlJCyUyotQGicS3KuHjVI929vPaHTc5pUA_VMHHRA5VJ3vgRlFuLho9PXk
Message-ID: <CAPhsuW4UrhaYKj6pbAC9Cq1ZW+igFrA284nnCFsVdKdOfRpi6w@mail.gmail.com>
Subject: Re: [PATCH 0/8] unwind, arm64: add sframe unwinder for kernel
To: Weinan Liu <wnliu@google.com>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Indu Bhagat <indu.bhagat@oracle.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mark Rutland <mark.rutland@arm.com>, roman.gushchin@linux.dev, 
	Will Deacon <will@kernel.org>, Ian Rogers <irogers@google.com>, linux-toolchains@vger.kernel.org, 
	linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, 
	joe.lawrence@redhat.com, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_095932_286662_E1B44246 
X-CRM114-Status: GOOD (  19.23  )
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

I missed this set before sending my RFC set. If this set works well, we
won't need the other set. I will give this one a try.

Thanks,
Song

On Mon, Jan 27, 2025 at 1:33=E2=80=AFPM Weinan Liu <wnliu@google.com> wrote=
:
>
> This patchset implements a generic kernel sframe-based [1] unwinder.
> The main goal is to support reliable stacktraces on arm64.
>
> On x86 orc unwinder provides reliable stacktraces. But arm64 misses the
> required support from objtool: it cannot generate orc unwind tables for
> arm64.
>
> Currently, there's already a sframe unwinder proposed for userspace: [2].
> Since the sframe unwind table algorithm is similar, these two proposal
> could integrate common functionality in the future.
>
> There are some incomplete features or challenges:
>   - The unwinder doesn't yet work with kernel modules. The `start_addr` o=
f
>     FRE from kernel modules doesn't appear correct, preventing us from
>     unwinding functions from kernel modules.
>   - Currently, only GCC supports sframe.
>
> Ref:
> [1]: https://sourceware.org/binutils/docs/sframe-spec.html
> [2]: https://lore.kernel.org/lkml/cover.1730150953.git.jpoimboe@kernel.or=
g/
>
> Madhavan T. Venkataraman (1):
>   arm64: Define TIF_PATCH_PENDING for livepatch
>
> Weinan Liu (7):
>   unwind: build kernel with sframe info
>   arm64: entry: add unwind info for various kernel entries
>   unwind: add sframe v2 header
>   unwind: Implement generic sframe unwinder library
>   unwind: arm64: Add sframe unwinder on arm64
>   unwind: arm64: add reliable stacktrace support for arm64
>   arm64: Enable livepatch for ARM64
>
>  Makefile                                   |   6 +
>  arch/Kconfig                               |   8 +
>  arch/arm64/Kconfig                         |   3 +
>  arch/arm64/Kconfig.debug                   |  10 +
>  arch/arm64/include/asm/stacktrace/common.h |   6 +
>  arch/arm64/include/asm/thread_info.h       |   4 +-
>  arch/arm64/kernel/entry-common.c           |   4 +
>  arch/arm64/kernel/entry.S                  |  10 +
>  arch/arm64/kernel/setup.c                  |   2 +
>  arch/arm64/kernel/stacktrace.c             | 102 ++++++++++
>  include/asm-generic/vmlinux.lds.h          |  12 ++
>  include/linux/sframe_lookup.h              |  43 +++++
>  kernel/Makefile                            |   1 +
>  kernel/sframe.h                            | 215 +++++++++++++++++++++
>  kernel/sframe_lookup.c                     | 196 +++++++++++++++++++
>  15 files changed, 621 insertions(+), 1 deletion(-)
>  create mode 100644 include/linux/sframe_lookup.h
>  create mode 100644 kernel/sframe.h
>  create mode 100644 kernel/sframe_lookup.c
>
> --
> 2.48.1.262.g85cc9f2d1e-goog
>
>

