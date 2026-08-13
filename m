Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B36C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zj84OFZz5gnRYignK4t6ga1YzryGPYdWrXYJ76F0Jgc=; b=gmnj/c8Mb9xTzEfMxVvw0bkAdi
	nKpyMdZf49inqmHTNCETwtvH3tCIEqMU4t1lLukP695vBNdzC3w1mY0qyUJNrB5SYkTlVYQHkZ1ou
	nsMmb9juwohlGUBdJD6MBMizewt2rMZT3aeZXMs1i9wFZhIVusdNdwKUUj/gN8YO4uIE9c+uz07kA
	L50GSDXCYFnH5G9A8fTHGdJe8O7zOMBNtOFmGlW3ubdnSv8fpAkrYDR87pCRaLvUnwIqaAsAUZrvJ
	1JyND8JxSfJD3oYCRPMAEwriEKLLitBO+MGpW+mrtcXY20qlP9pbBduPLpLFjAsKHzmxpjNb1ErYF
	pfB4HKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQNA-000000004IW-0VnT;
	Thu, 13 Aug 2026 08:01:08 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQN6-000000004Ga-3obQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:01:06 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 74CAC1A15F0;
	Thu, 13 Aug 2026 08:01:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 49918602B8;
	Thu, 13 Aug 2026 08:01:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 81A9511C4DA8E;
	Thu, 13 Aug 2026 10:00:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786608058; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zj84OFZz5gnRYignK4t6ga1YzryGPYdWrXYJ76F0Jgc=;
	b=1dB4TCyirgki1jlciw49iYZSNvLXgM7koNktnDBZ611HsvioCX0gRZAiKyKx9a40KIbJC/
	JHoUGwNV77a/Vw4/88K5I9nyU3kzvgsfoaS1T/ffkUBxx7FBsnUqSIquXB8VoJs5mQZSSC
	dEoBEQXLKsZ60ZbvnkGixXC6XTgWl8jepBtTD8WaCxi6M97cmLaCQqSo/K9pQhKxuRrrho
	4MlCbI1EMeH/Bg7VnRS8D5+BqfWOQesZ92bar/EEMS9eJ29+AFcZZzoTmHrs4oUlmQo8WX
	p+7WJGxXy5fBaSATaYUFno78WuIdzSmPXx4eQPfMbac+8F8LrjETyusVy2zmDg==
From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Thu, 13 Aug 2026 10:00:25 +0200
Subject: [PATCH 5/5] spi: ma35d1-qspi: Use the existing update helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260813-perso-ma35d1-upstream-qspi-v1-5-b217b9870eb1@bootlin.com>
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
X-CRM114-CacheID: sfid-20260813_010105_096212_733CCA89 
X-CRM114-Status: UNSURE (   9.09  )
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

Read modify writes are already covered by a local helper, so use it.

No functional change.

Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 drivers/spi/spi-ma35d1-qspi.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/spi/spi-ma35d1-qspi.c b/drivers/spi/spi-ma35d1-qspi.c
index 9965a11573d8..7f938d0c6f1f 100644
--- a/drivers/spi/spi-ma35d1-qspi.c
+++ b/drivers/spi/spi-ma35d1-qspi.c
@@ -115,10 +115,11 @@ static int nuvoton_qspi_reset_fifo(struct nuvoton_qspi *qspi)
 {
 	u32 val;
 
-	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_FIFOCTL_OFFSET);
-	val |= NUVOTON_QSPI_FIFOCTL_TXRST_MASK |
-	       NUVOTON_QSPI_FIFOCTL_RXRST_MASK;
-	nuvoton_qspi_write(qspi, val, NUVOTON_QSPI_FIFOCTL_OFFSET);
+	nuvoton_qspi_update_bits(qspi, NUVOTON_QSPI_FIFOCTL_OFFSET,
+				 NUVOTON_QSPI_FIFOCTL_TXRST_MASK |
+				 NUVOTON_QSPI_FIFOCTL_RXRST_MASK,
+				 NUVOTON_QSPI_FIFOCTL_TXRST_MASK |
+				 NUVOTON_QSPI_FIFOCTL_RXRST_MASK);
 
 	/*
 	 * Give the controller a short time to latch the FIFO reset request
@@ -356,9 +357,9 @@ static int nuvoton_qspi_hw_init(struct nuvoton_qspi *qspi)
 				 NUVOTON_QSPI_CTL_LSB_MASK,
 				 NUVOTON_QSPI_CTL_TXNEG_MASK);
 
-	val = nuvoton_qspi_read(qspi, NUVOTON_QSPI_CTL_OFFSET);
-	nuvoton_qspi_write(qspi, val | NUVOTON_QSPI_CTL_SPIEN_MASK,
-			   NUVOTON_QSPI_CTL_OFFSET);
+	nuvoton_qspi_update_bits(qspi, NUVOTON_QSPI_CTL_OFFSET,
+				 NUVOTON_QSPI_CTL_SPIEN_MASK,
+				 NUVOTON_QSPI_CTL_SPIEN_MASK);
 
 	ret = readl_poll_timeout(qspi->regs + NUVOTON_QSPI_STATUS_OFFSET, val,
 				 (val & NUVOTON_QSPI_STATUS_SPIENSTS_MASK),

-- 
2.54.0


