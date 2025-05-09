Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20A6DC3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 15:00:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:List-Owner;
	bh=e0Eu3ZZtuZQ0K6JhQyN7GxUowK7inRr+RYFTzz6V1gY=; b=J89afF6wYham0HOGh2ZjoRoZKs
	u7cpDKKLryMGwl2ldVUJf4Szvni0JGZtQH9jYHB6LWkYwajH0A4hrJZMKP3CW+tvmK/xctt3b0KB3
	2Z2i2avIIDrqwa2eoPAjhktAa4fLO+8AUagR8hY9fBPHkiT1Vcr1TO7JvpsrJu1OiiQRRZNCNlUgw
	bVIN8ZTn2luTPrTATjA4jBhoenjxRiDmjcsFOvhwRyz67HHyJctVgkjxFQJ9G257O39Vm3nY3uu0b
	t21/FImTDIMZ6bVDxLIx7eGDxvQS7RM0cRGKMVGDpnXM7GTJtaEGPrTSqJXU1+BobnI5UEX7dX7mF
	Fy4CRlfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDPCf-000000040qg-3ure;
	Fri, 09 May 2025 14:59:57 +0000
Received: from mailout1.samsung.com ([203.254.224.24])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDNl1-00000003lI8-000I
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 13:27:21 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250509132712epoutp0109261030365248e5ab2de5eb7838f776~93tPm-hsd1229512295epoutp01w
	for <linux-arm-kernel@lists.infradead.org>; Fri,  9 May 2025 13:27:12 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250509132712epoutp0109261030365248e5ab2de5eb7838f776~93tPm-hsd1229512295epoutp01w
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1746797232;
	bh=e0Eu3ZZtuZQ0K6JhQyN7GxUowK7inRr+RYFTzz6V1gY=;
	h=From:To:Cc:Subject:Date:References:From;
	b=cXe4/vvPDnsUyQ/zYa+6dRFdUBtEjIZxq97KBqyqwbHFw99YXPAKwTYEgu2gWDFLA
	 aWEvcyV1dI1wFxRLWchs6w+n9FrogP/FCFyYellSveTB6+hMdaybGJ1iti4G3+stZE
	 l5Cy+HYPYwKzo60c51a1z22udEajNYjqU/S3kmqg=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250509132711epcas5p2decb26bfdfcd376a21cd9ef17d7ea02f~93tPDhFaE1216212162epcas5p20;
	Fri,  9 May 2025 13:27:11 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.175]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4Zv8tP5tbbz6B9m7; Fri,  9 May
	2025 13:27:09 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62~93XoXd59A0846108461epcas5p3K;
	Fri,  9 May 2025 13:02:26 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250509130226epsmtrp1f24d8b7de12cdf7a6cbea7e38cc19009~93XoWtUdw2431924319epsmtrp1Y;
	Fri,  9 May 2025 13:02:26 +0000 (GMT)
X-AuditID: b6c32a52-40bff70000004c16-64-681dfce2c039
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
	F6.FC.19478.2ECFD186; Fri,  9 May 2025 22:02:26 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250509130224epsmtip1e3878beea0dbc1db6802ec0f36e702e9~93XmiwAWx2265322653epsmtip1L;
	Fri,  9 May 2025 13:02:24 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	mturquette@baylibre.com, sboyd@kernel.org, richardcochran@gmail.com,
	alim.akhtar@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v1] clk: samsung: exynosautov920: add block hsi2 clock
 support
Date: Fri,  9 May 2025 18:42:10 +0530
Message-Id: <20250509131210.3192208-1-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrNLMWRmVeSWpSXmKPExsWy7bCSnO6jP7IZBjMvGFg8mLeNzeL6l+es
	FufPb2C32PT4GqvFx557rBaXd81hs5hxfh+TxcVTrhbHFohZfF95h9HiyJkXzBaH37SzWvy7
	tpHFgdfj/Y1Wdo+ds+6ye2xa1cnmsXlJvUffllWMHp83yQWwRXHZpKTmZJalFunbJXBlzPj/
	n7FgvnLFwpcdLA2MR2S7GDk5JARMJG6dP8vUxcjFISSwnVFi0b8jjBAJCYl9/39D2cISK/89
	Z4coesso8Wn7U7AEm4CWxJXt79hAEiICaxglPvbNB0swC5xhlJg5UQjEFhbwk2ic/J2li5GD
	g0VAVWLVN3aQMK+AtcSZ3XNYIBbIS+w/eJYZIi4ocXLmExaIMfISzVtnM09g5JuFJDULSWoB
	I9MqRtHUguLc9NzkAkO94sTc4tK8dL3k/NxNjODw1grawbhs/V+9Q4xMHIyHGCU4mJVEeJ93
	ymQI8aYkVlalFuXHF5XmpBYfYpTmYFES51XO6UwREkhPLEnNTk0tSC2CyTJxcEo1MFm1FlRO
	q7CN9rm8QjB/4uejCbul/tz7qf9TRTPyVPbDEHbXBdxi1QtYjN0ez2Lt8ntXU3BYa/l8a4ls
	dh3frr63Hb+Z938y0X+U96Rzb+mlhnc2B1a8WJl14P8nkT9uMdbzNM48k9ye4LaIb397sFpM
	zypWz9kF6jIxl7IFljw57WB6MCnh49LJ6w+baXx5HFk3lfOv8/yiCi1hi2eLNx1OLhGRWnfN
	J8f9NFO4T6OM320ea4l0pbQ/Zc+1m5ni10yavKrrK9+Xx/ZCGncMNYW2PMozjzn3rnb1/muB
	y77Vnr25LFEp/4lHx7OPFUye3YUSHj/ee3x89GmvZGOT3FYZa4dDCXW8yk2Wyfe5lFiKMxIN
	tZiLihMBaYD+fN4CAAA=
X-CMS-MailID: 20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62
References: <CGME20250509130226epcas5p3cf112ae8a2911c76f02756a386c09e62@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_062719_345155_D6AD651E 
X-CRM114-Status: GOOD (  18.82  )
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
index f8168eed4a66..89d6ea10515d 100644
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


