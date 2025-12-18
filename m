Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7777BD68BCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Dec 2025 02:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0LKYiqruH0b67KNdlb3RR9brWDq4vjht7LIo/rMQfyE=; b=vG/vu2t9lbqKdljN5Tyt9qP6ZU
	8KzZlonecZhCo1hRzrTDetijhzW1wqD6WZ/uqOIuLeXhvkHXC1462Pp1psShEBfMwLc5kxkLGsHLA
	DmSzMpbqM5mlc+14xEWfzCiup4bm2Fxj/i/pwggrpPYjForjT3rBtNowi7bI9X3moh3W7NxDJE0T/
	bswAZI8uCrwamxEOwDlEB9wdbgCaaR8UkiqSlgYUOAD1Z+9RpEYKbuHnsv5jqOEHA0hMeH1AgoV3r
	i0UtC4tE6nelmK7165Kt+QSygb8+8LGSiX3ygYLHoJ/LRvZuAmLcYFbQ26vUpjLYiwK8HnuZ1sW7r
	8/e/1GgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW48I-00000007jEr-3Tzp;
	Thu, 18 Dec 2025 02:52:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW48G-00000007jEP-2W23
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Dec 2025 02:52:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B747444E0
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 02:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 272E2C19424
	for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Dec 2025 02:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766026367;
	bh=KH2ko3GSTkVwZLREXfQKQzEQFLKa9SM2v6rJm6U/U4Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=qfIwVztmE6LyYdb6WKAlDszsad1USqQQVkP7e/ieNt8MZkxeIwYF7aF4mepJScQLG
	 YX5Xo0N2ybq4pC7BT/oCdXpEDJnOdjoq9YwizdATrtmGcP+R9eTqlxwxb2R40xkoew
	 y7eZLAOOOsZq29Hx27A1UmERdZbt43Fchn2fNSCA3Nk1iDpAjn+J5eH3ZLuBdPElLI
	 VmJuV3dOuzrPFXKXblt9s7QmvvuQFaO+AzUq3k6flKt7UE0kGuQGFJfQYtehvEPooE
	 lqAgyaxm7gGjekH0YOoqIOhi7HPQ5tdsg2cny872LwlI1p1sFijt9Ku0OYpxPYpsGu
	 y3q6v6IxdIAAw==
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b73161849e1so35664266b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 18:52:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2vzAVA07xtrpOQgGgd0DZQNwvm5830bLCGz42bqJe+0Y+DZjM/dyGldloN6ZEiR95vmDiP2yhKbpL6GIQtYbr@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7o+rq31UcpsXRQsQVYkY2tH/EFydihO6qSV9BMrgHk9iMYRmK
	KBFgdTWgWPrJQU0g1O/Mq87HJ6MSETPh5qK55fTfsl7uu0F5EU6INVmGkSaypXTzMG/ij5tWynz
	EI/cMzXHGF0KVT5C6SqW4CBL6z6BOQC8=
X-Google-Smtp-Source: AGHT+IHAIpwPJttGyjAA9c99KnqrgrDDFlIBGnzgPzsZDn6fAm/Eroe2y6rDuSLbnSWqo0J2BEeZ0OXVH3wDIlgM9Tw=
X-Received: by 2002:a17:906:6a21:b0:b80:117d:46e5 with SMTP id
 a640c23a62f3a-b80117d4cbamr345887166b.29.1766026365591; Wed, 17 Dec 2025
 18:52:45 -0800 (PST)
MIME-Version: 1.0
References: <20251217233608.2374187-1-puranjay@kernel.org>
In-Reply-To: <20251217233608.2374187-1-puranjay@kernel.org>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Thu, 18 Dec 2025 02:52:32 +0000
X-Gmail-Original-Message-ID: <CANk7y0hG8wQc2krKbMz1GUPsWdNWa353EzdAykv0nrE4ot4imA@mail.gmail.com>
X-Gm-Features: AQt7F2qXTXnTJ7AInyF4CwJz8eNbfGqTT4Mr5bsOmUs1vM6T81MyrFn35V5rDeU
Message-ID: <CANk7y0hG8wQc2krKbMz1GUPsWdNWa353EzdAykv0nrE4ot4imA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 0/2] bpf: Optimize recursion detection on arm64
To: bpf@vger.kernel.org
Cc: Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, kernel-team@meta.com, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_185248_685201_13AE6D75 
X-CRM114-Status: GOOD (  19.36  )
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

On Wed, Dec 17, 2025 at 11:36=E2=80=AFPM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
>
> V1: https://lore.kernel.org/all/20251217162830.2597286-1-puranjay@kernel.=
org/
> Changes in V1->V2:
> - Patch 2:
>         - Put preempt_enable()/disable() around RMW accesses to mitigate
>           race conditions. Because on CONFIG_PREEMPT_RCU and sleepable
>           bpf programs, preemption can cause no prog to execute.
>
> BPF programs detect recursion using a per-CPU 'active' flag in struct
> bpf_prog. The trampoline currently sets/clears this flag with atomic
> operations.
>
> On some arm64 platforms (e.g., Neoverse V2 with LSE), per-CPU atomic
> operations are relatively slow. Unlike x86_64 - where per-CPU updates
> can avoid cross-core atomicity, arm64 LSE atomics are always atomic
> across all cores, which is unnecessary overhead for strictly per-CPU
> state.
>
> This patch removes atomics from the recursion detection path on arm64.
>
> It was discovered in [1] that per-CPU atomics that don't return a value
> were extremely slow on some arm64 platforms, Catalin added a fix in
> commit 535fdfc5a228 ("arm64: Use load LSE atomics for the non-return
> per-CPU atomic operations") to solve this issue, but it seems to have
> caused a regression on the fentry benchmark.
>
> Using the fentry benchmark from the bpf selftests shows the following:
>
>   ./tools/testing/selftests/bpf/bench trig-fentry
>
>  +---------------------------------------------+------------------------+
>  |               Configuration                 | Total Operations (M/s) |
>  +---------------------------------------------+------------------------+
>  | bpf-next/master with Catalin=E2=80=99s fix reverted |         51.862  =
       |
>  |---------------------------------------------|------------------------|
>  | bpf-next/master                             |         43.067         |
>  | bpf-next/master with this change            |         53.856         |
>  +---------------------------------------------+------------------------+
>
> All benchmarks were run on a KVM based vm with Neoverse-V2 and 8 cpus.
>


Here is some more data about other attach types:

+-----------------+-----------+-----------+----------+
|     Metric      |  Before   |   After   | % Diff   |
+-----------------+-----------+-----------+----------+
| fentry          |   43.149  |   53.948  | +25.03%  |
| fentry.s        |   41.831  |   50.937  | +21.76%  |
| rawtp           |   50.834  |   58.731  | +15.53%  |
| fexit           |   31.118  |   34.360  | +10.42%  |
| tp              |   39.536  |   41.632  |  +5.30%  |
| syscall-count   |    8.053  |    8.305  |  +3.13%  |
| fmodret         |   33.940  |   34.769  |  +2.44%  |
| kprobe          |    9.970  |    9.998  |  +0.28%  |
| usermode-count  |  224.886  |  224.839  |  -0.02%  |
| kernel-count    |  154.229  |  153.043  |  -0.77%  |
+-----------------+-----------+-----------+----------+

