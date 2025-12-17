Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 573A7D66B81
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 18:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/lG992SzARwSD2CfwNAdMfhT0lO+gSHnEw3eG59WhYA=; b=iDYQTKVC2zxMjKBkFVQMmJhw0y
	XxwxWsRZlkcI0+KTZwLrUsa/BDS2O/4PMMyuX11mH3NYeDz41sG1MJcLtpgFloEl5pVMXrwBR7oQQ
	IzMJaox51oUKfhLQT3J1hyWOzmnjaij3JxJqBhRa6QdPNs6GrwfXt/qLga1M3d2EYyPhdlAhKvM5S
	84XRW794H8XccOxYc6De5SFf/ywF9szz3qHk7uiHHb37hk/cbEl29+b5mM3zW00MW1CYsRzu3RkuR
	zXjhiujzqtLt7OR5nuOsIDZHDN9IZCQ210fNAUBjEZWyTTokC0C9ncMchrUn9jsUuPJ9JwfM+CrNB
	M3nQvKlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwXk-00000007HtG-3qtn;
	Wed, 17 Dec 2025 18:46:36 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVwXi-00000007Hsu-36nQ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 18:46:35 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-42fb0fc5aa4so4390969f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 10:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765997192; x=1766601992; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/lG992SzARwSD2CfwNAdMfhT0lO+gSHnEw3eG59WhYA=;
        b=RFxDZqiNNmnfuWs94q+QT/lc/cB8XZ//8bN0IqQx98o7aPtAoyIkQ9qkqVE+yb1weQ
         Z3qfHp8h1awo85S1U4L8z3+/68EppDnO/787MsyXsQZaeqAyIWSjmOi6gJzCWbToIFF5
         dIpVmFitz9GWKKQccbD9duRc7IEdmmrbv3v3nEoFzViUf2JAhFTXUk7oP37HXVmMXskz
         puuWHBHbIYhqtBJ/3tEuJK/nwltBRwFga/8x0jXh78TY7UrTHpyN7OsgEbPPwlAecuUA
         C5BKZFYitdXdW6+rwZGQNsiNsHNeHP3vGYmlVwlTvOe9aKBT/y03yop0nX+Xpfjyd+JC
         HqxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765997192; x=1766601992;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/lG992SzARwSD2CfwNAdMfhT0lO+gSHnEw3eG59WhYA=;
        b=eM3gw3lHxZta4MYqd5h45m/v3m4kn9+lLeDf/nh0dm6sHrCyzjOjq2mVsXKV167CJY
         Hh7pbQUN7FmYrfIn6ERXRxVFUolwDiGWQyvv76BRmbTJJ+RAmnFCIcmiB6qwIit0UJEe
         2T+YczVDKHPbLaaeOhETv2PM0drwHZehl/NwWwRSHLoYrJ3riMifhirDdp0VNAcOsX0T
         NAMrnE9FIsqlMintP4SK5gdh32X70QKv+ylhUT9ThHCvUzVkChkdvgQ5v/lnPb5R6f3N
         o+y5OjOWBmVhNGc5a3uqEtqbFujLWWWelFUdHK+I9LgjW/rYH/nwVoLtiaVB1OTKF67+
         6k8A==
X-Forwarded-Encrypted: i=1; AJvYcCWRUoWfSZ82Kbs7tfYBxa19SWqF/pm65xlrwCqLSbWMh8CDdfFGSNl4+VzptRikYzJfrSi8Yb3+PddrfsWSm3MC@lists.infradead.org
X-Gm-Message-State: AOJu0Ywim3nrOpf6XO5zyE2ew5+i7EJJr5sqd1BTLmy17fdNsOn420ed
	6lGZFuf5BaYKMes8x2uj3qLbNrzK/HNxIMfL6QgC8xQrZRhIAA182vfP8maj3Ys8ECBIBSqE91W
	K3p9x0EAGCz17Nae8/hZJ6Cpuia2sQKg=
X-Gm-Gg: AY/fxX6+4Fp2LkpaBQ8ckZl0R2Zp2MmFSyYYARGNqYPUCLtPppLWobnfstqyPYG3asB
	AIVxtu7SagM4yz6gVeofLuPh7TI6EjvwtPMgmLmjbZSgRpXIvtZnLKowTMH+s6bz+HTyvJNiktv
	9gkzoxTaWCG1SNSvV0AKpcuHzXilCnpbSIj4pjJnbQ3efstZJv66H+ocT+9NvKCUmgEbV/wwoEC
	sMAWdY8Ia/ea9EQkE7jYk+0z+xaexT1ECOJzztDl2JN8N4xOLV8OVJk8SsJeesMNTFH1cywQzfI
	2HXTC9QEC3PuUSm23IC2uJ4w1nUJGoH/dw7jejc=
X-Google-Smtp-Source: AGHT+IE9b/9uPlHb9PZEwXpux39kKBe7I37eUW2J7udF3uAvIEhu7nxR8gBmRi8tLubji4uKhOQgNcXNQgIdS4SDjys=
X-Received: by 2002:a05:6000:3112:b0:430:8583:d19e with SMTP id
 ffacd0b85a97d-4308583d30bmr13279792f8f.8.1765997192095; Wed, 17 Dec 2025
 10:46:32 -0800 (PST)
MIME-Version: 1.0
References: <20251217162830.2597286-3-puranjay@kernel.org> <f144fd46b602b74fc4c1c2664082fbe893e7ec9c274fcc5fdf13d65151749e9c@mail.kernel.org>
 <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com>
In-Reply-To: <CANk7y0h4JO2-tp9HjRHjcQdTOgmRSsw0rxmK-=G89AVY92U8Jw@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 17 Dec 2025 10:46:21 -0800
X-Gm-Features: AQt7F2pLMd_hQpf761wgyiSeU22_SrSfSiYZpZD7ova6qKN6XhTev4AL9vLtgqk
Message-ID: <CAADnVQ+E6Tgcf1E5x-wk_TA+Lz83cA=SL8EZUGL70bQpywwexg@mail.gmail.com>
Subject: Re: [PATCH bpf-next 2/2] bpf: arm64: Optimize recursion detection by
 not using atomics
To: Puranjay Mohan <puranjay@kernel.org>
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
X-CRM114-CacheID: sfid-20251217_104634_840459_719B30FF 
X-CRM114-Status: GOOD (  36.30  )
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

On Wed, Dec 17, 2025 at 10:13=E2=80=AFAM Puranjay Mohan <puranjay@kernel.or=
g> wrote:
>
> On Wed, Dec 17, 2025 at 4:56=E2=80=AFPM <bot+bpf-ci@kernel.org> wrote:
> >
> > > diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> > > index 2da986136d26..654fb94bf60c 100644
> > > --- a/include/linux/bpf.h
> > > +++ b/include/linux/bpf.h
> >
> > [ ... ]
> >
> > > @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> > >
> > >  static inline bool bpf_prog_get_recursion_context(struct bpf_prog *p=
rog)
> > >  {
> > > +#ifdef CONFIG_ARM64
> > > +     u8 rctx =3D interrupt_context_level();
> > > +     u8 *active =3D this_cpu_ptr(prog->active);
> > > +
> > > +     active[rctx]++;
> > > +     barrier();
> > > +     if (get_unaligned_le32(active) !=3D BIT(rctx * 8))
> > > +             return false;
> > > +
> > > +     return true;
> > > +#else
> > >       return this_cpu_inc_return(*(prog->active)) =3D=3D 1;
> > > +#endif
> > >  }
> >
> > Can preemption between the increment and check cause a counter leak on
> > CONFIG_PREEMPT_RCU systems? The trampoline calls this function under
> > rcu_read_lock_dont_migrate() which allows preemption on PREEMPT_RCU
> > (documented at include/linux/rcupdate.h:856).
> >
> > Consider this scenario on an ARM64 system with PREEMPT_RCU:
> >
> > 1. Thread A increments active[0] to 1
> > 2. Preemption occurs before Thread A reaches the check
> > 3. Thread B on same CPU increments active[0] to 2
> > 4. Thread B checks: sees 2 !=3D BIT(0), returns false
> > 5. Thread A resumes, checks: sees 2 !=3D BIT(0), returns false
> > 6. Both threads return false, neither runs BPF
> > 7. Neither calls bpf_prog_put_recursion_context() (see
> >    __bpf_prog_enter_recur() at kernel/bpf/trampoline.c:952)
> > 8. Counter permanently stuck at 2, all future BPF on this CPU fails
>
> Step 7 is incorrect. Looking at the JIT-generated code, the exit
> function is ALWAYS called, regardless of whether the enter function
> returns 0 or a start time:
>
>   // x86 JIT at arch/x86/net/bpf_jit_comp.c:2998-3050
>   call bpf_trampoline_enter()    // Line 2998
>   test rax, rax                   // Line 3006
>   je skip_exec                    // Conditional jump
>   ... BPF program execution ...   // Lines 3011-3023
>   skip_exec:                      // Line 3037 (jump lands here)
>   call bpf_trampoline_exit()      // Line 3049 - ALWAYS executed
>
>   The bpf_trampoline_exit() call is after the skip_exec label, so it
> executes in both cases.
>
> What Actually Happens:
>
>   Initial state: active[0] =3D 0
>
>   Thread A (normal context, rctx=3D0):
>   1. active[0]++ =E2=86=92 active[0] =3D 1
>   2. Preempted before barrier()
>
>   Thread B (scheduled on same CPU, normal context, rctx=3D0):
>   3. active[0]++ =E2=86=92 active[0] =3D 2
>   4. barrier()
>   5. get_unaligned_le32(active) =E2=86=92 reads 0x00000002
>   6. Check: 0x00000002 !=3D BIT(0) =3D 0x00000001 =E2=86=92 returns false
>   7. __bpf_prog_enter_recur returns 0
>   8. JIT checks return value, skips BPF execution
>   9. JIT ALWAYS calls __bpf_prog_exit_recur (see
> arch/arm64/net/bpf_jit_comp.c:2362)
>   10. bpf_prog_put_recursion_context(prog) executes
>   11. barrier(), active[0]-- =E2=86=92 active[0] =3D 1
>
>   Thread A resumes:
>   12. barrier()
>   13. get_unaligned_le32(active) =E2=86=92 reads 0x00000001 (Thread B alr=
eady
> decremented!)
>   14. Check: 0x00000001 =3D=3D BIT(0) =3D 0x00000001 =E2=86=92 returns tr=
ue =E2=9C=93
>   15. __bpf_prog_enter_recur returns start_time
>   16. BPF program executes
>   17. __bpf_prog_exit_recur called
>   18. bpf_prog_put_recursion_context(prog) executes
>   19. barrier(), active[0]-- =E2=86=92 active[0] =3D 0 =E2=9C=93
>
>   Final State
>
>   - Counter returns to 0 =E2=9C=93
>   - No leak =E2=9C=93
>   - Thread B detected interference and aborted =E2=9C=93
>   - Thread A executed successfully =E2=9C=93
>   - Only ONE thread executed the BPF program =E2=9C=93
>
>
> Now that I think of it, there is another race condition that leads to
> NEITHER program running:
>
> Consider this scenario on an arm64 system with PREEMPT_RCU:
>
> 1. Thread A increments active[0] from 0 to 1
> 2. Thread A is preempted before reaching barrier()
> 3. Thread B (same CPU, same context) increments active[0] from 1 to 2
> 4. Thread B executes barrier() and checks: sees 2 !=3D BIT(0), returns fa=
lse
> 5. Thread A resumes, executes barrier() and checks: sees 2 !=3D BIT(0),
> returns false
> 6. Both threads return false to __bpf_prog_enter_recur()
> 7. Both skip BPF program execution
> 8. Both call bpf_prog_put_recursion_context() and decrement: 2->1->0
> 9. Neither BPF program executes, but the counter correctly returns to 0
>
> This means the patch is changing the behaviour in case of recursion
> from "One program gets to run" to
> "At most one program gets to run", but given the performance benefits,
> I think we can accept this change.

Agree. It's fine, but we can mitigate it, but doing this rctx trick
only when RCU is not preemptable. Which pretty much would mean
that PREEMPT_RT will use atomic and !RT will use rctx
and this 'no prog executes' will not happen.

> I am not sure what would change in reality if we allow both BPF
> programs to be skipped in case of high interleaving
> like above.
>
> > The old atomic code handled this correctly because this_cpu_inc_return(=
)
> > completes atomically, ensuring Thread A reads the value 1 before Thread=
 B
> > can interfere. With non-atomic operations, Thread A increments but hasn=
't
> > read the value yet, allowing Thread B to interfere and cause both threa=
ds
> > to see the modified value.
> >
> > Is there a guarantee that same-context preemption cannot occur in the B=
PF
> > execution path on ARM64, or does this need additional synchronization?
> >
> > > @@ -2006,12 +2009,32 @@ struct bpf_struct_ops_common_value {
> > >
> > >  static inline void bpf_prog_put_recursion_context(struct bpf_prog *p=
rog)
> > >  {
> > > +#ifdef CONFIG_ARM64
> > > +     u8 rctx =3D interrupt_context_level();
> > > +     u8 *active =3D this_cpu_ptr(prog->active);
> > > +
> > > +     barrier();
> > > +     active[rctx]--;
> > > +#else
> > >       this_cpu_dec(*(prog->active));
> > > +#endif
> > >  }
> >
> > The barrier() is placed before the decrement. Does this provide the nee=
ded
> > ordering guarantee, or should there also be a barrier after the decreme=
nt
> > to ensure visibility?
> >
> > > diff --git a/kernel/bpf/core.c b/kernel/bpf/core.c
> > > index c66316e32563..b5063acfcf92 100644
> > > --- a/kernel/bpf/core.c
> > > +++ b/kernel/bpf/core.c
> >
> > [ ... ]
> >
> > > @@ -112,7 +112,8 @@ struct bpf_prog *bpf_prog_alloc_no_stats(unsigned=
 int size, gfp_t gfp_extra_flag
> > >               vfree(fp);
> > >               return NULL;
> > >       }
> > > -     fp->active =3D alloc_percpu_gfp(int, bpf_memcg_flags(GFP_KERNEL=
 | gfp_extra_flags));
> > > +     fp->active =3D __alloc_percpu_gfp(sizeof(u8[BPF_NR_CONTEXTS]), =
8,
> > > +                                     bpf_memcg_flags(GFP_KERNEL | gf=
p_extra_flags));
> >
> > The allocation changes to u8[4] for all architectures, but the non-ARM6=
4
> > code path still uses *(prog->active) which now dereferences only the fi=
rst
> > byte. This changes the counter from int (typically 4 bytes, range ~2^31=
)
> > to u8 (1 byte, range 256). While 256 recursion levels is sufficient in
> > practice, is this intentional for non-ARM64 platforms, or should they
> > continue using a full int-sized allocation?
>
> This was intentional so that we don't add another #ifdef here, 256
> recursion levels are more than enough.

256 will be fine for !RT.
So suggestion above will address this concern as well when 256+ tasks
are racing concurrently on this cpu.

