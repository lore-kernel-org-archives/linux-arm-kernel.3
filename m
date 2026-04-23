Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E44E8F99378
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2kLp6EQuRiSx+Qrn1H6AKFXY7OanD+wy8Q5FYkeQJAg=; b=uzjYuMcojhsvqd6YIM/iMtr+nL
	RMEOOtZ9jLZkN34pNmmCYhOxCXB47vDoZlZ4Ec5cnHfzhQdoGVgBSDves3qSTSqBVR2Bz9HU7ZCbN
	cf5gxH9/h2tR0dgMNh39FGucV0jZG9+xMjtYoyKx+reFdTfwY026fftl/P9Snh4zoIMD34zXkCtI2
	uq6wxr6de2yeO+7RWYOlK//ObgEz7kHGqVYMHQi+ZGX27+jTuG+GLHa0+szMgFiggJKvo3yhGPfN8
	pO/XdndanqrIUfam0aY0AvDCI8sOeZpSN5r4Pzm9v79QkfMC47RcLsZyvIBy3C2ZJKXZ5Fwmq4kKM
	023OZ0DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsXa-0000000BYNF-0yPa;
	Thu, 23 Apr 2026 11:48:18 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFsXY-0000000BYMf-2kYD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 11:48:17 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776944893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kLp6EQuRiSx+Qrn1H6AKFXY7OanD+wy8Q5FYkeQJAg=;
	b=ppjznlY36wTPmrvfJwDa34Q31pMkkz9Fw6yo3mvk5UfISfJuJbykVarX8XDE1gebXmKaPa
	ps/QvVQ0ycQ2v+3b+iNxbyeqdSVyFVI+0dpDoGEKjmGc2CQkeuE9W97hE0aSO2FbYfM9Gv
	p6x/7iGcZJaERx+1OyILBwQ7GUgxzRPI12enuxA+0RF+rZtuQt95qCU/1rgaufoV7RQ5FN
	CX1k+APTitHw7nDsY6Qjiruhu5SJTevkp3PrismnQnARDmX4hwFXj1EK77sUFARxq0Dl8t
	YNQquUnVx9EdV4ms5uerQ543l3okx3jNq3UXP6/klNj7YQ5NcT1sldc4ruMrNg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776944893;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kLp6EQuRiSx+Qrn1H6AKFXY7OanD+wy8Q5FYkeQJAg=;
	b=NHdURgAvj5rDfEqiN/RpuMhjPo9zK7VL5SMlHYfC9+6TQdk3S2T//viQcEdjALHPz4h4+8
	kKZXJpi4i27dNcBw==
To: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, Boqun Feng
 <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Chris
 Kennelly <ckennelly@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 regressions@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, Ingo Molnar <mingo@kernel.org>, Mark
 Rutland <mark.rutland@arm.com>, Jinjie Ruan <ruanjinjie@huawei.com>, Blake
 Oler <blake.oler@mongodb.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
In-Reply-To: <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
Date: Thu, 23 Apr 2026 13:48:12 +0200
Message-ID: <87fr4l28zn.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_044816_832628_9281A23A 
X-CRM114-Status: GOOD (  14.14  )
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

On Thu, Apr 23 2026 at 11:24, Mathias Stearn wrote:
> On Wed, Apr 22, 2026 at 3:13=E2=80=AFPM Peter Zijlstra <peterz@infradead.=
org> wrote:
> To make this more concrete, I am proposing adding
>
> unsafe_put_user((u32)task_cpu(t), &t->rseq.usrptr->cpu_id_start, efault);
>
> after each place where you currently do
>
> unsafe_put_user(0ULL, &t->rseq.usrptr->rseq_cs, efault);
>
> in rseq_update_user_cs. Is that something that you would expect to cause a
> performance issue?

That would work and not bring the performance issues back, but:

  1) Did you validate that adding the reset into rseq_update_user_cs() is
     actually sufficient?

     If adding it to rseq_update_user_cs() is not sufficient, then we
     have a really serious problem. Because we'd need to go back and do
     it unconditionally, which then makes the 15% performance
     regression, which happened when glibc enabled rseq, come back
     instantaneously. And in that case the damage for tcmalloc() is the
     lesser of two evils.

  2) The tcmalloc abuse breaks the documented and guaranteed user space
     ABI and therefore it makes it impossible for any other library in
     an application which uses tcmalloc to rely on the documented and
     guaranteed rseq::cpu_id_start/rseq::cpu_id semantics.

     Which means, that tcmalloc is holding everybody else hostage.
     That's just not acceptable. Not even under the no regression rule.

  3) The fact that tcmalloc prevents a user from enabling rseq debugging
     is equally unacceptable as it does not allow me to validate my own
     rseq magic code in my mongodb client because enabling it will make
     the DB I want to test against go away.

     Again tcmalloc holds everybody else hostage for no reason at all.

The most amazing part is that tcmalloc uses this to spare two
instruction cycles, but nobody noticed in 8 years how much performance
the unconditional rseq nonsense in the kernel left on the table.

Thanks,

        tglx

