Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF54BEEC2B7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:41:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3dAEu5PVOuCuQR6jVI3/4OYFcoq/jUx3ENH0aU8pdaI=; b=qIsBpHYfFhTATmTvOar1xHbbhw
	PFBIhm4l8l+FvKNmrZ3XPSGIpqMC563Uf9enM+2jWaIZQgIS33cS3QXvocTxz26XHwH1stDXjMy8V
	qeexTv3gZPv62J6r3NSXesmJW02UFu7ZlLcNEXg/QWG/nk7Tp7QOsQvrRL1sRwgkzFG10LLtiPLLA
	IjrvUcdqFk7kYv2OE4d49t+wYylsDqYTRzpcv1/wEois4d21ElMEins3HP4mU6ZBVb/ZLNBMh9iB5
	0dFpuhHfRQNU9S/HRbvclIbFUc75uwuygeOCST61cDyVdTWlUwY1TsuKLMusGOHxNbjpE/rGNU796
	8+PAjMbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhQF-00000001Hlv-2LjM;
	Tue, 24 Feb 2026 01:41:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhQD-00000001Hld-48ZH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:41:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E86D2600AE
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:41:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C7E5C116C6
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:41:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771897267;
	bh=C0arap7e7ErnJBW4Gn1rKZG1I696BkggqBdWrjRMig8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=PcFhxqGfs4x6ojAoWOJ2rb4klb5JydefbuelWwG/YTKlf877rWdg200FWqVWL0Ped
	 xaUkRJM/TQrgkSh2CE5IdQwx8uaCbXPpLNpr0t8AWdzOS2ohLwQY59VtaUYM8L1Nub
	 JRId/E+xxYgSdx+4a73xSEMcpaAFF11TI9uDEAlt+NNfbGwxxK60oVOwbEPBn72mvs
	 Mq05zOhFQJTII+DpobEDzC9eixZZu+WdyYNI0751THHEFjOM7PhLSGnNdmwuEawPI2
	 JrtrIyKpflD3bhPmbl3zHDTqKW0e3eHLDGBWSSmttDdCHmAQhkzud+B+888AGfFqbo
	 aOe51MazNHd7A==
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-4358fb60802so3608712f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:41:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWJwkIM/22d1F/MOvt98KKlRLi9uRXDADp4fwGe6AJZO82LQxphTYTBfTgnrz4z6njMWkMoJ1N9uWlSsrD+xWrp@lists.infradead.org
X-Gm-Message-State: AOJu0YwnJbpu3xHp48mOIIiSReXtjKrm00DR+QkcA+TdVfBr3jVsUK2e
	l7ICGq/HwT1ddbA1RbObl60q16WAD8M6ZuMpGUK/sGL30nGxfK1yXU2+nwwwmfLH4uibZNaemOQ
	mrUDywYBYguMIhKDKJZikbozMZNEw52c=
X-Received: by 2002:a5d:588d:0:b0:435:bdc2:461 with SMTP id
 ffacd0b85a97d-43962733de0mr29840042f8f.21.1771897266184; Mon, 23 Feb 2026
 17:41:06 -0800 (PST)
MIME-Version: 1.0
References: <20260220090922.1506-1-jszhang@kernel.org> <20260220090922.1506-3-jszhang@kernel.org>
In-Reply-To: <20260220090922.1506-3-jszhang@kernel.org>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 09:40:54 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
X-Gm-Features: AaiRm50lHvRaJWlxL081KRQ9Nsp_QxSbpbb_HVp27aHXjz14wyjJ-xtZBksh99A
Message-ID: <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
Subject: Re: [PATCH 2/3] genirq: use runtime constant to optimize
 handle_arch_irq access
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-csky@vger.kernel.org
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Fri, Feb 20, 2026 at 5:28=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org> =
wrote:
>
> Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
> is a pointer which is set during booting, and every irq processing needs
> to access it, so it sits in hot code path. We can use the
> runtime constant mechanism which was introduced by Linus to speed up
> its accessing.
>
> Tested on Sipeed Lichee Pi 4A (riscv64) board, the perf sched benchmark i=
s
> improved by ~5.8%
Thx for the work. It's a visible improvement.

Compared to the original handler pointer approach, this solution
introduces no observable drawbacks. Since the static_call alternative
requires further analysis and consensus, adopting this implementation
serves as a pragmatic interim step.

So, I give:
Reviewed-by: Guo Ren (Alibaba Damo Academy) <guoren@kernel.org>

>
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  include/linux/irq.h | 4 +++-
>  kernel/irq/handle.c | 8 +++++---
>  2 files changed, 8 insertions(+), 4 deletions(-)
>
> diff --git a/include/linux/irq.h b/include/linux/irq.h
> index 951acbdb9f84..2ba4a8afb71e 100644
> --- a/include/linux/irq.h
> +++ b/include/linux/irq.h
> @@ -1274,6 +1274,7 @@ void ipi_mux_process(void);
>  int ipi_mux_create(unsigned int nr_ipi, void (*mux_send)(unsigned int cp=
u));
>
>  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> +#include <asm/runtime-const.h>
>  /*
>   * Registers a generic IRQ handling function as the top-level IRQ handle=
r in
>   * the system, which is generally the first C code called from an assemb=
ly
> @@ -1288,7 +1289,8 @@ int __init set_handle_irq(void (*handle_irq)(struct=
 pt_regs *));
>   * Allows interrupt handlers to find the irqchip that's been registered =
as the
>   * top-level IRQ handler.
>   */
> -extern void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
> +extern void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init;
> +#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
>  asmlinkage void generic_handle_arch_irq(struct pt_regs *regs);
>  #else
>  #ifndef set_handle_irq
> diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
> index b7d52821837b..aac9e7b1301e 100644
> --- a/kernel/irq/handle.c
> +++ b/kernel/irq/handle.c
> @@ -15,13 +15,14 @@
>  #include <linux/kernel_stat.h>
>
>  #include <asm/irq_regs.h>
> +#include <asm/runtime-const.h>
>
>  #include <trace/events/irq.h>
>
>  #include "internals.h"
>
>  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> -void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
> +void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init;
>  #endif
>
>  /**
> @@ -270,10 +271,11 @@ irqreturn_t handle_irq_event(struct irq_desc *desc)
>  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
>  int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
>  {
> -       if (handle_arch_irq)
> +       if (_handle_arch_irq)
>                 return -EBUSY;
>
> -       handle_arch_irq =3D handle_irq;
> +       _handle_arch_irq =3D handle_irq;
> +       runtime_const_init(ptr, _handle_arch_irq);
>         return 0;
>  }
>
> --
> 2.51.0
>


--=20
Best Regards
 Guo Ren

