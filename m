Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D100C3ABBC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 May 2025 09:06:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ika5hIu7vcmCMkLJzSdUGhi/HBkB2UL7WSbLSFZaMhc=; b=X1MBpDJs18w8ChL9ebCKcaYbi7
	q3EEg5AVXw35tOSx/vFcBnCZ4MpgTcAqVxOXFj7G/8wUZcYtARKPfDH5Aa5kj5eIos8RO5XNCqCp9
	0QlwtWLwoJHECn2N0Nd7aUO5HFD18wJAjLqcRUvPQuyL76/Lh2ccWDvj6w5/P39Ht/Dz2vZqRCpnL
	wnBtmmUVMh4BII6z8+xMqiSlxu1CG9EP4htfUbYo5Niq2oenAAtaE2nQh5QBUKTdqaYfoz0vfIIZl
	7cWyGPN0cPJWwGgg0dgeIacSdqFYndavXUUnWssBZG2mNWZYoL6H8/iPz6bWMockAC7ufyIgDjkvg
	mQLllyGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJgl-000000032Xm-07I2;
	Fri, 09 May 2025 09:06:39 +0000
Received: from pegase1.c-s.fr ([93.17.236.30])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIyF-00000002uXH-0qFQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 May 2025 08:20:40 +0000
Received: from localhost (mailhub3.si.c-s.fr [192.168.12.233])
	by localhost (Postfix) with ESMTP id 4Zv1N573r2z9sSD;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase1.c-s.fr ([192.168.12.234])
	by localhost (pegase1.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kcGGoeHh1ks9; Fri,  9 May 2025 09:48:53 +0200 (CEST)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase1.c-s.fr (Postfix) with ESMTP id 4Zv1N56Mh3z9sN6;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id D4AF88B778;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id fLUc-Bq1cvAL; Fri,  9 May 2025 09:48:53 +0200 (CEST)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 34A968B768;
	Fri,  9 May 2025 09:48:53 +0200 (CEST)
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
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sound@vger.kernel.org
Subject: [PATCH 1/2] soc: fsl: qmc: Only set completion interrupt when needed
Date: Fri,  9 May 2025 09:48:44 +0200
Message-ID: <19aa9d8a84c8475c62c42ac886dad0980428c6c0.1746776731.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746776925; l=2172; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=ig/ZbmdXAZ4t1bPHRxM84n5jpK07+Tvvsh4nuTJX8PI=; b=pnkZgcWnhBcWfbA5jK6s60oD/I9FJW2zzX1yTfF+itCYFpH0oEoeXcAdYf4ZGD3jD+0lWsk6+ LR7tb/W/pj6CoYWGqcEd5CqA6E3WkNiFBSQMszPeTC0SszuBsZQyCLy
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_012039_392653_D395B417 
X-CRM114-Status: GOOD (  11.32  )
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

Only set QMC_BD_[R/T]X_I and QMC_BD_[R/T]X_UB when a completion
function is passed in.

Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 drivers/soc/fsl/qe/qmc.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/soc/fsl/qe/qmc.c b/drivers/soc/fsl/qe/qmc.c
index 36c0ccc06151..0a704fd0b1a0 100644
--- a/drivers/soc/fsl/qe/qmc.c
+++ b/drivers/soc/fsl/qe/qmc.c
@@ -474,7 +474,9 @@ int qmc_chan_write_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 	xfer_desc->context = context;
 
 	/* Activate the descriptor */
-	ctrl |= (QMC_BD_TX_R | QMC_BD_TX_UB);
+	ctrl |= QMC_BD_TX_R;
+	if (complete)
+		ctrl |= QMC_BD_TX_I | QMC_BD_TX_UB;
 	wmb(); /* Be sure to flush the descriptor before control update */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -586,7 +588,9 @@ int qmc_chan_read_submit(struct qmc_chan *chan, dma_addr_t addr, size_t length,
 		  QMC_BD_RX_AB | QMC_BD_RX_CR);
 
 	/* Activate the descriptor */
-	ctrl |= (QMC_BD_RX_E | QMC_BD_RX_UB);
+	ctrl |= QMC_BD_RX_E;
+	if (complete)
+		ctrl |= QMC_BD_RX_I | QMC_BD_RX_UB;
 	wmb(); /* Be sure to flush data before descriptor activation */
 	qmc_write16(&bd->cbd_sc, ctrl);
 
@@ -1482,19 +1486,19 @@ static int qmc_setup_chan(struct qmc *qmc, struct qmc_chan *chan)
 
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
2.47.0


