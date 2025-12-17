Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFA3BD66BBB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 22:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9H54kmn96vNV3ygwYbBRomzNZ50c+SuQtzurnnIVdFI=; b=qcSHnQZSCs6gwYyWE1SG7Iy3aE
	ZOz9oSkbDkEECMf3q8XFJn7UfQ7DVbvAf+buLsRRO3ungCsyFTOS9IHBGTBDQ7fLGNnEBggFAEOag
	Vzm2VsOZadAuGNKc5Uw23ZBi8QUoEiRI4IHYXIpt+eGIvq9JyXrNmTywVuVqQEjeq22/wobQ0U7c6
	5vKZYR99zTb4rFsrY4ugSVpnJ0PRAyVunfWaCyLSTUcPrn1OcJAVBmgbEvP7yHzYU0yk+IT9kbbxz
	hrAEjtrQoEqx355sm6wn1ASo28dlZH6+KzA9QOdrKVDl8Sgxn9YiWd2bUjWc82kxYtuhqpWvkAOmH
	HEwzI1Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW01c-00000007U1l-2URo;
	Wed, 17 Dec 2025 22:29:40 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW01a-00000007U1M-2OEf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 22:29:39 +0000
Received: by mail-ed1-x52d.google.com with SMTP id 4fb4d7f45d1cf-640a0812658so10459559a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 14:29:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766010576; x=1766615376; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9H54kmn96vNV3ygwYbBRomzNZ50c+SuQtzurnnIVdFI=;
        b=fy6oIhwfrnyU/x58xQFkG4PgG+UOmiqsxZAjkq4vwXQpfS/cXzbs2NNALFeYMHrG30
         +xMujh2s+e/V9EoKoj+Aj9Q5Q+kDLyd3pJrVMCrLmL+OLdVU9VM5MyeZGl8jKtiQSnij
         xRvqSzsa/yMsiVuZvGqbboWReItv+hd8JLYfDtnJ7oB3k7QGlYIwUVixIeeZQO0Rxb4K
         CMDkRFIx/IrbjCLhnsmpRVMAAC8Yl4lsSw3V48JYWdKzElChylEM3o5m0cTP3Y8oGV5w
         uNTJuODOTEWt0X0fElAIDLUv/Z4ZtkqdXNe2tPvDO70V+J3WYRURmODqyiC65CJGyJ4O
         Wo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766010576; x=1766615376;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9H54kmn96vNV3ygwYbBRomzNZ50c+SuQtzurnnIVdFI=;
        b=Ji15MLhBVU6fcGCjWYJGeRHUMndKh8Q7PszbfDLE58mLUn2QNgMMYgBYBdmSrU3Q+n
         6hZ+l12wXqL5pzu4KYxw5P04iUWoiEEuVIZXgFtdDSDxZeDTdthzj0sU5827iMJeOkji
         efAJg39p1z3ilvEZZDWlLq9VcP3GHBn+6lkIiIKbuUlr2x2X+BI84aJnI31qaGVW4M/m
         4nx09mTYvbv1FuXS8tIME2QTHq/8Fg7/WS7cGv4fy5rWxcVnNmYSCXODtIVYvjw6MMuS
         xO7BjkakO4hqx2yP5sp3Dy6xfyPv0qaN5VzlPZxrwL6Y+ZKrXhApyXF1M1EHzsW3uH6s
         /dOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUMsDLe99BHUjeLbe4TIZzV+tea/St5EDRW5dajmFJ6XVAHNcRhJ2JJPZcztr1PfqExeM+XESEAOi8mue7GuYg6@lists.infradead.org
X-Gm-Message-State: AOJu0Yz4Cyr8LTLEmX/b8Ei8zFngcpZ0GWs+fNoKVnq7WNmw/GNlWig6
	srLQV5Ceh5vHZDWRGuEmc4QmT7yw2LYEVRm9cLjwUeEyNntC+t+UDK1lmbM0LXmsavUkxXg5ePa
	IB31WuJTdgJBKVLUyT1Lc1dznq1FvaK4=
X-Gm-Gg: AY/fxX5ctFTZsuCS6Ho4REXsc54mxKcDTzXRfhp4xKYcMmD9qj+H+/ud9jDVUbmlhQs
	E2TZhvr89mC6c0J8FseNJhVzq/sPVzRugUs+QurgFDG+NlMUXwkzl7sRljtGDgBDxD+LLg0mh4G
	QsYI0aQWsfV9b/yIWGdsj4YQk4fvJ3VLejo22EnkqViPayvfbsb3A9UAu+sII0ce61JGAk31fAJ
	/ysMROFd0y0VlKQoxXTQAI5b9TJxebOZcMMubyXsBNJY4apCgyG4ZBySIIM6JmJbtFg72feb85z
	n4SYAxdNtYA=
X-Google-Smtp-Source: AGHT+IHy0SPC7NZr09ACBkL+rzU7+b/jgSqQD84mqbjPUZWVOXQVxca90u4aU06tyBxNkzJ7qSjRrdzf2U7LHwjmhAk=
X-Received: by 2002:a05:6402:35ce:b0:63c:3c63:75ed with SMTP id
 4fb4d7f45d1cf-6499b1c6ab0mr18878629a12.22.1766010576228; Wed, 17 Dec 2025
 14:29:36 -0800 (PST)
MIME-Version: 1.0
References: <20251217162830.2597286-3-puranjay@kernel.org> <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com>
 <CAADnVQ+E6Tgcf1E5x-wk_TA+Lz83cA=SL8EZUGL70bQpywwexg@mail.gmail.com>
 <CANk7y0jNj0SDOBr=3n_0jhQbLzaj--yVUF4oDA-ManQG-=bkhw@mail.gmail.com> <a0c04178-2159-4475-9be8-93320ffc2138@linux.dev>
In-Reply-To: <a0c04178-2159-4475-9be8-93320ffc2138@linux.dev>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 17 Dec 2025 22:29:23 +0000
X-Gm-Features: AQt7F2pS1XvtGfaw6CsXi5lqqcqMe8RcxTask6GUikNhKVbwDkxTVzHOwPa4ixM
Message-ID: <CANk7y0hs2E6SVuxt1oHRFek0TD4y0DVP63755K5jxGd9BM3VwQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
To: Yonghong Song <yonghong.song@linux.dev>
Cc: Alexei Starovoitov <alexei.starovoitov@gmail.com>, bot+bpf-ci@kernel.org, 
	bpf <bpf@vger.kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Andrii Nakryiko <andrii@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Kernel Team <kernel-team@meta.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_142938_673259_5A8BB386 
X-CRM114-Status: GOOD (  29.83  )
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

On Wed, Dec 17, 2025 at 9:32=E2=80=AFPM Yonghong Song <yonghong.song@linux.=
dev> wrote:
>
>
>
> On 12/17/25 10:56 AM, Puranjay Mohan wrote:
> > On Wed, Dec 17, 2025 at 6:46=E2=80=AFPM Alexei Starovoitov
> > <alexei.starovoitov@gmail.com> wrote:
> >> On Wed, Dec 17, 2025 at 10:13=E2=80=AFAM Puranjay Mohan <puranjay@kern=
el.org> wrote:
> >>> On Wed, Dec 17, 2025 at 4:56=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote=
:
> >>>>> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> >>>>> index 2da986136d26..654fb94bf60c 100644
> >>>>> --- a/include/linux/bpf.h
> >>>>> +++ b/include/linux/bpf.h
> >>>> [ ... ]
> >>>>
> >>>>> @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> >>>>>
> >>>>>   static inline bool bpf_prog_get_recursion_context(struct bpf_prog=
 *prog)
> >>>>>   {
> >>>>> +#ifdef CONFIG_ARM64
> >>>>> +     u8 rctx =3D interrupt_context_level();
> >>>>> +     u8 *active =3D this_cpu_ptr(prog->active);
> >>>>> +
> >>>>> +     active[rctx]++;
> >>>>> +     barrier();
> >>>>> +     if (get_unaligned_le32(active) !=3D BIT(rctx * 8))
> >>>>> +             return false;
> >>>>> +
> >>>>> +     return true;
> >>>>> +#else
> >>>>>        return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> >>>>> +#endif
> >>>>>   }
> >>>> Can preemption between the increment and check cause a counter leak =
on
> >>>> CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> >>>> rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> >>>> (documented at include/linux/rcupdate.h:856).
> >>>>
> >>>> Consider this scenario on an ARM64 system with PREEMPT_RCU:
> >>>>
> >>>> 1. Thread A increments active[0] to 1
> >>>> 2. Preemption occurs before Thread A reaches the check
> >>>> 3. Thread B on same CPU increments active[0] to 2
> >>>> 4. Thread B checks: sees 2 !=3D BIT(0), returns false
> >>>> 5. Thread A resumes, checks: sees 2 !=3D BIT(0), returns false
> >>>> 6. Both threads return false, neither runs BPF
> >>>> 7. Neither calls bpf_prog_put_recursion_context() (see
> >>>>     __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> >>>> 8. Counter permanently stuck at 2, all future BPF on this CPU fails
> >>> Step 7 is incorrect. Looking at the JIT-generated code, the exit
> >>> function is ALWAYS called, regardless of whether the enter function
> >>> returns 0 or a start time:
> >>>
> >>>    // x86 JIT at arch/x86/net/bpf_jit_comp.c:2998-3050
> >>>    call bpf_trampoline_enter()    // Line 2998
> >>>    test rax, rax                   // Line 3006
> >>>    je skip_exec                    // Conditional jump
> >>>    ... BPF program execution ...   // Lines 3011-3023
> >>>    skip_exec:                      // Line 3037 (jump lands here)
> >>>    call bpf_trampoline_exit()      // Line 3049 - ALWAYS executed
> >>>
> >>>    The bpf_trampoline_exit() call is after the skip_exec label, so it
> >>> executes in both cases.
> >>>
> >>> What Actually Happens:
> >>>
> >>>    Initial state: active[0] =3D 0
> >>>
> >>>    Thread A (normal context, rctx=3D0):
> >>>    1. active[0]++ =E2=86=92 active[0] =3D 1
> >>>    2. Preempted before barrier()
> >>>
> >>>    Thread B (scheduled on same CPU, normal context, rctx=3D0):
> >>>    3. active[0]++ =E2=86=92 active[0] =3D 2
> >>>    4. barrier()
> >>>    5. get_unaligned_le32(active) =E2=86=92 reads 0x00000002
> >>>    6. Check: 0x00000002 !=3D BIT(0) =3D 0x00000001 =E2=86=92 returns =
false
> >>>    7. __bpf_prog_enter_recur returns 0
> >>>    8. JIT checks return value, skips BPF execution
> >>>    9. JIT ALWAYS calls __bpf_prog_exit_recur (see
> >>> arch/arm64/net/bpf_jit_comp.c:2362)
> >>>    10. bpf_prog_put_recursion_context(prog) executes
> >>>    11. barrier(), active[0]-- =E2=86=92 active[0] =3D 1
> >>>
> >>>    Thread A resumes:
> >>>    12. barrier()
> >>>    13. get_unaligned_le32(active) =E2=86=92 reads 0x00000001 (Thread =
B already
> >>> decremented!)
> >>>    14. Check: 0x00000001 =3D=3D BIT(0) =3D 0x00000001 =E2=86=92 retur=
ns true =E2=9C=93
> >>>    15. __bpf_prog_enter_recur returns start_time
> >>>    16. BPF program executes
> >>>    17. __bpf_prog_exit_recur called
> >>>    18. bpf_prog_put_recursion_context(prog) executes
> >>>    19. barrier(), active[0]-- =E2=86=92 active[0] =3D 0 =E2=9C=93
> >>>
> >>>    Final State
> >>>
> >>>    - Counter returns to 0 =E2=9C=93
> >>>    - No leak =E2=9C=93
> >>>    - Thread B detected interference and aborted =E2=9C=93
> >>>    - Thread A executed successfully =E2=9C=93
> >>>    - Only ONE thread executed the BPF program =E2=9C=93
> >>>
> >>>
> >>> Now that I think of it, there is another race condition that leads to
> >>> NEITHER program running:
> >>>
> >>> Consider this scenario on an arm64 system with PREEMPT_RCU:
> >>>
> >>> 1. Thread A increments active[0] from 0 to 1
> >>> 2. Thread A is preempted before reaching barrier()
> >>> 3. Thread B (same CPU, same context) increments active[0] from 1 to 2
> >>> 4. Thread B executes barrier() and checks: sees 2 !=3D BIT(0), return=
s false
> >>> 5. Thread A resumes, executes barrier() and checks: sees 2 !=3D BIT(0=
),
> >>> returns false
> >>> 6. Both threads return false to __bpf_prog_enter_recur()
> >>> 7. Both skip BPF program execution
> >>> 8. Both call bpf_prog_put_recursion_context() and decrement: 2->1->0
> >>> 9. Neither BPF program executes, but the counter correctly returns to=
 0
> >>>
> >>> This means the patch is changing the behaviour in case of recursion
> >>> from "One program gets to run" to
> >>> "At most one program gets to run", but given the performance benefits=
,
> >>> I think we can accept this change.
> >> Agree. It's fine, but we can mitigate it, but doing this rctx trick
> >> only when RCU is not preemptable. Which pretty much would mean
> >> that PREEMPT_RT will use atomic and !RT will use rctx
> >> and this 'no prog executes' will not happen.
> >
> > The issue is also with sleepable programs, they use
> > rcu_read_lock_trace() and can end up with
> > 'no prog executes' scenario.
> >
> > What do you think is the best approach for them?
>
> For sleepable programs, maybe we can use the original approach like
>    return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> ?
> This should solve the 'no prog execution' issue.


I tried putting preempt_disable/enable() around inc+read in entry and
dec in exit:

New data, a little different config, so ignore exact values.

This patch:                           56.524M/s
This patch with preempt_disable():    53.856M/s
bpf-next/master:                      43.067M/s
bpf-next/master without Catalin fix:  51.862M/s


This is still very good and covers the sleepable case as well. So let's do =
this?

Thanks,
Puranjay

