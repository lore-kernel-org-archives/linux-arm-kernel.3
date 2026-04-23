Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6236F589A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 12:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=; b=LBA0zTJdY2Fjd8eGvwoxUHh200
	i+0RDyBriq0VE9M9noxqOZ4fWLPl2xiJ3d2XvbW2pqQVBcjFKQhGaZhqYXa62/VADV985uyCbaq3d
	IUIGSk3R/xug5aOPvNW/3hjZCVxIV3801s6dvB1Kvg2Rr78bYrqpM4FVAoeTQk3OCYTTK80ZxzUno
	MOK6jr7U7gkl5Y/J7cP6CJGnHclvGpYq+yf2nBwJGQkjjLoot41NIVLBkCRt5OqKglHMIWNctbKsA
	fbXBXU7ySGQ0zDqnDM/mR4wuiqSCUkgv1pDLoXyu6RwinSrojzkzqRkWbKkYeF3leU0yjHNzpxqyE
	jkf0zs5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsum-0000000Barh-0WlJ;
	Thu, 23 Apr 2026 12:12:16 +0000
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsui-0000000Baq1-2NPx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 12:12:15 +0000
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-65c0891f4e9so10879477a12.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 05:12:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776946330; cv=none;
        d=google.com; s=arc-20240605;
        b=Mm1w79AMiK8ja6WOPfYwjTWg7+S61pc1YaBjw1BzRfBWGGCw8kfsvMK6bO0c5mgShZ
         JqfFLWXvdEB/M2BFfcuSykifKjqGCTS7MA9p0pdlHhl0GL6Fp4OTuLJYpjyGsjQBLqeG
         aa2/3ohZaZxornM52fvIG0SfiJ9zJnEUUgnT57wa649I/urapx6ZvxRAAWWBK/2ZhcgV
         cFCUIZ8zZdhnInkqjzkVQz3FsKTq8lDulU1oRglsN9jBrVXGFPqqz4gBBvv/+9GROdSv
         R35OBNab+iKEGfqVTybUTKPboNcfJlBDENuAqrc3/uXQT2UvR7L9V/xoZBqfOztuRzrR
         xn+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=;
        fh=8UmGnlBZYGTaLjc3/mn/LdacjDu9WKUz9Dkm6FsZtAg=;
        b=BxOV5ZmLISF2x8L3Em+Wdm3tJzP8E4wFzwAETjBqahya7VrinEZD2H3CvI/jNrdGLK
         RE6P3YyktGzY4OGVUlffWrCdDBH9qfDdIa5zXC3/Q4jsNGM94oX15Xm8bxhetHap4Q2h
         TVZSNY7t77nUM0wfADn5cFxfG9wBs3OrkqocxlR7AK6AYaTrklhdJwO2u76VRgHCbbSt
         zeMJXOYRnLj9XzPhET0WhUpl6RDk0OrBJ5SvC0t0pm4PS4aOICS96iphDFFKqlzqmiUt
         14gAVL07ObDy33RmzKRbnNNT5w04FnaJ0chUre4dsNlJ5hmuoo6hOfUcJKbFX+BzalOe
         EhrQ==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mongodb.com; s=google; t=1776946330; x=1777551130; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=;
        b=fF5g1iDjdlaJU6zMgx/ZNPID3TmWK1OhDbGgwn+ET4KG2ZP60eoT8F1Tuuce/Cz3A/
         aEYoX7MIbgHX0ETEk5x5MiWfDSOBDtu/CFSPN7JevypdjKrJlZ963XPH5byMtW88CqT0
         Wv7hf9LzjRQyvvWbjRFmzo0YnoqEPB5nNeZkY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776946330; x=1777551130;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3MZnt20UPKiyULAD9uYTybbeevx1Im9wceM641ALZU=;
        b=UgACIiPUOALR21R4JrxT9uPZq2zwchxUD6fSGXMlE/UWMcRtyQ/5mlsXSR7/gUdxyq
         vNgosfjwxc50aHDWzvwBmg2uvz/H+9/K1fiTk7tpXDj5Awan1jcVWA3mOGxlGwYqCue2
         +c2qC55760SfYrLVqUhv/AKBlXhzsZV46bDIe2V05y10zpqL3tbKovYmaVoAVhuWXxT+
         yoDTkeASS8e1MSneymqRYr8tmkgrvkHq8BC4hwhLAcepTJMwWUSwA/lDtFdmmhVxd+Hw
         m3ZEg+hudbnuBLRIKMqKDqheAlbvI1mFrmo4uZnYO3Z4gF8yUopet4XeYh17DXI1DuRn
         GIug==
X-Forwarded-Encrypted: i=1; AFNElJ8ppCsJNVpEvNFfFLfF0hS6P6qtEoHeJB8nfEBEOwkdF8k2cQW43X936Jy4pSiv+zhmih4hbUg61llkTh74G/QC@lists.infradead.org
X-Gm-Message-State: AOJu0YxnsgiUrwcVUAcgvQbI9M65fV8W0ltq03gno7hW19boMTB6rO//
	RbVqFCTTUwz9UKXcSLU7sKFsobMIpFYcMJioCTKKMO6wP6Mc3HpGafAs8XAk9Jk3IFn20Rha/Fq
	P8fCdaqHl3aG/ZToRlLbh4lHXxgc16OKrr6pBmswCww==
X-Gm-Gg: AeBDieu2UKqPpArsOVfW5fjSH/JH8206LSbTi0Vl0Kyd8W8FgIyjX54DGgtpsbzVQNT
	zlXcLvy5lmb9c49vHJ2XSuQV3mzRG8Uise2td+iZi9dRQCxCNNHwj2UxvANLNnDsjBnivYVmcyM
	GvasF0Xo/oSoN10L0dq0r3EYZJmid8h+l1KLTdRTMRa0jYM5/xcX0QwvH4fZsyg/oYTqth+XUL1
	z5ta+ky7qM3pBWDionMX7Jx+Dlxim9OiS/K6gvBQBV0ZzEuzqAUQpJ7g/9IY+WqBQMpNQnxeD6k
	ehBpgqYxvy25RM6e
X-Received: by 2002:a17:907:9729:b0:b9c:30b7:770f with SMTP id
 a640c23a62f3a-ba41b5d2827mr1236383566b.34.1776946330185; Thu, 23 Apr 2026
 05:12:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com> <87fr4l28zn.ffs@tglx>
In-Reply-To: <87fr4l28zn.ffs@tglx>
From: Mathias Stearn <mathias@mongodb.com>
Date: Thu, 23 Apr 2026 14:11:42 +0200
X-Gm-Features: AQROBzCM6mAx-Xc_U10JYAvRKv_DgQMoTZQWyWV7r3P3EeiSoMbA1BfiRa5wClo
Message-ID: <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Chris Kennelly <ckennelly@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_051212_661271_992F9EAF 
X-CRM114-Status: GOOD (  23.04  )
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

On Thu, Apr 23, 2026 at 1:48=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de=
> wrote:
> That would work and not bring the performance issues back, but:
>
>   1) Did you validate that adding the reset into rseq_update_user_cs() is
>      actually sufficient?

Not yet, although I confirmed with the tcmalloc maintainers that they
thought it would be sufficient before suggesting it. I'm currently
building your patch from upthread to test that out. I can try this
after, although I don't think I'll be able to get to that today. I'll
try to get a coworker to test it though.

>      Which means, that tcmalloc is holding everybody else hostage.
>      That's just not acceptable. Not even under the no regression rule.

Agree. I don't love the situation either. Or that we need to advise
setting the environment variable to tell glibc not to use rseq. But I
also want our users to be able to use existing mongo binaries on new
kernels.

>   3) The fact that tcmalloc prevents a user from enabling rseq debugging
>      is equally unacceptable as it does not allow me to validate my own
>      rseq magic code in my mongodb client because enabling it will make
>      the DB I want to test against go away.

Glad to hear you use mongodb :)

> The most amazing part is that tcmalloc uses this to spare two
> instruction cycles, but nobody noticed in 8 years how much performance
> the unconditional rseq nonsense in the kernel left on the table.

I am looking into a change to our copy of tcmalloc to have it stop
squatting on cpu_id_start, and will run that through our correctness
and performance tests. I can't promise anything (and I certainly can't
speak for what Google may choose to do), but I share your expectation
that it should be possible with minimal impact. It _is_ more than 2
cycles though, since it extends the load dependency chain by one or
two pointer chases and a bit of ALU ops. I'd guesstimate it will
likely cost on the order of 5-10 cycles per call to malloc or free. I
think we can absorb that, but will need to test.

Of course, even if we make that change, it will only apply to _future_
binaries. That's why we prefer a kernel fix so that users will be able
to run our existing releases (or any containers that use them) on a
modern kernel.

