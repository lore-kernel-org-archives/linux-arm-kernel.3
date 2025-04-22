Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B471C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 02:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OEeeeBSDENMjkniu0gWFa/1DoLJbqVHuMeI87zg2SrE=; b=3vMru59nKge3Et59abYCkQShVz
	HQiWGkSZrg35iYfvmqtJUaD6yTsQBCrTeTkqub4g0B/8giyTpObhxmzq5BRlgWG1yiewhLzqwyVTi
	HezDexRyC2rVByCf1oby41JnUD+JzkUZncNvMYq5pmHNQxx3FRwfQiqBE420I/yhUqT9KtR9lM18c
	HOL0sg5Nx6xG+l2YH3gldODyGhSUKsEggAYjkJyqmnQyf8pXUBDbXoX5uaqA07Ey85csMJQRSU4SG
	H/hPh5czlMi9Zlk7d00bdSCXmFjsq44wnUmjScGS5z90tpDlUC0R6oHA6qF+Vnta4QDIRCZuM7JkW
	01Td4DZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73Xv-00000005f4w-1WZr;
	Tue, 22 Apr 2025 02:39:39 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u73DO-00000005Zh3-3MJH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 02:18:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3FE6D5C5A77;
	Tue, 22 Apr 2025 02:16:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF86C4CEED;
	Tue, 22 Apr 2025 02:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745288306;
	bh=bEd4sUQUoqmZzswyiTFMd5iftM52xvaorbTZ3pRmocY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J2VqOKl9gkwoIIbhzA/TlekVSpcqvver+YXXlfkTe2L8yo7ntVL5Bk9p+xLORWDAZ
	 rmoLsRbYg2+R0em23VCz+5Bii7NFfyuiqRX09wAAIhi3PLTx4a9/PqdbF2k04ucwst
	 HVv2spHIQgZCQMacHOOf+KOcpo5tUZ5rDHXduyZoe5lgZw5OEea/F7z6KUU3MUuxgF
	 GbVUlxvEv5eyGPghbBPmbU0oSAVG35Ryl/tJyJZyTOnSt/LRyJLifdirN9ynn8ou9H
	 UheFh+9uh5YMgarPtX0lLBiYaM0qkReSl3f+yi/FrkfFvY2+1PJETgZvE56MOVZWtB
	 RRPRUoO3K/rXw==
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
Subject: [PATCH AUTOSEL 6.6 15/15] spi: spi-imx: Add check for spi_imx_setupxfer()
Date: Mon, 21 Apr 2025 22:17:59 -0400
Message-Id: <20250422021759.1941570-15-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250422021759.1941570-1-sashal@kernel.org>
References: <20250422021759.1941570-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.6.87
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_191826_884690_2646F1B9 
X-CRM114-Status: GOOD (  12.87  )
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
index daa32bde61556..da4442954375b 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -1614,10 +1614,13 @@ static int spi_imx_transfer_one(struct spi_controller *controller,
 				struct spi_device *spi,
 				struct spi_transfer *transfer)
 {
+	int ret;
 	struct spi_imx_data *spi_imx = spi_controller_get_devdata(spi->controller);
 	unsigned long hz_per_byte, byte_limit;
 
-	spi_imx_setupxfer(spi, transfer);
+	ret = spi_imx_setupxfer(spi, transfer);
+	if (ret < 0)
+		return ret;
 	transfer->effective_speed_hz = spi_imx->spi_bus_clk;
 
 	/* flush rxfifo before transfer */
-- 
2.39.5


