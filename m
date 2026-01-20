Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 666C1CA5FB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ulo77ylyJZMF+/aZjD30uG2oZc3o7QcUP3IHLM+BdQQ=; b=oDGQ79VufJv/IRnJ43prK8F4N+
	Gk3ofh9s1M5c8XrmyQ7V4aTi6h9XUCqRjOU0vum8L/h6WN/NOgEvszvKDxQWlcAnR1iFaP8vB7MhB
	TNg/4tDn60yuEn35AOqno1Y1FeY9gd92IzxfUv15uBpIFZQR+22JL+7y2Bge0Vg/7e4vR1gf5okua
	g0uIrHLE2aKewh6DKj+vQ3tqbKPwxIPK5MAFEbwWaQKrsxQ8bf62aIMX/hC3PYhEUANwWnSxBsjAY
	mj1xWrHKZRlngvvK91FwINjcGRq85oq6jpcOEiL1tRKpQgZ4fkneoKQPSqHVdtUGhl1mIH4LZkA0q
	GOYa52pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEsc-00000004CWc-0Aom;
	Tue, 20 Jan 2026 16:46:58 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viEsY-00000004CUl-43dF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 16:46:56 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 886631488638;
	Tue, 20 Jan 2026 17:46:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768927612; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=ulo77ylyJZMF+/aZjD30uG2oZc3o7QcUP3IHLM+BdQQ=;
	b=lQSQpedZYGaCXUVdPKEo+JbBJSbufqszB6YbOEuq3DXKqeMQV7KK9GcbUzcxRD67j05RZq
	FRDPg+GRczRx/4AXPhimI+R7nN8VpkEBdgoI4aEX9NbZiWyo6xu6mMQa4f49vm6dWnO0SV
	iR+57Otsj6/GMGkaI5Po3YR7dPOTHhjqYhebsb5snBrhYfyiBEG18kj9P8jTZdLMF3VwSd
	oGT0banOk3cEkTKBN+jPcF25sAQro2qzFTCJDKF1UD2sR17QCmNqX9bhrqHqbKCdSyNM3Y
	DJ4HUcLbCZMxuODvlseWE4Jyi9ndIGSADRTru8r20hLNTzUtj6ewRy11EYlRxA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH v3 13/19] nvmem: microchip-otpc: Enable necessary clocks
Date: Tue, 20 Jan 2026 16:44:47 +0100
Message-ID: <20260120154502.1280938-7-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_084655_162201_30CF6FD0 
X-CRM114-Status: GOOD (  12.41  )
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

Without enabling the main rc clock, initializing the packet list leads
to a read timeout on the first packet, at least on sam9x60.

According to SAM9X60 datasheet (DS60001579G) section "23.4 Product
Dependencies" the clock must be enabled for reading and writing.

Tested on sam9x60-curiosity board.

Link: https://lore.kernel.org/linux-clk/ec34efc2-2051-4b8a-b5d8-6e2fd5e08c28@microchip.com/T/#u
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Rewrap lines
    
    v2:
    - Rewrite to enable _all_ clocks defined in dts

 drivers/nvmem/microchip-otpc.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index d39f2d57e5f5e..34c0d7611f3e4 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -8,6 +8,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/clk.h>
 #include <linux/iopoll.h>
 #include <linux/module.h>
 #include <linux/nvmem-provider.h>
@@ -241,6 +242,7 @@ static struct nvmem_config mchp_nvmem_config = {
 static int mchp_otpc_probe(struct platform_device *pdev)
 {
 	struct nvmem_device *nvmem;
+	struct clk_bulk_data *clks;
 	struct mchp_otpc *otpc;
 	u32 size;
 	int ret;
@@ -253,6 +255,10 @@ static int mchp_otpc_probe(struct platform_device *pdev)
 	if (IS_ERR(otpc->base))
 		return PTR_ERR(otpc->base);
 
+	ret = devm_clk_bulk_get_all_enabled(&pdev->dev, &clks);
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Error getting clocks!\n");
+
 	otpc->dev = &pdev->dev;
 	ret = mchp_otpc_init_packets_list(otpc, &size);
 	if (ret)
-- 
2.47.3


