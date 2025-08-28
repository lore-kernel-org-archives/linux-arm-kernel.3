Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7398BCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 09:58:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MSqqONYPyXdoryTMVOMCVfHY1zxA8lghBgSEEzRog/c=; b=ULS5lTzogr4FDSmIzMHg2f2NL7
	nF7S6gyIJ0w0MUhS0GdHrBx7sURSk27MK7iSm6npDb80qPpJwluvVkIR5mqAOFDfAQp+XDgXq9jxy
	pI0pdmL8y2OI/B8v+amNO5zfMz7+873cHfZ7x5ryDrO9d9OH3KezQ760GGgnJEqDoaKnqL6LeXKFc
	XCD4CZI9DQhTkw9LRIJ2zqi3c1vtn4Lxk516ry7sTCsyZA+ojQixUPj+hPtFo8TSHdOzaHy5Kn8H1
	zGWQFePv+fIT8kq2gBPfOmWRVzLjgl3NGhIveyCfqr5qf+EpvEnZmqKafmcqkPKXbmgPZrCaZ4tes
	jETW70Ng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZOg-000000013PX-3ZVG;
	Thu, 28 Aug 2025 09:58:22 +0000
Received: from mailout2.samsung.com ([203.254.224.25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYTr-00000000tBa-46xh
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:59:41 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
	by mailout2.samsung.com (KnoxPortal) with ESMTP id 20250828085936epoutp02df7da004a1f2a9cfa0be0fcd6c1b1868~f4qSx1ojo0653506535epoutp02E
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:59:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com 20250828085936epoutp02df7da004a1f2a9cfa0be0fcd6c1b1868~f4qSx1ojo0653506535epoutp02E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371576;
	bh=MSqqONYPyXdoryTMVOMCVfHY1zxA8lghBgSEEzRog/c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uoaOF7MrhY/QsdwjnI8oKgULbfWvDBuLIBDxw9vHOSC6cjeSfGBtp10eOESwbBoJi
	 ktOiwlmpgPWThe6INnc1Z6bD3AilRO4qNkD1WFcgOLVxCE+PC49XqIsrBfE2IHpvkA
	 KeUQAm9PAmSG0fCIe20PyDqys0PMluXa+03YzWf4=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
	20250828085936epcas5p151a52aa51b0d013bd996852b7e378ad0~f4qSJY1De0547105471epcas5p15;
	Thu, 28 Aug 2025 08:59:36 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.87]) by
	epsnrtp01.localdomain (Postfix) with ESMTP id 4cCFhR0CQ1z6B9m5; Thu, 28 Aug
	2025 08:59:35 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
	20250828085934epcas5p12a94dfc60a4ea9d5bb46fa7cd10874b7~f4qQtroHi0548005480epcas5p1d;
	Thu, 28 Aug 2025 08:59:34 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085931epsmtip25782e6ea336bdd3b95b00f614582f79e~f4qOE-OgQ0309203092epsmtip2j;
	Thu, 28 Aug 2025 08:59:31 +0000 (GMT)
From: Inbaraj E <inbaraj.e@samsung.com>
To: rmfrfs@gmail.com, laurent.pinchart@ideasonboard.com, martink@posteo.de,
	kernel@puri.sm, mchehab@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: kernel@pengutronix.de, festevam@gmail.com, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
	ravi.patel@samsung.com, shradha.t@samsung.com, Inbaraj E
	<inbaraj.e@samsung.com>
Subject: [PATCH v3 3/7] media: imx-mipi-csis: Move clk to mipi_csis_info
 structure
Date: Thu, 28 Aug 2025 14:29:07 +0530
Message-ID: <20250828085911.81266-4-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085934epcas5p12a94dfc60a4ea9d5bb46fa7cd10874b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085934epcas5p12a94dfc60a4ea9d5bb46fa7cd10874b7
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085934epcas5p12a94dfc60a4ea9d5bb46fa7cd10874b7@epcas5p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_015940_330260_32D7F815 
X-CRM114-Status: GOOD (  14.81  )
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

The Clock names and number of Clocks in v3.3 and v3.6.3 differ v4.3. To
extend the driver for Tesla FSD SoC support, move the Clock names and
number of Clocks into the mipi_csis_info structure.

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index b1136336a57f..cec035059445 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -304,6 +304,8 @@ static const struct mipi_csis_event mipi_csis_events[] = {
 #define MIPI_CSIS_NUM_EVENTS		ARRAY_SIZE(mipi_csis_events)
 #define MIPI_CSIS_NUM_ERROR_EVENTS	(MIPI_CSIS_NUM_EVENTS - 20)
 
+#define MIPI_CSIS_MAX_CLOCKS	4
+
 enum mipi_csis_clk {
 	MIPI_CSIS_CLK_PCLK,
 	MIPI_CSIS_CLK_WRAP,
@@ -311,13 +313,6 @@ enum mipi_csis_clk {
 	MIPI_CSIS_CLK_AXI,
 };
 
-static const char * const mipi_csis_clk_id[] = {
-	"pclk",
-	"wrap",
-	"phy",
-	"axi",
-};
-
 enum mipi_csis_version {
 	MIPI_CSIS_V3_3,
 	MIPI_CSIS_V3_6_3,
@@ -326,6 +321,7 @@ enum mipi_csis_version {
 struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
+	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
 };
 
 struct mipi_csis_device {
@@ -735,7 +731,7 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 		return -ENOMEM;
 
 	for (i = 0; i < csis->info->num_clocks; i++)
-		csis->clks[i].id = mipi_csis_clk_id[i];
+		csis->clks[i].id = csis->info->clk_names[i];
 
 	ret = devm_clk_bulk_get(csis->dev, csis->info->num_clocks,
 				csis->clks);
@@ -1609,12 +1605,14 @@ static const struct of_device_id mipi_csis_of_match[] = {
 		.data = &(const struct mipi_csis_info){
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
+			.clk_names = {"pclk", "wrap", "phy"},
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
 		.data = &(const struct mipi_csis_info){
 			.version = MIPI_CSIS_V3_6_3,
 			.num_clocks = 4,
+			.clk_names = {"pclk", "wrap", "phy", "axi"},
 		},
 	},
 	{ /* sentinel */ },
-- 
2.49.0


