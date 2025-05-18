Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3290BC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 09:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K21TW+apj+UqDGFEskJE4tHm+9u+Y6333ZdWE6ryTJE=; b=U918E5uoNb+Zi8pdKc0zUCBGRf
	LPoov9c0EALMWNt/liCsaflssnCwzSYHUb3ampYJEP3b3jX0jLC1/aXb95Ux+zlIbi9CAknWf70Cw
	1Lo7OE27naLT9iIFkfMgaZICvH+f7NiotBkEHrStDZLL3PCEDYfWJ2LxwgIw/d1R42mXODTPX2rIa
	isUE9DhTGZRbAS7BxYPNIC8zPeE+RcwBNqZCv5djh4vBaUwyUR2fMGzNOYiHdcUDIO4nC6NjfGim0
	CBkYBYJRE7TK9tvU5uPKxUo0hYt3UGrkuNgbXAmx+Wq5u+5zWPRBHZPUXjACC0DlsT3ZTMhXJ2kqd
	WBU2DQTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGx6K-00000008ew3-3wps;
	Mon, 19 May 2025 09:48:04 +0000
Received: from mailout4.samsung.com ([203.254.224.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGwow-00000008ZXO-2BnV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 09:30:08 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout4.samsung.com (KnoxPortal) with ESMTP id 20250519093004epoutp0455b2d6f97057047015fab94407d174dd~A47EG4pyq1578215782epoutp04l
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 09:30:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com 20250519093004epoutp0455b2d6f97057047015fab94407d174dd~A47EG4pyq1578215782epoutp04l
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747647004;
	bh=K21TW+apj+UqDGFEskJE4tHm+9u+Y6333ZdWE6ryTJE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WfE/SWui8b8JQo9pMrb2Vuy1d9I5T9Nq5s4tOzRH1irMxEWTAbxIysXbohV6LFoHw
	 G1nnVmdYDpsrmwfUYer3Xqfsd8qkESsYiNLUwNwrF4KWGyRpmw4C7AQGyXg8ahnpVu
	 T8zTQp1uEK1aQr2KQMijAvf/kCN8r5Xdx2vbyjco=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPS id
	20250519093004epcas5p34809d4f6059d5c87f08a388fadf386d4~A47DggzMH1987119871epcas5p3M;
	Mon, 19 May 2025 09:30:04 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4b1C8B65dLz6B9mJ; Mon, 19 May
	2025 09:30:02 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250518193256epcas5p442e9549fd8fd810522f960df74c22e34~AtgI8aQmL1869218692epcas5p4-;
	Sun, 18 May 2025 19:32:56 +0000 (GMT)
Received: from epsmgmc1p1new.samsung.com (unknown [182.195.42.40]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250518193256epsmtrp1f5221d236c680a2c817e0debfbab93c3~AtgI7VQZb2445124451epsmtrp1k;
	Sun, 18 May 2025 19:32:56 +0000 (GMT)
X-AuditID: b6c32a28-460ee70000001e8a-f5-682a35e7f176
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
	epsmgmc1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	60.6A.07818.7E53A286; Mon, 19 May 2025 04:32:55 +0900 (KST)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250518193253epsmtip1f2d2241ae535c7ecf6713ef003408cf5~AtgGKaxM41176111761epsmtip1K;
	Sun, 18 May 2025 19:32:53 +0000 (GMT)
From: Shradha Todi <shradha.t@samsung.com>
To: linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.or,
	linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org
Cc: manivannan.sadhasivam@linaro.org, lpieralisi@kernel.org, kw@linux.com,
	robh@kernel.org, bhelgaas@google.com, jingoohan1@gmail.com,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	vkoul@kernel.org, kishon@kernel.org, arnd@arndb.de,
	m.szyprowski@samsung.com, jh80.chung@samsung.com, Shradha Todi
	<shradha.t@samsung.com>
Subject: [PATCH 08/10] phy: exynos: Add PCIe PHY support for FSD SoC
Date: Mon, 19 May 2025 01:01:50 +0530
Message-ID: <20250518193152.63476-9-shradha.t@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250518193152.63476-1-shradha.t@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrIIsWRmVeSWpSXmKPExsWy7bCSnO5zU60Mg+d/bSwezNvGZvF30jF2
	iyVNGRZr9p5jsph/5ByrxY1fbawWK77MZLc42vqf2eLlrHtsFg09v1ktNj2+xmpxedccNouz
	846zWUxY9Y3F4uz3BUwWLX9aWCzWHrnLbnG3pZPV4v+eHewWvYdrLXbeOcHsIOrx+9ckRo+d
	s+6yeyzYVOqxaVUnm8eda3vYPJ5cmc7ksXlJvUffllWMHke+Tmfx+LxJLoArissmJTUnsyy1
	SN8ugStj7oJTjAXTqyuO/Z7I2MB4MLuLkZNDQsBEYv+Co8xdjFwcQgK7GSX+/JvHBJGQlPh8
	cR2ULSyx8t9zdoiiT4wSbxftAUuwCWhJNH7tYgaxRQROMEr03bIEKWIWeM8kMXPBL7AiYQEX
	iaYnv1lBbBYBVYnJR5cwdjFycPAKWEl8vZcHYkoIyEv0d0iAVHAKWEtsWz8VrFMIqGLhk52M
	IDavgKDEyZlPWEBsZqDy5q2zmScwCsxCkpqFJLWAkWkVo2RqQXFuem6yYYFhXmq5XnFibnFp
	Xrpecn7uJkZwLGpp7GB8961J/xAjEwfjIUYJDmYlEd5VmzUyhHhTEiurUovy44tKc1KLDzFK
	c7AoifOuNIxIFxJITyxJzU5NLUgtgskycXBKNTDlsnplz/r04YZ7Wvu1d5NLKpN1Ihs6EtO0
	fxaffrR2GlOWxb1C9c7287t5q9skFixdK+zJV/Rj4obMjKNapzffknu8erqxk0LGkyfxF5VM
	xPVfVi9ammHjaCnTPnO3ck7olr9vTO8t+dQ8U4tXqnK64/MCp5ZvVb8MDjXH1H30tl2/wqek
	02JuHUvC5v2fGRjO/JtXXrOQ75/HZOFlQZMVVfXmma9dUszhJlrzSIJ19v1j1Y/Mp/c8Fb9g
	taz23pWbuzS/BN3+96RxT7HJg6pP18tyfSYxvn195mBHbblCpnuGuO4GkyeTt+88xF9sqHn0
	qP5JdtHAhmcROv0BQseeKocn9k66tPPFg3//9zgrsRRnJBpqMRcVJwIApTLP+zQDAAA=
X-CMS-MailID: 20250518193256epcas5p442e9549fd8fd810522f960df74c22e34
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250518193256epcas5p442e9549fd8fd810522f960df74c22e34
References: <20250518193152.63476-1-shradha.t@samsung.com>
	<CGME20250518193256epcas5p442e9549fd8fd810522f960df74c22e34@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_023006_881108_0B0C2C41 
X-CRM114-Status: GOOD (  17.12  )
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

Add PCIe PHY support for Tesla FSD SoC.

Signed-off-by: Shradha Todi <shradha.t@samsung.com>
---
 drivers/phy/samsung/phy-exynos-pcie.c | 357 +++++++++++++++++++++++++-
 1 file changed, 356 insertions(+), 1 deletion(-)

diff --git a/drivers/phy/samsung/phy-exynos-pcie.c b/drivers/phy/samsung/phy-exynos-pcie.c
index 53c9230c2907..0e4c00c1121e 100644
--- a/drivers/phy/samsung/phy-exynos-pcie.c
+++ b/drivers/phy/samsung/phy-exynos-pcie.c
@@ -34,11 +34,121 @@
 /* PMU PCIE PHY isolation control */
 #define EXYNOS5433_PMU_PCIE_PHY_OFFSET		0x730
 
+/* FSD: PCIe PHY common registers */
+#define FSD_PCIE_PHY_TRSV_CMN_REG03	0x000c
+#define FSD_PCIE_PHY_TRSV_CMN_REG01E	0x0078
+#define FSD_PCIE_PHY_TRSV_CMN_REG02D	0x00b4
+#define FSD_PCIE_PHY_TRSV_CMN_REG031	0x00c4
+#define FSD_PCIE_PHY_TRSV_CMN_REG036	0x00d8
+#define FSD_PCIE_PHY_TRSV_CMN_REG05F	0x017c
+#define FSD_PCIE_PHY_TRSV_CMN_REG060	0x0180
+#define FSD_PCIE_PHY_TRSV_CMN_REG062	0x0188
+#define FSD_PCIE_PHY_TRSV_CMN_REG061	0x0184
+#define FSD_PCIE_PHY_AGG_BIF_RESET	0x0200
+#define FSD_PCIE_PHY_AGG_BIF_CLOCK	0x0208
+#define FSD_PCIE_PHY_CMN_RESET		0x0228
+
+/* FSD: PCIe PHY lane registers */
+#define FSD_PCIE_PHY_LANE_OFFSET	0x400
+#define FSD_PCIE_PHY_TRSV_REG001_LN_N	0x404
+#define FSD_PCIE_PHY_TRSV_REG002_LN_N	0x408
+#define FSD_PCIE_PHY_TRSV_REG005_LN_N	0x414
+#define FSD_PCIE_PHY_TRSV_REG006_LN_N	0x418
+#define FSD_PCIE_PHY_TRSV_REG007_LN_N	0x41c
+#define FSD_PCIE_PHY_TRSV_REG009_LN_N	0x424
+#define FSD_PCIE_PHY_TRSV_REG00A_LN_N	0x428
+#define FSD_PCIE_PHY_TRSV_REG00C_LN_N	0x430
+#define FSD_PCIE_PHY_TRSV_REG012_LN_N	0x448
+#define FSD_PCIE_PHY_TRSV_REG013_LN_N	0x44c
+#define FSD_PCIE_PHY_TRSV_REG014_LN_N	0x450
+#define FSD_PCIE_PHY_TRSV_REG015_LN_N	0x454
+#define FSD_PCIE_PHY_TRSV_REG016_LN_N	0x458
+#define FSD_PCIE_PHY_TRSV_REG018_LN_N	0x460
+#define FSD_PCIE_PHY_TRSV_REG020_LN_N	0x480
+#define FSD_PCIE_PHY_TRSV_REG026_LN_N	0x498
+#define FSD_PCIE_PHY_TRSV_REG029_LN_N	0x4a4
+#define FSD_PCIE_PHY_TRSV_REG031_LN_N	0x4c4
+#define FSD_PCIE_PHY_TRSV_REG036_LN_N	0x4d8
+#define FSD_PCIE_PHY_TRSV_REG039_LN_N	0x4e4
+#define FSD_PCIE_PHY_TRSV_REG03B_LN_N	0x4ec
+#define FSD_PCIE_PHY_TRSV_REG03C_LN_N	0x4f0
+#define FSD_PCIE_PHY_TRSV_REG03E_LN_N	0x4f8
+#define FSD_PCIE_PHY_TRSV_REG03F_LN_N	0x4fc
+#define FSD_PCIE_PHY_TRSV_REG043_LN_N	0x50c
+#define FSD_PCIE_PHY_TRSV_REG044_LN_N	0x510
+#define FSD_PCIE_PHY_TRSV_REG046_LN_N	0x518
+#define FSD_PCIE_PHY_TRSV_REG048_LN_N	0x520
+#define FSD_PCIE_PHY_TRSV_REG049_LN_N	0x524
+#define FSD_PCIE_PHY_TRSV_REG04E_LN_N	0x538
+#define FSD_PCIE_PHY_TRSV_REG052_LN_N	0x548
+#define FSD_PCIE_PHY_TRSV_REG068_LN_N	0x5a0
+#define FSD_PCIE_PHY_TRSV_REG069_LN_N	0x5a4
+#define FSD_PCIE_PHY_TRSV_REG06A_LN_N	0x5a8
+#define FSD_PCIE_PHY_TRSV_REG06B_LN_N	0x5ac
+#define FSD_PCIE_PHY_TRSV_REG07B_LN_N	0x5ec
+#define FSD_PCIE_PHY_TRSV_REG083_LN_N	0x60c
+#define FSD_PCIE_PHY_TRSV_REG084_LN_N	0x610
+#define FSD_PCIE_PHY_TRSV_REG086_LN_N	0x618
+#define FSD_PCIE_PHY_TRSV_REG087_LN_N	0x61c
+#define FSD_PCIE_PHY_TRSV_REG08B_LN_N	0x62c
+#define FSD_PCIE_PHY_TRSV_REG09C_LN_N	0x670
+#define FSD_PCIE_PHY_TRSV_REG09D_LN_N	0x674
+#define FSD_PCIE_PHY_TRSV_REG09E_LN_N	0x678
+#define FSD_PCIE_PHY_TRSV_REG09F_LN_N	0x67c
+#define FSD_PCIE_PHY_TRSV_REG0A2_LN_N	0x688
+#define FSD_PCIE_PHY_TRSV_REG0A4_LN_N	0x690
+#define FSD_PCIE_PHY_TRSV_REG0CE_LN_N	0x738
+#define FSD_PCIE_PHY_TRSV_REG0FC_LN_N	0x7f0
+#define FSD_PCIE_PHY_TRSV_REG0FD_LN_N	0x7f4
+#define FSD_PCIE_PHY_TRSV_REG0FE_LN_N	0x7f8
+#define FSD_PCIE_PHY_TRSV_REG0CE_LN_1	0xb38
+#define FSD_PCIE_PHY_TRSV_REG0CE_LN_2	0xf38
+#define FSD_PCIE_PHY_TRSV_REG0CE_LN_3	0x1338
+
+/* FSD: PCIe PCS registers */
+#define FSD_PCIE_PCS_BRF_0		0x0004
+#define FSD_PCIE_PCS_BRF_1		0x0804
+#define FSD_PCIE_PCS_CLK		0x0180
+
+/* FSD: PCIe SYSREG registers */
+#define FSD_PCIE_SYSREG_PHY_0_CON_MASK			0x3ff
+#define FSD_PCIE_SYSREG_PHY_0_CON			0x042C
+#define FSD_PCIE_SYSREG_PHY_0_REF_SEL_MASK		0x3
+#define FSD_PCIE_SYSREG_PHY_0_REF_SEL			(0x2 << 0)
+#define FSD_PCIE_SYSREG_PHY_0_SSC_EN_MASK		0x8
+#define FSD_PCIE_SYSREG_PHY_0_SSC_EN			BIT(3)
+#define FSD_PCIE_SYSREG_PHY_0_AUX_EN_MASK		0x10
+#define FSD_PCIE_SYSREG_PHY_0_AUX_EN			BIT(4)
+#define FSD_PCIE_SYSREG_PHY_0_CMN_RSTN_MASK		0x100
+#define FSD_PCIE_SYSREG_PHY_0_CMN_RSTN			BIT(8)
+#define FSD_PCIE_SYSREG_PHY_0_INIT_RSTN_MASK		0x200
+#define FSD_PCIE_SYSREG_PHY_0_INIT_RSTN			BIT(9)
+
+#define FSD_PCIE_SYSREG_PHY_1_CON_MASK			0x1ff
+#define FSD_PCIE_SYSREG_PHY_1_CON			0x0500
+#define FSD_PCIE_SYSREG_PHY_1_REF_SEL_MASK		0x30
+#define FSD_PCIE_SYSREG_PHY_1_REF_SEL			(0x2 << 4)
+#define FSD_PCIE_SYSREG_PHY_1_SSC_EN_MASK		0x80
+#define FSD_PCIE_SYSREG_PHY_1_SSC_EN			BIT(7)
+#define FSD_PCIE_SYSREG_PHY_1_AUX_EN_MASK		0x1
+#define FSD_PCIE_SYSREG_PHY_1_AUX_EN			BIT(0)
+#define FSD_PCIE_SYSREG_PHY_1_CMN_RSTN_MASK		0x2
+#define FSD_PCIE_SYSREG_PHY_1_CMN_RSTN			BIT(1)
+#define FSD_PCIE_SYSREG_PHY_1_INIT_RSTN_MASK		0x8
+#define FSD_PCIE_SYSREG_PHY_1_INIT_RSTN			BIT(3)
+
 /* For Exynos pcie phy */
 struct exynos_pcie_phy {
 	void __iomem *base;
+	void __iomem *pcs_base;
 	struct regmap *pmureg;
 	struct regmap *fsysreg;
+	int phy_id;
+	const struct samsung_drv_data *drv_data;
+};
+
+struct samsung_drv_data {
+	const struct phy_ops *phy_ops;
 };
 
 static void exynos_pcie_phy_writel(void __iomem *base, u32 val, u32 offset)
@@ -133,9 +243,244 @@ static const struct phy_ops exynos5433_phy_ops = {
 	.owner		= THIS_MODULE,
 };
 
+struct fsd_pcie_phy_pdata {
+	u32 phy_con_mask;
+	u32 phy_con;
+	u32 phy_ref_sel_mask;
+	u32 phy_ref_sel;
+	u32 phy_ssc_en_mask;
+	u32 phy_ssc_en;
+	u32 phy_aux_en_mask;
+	u32 phy_aux_en;
+	u32 phy_cmn_rstn_mask;
+	u32 phy_cmn_rstn;
+	u32 phy_init_rstn_mask;
+	u32 phy_init_rstn;
+	u32 num_lanes;
+	u32 lane_offset;
+};
+
+struct fsd_pcie_phy_pdata fsd_phy_con[] = {
+	{
+	.phy_con		= FSD_PCIE_SYSREG_PHY_0_CON,
+	.phy_con_mask		= FSD_PCIE_SYSREG_PHY_0_CON_MASK,
+	.phy_ref_sel_mask	= FSD_PCIE_SYSREG_PHY_0_REF_SEL_MASK,
+	.phy_ref_sel		= FSD_PCIE_SYSREG_PHY_0_REF_SEL,
+	.phy_ssc_en_mask	= FSD_PCIE_SYSREG_PHY_0_SSC_EN_MASK,
+	.phy_ssc_en		= FSD_PCIE_SYSREG_PHY_0_SSC_EN,
+	.phy_aux_en_mask	= FSD_PCIE_SYSREG_PHY_0_AUX_EN_MASK,
+	.phy_aux_en		= FSD_PCIE_SYSREG_PHY_0_AUX_EN,
+	.phy_cmn_rstn_mask	= FSD_PCIE_SYSREG_PHY_0_CMN_RSTN_MASK,
+	.phy_cmn_rstn		= FSD_PCIE_SYSREG_PHY_0_CMN_RSTN,
+	.phy_init_rstn_mask	= FSD_PCIE_SYSREG_PHY_0_INIT_RSTN_MASK,
+	.phy_init_rstn		= FSD_PCIE_SYSREG_PHY_0_INIT_RSTN,
+	.num_lanes		= 0x4,
+	.lane_offset		= FSD_PCIE_PHY_LANE_OFFSET,
+	},
+	{
+	.phy_con		= FSD_PCIE_SYSREG_PHY_1_CON,
+	.phy_con_mask		= FSD_PCIE_SYSREG_PHY_1_CON_MASK,
+	.phy_ref_sel_mask	= FSD_PCIE_SYSREG_PHY_1_REF_SEL_MASK,
+	.phy_ref_sel		= FSD_PCIE_SYSREG_PHY_1_REF_SEL,
+	.phy_ssc_en_mask	= FSD_PCIE_SYSREG_PHY_1_SSC_EN_MASK,
+	.phy_ssc_en		= FSD_PCIE_SYSREG_PHY_1_SSC_EN,
+	.phy_aux_en_mask	= FSD_PCIE_SYSREG_PHY_1_AUX_EN_MASK,
+	.phy_aux_en		= FSD_PCIE_SYSREG_PHY_1_AUX_EN,
+	.phy_cmn_rstn_mask	= FSD_PCIE_SYSREG_PHY_1_CMN_RSTN_MASK,
+	.phy_cmn_rstn		= FSD_PCIE_SYSREG_PHY_1_CMN_RSTN,
+	.phy_init_rstn_mask	= FSD_PCIE_SYSREG_PHY_1_INIT_RSTN_MASK,
+	.phy_init_rstn		= FSD_PCIE_SYSREG_PHY_1_INIT_RSTN,
+	.num_lanes		= 0x4,
+	.lane_offset		= FSD_PCIE_PHY_LANE_OFFSET,
+	},
+	{ },
+};
+
+struct fsd_pcie_phy_setting {
+	u32 addr;
+	u32 val;
+	bool is_cmn_reg;
+};
+
+struct fsd_pcie_phy_setting fsd_pcie_phy0_setting[] = {
+	{FSD_PCIE_PHY_TRSV_REG07B_LN_N, 0x20, false},
+	{FSD_PCIE_PHY_TRSV_REG052_LN_N, 0x00, false},
+	{FSD_PCIE_PHY_TRSV_CMN_REG05F, 0x11, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG060, 0x23, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG062, 0x0, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG03, 0x15, true},
+	{FSD_PCIE_PHY_TRSV_REG0CE_LN_N, 0x8, false},
+	{FSD_PCIE_PHY_TRSV_REG039_LN_N, 0xf, false},
+	{FSD_PCIE_PHY_TRSV_REG03B_LN_N, 0x13, false},
+	{FSD_PCIE_PHY_TRSV_REG03C_LN_N, 0xf6, false},
+	{FSD_PCIE_PHY_TRSV_REG044_LN_N, 0x57, false},
+	{FSD_PCIE_PHY_TRSV_REG03E_LN_N, 0x10, false},
+	{FSD_PCIE_PHY_TRSV_REG03F_LN_N, 0x04, false},
+	{FSD_PCIE_PHY_TRSV_REG043_LN_N, 0x11, false},
+	{FSD_PCIE_PHY_TRSV_REG049_LN_N, 0x6f, false},
+	{FSD_PCIE_PHY_TRSV_REG04E_LN_N, 0x18, false},
+	{FSD_PCIE_PHY_TRSV_REG068_LN_N, 0x1f, false},
+	{FSD_PCIE_PHY_TRSV_REG069_LN_N, 0xc, false},
+	{FSD_PCIE_PHY_TRSV_REG06B_LN_N, 0x78, false},
+	{FSD_PCIE_PHY_TRSV_REG083_LN_N, 0xa, false},
+	{FSD_PCIE_PHY_TRSV_REG084_LN_N, 0x80, false},
+	{FSD_PCIE_PHY_TRSV_REG086_LN_N, 0xff, false},
+	{FSD_PCIE_PHY_TRSV_REG087_LN_N, 0x3c, false},
+	{FSD_PCIE_PHY_TRSV_REG09D_LN_N, 0x7c, false},
+	{FSD_PCIE_PHY_TRSV_REG09E_LN_N, 0x33, false},
+	{FSD_PCIE_PHY_TRSV_REG09F_LN_N, 0x33, false},
+	{FSD_PCIE_PHY_TRSV_REG001_LN_N, 0x3f, false},
+	{FSD_PCIE_PHY_TRSV_REG002_LN_N, 0x1c, false},
+	{FSD_PCIE_PHY_TRSV_REG005_LN_N, 0x2b, false},
+	{FSD_PCIE_PHY_TRSV_REG006_LN_N, 0x3, false},
+	{FSD_PCIE_PHY_TRSV_REG007_LN_N, 0x0c, false},
+	{FSD_PCIE_PHY_TRSV_REG009_LN_N, 0x10, false},
+	{FSD_PCIE_PHY_TRSV_REG00A_LN_N, 0x1, false},
+	{FSD_PCIE_PHY_TRSV_REG00C_LN_N, 0x93, false},
+	{FSD_PCIE_PHY_TRSV_REG012_LN_N, 0x1, false},
+	{FSD_PCIE_PHY_TRSV_REG013_LN_N, 0x0, false},
+	{FSD_PCIE_PHY_TRSV_REG014_LN_N, 0x70, false},
+	{FSD_PCIE_PHY_TRSV_REG015_LN_N, 0x0, false},
+	{FSD_PCIE_PHY_TRSV_REG016_LN_N, 0x70, false},
+	{FSD_PCIE_PHY_TRSV_REG0FC_LN_N, 0x80, false},
+	{FSD_PCIE_PHY_TRSV_REG0FD_LN_N, 0x0, false},
+};
+
+struct fsd_pcie_phy_setting fsd_pcie_phy1_setting[] = {
+	{FSD_PCIE_PHY_TRSV_REG07B_LN_N, 0x20, false},
+	{FSD_PCIE_PHY_TRSV_REG052_LN_N, 0x00, false},
+	{FSD_PCIE_PHY_TRSV_CMN_REG01E, 0xaa, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG02D, 0x28, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG031, 0x28, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG036, 0x21, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG05F, 0x12, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG060, 0x23, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG061, 0x0, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG062, 0x0, true},
+	{FSD_PCIE_PHY_TRSV_CMN_REG03, 0x15, true},
+	{FSD_PCIE_PHY_TRSV_REG039_LN_N, 0xf, false},
+	{FSD_PCIE_PHY_TRSV_REG03B_LN_N, 0x13, false},
+	{FSD_PCIE_PHY_TRSV_REG03C_LN_N, 0x66, false},
+	{FSD_PCIE_PHY_TRSV_REG044_LN_N, 0x57, false},
+	{FSD_PCIE_PHY_TRSV_REG03E_LN_N, 0x10, false},
+	{FSD_PCIE_PHY_TRSV_REG03F_LN_N, 0x44, false},
+	{FSD_PCIE_PHY_TRSV_REG043_LN_N, 0x11, false},
+	{FSD_PCIE_PHY_TRSV_REG046_LN_N, 0xef, false},
+	{FSD_PCIE_PHY_TRSV_REG048_LN_N, 0x06, false},
+	{FSD_PCIE_PHY_TRSV_REG049_LN_N, 0xaf, false},
+	{FSD_PCIE_PHY_TRSV_REG04E_LN_N, 0x28, false},
+	{FSD_PCIE_PHY_TRSV_REG068_LN_N, 0x1f, false},
+	{FSD_PCIE_PHY_TRSV_REG069_LN_N, 0xc, false},
+	{FSD_PCIE_PHY_TRSV_REG06A_LN_N, 0x8, false},
+	{FSD_PCIE_PHY_TRSV_REG06B_LN_N, 0x78, false},
+	{FSD_PCIE_PHY_TRSV_REG083_LN_N, 0xa, false},
+	{FSD_PCIE_PHY_TRSV_REG084_LN_N, 0x80, false},
+	{FSD_PCIE_PHY_TRSV_REG087_LN_N, 0x30, false},
+	{FSD_PCIE_PHY_TRSV_REG08B_LN_N, 0xa0, false},
+	{FSD_PCIE_PHY_TRSV_REG09C_LN_N, 0xf7, false},
+	{FSD_PCIE_PHY_TRSV_REG09E_LN_N, 0x33, false},
+	{FSD_PCIE_PHY_TRSV_REG0A2_LN_N, 0xfa, false},
+	{FSD_PCIE_PHY_TRSV_REG0A4_LN_N, 0xf2, false},
+	{FSD_PCIE_PHY_TRSV_REG0CE_LN_N, 0x08, true},
+	{FSD_PCIE_PHY_TRSV_REG0CE_LN_1, 0x09, true},
+	{FSD_PCIE_PHY_TRSV_REG0CE_LN_2, 0x09, true},
+	{FSD_PCIE_PHY_TRSV_REG0CE_LN_3, 0x09, true},
+	{FSD_PCIE_PHY_TRSV_REG0FE_LN_N, 0x33, false},
+	{FSD_PCIE_PHY_TRSV_REG001_LN_N, 0x3f, false},
+	{FSD_PCIE_PHY_TRSV_REG005_LN_N, 0x2b, false},
+};
+
+static void fsd_pcie_phy_writel(struct exynos_pcie_phy *phy_ctrl,
+							u32 val, u32 offset)
+{
+	struct fsd_pcie_phy_pdata *pdata = &fsd_phy_con[phy_ctrl->phy_id];
+	void __iomem *phy_base = phy_ctrl->base;
+	u32 i;
+
+	for (i = 0; i < pdata->num_lanes; i++)
+		writel(val, phy_base + (offset + i * pdata->lane_offset));
+}
+
+static int fsd_pcie_phy_reset(struct phy *phy)
+{
+	struct exynos_pcie_phy *phy_ctrl = phy_get_drvdata(phy);
+	struct fsd_pcie_phy_pdata *pdata = &fsd_phy_con[phy_ctrl->phy_id];
+
+	writel(0x1, phy_ctrl->pcs_base + FSD_PCIE_PCS_CLK);
+
+	regmap_update_bits(phy_ctrl->fsysreg, pdata->phy_con, pdata->phy_con_mask,
+			   0x0);
+	regmap_update_bits(phy_ctrl->fsysreg, pdata->phy_con, pdata->phy_aux_en_mask,
+			   pdata->phy_aux_en);
+	regmap_update_bits(phy_ctrl->fsysreg, pdata->phy_con, pdata->phy_ref_sel_mask,
+			   pdata->phy_ref_sel);
+
+	/* perform init reset release */
+	regmap_update_bits(phy_ctrl->fsysreg, pdata->phy_con,
+			pdata->phy_init_rstn_mask, pdata->phy_init_rstn);
+	return 0;
+}
+
+static int fsd_pcie_phy_init(struct phy *phy)
+{
+	struct fsd_pcie_phy_setting *phy_param = fsd_pcie_phy0_setting;
+	struct exynos_pcie_phy *phy_ctrl = phy_get_drvdata(phy);
+	struct fsd_pcie_phy_pdata *pdata = &fsd_phy_con[phy_ctrl->phy_id];
+	int len = ARRAY_SIZE(fsd_pcie_phy0_setting);
+	void __iomem *phy_base = phy_ctrl->base;
+	int i;
+
+	fsd_pcie_phy_reset(phy);
+
+	if (phy_ctrl->phy_id == 1) {
+		writel(0x2, phy_base + FSD_PCIE_PHY_CMN_RESET);
+		phy_param = fsd_pcie_phy1_setting;
+		len = ARRAY_SIZE(fsd_pcie_phy1_setting);
+	}
+
+	writel(0x00, phy_ctrl->pcs_base + FSD_PCIE_PCS_BRF_0);
+	writel(0x00, phy_ctrl->pcs_base + FSD_PCIE_PCS_BRF_1);
+	writel(0x00, phy_base + FSD_PCIE_PHY_AGG_BIF_RESET);
+	writel(0x00, phy_base + FSD_PCIE_PHY_AGG_BIF_CLOCK);
+
+	for (i = 0; i < len; i++) {
+		if (phy_param[i].is_cmn_reg)
+			writel(phy_param[i].val, phy_base + phy_param[i].addr);
+		else
+			fsd_pcie_phy_writel(phy_ctrl, phy_param[i].val, phy_param[i].addr);
+	}
+
+	if (phy_ctrl->phy_id == 1)
+		writel(0x3, phy_base + FSD_PCIE_PHY_CMN_RESET);
+
+	regmap_update_bits(phy_ctrl->fsysreg, pdata->phy_con,
+			pdata->phy_cmn_rstn_mask, pdata->phy_cmn_rstn);
+
+	return 0;
+}
+
+static const struct phy_ops fsd_phy_ops = {
+	.init		= fsd_pcie_phy_init,
+	.reset		= fsd_pcie_phy_reset,
+	.owner		= THIS_MODULE,
+};
+
+static const struct samsung_drv_data exynos5433_drv_data = {
+	.phy_ops		= &exynos5433_phy_ops,
+};
+
+static const struct samsung_drv_data fsd_drv_data = {
+	.phy_ops		= &fsd_phy_ops,
+};
+
 static const struct of_device_id exynos_pcie_phy_match[] = {
 	{
 		.compatible = "samsung,exynos5433-pcie-phy",
+		.data = &exynos5433_drv_data,
+	},
+	{
+		.compatible = "tesla,fsd-pcie-phy",
+		.data = &fsd_drv_data,
 	},
 	{},
 };
@@ -146,11 +491,18 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 	struct exynos_pcie_phy *exynos_phy;
 	struct phy *generic_phy;
 	struct phy_provider *phy_provider;
+	const struct samsung_drv_data *drv_data;
+
+	drv_data = of_device_get_match_data(dev);
+	if (!drv_data)
+		return -ENODEV;
 
 	exynos_phy = devm_kzalloc(dev, sizeof(*exynos_phy), GFP_KERNEL);
 	if (!exynos_phy)
 		return -ENOMEM;
 
+	exynos_phy->drv_data = drv_data;
+
 	exynos_phy->base = devm_platform_ioremap_resource(pdev, 0);
 	if (IS_ERR(exynos_phy->base))
 		return PTR_ERR(exynos_phy->base);
@@ -169,12 +521,15 @@ static int exynos_pcie_phy_probe(struct platform_device *pdev)
 		return PTR_ERR(exynos_phy->fsysreg);
 	}
 
-	generic_phy = devm_phy_create(dev, dev->of_node, &exynos5433_phy_ops);
+	generic_phy = devm_phy_create(dev, dev->of_node, drv_data->phy_ops);
 	if (IS_ERR(generic_phy)) {
 		dev_err(dev, "failed to create PHY\n");
 		return PTR_ERR(generic_phy);
 	}
 
+	exynos_phy->pcs_base = devm_platform_ioremap_resource(pdev, 1);
+	exynos_phy->phy_id = of_alias_get_id(dev->of_node, "pciephy");
+
 	phy_set_drvdata(generic_phy, exynos_phy);
 	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
 
-- 
2.49.0


