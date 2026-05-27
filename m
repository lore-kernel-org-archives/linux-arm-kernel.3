Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E711CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GvNPCTCjHt6I1L+vsuvIndDRNGYCAHze81sSo6gjBPs=; b=lTKRhkLvMOKCzh
	REaMLWwU54dPerfR9eoBjXi1O81Kjg9SXUrenR+VShDDF0baY9onbHRg0czaDxJeIXudsNm1OUpGI
	SVQIloz7phqpIS+UQDuS8UmSNdMpseOhC78Rfqnm7Q2H2NEYfxv5m0JSu3LOFnlpSVz6THrE/WvlV
	Y15KxYiGUaEwjRxrt7nfHaEFd3PC1FZeK+oWl6gCpVVP3L62sV45X/eI6KC+9A3pK2y8by2febmor
	lO4cowdnKZd3VkBaVoPSor+EUYdBe4Z88uSo4Bw24wdx2tPCbrqDbxlXVaavKR7Ecu5m1oHSuLrJH
	jiCm0V6s9ZzXgnf5WL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDGV-000000044p1-2w24;
	Wed, 27 May 2026 12:21:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDGS-000000044oU-2B6R
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:21:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D6D0844609
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:21:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BEDB41F00A3C
	for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 12:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779884495;
	bh=GvNPCTCjHt6I1L+vsuvIndDRNGYCAHze81sSo6gjBPs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HyK9y4jhEXScqSB3Q7+N+0+fll2tKRKH5AA8gHxWMb8BcwgZOjgES3F9FdPbhhH1o
	 Ne1fVbwzDb/4H1+vVzx90/bZyvGMz1ozK/3Zq4uLjegwrcV+WcUQ/r6FdYpVQGljfi
	 TpzNny8A/uPEXQTzWJIxX2UjPzQwvI1AW3yDUwYP/L6G64ejkdd/wJl/N8aMTEGohW
	 4/+lzY1wwAynwGYKMvMvcdBO1ddMMqVoYfa+BgR72KynrhVa4uy+cMOpG6jkU/2+Xt
	 Xh5f40q2wX4FmHlCumw+jOysPq4PQH55W+f+ykcwKpNYHvrI6kcYNWNhPO8FegsShz
	 lPp3M/pDAYpRw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8721851e2so13023542e87.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 27 May 2026 05:21:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+eSxUo45sLxRkOJkL/7tVJ0dCgPY90p1+coKj3KGF5YMhdLSMxMK+p9v9RHZKyVPakqMSLgLBGlN5hmgJl5+Jo@lists.infradead.org
X-Gm-Message-State: AOJu0YwRZ3oTIwGguyc/7JqINyWHWFnej/EaypCLn+Acf1nWElKvydy+
	hgpamojRMZmzeNP8/iUA8z0cM9YGZpJFedVS8Q/ynsv0O/73GvLzACX63OuxbNNmafgAcVrh45b
	E5Pc+g05I2ZXuE/cDyvtDidQ/EGGvndU=
X-Received: by 2002:a05:6512:118f:b0:5a8:6cbc:60f3 with SMTP id
 2adb3069b0e04-5aa323815a9mr6898216e87.34.1779884493104; Wed, 27 May 2026
 05:21:33 -0700 (PDT)
MIME-Version: 1.0
References: <20260511092103.1974980-1-ruanjinjie@huawei.com> <20260511092103.1974980-2-ruanjinjie@huawei.com>
In-Reply-To: <20260511092103.1974980-2-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 27 May 2026 14:21:20 +0200
X-Gmail-Original-Message-ID: <CAD++jLmxW18McX5-fG4=oLbVOjcU6CGLHPYxdBbSA23yaRY=zA@mail.gmail.com>
X-Gm-Features: AVHnY4IWS7nJnTYTGTs5qtnt5pSobKpz86DQMWXv4WM1GC0Dehk8RYbNZgPGMbQ
Message-ID: <CAD++jLmxW18McX5-fG4=oLbVOjcU6CGLHPYxdBbSA23yaRY=zA@mail.gmail.com>
Subject: Re: [PATCH v15 01/11] entry: Fix potential syscall truncation in syscall_trace_enter()
To: Jinjie Ruan <ruanjinjie@huawei.com>, Thomas Gleixner <tglx@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_052137_020694_A3E45892 
X-CRM114-Status: GOOD (  15.14  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, oleg@redhat.com, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, ldv@strace.io, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, linux-kernel@vger.kernel.org, james.morse@arm.com, liqiang01@kylinos.cn
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, May 11, 2026 at 11:21=E2=80=AFAM Jinjie Ruan <ruanjinjie@huawei.com=
> wrote:

> In syscall_trace_enter(), the current logic returns "ret ? : syscall".
> While __secure_computing() currently only returns 0 (allow) or -1 (kill),
> this "ret ? : syscall" pattern is conceptually flawed.
>
> If __secure_computing() were to return a non-zero value that isn't -1, it
> would unintentionally override the actual system call number. This logic
> is redundant because if seccomp denies the syscall, the execution path
> should already be handled by the caller based on the error return, rather
> than conflating the return code with the syscall number.
>
> Fix it by explicitly returning the syscall number. This ensures
> the syscall register remains untainted by the trace return values and
> aligns with the expectation that seccomp-related interceptions are
> handled via the -1 return status.
>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Fixes: 142781e108b1 ("entry: Provide generic syscall entry functionality"=
)
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

This looks like something tglx should apply directly if generic entry on
arm64 is not progressing this merge window. Thomas?

Yours,
Linus Walleij

