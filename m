Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3740E74AE1
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Dec 2025 07:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HtYjw4jalyDQoppAcInCtxlnVyYY0RV4lJZPqoBVW9A=; b=E0AmdFjsuAVO12mUvxX6/b8Qlb
	2n0YurHrxTUOQCeWKwFKkLrwngqabVPk+VRxA5bRzuyFiIkU2ryzFcXTDP/iAcWoQO6i6R95n7Vr4
	YG8MHY1jzkYxp/rNU7wSzpDRqjgpDhvEDwzKfHYVVA7fnu65TKUf1KdeRoWxZFsFDc/KterBes0VZ
	Uo60kYqi5pGfyk4+bQp5yLmD1fdRDHzjkistHTvUmslOlLO0+X3GNlsezuklRIxh5j+JtvUl08eW+
	M0qmPKpW8HHsLKT9AoKF5A4OS10qJWcaNxmZPaJZqEj6MylGc5Bllul4i4c80hGQy9szNkfmXQumE
	7+XJ5DSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKR-0000000GXRv-1Z77;
	Wed, 24 Dec 2025 07:30:39 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYJKL-0000000GXNl-00av;
	Wed, 24 Dec 2025 07:30:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1766561429;
	bh=kOjJJ3yhYsXVNfnfRW4c9WXxuQnl+ptCy0MnkCOqvw8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OtEqJXyihwbhZtT2hdF3kuFl4oK1w9+7P6VFISJThaYG0DYBroTbL7VqMivpIMKLV
	 GSTg60F/Suvo2HkQb+QNaNUgEd8J1HArE83QRUbm0NEbyuNzagiaYBt+nOhfxzxa5w
	 jJVOdSHfmXTukZ2LQLQYSAvHNtlasDrRJH8jNWJZ9xmnBatNCP/9vbg225cWp0QRAJ
	 S7xqNoNn9BvahWMHJ7G+LMYghTDj9u+3y4PO+NVZuSBba20MvVgusvTKU2C1IdT+rt
	 qM3tDzGD4Zh76o8MxMLYFNk58zfLCcpF1G3+IcKPy0elHAZcCGLITkgiiv8+LTJU7V
	 A6AWXwnbAItvA==
Received: from beast.luon.net (simons.connected.by.freedominter.net [45.83.240.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C09F17E1345;
	Wed, 24 Dec 2025 08:30:29 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id C661411A3A2D9; Wed, 24 Dec 2025 08:30:28 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 24 Dec 2025 08:30:12 +0100
Subject: [PATCH 3/4] clk: mediatek: Declare MT7986 infra muxes as no-gate
 muxes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-mtk-not-a-gate-v1-3-d4667e3b7856@collabora.com>
References: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
In-Reply-To: <20251224-mtk-not-a-gate-v1-0-d4667e3b7856@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jianhui Zhao <zhaojh329@gmail.com>, Daniel Golle <daniel@makrotopia.org>, 
 Sam Shih <sam.shih@mediatek.com>, Ryder Lee <ryder.lee@kernel.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251223_233033_445092_E7114418 
X-CRM114-Status: GOOD (  10.68  )
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

A MUX_GATE without a gate, is really just a MUX. Adjust the mux
declarations to match that. This fixes out-of-bounds shifts due to no
longer trying to enable/disable the gate with a shift of (u8)-1.

Fixes: ec97d23c8e22 ("clk: mediatek: add mt7986 clock support")
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 drivers/clk/mediatek/clk-mt7986-infracfg.c | 45 ++++++++++++------------------
 1 file changed, 18 insertions(+), 27 deletions(-)

diff --git a/drivers/clk/mediatek/clk-mt7986-infracfg.c b/drivers/clk/mediatek/clk-mt7986-infracfg.c
index 732c65e616de..458b26ff2efc 100644
--- a/drivers/clk/mediatek/clk-mt7986-infracfg.c
+++ b/drivers/clk/mediatek/clk-mt7986-infracfg.c
@@ -37,34 +37,25 @@ static const char *const infra_pcie_parents[] __initconst = {
 
 static const struct mtk_mux infra_muxes[] = {
 	/* MODULE_CLK_SEL_0 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_UART0_SEL, "infra_uart0_sel",
-			     infra_uart_parent, 0x0018, 0x0010, 0x0014, 0, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_UART1_SEL, "infra_uart1_sel",
-			     infra_uart_parent, 0x0018, 0x0010, 0x0014, 1, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_UART2_SEL, "infra_uart2_sel",
-			     infra_uart_parent, 0x0018, 0x0010, 0x0014, 2, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_SPI0_SEL, "infra_spi0_sel",
-			     infra_spi_parents, 0x0018, 0x0010, 0x0014, 4, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_SPI1_SEL, "infra_spi1_sel",
-			     infra_spi_parents, 0x0018, 0x0010, 0x0014, 5, 1,
-			     -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM1_SEL, "infra_pwm1_sel",
-			     infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 9,
-			     2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM2_SEL, "infra_pwm2_sel",
-			     infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 11,
-			     2, -1, -1, -1),
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PWM_BSEL, "infra_pwm_bsel",
-			     infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 13,
-			     2, -1, -1, -1),
+	MUX_CLR_SET(CLK_INFRA_UART0_SEL, "infra_uart0_sel",
+		    infra_uart_parent, 0x0018, 0x0010, 0x0014, 0, 1),
+	MUX_CLR_SET(CLK_INFRA_UART1_SEL, "infra_uart1_sel",
+		    infra_uart_parent, 0x0018, 0x0010, 0x0014, 1, 1),
+	MUX_CLR_SET(CLK_INFRA_UART2_SEL, "infra_uart2_sel",
+		    infra_uart_parent, 0x0018, 0x0010, 0x0014, 2, 1),
+	MUX_CLR_SET(CLK_INFRA_SPI0_SEL, "infra_spi0_sel",
+		    infra_spi_parents, 0x0018, 0x0010, 0x0014, 4, 1),
+	MUX_CLR_SET(CLK_INFRA_SPI1_SEL, "infra_spi1_sel",
+		    infra_spi_parents, 0x0018, 0x0010, 0x0014, 5, 1),
+	MUX_CLR_SET(CLK_INFRA_PWM1_SEL, "infra_pwm1_sel",
+		    infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 9, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM2_SEL, "infra_pwm2_sel",
+		    infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 11, 2),
+	MUX_CLR_SET(CLK_INFRA_PWM_BSEL, "infra_pwm_bsel",
+		    infra_pwm_bsel_parents, 0x0018, 0x0010, 0x0014, 13, 2),
 	/* MODULE_CLK_SEL_1 */
-	MUX_GATE_CLR_SET_UPD(CLK_INFRA_PCIE_SEL, "infra_pcie_sel",
-			     infra_pcie_parents, 0x0028, 0x0020, 0x0024, 0, 2,
-			     -1, -1, -1),
+	MUX_CLR_SET(CLK_INFRA_PCIE_SEL, "infra_pcie_sel",
+		    infra_pcie_parents, 0x0028, 0x0020, 0x0024, 0, 2),
 };
 
 static const struct mtk_gate_regs infra0_cg_regs = {

-- 
2.51.0


