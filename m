Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F12DCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 09:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HnnG9FAo9t009uu90C/CT6JGmA+az9Y3sKnZeAWU8yk=; b=PzyzWs/Tlf0J1WDc+RHPqfP6cj
	udtrfciTLebYCnF3ack9Ut2+5Dk5wtyzdZFJCReDQ8xxLXmQvzUgtnqH+dHweWah9UjQ71Y0yvD8U
	nv8RiqirxbzJ+oyCy2s+dcEl4OZEst/00u4Ctc18NDLNS3qd3GiI9lOh2RX/eFzsll5tPLOZxfa0f
	0mkvPMXsirdNISZ9P8miW9yC3Z+SpL9sRdNy3nnTXffgu+tevU4CYjpY84BYiBmLlNhWpQNQRq4T2
	Wx398a+v6Ceho6vVFCcILxWWFUJFYmoeAkiJiCIX6Rvlqjx+Ou7bL1scoYG8GGFBW//6iXAudQsPg
	q0qk1XWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOujA-0000000F7Hh-04Li;
	Mon, 18 May 2026 09:57:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuj9-0000000F7HB-0HXe
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 18 May 2026 09:57:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HnnG9FAo9t009uu90C/CT6JGmA+az9Y3sKnZeAWU8yk=; b=PwQ7VYSKYFQSq36Z5PoO3/cHH9
	K0LYjT+iYa7IGaf87cgbKUvqeG5w4TN6uNWEJEurERlgTzzup6uw7FoKvDYK4Jh9CUzQTgoXn4goP
	uqaExdM8ZY9uBfRBkguxO8vurkqlaMXJihk6df8rItaKtyjCFMMaGkaX2gfDLRkTyXA5jmZrSQKva
	x0JrjAnc1gV2VhmPjSkvp+7Sc163JnHLVAa58tLV3DyzdRJCJYzNa7sX2eYBFpSaGV72631m4E13x
	EQ2hS7dbe2fyHl72BW5pAHrbyjdBJZNNzBRuHKrSO1PsvErVA/V/SCzw2d7KdjfIXGVa1Y1CNB4jb
	Hws4te4g==;
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOuj1-0000000AfBu-11sY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 09:57:33 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Mon, 18 May
 2026 17:57:08 +0800
Received: from aspeedtech.com (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Mon, 18 May 2026 17:57:08 +0800
From: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
To: <clg@kaod.org>, <broonie@kernel.org>, <joel@jms.id.au>,
	<andrew@codeconstruct.com.au>, <linux-aspeed@lists.ozlabs.org>,
	<openbmc@lists.ozlabs.org>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<BMC-SW@aspeedtech.com>
CC: kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] spi: aspeed: Fix missing __iomem annotation in output transfer path
Date: Mon, 18 May 2026 17:57:07 +0800
Message-ID: <20260518095708.2502537-2-chin-ting_kuo@aspeedtech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
References: <20260518095708.2502537-1-chin-ting_kuo@aspeedtech.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_105727_755354_60725F0A 
X-CRM114-Status: GOOD (  11.00  )
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

The dst parameter of aspeed_spi_user_transfer_tx() is an MMIO address
obtained from chip->ahb_base, but it was typed as void * instead of
void __iomem *.  This caused a sparse warning report. Fix the
parameter type to void __iomem * and drop the now-unnecessary
cast at the call site.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202605180441.uD3toFRJ-lkp@intel.com/
Signed-off-by: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>
---
 drivers/spi/spi-aspeed-smc.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/spi-aspeed-smc.c b/drivers/spi/spi-aspeed-smc.c
index c21323e07d3c..808659a1f460 100644
--- a/drivers/spi/spi-aspeed-smc.c
+++ b/drivers/spi/spi-aspeed-smc.c
@@ -891,7 +891,7 @@ static int aspeed_spi_user_unprepare_msg(struct spi_controller *ctlr,
 static void aspeed_spi_user_transfer_tx(struct aspeed_spi *aspi,
 					struct spi_device *spi,
 					const u8 *tx_buf, u8 *rx_buf,
-					void *dst, u32 len)
+					void __iomem *dst, u32 len)
 {
 	const struct aspeed_spi_data *data = aspi->data;
 	bool full_duplex_transfer = data->full_duplex && tx_buf == rx_buf;
@@ -936,7 +936,7 @@ static int aspeed_spi_user_transfer(struct spi_controller *ctlr,
 			aspeed_spi_set_io_mode(chip, CTRL_IO_QUAD_DATA);
 
 		aspeed_spi_user_transfer_tx(aspi, spi, tx_buf, rx_buf,
-					    (void *)ahb_base, xfer->len);
+					    ahb_base, xfer->len);
 	}
 
 	if (rx_buf && rx_buf != tx_buf) {
-- 
2.34.1


