Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 002B4C3ABBF
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 18:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lQgX3jtIsteXgtrKbDViEW3hMOI9mCbY4kQqm1h/U4o=; b=ofttEvrwpDDJsDW+7BqGJPCPU7
	uE3gS0Imj0ayyCS9nRsO3eNx6RctQUkKBAHTtKOngLSeMbkD8QIjBq1TygRvam9dZHIeRLCmBaclB
	INHdJ/Z+nXXXzlZyMIXieoHjjzaDD9m84DsGwZveP3wMQYu5iu2YqsSocj8TLUJhuUrUd2wJ2tAD0
	uJFBDUWdoZKL7YiikdjgV1G5/BrHFwfUxDNXAfTlyrXF3iZDvdn/E1J4B+ghdTjuELCMK3ISUlkgH
	tIoafCJaclnwtmbUYzIXguUbGw8BRYxpigBkiVsmQpVOOx9sXYopcenddZ33EbkUHx9hE5+Q9Z4l/
	xCHo8olA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjeo-0000000GVVH-2wda;
	Wed, 07 May 2025 18:38:14 +0000
Received: from mxout37.expurgate.net ([194.37.255.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCjOm-0000000GTAh-1uPc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 18:21:42 +0000
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1uCjOc-002WP0-AF; Wed, 07 May 2025 20:21:30 +0200
Received: from [217.239.223.202] (helo=zimbra.brueckmann-gmbh.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1uCjOb-002Q3U-8p; Wed, 07 May 2025 20:21:29 +0200
Received: from zimbra.brueckmann-gmbh.de (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPS id F1027CA0310;
	Wed,  7 May 2025 20:21:27 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTP id E0C2ECA04D8;
	Wed,  7 May 2025 20:21:27 +0200 (CEST)
Received: from zimbra.brueckmann-gmbh.de ([127.0.0.1])
 by localhost (zimbra.brueckmann-gmbh.de [127.0.0.1]) (amavis, port 10026)
 with ESMTP id wCZj7PF64PHc; Wed,  7 May 2025 20:21:27 +0200 (CEST)
Received: from ew-linux.ew (unknown [10.0.11.14])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPSA id C1437CA0310;
	Wed,  7 May 2025 20:21:27 +0200 (CEST)
From: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
To: dmaengine@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Marek Vasut <marex@denx.de>,
	linux-arm-kernel@lists.infradead.org,
	Suraj Gupta <Suraj.Gupta2@amd.com>,
	Harini Katakam <harini.katakam@amd.com>
Subject: [PATCH v2] dmaengine: xilinx_dma: Set dma_device directions
Date: Wed,  7 May 2025 20:21:01 +0200
Message-ID: <20250507182101.909010-1-thomas.gessler@brueckmann-gmbh.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1746642090-96E4C21F-1C64AD5C/0/0
X-purgate: clean
X-purgate-type: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_112140_631081_C60E26B8 
X-CRM114-Status: UNSURE (   9.09  )
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

Coalesce the direction bits from the enabled TX and/or RX channels into
the directions bit mask of dma_device. Without this mask set,
dma_get_slave_caps() in the DMAEngine fails, which prevents the driver
from being used with an IIO DMAEngine buffer.

Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
---
Changes in v2:
  - Change to Suraj's simpler version as per Radhey's request

 drivers/dma/xilinx/xilinx_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
index 3ad44afd0e74..8f26b6eff3f3 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -2909,6 +2909,8 @@ static int xilinx_dma_chan_probe(struct xilinx_dma_=
device *xdev,
 		return -EINVAL;
 	}
=20
+	xdev->common.directions |=3D chan->direction;
+
 	/* Request the interrupt */
 	chan->irq =3D of_irq_get(node, chan->tdest);
 	if (chan->irq < 0)

