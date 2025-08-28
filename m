Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC8BDC8303F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Aug 2025 10:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aP3JZ6i35oNdplmxk8s2s2TwgOzarCJEvRhAfBW6bEA=; b=ZcWCZHqd3G9jUcpTC9IZ12rdx/
	4SDQXVrh1OcZ/u75UaAG3qF4ejaQ13/f93KG2YZl77dmeaI079IpIwh0BlsubH9KJ3f1yHc/bnn8u
	z7tfD7els3ZpN6IWfZyqsRp3tGYEn9wt9ybNJFg5B265VteL6XJlKCZ/9DTH7S+G6jn18Ta4xHxcw
	v+R+H+naz7K12+BVSpniXRHgADKEeH70KB+tkQfNaLVrBnV6chFc3br+Gg/qxe1JHO4iqxjFAzzZX
	5s2lapZ+v313HBAi7NMZgJSnGjDl27m1uzZSDhUC24JUUQe8R+3vMWf21EeeWyB+b6DRAjunOdbcG
	Hz25zg/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urZRO-000000014J4-36QT;
	Thu, 28 Aug 2025 10:01:11 +0000
Received: from mailout3.samsung.com ([203.254.224.33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urYTv-00000000tGN-0apJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Aug 2025 08:59:44 +0000
Received: from epcas5p1.samsung.com (unknown [182.195.41.39])
	by mailout3.samsung.com (KnoxPortal) with ESMTP id 20250828085940epoutp031f1c713564181da4153cde204af57ea4~f4qWp7mcH0107501075epoutp03x
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 Aug 2025 08:59:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com 20250828085940epoutp031f1c713564181da4153cde204af57ea4~f4qWp7mcH0107501075epoutp03x
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1756371580;
	bh=aP3JZ6i35oNdplmxk8s2s2TwgOzarCJEvRhAfBW6bEA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cmPplpZBw54vZbGtX98QypJRVKh9gmWmedPB3RLW1YnEucIP9lObd2Rqvou6w4V/i
	 Vj/ygvOkBL+ur0NIm4EKAiYMOOW4lFiyoRQDdNgOUXNufKlxzJiizZ2EHPahlUvjCz
	 nz6Uync4xXsO1X7PDucTGRcUxM5M0TLIRLyVxaMQ=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
	epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
	20250828085940epcas5p2dc296e2f6fb3094d4a92b9bec7cf8f75~f4qWCpDdZ1971119711epcas5p2B;
	Thu, 28 Aug 2025 08:59:40 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.89]) by
	epsnrtp04.localdomain (Postfix) with ESMTP id 4cCFhW0wmTz6B9mC; Thu, 28 Aug
	2025 08:59:39 +0000 (GMT)
Received: from epsmtip2.samsung.com (unknown [182.195.34.31]) by
	epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
	20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3~f4qUUXAYG1632816328epcas5p3i;
	Thu, 28 Aug 2025 08:59:38 +0000 (GMT)
Received: from cheetah.samsungds.net (unknown [107.109.115.53]) by
	epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250828085935epsmtip2d8cbb386c83433afe77acbe5f651cc4c~f4qRo3wsh0306303063epsmtip2W;
	Thu, 28 Aug 2025 08:59:35 +0000 (GMT)
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
Subject: [PATCH v3 4/7] media: imx-mipi-csis: Move irq flag and handler to
 mipi_csis_info structure
Date: Thu, 28 Aug 2025 14:29:08 +0530
Message-ID: <20250828085911.81266-5-inbaraj.e@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250828085911.81266-1-inbaraj.e@samsung.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-541,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3
References: <20250828085911.81266-1-inbaraj.e@samsung.com>
	<CGME20250828085938epcas5p3595ab67c6e5c40ab97f0b4a81faa16b3@epcas5p3.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_015943_498399_210EBAE9 
X-CRM114-Status: GOOD (  16.04  )
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

The Tesla FSD CSIS IP has single IRQ line, which is shared between
imx-mipi-csis and fsd-csis drivers. To extend this driver for Tesla FSD
SoC support, move the IRQ flag and IRQ handler into the device
data(structure mipi_csis_info).

Signed-off-by: Inbaraj E <inbaraj.e@samsung.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index cec035059445..2443906377bd 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -322,6 +322,8 @@ struct mipi_csis_info {
 	enum mipi_csis_version version;
 	unsigned int num_clocks;
 	const char *clk_names[MIPI_CSIS_MAX_CLOCKS];
+	unsigned int irq_flag;
+	irq_handler_t irq_handler;
 };
 
 struct mipi_csis_device {
@@ -1532,7 +1534,7 @@ static int mipi_csis_probe(struct platform_device *pdev)
 	mipi_csis_phy_reset(csis);
 
 	/* Now that the hardware is initialized, request the interrupt. */
-	ret = devm_request_irq(dev, irq, mipi_csis_irq_handler, 0,
+	ret = devm_request_irq(dev, irq, csis->info->irq_handler, csis->info->irq_flag,
 			       dev_name(dev), csis);
 	if (ret) {
 		dev_err(dev, "Interrupt request failed\n");
@@ -1606,6 +1608,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
 			.version = MIPI_CSIS_V3_3,
 			.num_clocks = 3,
 			.clk_names = {"pclk", "wrap", "phy"},
+			.irq_flag = 0,
+			.irq_handler = mipi_csis_irq_handler,
 		},
 	}, {
 		.compatible = "fsl,imx8mm-mipi-csi2",
@@ -1613,6 +1617,8 @@ static const struct of_device_id mipi_csis_of_match[] = {
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


