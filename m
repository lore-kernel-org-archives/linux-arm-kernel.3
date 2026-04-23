Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38CCFFAD416
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 05:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=; b=PgH04drLNXVDkwrvSCBsVzJpMf
	Flom3sXPLUnvqnlO6r4Wi1AZq55qo6oD5mh7sAiyOeU+rDDUonJtoTGQAeAf2db8k51KHBK8UzMC2
	gqVSQJYHt4M0GFyzVtpa5mJpB1bgJqeYg3y+o2akLeKzohZihi0xBgctJT1tgOGxkJ+yuquDrVgR0
	9ztDGvrD8/48wKWc613miEiVd5InIVbBJ6++DCj3v54SFHPB85b24ybyT+1AKnrT/jRPeSCl+KYB8
	Aat7kblE1L4mmU3LmmNenRdlc0Ecvb13sh+Od2+PNPIQWEp2X14weYzvGrDrNsZ1IYCBuDkqVtvNC
	kEP3pVRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFn0w-0000000B5JC-32hQ;
	Thu, 23 Apr 2026 05:54:14 +0000
Received: from mail-lj1-x22c.google.com ([2a00:1450:4864:20::22c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFn0t-0000000B5Io-1Kf6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 05:54:12 +0000
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-38e91b06006so51957971fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Apr 2026 22:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776923648; cv=none;
        d=google.com; s=arc-20240605;
        b=Ir+lz8rpevbpIl3jEfwXwQilpKHidROIHfzlvsr0H5M9eAq/ZuKl4tIKwiTKhhmlAc
         HH6fs/QmlJcbBJUEVvducX1C/LiPwW9b3paUkl8tWY71MswsFy0TusGlfuX3W/6UabwD
         0z4pVHAE4O5h8/oM4Pbr6MKMwRVtLrozW7RFnO9uMveK9wgDpKFz0kocp6li2NG5Pq8y
         9yNiVHrzdz8FqViIahfchUFjqk/ES3C93d2Z1iI1T2GKMZ6uu1zz/LRxifkfxtew4imz
         e1PR57I1S+ZOfJc7nfSpVoopw9ohQOe3+HZt1Va+julFxQ/Vv6deOnkOj1i45tqzkyCZ
         Hv7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=;
        fh=wDEYlm1HOHUWET8E5L64SIGLV6nSAALLFzm0yRARGo4=;
        b=P9HVkAzsivbGBgSbvzd8YUh0CS0bI+hRcMf1asneeLyWM/ZvLDHbdDG2dkfOLEV7+b
         XJRdnFSLJPI51FNn1ckXZS8aVh3AJ3DhNUwyQKKTHUHQjsqX3x9g/lntHGyB5Wd5moyt
         RToi31lVZshezOpP+wUsYcLsW+Daq6O7Gj/eMZoGPCIiqb2YA+fSSrifFX7X/wGDdbGt
         jo/Ah4W9ihfTdD3nXdJAjRwuX+p60rlyYQYkssbrq3McotmCjZLjLcjL3dZi62xXZerK
         wc3Jyf56NUz/2F9HIdFAKDOBZkS4Y5hDK26yuf0ITKV8fT3K4FRTRKKKCPKOPzGlYevO
         J1lw==;
        darn=lists.infradead.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776923648; x=1777528448; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=;
        b=rKgLQrd31sYk/V7UUc8i+bateBbTlVh7n022OlU2DkYxCQDxxz2xa9a2hRb/fJqM94
         9hwhSppm3dv/CsqTVhkn/0alEl5APbdUjfbAX4m9TsnbFbLltPERXMd5RzLhN9/Z0EXJ
         H8FcLNLuQ8M5dk9PciSWl7uMUV3hxUoPXPr9aErHOy0Hm9p96y/pvHuDy7aKbY/lfxml
         Q2VuJ5O+NTAxnE89jseIF9FdtG4ObyOHnngnmdqdcc/4rULDi9FwEfbnxDGXb6ZsCJHn
         xnol1iIES3nwRSBTs8rEkMqAdJIOCHQGRkmftvCbnEqOPzdeyJ8UXXo5KOMFH+UJ1JYX
         OTQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776923648; x=1777528448;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WzRgT3Fy0ZOQHjWDkavm7hE9jcAag/PmRRQNI2oPYmE=;
        b=RPR31FwrbBS3CmtSGRkPZF3D86fEsFhOfR0n0NrEKI+WHpX4NcAiojRmjeaWfx+FRU
         bbVQpgljjnC6vYnv2t+FyAbefLr4FQqdao0xnvJk+ZwgXOGme5hlgkW1C1j88zNceWVI
         zNdfgn5rtU2kkDljcR8D4GLcluzUGQxbOsbNarzheFLY7IHGqyAVASw9jk8KKIOYXmpn
         JTu7mxEhrFULwW78RzWK5xvWdQSKaTQsJZ9ghL44Mny9ye55IMnYaJERpccnCyJPeJA4
         wr8jYr5RMJfFmiko7+GV3pzxsv0vp7UchY7zsM8jmWdcQ32WpOsbV1COlr/lQgGiX+/T
         k44w==
X-Forwarded-Encrypted: i=1; AFNElJ++gVeHyOmqfPSB+JNZrPqxfcmBzrHTjcH6Z11O650IBKoXR8/dljs3GaoppXt5r7BCws2WeloMgyHQPRWiHVaO@lists.infradead.org
X-Gm-Message-State: AOJu0YwHeAXfuxhpeVScJFYE3bvClNnKXrnyEeo5qVSY1zIWwCQKVbbp
	dZH22hqr+ATX74t8XSYTWaNGRx/hunzpM0qfFJWixNX9FlGtc5Ydf3h7dQvu6I6l+2wqQHr52j9
	o1HYdS1ouh8lHpeMb5e2wZoLmv1wAmBty6x3ITVcF
X-Gm-Gg: AeBDiesnUePenYxiiuT5OL+VSzfSTeYpGkos/221x/qMgx8qvVGi3QSYLXhUihp7KVW
	QDOVdQoisAB9HOQ3uJf8+RqjhyjHgG+h6TTsJt43UiHED/Ckz5urlNsA2EvC6wOXWUxMkZ/qrLV
	kjIqWFJiY7g4LTTsi0SV/E0bcz9gmRqiKT3aRY48+8sOxBGxGxvjgGffXcBW5Wij3ClOGCJg2a1
	nJW3q/496/dzlMMwPA/bAKQ+2ryAVMHWNf94zRTjQhDp7F0myqyWai5mwSDPl3jJwzePIlAattU
	djgBwxB0QQ/E+jeBk0/07bPUVwk/IF/rjBIbjttHGJnj/qDe/fvbtVnlTEFuPiJ+AoJAbfEbl6J
	jPaejUpFZqWUSJqhO+g==
X-Received: by 2002:a05:651c:555:b0:38e:99ba:ec77 with SMTP id
 38308e7fff4ca-38ec783f2ffmr78727471fa.14.1776923647481; Wed, 22 Apr 2026
 22:54:07 -0700 (PDT)
MIME-Version: 1.0
References: <CAHnCjA25b+nO2n5CeifknSKHssJpPrjnf+dtr7UgzRw4Zgu=oA@mail.gmail.com>
 <aejCaG6n9s7ak5TO@J2N7QTR9R3.cambridge.arm.com> <87zf2u28d1.ffs@tglx>
 <aekPXvvuKHKlETjm@J2N7QTR9R3.cambridge.arm.com> <87wlxy22x7.ffs@tglx> <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
In-Reply-To: <c5331cd6-76c8-430d-978e-fcad164e48f6@huawei.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 23 Apr 2026 07:53:55 +0200
X-Gm-Features: AQROBzDiWg3BhfVAmxsSMzsrj4-DDyCRyJJ_hjD1dpJPTaQSNdduKsPUw0QTTv0
Message-ID: <CACT4Y+bxnQyHGdVNE1BYTx+Z2-cscLb38HYS9jBM5gPAz8=4bw@mail.gmail.com>
Subject: Re: [REGRESSION] rseq: refactoring in v6.19 broke everyone on arm64
 and tcmalloc everywhere
To: Jinjie Ruan <ruanjinjie@huawei.com>, linux-man@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Mark Rutland <mark.rutland@arm.com>, 
	Mathias Stearn <mathias@mongodb.com>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
	Chris Kennelly <ckennelly@google.com>, regressions@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	Blake Oler <blake.oler@mongodb.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_225411_413982_0A0DC437 
X-CRM114-Status: GOOD (  31.34  )
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

On Thu, 23 Apr 2026 at 03:48, Jinjie Ruan <ruanjinjie@huawei.com> wrote:
>
> On 4/23/2026 3:47 AM, Thomas Gleixner wrote:
> > On Wed, Apr 22 2026 at 19:11, Mark Rutland wrote:
> >> On Wed, Apr 22, 2026 at 07:49:30PM +0200, Thomas Gleixner wrote:
> >> Conceptually we just need to use syscall_enter_from_user_mode() and
> >> irqentry_enter_from_user_mode() appropriately.
> >
> > Right. I figured that out.
> >
> >> In practice, I can't use those as-is without introducing the exception
> >> masking problems I just fixed up for irqentry_enter_from_kernel_mode(),
> >> so I'll need to do some similar refactoring first.
> >
> > See below.
> >
> >> I haven't paged everything in yet, so just to cehck, is there anything
> >> that would behave incorrectly if current->rseq.event.user_irq were set
> >> for syscall entry? IIUC it means we'll effectively do the slow path, and
> >> I was wondering if that might be acceptable as a one-line bodge for
> >> stable.
> >
> > It might work, but it's trivial enough to avoid that. See below. That on
> > top of 6.19.y makes the selftests pass too.
>
> This aligns with my thoughts when convert arm64 to generic syscall
> entry. Currently, the arm64 entry code does not distinguish between IRQ
> and syscall entries. It fails to call rseq_note_user_irq_entry() for IRQ
> entries as the generic entry framework does, because arm64 uses
> enter_from_user_mode() exclusively instead of
> irqentry_enter_from_user_mode().
>
> https://lore.kernel.org/all/20260320102620.1336796-10-ruanjinjie@huawei.com/
>
> >
> > Thanks,
> >
> >         tglx
> > ---
> >  arch/arm64/kernel/entry-common.c |   14 ++++++++++----
> >  1 file changed, 10 insertions(+), 4 deletions(-)
> >
> > --- a/arch/arm64/kernel/entry-common.c
> > +++ b/arch/arm64/kernel/entry-common.c
> > @@ -58,6 +58,12 @@ static void noinstr exit_to_kernel_mode(
> >       irqentry_exit(regs, state);
> >  }
> >
> > +static __always_inline void arm64_enter_from_user_mode_syscall(struct pt_regs *regs)
> > +{
> > +     enter_from_user_mode(regs);
> > +     mte_disable_tco_entry(current);
> > +}
> > +
> >  /*
> >   * Handle IRQ/context state management when entering from user mode.
> >   * Before this function is called it is not safe to call regular kernel code,
> > @@ -65,8 +71,8 @@ static void noinstr exit_to_kernel_mode(
> >   */
> >  static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
> >  {
> > -     enter_from_user_mode(regs);
> > -     mte_disable_tco_entry(current);
> > +     arm64_enter_from_user_mode_syscall(regs);
> > +     rseq_note_user_irq_entry();
> >  }
> >
> >  /*
> > @@ -717,7 +723,7 @@ static void noinstr el0_brk64(struct pt_
> >
> >  static void noinstr el0_svc(struct pt_regs *regs)
> >  {
> > -     arm64_enter_from_user_mode(regs);
> > +     arm64_enter_from_user_mode_syscall(regs);
> >       cortex_a76_erratum_1463225_svc_handler();
> >       fpsimd_syscall_enter();
> >       local_daif_restore(DAIF_PROCCTX);
> > @@ -869,7 +875,7 @@ static void noinstr el0_cp15(struct pt_r
> >
> >  static void noinstr el0_svc_compat(struct pt_regs *regs)
> >  {
> > -     arm64_enter_from_user_mode(regs);
> > +     arm64_enter_from_user_mode_syscall(regs);
> >       cortex_a76_erratum_1463225_svc_handler();
> >       local_daif_restore(DAIF_PROCCTX);
> >       do_el0_svc_compat(regs);


+linux-man

This part of the rseq man page needs to be fixed as well I think. The
kernel no longer reliably provides clearing of rseq_cs on preemption,
right?

https://git.kernel.org/pub/scm/libs/librseq/librseq.git/tree/doc/man/rseq.2#n241

"and set to NULL by the kernel when it restarts an assembly
instruction sequence block,
as well as when the kernel detects that it is preempting or delivering
a signal outside of the range targeted by the rseq_cs."

