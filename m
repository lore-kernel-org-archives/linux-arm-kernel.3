Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 631E6C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 13:53:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4KzDS4ElH+oa8cw+Cn2JRv+agfmydzZVTUW+H+O5/ZE=; b=evxf2KaOFKMRewSYdV6VcBcdLM
	R6MHeZG1MnWlYZWgNaQTsHFsV6SIwm3xB3B/Mhdf5gKdkaGf/Eviu/tXBaq/jiWepCQfg2k6FdwSD
	m2Dtha4YVPbJIJwlwg2Eg3LqZ53GVFahErC0cYK9Q20QxhPo3OOC2JDGsLutNobgm5wc0J5u1kOiU
	ZHlKvZkpu8y/0St+3oDUVySRJQ7oWzmfWbC2DH2fo5BQSMOvj02+JkCTDGmInA4/ufqBXINzJWPQu
	8s9xPyhlBap7B5EifLg/iW2UP7Mw9RkACQLiqJfqpI0WpbmPXrazjyZntgHdOdh4Ojqa0Qw9St7CR
	+eZWCetA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5T6-0000000EKgf-1R3t;
	Fri, 14 Mar 2025 13:52:56 +0000
Received: from mxout37.expurgate.net ([91.198.224.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Py-0000000EKA2-0i50
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 13:49:43 +0000
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1tt5Pu-005k7L-HR; Fri, 14 Mar 2025 14:49:38 +0100
Received: from [217.239.223.202] (helo=zimbra.brueckmann-gmbh.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1tt5Pt-003chE-Oy; Fri, 14 Mar 2025 14:49:37 +0100
Received: from zimbra.brueckmann-gmbh.de (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPS id 9E367CAF097;
	Fri, 14 Mar 2025 14:49:36 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTP id 9C677CAF053;
	Fri, 14 Mar 2025 14:49:36 +0100 (CET)
Received: from zimbra.brueckmann-gmbh.de ([127.0.0.1])
 by localhost (zimbra.brueckmann-gmbh.de [127.0.0.1]) (amavis, port 10026)
 with ESMTP id WRq9PIR4BSAX; Fri, 14 Mar 2025 14:49:36 +0100 (CET)
Received: from ew-linux.ew (unknown [10.0.11.14])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPSA id 872CBCAEFB5;
	Fri, 14 Mar 2025 14:49:36 +0100 (CET)
From: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
To: dmaengine@vger.kernel.org
Cc: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>,
	Vinod Koul <vkoul@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Marek Vasut <marex@denx.de>,
	Radhey Shyam Pandey <radhey.shyam.pandey@amd.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: xilinx_dma: Set dma_device directions
Date: Fri, 14 Mar 2025 14:48:47 +0100
Message-ID: <20250314134849.703819-1-thomas.gessler@brueckmann-gmbh.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-type: clean
X-purgate: clean
X-purgate-ID: 151534::1741960178-6A6E29C1-AE591C42/0/0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_064942_350756_636D3265 
X-CRM114-Status: UNSURE (   9.15  )
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
 drivers/dma/xilinx/xilinx_dma.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
index 108a7287f4cd..641aaf0c0f1c 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3205,6 +3205,10 @@ static int xilinx_dma_probe(struct platform_device=
 *pdev)
 		}
 	}
=20
+	for (i =3D 0; i < xdev->dma_config->max_channels; i++)
+		if (xdev->chan[i])
+			xdev->common.directions |=3D xdev->chan[i]->direction;
+
 	if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_VDMA) {
 		for (i =3D 0; i < xdev->dma_config->max_channels; i++)
 			if (xdev->chan[i])
--=20
2.43.0


