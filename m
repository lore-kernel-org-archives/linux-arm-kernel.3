Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD03FCA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 04:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQkuArzUBJ5lpcVufyrUHpPfpl5KDWV5jQPGPwpyaM8=; b=MJ8qBq5rvoknig1nCOd3G9Rjb+
	LZIcC+ai8tdmkEVomUf3zlOTsPsKpvJzE3K+Q96+lzosoxPC89wucuoYXBX8EnE1Gk+c9yX/D4TiM
	c3oySUyKVtkrJfMZxMn7UbnDxk2XEhW9stebqSvviA5Q31ZFae87Z0Sd1qGb12CZ3YRPsrPyp4jg8
	jfi+kEa+ilTERFvhZ2jwwpmmWTB+lOODnyLCR2RWyReo080V9eINYw9X25iKulmeU6j8+3x2Kkuci
	qPmv5TwgQqWN/DZItU5yKiZvriX6R2Vhqk1mAA67ssg6FKDXaWvC5p8fO0tWy8IE7CfU6oLPeQQ9Z
	zizpoO0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrkG-00000006UfH-24TI;
	Mon, 18 Aug 2025 04:45:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrct-00000006TcB-1BbB
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 Aug 2025 04:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Sender:Reply-To:Content-ID:Content-Description;
	bh=ZQkuArzUBJ5lpcVufyrUHpPfpl5KDWV5jQPGPwpyaM8=; b=iAKjxWn089dqxo1vO6/CPHfOXo
	2r7Aijdjwj2nyWGRwGZihwfqwMOnEyrJ+qBFkKo8TIPXiH8doKKz16hj3xiSoXsl+7ZiX0iA2L3NN
	lYCs245ZgmvATwrKenGxSaz4yM5KRuPPSeTT1BIOvjHLNjbhGyRZ1vf9mnl2GZl5HP8hao05vPrtq
	FFk5FX/+lPLhpwGA++LSHZ5DkFTH4MYNimjy60arH2WpiT8ZaUQoNLFfx5Qs5IJy+RBpmUvQexoZz
	U3d+bI5qILVtyzWk9c1+oD+B9grBZKap9QNzHKLmS40/rWc6TXBvdiV3u4NEutK6biHi2L+OYCkr/
	CLjqOsog==;
Received: from mailout4.samsung.com ([203.254.224.34])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrck-0000000HEya-25hR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:37:40 +0000
Received: from epcas5p2.samsung.com (unknown [182.195.41.40])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250818043724epoutp04a95f25a673700c0aa866684546f92f7a~cwogyKTwo2822128221epoutp04D
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:37:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250818043724epoutp04a95f25a673700c0aa866684546f92f7a~cwogyKTwo2822128221epoutp04D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491845;
	bh=ZQkuArzUBJ5lpcVufyrUHpPfpl5KDWV5jQPGPwpyaM8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bAHeCtcePAv3CBWIaO6xtw+sQZqxVbw6kdogRL8dOFSNpbXeHI3ii6OUrVnWo/NHQ
	 Tl6EBCB1gJUeWEbdy3MuXXM3l4UFhOc4G1kSTRy7BDF/GNesIPThWvmZnGS7mk5H3J
	 u7D4JC2DrC05Jy/ZHJU+Dsqj3e8vTb8s1qDjhQjw=
Received: from epsnrtp03.localdomain (unknown [182.195.42.155]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
	20250818043724epcas5p4db958c5a752ae5478793a9feaa79016a~cwogS1iFM0892908929epcas5p4z;
	Mon, 18 Aug 2025 04:37:24 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.91]) by
	epsnrtp03.localdomain (Postfix) with ESMTP id 4c50LW3f53z3hhTB; Mon, 18 Aug
	2025 04:37:23 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4~bp3cJoraC0184301843epcas5p1q;
	Thu, 14 Aug 2025 14:10:09 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141005epsmtip2d1643f4a1ca80c05e99ef3861a193ff7~bp3YUwBVU1817818178epsmtip2j;
	Thu, 14 Aug 2025 14:10:05 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, krzk@kernel.org,
	s.nawrocki@samsung.com, s.hauer@pengutronix.de, shawnguo@kernel.org,
	cw00.choi@samsung.com, rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com,
	martink@posteo.de, mchehab@kernel.org, linux-fsd@tesla.com, will@kernel.org,
	catalin.marinas@arm.com, pankaj.dubey@samsung.com, shradha.t@samsung.com,
	ravi.patel@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, alim.akhtar@samsung.com,
	linux-samsung-soc@vger.kernel.org, kernel@puri.sm, kernel@pengutronix.de,
	festevam@gmail.com, linux-media@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, Inbaraj E <inbaraj.e@samsung.com>
Subject: [PATCH v2 02/12] clk: samsung: fsd: Add clk id for PCLK and PLL in
 CAM_CSI block
Date: Thu, 14 Aug 2025 19:39:33 +0530
Message-ID: <20250814140943.22531-3-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141009epcas5p153e4aacfc1ead3db8c9bb647c6e5c7c4@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_053736_064081_2414D897 
X-CRM114-Status: GOOD (  13.38  )
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

Add clock id for PCLK and PLL. These clock id will be used for
operation of CSI driver. PCLK is AXI2APB clock used for register
access. PLL clock is main clock source for CAM_CSI block.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/clk/samsung/clk-fsd.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/clk/samsung/clk-fsd.c b/drivers/clk/samsung/clk-fsd.c
index 594931334574..4124d65e3d18 100644
--- a/drivers/clk/samsung/clk-fsd.c
+++ b/drivers/clk/samsung/clk-fsd.c
@@ -89,7 +89,7 @@
 #define CLKS_NR_FSYS1		(PCIE_LINK1_IPCLKPORT_SLV_ACLK + 1)
 #define CLKS_NR_IMEM		(IMEM_TMU_GT_IPCLKPORT_I_CLK_TS + 1)
 #define CLKS_NR_MFC		(MFC_MFC_IPCLKPORT_ACLK + 1)
-#define CLKS_NR_CAM_CSI		(CAM_CSI2_3_IPCLKPORT_I_ACLK + 1)
+#define CLKS_NR_CAM_CSI		(CAM_CSI2_3_IPCLKPORT_I_PCLK + 1)
 
 static const unsigned long cmu_clk_regs[] __initconst = {
 	PLL_LOCKTIME_PLL_SHARED0,
@@ -1646,7 +1646,7 @@ static const struct samsung_pll_rate_table pll_cam_csi_rate_table[] __initconst
 };
 
 static const struct samsung_pll_clock cam_csi_pll_clks[] __initconst = {
-	PLL(pll_142xx, 0, "fout_pll_cam_csi", "fin_pll",
+	PLL(pll_142xx, CAM_CSI_PLL, "fout_pll_cam_csi", "fin_pll",
 	    PLL_LOCKTIME_PLL_CAM_CSI, PLL_CON0_PLL_CAM_CSI, pll_cam_csi_rate_table),
 };
 
@@ -1682,51 +1682,51 @@ static const struct samsung_gate_clock cam_csi_gate_clks[] __initconst = {
 	     GAT_CAM_CSI_BUS_D_CAM_CSI_IPCLKPORT_CLK__SYSTEM__NOC, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_0_IPCLKPORT_I_ACLK, "cam_csi0_0_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_0_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_0_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_0_IPCLKPORT_I_PCLK, "cam_csi0_0_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_1_IPCLKPORT_I_ACLK, "cam_csi0_1_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_1_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_1_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_1_IPCLKPORT_I_PCLK, "cam_csi0_1_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_2_IPCLKPORT_I_ACLK, "cam_csi0_2_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_2_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_2_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_2_IPCLKPORT_I_PCLK, "cam_csi0_2_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI0_3_IPCLKPORT_I_ACLK, "cam_csi0_3_ipclkport_i_aclk", "dout_cam_csi0_aclk",
 	     GAT_CAM_CSI0_3_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi0_3_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI0_3_IPCLKPORT_I_PCLK, "cam_csi0_3_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI0_3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_0_IPCLKPORT_I_ACLK, "cam_csi1_0_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_0_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_0_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_0_IPCLKPORT_I_PCLK, "cam_csi1_0_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_1_IPCLKPORT_I_ACLK, "cam_csi1_1_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_1_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_1_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_1_IPCLKPORT_I_PCLK, "cam_csi1_1_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_2_IPCLKPORT_I_ACLK, "cam_csi1_2_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_2_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_2_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_2_IPCLKPORT_I_PCLK, "cam_csi1_2_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI1_3_IPCLKPORT_I_ACLK, "cam_csi1_3_ipclkport_i_aclk", "dout_cam_csi1_aclk",
 	     GAT_CAM_CSI1_3_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi1_3_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI1_3_IPCLKPORT_I_PCLK, "cam_csi1_3_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI1_3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_0_IPCLKPORT_I_ACLK, "cam_csi2_0_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_0_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_0_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_0_IPCLKPORT_I_PCLK, "cam_csi2_0_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_0_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_1_IPCLKPORT_I_ACLK, "cam_csi2_1_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_1_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_1_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_1_IPCLKPORT_I_PCLK, "cam_csi2_1_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_1_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_2_IPCLKPORT_I_ACLK, "cam_csi2_2_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_2_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_2_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_2_IPCLKPORT_I_PCLK, "cam_csi2_2_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_2_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(CAM_CSI2_3_IPCLKPORT_I_ACLK, "cam_csi2_3_ipclkport_i_aclk", "dout_cam_csi2_aclk",
 	     GAT_CAM_CSI2_3_IPCLKPORT_I_ACLK, 21, CLK_IGNORE_UNUSED, 0),
-	GATE(0, "cam_csi2_3_ipclkport_i_pclk", "dout_cam_csi_busp",
+	GATE(CAM_CSI2_3_IPCLKPORT_I_PCLK, "cam_csi2_3_ipclkport_i_pclk", "dout_cam_csi_busp",
 	     GAT_CAM_CSI2_3_IPCLKPORT_I_PCLK, 21, CLK_IGNORE_UNUSED, 0),
 	GATE(0, "cam_ns_brdg_cam_csi_ipclkport_clk__psoc_cam_csi__clk_cam_csi_d",
 	     "dout_cam_csi_busd",
-- 
2.49.0


