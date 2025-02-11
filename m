Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7572FC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWpfdB70sbWftAcYj4ejbqqRA/4AsMF0XJbVpkeKv2U=; b=Mx5urWFxAz0McsR8Y+/7CKprhu
	RpSSV7CaitTgrLZM1Ay72QCXfZcWfVa1ru9ugclMsyyBcj/Dv4/x1tMc0j17I8YNSelgzYYDGmzTr
	qbDCAhVYfSbH/cJ7YSWcnulcZIoKSw5J6hgvbihcYKQkJkx7qn1rfDi6Kk/eVeMFfkODCejE1/GNm
	jvLIiOfgBH5jNNukeCXznSmsvTKQsQhfXHA5U7tMkmiuxIL2kRr5qp0murjpewuXhLOQIfiXrZ2q/
	0GbrRe3OnNHmYsqjZeFxV/gniv2Lf/zuS4UeOdoCYNnsBgfNNzrAnzF4y2LEFvjlhLXhVObc6pnVZ
	CJwNeS4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thi2p-00000002VZL-3Tl3;
	Tue, 11 Feb 2025 04:38:47 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thi1Q-00000002VSP-3yAq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:37:22 +0000
Received: by mail-wm1-x336.google.com with SMTP id 5b1f17b1804b1-438a39e659cso34787035e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Feb 2025 20:37:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739248638; x=1739853438; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWpfdB70sbWftAcYj4ejbqqRA/4AsMF0XJbVpkeKv2U=;
        b=dFIGeBeMafqJnCmFavtmNLl3/YLy0U+6Lnu1Yu+r1lRDgxYyE4i8Cz+1pnlzOL+Qy9
         QIU8fChnZYwowBKXhWiuinbUtHgTej1e0S5vLvMx3OE9/dNfVDsUHbg0y3a3vpDVfvmc
         sZ+nXzEFuC29TxZjkY40J22hXBisoJp3V6M79g6/a1PhH1hJ60tSWmkxKUeKlG5SfQih
         8P1oUy4rNuIbL8c3wcGCOc4oIK3jeF9+0LB0j4KJY2EWUeUYGLVF2PhDqXHZJ/YctbDZ
         EHRX6to80hx1GSjMrAl/+Z2/yM5az+T691MMNsVdeflkAwC2+3NUNQe1Mke6sw+fYinb
         hZcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739248638; x=1739853438;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWpfdB70sbWftAcYj4ejbqqRA/4AsMF0XJbVpkeKv2U=;
        b=Wbdald3QnRsSDV/aG+Xxfrma2stga2Sl1onYv30UGLvPjCEbacTaijrvS70wJD/8gp
         jDVHkl2pURfd48bI0kI0941g6TlLwnhzwYip61Wz6y11DJvOJHKpQcK4YaKhWMxy1jWG
         nt91rgxlSxbEA+iUcL3z/9uhQowBrKAfBq81BxEKMVJPF/UDkjkNlbOk7vxiqj1ihSFo
         rPulCQyJPrgQnnCilkG2ZacOaP72cnvKQVOaS5wEkGkuLU/N3+BPhEW7TvYq5WuGGelc
         TZeL8AKnifTxAjuMc1m9a9Thbrk9Z/URH3t3lNTpd/F0IkTS1GQZMAsxuS4bfhGZQhYH
         ym0A==
X-Forwarded-Encrypted: i=1; AJvYcCVlHgMJN+61eBLNuIBBwMyLJi9C0kLGmjBB1W/rcrIXP6QIJkbxrSA+pgMb7Sw5sWd6WI9OBLgnFLV5SZQ7dzme@lists.infradead.org
X-Gm-Message-State: AOJu0YwC9dTv2BZiP4r11LD4X/AWQKVOQUQCjuggOJnTmkG0PiR2Q/uM
	BgQe7h7U5CnRiNb+WkLhbpvuXP5a8lYcXOLtT6ywZM/oxHSTJz2DxEWIkZvnKshhhzyF3UwMptN
	M6+gDQ82J6z6B9livBcF01c2Yzfo=
X-Gm-Gg: ASbGncsuw1O0pQvg/sW5SBbNI0FTaVR6M4IkbfqUHJcyKPV1a6CtcC/oRD3J786I8a5
	YarxtVQOgYC+iazVp95P89b6DJYXWeJCL8mqKLOg+VujpSGqvOWFb8fEWTJsH5u0phmhnabWJJG
	IWNiH+eot2Ueyz6CjfTYNcjj/6dwoP
X-Google-Smtp-Source: AGHT+IGRefKznhz5yHKjcgGgQFbE9mcQJ89SBHVOVNja4lptmvxdcQaOzzSj54C/Z2QjZl52i6rOHwKdMoqDioHBQj0=
X-Received: by 2002:a5d:64ef:0:b0:38d:e6f4:5a88 with SMTP id
 ffacd0b85a97d-38de6f45ebemr99163f8f.12.1739248638184; Mon, 10 Feb 2025
 20:37:18 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250210093840.GE10324@noisy.programming.kicks-ass.net>
 <20250210104931.GE31462@noisy.programming.kicks-ass.net>
In-Reply-To: <20250210104931.GE31462@noisy.programming.kicks-ass.net>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Mon, 10 Feb 2025 20:37:06 -0800
X-Gm-Features: AWEUYZkr9lC8NBO_G3nOjJwjSNmxpru73XcllQ0zpalWtpIGmw6oAJpxSMv3-wg
Message-ID: <CAADnVQ+3wu0WB2pXs4cccxfkbTb3TK8Z+act5egytiON+qN9tA@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 00/26] Resilient Queued Spin Lock
To: Peter Zijlstra <peterz@infradead.org>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, 
	Linus Torvalds <torvalds@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Kernel Team <kernel-team@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_203720_989938_5A41F8F6 
X-CRM114-Status: GOOD (  22.30  )
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

On Mon, Feb 10, 2025 at 2:49=E2=80=AFAM Peter Zijlstra <peterz@infradead.or=
g> wrote:
> >
> > Do you force unload the BPF program?

Not yet. As you can imagine, cancelling bpf program is much
harder than sending sigkill to the user space process.
The prog needs to safely free all the resources it holds.
This work was ongoing for a couple years now with numerous discussions.
Many steps in-between are being considered as well.
Including detaching misbehaving prog, but there is always a counter
argument.

> Even the simple AB-BA case,
>
>   CPU0          CPU1
>   lock-A        lock-B
>   lock-B        lock-A <-
>
> just having a random lock op return -ETIMO doesn't actually solve
> anything. Suppose CPU1's lock-A will time out; it will have to unwind
> and release lock-B before CPU0 can make progress.
>
> Worse, if CPU1 isn't quick enough to unwind and release B, then CPU0's
> lock-B will also time out.
>
> At which point they'll both try again and you're stuck in the same
> place, no?

Not really. You're missing that deadlock is not a normal case.
As soon as we have cancellation logic working we will be "sigkilling"
prog where deadlock was detected.
In this patch the verifier guarantees that the prog must check
the return value from bpf_res_spin_lock().
The prog cannot keep re-trying.
The only thing it can do is to exit.
Failing to grab res_spin_lock() is not a normal condition.
The prog has to implement a fallback path for it,
but it has the look and feel of normal spin_lock and algorithms
are written assuming that the lock will be taken.
If res_spin_lock errors, it's a bug in the prog or the prog
was invoked from an unexpected context.

Same thing for patches 19,20,21 where we're addressing years
of accumulated tech debt in the bpf core parts, like bpf hashmap.
Once res_spin_lock() fails in kernel/bpf/hashtab.c
the bpf_map_update_elem() will return EBUSY
(just like it does now when it detects re-entrance on bucket lock).
This is no retry.
If res_spin_lock fails in bpf hashmap it's 99% case of syzbot
doing "clever" attaching of bpf progs to bpf internals and
trying hard to break things.

> Given you *have* to unwind to make progress; why not move the entire
> thing to a wound-wait style lock? Then you also get rid of the whole
> timeout mess.

We looked at things like ww_mutex_lock, but they don't fit.
wound-wait is for databases where deadlock is normal and expected.
The transaction has to be aborted and retried.
res_spin_lock is different. It's kinda safe spin_lock that doesn't
brick the kernel.
To be a drop in replacement it has to perform at the same speed
as spin_lock. Hence the massive benchmarking effort that
you see in the cover letter. That's also the reason to keep it 4 bytes.
We don't want to increase it to 8 or whatever unless it's absolutely
necessary.

In the other email you say:

> And it seems to me this thing might benefit somewhat significantly from
> adding this little extra bit.

referring to optimization that 8 byte res_spin_lock can potentially
do O(1) ABBA deadlock detection instead of O(NR_CPUS).
That was a conscious trade-off. Deadlocks are not normal.
If it takes a bit longer to detect it's fine.
The res_spin_lock is optimized to proceed as normal qspinlock.

