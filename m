Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11BABEA852F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 23:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=921zArKl26Mnf4RNgGyO3i0bNbHogibAeWmWnZkvBN0=; b=lAhDObQfvGCUf9vXcwQk812aQH
	qhxuJsnmIq8Zvh1i/sOYrq0mESUeTUuU4P+tVR9ee3OsgeJ3wZ5R4lwiJ6K5yW8S6Ysm9ZaQx452Q
	vdEqo6OD59T7JZI5vnCGG1CriQrJL5TCxMHEzebIF4419XOLlgYnNWUhus04RB5zygG1gR/xCIzNS
	5D5Pu88QHO5rgSMLSnMeUmVUJn8L0RYNIDVnhHBtYhRXB9Va6/ByC0MgM9s48qpYyhZphcic41bZZ
	oMO+nCXotZRBuToODWz+Iam10XzaRJzila9pgVHmjqa6XqoW2Sny7W7yBArsDijKVBhJWZFeeeCQy
	V5k5z1Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNio-00000006Rp6-0EaL;
	Sun, 08 Mar 2026 23:39:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzNik-00000006Roi-3IzR
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 23:39:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 73F0B40A80
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 23:39:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 482B6C4AF0C
	for <linux-arm-kernel@lists.infradead.org>; Sun,  8 Mar 2026 23:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773013177;
	bh=KLlIK1PnIWNRXYyDi0qZ5dj/x9cd5thZmiNlIUWzgDQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=MlhKuPSI1k14jX4A2xzGSPLdSeMpWoIZsUXlIRtBXkotZ/X2jFC6YgHb7nxy1Ffu2
	 KTI6kQubL4SRbx8muewU9nbe6nBtd+rjnHZnXVBOJbI9p6qqFFPjWTsAW22Q2LAH4r
	 7RxiID6kzBIU1xetHve4USgEvtM04bVbUL6WW+MbhGQqnVjeAacHs1Kn+ahKooqGdF
	 53bbv/UW9RIFGsyVfDaTFCf3U2D0PLNXawoER9tUAe/SlAY9128eOTLM5XR/gCUc8p
	 uc8XRxN2ZSt9f4q8Hu3sjKuBACMFiSDCO94LKkmRnVrs5/PiVvTcJHWRzwzE84shpk
	 NEfStHMoqDIkQ==
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79881805788so115741707b3.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 08 Mar 2026 16:39:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW47rJvPgkTbg2zfev9MYm4iX1uOz9B2wC8H8dXtlrgKz8T3Ktm4T7eD7i4pAg/9jfOWBu2dibQ4swlGw/pCsoS@lists.infradead.org
X-Gm-Message-State: AOJu0Yxk96E3LYg+Fbsdhvs5t/7Od4kwCHPjNJfN37MqEBL8rSdIA/LX
	+Zkv/EDOOvsuyxQjNqL89OiBEDQ2bdW0hFY9+ZAQl7Liw2TDU8L17I7JgdXp8RyI/ujvsQfVeux
	ESOHPlxRbahsW1ocTLfH5c+MuG2d4IP4=
X-Received: by 2002:a05:690c:d90:b0:794:fc73:5d2e with SMTP id
 00721157ae682-798dd746374mr90053257b3.54.1773013176576; Sun, 08 Mar 2026
 16:39:36 -0700 (PDT)
MIME-Version: 1.0
References: <CGME20260305070534epcas5p378bb22ef9f1a895d7736ed2272c19ec6@epcas5p3.samsung.com>
 <20260305070527.719073-1-maninder1.s@samsung.com>
In-Reply-To: <20260305070527.719073-1-maninder1.s@samsung.com>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 9 Mar 2026 00:39:25 +0100
X-Gmail-Original-Message-ID: <CAD++jLmOq51xP3thjjUDZQQ3dff0R-xtV2F3gGMpZaQK=_8kfg@mail.gmail.com>
X-Gm-Features: AaiRm52eBuYHAk6_179RhXbHtq0wOsmJctay29ddzcjgeGwJ9cXsvzw5oin1LKQ
Message-ID: <CAD++jLmOq51xP3thjjUDZQQ3dff0R-xtV2F3gGMpZaQK=_8kfg@mail.gmail.com>
Subject: Re: [PATCH 1/1] arm: get task_stack reference before dump_backtrace
To: Maninder Singh <maninder1.s@samsung.com>
Cc: linux@armlinux.org.uk, rmk+kernel@armlinux.org.uk, bigeasy@linutronix.de, 
	peterz@infradead.org, kees@kernel.org, ardb@kernel.org, keithpac@amazon.com, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_163939_189934_A12762B4 
X-CRM114-Status: GOOD (  15.28  )
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

On Thu, Mar 5, 2026 at 8:05=E2=80=AFAM Maninder Singh <maninder1.s@samsung.=
com> wrote:

> With Support of THREAD_INFO_IN_TASK, stack of task can be
> freed earlier than task (even if task's reference is taken),
> and it needs separate reference with try_get_task_stack()
> before using the stack.
> Otherwise if someone calls show_stack() for task, it can oops
> the kernel like below: (Tried with normal race of show_stack when
> task still exists, but its stack is freed)
>
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address f8aebec4 when r=
ead
> [f8aebec4] *pgd=3D83c2c811, *pte=3D00000000, *ppte=3D00000000
> Internal error: Oops: 7 [#1] SMP ARM
> ..
> CPU: 0 UID: 0 PID: 70 Comm: cat Not tainted 7.0.0-rc2-next-20260302+ #26 =
VOLUNTARY
> ..
> PC is at __read_once_word_nocheck+0x0/0x8
> LR is at unwind_frame+0x6b0/0xa90
> ...
> Call trace:
>  __read_once_word_nocheck from unwind_frame+0x6b0/0xa90
>  unwind_frame from unwind_backtrace+0x178/0x1e0
>  unwind_backtrace from show_stack+0x10/0x14
> ...
>
> ARM64 also takes care of it in dump_backtrace(), so same logic
> is added for ARM also.
>
> Fixes: 18ed1c01a7dd ("ARM: smp: Enable THREAD_INFO_IN_TASK")
> Signed-off-by: Maninder Singh <maninder1.s@samsung.com>

Ard B should review this but it looks right to me:
Acked-by: Linus Walleij <linusw@kernel.org>

Yours,
Linus Walleij

