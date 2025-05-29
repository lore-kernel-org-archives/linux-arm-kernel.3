Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7C0C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 15:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WKsU5t0kQKXkzewEHojQ9MYlM5Y7vAzte+OeClSGAw=; b=GqWd9SpIicO2xkCh8uI9d0cfbA
	VESHHkubNNeeFem/dYx8ebizt4QVWoIAPl5xPGu828s7sI2ZqItYdmnUvRimCRNCrSPXYmdJzN/YR
	eimUbrO0b4OL5EEOMuvfZX4UYmLBYAtpLuVBApL+ZnzkcC5eVrkgOjuTW04O/ILW3Y3DU5EWoGQiE
	zk0enVDzEz/RoiClOiDAiaB5i0XfBxMatFM4TThUcIHaxNM+qrHyKCFwG8d76+ZtH/ihzFWe2BDBn
	mP4OjE+aBn2iFKngByxPjcxJ+jBQwHDT0kGgkAjMYCZEMaDnn3j6q93gpN2AL9pE2LWF8rHspgmCF
	QfGkIuEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKexM-0000000G2cN-2hNh;
	Thu, 29 May 2025 15:14:09 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKdq1-0000000Fvxc-1cn1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 14:02:31 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250529140222epoutp0449a9d95e53903e52eef36a99e0d87191~EBFqYr7_I1989119891epoutp04i
	for <linux-arm-kernel@lists.infradead.org>; Thu, 29 May 2025 14:02:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250529140222epoutp0449a9d95e53903e52eef36a99e0d87191~EBFqYr7_I1989119891epoutp04i
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748527342;
	bh=8WKsU5t0kQKXkzewEHojQ9MYlM5Y7vAzte+OeClSGAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=W51aC/y+cJ4EoecuuSBv5PGVeGuE+XyI41+h/mS1ivi6Hs6CaTiNK3Z0yZd5p0aS1
	 L8OSaqdJNrsH8Cb6OwFKXE6r5EkT7zZZcoUNVA0rlbvFYRH3kmkRu8Fd01R1E75PgU
	 dJRveyeipTnnoAjM+Rfp5zPUOFbvqOyDlJKh5dpg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250529140221epcas5p4a57a87fcc503824fc6ebaed013f40015~EBFpPpTKn2669026690epcas5p4b;
	Thu, 29 May 2025 14:02:21 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.177]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4b7Sjl3dG1z6B9m9; Thu, 29 May
	2025 14:02:19 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250529111715epcas5p19a63894e2556d2c8005845e01f67c783~D_1fbc3201682116821epcas5p13;
	Thu, 29 May 2025 11:17:15 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250529111715epsmtrp28367756d56f54d104a4adb8502953868~D_1falGMf2212422124epsmtrp2i;
	Thu, 29 May 2025 11:17:15 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-8e-6838423a0ae5
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	23.3F.08766.A3248386; Thu, 29 May 2025 20:17:14 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250529111712epsmtip1c3473e86dd73fe7f2cb4a048b21fa309~D_1cifmF32102821028epsmtip1F;
	Thu, 29 May 2025 11:17:11 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chandan.vn@samsung.com, karthik.sun@samsung.com, dev.tailor@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v3 3/4] clk: samsung: exynosautov920: add block hsi2 clock
 support
Date: Thu, 29 May 2025 16:56:39 +0530
Message-Id: <20250529112640.1646740-4-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250529112640.1646740-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJTtfKySLDoO2DhcWDedvYLCZ8ibBY
	s/cck8X1L89ZLe7tWMZuMf/IOVaLxhlvmCzOn9/AbrHp8TVWi48991gtLu+aw2Yx4/w+JouL
	p1wtji0Qs/i+8g6jxZEzL5gt/u/ZwW5x+E07q8W/axtZLCYfX8tq0bRsPZODqMf7G63sHjtn
	3WX32LSqk81j85J6j74tqxg9Pm+SC2CL4rJJSc3JLEst0rdL4Mq4vug8W8F85YqJX1tYGhiP
	yHYxcnBICJhInG2S7GLk4hAS2M0ocfjMIbYuRk6guITEvv+/GSFsYYmV/56zQxS9ZZTYfKqF
	BSTBJqAlcWX7OzaQhIhAF5PEuX+vWEAcZoGdTBJtj7exg1QJCwRJ7Js8nxXEZhFQlbj99AQT
	yGpeAWuJ4wc1IDbIS+w/eJYZxOYUsJG4e/M52AIhoJKP28+AxXkFBCVOznwCFmcGqm/eOpt5
	AqPALCSpWUhSCxiZVjFKphYU56bnFhsWGOallusVJ+YWl+al6yXn525iBEeZluYOxu2rPugd
	YmTiYDzEKMHBrCTC22RvliHEm5JYWZValB9fVJqTWnyIUZqDRUmcV/xFb4qQQHpiSWp2ampB
	ahFMlomDU6qBSfZSSKLVjfSHqky3WJg0jsXIRkqXSJy4zNbwv+/En/SiGVe3rXh+VO2QVaeq
	mCfvX6/S5q/ZkvIX2CoeLFok3f+JZc8cCw+TfR9VpnwX6mKZmMes/XPWwpdZN2/ILU8VXB2t
	LzTdaNE0n6p12v5267d9Ys4sWHzMwejBxaJKrTVCjlp5Jmxn98u2tfhvlhae+sZdfp6weut1
	oW3pB3N2R77XlHZ+3u/4SlSUzXdKa2tGwTu2V7FPbBSn/H3Lf8rh2772Jv7YZ9NMuMpmhwp2
	HzlW/nGhdXiK0N3Gx4rBdRyH/KMsk9sVc6VWHeCqdZRR7Dr6vSxedKOw1OF6gZIW8wurzppV
	la3+tsa65LkSS3FGoqEWc1FxIgBs+bx7IQMAAA==
X-CMS-MailID: 20250529111715epcas5p19a63894e2556d2c8005845e01f67c783
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529111715epcas5p19a63894e2556d2c8005845e01f67c783
References: <20250529112640.1646740-1-raghav.s@samsung.com>
	<CGME20250529111715epcas5p19a63894e2556d2c8005845e01f67c783@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_070229_820046_E10C8325 
X-CRM114-Status: GOOD (  16.71  )
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
CMU_HSI2, this provides clocks for HSI2 block

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 72 ++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index da4afe8ac2ab..572b6ace14ac 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -26,6 +26,7 @@
 #define CLKS_NR_MISC			(CLK_DOUT_MISC_OSC_DIV2 + 1)
 #define CLKS_NR_HSI0			(CLK_DOUT_HSI0_PCIE_APB + 1)
 #define CLKS_NR_HSI1			(CLK_MOUT_HSI1_USBDRD + 1)
+#define CLKS_NR_HSI2			(CLK_DOUT_HSI2_ETHERNET_PTP + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1752,6 +1753,74 @@ static const struct samsung_cmu_info hsi1_cmu_info __initconst = {
 	.clk_name		= "noc",
 };
 
+/* ---- CMU_HSI2 --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_HSI2 (0x16b00000) */
+#define PLL_LOCKTIME_PLL_ETH                    0x0
+#define PLL_CON3_PLL_ETH			0x10c
+#define PLL_CON0_MUX_CLKCMU_HSI2_ETHERNET_USER  0x600
+#define PLL_CON0_MUX_CLKCMU_HSI2_NOC_UFS_USER   0x610
+#define PLL_CON0_MUX_CLKCMU_HSI2_UFS_EMBD_USER  0x630
+#define CLK_CON_MUX_MUX_CLK_HSI2_ETHERNET       0x1000
+#define CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET       0x1800
+#define CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET_PTP   0x1804
+
+static const unsigned long hsi2_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_ETH,
+	PLL_CON3_PLL_ETH,
+	PLL_CON0_MUX_CLKCMU_HSI2_ETHERNET_USER,
+	PLL_CON0_MUX_CLKCMU_HSI2_NOC_UFS_USER,
+	PLL_CON0_MUX_CLKCMU_HSI2_UFS_EMBD_USER,
+	CLK_CON_MUX_MUX_CLK_HSI2_ETHERNET,
+	CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET,
+	CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET_PTP,
+};
+
+static const struct samsung_pll_clock hsi2_pll_clks[] __initconst = {
+	/* CMU_HSI2_PLL */
+	PLL(pll_531x, FOUT_PLL_ETH, "fout_pll_eth", "oscclk",
+	    PLL_LOCKTIME_PLL_ETH, PLL_CON3_PLL_ETH, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_HSI2 */
+PNAME(mout_clkcmu_hsi2_noc_ufs_user_p) = { "oscclk", "dout_clkcmu_hsi2_noc_ufs" };
+PNAME(mout_clkcmu_hsi2_ufs_embd_user_p) = { "oscclk", "dout_clkcmu_hsi2_ufs_embd" };
+PNAME(mout_hsi2_ethernet_p) = { "fout_pll_eth", "mout_clkcmu_hsi2_ethernet_user" };
+PNAME(mout_clkcmu_hsi2_ethernet_user_p) = { "oscclk", "dout_clkcmu_hsi2_ethernet" };
+
+static const struct samsung_mux_clock hsi2_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_HSI2_NOC_UFS_USER, "mout_clkcmu_hsi2_noc_ufs_user",
+	    mout_clkcmu_hsi2_noc_ufs_user_p, PLL_CON0_MUX_CLKCMU_HSI2_NOC_UFS_USER, 4, 1),
+	MUX(CLK_MOUT_HSI2_UFS_EMBD_USER, "mout_clkcmu_hsi2_ufs_embd_user",
+	    mout_clkcmu_hsi2_ufs_embd_user_p, PLL_CON0_MUX_CLKCMU_HSI2_UFS_EMBD_USER, 4, 1),
+	MUX(CLK_MOUT_HSI2_ETHERNET, "mout_hsi2_ethernet",
+	    mout_hsi2_ethernet_p, CLK_CON_MUX_MUX_CLK_HSI2_ETHERNET, 0, 1),
+	MUX(CLK_MOUT_HSI2_ETHERNET_USER, "mout_clkcmu_hsi2_ethernet_user",
+	    mout_clkcmu_hsi2_ethernet_user_p, PLL_CON0_MUX_CLKCMU_HSI2_ETHERNET_USER, 4, 1),
+};
+
+static const struct samsung_div_clock hsi2_div_clks[] __initconst = {
+	DIV(CLK_DOUT_HSI2_ETHERNET, "dout_hsi2_ethernet",
+	    "mout_hsi2_ethernet", CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET,
+	    0, 4),
+	DIV(CLK_DOUT_HSI2_ETHERNET_PTP, "dout_hsi2_ethernet_ptp",
+	    "mout_hsi2_ethernet", CLK_CON_DIV_DIV_CLK_HSI2_ETHERNET_PTP,
+	    0, 4),
+};
+
+static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
+	.pll_clks               = hsi2_pll_clks,
+	.nr_pll_clks            = ARRAY_SIZE(hsi2_pll_clks),
+	.mux_clks               = hsi2_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(hsi2_mux_clks),
+	.div_clks               = hsi2_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(hsi2_div_clks),
+	.nr_clk_ids             = CLKS_NR_HSI2,
+	.clk_regs               = hsi2_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(hsi2_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1779,6 +1848,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-hsi1",
 		.data = &hsi1_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-hsi2",
+		.data = &hsi2_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1


