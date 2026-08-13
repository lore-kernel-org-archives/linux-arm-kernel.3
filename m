Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB6C8C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:00:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mj1W4Xh6Pt/T1x73ejVnasGPl6YiZcBTAo3uVZZ4NOU=; b=gAgobavU5A0yldm1uZ709RIZYc
	eC49aEQLGhnAFOdq9S46ovTa+OaWRbH66NO0WI50ES+FCjQktQmpkplZeg3G4DaxXGIBBeo/0n9uG
	KVimSpwjT7QDLKtPCTS/QOArGBoZD2F0dS3cLUNCNakGp7F/b51QdsH7jA91JUVHWur+3OfXzDwc/
	6n8J2PDv9MGUNIEpuWLoC4mnQOVHUVjY8GtPJF227KcMjz1tJevK/tVupdCAJR/3kMFbM1qYamCDa
	0OnzyL4z3dwUn3kNbv/6UXdj2MbKkxUEkgNKGjOj5LVn2UV/yC9Jda6NIDgi+jTWiViTcz7Br1Ksx
	6+SYcAlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMn-0000000046B-1gSC;
	Thu, 13 Aug 2026 08:00:45 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQMl-0000000044i-0tSq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:00:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id DDD6A1A15F0;
	Thu, 13 Aug 2026 08:00:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B08EA602B8;
	Thu, 13 Aug 2026 08:00:40 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 5993711C4DA89;
	Thu, 13 Aug 2026 10:00:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786608036; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=Mj1W4Xh6Pt/T1x73ejVnasGPl6YiZcBTAo3uVZZ4NOU=;
	b=Bb1b5FEIZYGBz0uAdmssUhx5XFWabH/TcHg7k5nqBIOsBpbBvirf22v69K97X7FgdzXckZ
	flVYaixqOcd9U/A7oMi3o6gCvy1tTIg/d7araEKDUgVSYtUM1p8Upfe5j2saWulaJtfMPP
	08ZWLAXw9Xa2GyB5JeBddmOJ/PwYXTSqqoNlxEXeWblu4HltHCt2TF8h5hKxj2zx8kWCC5
	6ibH3Yti1balIiHyYxai+ClTjjR6mSObVqro60SRz109Ild5duXolQhFOoP7Aor/hibQ2V
	0fqErLPm1hLZ/Kf/u/K5X8hjN3CwFZFRKwCKs7SyhpHGp0WuVcPwSzY85PWkHA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 10:00:21 +0200
Subject: [PATCH 1/5] spi: ma35d1-qspi: Remove redundant reset operation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-qspi-v1-1-b217b9870eb1@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_010043_398912_DB4D8554 
X-CRM114-Status: UNSURE (   8.45  )
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

The bus width is always set before every operation, no need to reset it
manually at the end of each transfer.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 541d5d72484c..929546dbe38f 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -502,7 +502,6 @@ static int nuvoton_qspi_mem_exec_op(struct spi_mem *mem,
 	}
 
 out_deassert_cs:
-	nuvoton_qspi_set_bus_width(qspi, 1, SPI_MEM_DATA_IN);
 	nuvoton_qspi_mem_set_cs(spi, false);
 
 	return ret;
@@ -556,7 +555,6 @@ static int nuvoton_qspi_transfer_one(struct spi_controller *ctlr,
 	nuvoton_qspi_set_bus_width(qspi, buswidth, dir);
 	ret = nuvoton_qspi_txrx(qspi, xfer->tx_buf, xfer->rx_buf,
 				xfer->len);
-	nuvoton_qspi_set_bus_width(qspi, 1, SPI_MEM_DATA_IN);
 
 	return ret;
 }

-- 
2.54.0


