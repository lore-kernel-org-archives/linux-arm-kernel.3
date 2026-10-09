Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB2CA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ySeRjjT1bYVtRGC/o4/umKPGHAVanArpzajQhf7JQqk=; b=WR3lUMG3LkqMgwmtpsrLoPyzPg
	9Wzrxt4qZxjePiISt3vznls6xDvSx9qGnaM7Ziri15lUUB5SnnKftbtvalKfC6s3QtM2BJL8WoUpo
	BisZMLQrTaB759/I3h6L9HXlb0ZUqvrfVdX4J+zNoGSu1o4rBm7LVTsApdQ14imwGirhpeawOmioy
	5PAIgKnYdhlhUJoq6rLSsjZOJK+5bT+7ME5aO6U1u2qz9oUAY34tbNbFsjHXNMriS8/rlcEnNKm/X
	7yHajSFLaOz2KCPg7cEe5rXItev0Rh6vr+bQ/1BowRzCsIpP0G3QDqKCqmtell0AJL1waBvUrw7jg
	zb6toe1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91K-00000006CjC-0wwd;
	Fri, 09 Oct 2026 11:44:14 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91A-00000006CX3-0mCP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:44:05 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261009114402epoutp031525be609ed12425ecc551ef432c5745~c2dC0sZm02399623996epoutp03C
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:44:02 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261009114402epoutp031525be609ed12425ecc551ef432c5745~c2dC0sZm02399623996epoutp03C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546242;
	bh=ySeRjjT1bYVtRGC/o4/umKPGHAVanArpzajQhf7JQqk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gQN1tHd9069xNSgAMnqD4uqcoDsOphrWXENEPaVm7thgg/ByoKRvr54B5TLxHWhRx
	 WX+FNX8QbwvtlgpL01QX9EHYPUf3PmTXCUWxkqmJKm0VB4VQL0ihqIQRkR5kBY7KvU
	 DxtMhdxp3LCSHXS9AmlykPNM6ON4Fz1GL5RBiNmI=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20261009114401epcas5p294aaecd82a4e0be3fe2f83d296c5516a~c2dCICySG0267702677epcas5p2b;
	Fri,  9 Oct 2026 11:44:01 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j1Q4J2hYYz6B9m9; Fri,  9 Oct
	2026 11:44:00 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6~c2dAJUYl91310413104epcas5p37;
	Fri,  9 Oct 2026 11:43:59 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114356epsmtip27cbb60f6031e077b14e2fa9183e71665~c2c91Wuxe3087430874epsmtip2V;
	Fri,  9 Oct 2026 11:43:56 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 10/14] clk: samsung: exynos8855: add block usb clock
 support
Date: Fri,  9 Oct 2026 17:31:33 +0530
Message-Id: <20261009120137.2801911-11-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114359epcas5p36e3efa42b4c80144cbdfdac6cbb687f6@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044404_555903_63B22775 
X-CRM114-Status: GOOD (  15.07  )
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

Register compatible and cmu_info data to support clocks.
CMU_USB, this provides clocks for USB

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 78 ++++++++++++++++++++++++++++
 1 file changed, 78 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 16d71db11ad0..010ca79116d3 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -20,11 +20,13 @@
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
 #define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)
+#define CLKS_NR_USB                     (CLK_GOUT_SYSREG_USB + 1)
 
 #define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
+#define EXYNOS8855_USB_GATE_DBG_OFFSET      0x2004
 
 #define EXYNOS8855_DRCG_EN_OFFSET       0x104
 #define EXYNOS8855_MEMCLK_OFFSET        0x108
@@ -1261,6 +1263,79 @@ static const struct samsung_cmu_info hsi_cmu_info __initconst = {
 	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
 };
 
+/* ---- CMU_USB --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_USB (0x13000000) */
+#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER                   0x600
+#define CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER              0x610
+#define CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD                       0x1000
+#define CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3                       0x1800
+#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK     0x2000
+#define CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK  0x2030
+#define CMU_USB_CONTROLLER_OPTION0_CMU_CTRL                        0x800
+
+static const unsigned long usb_clk_regs[] __initconst = {
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER,
+	CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER,
+	CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD,
+	CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+	CMU_USB_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_USB */
+PNAME(mout_clkcmu_usb_noc_user_p) = { "oscclk", "dout_clkcmu_usb_noc" };
+PNAME(mout_clkcmu_usb_usb20drd_user_p) = { "oscclk", "dout_clkcmu_usb_usb20drd" };
+PNAME(mout_clk_usb_usb20drd_p) = { "oscclk_usb_link", "mout_clkcmu_usb_usb20drd_user" };
+
+static const struct samsung_mux_clock usb_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_USB_NOC_USER, "mout_clkcmu_usb_noc_user",
+	    mout_clkcmu_usb_noc_user_p, CMU_USB_PLL_CON0_MUX_CLKCMU_USB_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_USB_USB20DRD_USER, "mout_clkcmu_usb_usb20drd_user",
+	    mout_clkcmu_usb_usb20drd_user_p, CMU_USB_PLL_CON0_MUX_CLKCMU_USB_USB20DRD_USER, 4, 1),
+	MUX(CLK_MOUT_USB_USB20DRD, "mout_clk_usb_usb20drd",
+	    mout_clk_usb_usb20drd_p, CMU_USB_CLK_CON_MUX_CLK_USB_USB20DRD, 0, 1),
+};
+
+static const struct samsung_div_clock usb_div_clks[] __initconst = {
+	DIV(CLK_DOUT_USB_NOC_DIV3, "dout_clkcmu_usb_noc_div3",
+	    "mout_clkcmu_usb_noc_user", CMU_USB_CLK_CON_DIV_CLK_USB_NOC_DIV3,
+	    0, 4),
+};
+
+static const struct samsung_gate_clock usb_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_USB, "gout_cmu_usb",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_CMU_USB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_USB, "gout_sysreg_usb",
+	     "mout_clkcmu_usb_noc_user",
+	     CMU_USB_CLK_CON_GAT_BLK_USB_UID_SYSREG_USB_IPCLKPORT_PCLK,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info usb_cmu_info __initconst = {
+	.mux_clks               = usb_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(usb_mux_clks),
+	.div_clks               = usb_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(usb_div_clks),
+	.gate_clks              = usb_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(usb_gate_clks),
+	.nr_clk_ids             = CLKS_NR_USB,
+	.clk_regs               = usb_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(usb_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_USB_GATE_DBG_OFFSET,
+	.option_offset          = CMU_USB_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1285,6 +1360,9 @@ static const struct of_device_id exynos8855_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos8855-cmu-top",
 		.data = &top_cmu_info,
+	}, {
+		.compatible = "samsung,exynos8855-cmu-usb",
+		.data = &usb_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1


