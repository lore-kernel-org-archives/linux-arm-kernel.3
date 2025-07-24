Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9D03C83F26
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 09:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PeXJfNYVt8gvWVMbBFqZ/jxLVuAQ9DvsyReNU21h9ss=; b=wuXeSlgJCLAGFvy4ezeipITWmH
	cNucp4AtWdxvk2u0CrmsR24rUG7bhvwS+CLxfdjxiPYTAEz/6jVS2JtAhofSlbgpGyCmD7cUKUq0b
	QzcY73YC8uBqE5wzmEZ5+0XOi3xtokoxxnZCVSdqQhTkzvL+KylGb4GJGl2rk2SWqb5MYjSKFFPeS
	2/Gy2ctomrylVZhUJVUMvk/9VkciPEDgU4vFZqPvYIx/Ybj81Q5Ns7m6gr4b/6HUa/OKqD+HFTi7L
	wgFcFG5UxJOg8Bh4hBqAPxBTBQb64dTEr6Id0LdralvYATSvZuF+gGJLKtyp9V7DBYYOubiMLxi8D
	ybpw6qfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uesRL-000000074jG-1v3c;
	Thu, 24 Jul 2025 09:40:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uerTm-00000006t63-21ej;
	Thu, 24 Jul 2025 08:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1753346344;
	bh=rjcZHS4zMiYwGcIC7g009niYBuPFGQqt0YpNefU9dyA=;
	h=From:To:Cc:Subject:Date:From;
	b=QAKurpH/cGlJDYa3bpE9sc3ZroFZ7RvOgUgOMxeTqXFFjvK7yrfRgUp3i29v6aPDO
	 pXWKtIl/Q3181+IoYdWf6mZB8D/GW5j/FQokVoESudhWnbovMvszgprUeoMWaZB6/Y
	 NQj6LiGUvYJFXJqBzZ7U9aS9MeSz6pARSkLemnSAsZJNhWSTOHDWX3nDp9JR2kA9Wh
	 R7LOpSwSLt7UQFYrLn2Xtdx8Ke/ZQoTJafaGT/A4UP0UNSN7Nvx/lEJSWcHk8g3+xY
	 2sObhWmefeDSoHgSC3o/SLB67hLFoce9if6Zezw7BFngpsXkbVc4gEgsC4KRXOem3o
	 XRYq9tXygKGSw==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 87CDE17E0FC2;
	Thu, 24 Jul 2025 10:39:03 +0200 (CEST)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: sboyd@kernel.org
Cc: mturquette@baylibre.com,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	u.kleine-koenig@baylibre.com,
	geert+renesas@glider.be,
	chun-jie.chen@mediatek.com,
	wenst@chromium.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	kernel@collabora.com
Subject: [PATCH] clk: mediatek: mt8195-infra_ao: Fix parent for infra_ao_hdmi_26m
Date: Thu, 24 Jul 2025 10:38:28 +0200
Message-ID: <20250724083828.60941-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_013906_673005_0ABB96AF 
X-CRM114-Status: GOOD (  10.54  )
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

The infrastructure gate for the HDMI specific crystal needs the
top_hdmi_xtal clock to be configured in order to ungate the 26m
clock to the HDMI IP, and it wouldn't work without.

Reparent the infra_ao_hdmi_26m clock to top_hdmi_xtal to fix that.

Fixes: e2edf59dec0b ("clk: mediatek: Add MT8195 infrastructure clock support")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 drivers/clk/mediatek/clk-mt8195-infra_ao.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/mediatek/clk-mt8195-infra_ao.c b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
index bb648a88e43a..ad47fdb23460 100644
--- a/drivers/clk/mediatek/clk-mt8195-infra_ao.c
+++ b/drivers/clk/mediatek/clk-mt8195-infra_ao.c
@@ -103,7 +103,7 @@ static const struct mtk_gate infra_ao_clks[] = {
 	GATE_INFRA_AO0(CLK_INFRA_AO_CQ_DMA_FPC, "infra_ao_cq_dma_fpc", "fpc", 28),
 	GATE_INFRA_AO0(CLK_INFRA_AO_UART5, "infra_ao_uart5", "top_uart", 29),
 	/* INFRA_AO1 */
-	GATE_INFRA_AO1(CLK_INFRA_AO_HDMI_26M, "infra_ao_hdmi_26m", "clk26m", 0),
+	GATE_INFRA_AO1(CLK_INFRA_AO_HDMI_26M, "infra_ao_hdmi_26m", "top_hdmi_xtal", 0),
 	GATE_INFRA_AO1(CLK_INFRA_AO_SPI0, "infra_ao_spi0", "top_spi", 1),
 	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC0, "infra_ao_msdc0", "top_msdc50_0_hclk", 2),
 	GATE_INFRA_AO1(CLK_INFRA_AO_MSDC1, "infra_ao_msdc1", "top_axi", 4),
-- 
2.50.1


