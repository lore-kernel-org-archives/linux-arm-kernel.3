Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CCFD66B85
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GtiU/2clMBttef5AKMoDZy0XlbtAsCi9HawhyqUoC2g=; b=GIhRZoKMFNdWphst8EsBPKpnPO
	6DK1i9+l/Wl0iHDOauNFsBr6Ok/EFvyP5BQWjpVUxeL0Zu07f00KT+s/4Bi7+CFzNOxGP4LkDabyl
	gFXUnMv9965OV7BhuRhGwYOguEvDzroLT9ngHBsjAKYb+ZYrDf2d8ibYq0JksaG7ug6A48ybOGIyQ
	ArKNPKxseeHuyqDR9p6GOIs2jBcSsdaUeghpDQbIXXEsQQvvaNgZAGx1JuKU6VZNNREB9XXUEJbh9
	x6TGgzqqnxFB2DN/jI4mUvWjDbbTMv+80TKPeCyw4qHHrTClqRxZbbC1D3vlm7++GTgUJEqURjjZg
	Jb7AJmrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwhd-00000007IO7-2pek;
	Wed, 17 Dec 2025 18:56:49 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwha-00000007INi-4Bll
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:56:48 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b72b495aa81so1073855166b.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 10:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765997805; x=1766602605; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GtiU/2clMBttef5AKMoDZy0XlbtAsCi9HawhyqUoC2g=;
        b=DqIvxPWu9aFpTL9cah2DQVmv7Ibv9yfNOLDTVc1e6HhtpWNGAGx07eIv4dUb1N4t+N
         XYz8CDN0gpAm19HMk3GniR5wBIICYVOtT8LWCRAdzYbvtMl10hqoVy6gUhdGw5+hUMss
         xs6w+wmdl0nbC0rTfpIGPfcHXbnPoYY4vMHi4UJ28odVrK52vfC+h6SnWI4R1GDra06J
         m06UNuRGaHySrqcALJB8E4uEMlybr6u24An2OC1RcSVfc45AtRZ8Ov1tgqW+6ulSc7NI
         Fo9g8gj1MCiiB0HuIZezOkrc+OO8zSs95FVhOkxw6sITu8YMXAzvZAPuZfa3kou69kk9
         X9Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765997805; x=1766602605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GtiU/2clMBttef5AKMoDZy0XlbtAsCi9HawhyqUoC2g=;
        b=C0fsAKb32k2H1VmaTwK5yUl8gy+vPHiCCHcoc/H09dAtgFL7k2Uzwd3CjdCGl7fKI2
         V7lLA2gmJd3WlfQSW2ZlDHWAG3pqIQxAP9g8DRnFopfKUrLeaOJglYDIbnA01eVQDs01
         qzlErSkQdXMAcUgrySM2ruM21Dh0DAv99/4szFe0FRH7ThsysXzBoUYPYLP4hTUsGL77
         MrpUhKDQHSHvsRzZCcK6n6YLmADP7adx52xiZ0ZK2KFigq1H12iKbYimN1Qf2mWVRzI/
         Ne2iA+3Pn3y59rQsbYVZ654GhL6wHn9J/OBDDipC5ORRzeEzRJIsSDwWJ/avALbHHaOQ
         YyxA==
X-Forwarded-Encrypted: i=1; AJvYcCXvKj1sMUyJ1cRxnRxyxwWgc9gXRRheYI+xYzsgArcN9fWUP5/slNdCzs8hHK0Ot04WOCV9BhAO7Zxsa9runQS2@lists.infradead.org
X-Gm-Message-State: AOJu0YzYvv+porJrLBAhD5cgWJL00ap74wWxKkVx4ZD7+GjWqnBfUk8Y
	PUSBs84WnJEhxlSFcOb2/gqq9jm/rHRtWT33dYesZeC0knNA4BxAzgRduh3mx7rNBvpz1Ox+lv5
	yoyvFuYbKZODIpNlSUQOpdzCxf3MIPfw=
X-Gm-Gg: AY/fxX5jKOU/U9NPZep69mPYkDJupBZSM9RGZWnO0WrQNq9owcdlprxjradsv+Z672z
	j0H8IurW8QbuJ3aeRFCP86lGf3T/8qoM60Ksp01l5TCrXi67DW3a2nTnKeVBf6G5nr2NWufnOyi
	lRodIiOfE7ocaJN9h50TaugbRw4CxvU8PnLUJ7xAwtyhltCPyGdcdCFvk609Ogsc1Hn3ULQRBhE
	OO/rW5kxQj5sf2WQYb8Zpyck/7v6sPFONtMD0uPPRbFmDXH6gQpKQr7j4MpBt3nUVa2dK8tcPTk
	O8CC+qvLPts=
X-Google-Smtp-Source: AGHT+IEfi7Vyy1yRCus1ZuFKFQihTwTTNqloTTDJXE/9K4O4ppNrwV31Rjl8S7kTvepHHbBWbJjxHDmnO8oaHLrUqMs=
X-Received: by 2002:a17:906:f5a3:b0:b7d:1cbb:5d29 with SMTP id
 a640c23a62f3a-b7d23ad698dmr1758130666b.36.1765997804403; Wed, 17 Dec 2025
 10:56:44 -0800 (PST)
MIME-Version: 1.0
References: <20251217162830.2597286-3-puranjay@kernel.org> <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com> <CAADnVQ+E6Tgcf1E5x-wk_TA+Lz83cA=SL8EZUGL70bQpywwexg@mail.gmail.com>
In-Reply-To: <CAADnVQ+E6Tgcf1E5x-wk_TA+Lz83cA=SL8EZUGL70bQpywwexg@mail.gmail.com>
From: Puranjay Mohan <puranjay12@gmail.com>
Date: Wed, 17 Dec 2025 18:56:30 +0000
X-Gm-Features: AQt7F2q5M8-DeFJwvLAnx1rE-WEEZp2rZ4czRk_Nxz9WqbfN28-XP_vVyjYOBkM
Message-ID: <CANk7y0jNj0SDOBr=3n_0jhQbLzaj--yVUF4oDA-ManQG-=bkhw@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: bot+bpf-ci@kernel.org, bpf <bpf@vger.kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Andrii Nakryiko <andrii@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Martin KaFai Lau <martin.lau@kernel.org>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Kernel Team <kernel-team@meta.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_105647_089278_CA896B5B 
X-CRM114-Status: GOOD (  30.43  )
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

On Wed, Dec 17, 2025 at 6:46=E2=80=AFPM Alexei Starovoitov
<alexei.starovoitov@gmail.com> wrote:
>
> On Wed, Dec 17, 2025 at 10:13=E2=80=AFAM Puranjay Mohan <puranjay@kernel.=
org> wrote:
> >
> > On Wed, Dec 17, 2025 at 4:56=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
> > >
> > > > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > > > index 2da986136d26..654fb94bf60c 100644
> > > > --- a/include/linux/bpf.h
> > > > +++ b/include/linux/bpf.h
> > >
> > > [ ... ]
> > >
> > > > @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> > > >
> > > >  static inline bool bpf_prog_get_recursion_context(struct bpf_prog =
*prog)
> > > >  {
> > > > +#ifdef CONFIG_ARM64
> > > > +     u8 rctx =3D interrupt_context_level();
> > > > +     u8 *active =3D this_cpu_ptr(prog->active);
> > > > +
> > > > +     active[rctx]++;
> > > > +     barrier();
> > > > +     if (get_unaligned_le32(active) !=3D BIT(rctx * 8))
> > > > +             return false;
> > > > +
> > > > +     return true;
> > > > +#else
> > > >       return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> > > > +#endif
> > > >  }
> > >
> > > Can preemption between the increment and check cause a counter leak o=
n
> > > CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> > > rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> > > (documented at include/linux/rcupdate.h:856).
> > >
> > > Consider this scenario on an ARM64 system with PREEMPT_RCU:
> > >
> > > 1. Thread A increments active[0] to 1
> > > 2. Preemption occurs before Thread A reaches the check
> > > 3. Thread B on same CPU increments active[0] to 2
> > > 4. Thread B checks: sees 2 !=3D BIT(0), returns false
> > > 5. Thread A resumes, checks: sees 2 !=3D BIT(0), returns false
> > > 6. Both threads return false, neither runs BPF
> > > 7. Neither calls bpf_prog_put_recursion_context() (see
> > >    __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> > > 8. Counter permanently stuck at 2, all future BPF on this CPU fails
> >
> > Step 7 is incorrect. Looking at the JIT-generated code, the exit
> > function is ALWAYS called, regardless of whether the enter function
> > returns 0 or a start time:
> >
> >   // x86 JIT at arch/x86/net/bpf_jit_comp.c:2998-3050
> >   call bpf_trampoline_enter()    // Line 2998
> >   test rax, rax                   // Line 3006
> >   je skip_exec                    // Conditional jump
> >   ... BPF program execution ...   // Lines 3011-3023
> >   skip_exec:                      // Line 3037 (jump lands here)
> >   call bpf_trampoline_exit()      // Line 3049 - ALWAYS executed
> >
> >   The bpf_trampoline_exit() call is after the skip_exec label, so it
> > executes in both cases.
> >
> > What Actually Happens:
> >
> >   Initial state: active[0] =3D 0
> >
> >   Thread A (normal context, rctx=3D0):
> >   1. active[0]++ =E2=86=92 active[0] =3D 1
> >   2. Preempted before barrier()
> >
> >   Thread B (scheduled on same CPU, normal context, rctx=3D0):
> >   3. active[0]++ =E2=86=92 active[0] =3D 2
> >   4. barrier()
> >   5. get_unaligned_le32(active) =E2=86=92 reads 0x00000002
> >   6. Check: 0x00000002 !=3D BIT(0) =3D 0x00000001 =E2=86=92 returns fal=
se
> >   7. __bpf_prog_enter_recur returns 0
> >   8. JIT checks return value, skips BPF execution
> >   9. JIT ALWAYS calls __bpf_prog_exit_recur (see
> > arch/arm64/net/bpf_jit_comp.c:2362)
> >   10. bpf_prog_put_recursion_context(prog) executes
> >   11. barrier(), active[0]-- =E2=86=92 active[0] =3D 1
> >
> >   Thread A resumes:
> >   12. barrier()
> >   13. get_unaligned_le32(active) =E2=86=92 reads 0x00000001 (Thread B a=
lready
> > decremented!)
> >   14. Check: 0x00000001 =3D=3D BIT(0) =3D 0x00000001 =E2=86=92 returns =
true =E2=9C=93
> >   15. __bpf_prog_enter_recur returns start_time
> >   16. BPF program executes
> >   17. __bpf_prog_exit_recur called
> >   18. bpf_prog_put_recursion_context(prog) executes
> >   19. barrier(), active[0]-- =E2=86=92 active[0] =3D 0 =E2=9C=93
> >
> >   Final State
> >
> >   - Counter returns to 0 =E2=9C=93
> >   - No leak =E2=9C=93
> >   - Thread B detected interference and aborted =E2=9C=93
> >   - Thread A executed successfully =E2=9C=93
> >   - Only ONE thread executed the BPF program =E2=9C=93
> >
> >
> > Now that I think of it, there is another race condition that leads to
> > NEITHER program running:
> >
> > Consider this scenario on an arm64 system with PREEMPT_RCU:
> >
> > 1. Thread A increments active[0] from 0 to 1
> > 2. Thread A is preempted before reaching barrier()
> > 3. Thread B (same CPU, same context) increments active[0] from 1 to 2
> > 4. Thread B executes barrier() and checks: sees 2 !=3D BIT(0), returns =
false
> > 5. Thread A resumes, executes barrier() and checks: sees 2 !=3D BIT(0),
> > returns false
> > 6. Both threads return false to __bpf_prog_enter_recur()
> > 7. Both skip BPF program execution
> > 8. Both call bpf_prog_put_recursion_context() and decrement: 2->1->0
> > 9. Neither BPF program executes, but the counter correctly returns to 0
> >
> > This means the patch is changing the behaviour in case of recursion
> > from "One program gets to run" to
> > "At most one program gets to run", but given the performance benefits,
> > I think we can accept this change.
>
> Agree. It's fine, but we can mitigate it, but doing this rctx trick
> only when RCU is not preemptable. Which pretty much would mean
> that PREEMPT_RT will use atomic and !RT will use rctx
> and this 'no prog executes' will not happen.


The issue is also with sleepable programs, they use
rcu_read_lock_trace() and can end up with
'no prog executes' scenario.

What do you think is the best approach for them?

