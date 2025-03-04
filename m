Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 327D6C282C6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 01:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eDLglwvvzSdhCaWGxHM+m/MooR1NNTrwgvSXFsaPjy4=; b=hkPDyxO+HliTkiIi9PskRZtU4V
	H1J+t0vV1sS0JAUprxfKjTulgb1iPTpfGZxHBkzo/8dYV4R7VKHlDMmhATwADg9js8Wmt21B34GGA
	EbivGaJHGNF9Pu9tUEmXYDQvRkSzHYcpXqBK/V5O4Wehcz+b1NcCXQv0BvKjaP7tQZ9BR5QgWICOi
	3fH2qsG6B1hKs2ox4/oO/pxx1P320bL1Ahx4x7klWFu/WssNd/uiwrIGCZIQMziQi2UpFPcn622nh
	fbj7en4C1lMNszgmlrAKu8Q76PmmV5ApjC2xBBu/QjS055ZLPTIVpN/gYAJCLaoD8COyFAjXQX++U
	N3LedaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpHG3-00000002nfq-1pXU;
	Tue, 04 Mar 2025 01:39:43 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpH7I-00000002m0w-3Dny
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 01:30:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 972661BF7;
	Mon,  3 Mar 2025 17:30:53 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D67A43F673;
	Mon,  3 Mar 2025 17:30:37 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/15] clk: sunxi-ng: Add support for update bit
Date: Tue,  4 Mar 2025 01:27:53 +0000
Message-ID: <20250304012805.28594-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250304012805.28594-1-andre.przywara@arm.com>
References: <20250304012805.28594-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_173040_938178_EEE44664 
X-CRM114-Status: GOOD (  12.32  )
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

Some clocks in the Allwinner A523 SoC contain an "update bit" (bit 27),
which must be set to apply any register changes, namely the mux
selector, the divider and the gate bit.

Add a new CCU feature bit to mark those clocks, and set bit 27 whenever
we are applying any changes.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 drivers/clk/sunxi-ng/ccu_common.h | 4 ++++
 drivers/clk/sunxi-ng/ccu_div.c    | 2 ++
 drivers/clk/sunxi-ng/ccu_gate.c   | 4 ++++
 drivers/clk/sunxi-ng/ccu_mux.c    | 2 ++
 4 files changed, 12 insertions(+)

diff --git a/drivers/clk/sunxi-ng/ccu_common.h b/drivers/clk/sunxi-ng/ccu_common.h
index 50fd268329671..d41d33bdff470 100644
--- a/drivers/clk/sunxi-ng/ccu_common.h
+++ b/drivers/clk/sunxi-ng/ccu_common.h
@@ -20,10 +20,14 @@
 #define CCU_FEATURE_KEY_FIELD		BIT(8)
 #define CCU_FEATURE_CLOSEST_RATE	BIT(9)
 #define CCU_FEATURE_DUAL_DIV		BIT(10)
+#define CCU_FEATURE_UPDATE_BIT27	BIT(11)
 
 /* MMC timing mode switch bit */
 #define CCU_MMC_NEW_TIMING_MODE		BIT(30)
 
+/* Some clocks need this bit to actually apply register changes */
+#define CCU_SUNXI_UPDATE_BIT		BIT(27)
+
 struct device_node;
 
 struct ccu_common {
diff --git a/drivers/clk/sunxi-ng/ccu_div.c b/drivers/clk/sunxi-ng/ccu_div.c
index 7f4691f09e01f..2d8b98fe4b13a 100644
--- a/drivers/clk/sunxi-ng/ccu_div.c
+++ b/drivers/clk/sunxi-ng/ccu_div.c
@@ -106,6 +106,8 @@ static int ccu_div_set_rate(struct clk_hw *hw, unsigned long rate,
 
 	reg = readl(cd->common.base + cd->common.reg);
 	reg &= ~GENMASK(cd->div.width + cd->div.shift - 1, cd->div.shift);
+	if (cd->common.features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 
 	writel(reg | (val << cd->div.shift),
 	       cd->common.base + cd->common.reg);
diff --git a/drivers/clk/sunxi-ng/ccu_gate.c b/drivers/clk/sunxi-ng/ccu_gate.c
index ac52fd6bff677..0490f95781361 100644
--- a/drivers/clk/sunxi-ng/ccu_gate.c
+++ b/drivers/clk/sunxi-ng/ccu_gate.c
@@ -20,6 +20,8 @@ void ccu_gate_helper_disable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+	if (common->features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	writel(reg & ~gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
@@ -44,6 +46,8 @@ int ccu_gate_helper_enable(struct ccu_common *common, u32 gate)
 	spin_lock_irqsave(common->lock, flags);
 
 	reg = readl(common->base + common->reg);
+	if (common->features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 	writel(reg | gate, common->base + common->reg);
 
 	spin_unlock_irqrestore(common->lock, flags);
diff --git a/drivers/clk/sunxi-ng/ccu_mux.c b/drivers/clk/sunxi-ng/ccu_mux.c
index d7ffbdeee9e04..82ee21e0d3a68 100644
--- a/drivers/clk/sunxi-ng/ccu_mux.c
+++ b/drivers/clk/sunxi-ng/ccu_mux.c
@@ -197,6 +197,8 @@ int ccu_mux_helper_set_parent(struct ccu_common *common,
 	/* The key field always reads as zero. */
 	if (common->features & CCU_FEATURE_KEY_FIELD)
 		reg |= CCU_MUX_KEY_VALUE;
+	if (common->features & CCU_FEATURE_UPDATE_BIT27)
+		reg |= CCU_SUNXI_UPDATE_BIT;
 
 	reg &= ~GENMASK(cm->width + cm->shift - 1, cm->shift);
 	writel(reg | (index << cm->shift), common->base + common->reg);
-- 
2.46.3


