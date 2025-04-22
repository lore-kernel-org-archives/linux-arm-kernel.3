Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2202DC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GC+eh/mtJ5AgZjRHs1WmbXcR1D1q9NsZCYktjA2QeZ4=; b=UsCbqikLMHBibjKUiscMg6HmnQ
	zhs1r+0ibfruXhW6P6GUaScUXUA69kRVnJ4kccZTONvLmdjEVEoHBHPHbePqIC5lftCTy1VCthFyo
	80ci5qVH0a+xYx7QzqsOlZSw5OMlHv2T/fiTXw/gAZrQPTBRfIfmVGQ6YGfz6cIng7qaKgwUK+CqP
	ct6k0ty36lgZuHriTGBH1bGJl40xLH+1lE83H0ON2YzxPBUM/KO80R2Tgyent/VLPR5Ew2YluYlpM
	+2w3lhf4azDXny8cEgD13NtrGr9dz6/tZbf+WYfni1Spz4FtkRLc89XVEh6S06qdl9TXImnDlCQlK
	M47Ok6GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73L0-00000005bmF-3Fo1;
	Tue, 22 Apr 2025 02:26:18 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73C3-00000005ZIM-3NE6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:17:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CA9606116F;
	Tue, 22 Apr 2025 02:16:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6C88C4CEF5;
	Tue, 22 Apr 2025 02:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288223;
	bh=W3fZc4RzShLZ39KaAzu286VLtoVz1a2Yr3M6iIQtwzM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=b2kEEuqw0EYCb71IziG55jcTwbR2NH6j5jCUzucOjKLrpavoRrI+jWBIKzSLMWKap
	 sIj7mAT8pLhj4TE9lIoFPuZ4+ue8kERvsULisBp8v+FxRteJBTpTaWRABMRaE3+WJ9
	 Ja7nORCSjo5F6dgKKSSa5NpGpttfWHqCqbzHPy0fEBVsNLBUXQFpUXTO+DrJWxCCW9
	 9fFuncwNrjSZL5DPg2DpXrbILxpSc1WRpX3LKI/1AEjNoFr2+dtitN9JKsiAtQh3kg
	 hYErq4V43UoF78oFdpUuBA9sW3uRNGy0lqJHruK//Jq5cqoWGhxfqKdCmGyUBUQ7Nz
	 ajVQT9/eicbmg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Tamura Dai <kirinode0@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	shawnguo@kernel.org,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 30/30] spi: spi-imx: Add check for spi_imx_setupxfer()
Date: Mon, 21 Apr 2025 22:15:50 -0400
Message-Id: <20250422021550.1940809-30-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021550.1940809-1-sashal@kernel.org>
References: <20250422021550.1940809-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.3
Content-Transfer-Encoding: 8bit
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

From: Tamura Dai <kirinode0@gmail.com>

[ Upstream commit 951a04ab3a2db4029debfa48d380ef834b93207e ]

Add check for the return value of spi_imx_setupxfer().
spi_imx->rx and spi_imx->tx function pointer can be NULL when
spi_imx_setupxfer() return error, and make NULL pointer dereference.

 Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
 Call trace:
  0x0
  spi_imx_pio_transfer+0x50/0xd8
  spi_imx_transfer_one+0x18c/0x858
  spi_transfer_one_message+0x43c/0x790
  __spi_pump_transfer_message+0x238/0x5d4
  __spi_sync+0x2b0/0x454
  spi_write_then_read+0x11c/0x200

Signed-off-by: Tamura Dai <kirinode0@gmail.com>
Reviewed-by: Carlos Song <carlos.song@nxp.com>
Link: https://patch.msgid.link/20250417011700.14436-1-kirinode0@gmail.com
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/spi/spi-imx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index eeb7d082c2472..c43fb496da956 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1695,9 +1695,12 @@ static int spi_imx_transfer_one(struct spi_controller *controller,
 				struct spi_device *spi,
 				struct spi_transfer *transfer)
 {
+	int ret;
 	struct spi_imx_data *spi_imx = spi_controller_get_devdata(spi->controller);
 
-	spi_imx_setupxfer(spi, transfer);
+	ret = spi_imx_setupxfer(spi, transfer);
+	if (ret < 0)
+		return ret;
 	transfer->effective_speed_hz = spi_imx->spi_bus_clk;
 
 	/* flush rxfifo before transfer */
-- 
2.39.5


