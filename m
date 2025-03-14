Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB04C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Mar 2025 13:49:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2w6nVaSkt+gjFrHh6x+y1Un3lZJxYil1Iwfei6xJLgg=; b=1oZq7kbPvs3Ehh4r/mnOBeJwL4
	e+UXnL8y8z4H5GWs49q0qOxeBhIvPukU08D8KNyWMN0QNj3R6ZYg2gqRcqi2yFDvG4SzHq6KXSZlG
	jeIJYih8Nd6cPJfi3HzKMZw94LejnWDujho1rSproLmevBda7lgCTpMoO7aAdKVwOunXWO1kD2mWF
	1enCEp1cdGBJm9KwSh11rL6Jhs0/2I6yC+92BWTDrIpVAUx3ayGochyyzvnM9miTt5pK8I51pqPxX
	/ttsS6qhqKMqbl+gIoNbdU3hmngoBYFplCaQqNww186sx7Ali5ilLKH7nIwO7XZHhCe2vwzGe2+br
	OlLRlSwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5Pn-0000000EK8I-14Wq;
	Fri, 14 Mar 2025 13:49:31 +0000
Received: from mxout37.expurgate.net ([91.198.224.37])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tt5O6-0000000EJtr-0hAx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Mar 2025 13:47:48 +0000
Received: from [194.37.255.9] (helo=mxout.expurgate.net)
	by relay.expurgate.net with smtp (Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1tt5Nu-003bqT-Vn; Fri, 14 Mar 2025 14:47:35 +0100
Received: from [217.239.223.202] (helo=zimbra.brueckmann-gmbh.de)
	by relay.expurgate.net with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <thomas.gessler@brueckmann-gmbh.de>)
	id 1tt5Nt-003e41-4V; Fri, 14 Mar 2025 14:47:33 +0100
Received: from zimbra.brueckmann-gmbh.de (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPS id E9E4FCAF156;
	Fri, 14 Mar 2025 14:47:31 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTP id E5E97CAF150;
	Fri, 14 Mar 2025 14:47:31 +0100 (CET)
Received: from zimbra.brueckmann-gmbh.de ([127.0.0.1])
 by localhost (zimbra.brueckmann-gmbh.de [127.0.0.1]) (amavis, port 10026)
 with ESMTP id EnYx8uQXloXr; Fri, 14 Mar 2025 14:47:31 +0100 (CET)
Received: from ew-linux.ew (unknown [10.0.11.14])
	by zimbra.brueckmann-gmbh.de (Postfix) with ESMTPSA id CE686CAF131;
	Fri, 14 Mar 2025 14:47:31 +0100 (CET)
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
Subject: [PATCH] dmaengine: xilinx_dma: Set max segment size
Date: Fri, 14 Mar 2025 14:47:15 +0100
Message-ID: <20250314134717.703287-1-thomas.gessler@brueckmann-gmbh.de>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-purgate-ID: 151534::1741960053-ADFAB3DC-1FE738A5/0/0
X-purgate-type: clean
X-purgate: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250314_064746_344299_603EBE53 
X-CRM114-Status: UNSURE (   8.84  )
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

Set the maximumg DMA segment size from the actual core configuration
value. Without this setting, the default value of 64 KiB is reported,
and larger sizes cannot be used for IIO DMAEngine buffers.

Signed-off-by: Thomas Gessler <thomas.gessler@brueckmann-gmbh.de>
---
 drivers/dma/xilinx/xilinx_dma.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/dma/xilinx/xilinx_dma.c b/drivers/dma/xilinx/xilinx_=
dma.c
index 108a7287f4cd..4b4a299e3807 100644
--- a/drivers/dma/xilinx/xilinx_dma.c
+++ b/drivers/dma/xilinx/xilinx_dma.c
@@ -3114,6 +3114,8 @@ static int xilinx_dma_probe(struct platform_device =
*pdev)
 		}
 	}
=20
+	dma_set_max_seg_size(xdev->dev, xdev->max_buffer_len);
+
 	if (xdev->dma_config->dmatype =3D=3D XDMA_TYPE_AXIDMA) {
 		xdev->has_axistream_connected =3D
 			of_property_read_bool(node, "xlnx,axistream-connected");
--=20
2.43.0


