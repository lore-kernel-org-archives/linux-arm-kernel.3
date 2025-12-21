Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9473D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 08:05:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HsIapH5K30YRzL8UXjrxGYN6SHabiduPxH/qhvH/KOA=; b=mzgAMLkJj2hYvtE+2QrmW64UUG
	gYu2/Sm2Ptcq0DuRiWnBJCqCN6PiYDcS8MefgEWu3rbaxj7Y9K7b18Sbuks0IiS8BRrreQZponPQl
	So1O1bUVbBkhA6xEi4fTFQP8Zi7uTPyVptxjoogGpo++YB1Jer9/ddMKb5iYZmQNklzqDp47Gl7mw
	vAypFMtsToNINmytABrNckC5JfMVdctXJa3K/KeSkHEcaZenCg37PgCK+ujWaSnzCryDkw8xSvtUB
	AfaoNwJjJLHfROgEqnPlyx3A3v6L58DdlcxGfe9t+EMvU6xNdR51FKKYjLcnNrdZ5xFmG/s2bFAQk
	DltGUD0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXERF-0000000CEtP-2tRG;
	Sun, 21 Dec 2025 08:05:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXERC-0000000CEss-2xSV
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 08:05:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E43044001C;
	Sun, 21 Dec 2025 08:05:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B13BC4CEFB;
	Sun, 21 Dec 2025 08:05:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766304309;
	bh=SbdKgxUWVMsftMM+lwkv9tuPDzerkjuvqnV6ISat3wc=;
	h=From:To:Cc:Subject:Date:From;
	b=kQTzRoWBQmw4rkI+HqSFZbx9Klkb44/ZZ9Pv7hVbqBEPJqHBzBC5b6BuCAXPZVLpt
	 o5BDXSLHYraDMDs/Copk9WDx8IGwtqXbpYnDzWkSZGwDnv43q5yLg0Gc9pOHSW95hS
	 U8EH7d05JKj9+KBZnTyyEXJnjM8e3EUJKNNixRb8FkV0pFuDZGFrdlbqeTPVYVQ0h1
	 sTIIejqy2e5AugwZ5xNahlxUSI1LEnJbpdCIDsm2+ZxtCUE/xGLcXHlITkEaU2a0Zc
	 7hv2nqLZxxo9DJJo3sbAdXGVYAMH8CfULRH64fuywwDAe8sEKInw7MLdM1IzAzXL/M
	 ERtYWzB6Sy0Dw==
Received: by wens.tw (Postfix, from userid 1000)
	id 4053A5FDFB; Sun, 21 Dec 2025 16:05:07 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Vinod Koul <vkoul@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	dmaengine@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dmaengine: sun6i: Choose appropriate burst length under maxburst
Date: Sun, 21 Dec 2025 16:04:48 +0800
Message-ID: <20251221080450.1813479-1-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_000510_875478_CD7D61B7 
X-CRM114-Status: GOOD (  14.49  )
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

maxburst, as provided by the client, specifies the largest amount of
data that is allowed to be transferred in one burst. This limit is
normally provided to avoid a data burst overflowing the target FIFO.
It does not mean that the DMA engine can only do bursts in that size.

Let the driver pick the largest supported burst length within the
given limit. This lets the driver work correctly with some clients that
give a large maxburst value. In particular, the 8250_dw driver will give
a quarter of the UART's FIFO size as maxburst. On some systems the FIFO
size is 256 bytes, giving a maxburst of 64 bytes, while the hardware
only supports bursts of up to 16 bytes.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/dma/sun6i-dma.c | 26 ++++++++++++++++++++------
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/sun6i-dma.c b/drivers/dma/sun6i-dma.c
index 2215ff877bf7..f9d876deb1f0 100644
--- a/drivers/dma/sun6i-dma.c
+++ b/drivers/dma/sun6i-dma.c
@@ -583,6 +583,22 @@ static irqreturn_t sun6i_dma_interrupt(int irq, void *dev_id)
 	return ret;
 }
 
+static u32 find_burst_size(const u32 burst_lengths, u32 maxburst)
+{
+	if (!maxburst)
+		return 1;
+
+	if (BIT(maxburst) & burst_lengths)
+		return maxburst;
+
+	/* Hardware only does power-of-two bursts. */
+	for (u32 burst = rounddown_pow_of_two(maxburst); burst > 0; burst /= 2)
+		if (BIT(burst) & burst_lengths)
+			return burst;
+
+	return 1;
+}
+
 static int set_config(struct sun6i_dma_dev *sdev,
 			struct dma_slave_config *sconfig,
 			enum dma_transfer_direction direction,
@@ -616,15 +632,13 @@ static int set_config(struct sun6i_dma_dev *sdev,
 		return -EINVAL;
 	if (!(BIT(dst_addr_width) & sdev->slave.dst_addr_widths))
 		return -EINVAL;
-	if (!(BIT(src_maxburst) & sdev->cfg->src_burst_lengths))
-		return -EINVAL;
-	if (!(BIT(dst_maxburst) & sdev->cfg->dst_burst_lengths))
-		return -EINVAL;
 
 	src_width = convert_buswidth(src_addr_width);
 	dst_width = convert_buswidth(dst_addr_width);
-	dst_burst = convert_burst(dst_maxburst);
-	src_burst = convert_burst(src_maxburst);
+	src_burst = find_burst_size(sdev->cfg->src_burst_lengths, src_maxburst);
+	dst_burst = find_burst_size(sdev->cfg->dst_burst_lengths, dst_maxburst);
+	dst_burst = convert_burst(dst_burst);
+	src_burst = convert_burst(src_burst);
 
 	*p_cfg = DMA_CHAN_CFG_SRC_WIDTH(src_width) |
 		DMA_CHAN_CFG_DST_WIDTH(dst_width);
-- 
2.47.3


