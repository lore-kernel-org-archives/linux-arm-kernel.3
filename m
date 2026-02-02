Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99C78E73151
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Feb 2026 10:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s4HVsaW21NBJ1yxRDmOXRttOAA45F2suCXv9URGuPoM=; b=sInQk4LF+pNEVShceV0YyG3GDA
	KhyD1bKPtkmNplGFzpoDP3RzrqiKlKZ90M/OlNkEGgiiIg8QZmGNVoa+CjXfne+hW4OgP6U4lpAWO
	wskgCYgNpEkjsRVCT7/SyTY9ZCPxVEa2vfUzKqo7walffa6TI06ojgkOkr4KhK6BXc8+erEmVWcU6
	F+qnaxLxPxufXe/e6yrMLVD0W97jxLvweMeZ6uTX1CdisFkYWbnrje0pJSEucgpZDSbvSF90D8+H6
	ibFzHjLTJ4S32igrddhPr3jiX7VwjnADnb+wstUliJQJioE4/HjDGtEnawNFaZtVE3lVnjKMtisBm
	u7DYpgTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2P-00000004nmz-0u22;
	Mon, 02 Feb 2026 10:20:09 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmr2M-00000004nlk-0PPE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Feb 2026 10:20:07 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20260202102000epoutp041129715a05d4ea722aea46f000ffe41f~QZrl39aPf1817118171epoutp042
	for <linux-arm-kernel@lists.infradead.org>; Mon,  2 Feb 2026 10:20:00 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20260202102000epoutp041129715a05d4ea722aea46f000ffe41f~QZrl39aPf1817118171epoutp042
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1770027600;
	bh=s4HVsaW21NBJ1yxRDmOXRttOAA45F2suCXv9URGuPoM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=t5h3FX3dLP0CJ6wcylMQvS6crv8MW3nQxW8nJ0RWLCiQXXpyWfdw8lHTK2vVmKrUY
	 qdtT0H66wAehId1m6n4uL/6KrwIdZnksGoUL9L9rU38SMqoQSdP06cMxDCtdSOmdsT
	 PSW3m6pRpNGai+rlrZxhCZEdLRpU3gRJB0ZcFXf8=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20260202101959epcas5p3dbca50509ffff5c290d8ac24269216cc~QZrlTKHqP0463704637epcas5p3J;
	Mon,  2 Feb 2026 10:19:59 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.95]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4f4N0G5Sbfz6B9m6; Mon,  2 Feb
	2026 10:19:58 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20260202101957epcas5p224b18e84c561e542c39096b2bd7f29a7~QZrjdPMz70827008270epcas5p2B;
	Mon,  2 Feb 2026 10:19:57 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260202101955epsmtip19544b13693357c191df1fa79e02a89a4~QZrg-_XPW1761017610epsmtip1Y;
	Mon,  2 Feb 2026 10:19:54 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, sunyeal.hong@samsung.com,
	shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, chandan.vn@samsung.com,
	dev.tailor@samsung.com, karthik.sun@samsung.com, Raghav Sharma
	<raghav.s@samsung.com>
Subject: [PATCH 2/3] clk: samsung: exynosautov920: add block G3D clock
 support
Date: Mon,  2 Feb 2026 16:05:54 +0530
Message-Id: <20260202103555.2089376-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260202103555.2089376-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260202101957epcas5p224b18e84c561e542c39096b2bd7f29a7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20260202101957epcas5p224b18e84c561e542c39096b2bd7f29a7
References: <20260202103555.2089376-1-raghav.s@samsung.com>
	<CGME20260202101957epcas5p224b18e84c561e542c39096b2bd7f29a7@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260202_022006_467958_D7C6731D 
X-CRM114-Status: GOOD (  15.50  )
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

Add support for CMU_G3D which provides clocks to G3D block, and
register the required compatible and cmu_info for the same.

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 52 ++++++++++++++++++++++++
 1 file changed, 52 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index d0617c7fff3a..c38b103721f0 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -30,6 +30,7 @@
 #define CLKS_NR_M2M                     (CLK_DOUT_M2M_NOCP + 1)
 #define CLKS_NR_MFC                     (CLK_DOUT_MFC_NOCP + 1)
 #define CLKS_NR_MFD                     (CLK_DOUT_MFD_NOCP + 1)
+#define CLKS_NR_G3D			(CLK_MOUT_G3D_NOCP_USER + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1942,6 +1943,54 @@ static const struct samsung_cmu_info mfd_cmu_info __initconst = {
 	.clk_name               = "noc",
 };
 
+/* ---- CMU_G3D --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_G3D (0x1a000000) */
+#define PLL_LOCKTIME_PLL_G3D                    0x0
+#define PLL_CON3_PLL_G3D                        0x10c
+#define CLK_CON_MUX_MUX_CLK_G3D_NOC             0x1000
+#define PLL_CON0_MUX_CLKCMU_G3D_NOCP_USER       0x600
+#define PLL_CON0_MUX_CLKCMU_G3D_SWITCH_USER     0x610
+
+static const unsigned long g3d_clk_regs[] __initconst = {
+	PLL_LOCKTIME_PLL_G3D,
+	PLL_CON3_PLL_G3D,
+	CLK_CON_MUX_MUX_CLK_G3D_NOC,
+	PLL_CON0_MUX_CLKCMU_G3D_NOCP_USER,
+	PLL_CON0_MUX_CLKCMU_G3D_SWITCH_USER,
+};
+
+static const struct samsung_pll_clock g3d_pll_clks[] __initconst = {
+	/* CMU_G3D_PLL */
+	PLL(pll_531x, FOUT_PLL_G3D, "fout_pll_g3d", "oscclk",
+	PLL_LOCKTIME_PLL_G3D, PLL_CON3_PLL_G3D, NULL),
+};
+
+/* List of parent clocks for Muxes in CMU_G3D */
+PNAME(mout_clk_g3d_noc_p) = { "oscclk", "fout_pll_g3d", "mout_clkcmu_g3d_switch_user"};
+PNAME(mout_clkcmu_g3d_switch_user_p) = { "oscclk", "dout_clkcmu_g3d_switch" };
+PNAME(mout_clkcmu_g3d_nocp_user_p) = { "oscclk", "dout_clkcmu_g3d_nocp" };
+
+static const struct samsung_mux_clock g3d_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_G3D_NOC, "mout_clk_g3d_noc",
+	    mout_clk_g3d_noc_p, CLK_CON_MUX_MUX_CLK_G3D_NOC, 0, 2),
+	MUX(CLK_MOUT_G3D_SWITCH_USER, "mout_clkcmu_g3d_switch_user",
+	    mout_clkcmu_g3d_switch_user_p, PLL_CON0_MUX_CLKCMU_G3D_SWITCH_USER, 4, 1),
+	MUX(CLK_MOUT_G3D_NOCP_USER, "mout_clkcmu_g3d_nocp_user",
+	    mout_clkcmu_g3d_nocp_user_p, PLL_CON0_MUX_CLKCMU_G3D_NOCP_USER, 4, 1),
+};
+
+static const struct samsung_cmu_info g3d_cmu_info __initconst = {
+	.pll_clks               = g3d_pll_clks,
+	.nr_pll_clks            = ARRAY_SIZE(g3d_pll_clks),
+	.mux_clks               = g3d_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(g3d_mux_clks),
+	.nr_clk_ids             = CLKS_NR_G3D,
+	.clk_regs               = g3d_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(g3d_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1981,6 +2030,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-mfd",
 		.data = &mfd_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-g3d",
+		.data = &g3d_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1


