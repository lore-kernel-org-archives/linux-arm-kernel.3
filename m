Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F22CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 15:50:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JYFZYMb5VsOSOUmvdt1QpwgUgCQDyiISEdj9j4qpufI=; b=zjOtbfIawzI3dbxH/blcic/rJi
	rTetDvms8vdF6WJxPJmuO3SBokt1DEp+KJHZ7bAGUWzatmgmc1fdQci13RF6zmhXTE/uOfOLRQhHW
	/oUxVpMv0oJkRwXOBEeTV4w1YDdXa3+ZU/hAt4Rb21rgfX2wZQZiTQVrn5Ng4Oywl2xcBZkl4qaMR
	vFYpoCc91d1z7UVzegU1Cv+AfS7RckFOvaoVogJdfnlDzfcVKYJ5ZgDU6jDFMn33asYFrjx7bmpoM
	YegPOIWoL2xEzVkTJRFWVePSI8VFmK/lDVkl1B+UkEkzfYcSIsDryfvoBA3vmAbxbmjC9ODZN+fcJ
	gXy3oNGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGu7-00000000Uud-3Rny;
	Thu, 18 Sep 2025 15:50:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGu6-00000000UuE-317r
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 18 Sep 2025 15:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JYFZYMb5VsOSOUmvdt1QpwgUgCQDyiISEdj9j4qpufI=; b=I01xa8LMV+uWrOvcYw1pmgadpL
	Be9qJ2XSC4sz/YNVN2AJ3b1+rcCt53HO/cechjTvuwiHJfvQlsMU6PvUydpJKDWSOnDRDmxSscp4L
	7CMXxZ4D5Bd+59ZIl0iHopPOwh5QboQA8ZQgZXE6L9G+xCGuw/ulfwRhdnLuxUAt8VlQh5N60NKvF
	xEoEl1iPJl8LmZtwHNYTmbOnqph39ELrh5V2cqdtyf1ENZOot0qB75YnzEYBcgAoXStnDLD6Fyjyu
	hMMhZaNQS8ic8I1xrgnchjKpQ3qFCvAOeVFI4Y+OcHoZiiduLMstD6V1bKfvt1pDsoLGD2ReFj7H0
	gCndiMvg==;
Received: from pegase2.c-s.fr ([93.17.235.10])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzGu3-00000007e1Q-3bgW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Sep 2025 15:50:37 +0000
Received: from localhost (mailhub4.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4cSKSQ3kppz9sg0;
	Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HDEkcH1IVVyx; Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4cSKSQ2bD1z9sfv;
	Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 439198B776;
	Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id LGlByoGo7Cr9; Thu, 18 Sep 2025 17:34:30 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 76C7A8B767;
	Thu, 18 Sep 2025 17:34:29 +0200 (CEST)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Herve Codina <herve.codina@bootlin.com>,
	Qiang Zhao <qiang.zhao@nxp.com>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: [PATCH RESEND v3 1/4] soc: fsl: qmc: Only set completion interrupt when needed
Date: Thu, 18 Sep 2025 17:34:08 +0200
Message-ID: <40b41b53a26e77a50b3a5f68fcecc6f9a40a84b4.1758209158.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1758209158.git.christophe.leroy@csgroup.eu>
References: <cover.1758209158.git.christophe.leroy@csgroup.eu>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758209657; l=3349; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=3ueV0+TWEXT+lbHC1mnyBhAYLOCSJuYccHwKxxNUhFc=; b=7YoDVmchoSPIi4mkTR5smUVwENM9xsvOMPjROEZI9uTWYid5RyMwIeB5cXfTLUQ7gKIPzZfPK woyB7SkM8ZiCdywhXXs3gY5r5gykus9J3L5aR213Bh6Wb4klHtJd3sV
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_165036_015299_715802E2 
X-CRM114-Status: GOOD (  14.24  )
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

When no post-completion processing is expected, don't waste time
handling useless interrupts.

Only set QMC_BD_[R/T]X_I when a completion function is passed in,
and perform seamless completion on submit for interruptless buffers.

Acked-by: Herve Codina <herve.codina@bootlin.com>
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 44 ++++++++++++++++++++++++++++++----------
 1 file changed, 33 insertions(+), 11 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 36c0ccc06151..da5ea6d35618 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -461,9 +461,16 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	ctrl = qmc_read16(&bd->cbd_sc);
 	if (ctrl & (QMC_BD_TX_R | QMC_BD_TX_UB)) {
-		/* We are full ... */
-		ret = -EBUSY;
-		goto end;
+		if (!(ctrl & (QMC_BD_TX_R | QMC_BD_TX_I)) && bd == chan->txbd_done) {
+			if (ctrl & QMC_BD_TX_W)
+				chan->txbd_done = chan->txbds;
+			else
+				chan->txbd_done++;
+		} else {
+			/* We are full ... */
+			ret = -EBUSY;
+			goto end;
+		}
 	}
 
 	qmc_write16(&bd->cbd_datlen, length);
@@ -475,6 +482,10 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
+	if (complete)
+		ctrl |= QMC_BD_TX_I;
+	else
+		ctrl &= ~QMC_BD_TX_I;
 	wmb(); /* Be sure to flush the descriptor before control update */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -569,9 +580,16 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	ctrl = qmc_read16(&bd->cbd_sc);
 	if (ctrl & (QMC_BD_RX_E | QMC_BD_RX_UB)) {
-		/* We are full ... */
-		ret = -EBUSY;
-		goto end;
+		if (!(ctrl & (QMC_BD_RX_E | QMC_BD_RX_I)) && bd == chan->rxbd_done) {
+			if (ctrl & QMC_BD_RX_W)
+				chan->rxbd_done = chan->rxbds;
+			else
+				chan->rxbd_done++;
+		} else {
+			/* We are full ... */
+			ret = -EBUSY;
+			goto end;
+		}
 	}
 
 	qmc_write16(&bd->cbd_datlen, 0); /* data length is updated by the QMC */
@@ -587,6 +605,10 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 
 	/* Activate the descriptor */
 	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
+	if (complete)
+		ctrl |= QMC_BD_RX_I;
+	else
+		ctrl &= ~QMC_BD_RX_I;
 	wmb(); /* Be sure to flush data before descriptor activation */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -1482,19 +1504,19 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
 	/* Init Rx BDs and set Wrap bit on last descriptor */
 	BUILD_BUG_ON(QMC_NB_RXBDS == 0);
-	val = QMC_BD_RX_I;
 	for (i = 0; i < QMC_NB_RXBDS; i++) {
 		bd = chan->rxbds + i;
-		qmc_write16(&bd->cbd_sc, val);
+		qmc_write16(&bd->cbd_sc, 0);
 	}
 	bd = chan->rxbds + QMC_NB_RXBDS - 1;
-	qmc_write16(&bd->cbd_sc, val | QMC_BD_RX_W);
+	qmc_write16(&bd->cbd_sc, QMC_BD_RX_W);
 
 	/* Init Tx BDs and set Wrap bit on last descriptor */
 	BUILD_BUG_ON(QMC_NB_TXBDS == 0);
-	val = QMC_BD_TX_I;
 	if (chan->mode == QMC_HDLC)
-		val |= QMC_BD_TX_L | QMC_BD_TX_TC;
+		val = QMC_BD_TX_L | QMC_BD_TX_TC;
+	else
+		val = 0;
 	for (i = 0; i < QMC_NB_TXBDS; i++) {
 		bd = chan->txbds + i;
 		qmc_write16(&bd->cbd_sc, val);
-- 
2.49.0


