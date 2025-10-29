Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76510CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:04:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYgY7wGxuMztPeQeQ93HfHzdrSgvhdr6v9/vFwlZxWA=; b=G+YcQdduJh/E+EKEeT4lEPCbQI
	mCGzEsvURF5J+cs53k+AJBFjmsZXjkHLg365VkHux9U7K36/aU4P5QKpyAcpTSZp957XOiyorQZNZ
	NCti1yTYFwqOQ3IvaXDlapJ8ujXV4ilievmS0H1deLdBGzxjdNEV/jAwcOtXMZ9EjC7xFPSqEJWox
	/DfjoOv+8Tr+sIdYhDrTiZujpk0M4eEmbfPIgdkEBCVOcCtD5BtAa+XKu4dje43IaAvxpP4ozTS8Q
	CLjm+lpt9wTC4o05cU9vKfHkvuQf3FXaMgcv1SUH1FzeR/aMjZeZXv456woYflbqPk7T+6xKePOkz
	rnmEIKJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAWf-00000002KrV-4BRV;
	Wed, 29 Oct 2025 18:04:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAWV-00000002Kmh-2hnE
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 18:03:52 +0000
Received: from isaac-ThinkPad-T16-Gen-2.infra.iob (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C66FF4E45;
	Wed, 29 Oct 2025 19:01:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761760919;
	bh=C/Cbo20GJtUaPO+g6V4e4dxzNswEm9oCubEV2G/4xwA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Og+bquE36VrebpPyoAcH64sRciI0I38y1kbpS/xCbXGCwEweP22GOH5Itv0wh1rXk
	 BA8/hy00VVkEYegc0/K2+OpeiAz3RPTIAqXBgkkfplM7qu3JH2JNsLRb0v0wGf9Zbz
	 kQ2ndFbrlToMfRzMAa9qFjHFns4a5LtjaJuhYtU8=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: mchehab@kernel.org
Cc: rmfrfs@gmail.com,
	laurent.pinchart@ideasonboard.com,
	martink@posteo.de,
	kernel@puri.sm,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	sakari.ailus@linux.intel.com,
	linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Frank.Li@nxp.com,
	Isaac Scott <isaac.scott@ideasonboard.com>
Subject: [PATCH v6 2/4] media: imx-mipi-csis: Move redundant debug print in probe
Date: Wed, 29 Oct 2025 18:03:19 +0000
Message-ID: <20251029180321.153680-3-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
References: <20251029180321.153680-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_110351_818057_D04EAE80 
X-CRM114-Status: UNSURE (   9.94  )
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

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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


