Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4A63C44529
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:47:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hWIbARItOS3O0oMuhodwOx5tag/hEshRFM6Dtys9CZU=; b=FjwVlGE2O3KNoS
	NXwjc/IbqLy8N44Pvf18omeOqehl8AiLmWSgIS/61WkRqB7H3bKhM2kfhvxRVqRqojRtbxXrazSQS
	sKtgvppcaGglm8ZlHbPlKg+PNnNgwl4PIi6W8JR8yQZAh0FxYu2cNjytlUcOhhgOFyCHMsVybfc7k
	nMsRISBCbQrR7h3O1pxQomWUPJVHCd7gfEzBEb/R0/OrURKWgP3iRu2ukjkxG3pTwHzegVZ8mUfNu
	9pAKkMqRjqoEoSPJxcF0JGyx3EiAmXp4rF8tPbMeAFclpOf1hOOhKx5CACWxpvZwI1Hai59D4BJZk
	vJDx0pTAUuxwPkwIlqLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm67v-00000008sGT-16dB;
	Tue, 21 Jul 2026 08:46:59 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm67t-00000008sGL-2VvU
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:46:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5EC3F44E9D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:46:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02EE41F0155E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:46:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784623617;
	bh=hWIbARItOS3O0oMuhodwOx5tag/hEshRFM6Dtys9CZU=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EO9LsbGe51ZavfNcIoKtu9CfyoMnAKXKWFgcDMLjK8Cg1mbhooqzWs7bcmqMCwD3L
	 7hOOTZ80szuOIMBDVlg5SK7mGPZNfia4vmgZyGgjbv//52DZzeyatZIrv7otvzm6Al
	 wyP01HqSm+J+oeomDlKqgf25grFDxZfNJ+gU4Q0+SYOtv5sFrIX8A1gEtPeGZPNTa3
	 7QpzM8EcqGDQgvPEvOs1vR93djgwVkwAsMETW77pS8XhhTozLUdXvEklIdKr+1cUzR
	 3/IgTifLJHg94ybJxbdNc4++tvCewrzt7Po4v3KbSOVR/7nKzTbKxSuql+cu7bjhOl
	 q8+yDqHiQ9Yzw==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5b0117dda13so7353677e87.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:46:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RpLKKLDPI1lmgZcM9GviPKz7buM9e/U4XsfLX0Ih6KhIHHUSdRnkYhiRLu3CuGcfMnFzr7rB6FFKVCFwEN0VK75@lists.infradead.org
X-Gm-Message-State: AOJu0YyVb02MdaemiKijnROUpyz3r2w9yJFRDlGj7PHEU36RRDCr6z2D
	+OtC3O+Cz+FOe9PAsNuCDUyrjC63O+dQZDTm+T75a/KIDRjlUMGIoSUbC0Tv6Lo2m+a6SrzB72N
	T1WBCfVaI5q0MzupnTaMnCvxxGOTILiQ=
X-Received: by 2002:a05:6512:31cb:b0:5ae:bd65:9e04 with SMTP id
 2adb3069b0e04-5b28f84a486mr3730624e87.8.1784623615766; Tue, 21 Jul 2026
 01:46:55 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-10-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-10-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:46:43 +0200
X-Gmail-Original-Message-ID: <CAD++jLnwHt=-WJDbzXxOcfpit4YTuXkvCHKiDhpc3DnPuvMrrA@mail.gmail.com>
X-Gm-Features: AUfX_mwYERH4uDindMiYg6vMc3HQe1SCH5T84GPvgdsU-QjZmsXF2WrTxoMaVYQ
Message-ID: <CAD++jLnwHt=-WJDbzXxOcfpit4YTuXkvCHKiDhpc3DnPuvMrrA@mail.gmail.com>
Subject: Re: [PATCH v17 09/15] arm64: ptrace: Align syscall exit work
 semantics with generic entry
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

> Refactor the syscall exit path to better match the generic entry
> framework. Specifically:
>
> - Introduce `_TIF_SYSCALL_EXIT_WORK` to aggregate exit-time thread
>   flags (trace, audit, tracepoint).
>
> - Rename `syscall_trace_exit()` to `arm64_syscall_exit_work()` to
>   better reflect its role.
>
> - Move `rseq_syscall()` out of `arm64_syscall_exit_work()` and into
>   `arm64_syscall_exit_to_user_mode_work()` so that it runs
>   unconditionally on all exits, consistent with generic entry.
>
> - Gate `arm64_syscall_exit_work()` behind the new flag check,
>   mirroring the generic entry exit's pattern.
>
> Gating audit on `_TIF_SYSCALL_AUDIT` is equivalent to the previous
> `audit_context()` check: the audit context and flag are statically
> allocated at fork and freed at exit, remaining stable throughout
> syscall execution.
>
> No functional changes intended.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

It does indeed align to generic entry AFAICT.
Reviewed-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

