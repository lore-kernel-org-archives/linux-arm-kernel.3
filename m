Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 492C5D767F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 31 Oct 2024 18:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m9pkCMrlG+6d8KDFXYWlMBHxdGI2r5U3tUuEXE09VQM=; b=Qe5GNJ/JFCn8Z49xYBmUXFOBiJ
	MbMCLAQl4WiPvUxdZAqSaPBf8ucZlejYQIUsIAgPNdLNJYmfIEYhtsCPffjhqVGCGStolJ/nKKrGG
	S8NfkYI/clsB/5HLzpxWjWCFhhtHXKGIvs+Ng2wSwigeKjbvgo7efRj/QyKInsodhvEHVUwY3rPJv
	zudEVryn3Z67RjMz8Wt0vTk1phzSla0HxI0i+Jlox4koQ1rwk1OFMRuWUNVn1GlSaGbI/z/3qb9Ll
	ZBvMYOHX+eyBkeC8QnscgaLebiHBUIqKjfe0QrWrmtWq21qAKJb3RRU5EkYvDYEOsqgTIuLr/PnIu
	GIcdHUpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6aB5-00000004XPz-239W;
	Thu, 31 Oct 2024 18:45:51 +0000
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6a8n-00000004Wlv-1Snt
	for linux-arm-kernel@lists.infradead.org;
	Thu, 31 Oct 2024 18:43:31 +0000
Received: by mail-oa1-x2c.google.com with SMTP id 586e51a60fabf-2888bcc0f15so214942fac.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 31 Oct 2024 11:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1730400208; x=1731005008; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m9pkCMrlG+6d8KDFXYWlMBHxdGI2r5U3tUuEXE09VQM=;
        b=Pc8NqmmMcRV4hLJ7CNzJqprm7MmhB36ITdMIlzh4IeGVzVYz7SC6SOkaXUpzpcFG+E
         AQbxbsqPfxLiBqMY5duKoUld8swzI2kQJwjkwxFIGWP5B1jhGpho2wppv1rtv8U0iJFk
         VUgT34mls1mCmzab82eyIdme4DmU272Xkv+lM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730400208; x=1731005008;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m9pkCMrlG+6d8KDFXYWlMBHxdGI2r5U3tUuEXE09VQM=;
        b=K/P8zDzKBxMC+PpRBjwKrfW6x91gM1+SDC5ePlDJbjoICIPHXxg/Vh99OG5NFOm+gp
         uc3a+NSQmmSQGLlXaR4NJarWuOLsjQGP5wkhmctf0K2Octi+OuyeNmqYinPrUJoEnnB1
         rL4sIg5U+r0EyXJOFUVjhdLuJbwHZzO4OQG7c/iZmzJbzqysyZ72Lgvkc9mtpRzbTGuh
         g5zMn/C8088EfQ5Nvdim4N9vB9Raz5o1dDmbAg3xe8RVBOO/QpfNJK9yA4dOajCcdkk6
         iMCzGJCyQwjhUIbRP+5t/DVxxXiIeqP2x+5C6DDZ1rC0YCbcMyouqysIUAKY5YMPbYWW
         S9ww==
X-Gm-Message-State: AOJu0YydXN9YCsWkzfiSTc8/zv7t8+8v82o0lDSTMqaus9US2uB+GLLG
	DmO2wO246DwBJyEdRvyiFZCtfiLeOEHbN/3OGi2779T9beL92VYZqjRf9d8qsC866jd4FgIh5+F
	YanB1azd4PmKAWoRLoy83znSJBB2mJP4ebYxQ
X-Google-Smtp-Source: AGHT+IFGIJKLWI/BUm9W6oX5BAu9UJongzEp3ksTnogYOtUiu9chLn5n70BL50s4fYBWdm9xYpy2QybIo/hGZpLsz+c=
X-Received: by 2002:a05:6870:7311:b0:288:2955:3efb with SMTP id
 586e51a60fabf-29051c4e8a4mr4891117fac.8.1730400207786; Thu, 31 Oct 2024
 11:43:27 -0700 (PDT)
MIME-Version: 1.0
References: <20241029144539.111155-1-kevin.brodsky@arm.com>
 <20241029144539.111155-2-kevin.brodsky@arm.com> <CABi2SkUTSuk_PS9==_czM=64FGWK_5DyUe5QELxiFHtPFsKaHw@mail.gmail.com>
 <cd0e114d-57eb-4c90-bb6f-9abf0cc8920f@arm.com>
In-Reply-To: <cd0e114d-57eb-4c90-bb6f-9abf0cc8920f@arm.com>
From: Jeff Xu <jeffxu@chromium.org>
Date: Thu, 31 Oct 2024 11:43:16 -0700
Message-ID: <CABi2SkW6_CACjYheaEMuCYGnwnXKoVGuACtnCyDb8Zjfac6Wog@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20241031_114329_429951_62901841 
X-CRM114-Status: GOOD (  21.44  )
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

On Thu, Oct 31, 2024 at 1:45=E2=80=AFAM Kevin Brodsky <kevin.brodsky@arm.co=
m> wrote:
>
> On 30/10/2024 23:01, Jeff Xu wrote:
> >> -static int restore_poe_context(struct user_ctxs *user)
> >> +static int restore_poe_context(struct user_ctxs *user,
> >> +                              struct user_access_state *ua_state)
> >>  {
> >>         u64 por_el0;
> >>         int err =3D 0;
> >> @@ -282,7 +338,7 @@ static int restore_poe_context(struct user_ctxs *u=
ser)
> >>
> >>         __get_user_error(por_el0, &(user->poe->por_el0), err);
> >>         if (!err)
> >> -               write_sysreg_s(por_el0, SYS_POR_EL0);
> >> +               ua_state->por_el0 =3D por_el0;
> >>
> >>         return err;
> >>  }
> >> @@ -850,7 +906,8 @@ static int parse_user_sigframe(struct user_ctxs *u=
ser,
> >>  }
> >>
> >>  static int restore_sigframe(struct pt_regs *regs,
> >> -                           struct rt_sigframe __user *sf)
> >> +                           struct rt_sigframe __user *sf,
> >> +                           struct user_access_state *ua_state)
> >>  {
> >>         sigset_t set;
> >>         int i, err;
> >> @@ -899,7 +956,7 @@ static int restore_sigframe(struct pt_regs *regs,
> >>                 err =3D restore_zt_context(&user);
> >>
> >>         if (err =3D=3D 0 && system_supports_poe() && user.poe)
> >> -               err =3D restore_poe_context(&user);
> >> +               err =3D restore_poe_context(&user, ua_state);
> >>
> >>         return err;
> >>  }
> >> @@ -908,6 +965,7 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >>  {
> >>         struct pt_regs *regs =3D current_pt_regs();
> >>         struct rt_sigframe __user *frame;
> >> +       struct user_access_state ua_state;
> >>
> >>         /* Always make any pending restarted system calls return -EINT=
R */
> >>         current->restart_block.fn =3D do_no_restart_syscall;
> >> @@ -924,12 +982,14 @@ SYSCALL_DEFINE0(rt_sigreturn)
> >>         if (!access_ok(frame, sizeof (*frame)))
> >>                 goto badframe;
> >>
> >> -       if (restore_sigframe(regs, frame))
> >> +       if (restore_sigframe(regs, frame, &ua_state))
> >>                 goto badframe;
> >>
> >>         if (restore_altstack(&frame->uc.uc_stack))
> >>                 goto badframe;
> >>
> > Do you need to move restore_altstack ahead of restore_sigframe?
>
> This is not necessary because restore_sigframe() no longer writes to
> POR_EL0. restore_poe_context() (above) now saves the original POR_EL0
> value into ua_state, and it is restore_user_access_state() (called below
> just before returning to userspace) that actually writes to POR_EL0,
> after all uaccess is completed.
>
Got it, thanks for the explanation.

-Jeff

> Having said that, I somehow missed the call to restore_altstack() when
> writing the commit message, so these changes in sys_rt_sigreturn are in
> fact necessary. Good catch! At least the patch itself should be doing
> the right thing.
>
> - Kevin
>
> > similar as x86 change [1],
> > the discussion for this  happened  in [2] [3]
> >
> > [1] https://lore.kernel.org/lkml/20240802061318.2140081-5-aruna.ramakri=
shna@oracle.com/
> > [2] https://lore.kernel.org/lkml/20240425210540.3265342-1-jeffxu@chromi=
um.org/
> > [3] https://lore.kernel.org/lkml/d0162c76c25bc8e1c876aebe8e243ff2e68623=
59.camel@intel.com/
> >
> > Thanks
> > -Jeff
> >
> >
> >> +       restore_user_access_state(&ua_state);
> >> +
> >>         return regs->regs[0];
>

