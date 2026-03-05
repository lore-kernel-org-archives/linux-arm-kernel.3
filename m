Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFA5F3092A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Mar 2026 10:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Subject:Cc:To:From:Message-ID:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vgTJ5X6xjYJZeggeE/1ljIBqSS7332l84JmxEcvSaiw=; b=nusr5qRqeZi4Ug99PNvmzA09Cl
	CeqLaXLHOdhlvUaYOAEA6amvGfHoqM/nQO1uQUKtfhTs0MZMyq5Yr3nMb/yv0p8g1aSkhZ16VS5XK
	AZYTtMMsBFNYrzlqReNEpKclHO/DJBZbLmnmK4iyH/VENCSb/GjdLUHFdLO1LYTecbVZJu/QItgBw
	9VQqHVjRZwBqm6C25fIBo4xq79xd63AdwBZhicP5la358HtgrzL2eridi9mIHcDVa5nDQWd6FtQFB
	iPxfXumWzqcrwf27PFC633FNqFILK1/eME9qsZCrWylmoK0HnhcwwOeq1xc/n6QUPXh39Ccuecvui
	sp3g194A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy66e-00000001aj8-2T6M;
	Thu, 05 Mar 2026 10:39:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vy66b-00000001aiU-38WX;
	Thu, 05 Mar 2026 10:38:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 04DB741735;
	Thu,  5 Mar 2026 10:38:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CD304C116C6;
	Thu,  5 Mar 2026 10:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772707136;
	bh=56dnd+yJBrELoNOf74QX1gXElP1APH+JtJUeVGWJ7VE=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=aNXALXvs+G1hWLA6P+I+h/DReCJXZSm97mHKep8u8GFL36LFVxIH+i5y7WFv+iKDf
	 45lyWVNJcbnfmUSizIK1p/UBS8e7RFQIp5f3mE6X07ogThBerQzn7xQC0Shd7VE7cU
	 KiR82ar/+6EdLt20Ma6DhKNQwIrZ038LN8Mc5GCw/5/EpuWBWmx2bY5TlKmOVzfZ5w
	 GuNJtHMaYCew95aZFYNZ+rUml6q3wiVNhVMuCROl8gMx+t0njgof7PG++ea3FnNO1k
	 Mxr4pwcNMwUq/T0qaURlUt+cqz7aRmpPKyfU3p/AJmRmDIUXrcXM0NOAv/TJeEX+Lh
	 nsjyHZw1EbifA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=goblin-girl.misterjones.org)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vy66Y-0000000GOmb-1qAv;
	Thu, 05 Mar 2026 10:38:54 +0000
Date: Thu, 05 Mar 2026 10:38:53 +0000
Message-ID: <86tsuu7e82.wl-maz@kernel.org>
From: Marc Zyngier <maz@kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Antoine Tenart <atenart@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Mark-PK Tsai <mark-pk.tsai@mediatek.com>,
	Daniel Palmer <daniel@thingy.jp>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Nishanth Menon <nm@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
In-Reply-To: <CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
References: <cover.1772644406.git.geert+renesas@glider.be>
	<d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
	<86v7fa7fdq.wl-maz@kernel.org>
	<CAMuHMdWWYNGThGYsj6Oakwx-1RKO_BrENiSSUi08ZzfE_b3EXA@mail.gmail.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) SEMI-EPG/1.14.7 (Harue)
 FLIM-LB/1.14.9 (=?UTF-8?B?R29qxY0=?=) APEL-LB/10.8 EasyPG/1.0.0 Emacs/30.1
 (aarch64-unknown-linux-gnu) MULE/6.0 (HANACHIRUSATO)
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: geert@linux-m68k.org, tglx@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lpieralisi@kernel.org, atenart@kernel.org, florian.fainelli@broadcom.com, bcm-kernel-feedback-list@broadcom.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, mark-pk.tsai@mediatek.com, daniel@thingy.jp, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, thierry.reding@gmail.com, jonathanh@nvidia.com, nm@ti.com, kristo@kernel.org, ssantosh@kernel.org, hayashi.kunihiko@socionext.com, mhiramat@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, imx@lists.linux.dev, linux-amlogic@lists.infradead.org, linux-mediatek@lists.infradead.org, linux-tegra@vger.kernel.org, linux-arm-msm@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_023857_860726_C586AE27 
X-CRM114-Status: GOOD (  30.89  )
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

On Thu, 05 Mar 2026 10:24:23 +0000,
Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> 
> Hi Marc,
> 
> On Thu, 5 Mar 2026 at 11:13, Marc Zyngier <maz@kernel.org> wrote:
> > On Wed, 04 Mar 2026 17:21:58 +0000,
> > Geert Uytterhoeven <geert+renesas@glider.be> wrote:
> > > Replace magic numbers by symbolic DT binding definitions.  This improves
> > > readability, and makes it easier to find where the various GIC
> > > interrupts types are handled.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > > --- a/drivers/irqchip/irq-gic-v3.c
> > > +++ b/drivers/irqchip/irq-gic-v3.c
> > > @@ -35,6 +35,8 @@
> > >  #include <asm/smp_plat.h>
> > >  #include <asm/virt.h>
> > >
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +
> > >  #include "irq-gic-common.h"
> > >
> > >  static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
> > > @@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
> > >                       return -EINVAL;
> > >
> > >               switch (fwspec->param[0]) {
> > > -             case 0:                 /* SPI */
> > > +             case GIC_SPI:
> >
> > I'd rather not do that. I use *numeric* values on purpose, because
> > that's what the DT *binding* describes, and I have no control over
> > what lives in that include file (it gets changed without me being even
> > Cc'd).
> >
> > So I want to stick to the binding, and not to the interpretation of
> > it. If you want symbolic values to be used, describe them in the
> > binding, have a tool to generate the values from the binding, and use
> > that everywhere.
> 
> This sounds more like a philosophical debate, so I'd like to defer
> to the DT maintainers...

That's not philosophical.

That's a pragmatic approach to having a common source of information,
and a unique reference. Carrying an extra copy that can be
independently changed is a source of errors, which I've been trying to
reduce in other parts of the kernel (system register description and
encoding, for example).

> 
> About you not being notified: that can be fixed easily ;-)
> 
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2110,6 +2110,7 @@ F:        arch/arm64/include/asm/arch_gicv3.h
>  F:     drivers/irqchip/irq-gic*.[ch]
>  F:     include/linux/irqchip/arm-gic*.h
>  F:     include/linux/irqchip/arm-vgic-info.h
> +F:     include/dt-bindings/interrupt-controller/arm-gic.h

I'm actively trying to *remove* myself from the kernel, not to grab
more stuff.

Thanks,

	M.

-- 
Without deviation from the norm, progress is not possible.

