Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F9EC021A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 06:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WyzA7Briisr+Eb0T4txsGUK8feDh27QiFqA7IYyWowI=; b=zMo2bdWeHrtqItVpX6iABM5FJE
	bogNbrJXo1yiZ3myt1xBmAXfgGwbkMxAGq1inoeOhcWzXl5s3gbr6xDfkmlpVttVg/3SIeWLrznsW
	hG96fovjxC/ALxdhiLLxGghYpHZ1d7i+mQ/tuTxdb+N/lOCb+e/7Ea7iykLcKMhdjRCu2g8SK+Tg9
	xGl5kC5G63DgI/BJuOrBuYX6OfERmmffdURIyxWzi5wEokNL/eX4bTrlr5HKit1linw6FLGEuqTSM
	ycJYy+YtKJLcSLTyH/3mfkwV0i+SJMqf6ThBPUVeLosDjGOphUpB2AoNCJBIruyWeQ1ZCQ9ZHIFlZ
	aTRndNKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSy3-00000009yz0-2jdY;
	Thu, 13 Feb 2025 06:44:59 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiSvg-00000009yfZ-3UJp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 06:42:34 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-aaedd529ba1so75343666b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 12 Feb 2025 22:42:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739428951; x=1740033751; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WyzA7Briisr+Eb0T4txsGUK8feDh27QiFqA7IYyWowI=;
        b=ldheS7XwRpDF2CvpJzQPZ7Y1Z4DEX5xjpLw33At1gEh8xK1QpOyM3113ljUcWrxQ6e
         GwO+XU3Mi8AL4udyFzn5mTtoJbGXtzQI6mMNU8ySawQfbyUYd4d4lqheGXMksgEPU2vU
         SnY2PqsqGITm1Ednykvc7GIQ+WEo8Tv5XdMNKpHWqXVvyoCl01LNQPeY1zFaQYbqQAEm
         jdBx51QrotHSxpJHPz3Vrvv+xGc448cHqHbYkzpgjHbrHB9b4x86Crv4g2D1FZM7+fT/
         Fz+yF6e4Mvu3AHri/xt4H2SsrOnkI/LS2PMbMUc4YnGr+lzCJIsoclRwQ89BIoz0QiPS
         rigA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739428951; x=1740033751;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WyzA7Briisr+Eb0T4txsGUK8feDh27QiFqA7IYyWowI=;
        b=bMc9bN7pm+la2l8l9Av4t4gPbM6BBPzMx974J6VSnxwddhjDFnK93iWqqkVXu+lGHQ
         W0zLRPqaZIjxKrN+2gyPjOYBlCLWekZL5RaZmGsDZRklEchtPTY0JJM1xXR3VeiIPRgb
         N/AtOXmn/JFUcUxBhMRkHKEi4ST5JRhmqvIdFivl0K5AlgnzD14No6kFB4tAoLnMhXRc
         n9X9wSpdZ6WWD0oy/GL8V+jlYafhvp7wmVSiKhGeh22UUaMI0J4LgpCbN8twZSyfxLHX
         Hm4btQ5kCFMr9pNyTFlPfVQ3hTKGrotObK1am/WGtZ59SnZoJkyDBYjxn9K7pI0THUMw
         h51g==
X-Forwarded-Encrypted: i=1; AJvYcCVumuThfr0joYHE9dBAkuTWXba2J2O9IV2dk5Ij7ToTTbayIiJEWY/laQM58mvWh/qWpUgK+X2lcWb+8OPHaWf4@lists.infradead.org
X-Gm-Message-State: AOJu0YzlViUYk+KX1a4dGcpnqmm8bSxEPrxsrgNSvy0CtRuNguEgDGy3
	flnyMCbtpZArLGtwSlY9L8nLb4LnBQ+eSAl742Ew9/LxQEuGSMnX0g5MsEu+r4NrK/kCnrBAzKO
	nhjDci6V1bC1K5GS9h/nJtrzoLWY=
X-Gm-Gg: ASbGncto/ZJSV3XquOi4ZnaMAIJxIkpUlteeqjPE+CbYiS1I8cs9G2vG4X7Ng5G0n3m
	matVCfLiiLhvu41M+0YHvhAZ9TYAJDvfhaFCz2ecfzoCPULsTCfFa25AFexQg5fahEWRkW3E6Ew
	==
X-Google-Smtp-Source: AGHT+IHRfeMzQ0Aoh2xYhp+Cojt7wbuWGTtiptGxslp7oMIdwuFGnaF7qYdJ9otu3MJ4zJT7MTKS8k5hiyeMHC9PvCA=
X-Received: by 2002:a05:6402:3708:b0:5de:a960:11ee with SMTP id
 4fb4d7f45d1cf-5dec9d2c13bmr4213243a12.5.1739428951028; Wed, 12 Feb 2025
 22:42:31 -0800 (PST)
MIME-Version: 1.0
References: <20250206105435.2159977-1-memxor@gmail.com> <20250206105435.2159977-25-memxor@gmail.com>
 <a10a2865242dc217e71de54f75fa4289aefb2fa9.camel@gmail.com>
In-Reply-To: <a10a2865242dc217e71de54f75fa4289aefb2fa9.camel@gmail.com>
From: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Date: Thu, 13 Feb 2025 07:41:53 +0100
X-Gm-Features: AWEUYZlfy_N9yrlNYupazWcc5kxeGZIJKXLNp7IF_SyEvvcsIVXNR_AiGEpDZc8
Message-ID: <CAP01T76VpVsKabq0cMjX07oDW2WTrQ2dW9NJfB0tvoXFEV5ZoQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v2 24/26] bpf: Implement verifier support for rqspinlock
To: Eduard Zingerman <eddyz87@gmail.com>
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, 
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>, Dohyun Kim <dohyunkim@google.com>, 
	linux-arm-kernel@lists.infradead.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_224232_863854_9748AE4E 
X-CRM114-Status: GOOD (  45.32  )
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

On Wed, 12 Feb 2025 at 01:08, Eduard Zingerman <eddyz87@gmail.com> wrote:
>
> On Thu, 2025-02-06 at 02:54 -0800, Kumar Kartikeya Dwivedi wrote:
> > Introduce verifier-side support for rqspinlock kfuncs. The first step is
> > allowing bpf_res_spin_lock type to be defined in map values and
> > allocated objects, so BTF-side is updated with a new BPF_RES_SPIN_LOCK
> > field to recognize and validate.
> >
> > Any object cannot have both bpf_spin_lock and bpf_res_spin_lock, only
> > one of them (and at most one of them per-object, like before) must be
> > present. The bpf_res_spin_lock can also be used to protect objects that
> > require lock protection for their kfuncs, like BPF rbtree and linked
> > list.
> >
> > The verifier plumbing to simulate success and failure cases when calling
> > the kfuncs is done by pushing a new verifier state to the verifier state
> > stack which will verify the failure case upon calling the kfunc. The
> > path where success is indicated creates all lock reference state and IRQ
> > state (if necessary for irqsave variants). In the case of failure, the
> > state clears the registers r0-r5, sets the return value, and skips kfunc
> > processing, proceeding to the next instruction.
> >
> > When marking the return value for success case, the value is marked as
> > 0, and for the failure case as [-MAX_ERRNO, -1]. Then, in the program,
> > whenever user checks the return value as 'if (ret)' or 'if (ret < 0)'
> > the verifier never traverses such branches for success cases, and would
> > be aware that the lock is not held in such cases.
> >
> > We push the kfunc state in check_kfunc_call whenever rqspinlock kfuncs
> > are invoked. We introduce a kfunc_class state to avoid mixing lock
> > irqrestore kfuncs with IRQ state created by bpf_local_irq_save.
> >
> > With all this infrastructure, these kfuncs become usable in programs
> > while satisfying all safety properties required by the kernel.
> >
> > Signed-off-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
> > ---
>
> Apart from a few nits, I think this patch looks good.
>
> Acked-by: Eduard Zingerman <eddyz87@gmail.com>
>

Thanks!

> [...]
>
> > diff --git a/include/linux/bpf_verifier.h b/include/linux/bpf_verifier.h
> > index 32c23f2a3086..ed444e44f524 100644
> > --- a/include/linux/bpf_verifier.h
> > +++ b/include/linux/bpf_verifier.h
> > @@ -115,6 +115,15 @@ struct bpf_reg_state {
> >                       int depth:30;
> >               } iter;
> >
> > +             /* For irq stack slots */
> > +             struct {
> > +                     enum {
> > +                             IRQ_KFUNC_IGNORE,
>
> Is this state ever used?
> mark_stack_slot_irq_flag() is always called with either NATIVE or LOCK.

Hm, no, it was just the default / invalid value, I guess it can be dropped.

>
> > +                             IRQ_NATIVE_KFUNC,
> > +                             IRQ_LOCK_KFUNC,
> > +                     } kfunc_class;
> > +             } irq;
> > +
> >               /* Max size from any of the above. */
> >               struct {
> >                       unsigned long raw1;
>
> [...]
>
> > @@ -8038,36 +8059,53 @@ static int process_spin_lock(struct bpf_verifier_env *env, int regno,
> >       }
> >
> >       rec = reg_btf_record(reg);
> > -     if (!btf_record_has_field(rec, BPF_SPIN_LOCK)) {
> > -             verbose(env, "%s '%s' has no valid bpf_spin_lock\n", map ? "map" : "local",
> > -                     map ? map->name : "kptr");
> > +     if (!btf_record_has_field(rec, is_res_lock ? BPF_RES_SPIN_LOCK : BPF_SPIN_LOCK)) {
> > +             verbose(env, "%s '%s' has no valid %s_lock\n", map ? "map" : "local",
> > +                     map ? map->name : "kptr", lock_str);
> >               return -EINVAL;
> >       }
> > -     if (rec->spin_lock_off != val + reg->off) {
> > -             verbose(env, "off %lld doesn't point to 'struct bpf_spin_lock' that is at %d\n",
> > -                     val + reg->off, rec->spin_lock_off);
> > +     spin_lock_off = is_res_lock ? rec->res_spin_lock_off : rec->spin_lock_off;
> > +     if (spin_lock_off != val + reg->off) {
> > +             verbose(env, "off %lld doesn't point to 'struct %s_lock' that is at %d\n",
> > +                     val + reg->off, lock_str, spin_lock_off);
> >               return -EINVAL;
> >       }
> >       if (is_lock) {
> >               void *ptr;
> > +             int type;
> >
> >               if (map)
> >                       ptr = map;
> >               else
> >                       ptr = btf;
> >
> > -             if (cur->active_locks) {
> > -                     verbose(env,
> > -                             "Locking two bpf_spin_locks are not allowed\n");
> > -                     return -EINVAL;
> > +             if (!is_res_lock && cur->active_locks) {
>
> Nit: having '&& cur->active_locks' in this branch but not the one for
>      'is_res_lock' is a bit confusing. As far as I understand this is
>      just an optimization, and active_locks check could be done (or dropped)
>      in both cases.

Yeah, I can make it consistent by adding the check to both.

>
> > +                     if (find_lock_state(env->cur_state, REF_TYPE_LOCK, 0, NULL)) {
> > +                             verbose(env,
> > +                                     "Locking two bpf_spin_locks are not allowed\n");
> > +                             return -EINVAL;
> > +                     }
> > +             } else if (is_res_lock) {
> > +                     if (find_lock_state(env->cur_state, REF_TYPE_RES_LOCK, reg->id, ptr)) {
> > +                             verbose(env, "Acquiring the same lock again, AA deadlock detected\n");
> > +                             return -EINVAL;
> > +                     }
> >               }
>
> Nit: there is no branch for find_lock_state(... REF_TYPE_RES_LOCK_IRQ ...),
>      this is not a problem, as other checks catch the imbalance in
>      number of unlocks or unlock of the same lock, but verifier won't
>      report the above "AA deadlock" message for bpf_res_spin_lock_irqsave().
>

Good point, will fix.

> The above two checks make it legal to take resilient lock while
> holding regular lock and vice versa. This is probably ok, can't figure
> out an example when this causes trouble.

Yeah, that shouldn't cause a problem.


>
> > -             err = acquire_lock_state(env, env->insn_idx, REF_TYPE_LOCK, reg->id, ptr);
> > +
> > +             if (is_res_lock && is_irq)
> > +                     type = REF_TYPE_RES_LOCK_IRQ;
> > +             else if (is_res_lock)
> > +                     type = REF_TYPE_RES_LOCK;
> > +             else
> > +                     type = REF_TYPE_LOCK;
> > +             err = acquire_lock_state(env, env->insn_idx, type, reg->id, ptr);
> >               if (err < 0) {
> >                       verbose(env, "Failed to acquire lock state\n");
> >                       return err;
> >               }
> >       } else {
> >               void *ptr;
> > +             int type;
> >
> >               if (map)
> >                       ptr = map;
>
> [...]
>

