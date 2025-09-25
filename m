Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BDECAC5B1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzT+ol/Pp1qnM8yfwDFxgVxmJp1ZNvkttQZU+Qfjutw=; b=XK3yyHo86q99OAPzd6n6z2l9Af
	QbaerPjfovMF467DYRzyS14gF2FtPbhSAHzV0C5bGBPvpaGngk4rO2EMEqpaCaZKOp/qrcp0/J6Ss
	aijdMUqGmMQ+E/W57tATG2LgBCamdHzJTD+YsiX5tTs7aO5/bGpWeA7Ql+zDhBhmer0sqJoE8f0OI
	UNxclLbcrYJQNBf9HoH5GrmE9omezHo0cgvLVemRTgf4tXMJriIvOsyTnUcKqJJKG99ajbBGgTXv3
	RnAWBlvbu55hefxMY8x0MbbUfzXZQP+/BLiJBIxEjNre20qb89We/ff0noSkp+zcMCgzxRx1PzdvC
	DhmSLVmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oJi-0000000Ashp-3ATB;
	Thu, 25 Sep 2025 15:55:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1oJf-0000000AsaJ-1rlz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:55:33 +0000
Received: from [127.0.1.1] (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 223B51E32;
	Thu, 25 Sep 2025 17:54:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1758815642;
	bh=wxwjv0TH/jBveXmTmMdoYRFOMmVEcjeoTCUVDdp1DUg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=NVoeSH+fYusndWUvE/2r4PXA/JAsYgOxUJvo0V6Dlm7AbTqj66i4uYy0Ah+hBvWmo
	 nbvsI9YnOWQ2DJoowfCpbqTjP+acRfRls7kneiGejy5BXn8WvjOMMMNe5LU3rtJ03y
	 CnXXPJvtlXT3Gwj4kbmzkti/oRgW9qdZwDSihQmI=
From: Isaac Scott <isaac.scott@ideasonboard.com>
Date: Thu, 25 Sep 2025 16:54:27 +0100
Subject: [PATCH v4 2/4] media: imx-mipi-csis: Move redundant debug print in
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250925-active-data-lanes-v4-2-8b54e3d5af6c@ideasonboard.com>
References: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
In-Reply-To: <20250925-active-data-lanes-v4-0-8b54e3d5af6c@ideasonboard.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rui Miguel Silva <rmfrfs@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Martin Kepplinger <martink@posteo.de>, Purism Kernel Team <kernel@puri.sm>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Isaac Scott <isaac.scott@ideasonboard.com>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_085531_626125_D777E4D6 
X-CRM114-Status: UNSURE (   9.46  )
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

The number of data lanes is already printed as part of
mipi_csis_async_register(), making the first part of this print
redundant. Remove the redundant print, and move the debug print for
clock frequency to mipi_csis_parse_dt().

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d5de7854f579..7c2a679dca2e 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -1481,6 +1481,7 @@ static int mipi_csis_parse_dt(struct mipi_csis_device *csis)
 	struct device_node *node = csis->dev->of_node;
 
 	of_property_read_u32(node, "clock-frequency", &csis->clk_frequency);
+	dev_dbg(csis->dev, "clock frequency: %u\n", csis->clk_frequency);
 
 	csis->num_channels = 1;
 	of_property_read_u32(node, "fsl,num-channels", &csis->num_channels);
@@ -1566,9 +1567,6 @@ static int mipi_csis_probe(struct platform_device *pdev)
 			goto err_unregister_all;
 	}
 
-	dev_info(dev, "lanes: %d, freq: %u\n",
-		 csis->bus.num_data_lanes, csis->clk_frequency);
-
 	return 0;
 
 err_unregister_all:

-- 
2.43.0


