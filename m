Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D872C43458
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 10:07:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8AxW5UCVB9I4ZEmDnXWZt7AxoAiw3x+AAtvOHLu6Hgg=; b=J42GOEnKhl+2AmjcJNhJi0AOwz
	7xkSrguWn7A+ZWKtxU85HWzB9hLCUFCb7EXYs+D/bTUH6DWtDCMzHu/DyZ33ixDJYXa63gaY2pZDp
	/52OUTWT8+Kwy9HVZblCRF+F2BEz6PGWLpPx5pkNi2gBHaqL2T4y0sLtqjz8+UsL57ehFvmuZoO8/
	kKmebr/GrVCOuPtjx/Eoe3/CKC0SN1BJeRKRMyTJuLqyK3zht0fOOpqFxa1RbLcOGCefBzVxst3Zk
	jhLfDgPyCOIJQvIZiQLBx1abAY1khUx43NOIwZdM6g5QgdhuS4AYQcOiy84GJ/zeLa/5gm+lJfAl4
	VUVI+6jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPBr-0000000GoK7-03nE;
	Wed, 08 Jul 2026 10:07:39 +0000
Received: from mail-244116.protonmail.ch ([109.224.244.116])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whPBo-0000000GoJc-0HOC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 10:07:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1783505251; x=1783764451;
	bh=8AxW5UCVB9I4ZEmDnXWZt7AxoAiw3x+AAtvOHLu6Hgg=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=arfSaPPakPaNeAXqtZOtRvJD30MJNLmGd/c2hxmASJY84RPOmnifqQCcZgTHfeAOX
	 OZ/bdF3dFif9P9zO+cIxhQFZlJriFucxJG18LJndXc93eM11cbDPfF//Cj1nkgEgBv
	 rf6pGhJXW3EtoT8iyFELZBXalNGSUx/Pj4PnYRDJMvO+qsy2R9tuAT/kb901jI2LcX
	 Bz85ANRxx+q3ouiLWE8Z1jLh7Uhhe8Usu8h+ECdFD6xNO6Ff/oAZkB/jPQZbNbwH7E
	 irL/F1MSs9t7VUYaZgWISvME/zXSyqq2bzgVfVyIjY9u+mQkFmv9MenwUF74dIwnc+
	 Tg4E/PW2r9x1w==
Date: Wed, 08 Jul 2026 10:07:27 +0000
To: Linus Walleij <linusw@kernel.org>
From: slipher <slipher@protonmail.com>
Cc: Russell King <linux@armlinux.org.uk>, Nathan Chancellor <nathan@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Kees Cook <kees@kernel.org>, "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>, linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] ARM: breakpoint: CFI breakpoints only on demand
Message-ID: <qlzOoC3H1cezSCgEcSHFAsIzjIpiey39PPOkvJETHWONt4zEGNKvfAvczIlUrGK_d97QWDAzUcu8XEN1nMtAVjF09P78iJ2DWEB4LmsWQNs=@protonmail.com>
In-Reply-To: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
References: <20260703-arm32-cfi-bug-v4-1-c26acb640a8f@kernel.org>
Feedback-ID: 10906495:user:proton
X-Pm-Message-ID: 4dda027aceb9c323b5aa45b7394259e04fd93134
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_030736_271958_5F36E398 
X-CRM114-Status: GOOD (  24.72  )
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

On Friday, July 3rd, 2026 at 7:25 AM, Linus Walleij <linusw@kernel.org> wro=
te:

> This removes the stub hw_breakpoint_cfi_handler() from ARM, making
> it not steal breakpoint type 0x03 (ARM_ENTRY_CFI_BREAKPOINT) unless
> CFI is actively used in the kernel.
>=20
> When not instrumenting with CFI, or when a breakpoint is issued in
> userspace, we fall through to return 1 from hw_breakpoint_pending()
> "unhandled fault" so userspace can make use of this breakpoint.
>=20
> Tested with LKDTM and this command line:
> echo CFI_FORWARD_PROTO > /sys/kernel/debug/provoke-crash/DIRECT
> still works as expected.
>=20
> Fixes: c3f89986fde7 ("ARM: 9391/2: hw_breakpoint: Handle CFI breakpoints"=
)
> Reported-by: slipher <slipher@protonmail.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Closes: https://lore.kernel.org/lkml/kJqktbpLphg_Pk5I5SPptgTLjl3E3eq5mN5U=
zCslyFj7Q1Irp-wDid4mj5eQVd2iZtRGXgeZd8goq195EkXdjyt864YMc8mVb2B9NGH91NQ=3D@=
protonmail.com/
> Signed-off-by: Linus Walleij <linusw@kernel.org>
> ---
> Trying to solve the CFI bug. Let's see of this first
> approach is acceptable for the reporter.
> ---
> Changes in v4:
> - Dodge the BKPT if we are coming from userspace!
> - Would be great if the reporter can test this with and without
>   CONFIG_CFI.
> - Link to v3: https://patch.msgid.link/20260701-arm32-cfi-bug-v3-1-e3c37e=
2b80a4@kernel.org
>=20
> Changes in v3:
> - Actually strip the RFC prefix...
> - Link to v2: https://patch.msgid.link/20260701-arm32-cfi-bug-v2-1-9bf922=
593e00@kernel.org
>=20
> Changes in v2:
> - Resending as non-RFC so it can be applied as a band-aid.
> - Link to v1: https://patch.msgid.link/20260626-arm32-cfi-bug-v1-1-a467b5=
050c0b@kernel.org
>=20
> To: Will Deacon <will@kernel.org>
> To: Mark Rutland <mark.rutland@arm.com>
> To: Russell King <linux@armlinux.org.uk>
> To: Kees Cook <kees@kernel.org>
> To: Sami Tolvanen <samitolvanen@google.com>
> To: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
> To: Linus Walleij <linusw@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-perf-users@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/arm/kernel/hw_breakpoint.c | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>=20
> diff --git a/arch/arm/kernel/hw_breakpoint.c b/arch/arm/kernel/hw_breakpo=
int.c
> index cd4b34c96e35..38feb30dfb5f 100644
> --- a/arch/arm/kernel/hw_breakpoint.c
> +++ b/arch/arm/kernel/hw_breakpoint.c
> @@ -929,10 +929,6 @@ static void hw_breakpoint_cfi_handler(struct pt_regs=
 *regs)
>  =09=09break;
>  =09}
>  }
> -#else
> -static void hw_breakpoint_cfi_handler(struct pt_regs *regs)
> -{
> -}
>  #endif
>=20
>  /*
> @@ -964,9 +960,14 @@ static int hw_breakpoint_pending(unsigned long addr,=
 unsigned int fsr,
>  =09case ARM_ENTRY_SYNC_WATCHPOINT:
>  =09=09watchpoint_handler(addr, fsr, regs);
>  =09=09break;
> +#ifdef CONFIG_CFI
>  =09case ARM_ENTRY_CFI_BREAKPOINT:
> -=09=09hw_breakpoint_cfi_handler(regs);
> +=09=09if (user_mode(regs))
> +=09=09=09ret =3D 1; /* Don't handle userspace BKPT */
> +=09=09else
> +=09=09=09hw_breakpoint_cfi_handler(regs);
>  =09=09break;
> +#endif
>  =09default:
>  =09=09ret =3D 1; /* Unhandled fault. */
>  =09}
>=20
> ---
> base-commit: 8cd9520d35a6c38db6567e97dd93b1f11f185dc6
> change-id: 20260626-arm32-cfi-bug-10fb960749c4
>=20
> Best regards,
> --
> Linus Walleij <linusw@kernel.org>
>=20
>=20

I tested the program experiencing the regression with this patch applied to=
 v7.2-rc2. It works with and without CONFIG_CFI. Thank you everyone!

