Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB263C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:01:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V50cHfNVXO7uf9mb9fH4B1oU3NTB/2Ru1jMT/LE3OM0=; b=xVkn3wqvxpjEyIVNfARkLI41i5
	bKHVt2Ug9GK3rFOEMZA5oC+4p4Hoj+694WLvJNUGY/yDyAnrpRcCN4svf4N1OL+hCEF8PBZzDdmvl
	rT2taUW8rce4hIJKYE2j63XO2mSz3PSrAWJUvIr1x+PSSTL4mibU0/a5uDNoOduo2VRDapydVegnM
	evIhRbhj1IhC3qOtjBt1rwDVfyll2UP5WrjffwJbixCi/fu1oMsS2Z/bRS07QZuu5T//zlPknPpZl
	BdKvpuw+BSvba51+MS+rVEFLbz/VJPTPBstOX0jmMekjGrgXVUmdB9BWDSAgbrnO+BHVO2FGZnuC5
	jqbNtmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMx-000000004B0-39dR;
	Thu, 13 Aug 2026 08:00:55 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMv-0000000049Y-06Q0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:00:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 896DC1A15F0;
	Thu, 13 Aug 2026 08:00:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5E70B602B8;
	Thu, 13 Aug 2026 08:00:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EAB3011C4DA82;
	Thu, 13 Aug 2026 10:00:45 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786608046; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=V50cHfNVXO7uf9mb9fH4B1oU3NTB/2Ru1jMT/LE3OM0=;
	b=beVUD+L0htQxAeOyD+aibag5BufjMqNXsaV6iGVbTrUpPVr6IVnDzn+UYLD7F8JtfghM1g
	2WtZo5RGM6ypbRBvAbFdgMHU7mcSDUFT2/koNehb3kRcmD+MIC0/9xJqA4H6Y3ZGKM8aio
	AmtdZ7rSAUjPy2GfF83Y+1/UC1oY4eeKHV1EiVPeGSBoBsrfLh/ob7KtbqP9fsjki5tRLe
	kkKLRcNAslbvtio0MDy7ZBw16Q4U+hbanuOxtJDfYnVMYIoEUYknDCP5BXzcYy3yC3izzN
	HpF7ya91N02K9H2yIlxkrbfWYkcUzLpRGRzGBINuv3mPXerdEcoQPcnN/aPK9Q==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 10:00:23 +0200
Subject: [PATCH 3/5] spi: ma35d1-qspi: Allow several command bytes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-qspi-v1-3-b217b9870eb1@bootlin.com>
References: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
In-Reply-To: <20260813-perso-ma35d1-upstream-qspi-v1-0-b217b9870eb1@bootlin.com>
To: Jacky Huang <ychuang3@nuvoton.com>, Shan-Chun Hung <schung@nuvoton.com>, 
 Mark Brown <broonie@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Steam Lin <STLin2@winbond.com>, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Miquel Raynal <miquel.raynal@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_010053_231414_07E1AFE6 
X-CRM114-Status: GOOD (  12.51  )
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

The controller is capable of sending several bytes for the command, it
does not even know this is a command. Just mimic the address steps here
to allow double byte commands, which may be needed for DTR support.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index b4fd0ab4bd31..027a9433f2b1 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -395,9 +395,6 @@ static bool nuvoton_qspi_mem_supports_op(struct spi_mem *mem,
 	    op->dummy.buswidth > 4 || op->data.buswidth > 4)
 		return false;
 
-	if (op->cmd.nbytes != 1)
-		return false;
-
 	if (op->addr.nbytes > 4)
 		return false;
 
@@ -459,8 +456,7 @@ static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
 {
 	struct spi_device *spi = mem->spi;
 	struct nuvoton_qspi *qspi = spi_controller_get_devdata(spi->controller);
-	u8 opcode = op->cmd.opcode;
-	u8 addr[4];
+	u8 cmd[2], addr[4];
 	int ret;
 	int i;
 
@@ -470,12 +466,15 @@ static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
 
 	nuvoton_qspi_mem_set_cs(spi, true);
 
+	for (i = 0; i < op->cmd.nbytes; i++)
+		cmd[i] = op->cmd.opcode >> (8 * (op->cmd.nbytes - i - 1));
+
 	ret = nuvoton_qspi_configure_bus(spi, op->cmd.buswidth, SPI_MEM_DATA_OUT,
 					 op->max_freq);
 	if (ret)
 		goto out_deassert_cs;
 
-	ret = nuvoton_qspi_txrx(qspi, &opcode, NULL, 1);
+	ret = nuvoton_qspi_txrx(qspi, cmd, NULL, op->cmd.nbytes);
 	if (ret)
 		goto out_deassert_cs;
 

-- 
2.54.0


