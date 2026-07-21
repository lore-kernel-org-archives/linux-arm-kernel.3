Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B56D5C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:52:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WDCGk+ASivZ9odKPg+TByC+zAWOdik9AGlI/d8GoOYg=; b=WCVaoZNYy3vXCF
	qK49MQU41irVJWegAkjEiU0dOlhsnOTP+5nNM/QieErsJmrG8CpmV8lE2emMBIJWcyODeR9eUIdvD
	yW9ZV6gvJcbuG4HmS6ZMfZvx55zzQ1Qi1djLhRev/XKy8iHiSDSjaei8l+FkpSVZqbboE4luBRApQ
	tM1SULUKWLDOdEM5ZxjucXylqkB6ScTz0f3Wm9B9EMsa4Tdtz++mMG7QPuF6Ik1SHft2PsdfJVpwV
	WG46H9e3Di9vOq7XxSJRzxwVuG0Rm1QWihq/ds8uNv/LAWKXbULmDfg+wuntez0wVN6cEWY+X/DFw
	1HrPZZgQHBw3HNCZJpCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Ch-00000008skL-23k4;
	Tue, 21 Jul 2026 08:51:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Cf-00000008sk5-3Wnr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:51:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 32E5A4322F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:51:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 172E21F00AC4
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623913;
	bh=WDCGk+ASivZ9odKPg+TByC+zAWOdik9AGlI/d8GoOYg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=G+5IibKdCPvRbPIW4UwVnN/zRqG1AqNn0eOnJc1gH9S0Jx6Md2Je86BSXQAPLQtFu
	 OVHHrtx3875C2JdzQwZop4lAnVQj5padUMaN3axIeDqbQY7ksogL8SSQ6IToqFuIqj
	 A+eedTBNR2KiCRUi2552YrUgOD2vHONbxnbj5DLDLGYEC2LW/+rsyDvK6GAxaCO52a
	 E5EgnPOGQblyAoRXWxF2jK/T8coyTK/6os6OK/Ha/krI/Rq43p426jILQFpe0PJ7By
	 szaGmC0OrgzWRxNXFiK03+2tM7Xa98pdnBPyeaTCKA21sVqSbD34ysFBMm3S2zzAk5
	 LLAJ7njkImplA==
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5b0148201fbso6162010e87.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:51:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoACrzHHCl2FhRJ2EwKHgdGGboZVauX1eN+JCXKeY8FMOiCMFBFZ7n/djwXGlVULPF8ZtvdbkoYkZPs/3/SLUfd@lists.infradead.org
X-Gm-Message-State: AOJu0YxZDbjsnRNKO6vqHAL0PQjgWNZTGEy6iTvYkI65hoKH+KRBXiGf
	1rCTHqXysuqC5uohBrP2ZUBz3TTJKlSL9t2KGG1qG14rGGQwnMH3k4vqOEXKWp8dieXiWZHcf7s
	dHmZSLA5haSbKJqbGT3EkRRs4z9lWdXc=
X-Received: by 2002:a05:6512:6092:b0:5b0:17e7:67cb with SMTP id
 2adb3069b0e04-5b28f85c96fmr3157205e87.17.1784623911848; Tue, 21 Jul 2026
 01:51:51 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-12-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-12-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:51:39 +0200
X-Gmail-Original-Message-ID: <CAD++jL=D1S7HE9dVwHeOyAmu-6g+BGq+f2=2=BUX-4tzp88NOQ@mail.gmail.com>
X-Gm-Features: AUfX_myXfFPmxzRpXer_m1f22Sl8KHAIsWBq-5Jvh6C6oAP82PJASvQuqp2AReY
Message-ID: <CAD++jL=D1S7HE9dVwHeOyAmu-6g+BGq+f2=2=BUX-4tzp88NOQ@mail.gmail.com>
Subject: Re: [PATCH v17 11/15] arm64: syscall: Simplify el0_svc_common()
 syscall exit path
To: Jinjie Ruan <ruanjinjie@huawei.com>
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
Cc: mark.rutland@arm.com, kees@kernel.org, catalin.marinas@arm.com, oleg@redhat.com, will@kernel.org, peterz@infradead.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, linux-mm@kvack.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, luto@amacapital.net, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jul 21, 2026 at 10:19=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> Remove the redundant nested conditional check within the system call
> exit path of el0_svc_common() to streamline the exit sequence.
>
> When entering this fast-path block, CONFIG_DEBUG_RSEQ is guaranteed to be
> disabled so the call of rseq_syscall() is a no-op.

Please explain why this is guaranteed.

> Under this constraint,
> the code logic inside the block becomes completely identical to what
> the arm64_syscall_exit_to_user_mode_work() helper already does. Replace
> that nested logic with a direct invocation of the helper, eliminating
> redundant code.
>
> Before:
>
> | if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
> |       flags =3D read_thread_flags();
> |       if (unlikely(flags & _TIF_SYSCALL_EXIT_WORK) || flags & _TIF_SING=
LESTEP)
> |               arm64_syscall_exit_to_user_mode_work(regs);
> |       return;
> | }
> | trace_exit:
> |       arm64_syscall_exit_to_user_mode_work(regs);
>
> After simplify:
>
> | if (... && !IS_ENABLED(CONFIG_DEBUG_RSEQ)) {
> |       arm64_syscall_exit_to_user_mode_work(regs);
> |       return;
> | }
> | trace_exit:
> |       arm64_syscall_exit_to_user_mode_work(regs);
>
> Furthermore, Since both the conditional fast-path and the fallback
> slow-path now uniformly invoke arm64_syscall_exit_to_user_mode_work(),
> this explicit conditional branch is entirely redundant regardless of
> whether the evaluation is true or false. Removing it collapses
> the duplicated logic into a single, unconditional path.
>
> No functional changes.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

After looking at it for a while I conclude you are right, provided
the reasoning about !CONFIG_DEBUG_RSEQ holds. So with
that explained:
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

