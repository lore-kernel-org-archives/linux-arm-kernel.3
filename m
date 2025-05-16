Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C39DC3ABDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 16:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m+GTmyVkYGq9Nxr5NyrU8UoWIkaYzR0afQVWl8NtESc=; b=TJRxz+Qa96tPxlQMyoGO6VgSf9
	p5yvxR2fQ/Aft6wr3J3KBTvs72sbxgQs5s+2z4o78AmAAtiP5VRtLWqwqU8DK9a7ETMlNuvPUeBqR
	9uF6Od2TIosarjT6fD1wDW3p7y/XoahD0bgP+nQaEh/hzJ+PWDzqJb+ojSltG8+P3DAiGUXdACNVs
	HJtiNmvr+VbLleGQhVDLXfz8sGQjsNmwRSGlaKEvZ7JO0/8OthYl7dgUfZMI5ahh/VhOWKlSFsLd1
	PEPpn+6wvZclrPwEN11ZT8KfV25hsyaLGdRdjKydj9Y279XtVV3jrKN5C9TFhcE1FIYHhyUPFQpOA
	Vd0luMXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH3GM-00000009nH4-0OCU;
	Mon, 19 May 2025 16:22:50 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH2EU-00000009aBY-2Dz8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 15:16:52 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250519151648epoutp02298c2fb04f03152acee52d8f675dd3ef~A9pzXKb8z1647416474epoutp024
	for <linux-arm-kernel@lists.infradead.org>; Mon, 19 May 2025 15:16:48 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250519151648epoutp02298c2fb04f03152acee52d8f675dd3ef~A9pzXKb8z1647416474epoutp024
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1747667808;
	bh=m+GTmyVkYGq9Nxr5NyrU8UoWIkaYzR0afQVWl8NtESc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SRz1+jobZ10W2q4IRIn2pt+U3U8ZCErVbX6BLuAY+WuBapH3dp6rV4yh5ACnbN8xq
	 NIj49QWMkm6EmLyr4tZqBHqcC/8kLa2Q7XZnucVB4OeNYLfDUa7uy0CaCHEuqZN+Fd
	 6tTCwowT6Cb29uyQD22O2Vw2XrMgej+TwWIUrmMg=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250519151648epcas5p263c1ab9b30a8e5f9e41b9a017d6f395c~A9pymv0u52189221892epcas5p2w;
	Mon, 19 May 2025 15:16:48 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.175]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4b1LrG2CLyz6B9m5; Mon, 19 May
	2025 15:16:46 +0000 (GMT)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb~-_pGmyIKJ2806928069epcas5p20;
	Fri, 16 May 2025 10:18:03 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
	epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20250516101803epsmtrp1c13d36dfe36a84efdd81f24e3bae2c7a~-_pGkqkwL0890008900epsmtrp12;
	Fri, 16 May 2025 10:18:03 +0000 (GMT)
X-AuditID: b6c32a29-566fe7000000223e-67-682710db95d0
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
	epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
	0A.2F.08766.BD017286; Fri, 16 May 2025 19:18:03 +0900 (KST)
Received: from bose.samsungds.net (unknown [107.108.83.9]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250516101800epsmtip26c728f7627cedb6679a6c418f538f7e6~-_pDs_t_O2811128111epsmtip2R;
	Fri, 16 May 2025 10:18:00 +0000 (GMT)
From: Pritam Manohar Sutar <pritam.sutar@samsung.com>
To: vkoul@kernel.org, kishon@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, alim.akhtar@samsung.com,
	andre.draszik@linaro.org, peter.griffin@linaro.org, kauschluss@disroot.org,
	m.szyprowski@samsung.com, s.nawrocki@samsung.com
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, rosa.pila@samsung.com,
	dev.tailor@samsung.com, faraz.ata@samsung.com, muhammed.ali@samsung.com,
	selvarasu.g@samsung.com, pritam.sutar@samsung.com
Subject: [PATCH v2 2/2] phy: exyons5-usbdrd: support HS phy for
 ExynosAutov920
Date: Fri, 16 May 2025 15:56:50 +0530
Message-Id: <20250516102650.2144487-3-pritam.sutar@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250516102650.2144487-1-pritam.sutar@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprOIsWRmVeSWpSXmKPExsWy7bCSvO5tAfUMg8az+hYP5m1js9jyajOL
	xZq955gs7u1Yxm4x/8g5VotrNxayW/z5d57N4mjrf2aLl7PusVlsenyN1eLyrjlsFhNWfWOx
	mHF+H5PF2iN32S3Ov+hitdgw4x+LxbN7K9gs/u/ZwW7x5ecDZovDb9pZLY4s/8hksfPOCWYH
	MY+T6zYzeWxa1cnmcefaHjaPzUvqPfq2rGL0+LxJLoAtissmJTUnsyy1SN8ugSvjxJ61bAXP
	FCtaVrazNzBukuli5OSQEDCR+H5/P1sXIxeHkMBuRonlB3ayQCRkJB5N28gKYQtLrPz3nB2i
	6C2jxOYJ/4ASHBxsAqYSE/ckgMRFBHqYJJ5e/QE2iVngNJPEho8z2EG6hQX8JBq/TgebxCKg
	KnH06TtmEJtXwF6ief8vdogN8hL7D54Fi3MKOEhsXNPEBGILAdXs6vzEDlEvKHFy5hOw65iB
	6pu3zmaewCgwC0lqFpLUAkamVYySqQXFuem5xYYFhnmp5XrFibnFpXnpesn5uZsYwXGnpbmD
	cfuqD3qHGJk4GA8xSnAwK4nwXs9SzhDiTUmsrEotyo8vKs1JLT7EKM3BoiTOK/6iN0VIID2x
	JDU7NbUgtQgmy8TBKdXAFOv8SoBfKYSrt/fvrAPcrU4lT89sL3r4IuTfMU7PxEf3+P1nJsw8
	78Hy8ppa1MbdX9c2ZtjNW/dvVbd+aqyO9u8Ks7X2sWfk301X6r//2vapqu0t5k3n+5/92uBY
	0bK9IbXu1/JM6y/l0/uWRX3ZkpHnyvL4wI/kN77cU1nab+1PzLl2du0OxnK7iavnd2lnv5nb
	6Lzr9718vW/RvsElJpM59S/vjjrXpL4kSS4lYdLWLoF5UZvuXzm96dnfbbN2m70KZNZ/FFOe
	fSLN9sTDV619pz4r2O/boeO8uCXFoPRo3c6DEknTP7tJibwulrtg3do6r6S9vljj/L3S4msP
	z5qc2XW3e+biiZeK/aQ2/FFiKc5INNRiLipOBADyh79vKgMAAA==
X-CMS-MailID: 20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb
References: <20250516102650.2144487-1-pritam.sutar@samsung.com>
	<CGME20250516101803epcas5p2d9403d89d840dcad88a03d437a48aceb@epcas5p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_081650_904921_73A0E686 
X-CRM114-Status: GOOD (  19.04  )
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

This SoC has a single USB 3.1 DRD combo phy and three USB2.0
DRD HS phy controllers those only support the UTMI+ interface.

Support only UTMI+ for this SoC which is very similar to what
the existing Exynos850 supports.

The combo phy supports both UTMI+ (HS) and PIPE3 (SS) and is
out of scope of this commit.

Add required change in phy driver to support HS phy for this SoC.

Signed-off-by: Pritam Manohar Sutar <pritam.sutar@samsung.com>
---
 drivers/phy/samsung/phy-exynos5-usbdrd.c | 85 ++++++++++++++++++++++++
 1 file changed, 85 insertions(+)

diff --git a/drivers/phy/samsung/phy-exynos5-usbdrd.c b/drivers/phy/samsung/phy-exynos5-usbdrd.c
index 634c4310c660..b440b56c6595 100644
--- a/drivers/phy/samsung/phy-exynos5-usbdrd.c
+++ b/drivers/phy/samsung/phy-exynos5-usbdrd.c
@@ -177,6 +177,9 @@
 #define HSPHYPLLTUNE_PLL_P_TUNE			GENMASK(3, 0)
 
 /* Exynos850: USB DRD PHY registers */
+#define EXYNOSAUTOv920_DRD_CTRL_VER		0x00
+#define CTRL_VER_MAJOR_VERSION			GENMASK(31, 24)
+
 #define EXYNOS850_DRD_LINKCTRL			0x04
 #define LINKCTRL_FORCE_RXELECIDLE		BIT(18)
 #define LINKCTRL_FORCE_PHYSTATUS		BIT(17)
@@ -1772,6 +1775,10 @@ static const char * const exynos5_regulator_names[] = {
 	"vbus", "vbus-boost",
 };
 
+static const char * const exynosautov920_clk_names[] = {
+	"ext_xtal",
+};
+
 static const struct exynos5_usbdrd_phy_drvdata exynos5420_usbdrd_phy = {
 	.phy_cfg		= phy_cfg_exynos5,
 	.phy_ops		= &exynos5_usbdrd_phy_ops,
@@ -1847,6 +1854,81 @@ static const struct exynos5_usbdrd_phy_drvdata exynos850_usbdrd_phy = {
 	.n_regulators		= ARRAY_SIZE(exynos5_regulator_names),
 };
 
+static void exynosautov920_usbdrd_utmi_init(struct exynos5_usbdrd_phy *phy_drd)
+{
+	u32 version;
+
+	version = readl(phy_drd->reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
+	dev_info(phy_drd->dev, "usbphy: version:0x%x\n", version);
+
+	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
+		/* utmi init for exynosautov920 HS phy */
+		exynos850_usbdrd_utmi_init(phy_drd);
+}
+
+static int exynosautov920_usbdrd_phy_init(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	int ret = 0;
+
+	ret = clk_bulk_prepare_enable(phy_drd->drv_data->n_clks, phy_drd->clks);
+	if (ret)
+		return ret;
+
+	/* UTMI or PIPE3 specific init */
+	inst->phy_cfg->phy_init(phy_drd);
+
+	clk_bulk_disable_unprepare(phy_drd->drv_data->n_clks, phy_drd->clks);
+
+	return 0;
+}
+
+static void exynosautov920_v3p1_phy_dis(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+	struct exynos5_usbdrd_phy *phy_drd = to_usbdrd_phy(inst);
+	void __iomem *reg_phy = phy_drd->reg_phy;
+	u32 version;
+
+	version = readl(reg_phy + EXYNOSAUTOv920_DRD_CTRL_VER);
+
+	if (FIELD_GET(CTRL_VER_MAJOR_VERSION, version) == 0x3)
+		exynos850_usbdrd_phy_exit(phy);
+}
+
+static int exynosautov920_usbdrd_phy_exit(struct phy *phy)
+{
+	struct phy_usb_instance *inst = phy_get_drvdata(phy);
+
+	if (inst->phy_cfg->id == EXYNOS5_DRDPHY_UTMI)
+		exynosautov920_v3p1_phy_dis(phy);
+
+	return 0;
+}
+
+static const struct phy_ops exynosautov920_usbdrd_phy_ops = {
+	.init		= exynosautov920_usbdrd_phy_init,
+	.exit		= exynosautov920_usbdrd_phy_exit,
+	.owner		= THIS_MODULE,
+};
+
+static const struct exynos5_usbdrd_phy_config phy_cfg_exynosautov920[] = {
+	{
+		.id		= EXYNOS5_DRDPHY_UTMI,
+		.phy_init	= exynosautov920_usbdrd_utmi_init,
+	},
+};
+
+static const struct exynos5_usbdrd_phy_drvdata exynosautov920_usb31drd_phy = {
+	.phy_cfg		= phy_cfg_exynosautov920,
+	.phy_ops		= &exynosautov920_usbdrd_phy_ops,
+	.clk_names		= exynosautov920_clk_names,
+	.n_clks			= ARRAY_SIZE(exynosautov920_clk_names),
+	.core_clk_names		= exynos5_core_clk_names,
+	.n_core_clks		= ARRAY_SIZE(exynos5_core_clk_names),
+};
+
 static const struct exynos5_usbdrd_phy_config phy_cfg_gs101[] = {
 	{
 		.id		= EXYNOS5_DRDPHY_UTMI,
@@ -2047,6 +2129,9 @@ static const struct of_device_id exynos5_usbdrd_phy_of_match[] = {
 	}, {
 		.compatible = "samsung,exynos850-usbdrd-phy",
 		.data = &exynos850_usbdrd_phy
+	}, {
+		.compatible = "samsung,exynosautov920-usb31drd-phy",
+		.data = &exynosautov920_usb31drd_phy
 	},
 	{ },
 };
-- 
2.34.1


