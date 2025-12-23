Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B20E6B272
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Dec 2025 11:05:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aVeuGCEze4MP7Ykp2VlZqFOz8h8r9vX65PUGfrFSwEI=; b=iloGCmkp221O6wr+oxbWwSrOMd
	KPakv4dfWDnD9apkwk2Pv0devmu4O6Krb0QeK1HprQZ89gYUqWTRKr//nKvqJ9Ovz8nLZxKrtC+bw
	F8vcasikrvxN67iRz9keVU4cB1wTZUqFpWazJ642UQRioJVv7nLAe74hG5ANM+1XA1ssE/cb3i7T9
	91PleEylKqKwEnkZSzzwbdBmmIGsocAVB96rwrH4cBgJ+aL75fK9hRmTun4T7BCTwwSDsJUksP3qz
	F2CUQ3JQLUAOuxn/dsSVslUS1ngWVDn1Rfgi4Hg3XDe43HOAA8l8JL66/LG417j7p0NFOQUdqb0Xg
	VOUEhs8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Cx-0000000EvZT-1oY1;
	Tue, 23 Dec 2025 11:05:39 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vY0Cu-0000000EvYB-0t7X;
	Tue, 23 Dec 2025 11:05:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766487931;
	bh=O29c7ITgEJCymXV/jcddxP+gJ4NesKAR0lu9ZRXMAT4=;
	h=From:Date:Subject:To:Cc:From;
	b=XyNAe3EuDaHR3MOpeXryvZwDB3jjh0ofXpEMba+shFfYY3viA9XRHpYpOIKUaYol6
	 lD3Aj8KCWWdtUwY0OKS9SbiyV9yDYdyy8YqIroI4nXGUhNUw9y+9wHYgrgp/UZBtzm
	 Bij9IOwpXw6oNKFCykwwJmbCy9RB3uF4WJJcVBkAK5qbDq4YpbjP5QgHGD73juA8lP
	 sdmysBReedOu3ypbtsOBP3PZInKq+e465Q71vM024nWE7kNXa1UdveWEa1tQ3jSQgs
	 +QT8Q/JjjBJPG1ECu03kjUP02FeohtMWakHhnBszTakDzfrCLtSBbkT4qQuCrtnQSA
	 wLSdydPPBXfOA==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 639B217E0125;
	Tue, 23 Dec 2025 12:05:31 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 0425A1179E810; Tue, 23 Dec 2025 12:05:30 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Tue, 23 Dec 2025 12:05:17 +0100
Subject: [PATCH] clk: mediatek: Drop __initconst from gates
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251223-mtk-gate-v1-1-e4a489ab33de@collabora.com>
X-B4-Tracking: v=1; b=H4sIAGx3SmkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIyNj3dySbN30xJJU3URLC0Nj48QkC4NkSyWg8oKi1LTMCrBR0bG1tQB
 +JXBwWgAAAA==
X-Change-ID: 20251223-mtk-gate-a98133ab80c9
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Laura Nao <laura.nao@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, stable@vger.kernel.org, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_030536_430099_4A239605 
X-CRM114-Status: GOOD (  10.69  )
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

Since commit 8ceff24a754a ("clk: mediatek: clk-gate: Refactor
mtk_clk_register_gate to use mtk_gate struct") the mtk_gate structs
are no longer just used for initialization/registration, but also at
runtime. So drop __initconst annotations.

Fixes: 8ceff24a754a ("clk: mediatek: clk-gate: Refactor mtk_clk_register_gate to use mtk_gate struct")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mt7981-eth.c | 6 +++---
 drivers/clk/mediatek/clk-mt8516.c     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7981-eth.c b/drivers/clk/mediatek/clk-mt7981-eth.c
index 906aec9ddff5..0655ebb6c561 100644
--- a/drivers/clk/mediatek/clk-mt7981-eth.c
+++ b/drivers/clk/mediatek/clk-mt7981-eth.c
@@ -31,7 +31,7 @@ static const struct mtk_gate_regs sgmii0_cg_regs = {
 		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
 	}
 
-static const struct mtk_gate sgmii0_clks[] __initconst = {
+static const struct mtk_gate sgmii0_clks[] = {
 	GATE_SGMII0(CLK_SGM0_TX_EN, "sgm0_tx_en", "usb_tx250m", 2),
 	GATE_SGMII0(CLK_SGM0_RX_EN, "sgm0_rx_en", "usb_eq_rx250m", 3),
 	GATE_SGMII0(CLK_SGM0_CK0_EN, "sgm0_ck0_en", "usb_ln0", 4),
@@ -53,7 +53,7 @@ static const struct mtk_gate_regs sgmii1_cg_regs = {
 		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
 	}
 
-static const struct mtk_gate sgmii1_clks[] __initconst = {
+static const struct mtk_gate sgmii1_clks[] = {
 	GATE_SGMII1(CLK_SGM1_TX_EN, "sgm1_tx_en", "usb_tx250m", 2),
 	GATE_SGMII1(CLK_SGM1_RX_EN, "sgm1_rx_en", "usb_eq_rx250m", 3),
 	GATE_SGMII1(CLK_SGM1_CK1_EN, "sgm1_ck1_en", "usb_ln0", 4),
@@ -75,7 +75,7 @@ static const struct mtk_gate_regs eth_cg_regs = {
 		.ops = &mtk_clk_gate_ops_no_setclr_inv,	\
 	}
 
-static const struct mtk_gate eth_clks[] __initconst = {
+static const struct mtk_gate eth_clks[] = {
 	GATE_ETH(CLK_ETH_FE_EN, "eth_fe_en", "netsys_2x", 6),
 	GATE_ETH(CLK_ETH_GP2_EN, "eth_gp2_en", "sgm_325m", 7),
 	GATE_ETH(CLK_ETH_GP1_EN, "eth_gp1_en", "sgm_325m", 8),
diff --git a/drivers/clk/mediatek/clk-mt8516.c b/drivers/clk/mediatek/clk-mt8516.c
index 21eb052b0a53..342a59019fea 100644
--- a/drivers/clk/mediatek/clk-mt8516.c
+++ b/drivers/clk/mediatek/clk-mt8516.c
@@ -544,7 +544,7 @@ static const struct mtk_gate_regs top5_cg_regs = {
 #define GATE_TOP5(_id, _name, _parent, _shift)				\
 	GATE_MTK(_id, _name, _parent, &top5_cg_regs, _shift, &mtk_clk_gate_ops_setclr)
 
-static const struct mtk_gate top_clks[] __initconst = {
+static const struct mtk_gate top_clks[] = {
 	/* TOP1 */
 	GATE_TOP1(CLK_TOP_THEM, "them", "ahb_infra_sel", 1),
 	GATE_TOP1(CLK_TOP_APDMA, "apdma", "ahb_infra_sel", 2),

---
base-commit: b927546677c876e26eba308550207c2ddf812a43
change-id: 20251223-mtk-gate-a98133ab80c9

Best regards,
-- 
Sjoerd Simons <sjoerd@collabora.com>


