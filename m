Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A009FDEE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 17:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=; b=hjxttRZFlhJk9mvpPxXXHjtBwY
	uds6RBILz8KWqo/+F0qSNOYHFEJHbQee71T3JeJR2MKGOUiZxDYgxWvbYs5kMOemKCW/Q+yJSZ87J
	tSxSRBsQn63pnjlshAItig5dg/l+ak0+Tj0bGrcBlt8dFjn+aCjWAy+uArWAvVd2mDdbyMA+zqWZx
	plS5YSKJ990H9psrmmjxJK7g8PUrqNLYSFPInsHSC3mkjFuD5gde44+wxdyAcbbAhIuFM3h1jR0aX
	YBw4MLlGx9R3ki4nUH0nl8kTx+K/7Ps6Hp9O1vxmi5Wbe8nWWIL1YPWU7Rfm2xlJ8LMJuExIYPI39
	316gkHbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy0g-0000000C3wQ-20V1;
	Thu, 23 Apr 2026 17:38:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFy0e-0000000C3w4-0Zw3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 17:38:41 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-35da9692ec3so6054260a91.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:38:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776965918; cv=none;
        d=google.com; s=arc-20240605;
        b=FuYIQ7TNX1/C/QjTLn4TX6g1bOx4S/UvmI7FhjbXDWKj8NR1a3r1cFUVO6us2UthCJ
         epWDkCvKZUAasoIQ+cJEpnyi4DC9IDuohgExK8w0VrMYufa2KaALklKY9NjEChLQKh75
         mA/x9YhKwrbn95apLhpXYwXgZoVuYc2O3U9ELkgJIGGKFIwyWwr3Hn9MNe3KFrVbTZc8
         xpeFBdEPuuvS30Z8nc9Z65TFOxoUD/cr4OBxQkZF9S96pBJMVPBdXOp2xLh5m6Sg//+5
         5GObGphqwkEqEbKCm7L5Q93JsqzIZShIun0JGInzeCMpxAU4tkmYqfpH+G9aa+Hhpx/5
         i4dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=;
        fh=Sj/EPYN2DS/QS/e+qsdNjKQy2pcKHkFMHRW4WxY0Qog=;
        b=TE+SbhUvEM+WpkA6QtN1DpK7aT5sNk1hc9tMkY/C2/iuG7ZyQ7qY1QZhKhDathSfNS
         Rmqwz1vrClTz4lOc+RD0ViM1Xr0OfXsphMI0Yidh/Y2Pk5sFXn1K6eavWaRzZB/lTXRx
         2err46yfKbD1EQpJPvOpJaVuHwaHOcHG9gj5rmoAh4HGjpMf8eH4Zd1IS2UR7ypmg1Ld
         qsDJQ1MpX0ioTexZZx1TvvR/7e6V0t9avAGQ/gyR/492Wg82cB0dxaDL+kXBQvLTiPrI
         t4th8VnE2JVeVG9Mm7TrDdQtIQuabcedE/gnt7ZbKvrE/nglxCYZtFrOrnfrLU4nxi2+
         Sn6Q==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776965918; x=1777570718; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=;
        b=Y2UBfoNAhm42plTNNM+LOksfmCsL1VPEgnoZL3Fupuja5fom4bajhDoXly0zQiQCVK
         L+trRbF9V6FiuejLigy3/SdUpuKrnepeE8Nhbbe+jb4l1FJqxqLtZLXuTcSuYuIP+NfX
         1fR9KQM50Wd0h0TqAfjaJRbfEPVjUdyzbIzwfdMoMeRitm4xd5XQJqTDkAXe54x7I+7d
         KqCSGF26nfkftqBz0IDhsbUwLXhnpy3gIL5VUAAMeU2siml3SlrHkmNZ+wJPqnk6Cggt
         es1EA3sVkcX544PCkxyZd6sKOLI1uNTEzf1/flEORvrIa4MBXJmDnQte1CIBhAahfho+
         VHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776965918; x=1777570718;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hIPPDfLsh4fZuBB+5IBKjXnwvldEHr+c1t+Wm8HgqiA=;
        b=RK5XKzldvqdSb8Fkc9GXAvqtav6e3nMNKLEtQoR1D414xMe21+KloK1oM2+TGLigO+
         tNOkaWMyxTgZ0Oi0WjTFf+K9GBFPGu+tciKWnSwVkExXp8xZmRpnqWJUkB7SYiBnnah6
         a4dqX3qxIQwr8uuy/c5zp3fWpuQZABIF8QC5o5vM5F7c/sIlLn1iVVzPXC0zqjoOqksg
         EmcYs70FRHl0rReNknvF3jRmZ4j53ldUJ8WuEPCoQcVsc0Z0Y5oKuFJ+k+yceLwYgXYt
         hiwJ6l/6zE3XjMtB9GAVQMnrvU1MsFpJNrUcx3uN+UG2n72giRYp4RCc/BUfxC7Q63rY
         2GYg==
X-Forwarded-Encrypted: i=1; AFNElJ+Q2GlPmVBruFE2ubdco0Ot2GXJJu8nfCA763YMY9n5ZAFqX7tCeV7XHR//YPSVyLg0yqglaFMdSFMahLG7j3/X@lists.infradead.org
X-Gm-Message-State: AOJu0Yxph6n8yqSGFDS1UOx4hp+FFeY0uZMhzcOEuQdIWoYcHK+eCYQ+
	jPgb10L4JhY1BLKqRUQ4WDvu97KR7/4xlXk4762s/TfbyQR9rZQiij4A9E2N+UAVAaiP8rnhmdg
	wtgtB4IVkMgv92cuMchr34/7TwaH4hXL99AL+KGM2
X-Gm-Gg: AeBDieswI4S0NfqAo8TOSeT9yB5/BWwNboONfAw+unC2T0XdG03kYu+k4nzwH+Skp3l
	M93v2Jk/ujNbh/mFSGSbR+ZZnDSpe6ohiHxn3wXTQALXQgAHuYCyFQpBMde7QazIm4OllT1sLj6
	QfcPsPDEQjVVRpH5IQEraqZJxvXES0BHTwEMB/ATETKU19I4f2n2jLvgWPkESjQzAPNDVEn9xvJ
	VQzXZAsg97Wc/p/oU8X4mcAU4Ba9N6rAouwkXAR+4eHYy3JXDA59PLcodz27sxIfKrIIXIPJQ/Q
	1MDD1zVuMwLU2wAR1HYWNUSkDpwllpU/IVk1EfsZoBEO5GwOteWVJ3ill8DMGg==
X-Received: by 2002:a17:90b:3d01:b0:35f:b75e:fff5 with SMTP id
 98e67ed59e1d1-3614048b7admr31930988a91.22.1776965917783; Thu, 23 Apr 2026
 10:38:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <20260422125647.GP3126523@noisy.programming.kicks-ass.net>
 <20260422131338.GI3102924@noisy.programming.kicks-ass.net>
 <CAHnCjA2fa+dP1+yCYNQrTXQaW-JdtfMj7wMikwMeeCRg-3NhiA@mail.gmail.com>
 <87fr4l28zn.ffs@tglx> <CAHnCjA07ER=9xBqXq4jf5yn052W-E9ZXD86HxnRGtai6bpXbbQ@mail.gmail.com>
 <87cxzp1tn6.ffs@tglx>
In-Reply-To: <87cxzp1tn6.ffs@tglx>
From: Chris Kennelly <ckennelly@google.com>
Date: Thu, 23 Apr 2026 13:38:20 -0400
X-Gm-Features: AQROBzDCR58aogsBZRg7gaWhk_b7-PMjg3xBOR1vzqWjWnl_6TQlM5lhko-1SuM
Message-ID: <CAEE+yb=rZFxxOhCw+6wsUt5PE6=ebbKjEggQ_j_G3qSkMQZsfg@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Thomas Gleixner <tglx@kernel.org>
Cc: Mathias Stearn <mathias@mongodb.com>, Peter Zijlstra <peterz@infradead.org>, 
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"Paul E. McKenney" <paulmck@kernel.org>, Dmitry Vyukov <dvyukov@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Ingo Molnar <mingo@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Jinjie Ruan <ruanjinjie@huawei.com>, Blake Oler <blake.oler@mongodb.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_103840_240049_67B208C4 
X-CRM114-Status: GOOD (  42.20  )
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

On Thu, Apr 23, 2026 at 1:19=E2=80=AFPM Thomas Gleixner <tglx@kernel.org> w=
rote:
>
> On Thu, Apr 23 2026 at 14:11, Mathias Stearn wrote:
>
> Cc+ Linus
>
> > Of course, even if we make that change, it will only apply to _future_
> > binaries. That's why we prefer a kernel fix so that users will be able
> > to run our existing releases (or any containers that use them) on a
> > modern kernel.
>
> I understand that and as everyone else I would be happy to do that, but
> the price everyone pays for proliferating the tcmalloc insanity is not
> cheap either.
>
> So let me recap the whole situation and how we got there:
>
>   1) The original RSEQ implementation updates the rseq::cpu_id_start
>      field in user space more or less unconditionally on every exit to
>      user, whether the CPU/MMCID have been changed or not.
>
>      That went unnoticed for years because nothing used rseq aside of
>      google and tcmalloc. Once glibc registered rseq, this resulted in a
>      up to 15% performance penalty for syscall heavy workloads.
>
>   2) The rseq::cpu_id_start field is documented as read only for user
>      space in the ABI contract and guaranteed to be updated by the
>      kernel when a task is migrated to a different CPU.
>
>   3) The RO for userspace property has been enforced by RSEQ debugging
>      mode since day one. If such a debug enabled kernel detects user
>      space changing the field it kills the task/application.

The optimization in TCMalloc that you're describing has been available
since September 2023:
https://github.com/google/tcmalloc/commit/aaa4fbf6fcdce1b7f86fcadd659874645=
c75ddb9

I thought the RSEQ debug checks were added in December 2024:
https://github.com/torvalds/linux/commit/7d5265ffcd8b41da5e09066360540d6e07=
16e9cd,
but perhaps I misidentified the ones in question.

>
>   4) tcmalloc abused the suboptimal implementation (see #1) and
>      scribbled over rseq::cpu_id_start for their own nefarious purposes.
>
>   5) As a consequence of #4 tcmalloc cannot be used on a RSEQ debug
>      enabled kernel. Which means a developer cannot validate his RSEQ
>      code against a debug kernel when tcmalloc is in use on the system
>      as that would crash the tcmalloc dependent applications due to #3.
>
>   6) As a consequence of #4 tcmalloc cannot be used together with any
>      other facility/library which wants to utilize the ABI guaranteed
>      properties of rseq::cpu_id_start in the same application.
>
>   7) tcmalloc violates the ABI from day one and has since refused to
>      address the problem despite being offered a kernel side rseq
>      extension to solve it many years ago.

I know there was some discussion around a preemption notification
scheme, rseq_sched_state; but I thought the discussion moved in favor
of the timeslice extension interface that recently landed. Timeslice
extension solves some use cases, but I'm not sure it addresses this
one.

>
>   8) When addressing the performance issues of RSEQ the unconditional
>      update stopped to exist under the valid assumption that the kernel
>      has only to satisfy the guaranteed ABI properties, especially when
>      they are enforcable by RSEQ debug.
>
>      As a consequence this exposed the tcmalloc ABI violation because
>      the unconditional pointless overwriting of something which did not
>      change stopped to happen.
>
> Due to #4 everyone is in a hard place and up a creek without a paddle.
>
> Here are the possible solutions:
>
>   A) Mathias suggested to force overwrite rseq:cpu_id_start everytime
>      the rseq::rseq_cs field is cleared by the kernel under the not yet
>      validated theoretical assumption that this cures the problem for
>      tcmalloc.
>
>      If that's sufficient that would be harmless performance wise
>      because the write would be inside the already existing STAC/CLAC
>      section and just add some more noise to the rseq critical section
>      operations.
>
>      That would allow existing tcmalloc usage to continue, but
>      obviously would neither solve #5 and #6 above nor provide an
>      incentive for tcmalloc to actually fix their crap.
>
>   B) If that's not sufficient then keeping tcmalloc alive would require
>      to go back to the previous state and let everyone else pay the
>      price in terms of performance overhead.
>
>   C) Declare that this is not a regression because the ABI guarantee is
>      not violated and the RO property has been enforcable by RSEQ
>      debugging since day one.
>
> In my opinion #C is the right thing to do, but I can see a case being
> made for the lightweight fix Mathias suggested (#A) _if_ and only _if_
> that is sufficient. Picking #A would also mean that user space people
> have to take up the fight against tcmalloc when they want to use the
> RSEQ guaranteed ABI along with tcmalloc in the same application or use a
> RSEQ debug kernel to validate their own code.
>
> Going back to the full unconditional nightmare (#B) is not an option at
> all as anybody else has to take the massive performance hit.
>
> Oh well...
>
> Thanks,
>
>         tglx

