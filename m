Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56019FDEE46
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yNABxSkGd5whRBIGJg76vpuTO5aT4GF2oiVqjD7ichE=; b=Nkgwin866SgtnWEABKaIHJKAFv
	7txoNZy/dlt6eswcxgZkDD1JqjAMt6bggIjPuJ5fTNqZGpzZb50v8dguYZLbYzGOKxAh4SQDmUy4d
	oxXqXXH7izQnbKoquQw2LDU0Y44LaUPQfFg9ng3fBYe3GhPZqnTHoTbfiWY5h9OgVkEFxdQydUbFN
	AhXEdS+6vT8YBy7tdy8pf5haIfLoC0h/ImoJJRn3Cz5FEsLy4evnZS0sPK6IbOAEolATp0/Fda5DB
	6vTG0pETSRGjgeGkttdga9FPpwD88iwxpFhfNJ42kdPt3CzBmRjpZifSrhJyhekJsHb7cOjtotcPp
	TpxJfm3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFzu1-0000000CFKw-0brm;
	Thu, 23 Apr 2026 19:39:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFztz-0000000CFKT-2z5B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 19:39:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B938A60139;
	Thu, 23 Apr 2026 19:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D102CC2BCAF;
	Thu, 23 Apr 2026 19:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776973194;
	bh=yMr5E62x+WcPU2LZQ8qhJm588joa6CJhMuH2XFE5D5s=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=HasZMFhsIKBGKP4SK9SpvBrBwHScX1EeFffbgWHv8HO1XPHoTk6XHyG55IemEWhBO
	 g8C/A9madVtFpIBWFfJhMkUFjqzpyL56jrPaNTGhDbMx/ke5NXemou9Rb1nDsGM+Ov
	 YfdYQywUoiN925ffREUQKKEktuWhH5NcfpUzaYDinMta7s9P5KFGJawC106TiHp7ZA
	 wESWc50no9cXCSPguczlJb+yNOSIAnUNUckxwdu+tqUUCyDR4jMkL2/UMFpvhGDNHQ
	 5+1Wzq8QhkR6dGg7/ZksICEwbJQkYDtWGviwdqkiPLal1aMnluaOhz/GGanNppubjO
	 Y3Lf74P0qhUSw==
From: Thomas Gleixner <tglx@kernel.org>
To: Chris Kennelly <ckennelly@google.com>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra
 <peterz@infradead.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Dmitry
 Vyukov <dvyukov@google.com>, regressions@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Ingo
 Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Jinjie
 Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>, Linus
 Torvalds <torvalds@linux-foundation.org>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx>
 <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
 <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
Date: Thu, 23 Apr 2026 21:39:50 +0200
Message-ID: <877bpx1n5l.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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

On Thu, Apr 23 2026 at 13:38, Chris Kennelly wrote:
> On Thu, Apr 23, 2026 at 1:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org>=
 wrote:
>>   3) The RO for userspace property has been enforced by RSEQ debugging
>>      mode since day one. If such a debug enabled kernel detects user
>>      space changing the field it kills the task/application.
>
> The optimization in TCMalloc that you're describing has been available
> since September 2023:
> https://github.com/google/tcmalloc/commit/aaa4fbf6fcdce1b7f86fcadd6598746=
45c75ddb9

And the github issue which requested glibc compatibility was opened in
Sept. 2022:

      https://github.com/google/tcmalloc/issues/144

> I thought the RSEQ debug checks were added in December 2024:
> https://github.com/torvalds/linux/commit/7d5265ffcd8b41da5e09066360540d6e=
0716e9cd,
> but perhaps I misidentified the ones in question.

I might have misread the git log. But that still does not justify the
violation of a documented ABI for the price that nobody else can use it
once tcmalloc is in play:

   x =3D tcmalloc();
   dostuff(x)
     evaluate(rseq::cpu_id_start, rseq::cpu_id) <- FAIL

>>   7) tcmalloc violates the ABI from day one and has since refused to
>>      address the problem despite being offered a kernel side rseq
>>      extension to solve it many years ago.
>
> I know there was some discussion around a preemption notification
> scheme, rseq_sched_state; but I thought the discussion moved in favor
> of the timeslice extension interface that recently landed. Timeslice
> extension solves some use cases, but I'm not sure it addresses this
> one.

No it does not. That's an orthogonal optimization.

Thanks,

        tglx

