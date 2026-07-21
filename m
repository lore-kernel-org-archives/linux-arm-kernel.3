Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C892C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aazLvrJiWJRW58wrSJTjUMB6XPzwgGNcRmu586sTy+E=; b=dBTybOPLJJ6W+z
	9u29BFlNjYYpVhyxfjEcVGfzc2VEVJSroQC3BKowiMW9c17jz8TS4g2COt06QvB9AEIjYOhpmq1j1
	4wpVrYCcOhjdDmyUI4PmHUz7wyOKJ8N35/UCaSM6+58fbxOSjxmgpkxOnRuRyophWwKO5jxKBD/bC
	PG5L2UBl303IJaZJlT380jw06y3yw3x8ekmN6zG5d/JgLfWrz3/8CPGbExhkXyWMzvsOVudSQTg8E
	iR0PgGguUQG5j5+OGE375/eYbAIjqbB6y9lP1gMXP1vOtZsc5+AkdZMXLOEJ9A9xH4mMUyVVKa2r6
	gVo0NPd/9ku5Dk2w9kFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm674-00000008s5p-0HXz;
	Tue, 21 Jul 2026 08:46:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm673-00000008s5N-0PrH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:46:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7CB444057
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:46:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9961A1F00ADB
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:46:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623564;
	bh=aazLvrJiWJRW58wrSJTjUMB6XPzwgGNcRmu586sTy+E=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=F9/TvggzHdbMV1ECyxyDqSQZOP5aSLkK5MPHgepKCOrVavyvZocUcpvNb2KZN2NBS
	 DEJnIVadcH8eSS4aqvRumoehJAS/Dsw69JeCuUVQu+PgHYaJnq+o936WI+UT4TZJIo
	 H9/fpaIyA1toK58xni0lqDfXM/HxL2HNHdisdvXsPufRqbDRdeDa2zt0h/W4x3X+PN
	 dl4AYmvKuC+gVQZll9K9MmiPr1MdDTZtp4M+RcBr71Pef/HGfldK1sYg8DK6nwSBGm
	 1u4WaLTLIt+tw1GZkUb/kxBzx4wsqztBCQC+uGxJmPSLhN7TgrQR7UxOG/2Mppihj0
	 IGGL4qfzkSIhw==
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5b15c6fb864so4865658e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:46:04 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RqKMVckSZc5mhBgIQY2xoFf5chzzKGcgY0aVW5ntsyR1bTA3Cfbmlc8B2VmIRsGe8hPKC1TANVKLdex28hcPIRI@lists.infradead.org
X-Gm-Message-State: AOJu0Yzg3z69gsqMFaljGIIJVJBtlFmwe+jCIA8qVrvOBbGvctKGMTHC
	26d1dmIWX/+b6tC3nNXhHq0aAkH6a6L+DzfspGjHlCntdQoMkUqdjUyGuGG1cAoLK+lqqd0y6/m
	CsX8EpQBdx3fwa+pmfFq7BU7KvVlWhbo=
X-Received: by 2002:a05:6512:3f03:b0:5b0:e15:772e with SMTP id
 2adb3069b0e04-5b28f9bd387mr3910772e87.51.1784623563410; Tue, 21 Jul 2026
 01:46:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-9-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-9-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:45:50 +0200
X-Gmail-Original-Message-ID: <CAD++jLmftgEgQkdK9agx=Oo3ztkjdxMn3REQGbt4u1vha4Ea4A@mail.gmail.com>
X-Gm-Features: AUfX_myHwHg9se1-ZQFcWZG3sL_s90uXKcSONrAIfNoOMmyaOEKF4pzTzKp3_V8
Message-ID: <CAD++jLmftgEgQkdK9agx=Oo3ztkjdxMn3REQGbt4u1vha4Ea4A@mail.gmail.com>
Subject: Re: [PATCH v17 08/15] arm64: ptrace: Extract arm64_syscall_exit_to_user_mode_work()
 helper
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

> Introduce a helper arm64_syscall_exit_to_user_mode_work() that
> encapsulates the re-reading of thread flags and the call to
> syscall_trace_exit().  Use it in el0_svc_common() to replace
> the open-coded instances, removing the duplicated flags read
> and making the control flow simpler.
>
> This aligns the arm64 exit path with the pattern expected by the
> generic entry infrastructure, which uses a similar
> syscall_exit_to_user_mode_work() callback.
>
> No functional changes intended; this is a preparation step for converting
> arm64 to the generic entry infrastructure.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Looks right to me!
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

