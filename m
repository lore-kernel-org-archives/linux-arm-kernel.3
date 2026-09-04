Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50C90C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 15:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ro48NJ62AR0oo+moMYLIfi8efNhtoyUYMDvKfhyU+CE=; b=1cCQ9C33l/5T/Xkxa4jJGlVkZI
	zAKbo0xbB+PPJtdaaT5IMsM5LKK+NNPHaUzYHnN/twN/4w+vZPaAy8DFanrBGKa055AEIXKVc7oeK
	qFs6r22+FZi3q2bYpkGLtYu/iEfOZy4wgEd1HNkkPs+2tfma1bY3je0BmiSX3E+D9piFNbG9ajbyy
	RGCiRCEx4Ak9ljb0LbT1vN2+COrfhFvWsu9cLAWRLy+2BUZplc9F0XZ27yL266CyYZl5F1tT5gEEg
	ijzDWRxAWW5KV23EIATFTX4fdf9B4rUA8QsemLhsxveunC6WPocbFxiyCx92S9aTU5oIEsg7QuCL1
	yCavzMIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJs-00000002bqC-1zo1;
	Fri, 04 Sep 2026 15:59:12 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2WJi-00000002bWw-0pMD;
	Fri, 04 Sep 2026 15:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788537540;
	bh=5r6DxrE7zrZMVgoolkWus+HukdRlhbqUOz9ok20ajpM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MprJi2qTpoGZS7rH1/KnHJ7qh0TZZPGTxk9H7Y2pZSC7hUKVnUWvqi4GGepGRqV7o
	 2inGnO9amr96erSL+lxjUUbef9T6ybfyMhYAkJLEfk2PoX7Q75QOK0oBfHEZVJQQpp
	 S3lTP4J9FFHDqMfjiKDcojIdd+aLu+7O8LvJlkYNdNl6E6iRrtjMTvafZvEolGyuMI
	 w9prC7IKLf1TCEQcyYx5ev+4mKDRWvZujAWjJrYhl2g+3Jx+tMBxc8mNuy4IE/hG3F
	 0a+GwerrKtbsNrlbb4UCZr6/Wxsr8r55ynxE2Z2eKw5aAG4gobHxOKIqQiUx5KpFD5
	 Yj/ethpxBjT4Q==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DC6A017E0C10;
	Fri, 04 Sep 2026 17:58:58 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Fri, 04 Sep 2026 17:58:22 +0200
Subject: [PATCH v6 11/27] clk: mediatek: pll: Factorise pll power on/off
 sequences
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-mt8189-clocks-system-base-v6-11-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Chen-Yu Tsai <wenst@chromium.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Brian Masney <bmasney@redhat.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788537522; l=2061;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=5r6DxrE7zrZMVgoolkWus+HukdRlhbqUOz9ok20ajpM=;
 b=KE5Pv3Qj6DFnkoSUCpTkq8rs0H1dNBtaec57IdUZvg1GB9ONoPJ06FxF/aqbb9f2vEOyjZMik
 pd/kw6TJjgtBQ2WyQEQiUYYgX6qcqAf+HwYppaatZeKyqtT8pLFP3KK
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_085902_401302_DE4D7C9E 
X-CRM114-Status: GOOD (  10.70  )
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

In order to prepare the MT8189 SoC support, that requires different
registers to control PLL status and perform reset BAR, and so a
different sets of clock operations, split the pll power on and off
sequences from mtk_pll_prepare/unprepare functions into private
subfunctions.

Reviewed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 drivers/clk/mediatek/clk-pll.c | 28 +++++++++++++++++++++-------
 1 file changed, 21 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mediatek/clk-pll.c b/drivers/clk/mediatek/clk-pll.c
index 4b0f7e2bfc5a..2aaf2871ecf6 100644
--- a/drivers/clk/mediatek/clk-pll.c
+++ b/drivers/clk/mediatek/clk-pll.c
@@ -223,9 +223,8 @@ int mtk_pll_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
 	return 0;
 }
 
-int mtk_pll_prepare(struct clk_hw *hw)
+static void mtk_pll_power_on(struct mtk_clk_pll *pll)
 {
-	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
 	u32 r;
 
 	r = readl(pll->pwr_addr) | CON0_PWR_ON;
@@ -235,6 +234,25 @@ int mtk_pll_prepare(struct clk_hw *hw)
 	r = readl(pll->pwr_addr) & ~CON0_ISO_EN;
 	writel(r, pll->pwr_addr);
 	udelay(1);
+}
+
+static void mtk_pll_power_off(struct mtk_clk_pll *pll)
+{
+	u32 r;
+
+	r = readl(pll->pwr_addr) | CON0_ISO_EN;
+	writel(r, pll->pwr_addr);
+
+	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
+	writel(r, pll->pwr_addr);
+}
+
+int mtk_pll_prepare(struct clk_hw *hw)
+{
+	struct mtk_clk_pll *pll = to_mtk_clk_pll(hw);
+	u32 r;
+
+	mtk_pll_power_on(pll);
 
 	r = readl(pll->en_addr) | BIT(pll->data->pll_en_bit);
 	writel(r, pll->en_addr);
@@ -278,11 +296,7 @@ void mtk_pll_unprepare(struct clk_hw *hw)
 	r = readl(pll->en_addr) & ~BIT(pll->data->pll_en_bit);
 	writel(r, pll->en_addr);
 
-	r = readl(pll->pwr_addr) | CON0_ISO_EN;
-	writel(r, pll->pwr_addr);
-
-	r = readl(pll->pwr_addr) & ~CON0_PWR_ON;
-	writel(r, pll->pwr_addr);
+	mtk_pll_power_off(pll);
 }
 
 static int mtk_pll_prepare_fenc_setclr(struct clk_hw *hw)

-- 
2.55.0


