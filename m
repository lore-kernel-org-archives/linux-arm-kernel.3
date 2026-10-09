Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1ABCA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 11:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ADCo/FiF/M+Gog/73jGMgjnYRKW/94unUVhCAOuF42E=; b=ToI04I8TTcRlu0zi6iZMyLMqpj
	ASMoIvjSMZjzXbZOCo34cdddV/mA4YeeGXthKHDxsgqF24Ig3TB99x512q948Eajb4PtRT2vB1Ifs
	/TrYyNpPhlLTnk+HynCZUc48jFb95hc4bsPoDkGHkRhlaDZmcmNjvKzTHgaioxA/Ye9GgVSKW/O0O
	9dePRjwB6ONFQpI4dU5wcR3MzlW97+mI7fj3aaL7i3Dkhe6zgfntL0vImtI8FV44ZnNEaJm6YDYzn
	AJ2TlM2TLaF+0uWV9I2F0RgEsFfVzNwM1rBGkyyIxEm+mHEgfevK9Pc75oN85mqMSxg4d6Hb8x3qR
	0vN9dLGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF91D-00000006CaY-0Jr9;
	Fri, 09 Oct 2026 11:44:07 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF916-00000006CU3-2vRg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 11:44:02 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20261009114358epoutp03b71b1d2f608f30c6f4b2c58a9c5e604f~c2c-jY0zg2400624006epoutp03z
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 Oct 2026 11:43:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20261009114358epoutp03b71b1d2f608f30c6f4b2c58a9c5e604f~c2c-jY0zg2400624006epoutp03z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1791546238;
	bh=ADCo/FiF/M+Gog/73jGMgjnYRKW/94unUVhCAOuF42E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jtjPWkc5rtEss1DQt85yzUl101yd/NJRjk3FvIMDZLAZjbL70beVvW/a9iEUN7UCk
	 +GN4bg2Xv3MyDgZ0NsUv5a8ogF17PSG0Sj+Otslj24CJAioTpBH+UrQ6uRmUF0gQco
	 8AIwuf4Vho+zMNEK0q/ZfTwKvDl8y0ho0gtpbxOw=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20261009114358epcas5p46ec6f3332011665a9f14df9852836e09~c2c-GOBhl2206022060epcas5p4Z;
	Fri,  9 Oct 2026 11:43:58 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4j1Q4F08YPz6B9mD; Fri,  9 Oct
	2026 11:43:57 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d~c2c9mR4wv0307103071epcas5p35;
	Fri,  9 Oct 2026 11:43:56 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261009114354epsmtip237aac79577c106e5f2392fb08e3f85cf~c2c7RZ7Bf1160511605epsmtip2w;
	Fri,  9 Oct 2026 11:43:53 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	peter.griffin@linaro.org, alim.akhtar@samsung.com, sboyd@kernel.org,
	bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, robh@kernel.org,
	conor+dt@kernel.org, raghav.s@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, is.gandhi@samsung.com, ts.amit@samsung.com,
	pokala.reddy@samsung.com
Subject: [PATCH v2 09/14] clk: samsung: exynos8855: add block hsi clock
 support
Date: Fri,  9 Oct 2026 17:31:32 +0530
Message-Id: <20261009120137.2801911-10-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261009120137.2801911-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d
References: <20261009120137.2801911-1-raghav.s@samsung.com>
	<CGME20261009114356epcas5p3d70ea1ef357f6e05655035772c00809d@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_044401_070675_BACCDE28 
X-CRM114-Status: GOOD (  15.37  )
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
CMU_HSI, this provides clocks for HSI

Co-developed-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynos8855.c | 75 ++++++++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos8855.c b/drivers/clk/samsung/clk-exynos8855.c
index 2bf889a478bc..16d71db11ad0 100644
--- a/drivers/clk/samsung/clk-exynos8855.c
+++ b/drivers/clk/samsung/clk-exynos8855.c
@@ -19,7 +19,9 @@
 #define CLKS_NR_TOP                     (CLKCMU_DOUT_G3D_HTU + 1)
 #define CLKS_NR_PERIC                   (CLK_GOUT_USI_PERIC + 1)
 #define CLKS_NR_PERIS                   (CLK_GOUT_WDT1_PERIS + 1)
+#define CLKS_NR_HSI                     (CLK_GOUT_SYSREG_HSI  + 1)
 
+#define EXYNOS8855_HSI_GATE_DBG_OFFSET      0x2000
 #define EXYNOS8855_PERIS_GATE_DBG_OFFSET      0x2004
 #define EXYNOS8855_PERIC_GATE_DBG_OFFSET      0x2024
 #define EXYNOS8855_TOP_GATE_DBG_OFFSET      0x20A0
@@ -1189,6 +1191,76 @@ static const struct samsung_cmu_info peris_cmu_info __initconst = {
 	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
 };
 
+/* ---- CMU_HSI --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI (0x17000000) */
+#define CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER               0x600
+#define CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER          0x610
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK 0x2000
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK 0x2038
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_ACLK 0x203c
+#define CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO 0x2058
+#define CMU_HSI_CONTROLLER_OPTION0_CMU_CTRL                    0x800
+
+static const unsigned long hsi_clk_regs[] __initconst = {
+	CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER,
+	CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
+	CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
+	CMU_HSI_CONTROLLER_OPTION0_CMU_CTRL,
+};
+
+/* List of parent clocks for Muxes in CMU_HSI */
+PNAME(mout_clkcmu_hsi_noc_user_p) = { "oscclk", "dout_clkcmu_hsi_noc" };
+PNAME(mout_clkcmu_hsi_ufs_embd_user_p) = { "oscclk", "dout_clkcmu_hsi_ufs_embd" };
+
+static const struct samsung_mux_clock hsi_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_HSI_NOC_USER, "mout_clkcmu_hsi_noc_user",
+	    mout_clkcmu_hsi_noc_user_p, CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_NOC_USER, 4, 1),
+	MUX(CLK_MOUT_HSI_UFS_EMBD_USER, "mout_clkcmu_hsi_ufs_embd_user",
+	    mout_clkcmu_hsi_ufs_embd_user_p, CMU_HSI_PLL_CON0_MUX_CLKCMU_HSI_UFS_EMBD_USER, 4, 1),
+};
+
+static const struct samsung_gate_clock hsi_gate_clks[] __initconst = {
+	/* System will hang if this critical clock is gated */
+	GATE(CLK_GOUT_CMU_HSI, "gout_cmu_hsi",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_CMU_HSI_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_SYSREG_HSI, "gout_sysreg_hsi",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_SYSREG_HSI_IPCLKPORT_PCLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_UFS_EMBD_ACLK_HSI, "gout_ufs_embd_aclk_hsi",
+	     "mout_clkcmu_hsi_noc_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
+	     21, 0, 0),
+	GATE(CLK_GOUT_UFS_EMBD_UNIPRO_HSI, "gout_ufs_embd_unipro_hsi",
+	     "mout_clkcmu_hsi_ufs_embd_user",
+	     CMU_HSI_CLK_CON_GAT_BLK_HSI_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
+	     21, 0, 0),
+};
+
+static const struct samsung_cmu_info hsi_cmu_info __initconst = {
+	.mux_clks               = hsi_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(hsi_mux_clks),
+	.gate_clks              = hsi_gate_clks,
+	.nr_gate_clks           = ARRAY_SIZE(hsi_gate_clks),
+	.nr_clk_ids             = CLKS_NR_HSI,
+	.clk_regs               = hsi_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(hsi_clk_regs),
+	.sysreg_clk_regs	= dcrg_memclk_sysreg,
+	.nr_sysreg_clk_regs	= ARRAY_SIZE(dcrg_memclk_sysreg),
+	.clk_name               = "bus",
+	.auto_clock_gate        = true,
+	.gate_dbg_offset        = EXYNOS8855_HSI_GATE_DBG_OFFSET,
+	.option_offset          = CMU_HSI_CONTROLLER_OPTION0_CMU_CTRL,
+	.drcg_offset            = EXYNOS8855_DRCG_EN_OFFSET,
+	.memclk_offset          = EXYNOS8855_MEMCLK_OFFSET,
+};
+
 static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1202,6 +1274,9 @@ static int __init exynos8855_cmu_probe(struct platform_device *pdev)
 
 static const struct of_device_id exynos8855_cmu_of_match[] = {
 	{
+		.compatible = "samsung,exynos8855-cmu-hsi",
+		.data = &hsi_cmu_info,
+	}, {
 		.compatible = "samsung,exynos8855-cmu-peric",
 		.data = &peric_cmu_info,
 	}, {
-- 
2.34.1


