Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E27FAD6B6DA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Oct 2024 22:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kGYYawyYyo0fTncLTrbG++/yRLPpJpk8HBWFdGuvteA=; b=eses5V7HoP4UpEh8I+aOXoEfgY
	oN9NR88l5hsvLT3ttMlHAxNLOAgmtIQZuCb1PE+JSVt19XnGsPZf+4kpIT9ifVrwMTafiNhaYdG6m
	AqFaWIvGj0xBkYaci6CXCJKbSf0ZzNbZVTnuNBusz0CEJNlPBmZ0HFlLcXU6l/TQO8oEcbVQdsc+D
	weQcllh9TLdyhZrOhTo6vIhe9FPkFcUYHKDOLa1qYuHdayPvBaB1rAdmHlfSL0rblAeY2cpU7SuJR
	3U9dsFAtqeGrxZxpUkS4T9ZLjq3DS+YzF0VW7IqQH7Q0Bfl7qEIr3V+gcyEQkDSFc+JtWauHpQ2I3
	kqbIK0fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6Gn6-00000001wXM-0A45;
	Wed, 30 Oct 2024 22:03:48 +0000
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6GlS-00000001wNz-07eD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Oct 2024 22:02:07 +0000
Received: by mail-oa1-x33.google.com with SMTP id 586e51a60fabf-288824e9cc4so78300fac.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Oct 2024 15:02:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730325725; x=1730930525; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kGYYawyYyo0fTncLTrbG++/yRLPpJpk8HBWFdGuvteA=;
        b=RAZBJxVEsI60plB1W1V86WewJXalzqFgprfbyc8zLP7GAXC6QutIRn9/lG01rSYE0G
         WBeW14qyaq1u9dt/CNULNY6VIaYexTBxKh7PdWicIXInNkGh6ZJkFvXZqcssj8/CAir4
         weOeMpfeio+qdDnHKIzzfYcKMM/xduqAlz8KU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730325725; x=1730930525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kGYYawyYyo0fTncLTrbG++/yRLPpJpk8HBWFdGuvteA=;
        b=JS+/QQ0HbZxTs+x+ZA+Ac75BuMTGA74vK9fc9PmjoYHRuHmsBQAOJxxFAD7ozoS4vW
         t7d13NeTIaBAxItkgIWl4qe33MEYfULbEjOt1XBqBYhn0ZpMnDuRxoeGoRrAM0uBG7Le
         3xmdvrKrrlvNfR0klg+PrfCywG46GDD2qiH8l/bPZTGF/ezgncex0uz4emoKtUbG+wx5
         JjSlPtUPQcpDo9qeQGYa9qyBUF+x3H4gdS57QCt0JxUXu1lRHtCdtxWWELKE7uAYgr1S
         orfL8PtCOG7JglXUagZ42RbTuZL6nN2KkXAAVdzGiZWn4atJeO5guzn0G1vgO6Synct3
         0T/w==
X-Gm-Message-State: AOJu0YwesBhZHmhztZyH4DPseuTiuqL5W2gWdYeYKcAjM6gnwIHGpNKS
	sHomFdhse1mB/2lddri4U1zzGkFhKwDw3UhioX2ktfpvbUaJ4/n3Yvho0IUjsm02waIwIQoW4dS
	P0C6q2WQoY3zY68u5ck7SI//+qjjt4c54S94m
X-Google-Smtp-Source: AGHT+IGy17imFSrQUrRy55us9PntsFqcUY7MfJD8I1WxbZPEOOLPHqrilGvrbKL6iRLAyUVRNytCPLMXdtMzix/H7Fg=
X-Received: by 2002:a05:6870:d60b:b0:277:c0b6:2224 with SMTP id
 586e51a60fabf-29051b0bfb1mr4401081fac.2.1730325724812; Wed, 30 Oct 2024
 15:02:04 -0700 (PDT)
MIME-Version: 1.0
References: <20241029144539.111155-1-kevin.brodsky@arm.com> <20241029144539.111155-2-kevin.brodsky@arm.com>
In-Reply-To: <20241029144539.111155-2-kevin.brodsky@arm.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Wed, 30 Oct 2024 15:01:53 -0700
Message-ID: <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
Subject: Re: [PATCH v3 1/5] arm64: signal: Improve POR_EL0 handling to avoid
 uaccess failures
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, akpm@linux-foundation.org, 
	anshuman.khandual@arm.com, aruna.ramakrishna@oracle.com, broonie@kernel.org, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, Dave.Martin@arm.com, 
	joey.gouly@arm.com, keith.lucas@oracle.com, pierre.langlois@arm.com, 
	shuah@kernel.org, sroettger@google.com, tglx@linutronix.de, will@kernel.org, 
	yury.khrustalev@arm.com, linux-kselftest@vger.kernel.org, x86@kernel.org, 
	Kees Cook <keescook@chromium.org>, Jorge Lucangeli Obes <jorgelo@chromium.org>, 
	Jann Horn <jannh@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241030_150206_103732_524B0B93 
X-CRM114-Status: GOOD (  45.33  )
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

+ Kees, Jorge, Jann


On Tue, Oct 29, 2024 at 7:46=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:
>
> TL;DR: reset POR_EL0 to "allow all" before writing the signal frame,
> preventing spurious uaccess failures.
>
> When POE is supported, the POR_EL0 register constrains memory
> accesses based on the target page's POIndex (pkey). This raises the
> question: what constraints should apply to a signal handler? The
> current answer is that POR_EL0 is reset to POR_EL0_INIT when
> invoking the handler, giving it full access to POIndex 0. This is in
> line with x86's MPK support and remains unchanged.
>
> This is only part of the story, though. POR_EL0 constrains all
> unprivileged memory accesses, meaning that uaccess routines such as
> put_user() are also impacted. As a result POR_EL0 may prevent the
> signal frame from being written to the signal stack (ultimately
> causing a SIGSEGV). This is especially concerning when an alternate
> signal stack is used, because userspace may want to prevent access
> to it outside of signal handlers. There is currently no provision
> for that: POR_EL0 is reset after writing to the stack, and
> POR_EL0_INIT only enables access to POIndex 0.
>
> This patch ensures that POR_EL0 is reset to its most permissive
> state before the signal stack is accessed. Once the signal frame has
> been fully written, POR_EL0 is still set to POR_EL0_INIT - it is up
> to the signal handler to enable access to additional pkeys if
> needed. As to sigreturn(), it expects having access to the stack
> like any other syscall; we only need to ensure that POR_EL0 is
> restored from the signal frame after all uaccess calls. This
> approach is in line with the recent x86/pkeys series [1].
>
> Resetting POR_EL0 early introduces some complications, in that we
> can no longer read the register directly in preserve_poe_context().
> This is addressed by introducing a struct (user_access_state)
> and helpers to manage any such register impacting user accesses
> (uaccess and accesses in userspace). Things look like this on signal
> delivery:
>
> 1. Save original POR_EL0 into struct [save_reset_user_access_state()]
> 2. Set POR_EL0 to "allow all"  [save_reset_user_access_state()]
> 3. Create signal frame
> 4. Write saved POR_EL0 value to the signal frame [preserve_poe_context()]
> 5. Finalise signal frame
> 6. If all operations succeeded:
>   a. Set POR_EL0 to POR_EL0_INIT [set_handler_user_access_state()]
>   b. Else reset POR_EL0 to its original value [restore_user_access_state(=
)]
>
> If any step fails when setting up the signal frame, the process will
> be sent a SIGSEGV, which it may be able to handle. Step 6.b ensures
> that the original POR_EL0 is saved in the signal frame when
> delivering that SIGSEGV (so that the original value is restored by
> sigreturn).
>
> The return path (sys_rt_sigreturn) doesn't strictly require any change
> since restore_poe_context() is already called last. However, to
> avoid uaccess calls being accidentally added after that point, we
> use the same approach as in the delivery path, i.e. separating
> uaccess from writing to the register:
>
> 1. Read saved POR_EL0 value from the signal frame [restore_poe_context()]
> 2. Set POR_EL0 to the saved value [restore_user_access_state()]
>
> [1] https://lore.kernel.org/lkml/20240802061318.2140081-1-aruna.ramakrish=
na@oracle.com/
>
> Reviewed-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Kevin Brodsky <kevin.brodsky@arm.com>
> ---
>  arch/arm64/kernel/signal.c | 92 ++++++++++++++++++++++++++++++++------
>  1 file changed, 78 insertions(+), 14 deletions(-)
>
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 561986947530..c7d311d8b92a 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -19,6 +19,7 @@
>  #include <linux/ratelimit.h>
>  #include <linux/rseq.h>
>  #include <linux/syscalls.h>
> +#include <linux/pkeys.h>
>
>  #include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
> @@ -66,10 +67,63 @@ struct rt_sigframe_user_layout {
>         unsigned long end_offset;
>  };
>
> +/*
> + * Holds any EL0-controlled state that influences unprivileged memory ac=
cesses.
> + * This includes both accesses done in userspace and uaccess done in the=
 kernel.
> + *
> + * This state needs to be carefully managed to ensure that it doesn't ca=
use
> + * uaccess to fail when setting up the signal frame, and the signal hand=
ler
> + * itself also expects a well-defined state when entered.
> + */
> +struct user_access_state {
> +       u64 por_el0;
> +};
> +
>  #define BASE_SIGFRAME_SIZE round_up(sizeof(struct rt_sigframe), 16)
>  #define TERMINATOR_SIZE round_up(sizeof(struct _aarch64_ctx), 16)
>  #define EXTRA_CONTEXT_SIZE round_up(sizeof(struct extra_context), 16)
>
> +/*
> + * Save the user access state into ua_state and reset it to disable any
> + * restrictions.
> + */
> +static void save_reset_user_access_state(struct user_access_state *ua_st=
ate)
> +{
> +       if (system_supports_poe()) {
> +               u64 por_enable_all =3D 0;
> +
> +               for (int pkey =3D 0; pkey < arch_max_pkey(); pkey++)
> +                       por_enable_all |=3D POE_RXW << (pkey * POR_BITS_P=
ER_PKEY);
> +
> +               ua_state->por_el0 =3D read_sysreg_s(SYS_POR_EL0);
> +               write_sysreg_s(por_enable_all, SYS_POR_EL0);
> +               /* Ensure that any subsequent uaccess observes the update=
d value */
> +               isb();
> +       }
> +}
> +
> +/*
> + * Set the user access state for invoking the signal handler.
> + *
> + * No uaccess should be done after that function is called.
> + */
> +static void set_handler_user_access_state(void)
> +{
> +       if (system_supports_poe())
> +               write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> +}
> +
> +/*
> + * Restore the user access state to the values saved in ua_state.
> + *
> + * No uaccess should be done after that function is called.
> + */
> +static void restore_user_access_state(const struct user_access_state *ua=
_state)
> +{
> +       if (system_supports_poe())
> +               write_sysreg_s(ua_state->por_el0, SYS_POR_EL0);
> +}
> +
>  static void init_user_layout(struct rt_sigframe_user_layout *user)
>  {
>         const size_t reserved_size =3D
> @@ -261,18 +315,20 @@ static int restore_fpmr_context(struct user_ctxs *u=
ser)
>         return err;
>  }
>
> -static int preserve_poe_context(struct poe_context __user *ctx)
> +static int preserve_poe_context(struct poe_context __user *ctx,
> +                               const struct user_access_state *ua_state)
>  {
>         int err =3D 0;
>
>         __put_user_error(POE_MAGIC, &ctx->head.magic, err);
>         __put_user_error(sizeof(*ctx), &ctx->head.size, err);
> -       __put_user_error(read_sysreg_s(SYS_POR_EL0), &ctx->por_el0, err);
> +       __put_user_error(ua_state->por_el0, &ctx->por_el0, err);
>
>         return err;
>  }
>
> -static int restore_poe_context(struct user_ctxs *user)
> +static int restore_poe_context(struct user_ctxs *user,
> +                              struct user_access_state *ua_state)
>  {
>         u64 por_el0;
>         int err =3D 0;
> @@ -282,7 +338,7 @@ static int restore_poe_context(struct user_ctxs *user=
)
>
>         __get_user_error(por_el0, &(user->poe->por_el0), err);
>         if (!err)
> -               write_sysreg_s(por_el0, SYS_POR_EL0);
> +               ua_state->por_el0 =3D por_el0;
>
>         return err;
>  }
> @@ -850,7 +906,8 @@ static int parse_user_sigframe(struct user_ctxs *user=
,
>  }
>
>  static int restore_sigframe(struct pt_regs *regs,
> -                           struct rt_sigframe __user *sf)
> +                           struct rt_sigframe __user *sf,
> +                           struct user_access_state *ua_state)
>  {
>         sigset_t set;
>         int i, err;
> @@ -899,7 +956,7 @@ static int restore_sigframe(struct pt_regs *regs,
>                 err =3D restore_zt_context(&user);
>
>         if (err =3D=3D 0 && system_supports_poe() && user.poe)
> -               err =3D restore_poe_context(&user);
> +               err =3D restore_poe_context(&user, ua_state);
>
>         return err;
>  }
> @@ -908,6 +965,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
>  {
>         struct pt_regs *regs =3D current_pt_regs();
>         struct rt_sigframe __user *frame;
> +       struct user_access_state ua_state;
>
>         /* Always make any pending restarted system calls return -EINTR *=
/
>         current->restart_block.fn =3D do_no_restart_syscall;
> @@ -924,12 +982,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
>         if (!access_ok(frame, sizeof (*frame)))
>                 goto badframe;
>
> -       if (restore_sigframe(regs, frame))
> +       if (restore_sigframe(regs, frame, &ua_state))
>                 goto badframe;
>
>         if (restore_altstack(&frame->uc.uc_stack))
>                 goto badframe;
>
Do you need to move restore_altstack ahead of restore_sigframe?
similar as x86 change [1],
the discussion for this  happened  in [2] [3]

[1] https://lore.kernel.org/lkml/20240802061318.2140081-5-aruna.ramakrishna=
@oracle.com/
[2] https://lore.kernel.org/lkml/20240425210540.3265342-1-jeffxu@chromium.o=
rg/
[3] https://lore.kernel.org/lkml/d0162c76c25bc8e1c876aebe8e243ff2e6862359.c=
amel@intel.com/

Thanks
-Jeff


> +       restore_user_access_state(&ua_state);
> +
>         return regs->regs[0];
>
>  badframe:
> @@ -1035,7 +1095,8 @@ static int setup_sigframe_layout(struct rt_sigframe=
_user_layout *user,
>  }
>
>  static int setup_sigframe(struct rt_sigframe_user_layout *user,
> -                         struct pt_regs *regs, sigset_t *set)
> +                         struct pt_regs *regs, sigset_t *set,
> +                         const struct user_access_state *ua_state)
>  {
>         int i, err =3D 0;
>         struct rt_sigframe __user *sf =3D user->sigframe;
> @@ -1097,10 +1158,9 @@ static int setup_sigframe(struct rt_sigframe_user_=
layout *user,
>                 struct poe_context __user *poe_ctx =3D
>                         apply_user_offset(user, user->poe_offset);
>
> -               err |=3D preserve_poe_context(poe_ctx);
> +               err |=3D preserve_poe_context(poe_ctx, ua_state);
>         }
>
> -
>         /* ZA state if present */
>         if (system_supports_sme() && err =3D=3D 0 && user->za_offset) {
>                 struct za_context __user *za_ctx =3D
> @@ -1237,9 +1297,6 @@ static void setup_return(struct pt_regs *regs, stru=
ct k_sigaction *ka,
>                 sme_smstop();
>         }
>
> -       if (system_supports_poe())
> -               write_sysreg_s(POR_EL0_INIT, SYS_POR_EL0);
> -
>         if (ka->sa.sa_flags & SA_RESTORER)
>                 sigtramp =3D ka->sa.sa_restorer;
>         else
> @@ -1253,6 +1310,7 @@ static int setup_rt_frame(int usig, struct ksignal =
*ksig, sigset_t *set,
>  {
>         struct rt_sigframe_user_layout user;
>         struct rt_sigframe __user *frame;
> +       struct user_access_state ua_state;
>         int err =3D 0;
>
>         fpsimd_signal_preserve_current_state();
> @@ -1260,13 +1318,14 @@ static int setup_rt_frame(int usig, struct ksigna=
l *ksig, sigset_t *set,
>         if (get_sigframe(&user, ksig, regs))
>                 return 1;
>
> +       save_reset_user_access_state(&ua_state);
>         frame =3D user.sigframe;
>
>         __put_user_error(0, &frame->uc.uc_flags, err);
>         __put_user_error(NULL, &frame->uc.uc_link, err);
>
>         err |=3D __save_altstack(&frame->uc.uc_stack, regs->sp);
> -       err |=3D setup_sigframe(&user, regs, set);
> +       err |=3D setup_sigframe(&user, regs, set, &ua_state);
>         if (err =3D=3D 0) {
>                 setup_return(regs, &ksig->ka, &user, usig);
>                 if (ksig->ka.sa.sa_flags & SA_SIGINFO) {
> @@ -1276,6 +1335,11 @@ static int setup_rt_frame(int usig, struct ksignal=
 *ksig, sigset_t *set,
>                 }
>         }
>
> +       if (err =3D=3D 0)
> +               set_handler_user_access_state();
> +       else
> +               restore_user_access_state(&ua_state);
> +
>         return err;
>  }
>
> --
> 2.43.0
>

