Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A83EFCE24
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PpAbiTcNuxWXCJJXWHyGZl3vhOYBFmA3sjapPRM9p80=; b=K+wXfZ/egungpk8ntXX7zIHnNB
	HkuMxPG+bA2+7tMg7oTiIX+ajqK3zRFG7sxluIeu+MgGjhVpR/vMN8TNTyh+4kpwa1hXNyaay64TN
	lbWPuUvbT4KyRuclkOYhiPf+nLIzG6r8z/iQwLZnm1zXJV9sI+cmOpe7BigAadEqW1I56bPJSix7p
	YpkAmNsFNlPFfYpes73RP87bBjfruVkI7zoqFqA+iVQt1CMmpFPXPDPLAbF+E3bPphCN/QvgdJavp
	+1IbT4tBC5C4nlR1ok27iXKQ0Sj8v/Gmfs9IZLDacJz7lHmPc9NXSoBiHuyy3QGtLOQO74OxsWIz0
	bwSlcZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvK-00000000AcD-1XNK;
	Wed, 04 Mar 2026 17:22:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvH-00000000Abg-1Qq5;
	Wed, 04 Mar 2026 17:22:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 303B840C03;
	Wed,  4 Mar 2026 17:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58AC7C4CEF7;
	Wed,  4 Mar 2026 17:22:02 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
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
	Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	imx@lists.linux.dev,
	linux-amlogic@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-tegra@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH 0/4] irqchip/gic: Use GIC_* DT binding definitions
Date: Wed,  4 Mar 2026 18:21:55 +0100
Message-ID: <cover.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_092211_417432_13FA9EF5 
X-CRM114-Status: GOOD (  20.03  )
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

	Hi all,

There are still places in GIC DT bindings and GIC-related drivers where
magic GIC and interrupt numbers are used, instead of symbolic
definitions.  This patch series tries to improve upon that.

This series has been tested on a GICv4 system.
The last patch causes no change in generated code.

Noe that the first patch has a contextual conflict with "[PATCH]
irqchip/gic-v3: Print a warning for out-of-range interrupt numbers"[1].

Thanks for your comments!

[1] https://lore.kernel.org/62b849967d71d73e028fb65efee717986ef847e6.1772641758.git.geert+renesas@glider.be

Geert Uytterhoeven (4):
  dt-bindings: interrupt-controller: arm,gic: Document symbolic
    definitions
  genirq: Document interaction between <linux/irq.h> and DT binding defs
  irqchip/gic: Use GIC_* DT binding definitions
  iirqchip/gic children: Use GIC_* DT binding definitions

 .../bindings/interrupt-controller/arm,gic-v3.yaml  | 12 +++++++++---
 .../interrupt-controller/arm,gic-v5-iwb.yaml       |  2 ++
 .../bindings/interrupt-controller/arm,gic-v5.yaml  |  2 ++
 .../bindings/interrupt-controller/arm,gic.yaml     | 11 +++++++++--
 drivers/irqchip/irq-alpine-msi.c                   |  4 +++-
 drivers/irqchip/irq-bcm2712-mip.c                  |  4 +++-
 drivers/irqchip/irq-crossbar.c                     |  8 +++++---
 drivers/irqchip/irq-gic-v2m.c                      |  4 +++-
 drivers/irqchip/irq-gic-v3-mbi.c                   |  6 ++++--
 drivers/irqchip/irq-gic-v3.c                       | 14 ++++++++------
 drivers/irqchip/irq-gic.c                          |  6 ++++--
 drivers/irqchip/irq-imx-gpcv2.c                    |  4 +++-
 drivers/irqchip/irq-meson-gpio.c                   |  4 +++-
 drivers/irqchip/irq-mst-intc.c                     |  6 ++++--
 drivers/irqchip/irq-mtk-cirq.c                     |  4 +++-
 drivers/irqchip/irq-mtk-sysirq.c                   |  6 ++++--
 drivers/irqchip/irq-qcom-mpm.c                     |  4 +++-
 drivers/irqchip/irq-tegra.c                        |  2 +-
 drivers/irqchip/irq-ti-sci-inta.c                  |  4 +++-
 drivers/irqchip/irq-ti-sci-intr.c                  |  4 +++-
 drivers/irqchip/irq-uniphier-aidet.c               |  4 +++-
 drivers/irqchip/qcom-pdc.c                         |  4 +++-
 include/linux/irq.h                                |  4 ++++
 23 files changed, 89 insertions(+), 34 deletions(-)

-- 
2.43.0

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

