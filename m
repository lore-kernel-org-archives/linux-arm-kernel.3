Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62499C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  8 Aug 2025 15:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mYB+P+J19ESQdVQ04GgcuZw+QDE4itcN1DPMP46NilA=; b=sQ9pWxhtB6A/bGWZ+eGTyov62M
	gVERTff4uGJktLM8tTlVjYO+5vHfTqk5e4Ewr3MhwDiMxKpiH01Ty6wbrTbvdRTQyNhjYos8e/tij
	czSUwERSOLbWcLZxyKZlq+rhaNo1K2Vn1fjjdHUFqxptnw1cgVJHKNpfXyc4vOcgJTOlPwLBHF5FS
	tLrVFO/3h6b2uyYr7yVJV3yMpitFDC3pEyFeCycbb9eM5tnVEeo0UBZe0jBqVEuN0hOxMAt1M7DIb
	6rqGWTlF4hLor0LHbjm3JlWoWijUmOAFbeDSfgn7amX3WUZGh6SkbMzTPbr+x79oe8PspwFqWmokK
	6tKfAfHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOa9-000000035el-2wIf;
	Fri, 08 Aug 2025 15:00:33 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukOXb-0000000356n-1E4l
	for linux-arm-kernel@lists.infradead.org;
	Fri, 08 Aug 2025 14:57:57 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250808145750epoutp0385ea1364519a138c6e23bb7397a88a88~Z0pXIBeQj3043130431epoutp03O
	for <linux-arm-kernel@lists.infradead.org>; Fri,  8 Aug 2025 14:57:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250808145750epoutp0385ea1364519a138c6e23bb7397a88a88~Z0pXIBeQj3043130431epoutp03O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1754665070;
	bh=mYB+P+J19ESQdVQ04GgcuZw+QDE4itcN1DPMP46NilA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=i6kGW296zDWajZbMBbq9RmyeKjeSWKeB9JmmfxxY4GtLf5zo1paCH8l6T4sgfRI4I
	 P9bFEI7Kr4hfqGSvcdDppxjk5fZGY4GSCs/1RkbXEzeWItKG5XwOh4e4LvKASDyF5m
	 NSnhdzJobDU/pU5fbj+/zEhf2KEaThsq4pLOu+1U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250808145749epcas5p288c81e63dea1e97cfe346bacdf18cc1c~Z0pWVPblr0047700477epcas5p26;
	Fri,  8 Aug 2025 14:57:49 +0000 (GMT)
Received: from epcas5p3.samsung.com (unknown [182.195.38.87]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4bz6b05YXQz6B9m5; Fri,  8 Aug
	2025 14:57:48 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250808141244epcas5p376bea07e3420876ca58d7059b8f3da75~Z0B_yMJms1251912519epcas5p3k;
	Fri,  8 Aug 2025 14:12:44 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250808141241epsmtip2b4367e0200efa66850711cde6cc202d1~Z0B8eL1On1949219492epsmtip2s;
	Fri,  8 Aug 2025 14:12:41 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, sunyeal.hong@samsung.com, shin.son@samsung.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, dev.tailor@samsung.com,
	chandan.vn@samsung.com, karthik.sun@samsung.com, raghav.s@samsung.com
Subject: [PATCH v1 2/3] clk: samsung: exynosautov920: add block m2m clock
 support
Date: Fri,  8 Aug 2025 19:51:45 +0530
Message-Id: <20250808142146.3181062-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250808142146.3181062-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250808141244epcas5p376bea07e3420876ca58d7059b8f3da75
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250808141244epcas5p376bea07e3420876ca58d7059b8f3da75
References: <20250808142146.3181062-1-raghav.s@samsung.com>
	<CGME20250808141244epcas5p376bea07e3420876ca58d7059b8f3da75@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_075755_953610_02EA7A81 
X-CRM114-Status: GOOD (  14.18  )
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
CMU_M2M, this provides clocks for M2M block

Signed-off-by: Raghav Sharma <raghav.s@samsung.com>
---
 drivers/clk/samsung/clk-exynosautov920.c | 45 ++++++++++++++++++++++++
 1 file changed, 45 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynosautov920.c b/drivers/clk/samsung/clk-exynosautov920.c
index 572b6ace14ac..75deec8bece5 100644
--- a/drivers/clk/samsung/clk-exynosautov920.c
+++ b/drivers/clk/samsung/clk-exynosautov920.c
@@ -27,6 +27,7 @@
 #define CLKS_NR_HSI0			(CLK_DOUT_HSI0_PCIE_APB + 1)
 #define CLKS_NR_HSI1			(CLK_MOUT_HSI1_USBDRD + 1)
 #define CLKS_NR_HSI2			(CLK_DOUT_HSI2_ETHERNET_PTP + 1)
+#define CLKS_NR_M2M                     (CLK_DOUT_M2M_NOCP + 1)
 
 /* ---- CMU_TOP ------------------------------------------------------------ */
 
@@ -1821,6 +1822,47 @@ static const struct samsung_cmu_info hsi2_cmu_info __initconst = {
 	.clk_name               = "noc",
 };
 
+/* ---- CMU_M2M --------------------------------------------------------- */
+
+/* Register Offset definitions for CMU_M2M (0x1a800000) */
+#define PLL_CON0_MUX_CLKCMU_M2M_JPEG_USER       0x600
+#define PLL_CON0_MUX_CLKCMU_M2M_NOC_USER        0x610
+#define CLK_CON_DIV_DIV_CLK_M2M_NOCP            0x1800
+
+static const unsigned long m2m_clk_regs[] __initconst = {
+	PLL_CON0_MUX_CLKCMU_M2M_JPEG_USER,
+	PLL_CON0_MUX_CLKCMU_M2M_NOC_USER,
+	CLK_CON_DIV_DIV_CLK_M2M_NOCP,
+};
+
+/* List of parent clocks for Muxes in CMU_M2M */
+PNAME(mout_clkcmu_m2m_noc_user_p) = { "oscclk", "dout_clkcmu_m2m_noc" };
+PNAME(mout_clkcmu_m2m_jpeg_user_p) = { "oscclk", "dout_clkcmu_m2m_jpeg" };
+
+static const struct samsung_mux_clock m2m_mux_clks[] __initconst = {
+	MUX(CLK_MOUT_M2M_JPEG_USER, "mout_clkcmu_m2m_jpeg_user",
+	    mout_clkcmu_m2m_jpeg_user_p, PLL_CON0_MUX_CLKCMU_M2M_JPEG_USER, 4, 1),
+	MUX(CLK_MOUT_M2M_NOC_USER, "mout_clkcmu_m2m_noc_user",
+	    mout_clkcmu_m2m_noc_user_p, PLL_CON0_MUX_CLKCMU_M2M_NOC_USER, 4, 1),
+};
+
+static const struct samsung_div_clock m2m_div_clks[] __initconst = {
+	DIV(CLK_DOUT_M2M_NOCP, "dout_m2m_nocp",
+	    "mout_clkcmu_m2m_noc_user", CLK_CON_DIV_DIV_CLK_M2M_NOCP,
+	    0, 3),
+};
+
+static const struct samsung_cmu_info m2m_cmu_info __initconst = {
+	.mux_clks               = m2m_mux_clks,
+	.nr_mux_clks            = ARRAY_SIZE(m2m_mux_clks),
+	.div_clks               = m2m_div_clks,
+	.nr_div_clks            = ARRAY_SIZE(m2m_div_clks),
+	.nr_clk_ids             = CLKS_NR_M2M,
+	.clk_regs               = m2m_clk_regs,
+	.nr_clk_regs            = ARRAY_SIZE(m2m_clk_regs),
+	.clk_name               = "noc",
+};
+
 static int __init exynosautov920_cmu_probe(struct platform_device *pdev)
 {
 	const struct samsung_cmu_info *info;
@@ -1851,6 +1893,9 @@ static const struct of_device_id exynosautov920_cmu_of_match[] = {
 	}, {
 		.compatible = "samsung,exynosautov920-cmu-hsi2",
 		.data = &hsi2_cmu_info,
+	}, {
+		.compatible = "samsung,exynosautov920-cmu-m2m",
+		.data = &m2m_cmu_info,
 	},
 	{ }
 };
-- 
2.34.1


