Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53A44D0C5FB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 11:12:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=cnFTMeCID9lXKUnFvse0D5ZPbfsmhKB0ssGUetavtlk=; b=hotVxwsE9SEJGwQXUsdM2N3h4J
	qqDy57HhpJYE4OwvpMpOVfKtYiuKsviDgQrybHuYkY0mQUVxhJp+RIIeW1KgOzlOC2HMkRWPK3EE3
	ZZJvEV+meiY5BTe3c42wdL0ot84l/t8ZFE78Z7Su9CKoyJA42j6tyertWNcIGWlSCc7a7R7FslHrb
	W3wrOCdz9wPBC4jE7PP2nunCyuJLmj3ezNHZGaVz04kZ6P2ImaDKFx4UGPtfICQt1yrHKnMBClDsS
	673v3xBKF5y9AgW8Ykkc8XkhtlagsRmp4XhdYLVBNsN2+o+uxB8MHaTXixR0r0sEPqSTwErbY78zB
	3rSj50RQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4IEz-00000003T2x-2Lw0;
	Fri, 25 Oct 2024 11:12:25 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Hze-00000003QrX-1uwt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 10:56:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B65E4339;
	Fri, 25 Oct 2024 03:57:03 -0700 (PDT)
Received: from donnerap.arm.com (donnerap.manchester.arm.com [10.32.101.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 347AA3F73B;
	Fri, 25 Oct 2024 03:56:32 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	Philippe Simons <simons.philippe@gmail.com>
Subject: [RFC PATCH] clk: sunxi-ng: h616: Reparent CPU clock during frequency changes
Date: Fri, 25 Oct 2024 11:56:20 +0100
Message-Id: <20241025105620.1891596-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_035634_625665_696CF047 
X-CRM114-Status: GOOD (  17.72  )
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

The H616 user manual recommends to re-parent the CPU clock during
frequency changes of the PLL, and recommends PLL_PERI0(1X), which runs
at 600 MHz. Also it asks to disable and then re-enable the PLL lock bit,
after the factor changes have been applied.

Add clock notifiers for the PLL and the CPU mux clock, using the existing
notifier callbacks, and tell them to use mux 4 (the PLL_PERI0(1X) source),
and bit 29 (the LOCK_ENABLE) bit. The existing code already follows the
correct algorithms.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
Hi,

the manual states that those changes would be needed to safely change
the CPU_PLL frequency during DVFS operation. On my H618 boards it works
fine without them, but Philippe reported problems on his H700 board.
Posting this for reference at this point, to see if it helps people.
I am not sure we should change this without it fixing any real issues.

The same algorithm would apply to the A100/A133 (and the upcoming A523)
as well.

Cheers,
Andre

 drivers/clk/sunxi-ng/ccu-sun50i-h616.c | 28 ++++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
index 84e406ddf9d12..85eea196f25e3 100644
--- a/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
+++ b/drivers/clk/sunxi-ng/ccu-sun50i-h616.c
@@ -1095,11 +1095,24 @@ static const u32 usb2_clk_regs[] = {
 	SUN50I_H616_USB3_CLK_REG,
 };
 
+static struct ccu_mux_nb sun50i_h616_cpu_nb = {
+	.common		= &cpux_clk.common,
+	.cm		= &cpux_clk.mux,
+	.delay_us	= 1, /* manual doesn't really say */
+	.bypass_index	= 4, /* PLL_PERI0@600MHz, as recommended by manual */
+};
+
+static struct ccu_pll_nb sun50i_h616_pll_cpu_nb = {
+	.common		= &pll_cpux_clk.common,
+	.enable		= BIT(29),	/* LOCK_ENABLE */
+	.lock		= BIT(28),
+};
+
 static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 {
 	void __iomem *reg;
 	u32 val;
-	int i;
+	int ret, i;
 
 	reg = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(reg))
@@ -1152,7 +1165,18 @@ static int sun50i_h616_ccu_probe(struct platform_device *pdev)
 	val |= BIT(24);
 	writel(val, reg + SUN50I_H616_HDMI_CEC_CLK_REG);
 
-	return devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
+	ret = devm_sunxi_ccu_probe(&pdev->dev, reg, &sun50i_h616_ccu_desc);
+	if (ret)
+		return ret;
+
+	/* Reparent CPU during CPU PLL rate changes */
+	ccu_mux_notifier_register(pll_cpux_clk.common.hw.clk,
+				  &sun50i_h616_cpu_nb);
+
+	/* Re-lock the CPU PLL after any rate changes */
+	ccu_pll_notifier_register(&sun50i_h616_pll_cpu_nb);
+
+	return 0;
 }
 
 static const struct of_device_id sun50i_h616_ccu_ids[] = {
-- 
2.25.1


