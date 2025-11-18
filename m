Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC797CED63B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 13:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BHhCA9cigoUdPwap5WRlueW/Hs8cXSQrGektg/X2Gas=; b=lOOmIx/AB9vS1BBSvr+H50UUDv
	hbEeJ1HfB8zTBQXQ7MVYXka604LJF4RelXIxvdJoBgT2WuDXrWCzVAsagPpmDM6sTW2F89VpE9k2e
	jY0rrLPecaFYXuNxEBxch19YHekgVoDZJIrtXVvQERrhpN4CrYNva1X8+Ze2Roybwp96e9CbYhezv
	nYPM6v6HWN2wFPB6YwDZ8jPFv3MlxQYsYcrRMVn8pLV7vi8uKWUDQ3qY7NMwZRZ9Qg1L1MjqcdZZ8
	97esW23VaR68YbC9rHUi5iNlobN59PAw0/0DyiRDvdqbuZLqI38lnxgIk0DWPXG+G/kaIPiRHEgn/
	ymVQueeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLer-00000000Syq-16gl;
	Tue, 18 Nov 2025 13:22:09 +0000
Received: from mail-vk1-f173.google.com ([209.85.221.173])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLLeo-00000000Sxr-48lv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 13:22:08 +0000
Received: by mail-vk1-f173.google.com with SMTP id 71dfb90a1353d-559966a86caso1342556e0c.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:22:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763472125; x=1764076925;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BHhCA9cigoUdPwap5WRlueW/Hs8cXSQrGektg/X2Gas=;
        b=CdFJCwlI3GhXpRyy2V09/fhMyW5ioK/rKLIGOmdkm1kyWuOgg1M2ZCI7vfymN/osUH
         p6SpfSdSKn3M1LoLOSEx+uwSj0fj/GP1srcXyajx1stehDaKbYoQINt4iDGr7F+wmPE4
         0KXQEPBUrRIyfUX/PHPoEwdNs6t1NwOgefICCik4a/6a6XYg1oY6FvqNiQUHNHasm6FQ
         cgpCMG5xM2CXs8M2alLNK7uNcCoWjOUJwTwvqmVc0Zgey7gRSRHxfkwGAHUKNhrA2z79
         Nn94Z1voGdcW1BpFYkNfTN5ubhMgV+yEN9KFfh7l8G2GDMtcwtKrtbWGtKJaUMy9ad+o
         x5bA==
X-Gm-Message-State: AOJu0Yw6xbAI4lxe2MIW14GZhy/JI0Lq+w0QrglYv8zPQsXn/wep3RcE
	pMvFfV8G+BhnIazwtdC9RQRVgu0BtQsLlJ3ufk1m57greXEyjqH2y/YYCPl1ZaJ7
X-Gm-Gg: ASbGncsOcOgkY/y5147KY5uQnzFNrXup+qdeHLUOh95vwvXm7Gnxe4yWaOqM023H7v7
	DyReap0qMR7diumls2QR8WDmw77LralbpBwuzxH5JkuGojD3gn5RVj/GejtRu8h1vwkbPnfU4W+
	qd/E/Funbviw/NGzw1yY7hRS0nwrQ21pzwCNsRGTmV+PhuayxjWW2IROOyVA+Bz05WQaX1HFN4v
	bvktnGjyV7S1OsCcsOACJx8Fl3AT15bT4Kd8ChN+QGe7r5QyyLDEGU9+GsPuXZsULd1XoMYtUff
	1WR/nOc78PbI83923p+jzfqV6un+dHS6pQrBFHRL7ydg0R8PN8kZkns1ffolLegB6Lo5X6jTgFN
	5KtsPAta8EWFkaaV2XmJsLT0J48EaW/2SwXU+s1mC90sQAIeu9I+NmrZTk/wfB/ZhGc05+UdRNd
	QJ3v3w9C0HO9320qFjIWvNDX2710zC9VTlSMhSvwJMz4xsw31sXw/8XcQQJsE=
X-Google-Smtp-Source: AGHT+IFYRyF8zm3eJyFaT7EKwidkq2o3g6Ub6ooQFtDYjTOd35hm2o4lHC14XaotLOx13LLrlFnQ0g==
X-Received: by 2002:a05:6122:6d13:b0:55b:305b:4e2e with SMTP id 71dfb90a1353d-55b305b72cfmr2953377e0c.21.1763472125193;
        Tue, 18 Nov 2025 05:22:05 -0800 (PST)
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com. [209.85.217.44])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-55b0f32f178sm5241629e0c.5.2025.11.18.05.22.04
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Nov 2025 05:22:04 -0800 (PST)
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-5dfb5fcf063so1648645137.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 05:22:04 -0800 (PST)
X-Received: by 2002:a05:6102:390d:b0:5db:e0e6:1b47 with SMTP id
 ada2fe7eead31-5dfc55688c8mr4951691137.19.1763472124716; Tue, 18 Nov 2025
 05:22:04 -0800 (PST)
MIME-Version: 1.0
References: <CGME20251118115051eucas1p15f688883a4466dd7cabf3550a798c060@eucas1p1.samsung.com>
 <20251118115037.1866871-1-m.szyprowski@samsung.com>
In-Reply-To: <20251118115037.1866871-1-m.szyprowski@samsung.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Nov 2025 14:21:53 +0100
X-Gmail-Original-Message-ID: <CAMuHMdX7vCyC7c_Y6D=axajSfCmj7JBV3eXxLwHogbrVkM-_Hg@mail.gmail.com>
X-Gm-Features: AWmQ_bnjjds2ROTFY_LF0JjQ9CqJzRgGjh6ZD1fzHamlMqKfyof10aLGvuq8Ggo
Message-ID: <CAMuHMdX7vCyC7c_Y6D=axajSfCmj7JBV3eXxLwHogbrVkM-_Hg@mail.gmail.com>
Subject: Re: [PATCH] ARM: exynos: Rework system wakeup interrupts initialization
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, Marc Zyngier <maz@kernel.org>, 
	Rob Herring <robh@kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_052207_037935_1C0EB517 
X-CRM114-Status: GOOD (  30.11  )
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

Hi Marek,

CC Robh

On Tue, 18 Nov 2025 at 12:50, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
> Since commit 1b1f04d8271e ("of/irq: Ignore interrupt parent for nodes
> without interrupts") it is not possible to get parent interrupt device
> node when no 'interrupts' property is specified. Rework the hack used for
> initializing the Exynos system wakeup interrupts (PMU controller is a
> proxy for SoC RTC interrupts) to get the parent interrupt node by
> manually parsing 'interrupt-parent' property.
>
> Fixes: 8b283c025443 ("ARM: exynos4/5: convert pmu wakeup to stacked domains")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Thanks for your patch!

> ---
> This fixes the following boot failure of allmost all ARM 32bit Exynos
> boards observed since next-20251118:
>
> /soc/system-controller@10020000: no parent, giving up
> OF: of_irq_init: Failed to init /soc/system-controller@10020000 ((ptrval)), parent 00000000

Oops...

> ...
> 8<--- cut here ---
> Unable to handle kernel paging request at virtual address 00002008 when read
> [00002008] *pgd=00000000
> Internal error: Oops: 5 [#1] SMP ARM
> Modules linked in:
> CPU: 0 UID: 0 PID: 1 Comm: swapper/0 Not tainted 6.18.0-rc1-00026-g1b1f04d8271e #16162 PREEMPT
> Hardware name: Samsung Exynos (Flattened Device Tree)
> PC is at exynos_set_delayed_reset_assertion+0x5c/0xb0
> LR is at exynos_set_delayed_reset_assertion+0x80/0xb0
> pc : [<c012b9a4>]    lr : [<c012b9c8>]    psr: 80000053
> ...
> Process swapper/0 (pid: 1, stack limit = 0x(ptrval))
> Stack: (0xf0825f30 to 0xf0826000)
> ...
> Call trace:
>  exynos_set_delayed_reset_assertion from exynos_smp_prepare_cpus+0x10/0x34
>  exynos_smp_prepare_cpus from kernel_init_freeable+0x94/0x234
>  kernel_init_freeable from kernel_init+0x1c/0x12c
>  kernel_init from ret_from_fork+0x14/0x28
> Exception stack(0xf0825fb0 to 0xf0825ff8)
> ...
> ---[ end trace 0000000000000000 ]---
> Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
> Best regards
> Marek Szyprowski, PhD
> Samsung R&D Institute Poland
> ---
>  arch/arm/mach-exynos/suspend.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/arch/arm/mach-exynos/suspend.c b/arch/arm/mach-exynos/suspend.c
> index 44811faaa4b4..02785342e0c7 100644
> --- a/arch/arm/mach-exynos/suspend.c
> +++ b/arch/arm/mach-exynos/suspend.c
> @@ -192,6 +192,7 @@ static int __init exynos_pmu_irq_init(struct device_node *node,
>  {
>         struct irq_domain *parent_domain, *domain;
>

Perhaps add a check:

    if (!parent)

just in case any of the pmu system controllers ever gets a real
interrupts or interrupts-extended property?

> +       parent = of_parse_phandle(node, "interrupt-parent", 0);

Or of_irq_find_parent(node)?

>         if (!parent) {
>                 pr_err("%pOF: no parent, giving up\n", node);
>                 return -ENODEV;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

