Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D01EFB7E1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Feb 2026 01:59:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vzy0d1KdZ+m88X3TYqLPS0jXTKZvMRVdsIYJOCi4dx4=; b=gVUNtAgAYUZfebFlxQbn9UD/GS
	tZUrT2aO/IQUymLWRhJ3sovXwmHP1TOmB1T06teAVKQxONq7VWRQiiHMJH/oz1HY1ChbyhjfpjaSJ
	mXHPuPly8nKnfQworJvhXrUHWOAd5TWQlTyEvKmU2puVDPpEB5lhqYWYRb5hUIXc+Pw5Pp5EVA/Ki
	uVqaDnCdMaP6SwIwFsMh5JpBlnm9Zm/oguMFtduxlH+YEuy6iryGKJw9RnGx/0Y7megNb5VsDbHfR
	90Jz+x9jYISNxWPG6yXAix1hv2C7VJHxadzIRE8RZ2jjQaOV+gWvXfJOquOTk5VrpQk1gNNix4aw5
	RpBR8z9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhhx-00000001K9A-10CE;
	Tue, 24 Feb 2026 01:59:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuhhu-00000001K83-46ll
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Feb 2026 01:59:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id BAEB44331F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:59:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C53DC4AF09
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Feb 2026 01:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771898365;
	bh=HUSNu0qCdup046cMKoUH8b6Lgd4CUue87zXyU4Qz5t8=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QXz6fZKxw+h8NdK0FPv0o7u2Bq6/p1li3kUuFhFtIZY/L0QkK1Y+ZY5NyhmKRwp+T
	 U87tJPnbJCIpF6L0QWtaSCivPTz40kWk86F6tnouWqcCeItcEZZs9tZ0beu7RxZhsw
	 ANeviFXdu477c9blcCZSYUtlfsmxgJVHFxoYppbp93s4ieFNvVdviKwKHwEARFiG7U
	 plQT65mYRa1qSZuusMTVzo4iYv+3m1Mnu4vfqV/PBeeeiX5I7M3W6BKWXwnYsV1/xD
	 3cN4HUg+NSC6ueW9C1QnOr4wmqhrC+I81RAMYVehZkVh4BMOEkX0tme+XfRhbtj342
	 0383/BKzVYEKA==
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4376c0bffc1so3728238f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Feb 2026 17:59:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXqcbjASToUymGzRqYyVMymrZPgeQ0w48jSDttje6r/a0TuAmBZr7WyyP6jZ8xdiBzydYyeHPOE9xYDXX9HkwA@lists.infradead.org
X-Gm-Message-State: AOJu0Yxp2QSvgP/7PzCedLJSerVyMKjRbZ9FI2IUxvCEvUYec7tcmFVr
	2bp+rMur10AMLGa5ARB6gM8Q6Mv18JD1GnY8xR4lEaEuhAkqKESplTG5OEv9MtNrlae/Qw8e0fU
	tPd710hlFWbiMcR3Ntm6rPHK87VISpo0=
X-Received: by 2002:a5d:5d0f:0:b0:432:dc1f:6982 with SMTP id
 ffacd0b85a97d-4396f166a56mr20299830f8f.16.1771898364140; Mon, 23 Feb 2026
 17:59:24 -0800 (PST)
MIME-Version: 1.0
References: <20260220090922.1506-1-jszhang@kernel.org> <20260220090922.1506-3-jszhang@kernel.org>
 <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
In-Reply-To: <CAJF2gTTG849M7mmWo+sri0xoGYkKYxMwSEDhVr-OedMfMWC0Kw@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 24 Feb 2026 09:59:11 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS=K5xGC4-QmfkeDqUm9NnPeW+W1iXygtbdyyue6mE4cA@mail.gmail.com>
X-Gm-Features: AaiRm53aHGtNOtCoyPrAzHoJqBMoFTvGVjdue5H2QAZd3FSX-1Ad_VdzKLg1NNg
Message-ID: <CAJF2gTS=K5xGC4-QmfkeDqUm9NnPeW+W1iXygtbdyyue6mE4cA@mail.gmail.com>
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
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_175927_077534_3895B5CD 
X-CRM114-Status: GOOD (  27.42  )
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

On Tue, Feb 24, 2026 at 9:40=E2=80=AFAM Guo Ren <guoren@kernel.org> wrote:
>
> On Fri, Feb 20, 2026 at 5:28=E2=80=AFPM Jisheng Zhang <jszhang@kernel.org=
> wrote:
> >
> > Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
> > is a pointer which is set during booting, and every irq processing need=
s
> > to access it, so it sits in hot code path. We can use the
> > runtime constant mechanism which was introduced by Linus to speed up
> > its accessing.
> >
> > Tested on Sipeed Lichee Pi 4A (riscv64) board, the perf sched benchmark=
 is
> > improved by ~5.8%
> Thx for the work. It's a visible improvement.
>
> Compared to the original handler pointer approach, this solution
> introduces no observable drawbacks. Since the static_call alternative
> requires further analysis and consensus, adopting this implementation
> serves as a pragmatic interim step.
>
> So, I give:
> Reviewed-by: Guo Ren (Alibaba Damo Academy) <guoren@kernel.org>

Oh, don't forget Mark's suggestion for the uninitialized handler,
which is also suitable for genirq:

"That means that if set_handle_irq() isn't called, an IRQ will result in
a call to that bogus address rather than default_handle_irq(), ..."

Maybe we need an empty _handle_arch_irq instance as a default for the
early stage.

>
> >
> > Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> > ---
> >  include/linux/irq.h | 4 +++-
> >  kernel/irq/handle.c | 8 +++++---
> >  2 files changed, 8 insertions(+), 4 deletions(-)
> >
> > diff --git a/include/linux/irq.h b/include/linux/irq.h
> > index 951acbdb9f84..2ba4a8afb71e 100644
> > --- a/include/linux/irq.h
> > +++ b/include/linux/irq.h
> > @@ -1274,6 +1274,7 @@ void ipi_mux_process(void);
> >  int ipi_mux_create(unsigned int nr_ipi, void (*mux_send)(unsigned int =
cpu));
> >
> >  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> > +#include <asm/runtime-const.h>
> >  /*
> >   * Registers a generic IRQ handling function as the top-level IRQ hand=
ler in
> >   * the system, which is generally the first C code called from an asse=
mbly
> > @@ -1288,7 +1289,8 @@ int __init set_handle_irq(void (*handle_irq)(stru=
ct pt_regs *));
> >   * Allows interrupt handlers to find the irqchip that's been registere=
d as the
> >   * top-level IRQ handler.
> >   */
> > -extern void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
> > +extern void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init;
> > +#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
> >  asmlinkage void generic_handle_arch_irq(struct pt_regs *regs);
> >  #else
> >  #ifndef set_handle_irq
> > diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
> > index b7d52821837b..aac9e7b1301e 100644
> > --- a/kernel/irq/handle.c
> > +++ b/kernel/irq/handle.c
> > @@ -15,13 +15,14 @@
> >  #include <linux/kernel_stat.h>
> >
> >  #include <asm/irq_regs.h>
> > +#include <asm/runtime-const.h>
> >
> >  #include <trace/events/irq.h>
> >
> >  #include "internals.h"
> >
> >  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> > -void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
> > +void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init;
> >  #endif
> >
> >  /**
> > @@ -270,10 +271,11 @@ irqreturn_t handle_irq_event(struct irq_desc *des=
c)
> >  #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
> >  int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
> >  {
> > -       if (handle_arch_irq)
> > +       if (_handle_arch_irq)
> >                 return -EBUSY;
> >
> > -       handle_arch_irq =3D handle_irq;
> > +       _handle_arch_irq =3D handle_irq;
> > +       runtime_const_init(ptr, _handle_arch_irq);
> >         return 0;
> >  }
> >
> > --
> > 2.51.0
> >
>
>
> --
> Best Regards
>  Guo Ren



--=20
Best Regards
 Guo Ren

