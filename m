Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DE0C4451C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 08:55:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+udoP9bpLuD/FuhqJDkgPC7XrvFSE/5o+cm7TZnYZm0=; b=o0qmEoXi2dqCxR
	Zs3g2CA/8bND7cD3+yQTLL0R/3eD0GCS+dRr6DV2msc2G1bPGXaLm+Z87a3C9KXuhGsqq1WLDejX6
	Xge0DHzAo6AHAmMaJJ+le4YbT8MQUFdYD8ptFSB040iYYb9wQZgOEdlNYea6Uci2lw593jBnr48SC
	VpPVYiyXhJsYDO/+bcoQFVCQVswMXXqn6WWEDOxNCTcA0chJ7ekuZHu2PQ9+uVQdzo5mLGBDDYWvY
	VnGkicNBOwbp4kWBCLZif1WsUywWxTYLfWA4UaiXtfXP04lfnLzjp/Bf70zHtTlnZkz+7lcWksKNi
	a+5oRolmwSxjeQgx8dHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Fx-00000008tHB-1iEy;
	Tue, 21 Jul 2026 08:55:17 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wm6Fw-00000008tH5-3Cux
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 08:55:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 71A504509F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:55:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 595851F00A3D
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 08:55:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784624116;
	bh=+udoP9bpLuD/FuhqJDkgPC7XrvFSE/5o+cm7TZnYZm0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=iisKK8sgq0MTBZx1da6Nfg41IiKRkWZCAiUOSPwGEm+wlYS2rqO7wwO5/HLCFiBBo
	 CspqHpcL/uVDH3P7vAe4fgtPhceAyBTgadzGCLJ8uqmorXPGBg4wEdLCUOAI4NszEs
	 dUK3jcdUHV+oFNjBOAQxn5G/1jvPznsNxtNgX/PQ/uW10QxFHseaePD+BVZqjrfy9C
	 NkByULDo3F6mVgZ1qD9CEFEbXnp0jLt4rf23/2AKt32jcvobVHQfmVpY8V1nL5u501
	 vDIxdUTOTZ+sjUgAP9LXiJQO5LJK96y0uVZhAiTSVwobT8Hat/e1eEmdU1ohpKqpHU
	 t4+P1OAS9kpNA==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aebd52488cso11583975e87.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jul 2026 01:55:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rp6X1BsdkuwMIjyMUpBwSI+Av9zl6qL7erOtn2Sdbh+3UselbbtUbtvQbs40LOhJ/9jITTuugRq7OvVcJsQoTAK@lists.infradead.org
X-Gm-Message-State: AOJu0YxIXOhZcWb8JxBuwG9eMeeOeSj/FoPWNIb8MznBzhGg7iEYANVI
	/4UmMIdFprLBSHWtmPGb8PZHRCRRhsdF3FrGnHil4C2v3TeY2B3cvGlARqyaSreA+f/nqGR33/X
	1rtrfiVjYtvh/kIf0qyozKemrI2RSZt0=
X-Received: by 2002:a05:6512:6d2:b0:5ae:b792:7f1e with SMTP id
 2adb3069b0e04-5b28f9ac8bbmr4154050e87.30.1784624115027; Tue, 21 Jul 2026
 01:55:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260721081858.1169276-1-ruanjinjie@huawei.com> <20260721081858.1169276-16-ruanjinjie@huawei.com>
In-Reply-To: <20260721081858.1169276-16-ruanjinjie@huawei.com>
From: Linus Walleij <linusw@kernel.org>
Date: Tue, 21 Jul 2026 10:55:03 +0200
X-Gmail-Original-Message-ID: <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
X-Gm-Features: AUfX_mzzb3lQ09c4zH2YPpivf-4j4IDejfx1qyUuGSOUbGFbX3JjubmvWtjOIvU
Message-ID: <CAD++jL=Ou_HF5VchexnjUf9qwzrz0xgY+NhA5gZhOwiwdxUi-g@mail.gmail.com>
Subject: Re: [PATCH v17 15/15] arm64: vdso: Expose sigreturn address on vdso
 to the kernel
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

> Syscall User Dispatch (SUD) must not intercept the signal trampoline
> code, otherwise returning from a signal with a locked selector may
> cause infinite recursion into the signal handler.
>
> Provide an arm64 implementation of arch_syscall_is_vdso_sigreturn()
> to exclude these sigreturn syscalls from dispatch.
>
> For native 64-bit tasks, check whether the current PC matches the 'svc #0=
'
> instruction inside the vDSO sigreturn trampoline (defined in
> arch/arm64/kernel/vdso/sigreturn.S as below).
>
>         SYM_CODE_START(__kernel_rt_sigreturn)
>                 mov     x8, #__NR_rt_sigreturn
>                 svc     #0
>         SYM_CODE_END(__kernel_rt_sigreturn)
>
> For COMPAT tasks, verify that the instruction falls within the dedicated
> 'sigpage' range, since compat signal handlers use this architecture-
> specific page (not the vDSO) for their return trampoline. This prevents
> SUD from incorrectly dispatching syscalls issued during signal return.
>
> Suggested-by: Thomas Wei=C3=9Fschuh <thomas.weissschuh@linutronix.de>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: kemal <kmal@cock.li>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

I'm a bit scared about SUD.

Certainly we can merge patches 1-14 first and iron out
any trouble related to that and split this off so a separate
series to be applied lated?

Yours,
Linus Walleij

