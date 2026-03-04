Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07927EFCE21
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=esvSqKXShpQiZv737AB88d1vgxt9UO/1oYq1M1MxJA4=; b=lWD0odKd3n2UA90mdEpmeYMDYN
	9qh0wr11E3w3kVunCi7W2Z6sAAuAF5SvkAVsRp8ln16DR8XsnVtfaRL++Oe9f9LtNWmlNRFLF0/f8
	sPUjlvQDCfBRYaaVdLFCM55gno9BKZZFtg0WIfFGbgRXs/zp40v6QMS/tmd9ItzXvXmfZWaoIsW5+
	/YDAyGWzscUtVQN3FgLtLoJxq6w0fNFYjHOC1N5fvvcorFCHJEfKDiT9pdoN2GwUok8k6e+yqttWW
	3RgkkN98moou2uEr7ug7UwToJ9MgFwVanw/LtxRRnIxiDvnIOrj+z0j5G8iw5h3FvLe/eYG0dqcRL
	14cIfTeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvn-00000000Az3-1MRI;
	Wed, 04 Mar 2026 17:22:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvj-00000000Aur-3b0m;
	Wed, 04 Mar 2026 17:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=esvSqKXShpQiZv737AB88d1vgxt9UO/1oYq1M1MxJA4=; b=d2tjJ2lV2jSHcwp+TacCI+bsij
	61pTx25q/MTCzmQynQRZz+oEQl22XsDj+VmyvCkmvgfl/lPx0pzjoUnljVwfcPRy/dtnHRMcfUboW
	sS2YeKsCNMX+xDbDqNtcFS4f8byTrPJOHJlXehlLW/nfq0bBTxOTplJQxebKttWHMLFiFUze8ZXmT
	nNe6AF/qJBG7Wng2NSnXNT4EsrEIXlEzjlVUz/xtTbxfHCbdJe4sqOs32cwlKQXcn0Dqvd22ugrK4
	6U2JIftglxiBgIIZCR4VOzdRX0UAwsV3MvAGcJ72ekBtMzkQz3PeHYhbU+/ZEJ5p8ErRHJGp5Jqke
	/HuQe5HQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvf-00000005DZm-26tq;
	Wed, 04 Mar 2026 17:22:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D6C8E43A6D;
	Wed,  4 Mar 2026 17:22:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09C00C4CEF7;
	Wed,  4 Mar 2026 17:22:23 +0000 (UTC)
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
Subject: [PATCH 3/4] irqchip/gic: Use GIC_* DT binding definitions
Date: Wed,  4 Mar 2026 18:21:58 +0100
Message-ID: <d22488d128d39fcd90359f59559fac637bb4b04c.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_172235_881542_0FB246EA 
X-CRM114-Status: GOOD (  12.35  )
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

Replace magic numbers by symbolic DT binding definitions.  This improves
readability, and makes it easier to find where the various GIC
interrupts types are handled.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 drivers/irqchip/irq-gic-v3.c | 14 ++++++++------
 drivers/irqchip/irq-gic.c    |  6 ++++--
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index d75163e71bf22473..6ac103cb40097acc 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -35,6 +35,8 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #include "irq-gic-common.h"
 
 static u8 dist_prio_irq __ro_after_init = GICV3_PRIO_IRQ;
@@ -1602,25 +1604,25 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		switch (fwspec->param[0]) {
-		case 0:			/* SPI */
+		case GIC_SPI:
 			if (fwspec->param[1] > 987)
 				pr_warn_once("SPI %u out of range (use ESPI?)\n",
 					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 32;
 			break;
-		case 1:			/* PPI */
+		case GIC_PPI:
 			if (fwspec->param[1] > 16)
 				pr_warn_once("PPI %u out of range (use EPPI?)\n",
 					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + 16;
 			break;
-		case 2:			/* ESPI */
+		case GIC_ESPI:
 			if (fwspec->param[1] > 1023)
 				pr_warn_once("ESPI %u out of range\n",
 					     fwspec->param[1]);
 			*hwirq = fwspec->param[1] + ESPI_BASE_INTID;
 			break;
-		case 3:			/* EPPI */
+		case GIC_EPPI:
 			if (fwspec->param[1] > 63)
 				pr_warn_once("EPPI %u out of range\n",
 					     fwspec->param[1]);
@@ -1738,8 +1740,8 @@ static int gic_irq_get_fwspec_info(struct irq_fwspec *fwspec, struct irq_fwspec_
 		struct fwnode_handle *fw;
 
 		switch (fwspec->param[0]) {
-		case 1:			/* PPI */
-		case 3:			/* EPPI */
+		case GIC_PPI:
+		case GIC_EPPI:
 			break;
 		default:
 			return 0;
diff --git a/drivers/irqchip/irq-gic.c b/drivers/irqchip/irq-gic.c
index ec70c84e9f91dd7b..a2225ca1efeb700d 100644
--- a/drivers/irqchip/irq-gic.c
+++ b/drivers/irqchip/irq-gic.c
@@ -47,6 +47,8 @@
 #include <asm/smp_plat.h>
 #include <asm/virt.h>
 
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
 #include "irq-gic-common.h"
 
 #ifdef CONFIG_ARM64
@@ -1094,10 +1096,10 @@ static int gic_irq_domain_translate(struct irq_domain *d,
 			return -EINVAL;
 
 		switch (fwspec->param[0]) {
-		case 0:			/* SPI */
+		case GIC_SPI:
 			*hwirq = fwspec->param[1] + 32;
 			break;
-		case 1:			/* PPI */
+		case GIC_PPI:
 			*hwirq = fwspec->param[1] + 16;
 			break;
 		default:
-- 
2.43.0


