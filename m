Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76F19CDB46F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N30jbjOnhkJGD+w2i+qI4kPeZO6t3rjCiUISLMQpg/Y=; b=HDuO7vPCku/4DdgCo9WGrLcV3e
	wVA24f4o/EKYeuh9eZ7JIBte/jRRzwHy356PQlRVyI6pt/nClZfFTT/3z6s5Q6ql2gXenlroolw5x
	gwob0AshjTqpSVBOv/UrSZiouaCyL8wqSq1LzPNlmGm/T4FoJ+lRIuaLv2pgYXTP4Z71hdXRXLWfe
	bo3siinaBXctiRklBgtuVj1zTGBTLKYClJlymfPKMn/HkhNQD7mqCY3HT1rNHtv2VMy5H9Y98rd6Y
	5X4vfLaToSP4I7S1/NjQngMTXEHL0pDjrGqSKnAJRuL1x1FTmQfM73zZWCJ7juGDohUE81v9Qt1mZ
	5/uYf0Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc38a-00000006Xlx-1Hbk;
	Tue, 23 Jun 2026 15:34:08 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wc38X-00000006Xl4-1lYV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 15:34:06 +0000
From: Javier Fernandez Pastrana <javier.pastrana@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1782228841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N30jbjOnhkJGD+w2i+qI4kPeZO6t3rjCiUISLMQpg/Y=;
	b=C3IRwOiQtcpvsVAXb/J4HCQe6YYuqkJ0a9x/ZqB62wtZiuua1EtBqS6a6mSsewv/iIw3wg
	qXpZvPAdiY/4ADCuzjnCyvQNAYZUSkqJbD2dUHpzDQOmB94pVD/cEJZR1nwE1X0jYFcvZN
	I8/H33sDQRS5p/Ss+xDz9Hqbu5LC7Ni52VKRSPYb1bQ8a09kKDoCPynJlSZ0lADDaWpsKo
	eDeSI0d/DGLxmKtsXOAEPfLMZA8I1lxkaE/5MxTo+OHvRxXd4e073Cw4QJ1q3VvqTCBcbO
	/hD5Zt5IbKo1vfLykZMxNVjquEglFlgiKkj7rWyo7W5EQ1qzMa3gFVtQJ7MY0w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1782228841;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=N30jbjOnhkJGD+w2i+qI4kPeZO6t3rjCiUISLMQpg/Y=;
	b=iYBITV530mQ9xs4Cce8uZdb+PRKKV2fEmKxx4HXTfeKCY8IE6i1sCVGaPUIDl518yWd6p9
	FaNEnf0Ia87RpLCg==
To: Mark Brown <broonie@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Carlos Song <carlos.song@nxp.com>,
	linux-spi@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: javier.pastrana@linutronix.de,
	stable@vger.kernel.org
Subject: [PATCH] spi: imx: reconfigure for PIO when DMA cannot be started
Date: Tue, 23 Jun 2026 17:32:39 +0200
Message-ID: <20260623153240.57185-1-javier.pastrana@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_083405_605838_8E0F5975 
X-CRM114-Status: GOOD (  10.47  )
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

When spi_imx_can_dma() selects DMA, the ECSPI is configured for DMA:
spi_imx_setupxfer() sets CTRL.SMC and clears dynamic_burst, and
spi_imx_dma_transfer() programs the dynamic-burst BURST_LENGTH and the
SDMA watermarks.

If the DMA descriptor cannot be prepared (dmaengine_prep_slave_single()
returns NULL), the transfer is failed with SPI_TRANS_FAIL_NO_START and
falls back to PIO. The dynamic-burst DMA path uses its own bounce
buffers instead of the SPI core's mapping, so xfer->{tx,rx}_sg_mapped
are not set and the core's DMA->PIO retry is skipped; the driver falls
back to PIO internally. But none of the DMA-mode configuration is
undone, so the PIO transfer runs with CTRL.SMC set, the wrong burst
length and dynamic_burst cleared, and the transferred data is corrupted.

This is easily hit on i.MX8MP boards that describe ECSPI DMA in the
device tree but run SDMA on ROM firmware (no external sdma-imx7d.bin):
every ECSPI DMA prepare fails. An Infineon SLB9670 TPM on ECSPI1 then
returns shifted TPM2_GetCapability data, is flagged "field failure
mode", /dev/tpmrm0 is never created.

Mark the controller PIO-only (controller->fallback) and re-run
spi_imx_setupxfer() before falling back, so the ECSPI is reconfigured
exactly like a normal PIO transfer.

Fixes: faa8e404ad8e ("spi: imx: support dynamic burst length for ECSPI DMA =
mode")
Cc: stable@vger.kernel.org
Signed-off-by: Javier Fernandez Pastrana <javier.pastrana@linutronix.de>
---
 drivers/spi/spi-imx.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/spi/spi-imx.c b/drivers/spi/spi-imx.c
index 480d1e8b281f..64c78bd79d7d 100644
--- a/drivers/spi/spi-imx.c
+++ b/drivers/spi/spi-imx.c
@@ -2153,6 +2153,8 @@ static int spi_imx_transfer_one(struct spi_controller=
 *controller,
 		ret =3D spi_imx_dma_transfer(spi_imx, transfer);
 		if (transfer->error & SPI_TRANS_FAIL_NO_START) {
 			spi_imx->usedma =3D false;
+			controller->fallback =3D true;
+			spi_imx_setupxfer(spi, transfer);
 			if (spi_imx->target_mode)
 				return spi_imx_pio_transfer_target(spi, transfer);
 			else
--=20
2.47.3


