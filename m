Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D45CA5FB1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 10:11:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EWo6p8KlBWCQx6YVQZFYv1sMvH+inX9WO+NPCJKxgw=; b=vOp71AvBKpD9EwhQ8nkCexIMds
	L+I52VKyAYOo8/kZdiVQHG/HMXwriEwRo1xL3LhrC838SZom8c8sX0I8PdxehIuGa03TvoVUSjXHX
	2jjHNGOQmudxX5uo2IiuCmqDcCr+5TdGdm1e1WiQqN3Gyhz4KT2eNSqZEIxM4MdsBnlvOxbOB47Yd
	Tr4pctEYLukvQxTxvza8DrUim9ltaI10RCbF8b9pgTQUAUWarKJIOBlThEfxyDw1FwaUEyCR8Jy48
	GZze3yI4yIU5ap0XLSFzxPO5aVHYwYeg7tEBdMs/LUKKaWFG7g9vwXxHOPzYSfZasYCdxaKnKp8lt
	FQJxdmJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrHs-00000005gdi-2xTW;
	Wed, 30 Sep 2026 10:11:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBrHr-00000005gdR-1XO8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 10:11:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23B34416F0
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:11:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089851F0089B
	for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 10:11:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790763103;
	bh=0EWo6p8KlBWCQx6YVQZFYv1sMvH+inX9WO+NPCJKxgw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=QDiGOHqIeaUrLYTVZDjKmEMNIIf+qilOJOuYM92pXLHSlUdEH7PJ4lSPMvtpI4sV6
	 m70WxyfzwDFMPKqj0+cpHTW0VkkD6GxOs8cG+mTXytaFjFq2LYVu7a9I+4Ai8+S32d
	 g+LHsPP5FzZwMNK0tyRCcNWuKYf72Dv+tkInP5LgBos+Yi3M56J4uFbjXNLFwT0iSB
	 GzxXC+x6k0SEvSzBtQlzAXMu6utdA/kbTpUVpL8f5tJ1rzEcF5O8K2IwsHP79f0iPb
	 HbmM3nYW5KH1t9eZM1fB9xuVQWnZUOWLjVGdu/G1TiJHnOD+exyH1nbR3uJI1EgI1A
	 +RIdtypVFGDjA==
Received: by mail-lf2-f13.google.com with SMTP id 2adb3069b0e04-5ba3fc22439so332129e87.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 03:11:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxctllcbtFoaG4CJ18jURXTCS6BtmAI6M5O/ffGHDpHnB+OexJFa2QFWIaVVepM6xE+2D7FfFwmluTeZCJRiIsg@lists.infradead.org
X-Gm-Message-State: AFq9FYJbX26MXKAgTMCk6Z0fIY64dXJMMYjhDnKkymTZRDBBvINvuwhs
	3bNYRxI4uMlzBi/p+g2CsZQ8clwsogk7iT5o1EyAqztPoEHT8Plbx5exqTId2EVNU/HhI0O3Rnn
	xIwZy2ykLCwAzmMnrMiS4iC0OxtB67Zo=
X-Received: by 2002:a05:6512:1284:b0:5b8:eb27:a009 with SMTP id
 2adb3069b0e04-5ba403e8c88mr391858e87.17.1790763101738; Wed, 30 Sep 2026
 03:11:41 -0700 (PDT)
MIME-Version: 1.0
References: <20260930-b4-cs75xx-v1-0-4617c4463529@gmail.com> <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
In-Reply-To: <20260930-b4-cs75xx-v1-4-4617c4463529@gmail.com>
From: Linus Walleij <linusw@kernel.org>
Date: Wed, 30 Sep 2026 12:11:29 +0200
X-Gmail-Original-Message-ID: <CAD++jLkXyh9ujjFEE5UwpMnj7Ykgb5_W+Mp-YXBakn5Q=_vj1g@mail.gmail.com>
X-Gm-Features: AclHuK9D1YrrFJkuaJFhntBMU6VT-QvYR-f9D3TnSmauiV2lOTXiqfdERNyux_Y
Message-ID: <CAD++jLkXyh9ujjFEE5UwpMnj7Ykgb5_W+Mp-YXBakn5Q=_vj1g@mail.gmail.com>
Subject: Re: [PATCH RFC 04/10] ARM: cortina: Add support for the CS75xx SoC family
To: filipp.dunsky@gmail.com
Cc: Arnd Bergmann <arnd@arndb.de>, Krzysztof Kozlowski <krzk@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Russell King <linux@armlinux.org.uk>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Drew Fustini <fustini@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org
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

On Wed, Sep 30, 2026 at 9:00=E2=80=AFAM Fil Dunsky via B4 Relay
<devnull+filipp.dunsky.gmail.com@kernel.org> wrote:

> From: Fil Dunsky <filipp.dunsky@gmail.com>
>
> The Cortina Systems CS75xx ("Goldengate G2") are network processors
> with two Cortex-A9 cores, an SCU, GIC, the Cortex-A9 global and private
> timers and a PL310 L2 cache controller. The CS7542 is used, among others,
> in the Securifi Almond+ router.
>
> The generic DT machine is sufficient for the platform, so only the SMP
> bring-up needs code: the bootloader parks the secondary core in a WFE
> loop that polls a global software register, so boot it by writing the
> physical address of secondary_startup to the register named by the
> cpu-release-addr property and issuing SEV.
>
> The CPU is a Cortex-A9 r2p1, so select the errata workarounds that apply
> to that revision and can be enabled on a multiplatform kernel. The PL310
> is r3p2 and needs none of the PL310 workarounds.
>
> Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>

It's a bit weird to have a mach-cortina when mach-gemini is actually
also a Cortina SoC.

Could we call it mach-goldengate?

> +++ b/arch/arm/mach-cortina/platsmp.c
> @@ -0,0 +1,71 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SMP support for the Cortina Systems CS75xx SoCs
> + *
> + * The bootloader parks the secondary core in a WFE loop that polls a
> + * global software register and jumps to the address found there once it
> + * becomes non-zero. The register is described by the cpu-release-addr
> + * property of the secondary CPU node.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/of.h>
> +#include <linux/of_address.h>
> +#include <linux/smp.h>
> +#include <asm/smp_plat.h>
> +#include <asm/smp_scu.h>
> +
> +static int cs75xx_boot_secondary(unsigned int cpu, struct task_struct *i=
dle)
> +{
> +       struct device_node *np;
> +       void __iomem *release;
> +       u64 addr;
> +       int ret;
> +
> +       np =3D of_get_cpu_node(cpu, NULL);
> +       if (!np)
> +               return -ENODEV;
> +
> +       ret =3D of_property_read_u64(np, "cpu-release-addr", &addr);
> +       of_node_put(np);
> +       if (ret) {
> +               pr_err("CPU%u: missing cpu-release-addr\n", cpu);
> +               return ret;
> +       }
> +
> +       release =3D ioremap(addr, sizeof(u32));
> +       if (!release)
> +               return -ENOMEM;
> +
> +       writel(__pa_symbol(secondary_startup), release);
> +       iounmap(release);
> +
> +       /* The secondary core waits in WFE, wake it up */
> +       dsb_sev();
> +
> +       return 0;
> +}
> +
> +static void __init cs75xx_smp_prepare_cpus(unsigned int max_cpus)
> +{
> +       struct device_node *np;
> +       void __iomem *scu_base;
> +
> +       np =3D of_find_compatible_node(NULL, NULL, "arm,cortex-a9-scu");
> +       scu_base =3D of_iomap(np, 0);
> +       of_node_put(np);
> +       if (!scu_base) {
> +               pr_err("failed to map SCU\n");
> +               return;
> +       }
> +
> +       scu_enable(scu_base);
> +       iounmap(scu_base);
> +}
> +
> +static const struct smp_operations cs75xx_smp_ops __initconst =3D {
> +       .smp_prepare_cpus       =3D cs75xx_smp_prepare_cpus,
> +       .smp_boot_secondary     =3D cs75xx_boot_secondary,
> +};
> +
> +CPU_METHOD_OF_DECLARE(cs7542_smp, "cortina,cs7542-smp", &cs75xx_smp_ops)=
;

I am OK with this because it's not like we will add hundreds of these,
I just note that ARM64 has abstracted the spin table handling into a single
driver used by all such systems:
arch/arm64/kernel/smp_spin_table.c

But implementing it for ARM is probably overzealous and just a waste
of everyone's time.

Yours,
Linus Walleij

