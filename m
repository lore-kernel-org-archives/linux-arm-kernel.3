Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 502DCCCD187
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Oct 2025 08:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lW1eckNNd4gUWt6X3y+zdKi8wIuDsKB6Px2Lg2bPV3A=; b=IPJRHCJKlalB2WrRS1CRT6P6s6
	xOUWP9x2P+4FD7cf/q0epZoVtW0Y7ZWIQQAnCiHX943BVeq1uh98kKDgvQ4mWq2LQWyXus2Tr0SoT
	p5Xnv42CB+sq7wk4FQm0tAonLXYGCQGf/KyduWetpH9Dam1lCHKhiWVKuv3R7Jo7+gMEWLcbDznNx
	blLPh5AC3DbrULSANCjKYkjfMPHwoyOZHUVmJnMpXLg3Qrzp3OngMUqeTOYcu5W0hmaZJsrdM23mc
	P1zTWz1PzoD3V+YrswQG0OGtIaC2IUcNayNWS4CIXUZvs7NmT9lyjH6WTuRtaJmpO/hwD38TjGwC2
	EJQhE5Tw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78hC-000000081e4-1dBu;
	Fri, 10 Oct 2025 08:41:50 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v78h8-000000081Um-3FMB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Oct 2025 08:41:48 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 4E0F04E40FCD;
	Fri, 10 Oct 2025 08:41:45 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2464160667;
	Fri, 10 Oct 2025 08:41:45 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 01C7B102F2208;
	Fri, 10 Oct 2025 10:41:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1760085703; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=lW1eckNNd4gUWt6X3y+zdKi8wIuDsKB6Px2Lg2bPV3A=;
	b=LpU9p1ffpGEUeYTIuGZkdQj3DKkIaaHGucVWXc3d0Gi4Ns0Km0feYRSJTofCozJeQozaj2
	Be1IYEumru8wNU5eYF7dsZi207ezDL5VO6BWQ1zNXF35AoJX3Rm4o7VCGdA0Go7kqhZxJt
	V7hUrMTU/+Z2AeVWc0Ts1U3mw5mqG8vtCe6HvtwjCAjPN+Uhcb66TuI5kh71Zp+Xng1Uwy
	EijpeIo6uHMjV9TU3MxU2nATzwJDh4LRy5nULNT/xCLKXLZDIHbUFysBWAKVuZuwWm9JWv
	sXnW6Nco7YQ3BZJwa5DMnkAn0h+NY7CyFdivdpq+an/pLkuxJ9M19Ii3RJmkhg==
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
Cc: Wentao Liang <vulab@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-mtd@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Richard Genoud <richard.genoud@bootlin.com>
Subject: [PATCH 06/15] mtd: nand: sunxi: introduce reg_user_data in sunxi_nfc_caps
Date: Fri, 10 Oct 2025 10:40:33 +0200
Message-ID: <20251010084042.341224-7-richard.genoud@bootlin.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251010084042.341224-1-richard.genoud@bootlin.com>
References: <20251010084042.341224-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_014146_969625_BEF17A61 
X-CRM114-Status: GOOD (  12.85  )
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

The H6/H616 USER_DATA register is not at the same offset as the
A10/A23 one, so move its offset into sunxi_nfc_caps

No functional change.

Signed-off-by: Richard Genoud <richard.genoud@bootlin.com>
---
 drivers/mtd/nand/raw/sunxi_nand.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/mtd/nand/raw/sunxi_nand.c b/drivers/mtd/nand/raw/sunxi_nand.c
index faaac71e7be3..6c78370a6095 100644
--- a/drivers/mtd/nand/raw/sunxi_nand.c
+++ b/drivers/mtd/nand/raw/sunxi_nand.c
@@ -48,7 +48,8 @@
 #define NFC_REG_DEBUG		0x003C
 #define NFC_REG_A10_ECC_ERR_CNT	0x0040
 #define NFC_REG_ECC_ERR_CNT(nfc, x)	((nfc->caps->reg_ecc_err_cnt + (x)) & ~0x3)
-#define NFC_REG_USER_DATA(x)	(0x0050 + ((x) * 4))
+#define NFC_REG_A10_USER_DATA	0x0050
+#define NFC_REG_USER_DATA(nfc, x)	(nfc->caps->reg_user_data + ((x) * 4))
 #define NFC_REG_SPARE_AREA	0x00A0
 #define NFC_REG_PAT_ID		0x00A4
 #define NFC_REG_MDMA_ADDR	0x00C0
@@ -214,6 +215,7 @@ static inline struct sunxi_nand_chip *to_sunxi_nand(struct nand_chip *nand)
  *			through MBUS on A23/A33 needs extra configuration.
  * @reg_io_data:	I/O data register
  * @reg_ecc_err_cnt:	ECC error counter register
+ * @reg_user_data:	User data register
  * @dma_maxburst:	DMA maxburst
  * @ecc_strengths:	Available ECC strengths array
  * @nstrengths:		Size of @ecc_strengths
@@ -222,6 +224,7 @@ struct sunxi_nfc_caps {
 	bool has_mdma;
 	unsigned int reg_io_data;
 	unsigned int reg_ecc_err_cnt;
+	unsigned int reg_user_data;
 	unsigned int dma_maxburst;
 	const u8 *ecc_strengths;
 	unsigned int nstrengths;
@@ -723,8 +726,8 @@ static void sunxi_nfc_hw_ecc_get_prot_oob_bytes(struct nand_chip *nand, u8 *oob,
 {
 	struct sunxi_nfc *nfc = to_sunxi_nfc(nand->controller);
 
-	sunxi_nfc_user_data_to_buf(readl(nfc->regs + NFC_REG_USER_DATA(step)),
-				   oob);
+	sunxi_nfc_user_data_to_buf(readl(nfc->regs +
+					 NFC_REG_USER_DATA(nfc, step)), oob);
 
 	/* De-randomize the Bad Block Marker. */
 	if (bbm && (nand->options & NAND_NEED_SCRAMBLING))
@@ -746,7 +749,7 @@ static void sunxi_nfc_hw_ecc_set_prot_oob_bytes(struct nand_chip *nand,
 	}
 
 	writel(sunxi_nfc_buf_to_user_data(oob),
-	       nfc->regs + NFC_REG_USER_DATA(step));
+	       nfc->regs + NFC_REG_USER_DATA(nfc, step));
 }
 
 static void sunxi_nfc_hw_ecc_update_stats(struct nand_chip *nand,
@@ -2181,6 +2184,7 @@ static const u8 sunxi_ecc_strengths_a10[] = {
 static const struct sunxi_nfc_caps sunxi_nfc_a10_caps = {
 	.reg_io_data = NFC_REG_A10_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
+	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.dma_maxburst = 4,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
@@ -2190,6 +2194,7 @@ static const struct sunxi_nfc_caps sunxi_nfc_a23_caps = {
 	.has_mdma = true,
 	.reg_io_data = NFC_REG_A23_IO_DATA,
 	.reg_ecc_err_cnt = NFC_REG_A10_ECC_ERR_CNT,
+	.reg_user_data = NFC_REG_A10_USER_DATA,
 	.dma_maxburst = 8,
 	.ecc_strengths = sunxi_ecc_strengths_a10,
 	.nstrengths = ARRAY_SIZE(sunxi_ecc_strengths_a10),
-- 
2.47.3


