Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73038C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 00:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KFmXrj77k9XGFuUHPwOYtDB6t74JLbHmAzOI9fnuM1Q=; b=Jj9YSh5Ps+eB6+8OwaXur5ycaU
	AoimKd/czcA+VxkluC9QnTehEX7RjLx1QIzHTNayMgUhd/5SoDkdJJCRw9K1QZ2uuVMcqlXm3GJpw
	ortDHW8YU3WPziVCVRnEfx5YAfKvd5WaIOYVmzSNfUGL0n/fwfG2TsYkBR33sBn0bARJ1VI8uoFIg
	S98WmujKygs1mkqaDPXp+xdZt3lMN9skvju4zQYmCqT8OHtjEDaKLa7wVVjR/SciFxJY6wQlmO3hA
	b8fJqtNT8D6Xrf1DgTELIa7aj4rUjouqIjHo+HbSdTtKvg4w0AJEezNLiiLL9h4+4QggLj8Rsp3yV
	eKaWWruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOQ36-00000003AYd-0t01;
	Mon, 09 Jun 2025 00:07:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPup-00000003ABP-1jVl
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 08 Jun 2025 23:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KFmXrj77k9XGFuUHPwOYtDB6t74JLbHmAzOI9fnuM1Q=; b=ZAq7h/mSpijIk+sv41r/KOYdNS
	ckiiwNaKepvuh+WzlR011ZRnU94W9VTGPUdN/eo5Wz8GJP3q4qoNY9bAaDMp38+zuRzl6WagAVUAc
	cXB8AQ6f/fYirGZl+NfCc1Vi+nBklpTUqKlwC8BpzEqkhnBVx6lkJ4Rq/HNv9aqUlDu7tP9n69jWP
	oEYV4k+Y6/0zVsesfk3cklTD9raNPbHs0SOxloqwKqlprVTN1tRIcBoWACdGCAZpAYwyEdoWe2a3O
	lQQuhl0pBOcUdbfRKBkGy4qkj6J1ZG+YfB303irbodZkIrgrnGn97cwNtKtwb0Cb4Sn2XxoGxvDXB
	D2M2wTBQ==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPun-00000001YkV-0NWr
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Jun 2025 23:59:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 498E91733;
	Mon,  9 Jun 2025 01:58:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749427132;
	bh=+eXo/wQ3t4d847B87LJaO7CDqdcaA4L1lss+nyuXzWw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=X0mgdKu5JhllE45ufOuqVk9O+X5JN7FbHnY4K7PBI8UOpiKr0peZJxgwUlKGDud8V
	 2TpQ/eB/OgtSxZU4F0K6UcJ/iYol2ijDihKjzR17eqG/qRC/Ho7l2jOduXJxvqijKy
	 x+ZXOcZKVQoHIb4spArEHFhlGSO9wNzIk8m5//A4=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 4/8] media: imx-mipi-csis: Only set clock rate when specified in DT
Date: Mon,  9 Jun 2025 02:58:36 +0300
Message-ID: <20250608235840.23871-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
References: <20250608235840.23871-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_005901_389419_9E847FD9 
X-CRM114-Status: GOOD (  17.27  )
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
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 23 +++++++++++-----------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index e27467e6372f..080e40837463 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -230,8 +230,6 @@
 #define MIPI_CSIS_PKTDATA_EVEN			0x3000
 #define MIPI_CSIS_PKTDATA_SIZE			SZ_4K
 
-#define DEFAULT_SCLK_CSIS_FREQ			166000000UL
-
 struct mipi_csis_event {
 	bool debug;
 	u32 mask;
@@ -710,12 +708,17 @@ static int mipi_csis_clk_get(struct mipi_csis_device *csis)
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
@@ -1419,9 +1422,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
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


