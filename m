Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B61F6C3ABCC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 14:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8WKsU5t0kQKXkzewEHojQ9MYlM5Y7vAzte+OeClSGAw=; b=p5bkiiCO5bA1Q2GI5i3/BsjvaY
	ZYBxINlVg7YaMtMuDqC41LjAl/oPAxieL8cw9SuIMf9GgMV0lswXY/0erxYjWEnyT+Pa1CReYFMHt
	vlb+2Je4bqsVsCguY9QXrb3vS5PNB0r5Y2wlKdr6kYHZNElJaw7e/v0woEU3HdXggOjYPf4QaqcIF
	7XWoWAY9CfQ41GBIUTqmSqdQqCMNauc+LahaKj3JcRZ/BXiPWUVK8Waelg3a7CVTHt263mLaJC+Ng
	rdKtydo6+b0B3c1tYaZvT4BNSh+BfhF9xKnj4e7zjsLmHDcv88HyBiG1XyoM1Z8EhDImdyWlxf6GL
	nQVdk4Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDEJ-0000000FQlO-0pZE;
	Wed, 14 May 2025 14:37:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFCXX-0000000FGkx-2JLZ
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 14 May 2025 13:52:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=8WKsU5t0kQKXkzewEHojQ9MYlM5Y7vAzte+OeClSGAw=; b=c/jDyq+S3xsdH4pS12h2ePnkPA
	VVVqGoBxrYzHpYU2SfcAr/MyVgGV7z/Aub+UNZFHvoZpr80a+7k6akoSHiTukO/o/CXo5rmu8D7ak
	vQRatv9ruc/dYZfDAXQ1/wUAlnhDe5NibAUCzA91lOcKx8ppgXu+n0JxQupzOTWZ3D/utDKhxxGgN
	Joi+c7RAjfTHM1d1xwu/T30C352xnbD1oUHlXqSxlv3CqCUkxbOFb673VboUfKo2HKdkZFu+5t/Mq
	b6vRzLTcqmo8YDz/ZRpOmA/FDT2sdFW0JB/TLOYaWiTB348tinzcYQcTHoYWug+rxP/cVlCK17dvB
	LRFQJSBQ==;
Received: from mailout1.samsung.com ([203.254.224.24])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uFCXT-0000000HCF1-0zkE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 May 2025 13:52:54 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout1.samsung.com (KnoxPortal) with ESMTP id 20250514135239epoutp015b8c30dec17a650f35bf6a0cc5ba7051~-aR5gYGsp0103801038epoutp01F
	for <linux-arm-kernel@lists.infradead.org>; Wed, 14 May 2025 13:52:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com 20250514135239epoutp015b8c30dec17a650f35bf6a0cc5ba7051~-aR5gYGsp0103801038epoutp01F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747230759;
	bh=8WKsU5t0kQKXkzewEHojQ9MYlM5Y7vAzte+OeClSGAw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=HZAGCzBSTJX8ipRcPHVIjoiiezhdTXPE6NKDqRYBPQf/9pBXMJ0YqKvN/BewKUYNC
	 U4asBXfwEnOOBT/9swjI7hqW/NtER3O2pmakPQiROLPjMjmYqdU2IvVIlOHlvPNGQK
	 bVD6n7UX3nvcWngBJRctFkBT6eseGigh9Hk57GFM=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250514135238epcas5p480177a4de5ac9c047399544bb3285ca4~-aR4vXONY3115031150epcas5p4M;
	Wed, 14 May 2025 13:52:38 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.178]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4ZyFCS5dyyz6B9m6; Wed, 14 May
	2025 13:52:36 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250514095239epcas5p4a08eea7daa18a0fbda8873f64122a774~-XAWq1QPV1932519325epcas5p4E;
	Wed, 14 May 2025 09:52:39 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250514095239epsmtrp165f4ee08a6c2e9506ed795018f8114e5~-XAWp0ABe1927519275epsmtrp1Q;
	Wed, 14 May 2025 09:52:39 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-67-682467e773de
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	7E.8B.08766.7E764286; Wed, 14 May 2025 18:52:39 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250514095236epsmtip2db692ab276e71302b8d52d182d5c59f7~-XAT3BQRN1817318173epsmtip2L;
	Wed, 14 May 2025 09:52:36 +0000 (GMT)
From: Raghav Sharma <raghav.s@samsung.com>
To: krzk@kernel.org, s.nawrocki@samsung.com, cw00.choi@samsung.com,
	alim.akhtar@samsung.com, mturquette@baylibre.com, sboyd@kernel.org,
	robh@kernel.org, conor+dt@kernel.org, richardcochran@gmail.com,
	sunyeal.hong@samsung.com, shin.son@samsung.com
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	dev.tailor@samsung.com, chandan.vn@samsung.com, karthik.sun@samsung.com,
	Raghav Sharma <raghav.s@samsung.com>
Subject: [PATCH v2 2/3] clk: samsung: exynosautov920: add block hsi2 clock
 support
Date: Wed, 14 May 2025 15:32:13 +0530
Message-Id: <20250514100214.2479552-3-raghav.s@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250514100214.2479552-1-raghav.s@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjkeLIzCtJLcpLzFFi42LZdlhJXvd5ukqGwbNPOhYP5m1js5jwJcJi
	zd5zTBbXvzxntbi3Yxm7xfwj51gtGme8YbI4f34Du8Wmx9dYLT723GO1uLxrDpvFjPP7mCwu
	nnK1OLZAzOL7yjuMFkfOvGC2+L9nB7vF4TftrBb/rm1ksZh8fC2rRdOy9UwOoh7vb7Sye+yc
	dZfdY9OqTjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvj+qLzbAXzlSsmfm1haWA8
	ItvFyMkhIWAi8XnBRxYQW0hgN6PEnXfZEHEJiX3/fzNC2MISK/89Z+9i5AKqecsosbH5HBtI
	gk1AS+LK9ndsIAkRgS4miXP/XoFNYhbYySSxcr0EiC0sECSxYsFpsAYWAVWJLbums4LYvALW
	EjvmfWSG2CAvsf/gWTCbU8BG4uuLy8wQF1lLtLyawwRRLyhxcuYTqPnyEs1bZzNPYBSYhSQ1
	C0lqASPTKkbJ1ILi3PTcYsMCw7zUcr3ixNzi0rx0veT83E2M4CjT0tzBuH3VB71DjEwcjIcY
	JTiYlUR4r2cpZwjxpiRWVqUW5ccXleakFh9ilOZgURLnFX/RmyIkkJ5YkpqdmlqQWgSTZeLg
	lGpgChf03SDzNWxb7CXBTcc/aDWd7Rd5pZc3JyLgdURikKCUd6f5xWvNSbGXvu6xzfq1fENr
	XOb9r1mS1cczn3lPuHih0vj0oflLMiYr8te8O5/Aqc77/MYm500mU+7sTFsl+5Upd9uDOy8f
	Wara37s348KkPZ/7rshYKQXxKvo1PzhhLvja++BUIU5lf42nc+f47crpDfFX7suQnSO0f9rC
	b5+uzhLapbK3eO7tlrmf/zA3S7LprpL/UW577GShwd+TBZdj57SnfW/49P9w2MROPzWRg1ZH
	r7w+7XPz3dWLh89Iyxf2GB9K3T9N9KVxH3vp78aX1jtP+Nx+y2U8k/HJdK5w+bIEJWeDx5/Y
	Hz74/kOJpTgj0VCLuag4EQDcJh+1IQMAAA==
X-CMS-MailID: 20250514095239epcas5p4a08eea7daa18a0fbda8873f64122a774
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-543,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250514095239epcas5p4a08eea7daa18a0fbda8873f64122a774
References: <20250514100214.2479552-1-raghav.s@samsung.com>
	<CGME20250514095239epcas5p4a08eea7daa18a0fbda8873f64122a774@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_145252_008253_E9AB3715 
X-CRM114-Status: GOOD (  19.54  )
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


