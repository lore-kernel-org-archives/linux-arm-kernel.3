Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0118CF3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:In-Reply-To:References:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=; b=QoT5OYZu9SKknQ2GRhzPq6qjV1
	zZDwHUGNUsaEItQYArWq3NPix6Jk8fVDdbfPRHNxTF2U435+WUKZoPNfTxTcEUnC9tKCVohPc1Ao0
	ehIL33Kyub1E0g9+zgu+8hgFNnCDjZmPa3Vm2yHhMGWO5z5Ai6XeEtXcdxcE8nGc+bSdaQXrqBzp+
	tKeUvwQxuw/TA5hsp88KWujohgnjMiBpwk+yL2aCbCxNWv1RnWBi8/AIuIV2hQsxjFI/zu200ceqs
	u05maOlZ9Hg92CwTni8i6W7lrTV5oQaBtpJGnF+26tPV+ErpR+PL88aW1Tv0woTyKad7R0eQiXP9s
	0Kprijug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy60R-00000001aFT-28p6;
	Thu, 05 Mar 2026 10:32:35 +0000
Received: from mail-qk1-f180.google.com ([209.85.222.180])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy60P-00000001aEx-3q1m
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Mar 2026 10:32:35 +0000
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-8cb38e86cf2so838477085a.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:32:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772706753; x=1773311553;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n3yqJTxsIY1lPN4PgWxKVyykkH8+ipNK1w9pI9/GKdU=;
        b=qdVf4GGQde9exm+WBqgt92dLjjcw0yOr97EFi86szoulNlFJhikhhbfTQ4KiScRAiI
         bc3Huugaf8GnCr8VSOiyCYHJoRoolX29c6FCpXLx6YgRSn+2tHgeCWy6YjReruL7QgRZ
         s5TZbWt6xbV8bcZLOY79NNKuFk3y2fL7zqHOWN7Wk7/zfKSgpowc4xHHf9hsTKcUdR6Z
         4vhyQPkyd+XtC4qlj04sZXfDfIiN+dVMTJgcthKCCJbK3hBkXGRHUfeZB1KTxLull8ZM
         HRWc95IEfNbypgCF6d8if+qHQJkcSn5J4w4kPnv9U23JzzFzHUYKLe0EblRSMan2mrhy
         p5Mw==
X-Forwarded-Encrypted: i=1; AJvYcCVUC875W6pfrTEgZsFIIv2VcfoD/RrJi8QoUm98sp7+9LXsouK8yjtr8WlTyfo0n/SQ4FUUW6gMoHi5/1gZtFY9@lists.infradead.org
X-Gm-Message-State: AOJu0YwOp1tuG98/HGy3voQiA15PHmSEnyFdwgJ33j6KWqbye9dT1w/F
	OHWuGiSrcpL1AEzdCl50vvOpeL7cVd5EsBORcprup8gwP3vpMx4ro+MIIl2ielJa
X-Gm-Gg: ATEYQzwr7SuzS42UXMp9JtKxDhr/l0DKTvZaO+xG56IaQNjJrFXqDUZjmxcuOym4dil
	zofjfx3X0PSqF+nT3Mh0C/pMJPMFX2dDf4HJovRB2jY8sVB7zXFr2xPs9kArHyXkPI2HpKIhUty
	5264Ym+qA6X/xIHoas+H/HhDXWUURvnYL2NoK458Q9/nq7PVp6OTa6KvaM5H178xYnste3JOVeO
	GcBvrxPv8lsRpOqiB9ewh03UAq2CPqSTU/QnIEpr16FC7sBEyh3fkOnscX/bRcRaoicRcvTcyXj
	guZME+kuW+4ENEfBDte68ZfnZXGdTpCRXa57TqVSoVOD44udcdjMoYpo0DpjRGdFV6TO/qesmtc
	N4Qr31e+fRb8M9rM1IUyLxliSvBGM3Pq3jI2grP4TvON3idWhHvjKrFlmZPMXDE2wiJIanqPAGT
	28nXA10pxbUXYT4jtt/Tz/v1ZDr49b7k1UtOYtn+ri5tYoU5QtneWlS03Xl545RyTa
X-Received: by 2002:a05:620a:370a:b0:8ca:7b14:16d4 with SMTP id af79cd13be357-8cd5afaa4e1mr637070385a.63.1772706752711;
        Thu, 05 Mar 2026 02:32:32 -0800 (PST)
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com. [209.85.222.170])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8cbbf652bb6sm1994904885a.4.2026.03.05.02.32.32
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Mar 2026 02:32:32 -0800 (PST)
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-8cb3e0093e3so760336585a.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Mar 2026 02:32:32 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWYhN+b3c7xGY2srofDpyEnTzaNJlSJZdbXHPpDvxAG6WYRu9Ic4/RNB55JCVZK42XWHS9MakZPCHNL2by3xQkx@lists.infradead.org
X-Received: by 2002:a05:6102:3ed5:b0:5f5:320c:4d36 with SMTP id
 ada2fe7eead31-5ffab240223mr2483807137.40.1772706274492; Thu, 05 Mar 2026
 02:24:34 -0800 (PST)
MIME-Version: 1.0
References: <cover.1772644406.git.geert+renesas@glider.be> <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
 <86v7fa7fdq.wl-maz@kernel.org>
In-Reply-To: <86v7fa7fdq.wl-maz@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Mar 2026 11:24:23 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
X-Gm-Features: AaiRm50s5nNMGcrhF9lpYz1D5nEmYHga723M3h1qHVdFckZiw7-IBT_v4J6wsk0
Message-ID: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
To: Marc Zyngier <maz@kernel.org>
Cc: Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Antoine Tenart <atenart@kernel.org>, 
	Florian Fainelli <florian.fainelli@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>, Daniel Palmer <daniel@thingy.jp>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, Santosh Shilimkar <ssantosh@kernel.org>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
	imx@lists.linux.dev, linux-amlogic@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_023233_956857_4DE9C247 
X-CRM114-Status: GOOD (  31.24  )
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

Hi Marc,

On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> On Wed, 04 Mar 2026 17:21:58 +0000,
> Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > Replace magic numbers by symbolic DT binding definitions.  This improves
> > readability, and makes it easier to find where the various GIC
> > interrupts types are handled.
> >
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

> > --- a/drivers/irqchip/irq-gic-v3.c
> > +++ b/drivers/irqchip/irq-gic-v3.c
> > @@ -35,6 +35,8 @@
> >  #include <asm/smp_plat.h>
> >  #include <asm/virt.h>
> >
> > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > +
> >  #include "irq-gic-common.h"
> >
> >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> >                       return -EINVAL;
> >
> >               switch (fwspec->param[0]) {
> > -             case 0:                 /* SPI */
> > +             case GIC_SPI:
>
> I'd rather not do that. I use *numeric* values on purpose, because
> that's what the DT *binding* describes, and I have no control over
> what lives in that include file (it gets changed without me being even
> Cc'd).
>
> So I want to stick to the binding, and not to the interpretation of
> it. If you want symbolic values to be used, describe them in the
> binding, have a tool to generate the values from the binding, and use
> that everywhere.

This sounds more like a philosophical debate, so I'd like to defer
to the DT maintainers...

About you not being notified: that can be fixed easily ;-)

--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
 F:     drivers/irqchip/irq-gic*.[ch]
 F:     include/linux/irqchip/arm-gic*.h
 F:     include/linux/irqchip/arm-vgic-info.h
+F:     include/dt-bindings/interrupt-controller/arm-gic.h

 ARM GENERIC INTERRUPT CONTROLLER V5 DRIVERS
 M:     Lorenzo Pieralisi <lpieralisi@kernel.org>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

