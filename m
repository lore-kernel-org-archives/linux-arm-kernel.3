Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64439E77187
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 15:21:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=35TdKF9xDxkqp6uln8CnmJYPKimTUINBXZjiZq/HaBI=; b=xPQp4eTQUIVc0O
	jXvZUoI3RCOLSsFYv9jCQcA7lrxx04aU94rW8ym/OhJpmFVHnTlyf9UvnRBQvImWavdxoWzhvHDiC
	B2+fZbuQ0PqkB9BGH6S2TTmZ763NLG+SAdWhTepemEnriHFUqNmQh5JijkM9SEouxfJ/3oHKjixh7
	U9DOPhtZjOLea7QgB9peyecWgXkoz9d89hwO8WL7oniavmZjLR5LsP6fDMHqQVR4iM8CzLJkoEEkx
	purlbqR2yPumk7Cv1HxWBkGesTw3vaAIfdEx+CJaN6j7mRtACA+xLGYkk8Snc2vPKcl06QZAdmdnL
	25leYGK8r70S/j3OSEtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvr5-0000000H02l-1SET;
	Wed, 18 Dec 2024 15:20:55 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNvox-0000000Gzc5-3oKz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 15:18:45 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 7C5B0A036D;
	Wed, 18 Dec 2024 16:18:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=35TdKF9xDxkqp6uln8CnmJYPKimTUINBXZjiZq/HaBI=; b=
	j4pPMJ5civtDA/9KeXa1DedmpdnUbqQxUC+3CHdutarAMqup3QOMG7dxQR7Au3X2
	wxiJaxqWXhQRA+NpIzrOti8Zi0CcZ04XQMQ9YsYp5eLdJauaFvMNumTi6o3QkCx7
	KeDzO6n29SmTG3EzvTRBvP8v8M6Wgm2ka32HChCX7qJA2SVuUiHKFsgoBB3WIzDV
	VhxpCbqjjY3lUcS9EXFJ8RxR38OUG8uchATLHv5K3GEybmoYvu6rD/hi96tjIuj5
	nwRO3bqx6rxzF2VlbBrQnJ8QV8V9PmIbOq8rQX0tzkoWndp/06obn/kyR1ljJoVW
	JG8tVbFdUSAV6c0HW1KKHdE+hBJOHKTjNe6HMQJzjkjVSRnozKNdf7r8TzGoMlEI
	fZTaKpgqh6z3YGSLX+VRyDrz5RTpyDt+hvejwSFgxHyQdNfP9VId1rKgBlZRdxwJ
	uZjn/sJFup+mvFN5lkAmDPtDsU7Fs1vNQ4J/J270JXbuAO1LCaE4L+cd/Ee5ZGb1
	1gRsx4OfcmMKMrg4BhRBiqwuOygHPaODf8MmJ8fW5Ln6K0S3+EJyHa2h54dspxOY
	IR26IqFT+kHp+gw9GQna3Jo+WFJIwMQknB6dLFwbrmW7EkzfNNqimkDEh16bktBa
	NlnQKfxC3Vokc4mAfaPoATxxVxiJ/15HfzGm5cmQ3EA=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Mark Brown <broonie@kernel.org>, =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?=
	<csokas.bence@prolan.hu>, Varshini Rajendran
	<varshini.rajendran@microchip.com>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] spi: atmel-quadspi: Factor out switching to Serial Memory Mode to function
Date: Wed, 18 Dec 2024 16:17:54 +0100
Message-ID: <20241218151754.365519-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1734535110;VERSION=7982;MC=1092138652;ID=87948;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948556D7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_071844_404266_87391269 
X-CRM114-Status: GOOD (  16.06  )
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
Cc: Alexander Dahl <ada@thorsis.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

SAMA7G5 support (that was forward-ported from v6.1) re-introduced
a bug that was fixed in v6.12, thankfully only in the codepath of
the new SoC. But to prevent similar mistakes in the future, we
split out the offending code to a function, and use this, fixed
version everywhere.

To facilitate this, support function `atmel_qspi_update_config()`
also had to be moved upwards. For best viewing experience, use
`--color-moved-ws="allow-indentation-change" --color-moved`.

Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20241218-appliance-jaws-90773405977a@thorsis.com/
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 101 +++++++++++++++++++-----------------
 1 file changed, 53 insertions(+), 48 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 73cf0c3f1477..f46da363574f 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -414,6 +414,28 @@ static void atmel_qspi_write(u32 value, struct atmel_qspi *aq, u32 offset)
 	writel_relaxed(value, aq->regs + offset);
 }
 
+static int atmel_qspi_reg_sync(struct atmel_qspi *aq)
+{
+	u32 val;
+	int ret;
+
+	ret = readl_poll_timeout(aq->regs + QSPI_SR2, val,
+				 !(val & QSPI_SR2_SYNCBSY), 40,
+				 ATMEL_QSPI_SYNC_TIMEOUT);
+	return ret;
+}
+
+static int atmel_qspi_update_config(struct atmel_qspi *aq)
+{
+	int ret;
+
+	ret = atmel_qspi_reg_sync(aq);
+	if (ret)
+		return ret;
+	atmel_qspi_write(QSPI_CR_UPDCFG, aq, QSPI_CR);
+	return atmel_qspi_reg_sync(aq);
+}
+
 static inline bool atmel_qspi_is_compatible(const struct spi_mem_op *op,
 					    const struct atmel_qspi_mode *mode)
 {
@@ -476,6 +498,25 @@ static bool atmel_qspi_supports_op(struct spi_mem *mem,
 	return true;
 }
 
+/*
+ * If the QSPI controller is set in regular SPI mode, set it in
+ * Serial Memory Mode (SMM).
+ */
+static int atmel_qspi_set_serial_memory_mode(struct atmel_qspi *aq)
+{
+	int ret = 0;
+
+	if (!(aq->mr & QSPI_MR_SMM)) {
+		aq->mr |= QSPI_MR_SMM;
+		atmel_qspi_write(aq->mr, aq, QSPI_MR);
+
+		if (aq->caps->has_gclk)
+			ret = atmel_qspi_update_config(aq);
+	}
+
+	return ret;
+}
+
 static int atmel_qspi_set_cfg(struct atmel_qspi *aq,
 			      const struct spi_mem_op *op, u32 *offset)
 {
@@ -555,14 +596,9 @@ static int atmel_qspi_set_cfg(struct atmel_qspi *aq,
 			ifr |= QSPI_IFR_TFRTYP_MEM;
 	}
 
-	/*
-	 * If the QSPI controller is set in regular SPI mode, set it in
-	 * Serial Memory Mode (SMM).
-	 */
-	if (!(aq->mr & QSPI_MR_SMM)) {
-		aq->mr |= QSPI_MR_SMM;
-		atmel_qspi_write(aq->mr, aq, QSPI_MR);
-	}
+	mode = atmel_qspi_set_serial_memory_mode(aq);
+	if (mode < 0)
+		return mode;
 
 	/* Clear pending interrupts */
 	(void)atmel_qspi_read(aq, QSPI_SR);
@@ -638,28 +674,6 @@ static int atmel_qspi_transfer(struct spi_mem *mem,
 	return atmel_qspi_wait_for_completion(aq, QSPI_SR_CMD_COMPLETED);
 }
 
-static int atmel_qspi_reg_sync(struct atmel_qspi *aq)
-{
-	u32 val;
-	int ret;
-
-	ret = readl_poll_timeout(aq->regs + QSPI_SR2, val,
-				 !(val & QSPI_SR2_SYNCBSY), 40,
-				 ATMEL_QSPI_SYNC_TIMEOUT);
-	return ret;
-}
-
-static int atmel_qspi_update_config(struct atmel_qspi *aq)
-{
-	int ret;
-
-	ret = atmel_qspi_reg_sync(aq);
-	if (ret)
-		return ret;
-	atmel_qspi_write(QSPI_CR_UPDCFG, aq, QSPI_CR);
-	return atmel_qspi_reg_sync(aq);
-}
-
 static int atmel_qspi_sama7g5_set_cfg(struct atmel_qspi *aq,
 				      const struct spi_mem_op *op, u32 *offset)
 {
@@ -713,18 +727,9 @@ static int atmel_qspi_sama7g5_set_cfg(struct atmel_qspi *aq,
 			ifr |= QSPI_IFR_TFRTYP_MEM;
 	}
 
-	/*
-	 * If the QSPI controller is set in regular SPI mode, set it in
-	 * Serial Memory Mode (SMM).
-	 */
-	if (aq->mr != QSPI_MR_SMM) {
-		atmel_qspi_write(QSPI_MR_SMM | QSPI_MR_DQSDLYEN, aq, QSPI_MR);
-		aq->mr = QSPI_MR_SMM;
-
-		ret = atmel_qspi_update_config(aq);
-		if (ret)
-			return ret;
-	}
+	ret = atmel_qspi_set_serial_memory_mode(aq);
+	if (ret < 0)
+		return ret;
 
 	/* Clear pending interrupts */
 	(void)atmel_qspi_read(aq, QSPI_SR);
@@ -1092,10 +1097,9 @@ static int atmel_qspi_sama7g5_init(struct atmel_qspi *aq)
 	}
 
 	/* Set the QSPI controller by default in Serial Memory Mode */
-	atmel_qspi_write(QSPI_MR_SMM | QSPI_MR_DQSDLYEN, aq, QSPI_MR);
-	aq->mr = QSPI_MR_SMM;
-	ret = atmel_qspi_update_config(aq);
-	if (ret)
+	aq->mr |= QSPI_MR_DQSDLYEN;
+	ret = atmel_qspi_set_serial_memory_mode(aq);
+	if (ret < 0)
 		return ret;
 
 	/* Enable the QSPI controller. */
@@ -1244,8 +1248,9 @@ static int atmel_qspi_init(struct atmel_qspi *aq)
 	atmel_qspi_write(QSPI_CR_SWRST, aq, QSPI_CR);
 
 	/* Set the QSPI controller by default in Serial Memory Mode */
-	aq->mr |= QSPI_MR_SMM;
-	atmel_qspi_write(aq->mr, aq, QSPI_MR);
+	ret = atmel_qspi_set_serial_memory_mode(aq);
+	if (ret < 0)
+		return ret;
 
 	/* Enable the QSPI controller */
 	atmel_qspi_write(QSPI_CR_QSPIEN, aq, QSPI_CR);
-- 
2.34.1



