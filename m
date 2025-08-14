Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B220ECA0ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 04:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8RAz1VxJoNOGjuBNlJXeuNS5QuaDyUEil3uYRNLyxQ=; b=47vSstuYcGyouFyaymakrBmpKV
	dYiZQnM2o+N1BwU0ecKgQMFxYMV5Y18clQoLSDggv6hswzNb3XC7tuE6yiaP7WE3GONn5nqAlByaI
	PE0QitP9TVc6bITF+bHaonSu9TPZMQ4RxuKZm/JmCrG7Oba6khC0mKbCwVvXFh6oHKIQ2iV3v1DFX
	5pxXb9iKswgXnnN1flvdx7b7RdVDndpo8GgpXQ979icQHC+Df2HDMNR9xU+Qa5tqx/D3vQ/avZq58
	7LqVL1EfP7Pp1ZqSvwdo8YAHjXUXxbj+80fZdpSHNB6217aqqBCGz9R5cspdTvnMAJnaSnsnlTUA+
	ZwigEjfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unruN-00000006VTi-0k3a;
	Mon, 18 Aug 2025 04:55:47 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unrdD-00000006Tdu-3V0x
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 04:38:05 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250818043758epoutp02d8ed8f8fe6fe03f946626ca614a9910c~cwpAGSUXn1528515285epoutp02J
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 Aug 2025 04:37:58 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250818043758epoutp02d8ed8f8fe6fe03f946626ca614a9910c~cwpAGSUXn1528515285epoutp02J
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755491878;
	bh=c8RAz1VxJoNOGjuBNlJXeuNS5QuaDyUEil3uYRNLyxQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LdBce9V2LVQPseLkN+Az4E0r7eFtanC38ht1GaLi+VBvkOPWLRedgx3wKMLRcSYMl
	 N7mSK0R/YWzeoGG3Y/gAE0a7DI8hX1bVQ8RSzbDFZ4l4Ry5qSP749LvKKzhDtmCv5V
	 POwiud+8wfneHGwuRuf/7bFtbPyuULa5cFrqhHX0=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250818043757epcas5p23c15cf258ef5fc3dbf98760cf273b689~cwo-h4yvB0138801388epcas5p2K;
	Mon, 18 Aug 2025 04:37:57 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.88]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4c50M86WLRz6B9mD; Mon, 18 Aug
	2025 04:37:56 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p4.samsung.com (KnoxPortal) with ESMTPA id
	20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c~bp3wECC8s1288712887epcas5p4Z;
	Thu, 14 Aug 2025 14:10:30 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814141026epsmtip2c41e27576eca50949b643b58df963c58~bp3sPL3m81817818178epsmtip2n;
	Thu, 14 Aug 2025 14:10:26 +0000 (GMT)
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
Subject: [PATCH v2 06/12] media: imx-mipi-csis: Move irq flag and handler to
 mipi_csis_info structure
Date: Thu, 14 Aug 2025 19:39:37 +0530
Message-ID: <20250814140943.22531-7-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250814140943.22531-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c
References: <20250814140943.22531-1-inbaraj.e@samsung.com>
	<CGME20250814141030epcas5p45a75274697463bbca9cab12f776a4e8c@epcas5p4.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_213804_186092_F5E4B935 
X-CRM114-Status: GOOD (  16.12  )
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

FSD CSI IP has only one IRQ line, shared between imx-mipi-csis and
fsd-csi-media drivers. To extend this driver for FSD SoC support,
move the IRQ flag and IRQ handler to the device data(structure
mipi_csis_info).

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 4afa75734f05..a3e2c8ae332f 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -285,6 +285,8 @@ struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
 	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
+	unsigned int irq_flag;
+	irq_handler_t irq_handler;
 };
 
 struct mipi_csis_device {
@@ -1462,7 +1464,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	mipi_csis_phy_reset(csis);
 
 	/* Now that the hardware is initialized, request the interrupt. */
-	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
+	ret = devm_request_irq(dev, irq, csis->info->irq_handler, csis->info->irq_flag,
 			       dev_name(dev), csis);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
@@ -1536,6 +1538,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
 			.clk_names = {"pclk", "wrap", "phy"},
+			.irq_flag = 0,
+			.irq_handler = mipi_csis_irq_handler,
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
@@ -1543,6 +1547,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.version = MIPI_CSIS_V3_6_3,
 			.num_clocks = 4,
 			.clk_names = {"pclk", "wrap", "phy", "axi"},
+			.irq_flag = 0,
+			.irq_handler = mipi_csis_irq_handler,
 		},
 	},
 	{ /* sentinel */ },
-- 
2.49.0


