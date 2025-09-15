Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086E9CAC598
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 09:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJ9+g8lkBAZ58DT0T4J7XS/I3gsTi6pRT012Sw5pz0w=; b=UWndjnkFh1oLaNMFV/jN8K3Gyj
	gJ992dWJkdeEzIgoXF72imn+0uJOOD7v9Xtgah2y+NsIu/TLCqouVTjO5tXFIbUduyzGBxO+8iqG3
	rw4ZJ3TceEyrkhkTdmbG/3ICAkLSF/24R/IpFN5X1ZV5Jjvls8gvmimP2XStvUjQ/C/hKGwoiJ8Yw
	JKRx0mSHM81gwW8gnqHyA5BqI/Umvx9Ri3OQp+wh+X5G8Xm7xu74d1cFCBWN/3n05cJVYtGwJ8i+g
	gdyMueZszQSrXwIf5dPF26rozqixsYugdV06wMk3eee/kADoqcVt0AlowAPIoo7z+086ljUruy7Tu
	6xoqiNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5m5-00000003VqI-0n6v;
	Mon, 15 Sep 2025 09:45:29 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy5lv-00000003Vlh-3afL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 09:45:22 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250915094517epoutp0173cff561aff2fa664e210243477fffc9~la5UZu_yU2451324513epoutp01v
	for <linux-arm-kernel@lists.infradead.org>; Mon, 15 Sep 2025 09:45:17 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250915094517epoutp0173cff561aff2fa664e210243477fffc9~la5UZu_yU2451324513epoutp01v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757929517;
	bh=AJ9+g8lkBAZ58DT0T4J7XS/I3gsTi6pRT012Sw5pz0w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uCu9GZuIDv+CzwrpHtf10FZkrIDLoElhpHBY+pwsfLKwWPUH1iQsHv91beqtMRzun
	 22G0/Fd/VjE84eucPjNUVOjUr6Z0zchEAQBMsM2C7rcZRDHP0ztyiwETllVm2lOGGZ
	 LLo1/Xdpatedg5fCdRCXOI5lZACHNv0gqY3f843U=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250915094516epcas5p4d9e2f61d84f1637dac7c5ec9533eab5d~la5TgP2Gu1092910929epcas5p4E;
	Mon, 15 Sep 2025 09:45:16 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cQKrq564Tz6B9m6; Mon, 15 Sep
	2025 09:45:15 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89~la5R8b5L52434524345epcas5p3j;
	Mon, 15 Sep 2025 09:45:15 +0000 (GMT)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250915094512epsmtip265804811e091d1c92f81b7275247ed9c~la5PipG0g0931709317epsmtip2j;
	Mon, 15 Sep 2025 09:45:12 +0000 (GMT)
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
Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add clock support
Date: Mon, 15 Sep 2025 15:24:00 +0530
Message-Id: <20250915095401.3699849-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250915095401.3699849-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89
References: <20250915095401.3699849-1-raghav.s@samsung.com>
	<CGME20250915094515epcas5p3210f5c66a24a7a7f23a04075e7636a89@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_024520_208748_64302E45 
X-CRM114-Status: GOOD (  17.77  )
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

Add support for CMU_M2M which provides clocks to M2M block, and
register the required compatible and cmu_info for the same.

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


