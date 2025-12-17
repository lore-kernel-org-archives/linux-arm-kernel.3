Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C33AD66B81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:13:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqirmT9HvErvzSphhBqzWeGWtPvSLQFPQhBXr0e3bU0=; b=vQhywqyi6D75oqsaJMoJ0b82wt
	5bSurzuFDiwubva9Sn27rSFF8xGiz3pWWohhOnW+IHV4xm3RD1eCXOjRLxOPOt6GRUXJkiH8rR3TP
	Etympd/H4eeh/MOMwE65hgBMU3YIiJFtTb4Mv4uR7LI+efW+9H/ekFXAIZP/yyNWGdilVcC4u0ZSP
	FwAgi7wptQ0Yhps7Q6HcW7l0b9bJ8i9hW1mLsNaEasXXXekss12ngmqEf8ttSN2gFQSV1NNmTrEfr
	qOC2QURnbrjdbEYGvUfiJBqLjENal429+b8oCFhfKx2RU7v6SNBp+cyLxLeMC7WEKgeK6jZAUfeby
	Saao/RvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw1y-00000007Fea-3jbo;
	Wed, 17 Dec 2025 18:13:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVw1x-00000007FeT-2iew
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:13:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B007960584
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 18:13:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66A87C2BC86
	for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 18:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765995224;
	bh=hOihr4gCEyMrhfE/5QLNZU3ngeMsmPu2ZoalUdWPF/E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=ZB7G7XyJYgPpDHLzeaUCHK9ronYQ7Y7k+zR7UBAJapomfV5nghlweQ2I80oP3XHaP
	 Qi1Cjg/df+5KWMnGE4iG7Xv/pxB629cxvrhEzV09B4efzW6tCFSuVOUuUSbtD/8JD7
	 xO/XPhqts6b76us9IxLPi5K2JmhHtUCWcvPXCZ20lLiB72fQr3qDVlBAQX8QVupWHy
	 xRGqbBlpj8KaQ5XRWCdVYFguP5tc2mAKBWtXbo2RiEjSCgHTAWIUt9ZfY8nCnpKhA8
	 /14HHO+nS80QvM2DjnwNwjO0v/I5DolbN22RL0hWDBZqT9oZXKOdkCkKdaOwv/86bM
	 ZYg+Ohi2bA3IA==
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so10148973a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 10:13:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVaolo4WIxIadHJuJ7Riu8FXVhuB+4XjSw0zVhndPOEcE/wKcM0JylZsiVkxdhcIXyVD6cNqfNUB32gBy920oOT@lists.infradead.org
X-Gm-Message-State: AOJu0YxZXFpfg65kfsXsYcQu0Us2YIBZK0qeE3gC2OT2m4p4tLvhRJxE
	a/w4cgLABrA1k4n4yAvZTXJR8MY1Bd7jjtIvA7utMfThTO/bgLOu7tk42Aox+SyxIOGKY7y+1Ny
	g7jrbRGI6Mtvtkcv1UdqYFm9hsVU2doY=
X-Google-Smtp-Source: AGHT+IEhSkSchqPstPJIPXpPn/eKPQmOP0KQAc/JHCHvM8T7cryYL+WcPfKUnw9WwfmX6rK9v8Mo7Y1I0cvCUTO9jHc=
X-Received: by 2002:a05:6402:2546:b0:64b:4239:9339 with SMTP id
 4fb4d7f45d1cf-64b4239955emr3137590a12.17.1765995222735; Wed, 17 Dec 2025
 10:13:42 -0800 (PST)
MIME-Version: 1.0
References: <20251217162830.2597286-3-puranjay@kernel.org> <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
In-Reply-To: <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
From: Puranjay Mohan <puranjay@kernel.org>
Date: Wed, 17 Dec 2025 18:13:29 +0000
X-Gmail-Original-Message-ID: <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com>
X-Gm-Features: AQt7F2r2iMDKsMir3bPUYrXqtdPNxdo3VdHVQSgznCRPODB9OLKwveKSLu1fEgw
Message-ID: <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
To: bot+bpf-ci@kernel.org
Cc: bpf@vger.kernel.org, ast@kernel.org, andrii@kernel.org, 
	daniel@iogearbox.net, martin.lau@kernel.org, eddyz87@gmail.com, 
	memxor@gmail.com, kernel-team@meta.com, catalin.marinas@arm.com, 
	will@kernel.org, mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org, 
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Content-Type: text/plain; charset="UTF-8"
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

On Wed, Dec 17, 2025 at 4:56=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
>
> > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > index 2da986136d26..654fb94bf60c 100644
> > --- a/include/linux/bpf.h
> > +++ b/include/linux/bpf.h
>
> [ ... ]
>
> > @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> >
> >  static inline bool bpf_prog_get_recursion_context(struct bpf_prog *pro=
g)
> >  {
> > +#ifdef CONFIG_ARM64
> > +     u8 rctx =3D interrupt_context_level();
> > +     u8 *active =3D this_cpu_ptr(prog->active);
> > +
> > +     active[rctx]++;
> > +     barrier();
> > +     if (get_unaligned_le32(active) !=3D BIT(rctx * 8))
> > +             return false;
> > +
> > +     return true;
> > +#else
> >       return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> > +#endif
> >  }
>
> Can preemption between the increment and check cause a counter leak on
> CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> (documented at include/linux/rcupdate.h:856).
>
> Consider this scenario on an ARM64 system with PREEMPT_RCU:
>
> 1. Thread A increments active[0] to 1
> 2. Preemption occurs before Thread A reaches the check
> 3. Thread B on same CPU increments active[0] to 2
> 4. Thread B checks: sees 2 !=3D BIT(0), returns false
> 5. Thread A resumes, checks: sees 2 !=3D BIT(0), returns false
> 6. Both threads return false, neither runs BPF
> 7. Neither calls bpf_prog_put_recursion_context() (see
>    __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> 8. Counter permanently stuck at 2, all future BPF on this CPU fails

Step 7 is incorrect. Looking at the JIT-generated code, the exit
function is ALWAYS called, regardless of whether the enter function
returns 0 or a start time:

  // x86 JIT at arch/x86/net/bpf_jit_comp.c:2998-3050
  call bpf_trampoline_enter()    // Line 2998
  test rax, rax                   // Line 3006
  je skip_exec                    // Conditional jump
  ... BPF program execution ...   // Lines 3011-3023
  skip_exec:                      // Line 3037 (jump lands here)
  call bpf_trampoline_exit()      // Line 3049 - ALWAYS executed

  The bpf_trampoline_exit() call is after the skip_exec label, so it
executes in both cases.

What Actually Happens:

  Initial state: active[0] =3D 0

  Thread A (normal context, rctx=3D0):
  1. active[0]++ =E2=86=92 active[0] =3D 1
  2. Preempted before barrier()

  Thread B (scheduled on same CPU, normal context, rctx=3D0):
  3. active[0]++ =E2=86=92 active[0] =3D 2
  4. barrier()
  5. get_unaligned_le32(active) =E2=86=92 reads 0x00000002
  6. Check: 0x00000002 !=3D BIT(0) =3D 0x00000001 =E2=86=92 returns false
  7. __bpf_prog_enter_recur returns 0
  8. JIT checks return value, skips BPF execution
  9. JIT ALWAYS calls __bpf_prog_exit_recur (see
arch/arm64/net/bpf_jit_comp.c:2362)
  10. bpf_prog_put_recursion_context(prog) executes
  11. barrier(), active[0]-- =E2=86=92 active[0] =3D 1

  Thread A resumes:
  12. barrier()
  13. get_unaligned_le32(active) =E2=86=92 reads 0x00000001 (Thread B alrea=
dy
decremented!)
  14. Check: 0x00000001 =3D=3D BIT(0) =3D 0x00000001 =E2=86=92 returns true=
 =E2=9C=93
  15. __bpf_prog_enter_recur returns start_time
  16. BPF program executes
  17. __bpf_prog_exit_recur called
  18. bpf_prog_put_recursion_context(prog) executes
  19. barrier(), active[0]-- =E2=86=92 active[0] =3D 0 =E2=9C=93

  Final State

  - Counter returns to 0 =E2=9C=93
  - No leak =E2=9C=93
  - Thread B detected interference and aborted =E2=9C=93
  - Thread A executed successfully =E2=9C=93
  - Only ONE thread executed the BPF program =E2=9C=93


Now that I think of it, there is another race condition that leads to
NEITHER program running:

Consider this scenario on an arm64 system with PREEMPT_RCU:

1. Thread A increments active[0] from 0 to 1
2. Thread A is preempted before reaching barrier()
3. Thread B (same CPU, same context) increments active[0] from 1 to 2
4. Thread B executes barrier() and checks: sees 2 !=3D BIT(0), returns fals=
e
5. Thread A resumes, executes barrier() and checks: sees 2 !=3D BIT(0),
returns false
6. Both threads return false to __bpf_prog_enter_recur()
7. Both skip BPF program execution
8. Both call bpf_prog_put_recursion_context() and decrement: 2->1->0
9. Neither BPF program executes, but the counter correctly returns to 0

This means the patch is changing the behaviour in case of recursion
from "One program gets to run" to
"At most one program gets to run", but given the performance benefits,
I think we can accept this change.
I am not sure what would change in reality if we allow both BPF
programs to be skipped in case of high interleaving
like above.

> The old atomic code handled this correctly because this_cpu_inc_return()
> completes atomically, ensuring Thread A reads the value 1 before Thread B
> can interfere. With non-atomic operations, Thread A increments but hasn't
> read the value yet, allowing Thread B to interfere and cause both threads
> to see the modified value.
>
> Is there a guarantee that same-context preemption cannot occur in the BPF
> execution path on ARM64, or does this need additional synchronization?
>
> > @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> >
> >  static inline void bpf_prog_put_recursion_context(struct bpf_prog *pro=
g)
> >  {
> > +#ifdef CONFIG_ARM64
> > +     u8 rctx =3D interrupt_context_level();
> > +     u8 *active =3D this_cpu_ptr(prog->active);
> > +
> > +     barrier();
> > +     active[rctx]--;
> > +#else
> >       this_cpu_dec(*(prog->active));
> > +#endif
> >  }
>
> The barrier() is placed before the decrement. Does this provide the neede=
d
> ordering guarantee, or should there also be a barrier after the decrement
> to ensure visibility?
>
> > diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > index c66316e32563..b5063acfcf92 100644
> > --- a/kernel/bpf/core.c
> > +++ b/kernel/bpf/core.c
>
> [ ... ]
>
> > @@ -112,7 +112,8 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned i=
nt size, gfp_t gfp_extra_flag
> >               vfree(fp);
> >               return NULL;
> >       }
> > -     fp->active =3D alloc_percpu_gfp(int, bpf_memcg_flags(GFP_KERNEL |=
 gfp_extra_flags));
> > +     fp->active =3D __alloc_percpu_gfp(sizeof(u8[BPF_NR_CONTEXTS]), 8,
> > +                                     bpf_memcg_flags(GFP_KERNEL | gfp_=
extra_flags));
>
> The allocation changes to u8[4] for all architectures, but the non-ARM64
> code path still uses *(prog->active) which now dereferences only the firs=
t
> byte. This changes the counter from int (typically 4 bytes, range ~2^31)
> to u8 (1 byte, range 256). While 256 recursion levels is sufficient in
> practice, is this intentional for non-ARM64 platforms, or should they
> continue using a full int-sized allocation?

This was intentional so that we don't add another #ifdef here, 256
recursion levels are more than enough.
But to keep the previous recursion levels, I could change the non
ARM64 code to do something like:

this_cpu_dec(*(int __percpu *)(prog->active));

I can do this in the next version.

Thanks,
Puranjay

