Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1F4CC4452B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:52:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HycQ/24U0Dvfa9rYEhTzBVd4Z8wFBY/G9IvJddSNUb4=; b=EMCRQLVqvO3lSo
	HKHmuIbo/IgqicQ6lTLVRtDdJpZOa78HMsl1ivK7WSWFdIudPMdvwiIIsUpDgZcs56hS5BMQNh9RH
	dWyc3MyiwK5W1qHLdmXyh3GZOJBQq4YxvleejVVvG9WqdX9h8owzCsDSV7AvM8NYI5tDOK5LWxBVp
	lUaopH+r4gA9JOeS2/O/Kb7HCh59lfAJwW8fFSPWQVctnFGBH2X5CsSwMu4V2aJE8sbQV1GAwWmnS
	LPqZR9qEdV7aHq6HdgmdlVoEu9fqo8Ihw3oySh7UmdsCSphYMnVLOq81FeTCC7VE2bRqWB/XjIA80
	HmUuiUuKVqArQpQ+jTgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6DU-00000008stV-2k5E;
	Tue, 21 Jul 2026 08:52:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6DT-00000008st8-27VP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:52:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 41F90450D6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:52:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2256A1F01564
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623963;
	bh=HycQ/24U0Dvfa9rYEhTzBVd4Z8wFBY/G9IvJddSNUb4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QaQQN6Li5L+AU8DEPefyXXdMjMHBY1IHVUIvzBV4pRo5eDe25VfkYoTpgY0hEt29u
	 pkVvZgCkfLlMgUBDDeccY9j6JHmCdSkYohdi8H6+5uACEV+fNLRL4OD30huuP8VgIu
	 loAv7Cg+9XkloP3Pb8ehYPWpHXYqK2PlEg4djUVbOq6hTNjFzzC1yfW7ZQr9HDUdOI
	 bgtDXDm+e2kNK5IAx1QXAH334yFbGYDqxRhXPJWZu7YqG3crVrYoolh6nyIwx3JFQ8
	 jwBH9cYXlUHOEYu3vikybPanfqZ4HHPdz8wrxWhRW6JPMY1Ht9da3keTiQ/14K9hI9
	 PN7BQxmb7zNag==
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5b2a5dcd5b2so525855e87.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:52:43 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrhFRxUaODioZg8KTzuONk3Hzega5kZkv5uiGZBV75OtyOzdYs7pPRRJo4bRHTrslvvL9BVCcrhUC0Q2Pq2UWmN@lists.infradead.org
X-Gm-Message-State: AOJu0YzBTt/crdPcQxNTtlkKzzl+tqLHWKkNk1K5RWk53WI+/Gqd9IDn
	leVjfnEqx1Z3qEvSMyWRpiTAC3xGxQneLL+NLuMHDlp33jmODTSNIvknQ2B6Ute0rb8Xg4I1RIV
	XmzZYezHbkV4bDkKJkRZtMSxEkrAWZqc=
X-Received: by 2002:a05:6512:1156:b0:5b0:ce5:a04f with SMTP id
 2adb3069b0e04-5b28face409mr4587541e87.61.1784623961856; Tue, 21 Jul 2026
 01:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-13-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-13-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:52:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLn7ogMvgUdQA+yCjzj2OJDj_v7JDO=mPnWxqNUE7oY6yA@mail.gmail.com>
X-Gm-Features: AUfX_mzXSUvYI-AiEHstTcYri4vC5EAAtQ9xFqLJkpR6sHINZPIFjmFDc1Yxrj4
Message-ID: <CAD++jLn7ogMvgUdQA+yCjzj2OJDj_v7JDO=mPnWxqNUE7oY6yA@mail.gmail.com>
Subject: Re: [PATCH v17 12/15] arm64: ptrace: Make return type of
 arm64_syscall_trace_enter() bool
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

> In preparation for migrating arm64 to the generic entry infrastructure,
> decouple the decision to execute the syscall from the syscall number
> itself. The ptrace and seccomp now returns a boolean flag rather than
> overloading NO_SYSCALL (-1).
>
> Changes:
> - arm64_syscall_trace_enter() returns bool:
>   - false: abort syscall execution
>   - true: proceed, with syscall number reread from regs
> - If we decide to execute the syscall, reread the syscall number
>   and check if it is NO_SYSCALL again. Because when a tracer sets
>   the syscall number to -1 and provides a custom return value in x0,
>   this avoids calling invoke_syscall() which would overwrite the custom
>   value with -ENOSYS by sys_ni_syscall().
>
> Behavioral impact (unchanged):
> - User-issued syscall(-1): unchanged, returns -ENOSYS.
> - Tracer skip with custom x0: unchanged, returns custom x0
> - Tracer skip without setting x0: unchanged, returns original
>   argument (garbage)
> - Normal syscalls and seccomp rejects: unaffected
>
> No functional changes.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

