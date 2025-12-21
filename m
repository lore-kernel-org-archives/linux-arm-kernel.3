Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5B44D68BD5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 21 Dec 2025 11:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxRJVoDSRNDPoxWqgsFuyFp/dGliMFbDzlEsETRXhiY=; b=N8EVMm0FJ5RYv0JDjHYPdW/2dq
	T3/f/TtwX1FDA3JXYogIpWh6R1ikVOyogJpz4x6A302/E1zPqe+EA4yoHdeo/+WNxduLz8rnp2A7p
	rNnJdfUD4WLwzQlsmj/n+1JlqyXo9QfO/kCP6UZSTfV8ZEwKugej4YIG20fdTjL+F3imRDVTf9xP2
	sPu4EqWVbnu5xDK3Z+5hYMSQqvo8JkMokevn/CZrbrRLox3ECcy95n8jG6pf+IEeaC4S3Ldcd+svR
	y95snkeKOxNx3YcnFA1JXswzGIS3j/oMMuQ8/f4Jv+KW8bjo+s6YllKB+SQy5Mw/zZENUlNNn26wD
	c0x0VHIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFh-0000000CMu6-1RTq;
	Sun, 21 Dec 2025 11:05:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXHFY-0000000CMrK-2huU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 21 Dec 2025 11:05:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CC4BE44447;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77246C19422;
	Sun, 21 Dec 2025 11:05:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766315119;
	bh=FqrfUyalVJxAzWiXrYozFMpf1r6H1cm5w3a0ofVlp2k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jARikKwv1yStu2XbSDMg6WVzslk2JzGCGCiv6WE0C7SueaB5h/PAL8VrI1k6MF3rc
	 fH8dI7Bnsv34RSdkC69NJH5Ys82ks+ADaUppeMTDaqH6ytFu/lP0/tJCwRInt4+KhE
	 WYloa9zqCYr1RkYljUBVev2/d94MOBTKL96S8FDwEQIJbIgh+33iZuG0u2arNqcl8T
	 097fzZ4/p2gnmpLCB3ES7ZkE/iE0CVDYzqrTvKkfBbV0M9WtOqMl3C+SGNw3YnrTML
	 roJ1L3ai+PTssG/ypDTFaw6TdvWFiNk0o0nBDvivfskmg/dvjgUB2U2iMkxkbI67J6
	 0lJFe9JMChwTQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 432215FE34; Sun, 21 Dec 2025 19:05:17 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Mark Brown <broonie@kernel.org>
Cc: Andre Przywara <andre.przywara@arm.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/4] spi: sun6i: Support A523's SPI controllers
Date: Sun, 21 Dec 2025 19:05:09 +0800
Message-ID: <20251221110513.1850535-3-wens@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221110513.1850535-1-wens@kernel.org>
References: <20251221110513.1850535-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251221_030520_710382_050A65FE 
X-CRM114-Status: GOOD (  14.38  )
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

The A523 has four SPI controllers. One of them supports MIPI DBI mode
in addition to standard SPI.

Compared to older generations, this newer controller now has a combined
counter for the RX FIFO ad buffer levels. In older generations, the
RX buffer level was a separate bitfield in the FIFO status register.

In practice this difference is negligible. The buffer is mostly
invisible to the implementation. If programmed I/O transfers are limited
to the FIFO size, then the contents of the buffer seem to always be
flushed over to the FIFO. For DMA, the DRQ trigger levels are only tied
to the FIFO levels. In all other aspects, the controller is the same as
the one in the R329.

Support the standard SPI mode controllers using the settings for R329.
DBI is left out as there currently is no infrastructure for enabling a
DBI host controller, as was the case for the R329.

Also fold the entry for the R329 to make the style consistent.

Signed-off-by: Chen-Yu Tsai <wens@kernel.org>
---
 drivers/spi/spi-sun6i.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/spi/spi-sun6i.c b/drivers/spi/spi-sun6i.c
index 871dfd3e77be..d1de6c99e762 100644
--- a/drivers/spi/spi-sun6i.c
+++ b/drivers/spi/spi-sun6i.c
@@ -795,10 +795,13 @@ static const struct sun6i_spi_cfg sun50i_r329_spi_cfg = {
 static const struct of_device_id sun6i_spi_match[] = {
 	{ .compatible = "allwinner,sun6i-a31-spi", .data = &sun6i_a31_spi_cfg },
 	{ .compatible = "allwinner,sun8i-h3-spi",  .data = &sun8i_h3_spi_cfg },
-	{
-		.compatible = "allwinner,sun50i-r329-spi",
-		.data = &sun50i_r329_spi_cfg
-	},
+	{ .compatible = "allwinner,sun50i-r329-spi", .data = &sun50i_r329_spi_cfg },
+	/*
+	 * A523's SPI controller has a combined RX buffer + FIFO counter
+	 * at offset 0x400, instead of split buffer count in FIFO status
+	 * register. But in practice we only care about the FIFO level.
+	 */
+	{ .compatible = "allwinner,sun55i-a523-spi", .data = &sun50i_r329_spi_cfg },
 	{}
 };
 MODULE_DEVICE_TABLE(of, sun6i_spi_match);
-- 
2.47.3


