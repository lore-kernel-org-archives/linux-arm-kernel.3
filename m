Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E53ECEFCE20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 17:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxuzQYFQQjL9aJ3S9jOGDK0JZCSwQgoUnw32RTqybhA=; b=WvJq03xB+BbQcFfYU3L13THWfr
	9wC8fjNCF7yYxVRkGPlzOuOfVhIUnWhSxyjJ9DBmkoPJzyDLr1yrgRdx7No/19v8V6rVyBm9iofeO
	gGGCacINkY0yBFEAbtNVPJxwrrg/IHHi5BuqaqwCJJGqgN21B1IOMxyrMe7yXO0bOcvlrq/I0g2lS
	TuK5pXKdNHhwZW+uCybNKNEQZpsZlp/CnoSEypSboQJDDXqvX2O00tUWmpKXogfQDQViFbBFRm1xo
	73Xfv7f8v2BdF8/S7iZRvPjaeiwyiskeof6fvQJNi69EWRhoQ6DrpCuWt0icOpN46BY/1b+53C+KJ
	AGpN8WMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvV-00000000AkH-3kcS;
	Wed, 04 Mar 2026 17:22:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxpvU-00000000Aj3-2qbL;
	Wed, 04 Mar 2026 17:22:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0BACA600B0;
	Wed,  4 Mar 2026 17:22:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1F7FC2BC9E;
	Wed,  4 Mar 2026 17:22:16 +0000 (UTC)
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
Subject: [PATCH 2/4] genirq: Document interaction between <linux/irq.h> and DT binding defs
Date: Wed,  4 Mar 2026 18:21:57 +0100
Message-ID: <fbcc65dcee6c5437fab5ef18d21766bb4effb7cb.1772644406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1772644406.git.geert+renesas@glider.be>
References: <cover.1772644406.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Document that the DT binding definitions in
<dt-bindings/interrupt-controller/irq.h> shadow the first six IRQ_TYPE_*
definitions in <linux/irq.h>.  The values must be the same anyway, so
this is harmless (as long as the latter is included first when both are
included), but it is good to document this explicitly.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 include/linux/irq.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 951acbdb9f8457de..efa514ee562fcf91 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -35,6 +35,10 @@ enum irqchip_irq_state;
  *
  * Bits 0-7 are the same as the IRQF_* bits in linux/interrupt.h
  *
+ * Note that the first 6 definitions are shadowed by C preprocessor definitions
+ * in include/dt-bindings/interrupt-controller/irq.h.  This is not an issue, as
+ * the actual values must be the same, due to being part of the stable DT ABI.
+ *
  * IRQ_TYPE_NONE		- default, unspecified type
  * IRQ_TYPE_EDGE_RISING		- rising edge triggered
  * IRQ_TYPE_EDGE_FALLING	- falling edge triggered
-- 
2.43.0


