Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6A85CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:50:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cdD5eb9Xbv/eIYiUMV99R5gnCtEzIkcLWSAHILoi01s=; b=IqcmdA/syb9efiOruuw/Ur3NpT
	dAXWMJIV3ExhgiZri18r+h3mQ/IcrxstKaq6hXiteiP7zRwQJkzxoIKa00wzxIM7lYcYndEzSMLkZ
	wjPbIP89+oX1/CTR7hheFGXazqu5I/r8QRQRxEO17yDS2qvcZjgC2Q4w7DnfePpbAxAcbJLlRjHdg
	NS8SbAS4+4D4ujVNK+ZpAZAIHFohD6A1NI063WdgVHjMzVRks0oFbOwge9o7ZuYaatO6aqNIpIcMV
	ehr4P8vmAUVWM/ypEbP7d2+RIv7wqLPxOKF1SfhNQ/JbKpJMjzNTtSEsbTHHdJw7RRvk/AtjNFHMt
	9F3xXJNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKfC-00000001cl2-3TYk;
	Fri, 22 Aug 2025 05:50:10 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdd-000000012W4-2DOL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:14 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id B958D3040;
	Fri, 22 Aug 2025 02:27:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822433;
	bh=tgM7NvB2fDb1umISxfniYYQgD/+9biVM/E2Zm4msX6w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=azy9KYhJr+v7dT5+M0Jzab9UJuqIO7EOd2IJUbO4zgj3xW3sfl4qq/QQMaJoX/+/j
	 ei1ACQEc/zH0CMIypYQGI98U0xExwYFII/zRFiC5gURZmvUTb3Cv9RNx5XILqf0ADr
	 /W7DJM3Chhvz1HGwf5IBrRmZKVEJMD9aJXvjd0cE=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 09/13] media: imx-mipi-csis: Only set clock rate when specified in DT
Date: Fri, 22 Aug 2025 03:27:29 +0300
Message-ID: <20250822002734.23516-10-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172813_703589_86E8DA5F 
X-CRM114-Status: GOOD (  17.79  )
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

The imx-mipi-csis driver sets the rate of the wrap clock to the value
specified in the device tree's "clock-frequency" property, and defaults
to 166 MHz otherwise. This is a historical mistake, as clock rate
selection should have been left to the assigned-clock-rates property.

Honouring the clock-frequency property can't be removed without breaking
backwards compatibility, and the corresponding code isn't very
intrusive. The 166 MHz default, on the other hand, prevents
configuration of the clock rate through assigned-clock-rates, as the
driver immediately overwrites the rate. This behaviour is confusing and
has cost debugging time.

There is little value in a 166 MHz default. All mainline device tree
sources that enable the CSIS specify a clock-frequency explicitly, and
the default wrap clock configuration on supported platforms is at least
as high as 166 MHz. Drop the default, and only set the clock rate
manually when the clock-frequency property is specified.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 77f1bf05b520..e1588990beda 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -229,8 +229,6 @@
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
 #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
-#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -707,12 +705,17 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
 	if (ret < 0)
 		return ret;
 
-	/* Set clock rate */
-	ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
-			   csis->clk_frequency);
-	if (ret < 0)
-		dev_err(csis->dev, "set rate=%d failed: %d\n",
-			csis->clk_frequency, ret);
+	if (csis->clk_frequency) {
+		/*
+		 * Set the clock rate. This is deprecated, for backward
+		 * compatibility with old device trees.
+		 */
+		ret = clk_set_rate(csis->clks[MIPI_CSIS_CLK_WRAP].clk,
+				   csis->clk_frequency);
+		if (ret < 0)
+			dev_err(csis->dev, "set rate=%d failed: %d\n",
+				csis->clk_frequency, ret);
+	}
 
 	return ret;
 }
@@ -1416,9 +1419,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 {
 	struct device_node *node = csis->dev->of_node;
 
-	if (of_property_read_u32(node, "clock-frequency",
-				 &csis->clk_frequency))
-		csis->clk_frequency = DEFAULT_SCLK_CSIS_FREQ;
+	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
 
 	return 0;
 }
-- 
Regards,

Laurent Pinchart


