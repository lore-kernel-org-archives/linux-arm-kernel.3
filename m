Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D433AC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 18:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Date:From:To:Cc:
	Message-Id:In-Reply-To:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=PvD8g/iHmVDM+dWVh5jAN+ccAMhC2v2ZHCMkMzBxqQU=; b=pTxg51mX9muYfr
	I4tibMo//E3AdakeFIAtK0ISMI6rUeLxOSK6S54Re8kIBXn1fBV9NlJVMczazkPjiOMvVWmdwsnms
	Xpa8VTVQgx/2LAelzZgm9MYFJPAQTteaa6Xr0rvavS1LEGmo5BzZG15sJ5D5RPP7NPrk6srSpoOx1
	zmcqKLWtKE0iFKhR20+h58HDAQGSUdXWaSmkRMx6k2CO5pxNucXaiJwanpVZIwGSCTO6sDxAF1V7B
	i4a1QhW7m5JZZDjh25Vej54PmnH4kW6BUL0Iich5Szfy+mjYQboiFXGkXJKTDR1/QMN3RidArMcRR
	8lOETwetXsLJ+q8E/Emg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQxy-00000009GUg-0w4Z;
	Wed, 12 Mar 2025 18:38:06 +0000
Received: from www522.your-server.de ([195.201.215.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsQwG-00000009GIX-2Pql
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 18:36:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=folker-schwesinger.de; s=default2212; h=Subject:Date:From:To:Cc:Message-Id:
	In-Reply-To:Sender:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References;
	bh=PvD8g/iHmVDM+dWVh5jAN+ccAMhC2v2ZHCMkMzBxqQU=; b=IHs3ILwnUjRJjDXQPTt0DSuIJA
	ehk51ivm59UhUeZGijZUyxHQzKNS6g/KsrrBX8lVKSg9ogW0z52d07amM8pCic4YPjfRwsYoMV03p
	Fbha6ZgF4YEbyfusLWQOD+IjPx8aTfSawc/+mdm/HnB5gRPHRmcDqZKGt0Aw+Fj4m2FEw4VEET0aE
	QvO3+SqYCg2sZ7QkfSXeLja/vfq3StgeVsHVCbJ0ku4JatolvVVyJ/X+z9ubPgr/0R/ONNh0WWNW/
	3lcnoLqLD4KpDujU6pvH26sOjWYz4Omg1D3CTjyWfoGRMxMwqbGudyEgV64Sc/ZXNPDO50wp/TR8e
	mfTqwMeA==;
Received: from sslproxy03.your-server.de ([88.198.220.132])
	by www522.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tsQw8-000IGQ-1y;
	Wed, 12 Mar 2025 19:36:12 +0100
Received: from [185.209.196.170] (helo=localhost)
	by sslproxy03.your-server.de with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <dev@folker-schwesinger.de>)
	id 1tsQw8-000JzK-29;
	Wed, 12 Mar 2025 19:36:12 +0100
In-Reply-To: <D8EI6SI5E4PE.3GOBCNHV38K03@folker-schwesinger.de>
Message-Id: <D8EI6SI5EIUY.2JD240P96ZZSS@folker-schwesinger.de>
Cc: "Kedareswara rao Appana" <appanad@xilinx.com>,
 <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
To: "Vinod Koul" <vkoul@kernel.org>, "Michal Simek" <michal.simek@amd.com>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Manivannan Sadhasivam"
 <manivannan.sadhasivam@linaro.org>, "Krzysztof Kozlowski"
 <krzysztof.kozlowski@linaro.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "Marek Vasut" <marex@denx.de>
From: "Folker Schwesinger" <dev@folker-schwesinger.de>
Date: Wed, 12 Mar 2025 19:23:49 +0100
Subject: [PATCH 1/1] dmaengine: xilinx_dma: Set dma_device.directions
X-Authenticated-Sender: dev@folker-schwesinger.de
X-Virus-Scanned: Clear (ClamAV 1.0.7/27575/Wed Mar 12 09:37:42 2025)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_113620_909456_807B6857 
X-CRM114-Status: UNSURE (   8.48  )
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

When using the dma_get_slave_caps() API, it checks the directions fields of
the dma_device structure. Currently, the Xilinx DMA driver does not set
this, which causes dma_get_slave_caps() to return -ENXIO.

Fix this issue by setting the directions field of the dma_device
structure during DMA channel probe.

Signed-off-by: Folker Schwesinger <dev@folker-schwesinger.de>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_dma.c
index 3ad44afd0e74..63c308f2ae81 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2864,6 +2864,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 	    of_device_is_compatible(node, "xlnx,axi-dma-mm2s-channel") ||
 	    of_device_is_compatible(node, "xlnx,axi-cdma-channel")) {
 		chan->direction = DMA_MEM_TO_DEV;
+		xdev->common.directions |= BIT(DMA_MEM_TO_DEV);
 		chan->id = xdev->mm2s_chan_id++;
 		chan->tdest = chan->id;
 
@@ -2881,6 +2882,7 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_device *xdev,
 		   of_device_is_compatible(node,
 					   "xlnx,axi-dma-s2mm-channel")) {
 		chan->direction = DMA_DEV_TO_MEM;
+		xdev->common.directions |= BIT(DMA_DEV_TO_MEM);
 		chan->id = xdev->s2mm_chan_id++;
 		chan->tdest = chan->id - xdev->dma_config->max_channels / 2;
 		chan->has_vflip = of_property_read_bool(node,
-- 
2.48.1

