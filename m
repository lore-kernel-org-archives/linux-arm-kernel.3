Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5ECCCD183
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Oct 2025 15:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/q4xGfH4m3Ql1gXYgaW0vYtiX8lDvyiypoqOC+0139Y=; b=MP89/Ntxb9pZXtDHq0coIBkPlq
	cRs5+zoBT0PfYqPO6Vv2dBaPv2CQOuVESSETIW5rZPo64c94db1KttgBQBn7lO/uTKIA5phJNW5fj
	YTMTqA36Lw0s6oMtbW6NZQZ5EdVzXuUTrb8p6JR9zIqYdJonG7xHjfaU5z9RpJZxySrmBC3dLjx1O
	Tw8TJi6uiDh4Ve7ZmlUSwQc7lgaBILJkRoZuCDhw1jaRnykwpCSVy+PoZ6yEAyuQF85jinwalP29a
	R4pPnt+yBR4XRHWrscVhhRbSI1or9x2jxU5GqsbbM3fH/obf1GMip7a/toAKzi34ukbGKhNmY+XPz
	caJxV1rA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTZ-0000000DflV-3Sxm;
	Mon, 13 Oct 2025 15:28:41 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTW-0000000Dfez-1Hs6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 13 Oct 2025 15:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/q4xGfH4m3Ql1gXYgaW0vYtiX8lDvyiypoqOC+0139Y=; b=OfzFf8v1r+5fNQ4UnMZfm1/XF/
	3qKj9MJ9o91nRi4zr75aNULvsKLBdu7VwOMsoi6P16f31b3ElN9Cpes1FaokOFNigMQnmAyzm1tQz
	iOwTVMLnN9HJar3nIXvJHBAMFIxKafR8N0QQ98HTtmATzihGHIG78vFuwW/Y7DvXS+O84/XhC15q7
	mfQlInLq2hbQzUe23u0to7QHlCJUEnpngV0sZTj5DhoQV7xRnwbsaI4XH5Q9PYeYCfnLJq4uBw1S8
	PMPGso7DV8CO0xskc+5eDFzWUnI41ZtmxIo5Dc892FlbeUueUURSD73IenYSTn04sDLE40iR1iwD6
	n4QUTKtA==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KTC-00000008iX3-2fNQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Oct 2025 15:28:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 07D034E4106D;
	Mon, 13 Oct 2025 15:27:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D23BD6067B;
	Mon, 13 Oct 2025 15:27:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 72644102F2273;
	Mon, 13 Oct 2025 17:27:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760369276; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=/q4xGfH4m3Ql1gXYgaW0vYtiX8lDvyiypoqOC+0139Y=;
	b=XVu2VPnNaTm3Fgzz8f0iY7FlLZ/7Bc+ElHBSeRdPxXxz0v7fHYig0z1odwTjmNw/rrdcEp
	sbMUUhAjIxNVzYtnE2CPaV+G3UyZNajOhZkUxhI8Hzkl8llNW/jdSJbMGarrcMzxmf8Tef
	RUC8EQ2UIGlIQ7vjzaowFxPVr6z++SRb6JHUN6+8U92c8T66CZWyY9DLQb3RO7omYTZDD6
	RUcxb/2UMrSvSkp6AhkkHvR3WplnMMf/9tJrENtbR7NjIUMTVL8IQ6SRn8bIPdz++NEngO
	ZrY6eKFOj1okYxJRt83DHgVkL8PHA58XH6rt16qzksB/gAf2zluCouBL+/+hnA==
From: Richard Genoud <richard.genoud@bootlin.com>
To: Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Wentao Liang <vulab@iscas.ac.cn>,
	Johan Hovold <johan@kernel.org>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH v2 12/15] mtd: rawnand: sunxi: introduce sram_size in sunxi_nfc_caps
Date: Mon, 13 Oct 2025 17:26:42 +0200
Message-ID: <20251013152645.1119308-13-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013152645.1119308-1-richard.genoud@bootlin.com>
References: <20251013152645.1119308-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_162820_758799_622E3F7C 
X-CRM114-Status: GOOD (  13.46  )
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

The H6/H616 the SRAM is bigger than the A10/A23 one, so move its size
into sunxi_nfc_caps.

No functional change

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index 3de5642c05a8..e69fb0ac22b8 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -167,8 +167,6 @@
 
 #define NFC_DEFAULT_TIMEOUT_MS	1000
 
-#define NFC_SRAM_SIZE		1024
-
 #define NFC_MAX_CS		7
 
 /**
@@ -240,6 +238,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
  * @nstrengths:		Size of @ecc_strengths
+ * @sram_size:		Size of the NAND controller SRAM
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -258,6 +257,7 @@ struct sunxi_nfc_caps {
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
+	int sram_size;
 };
 
 /**
@@ -495,7 +495,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, NFC_SRAM_SIZE);
+		cnt = min(len - offs, nfc->caps->sram_size);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -533,7 +533,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, NFC_SRAM_SIZE);
+		cnt = min(len - offs, nfc->caps->sram_size);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -1861,7 +1861,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_DATA_OUT_INSTR:
 			start = nand_subop_get_data_start_off(subop, i);
 			remaining = nand_subop_get_data_len(subop, i);
-			cnt = min_t(u32, remaining, NFC_SRAM_SIZE);
+			cnt = min_t(u32, remaining, nfc->caps->sram_size);
 			cmd |= NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
 
 			if (instr->type == NAND_OP_DATA_OUT_INSTR) {
@@ -2242,6 +2242,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
+	.sram_size = 1024,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2261,6 +2262,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
+	.sram_size = 1024,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {

