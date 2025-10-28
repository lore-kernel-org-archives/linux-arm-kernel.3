Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46ADACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 07:37:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Hbgp8bd/DeeOTuugPgZrEt/sqnKL0G9WqhIRxBy9gs=; b=BCUxXgV0qa+aVztlWHfnMt0ZNR
	6/GmauTpzv/TDODGKFyY5EQsNHImsOfGFm1TlWvtSbHqWnyW1ILrk1WP5zmUc4Nr06saoDQADMxFg
	kyJW5G6g+tvwyLSirj6U8i/jXdm5p4khmXoxSPbBjHbqBl8gOOgMA23qOSrBWtjQiEdHJSV3EB08J
	n3FCVT53ajePl9hlqv1eOchFd4P5CnO2Lz3U4xrAYE5iemQZSNc+FhbbmvSnOzWR1nMYqUo9b1ElG
	fhtXTTAz3eF0RtkAaYwMtnOzMVerU1MX+eNTBX+eWgjAq2p7I5aeEwqSonRi7k+SB6opHzJnQfvcN
	IXIva8NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeGR-0000000FRaB-46pL;
	Tue, 28 Oct 2025 07:37:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDeFw-0000000FQuR-21Z7
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 28 Oct 2025 07:36:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=7Hbgp8bd/DeeOTuugPgZrEt/sqnKL0G9WqhIRxBy9gs=; b=YuvPCblMHci+1Mj1XvSVE4dyZE
	NhNYW2T5RRG2ROl3C2MwTzSL4hS6IXNW2w1J3Mxp2q/RGsQH3CqaSihRVu4aDiDBmVK/cu4mz7XU8
	piXu2UtNZ4xTormvvofdm/uAZuPFclXyHAtbzWCIWPSjys4rCEJgLAiB4dVRCnLsRTCzR2/lv8Ro+
	/Gmzka0ValhLdKHf2T/MUdBofSv21Vl2I6C0ob4hT7kvvDmFuugZbkVtyt4Obq91eh/pCrmNrn0f7
	BDlTm3CHbXHUbochbP5wRRlmJqmFVklINfMfP69VblmYV3bF5UIALLcPgwbx/SNA03mwxCY++aihy
	ZQP8r2ag==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDdO8-00000003p2Q-1zXN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Oct 2025 06:41:03 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 652234E41392;
	Tue, 28 Oct 2025 07:36:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 34F5C606AB;
	Tue, 28 Oct 2025 07:36:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 848B7102F2511;
	Tue, 28 Oct 2025 08:36:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761636990; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=7Hbgp8bd/DeeOTuugPgZrEt/sqnKL0G9WqhIRxBy9gs=;
	b=pwm5w9qBLnOQqhM0uXGJP49ujZ0+/phFyHsLoukSxchAoAEfQHXh9LprjNuAwJaOtDE9IR
	Ga2g7+2k3wvXAn1wgMKmo0qanzGaGQ2xj7sFEvREytD4N9EKn0oqDgFsN8of+WA35xQLBr
	g1G/pEMJgaIPqz/TQu2F5i5A9QLiyGuQJnDPLL8ygFPTS5p/7JDb6T83ia0HtqhzTarDge
	MwcSZfHjGOMBwm8CsCxbZsGUebu6xmRH/nBgILxFVxesa0qCz/xn5aTY4t+HUOFWDDBwQ5
	WkkUh7H2XulC8R4iBRyTD5hniLVzkso/gSUp0kl1vRVrG6IMkVJPKrLvN6EtrA==
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
Subject: [PATCH v4 14/16] mtd: rawnand: sunxi: introduce sram_size in sunxi_nfc_caps
Date: Tue, 28 Oct 2025 08:35:07 +0100
Message-ID: <20251028073534.526992-15-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251028073534.526992-1-richard.genoud@bootlin.com>
References: <20251028073534.526992-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_064100_632618_79EAB77B 
X-CRM114-Status: GOOD (  13.27  )
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
index 0a9ac75bb229..5e030fc2fde5 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -167,8 +167,6 @@
 
 #define NFC_DEFAULT_TIMEOUT_MS	1000
 
-#define NFC_SRAM_SIZE		1024
-
 #define NFC_MAX_CS		7
 
 /*
@@ -251,6 +249,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
  * @nstrengths:		Size of @ecc_strengths
+ * @sram_size:		Size of the NAND controller SRAM
  */
 struct sunxi_nfc_caps {
 	bool has_mdma;
@@ -269,6 +268,7 @@ struct sunxi_nfc_caps {
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
+	int sram_size;
 };
 
 /**
@@ -506,7 +506,7 @@ static void sunxi_nfc_read_buf(struct nand_chip *nand, uint8_t *buf, int len)
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, NFC_SRAM_SIZE);
+		cnt = min(len - offs, nfc->caps->sram_size);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -544,7 +544,7 @@ static void sunxi_nfc_write_buf(struct nand_chip *nand, const uint8_t *buf,
 	while (len > offs) {
 		bool poll = false;
 
-		cnt = min(len - offs, NFC_SRAM_SIZE);
+		cnt = min(len - offs, nfc->caps->sram_size);
 
 		ret = sunxi_nfc_wait_cmd_fifo_empty(nfc);
 		if (ret)
@@ -1871,7 +1871,7 @@ static int sunxi_nfc_exec_subop(struct nand_chip *nand,
 		case NAND_OP_DATA_OUT_INSTR:
 			start = nand_subop_get_data_start_off(subop, i);
 			remaining = nand_subop_get_data_len(subop, i);
-			cnt = min_t(u32, remaining, NFC_SRAM_SIZE);
+			cnt = min_t(u32, remaining, nfc->caps->sram_size);
 			cmd |= NFC_DATA_TRANS | NFC_DATA_SWAP_METHOD;
 
 			if (instr->type == NAND_OP_DATA_OUT_INSTR) {
@@ -2252,6 +2252,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
+	.sram_size = 1024,
 };
 
 static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
@@ -2271,6 +2272,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
+	.sram_size = 1024,
 };
 
 static const struct of_device_id sunxi_nfc_ids[] = {
-- 
2.47.3


