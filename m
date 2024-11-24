Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1863E668B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 24 Nov 2024 15:49:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GdcCW6bWv+CjUW+3E2Je0gm1WZBul86Rgv4v7R4Y7qA=; b=CRauXP2GoRJmb4+dVlDep7keDE
	TlfHIaRsgvoXBvPikwsKPl5EgBQic6XXgxd3cOn8HG0WHP+BVkLvMTsX0TLTRFcQNw2xphJzkqtr6
	mzgwa0DsQpSI5/YSBFRuMdJoQN26lMkJkZVoutDvL5iNvDarEBDRbqSMu6y7/IE7jUrv/p1TgmLIp
	XUxLoAINwp1PobMIGidONBX2FAr92wmb3IaJeGuWnUObPKdZJ65/LPhJAumOaMWvMT4qxumI39pO8
	fbKYerCC8mIeHlRhIilqPDGaY9zQoLLDLh++nw4uhe2yaC94j9POXgz/ZQ0B+OsP/MrrIJhIuanvr
	kAXnJSiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFEri-00000006Hrb-1WG3;
	Sun, 24 Nov 2024 15:49:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFEqk-00000006Hms-3nxK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 24 Nov 2024 15:48:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 457265C54CA;
	Sun, 24 Nov 2024 15:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 854B6C4CECC;
	Sun, 24 Nov 2024 15:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732463316;
	bh=hFy8l4XZP0/+kbC7Zjr0Hr9qaIpfqI/wYZHM5yGyXOQ=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=E2lf8B3dr6gbecqvE0H2OIcnahCDfgeIYX/bez9XGZPrtUam3k12sU1mHpWH+Zbpj
	 D5Va2nN7CsQy+2ZIRTkDLY2vr5nc9qRfe6Nvmwmxh+9uce4JELhKjByjOlFAtxD4CC
	 zmxY93akVN6/N/Il18BQeXeDK1yeigpgfK01i4YlIBQRglaJ6FMP3eL/8KVceEmMLp
	 Tzb4MPWLwywBE2PP3sIKMQRCmtgB6uGuU22F141mxRPEo45l0oHvhe/tujneyUjOGP
	 F+9+Rx7rsDpG/e5JW4MdoGdKg6xi4p4IKe7RFxYFbeUkCg8Q0BA90Sp4iuZNU0y2xl
	 IbSIWXAe+urqw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FDF1E668B2;
	Sun, 24 Nov 2024 15:48:36 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Sun, 24 Nov 2024 16:48:28 +0100
Subject: [PATCH] dmaengine: apple-admac: Avoid accessing registers in probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241124-admac-power-v1-1-58f2165a4d55@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMtKQ2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDQyMT3cSU3MRk3YL88tQiXfM0Y6Nko0RDC1ODRCWgjoKi1LTMCrBp0bG
 1tQAYOnwwXQAAAA==
X-Change-ID: 20241124-admac-power-7f32c2a1850a
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Vinod Koul <vkoul@kernel.org>, 
 =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sasha Finkelstein <fnkl.kernel@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732463315; l=1574;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=fzYr2mOnaTThuwM8nzcfIvcWzFVACOsEp4j04pez3Us=;
 b=RMWELGTjitjliRQGKVjh9SJeijRLX/Kvt/3E/LLmmy3YJdBhs3xVJh9TFlJpN0Hg+IxvsqdiH
 zT/+9C3lwZEAHnQOhKvdsR7FrdibkKVGBpZb3XTTIDy4zEzccMhr/E3
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_074839_039534_3F905DB4 
X-CRM114-Status: UNSURE (   9.92  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

The ADMAC attached to the AOP has complex power sequencing, and is
power gated when the probe callback runs. Move the register reads
to other functions, where we can guarantee that the hardware is
switched on.

Fixes: 568aa6dd641f ("dmaengine: apple-admac: Allocate cache SRAM to channels")
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 drivers/dma/apple-admac.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/dma/apple-admac.c b/drivers/dma/apple-admac.c
index 9588773dd2eb670a2f6115fdaef39a0e88248015..037ec38730cf980eee11ebb8ec17be7623879cf8 100644
--- a/drivers/dma/apple-admac.c
+++ b/drivers/dma/apple-admac.c
@@ -153,6 +153,8 @@ static int admac_alloc_sram_carveout(struct admac_data *ad,
 {
 	struct admac_sram *sram;
 	int i, ret = 0, nblocks;
+	ad->txcache.size = readl_relaxed(ad->base + REG_TX_SRAM_SIZE);
+	ad->rxcache.size = readl_relaxed(ad->base + REG_RX_SRAM_SIZE);
 
 	if (dir == DMA_MEM_TO_DEV)
 		sram = &ad->txcache;
@@ -912,12 +914,7 @@ static int admac_probe(struct platform_device *pdev)
 		goto free_irq;
 	}
 
-	ad->txcache.size = readl_relaxed(ad->base + REG_TX_SRAM_SIZE);
-	ad->rxcache.size = readl_relaxed(ad->base + REG_RX_SRAM_SIZE);
-
 	dev_info(&pdev->dev, "Audio DMA Controller\n");
-	dev_info(&pdev->dev, "imprint %x TX cache %u RX cache %u\n",
-		 readl_relaxed(ad->base + REG_IMPRINT), ad->txcache.size, ad->rxcache.size);
 
 	return 0;
 

---
base-commit: 9f16d5e6f220661f73b36a4be1b21575651d8833
change-id: 20241124-admac-power-7f32c2a1850a



