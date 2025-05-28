Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF88AC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 May 2025 11:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnLKzCWBo49PbMF9HmIGzZWaINYw9EWKLzqGzviX39A=; b=a9og+7O2MLF1ssMXRz+pFTt4RQ
	xfoTRhyKcnbZzz1HNM9KUaeSI7fnNdyRIV0TGfVU7ZQt/aGY84PvLDyoUnq82FkUfgxWTAHFpi8G2
	+VLzvfZdUrkZ2OCdIqhklhPt3NFh0gAS1Rfgs5bohw+U6sK9pX3w8AyTGI/x18dQoimUOB/gHduhL
	h6wYEnunHP03n9VdW6QDcRray7K+KLTx9ybS8m+18xjwcQvjZ+XS7o66uyb6yvczCXLt7bLnSGyDU
	CkiRCnmBqX/JcFO2recwjxz2TQwPYn2DAu4O8Tza3H+C/CPd9dP2Z2E7nEG2Dq61QirUTSCfJ4NuX
	rvgZvGCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEj3-0000000Cwxn-33UO;
	Wed, 28 May 2025 11:13:37 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEQZ-0000000CvIM-2BRR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 May 2025 10:54:32 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=2Yk7R9XoMM9siRLnRktw0LMuwLrIRn1j1Z6cgy9JIdD0DZn0wd/55pqoZ+UkCeaU2CgbXd8spYt/z4l1nkDBZ+xCswVRbnnQyo6sAZQYLRMD3lGQbf8jaqEMhgFpagcb4Inx0szqQTSl8U+D1zUd/TJgJd0GEEOGMkyXY04RgRBPXQFciayQwxn3w7Tce/+RDm67dTxcVw7wYI/eY4WPu+ghI0z3Mifpdyr5ohqEKSxTqISAAHqNgoIc8TB00Wp0D2jGrN9CjI/tI+ECDmeMv7IPvknBIIDdifcvUrvsMOH0u70oLPGkN41qHlRipEgrAP9gpwSGaznoP6poFhswsg==; s=purelymail3; d=purelymail.com; v=1; bh=0pPylfzDfxShLC+1NXvmbMDM0mKUGGgu8xx79UZwJpw=; h=Feedback-ID:Received:From:To:Subject:Date;
Feedback-ID: 68229:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id -1157235224;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Wed, 28 May 2025 10:53:49 +0000 (UTC)
From: Umer Uddin <umer.uddin@mentallysanemainliners.org>
To: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 2/2] clk: samsung: exynos990: Add CMU_HSI1 block
Date: Wed, 28 May 2025 11:52:52 +0100
Message-ID: <20250528105252.157533-3-umer.uddin@mentallysanemainliners.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
References: <20250528105252.157533-1-umer.uddin@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by Purelymail
Content-Type: text/plain; charset=UTF-8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_035431_707982_CED4CC51 
X-CRM114-Status: UNSURE (   9.81  )
X-CRM114-Notice: Please train this message.
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

The CMU_HSI1 block is used for providing clocks for the DesignWare
MMC Controller, PCIE Subsystem and UFS subsystem, and has six
dependency clocks from CMU_TOP.

Signed-off-by: Umer Uddin <umer.uddin@mentallysanemainliners.org>
---
 drivers/clk/samsung/clk-exynos990.c | 221 ++++++++++++++++++++++++++++
 1 file changed, 221 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos990.c b/drivers/clk/samsung/clk-=
exynos990.c
index 8d3f193d2..91ecbafcf 100644
--- a/drivers/clk/samsung/clk-exynos990.c
+++ b/drivers/clk/samsung/clk-exynos990.c
@@ -20,6 +20,7 @@
 #define CLKS_NR_TOP (CLK_GOUT_CMU_VRA_BUS + 1)
 #define CLKS_NR_HSI0 (CLK_GOUT_HSI0_XIU_D_HSI0_ACLK + 1)
 #define CLKS_NR_PERIS (CLK_GOUT_PERIS_OTP_CON_TOP_OSCCLK + 1)
+#define CLKS_NR_HSI1 (CLK_MOUT_HSI1_UFS_EMBD_USER + 1)
=20
 /* ---- CMU_TOP ----------------------------------------------------------=
--- */
=20
@@ -1483,6 +1484,222 @@ static void __init exynos990_cmu_peris_init(struct =
device_node *np)
 CLK_OF_DECLARE(exynos990_cmu_peris, "samsung,exynos990-cmu-peris",
 =09       exynos990_cmu_peris_init);
=20
+/* ---- CMU_HSI1 ---------------------------------------------------------=
--- */
+
+/* Register Offset definitions for CMU_HSI1 (0x13000000) */
+#define PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER=09=09=09=09=09=09=09=09=09=09=09=
=090x0600
+#define PLL_CON1_MUX_CLKCMU_HSI1_BUS_USER=09=09=09=09=09=09=09=09=09=09=09=
=090x0604
+#define PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0610
+#define PLL_CON1_MUX_CLKCMU_HSI1_MMC_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0614
+#define PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER=09=09=09=09=09=09=09=09=09=09=
=09=090x0620
+#define PLL_CON1_MUX_CLKCMU_HSI1_PCIE_USER=09=09=09=09=09=09=09=09=09=09=
=09=090x0624
+#define PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0630
+#define PLL_CON1_MUX_CLKCMU_HSI1_UFS_CARD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0634
+#define PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0640
+#define PLL_CON1_MUX_CLKCMU_HSI1_UFS_EMBD_USER=09=09=09=09=09=09=09=09=09=
=09=09=090x0644
+#define HSI1_CMU_HSI1_CONTROLLER_OPTION=09=09=09=09=09=09=09=09=09=09=09=
=09=090x0800
+#define CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PHY_REFCLK_IN=09=
=09=09=09=09=09=09=09=090x2000
+#define CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_S=
UB_CTRL_INST_0_PHY_REFCLK_IN=09=09=09=09=090x2004
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_D_TZPC_HSI1_IPCLKPORT_PCLK=09=09=09=
=09=09=09=09=09=090x2008
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_GPIO_HSI1_IPCLKPORT_PCLK=09=09=09=09=
=09=09=09=09=09=090x200c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_HSI1_CMU_HSI1_IPCLKPORT_PCLK=09=09=
=09=09=09=09=09=09=090x2010
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHM_AXI_P_HSI1_IPCLKPORT_I_CLK=09=09=
=09=09=09=09=09=09=090x2014
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHS_ACEL_D_HSI1_IPCLKPORT_I_CLK=09=
=09=09=09=09=09=09=09=090x2018
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_I_ACLK=09=09=09=
=09=09=09=09=09=09=090x201c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_SDCLKIN=09=09=09=
=09=09=09=09=09=090x2020
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_DBI_ACLK=09=09=
=09=09=09=09=09=09=090x2024
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_IEEE1500_WRAPPER=
_FOR_PCIEG2_PHY_X1_INST_0_I_SCL_APB_PCLK=09=09=090x2028
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_MSTR_ACLK=09=09=
=09=09=09=09=09=09=090x202c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PCIE_SUB_CTRL_IN=
ST_0_I_DRIVER_APB_CLK=09=09=09=09=09=090x2030
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PIPE2_DIGITAL_X1=
_WRAP_INST_0_I_APB_PCLK_SCL=09=09=09=09=090x2034
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_SLV_ACLK=09=09=
=09=09=09=09=09=09=090x2038
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_=
DWC_PCIE_CTL_INST_0_DBI_ACLK_UG=09=09=09=090x203c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_=
DWC_PCIE_CTL_INST_0_MSTR_ACLK_UG=09=09=09=090x2040
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_=
DWC_PCIE_CTL_INST_0_SLV_ACLK_UG=09=09=09=090x2044
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_=
SUB_CTRL_INST_0_I_DRIVER_APB_CLK=09=09=09=090x2048
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0=
_PIPE_PAL_PCIE_INST_0_I_APB_PCLK=09=09=09=090x204c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0=
_SF_PCIEPHY000X2_LN07LPP_QCH_TM_WRAPPER_INST_0_I_APB_PCLK=090x2050
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN2_IPCLKPORT_I_CLK=09=09=
=09=09=09=09=09=09=090x2054
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN4_0_IPCLKPORT_I_CLK=09=09=
=09=09=09=09=09=09=090x2058
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_ACLK=09=09=09=09=
=09=09=09=09=09=090x205c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_PCLK=09=09=09=09=
=09=09=09=09=09=090x2060
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_BUS_IPCLKPORT_CLK=
=09=09=09=09=09=09=09=090x2064
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_OSCCLK_IPCLKPORT_C=
LK=09=09=09=09=09=09=09=090x2068
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSMMU_HSI1_IPCLKPORT_CLK_S2=09=09=
=09=09=09=09=09=09=090x206c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSREG_HSI1_IPCLKPORT_PCLK=09=09=09=
=09=09=09=09=09=090x2070
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_ACLK=09=09=09=
=09=09=09=09=09=09=090x2074
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_CLK_UNIPRO=09=
=09=09=09=09=09=09=09=090x2078
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_FMP_CLK=09=09=
=09=09=09=09=09=09=090x207c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_ACLK=09=09=09=
=09=09=09=09=09=09=090x2080
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO=09=
=09=09=09=09=09=09=09=090x2084
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK=09=09=
=09=09=09=09=09=09=090x2088
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_VGEN_LITE_HSI1_IPCLKPORT_CLK=09=09=
=09=09=09=09=09=09=090x208c
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_D_HSI1_IPCLKPORT_ACLK=09=09=09=
=09=09=09=09=09=09=090x2090
+#define CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_P_HSI1_IPCLKPORT_ACLK=09=09=09=
=09=09=09=09=09=09=090x2094
+#define DMYQCH_CON_PCIE_GEN2_QCH_REF=09=09=09=09=09=09=09=09=09=09=09=09=
=090x3000
+#define DMYQCH_CON_PCIE_GEN4_0_QCH_REF=09=09=09=09=09=09=09=09=09=09=09=09=
=090x3004
+#define QCH_CON_D_TZPC_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3024
+#define QCH_CON_GPIO_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
028
+#define QCH_CON_HSI1_CMU_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090x=
302c
+#define QCH_CON_LHM_AXI_P_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3030
+#define QCH_CON_LHS_ACEL_D_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3034
+#define QCH_CON_MMC_CARD_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x30=
38
+#define QCH_CON_PCIE_GEN2_QCH_APB=09=09=09=09=09=09=09=09=09=09=09=09=090x=
303c
+#define QCH_CON_PCIE_GEN2_QCH_DBI=09=09=09=09=09=09=09=09=09=09=09=09=090x=
3040
+#define QCH_CON_PCIE_GEN2_QCH_MSTR=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3044
+#define QCH_CON_PCIE_GEN2_QCH_PCS=09=09=09=09=09=09=09=09=09=09=09=09=090x=
3048
+#define QCH_CON_PCIE_GEN2_QCH_PHY=09=09=09=09=09=09=09=09=09=09=09=09=090x=
304c
+#define QCH_CON_PCIE_GEN4_0_QCH_APB=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3050
+#define QCH_CON_PCIE_GEN4_0_QCH_AXI=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3054
+#define QCH_CON_PCIE_GEN4_0_QCH_DBI=09=09=09=09=09=09=09=09=09=09=09=09=09=
0x3058
+#define QCH_CON_PCIE_GEN4_0_QCH_PCS_APB=09=09=09=09=09=09=09=09=09=09=09=
=09=090x305c
+#define QCH_CON_PCIE_GEN4_0_QCH_PMA_APB=09=09=09=09=09=09=09=09=09=09=09=
=09=090x3060
+#define QCH_CON_PCIE_IA_GEN2_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
064
+#define QCH_CON_PCIE_IA_GEN4_0_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3068
+#define QCH_CON_PPMU_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
06c
+#define QCH_CON_SYSMMU_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3070
+#define QCH_CON_SYSREG_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3074
+#define QCH_CON_UFS_CARD_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x30=
78
+#define QCH_CON_UFS_CARD_QCH_FMP=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
07c
+#define QCH_CON_UFS_EMBD_QCH=09=09=09=09=09=09=09=09=09=09=09=09=09=090x30=
80
+#define QCH_CON_UFS_EMBD_QCH_FMP=09=09=09=09=09=09=09=09=09=09=09=09=090x3=
084
+#define QCH_CON_VGEN_LITE_HSI1_QCH=09=09=09=09=09=09=09=09=09=09=09=09=090=
x3088
+
+static const unsigned long hsi1_clk_regs[] __initconst =3D {
+=09PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_BUS_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_PCIE_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_UFS_CARD_USER,
+=09PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER,
+=09PLL_CON1_MUX_CLKCMU_HSI1_UFS_EMBD_USER,
+=09HSI1_CMU_HSI1_CONTROLLER_OPTION,
+=09CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PHY_REFCLK_IN,
+=09CLK_CON_GAT_CLK_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_SUB_CT=
RL_INST_0_PHY_REFCLK_IN,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_D_TZPC_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_GPIO_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_HSI1_CMU_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHM_AXI_P_HSI1_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_LHS_ACEL_D_HSI1_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_I_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_MMC_CARD_IPCLKPORT_SDCLKIN,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_DBI_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_IEEE1500_WRAPPER_FOR_=
PCIEG2_PHY_X1_INST_0_I_SCL_APB_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_MSTR_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PCIE_SUB_CTRL_INST_0_=
I_DRIVER_APB_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_PIPE2_DIGITAL_X1_WRAP=
_INST_0_I_APB_PCLK_SCL,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN2_IPCLKPORT_SLV_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_P=
CIE_CTL_INST_0_DBI_ACLK_UG,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_P=
CIE_CTL_INST_0_MSTR_ACLK_UG,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_G4X2_DWC_P=
CIE_CTL_INST_0_SLV_ACLK_UG,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCIE_001_PCIE_SUB_C=
TRL_INST_0_I_DRIVER_APB_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0_PIPE=
_PAL_PCIE_INST_0_I_APB_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_GEN4_0_IPCLKPORT_PCS_PMA_INST_0_SF_P=
CIEPHY000X2_LN07LPP_QCH_TM_WRAPPER_INST_0_I_APB_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN2_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PCIE_IA_GEN4_0_IPCLKPORT_I_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_PPMU_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_BUS_IPCLKPORT_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_RSTNSYNC_CLK_HSI1_OSCCLK_IPCLKPORT_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSMMU_HSI1_IPCLKPORT_CLK_S2,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_SYSREG_HSI1_IPCLKPORT_PCLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_CLK_UNIPRO,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_CARD_IPCLKPORT_I_FMP_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_CLK_UNIPRO,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_UFS_EMBD_IPCLKPORT_I_FMP_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_VGEN_LITE_HSI1_IPCLKPORT_CLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_D_HSI1_IPCLKPORT_ACLK,
+=09CLK_CON_GAT_GOUT_BLK_HSI1_UID_XIU_P_HSI1_IPCLKPORT_ACLK,
+=09DMYQCH_CON_PCIE_GEN2_QCH_REF,
+=09DMYQCH_CON_PCIE_GEN4_0_QCH_REF,
+=09QCH_CON_D_TZPC_HSI1_QCH,
+=09QCH_CON_GPIO_HSI1_QCH,
+=09QCH_CON_HSI1_CMU_HSI1_QCH,
+=09QCH_CON_LHM_AXI_P_HSI1_QCH,
+=09QCH_CON_LHS_ACEL_D_HSI1_QCH,
+=09QCH_CON_MMC_CARD_QCH,
+=09QCH_CON_PCIE_GEN2_QCH_APB,
+=09QCH_CON_PCIE_GEN2_QCH_DBI,
+=09QCH_CON_PCIE_GEN2_QCH_MSTR,
+=09QCH_CON_PCIE_GEN2_QCH_PCS,
+=09QCH_CON_PCIE_GEN2_QCH_PHY,
+=09QCH_CON_PCIE_GEN4_0_QCH_APB,
+=09QCH_CON_PCIE_GEN4_0_QCH_AXI,
+=09QCH_CON_PCIE_GEN4_0_QCH_DBI,
+=09QCH_CON_PCIE_GEN4_0_QCH_PCS_APB,
+=09QCH_CON_PCIE_GEN4_0_QCH_PMA_APB,
+=09QCH_CON_PCIE_IA_GEN2_QCH,
+=09QCH_CON_PCIE_IA_GEN4_0_QCH,
+=09QCH_CON_PPMU_HSI1_QCH,
+=09QCH_CON_SYSMMU_HSI1_QCH,
+=09QCH_CON_SYSREG_HSI1_QCH,
+=09QCH_CON_UFS_CARD_QCH,
+=09QCH_CON_UFS_CARD_QCH_FMP,
+=09QCH_CON_UFS_EMBD_QCH,
+=09QCH_CON_UFS_EMBD_QCH_FMP,
+=09QCH_CON_VGEN_LITE_HSI1_QCH,
+};
+
+/* Parent clock list for CMU_HSI1 muxes */
+PNAME(mout_hsi1_ufs_embd_p) =3D=09=09{ "oscclk",
+=09=09=09=09=09  "dout_cmu_shared0_div4",
+=09=09=09=09=09  "dout_cmu_shared2_div2",
+=09=09=09=09=09  "oscclk" };
+PNAME(mout_hsi1_ufs_card_p) =3D=09=09{ "oscclk",
+=09=09=09=09=09  "dout_cmu_shared0_div4",
+=09=09=09=09=09  "dout_cmu_shared2_div2",
+=09=09=09=09=09  "oscclk" };
+PNAME(mout_hsi1_pcie_p) =3D=09=09{ "oscclk", "fout_shared2_pll" };
+PNAME(mout_hsi1_bus_p) =3D=09=09{ "dout_cmu_shared0_div3",
+=09=09=09=09=09  "dout_cmu_shared0_div4",
+=09=09=09=09=09  "dout_cmu_shared1_div4",
+=09=09=09=09=09  "dout_cmu_shared4_div3",
+=09=09=09=09=09  "dout_cmu_shared2_div2",
+=09=09=09=09=09  "fout_mmc_pll",
+=09=09=09=09=09  "oscclk",
+=09=09=09=09=09  "oscclk" };
+PNAME(mout_hsi1_mmc_card_p) =3D=09=09{ "oscclk",
+=09=09=09=09=09  "fout_shared2_pll",
+=09=09=09=09=09  "fout_mmc_pll",
+=09=09=09=09=09  "dout_cmu_shared0_div4" };
+PNAME(mout_hsi1_bus_user_p) =3D=09=09{ "oscclk", "dout_cmu_hsi1_bus" };
+PNAME(mout_hsi1_mmc_card_user_p) =3D=09{ "oscclk", "dout_cmu_hsi1_mmc_card=
" };
+PNAME(mout_hsi1_pcie_user_p) =3D=09=09{ "oscclk", "dout_cmu_hsi1_pcie" };
+PNAME(mout_hsi1_ufs_card_user_p) =3D=09{ "oscclk", "dout_cmu_hsi1_ufs_card=
" };
+PNAME(mout_hsi1_ufs_embd_user_p) =3D=09{ "oscclk", "dout_cmu_hsi1_ufs_embd=
" };
+
+static const struct samsung_mux_clock hsi1_mux_clks[] __initconst =3D {
+=09MUX(CLK_MOUT_HSI1_BUS_USER, "mout_hsi1_bus_user",
+=09    mout_hsi1_bus_user_p, PLL_CON0_MUX_CLKCMU_HSI1_BUS_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_MMC_CARD_USER, "mout_hsi1_mmc_card_user",
+=09    mout_hsi1_mmc_card_user_p, PLL_CON0_MUX_CLKCMU_HSI1_MMC_CARD_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_PCIE_USER, "mout_hsi1_pcie_user",
+=09    mout_hsi1_pcie_user_p, PLL_CON0_MUX_CLKCMU_HSI1_PCIE_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_UFS_CARD_USER, "mout_hsi1_ufs_card_user",
+=09    mout_hsi1_ufs_card_user_p, PLL_CON0_MUX_CLKCMU_HSI1_UFS_CARD_USER,
+=09    4, 1),
+=09MUX(CLK_MOUT_HSI1_UFS_EMBD_USER, "mout_hsi1_ufs_embd_user",
+=09    mout_hsi1_ufs_embd_user_p, PLL_CON0_MUX_CLKCMU_HSI1_UFS_EMBD_USER,
+=09    4, 1),
+};
+
+static const struct samsung_cmu_info hsi1_cmu_info __initconst =3D {
+=09.mux_clks =3D hsi1_mux_clks,
+=09.nr_mux_clks =3D ARRAY_SIZE(hsi1_mux_clks),
+=09.nr_clk_ids =3D CLKS_NR_HSI1,
+=09.clk_regs =3D hsi1_clk_regs,
+=09.nr_clk_regs =3D ARRAY_SIZE(hsi1_clk_regs),
+=09.clk_name=09=09=3D "bus",
+};
+
 /* ----- platform_driver ----- */
=20
 static int __init exynos990_cmu_probe(struct platform_device *pdev)
@@ -1501,6 +1718,10 @@ static const struct of_device_id exynos990_cmu_of_ma=
tch[] =3D {
 =09=09.compatible =3D "samsung,exynos990-cmu-hsi0",
 =09=09.data =3D &hsi0_cmu_info,
 =09},
+=09{
+=09=09.compatible =3D "samsung,exynos990-cmu-hsi1",
+=09=09.data =3D &hsi1_cmu_info,
+=09},
 =09{ },
 };
=20
--=20
2.47.2


