Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44630C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 17:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gyIbHeHvJEOpPcU0XCY2dxiVjRerqpFepvL4DN0vFwE=; b=rVICSxKfqItZtJ
	QvmH6hydkVpOlZukPavfMXnsFPdTmbX1yg6fkJZHDq+3gsnqozITcH4epecjQznqRL3Ds2OvEWu/1
	dSy+CqPt0IB4Iydttc6MPtzl3tft4ZYbzoDXr+j7hBqZ2ODqNqEvWyoj2ORoqYDWFN2wacGwJ69vr
	gXUD26nGwvZyPvCzY4kW/tIlin82ZLfdhiaxhnRPc0S9HBUarc3oPiGYGq1YT8rQGCdXBCue3vgXV
	J6bxFFvmRYkivBvmkrqCoDrn0xQcblEnmkpfM45qCnwOFXucMh3kHMIcUYQcLyBBz604/ieXqzJRg
	i9GdoY0dP8x91jNmLr7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkff-00000009Bxv-1yRV;
	Tue, 14 Jan 2025 17:25:43 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXkdm-00000009BUM-0qhZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 17:23:47 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id D5576A0BC9;
	Tue, 14 Jan 2025 18:23:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=gyIbHeHvJEOpPcU0XCY2dxiVjRerqpFepvL4DN0vFwE=; b=
	Bz9Z7GQ7NSB1HQF+gx2kvNDi5rC/r4MmelnpbdW43Mi2vULxzGFmURxJicg1npMv
	83YQLFjEShVOM+2QIl6jpwqY9YJIAcRCA+3GBs+1N8kgd3P9N0K8Dwrldq/XDX32
	xJ4fT3H1Ey04fDGwVD2oUTXBvwP2wFgPAFf8KZYFho81ImBB4EnHnznENc04VYEG
	Nlfr0wcdOPfjNl+OowtrI4Ol/e0vDvUj6bKfMoW1rmtsxoN25jLpg2p+SOrjfkaC
	9S4BiluC1v3xU9GW7y65hpnmx6oU8tz4ndlaMTk/LpgpM2Bi7ByhLExrq9TEfvsE
	uzqs4EtCYu5HN8tRMylFfcCsutW/sXU4wQRSOdRUYNUQFjPDj1Qsswm6/wWU7YRp
	0DfNI7ON1Dsxi2FFQ/dDl3DHjV1ITKQmik/2Fz/tNPj90pmjxZeSdKuR7lfc6AZd
	bJzs4B1zC5KA+02Rp7rW1oYgb5ud/QIb/gIeppq369ysmnMht3vJGwe24KSk0QpZ
	2aEV2GY67nnmisUVGFf9q0DPeBJNFjJ5oDO5gOCV3Wj8dbzkpfsws7UMm0i6ELcq
	oNnjy9UxEzHSFIFKIr3WYK3GcJPiLZNO8lVX3gPB/UvaUiTZGyO6oM9lb+HhmavE
	YWXGikLiiDsdnYv19wgQf7RPyAO2IJQyc87Lx2QSHQY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Mark Brown <broonie@kernel.org>, Varshini Rajendran
	<varshini.rajendran@microchip.com>, =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?=
	<csokas.bence@prolan.hu>, Tudor Ambarus <tudor.ambarus@linaro.org>,
	<linux-spi@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH] spi: atmel-quadspi: remove references to runtime PM on error path
Date: Tue, 14 Jan 2025 18:23:29 +0100
Message-ID: <20250114172329.1013770-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.48.0
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1736875424;VERSION=7983;MC=754494419;ID=290947;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D94852647167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_092346_393843_AF769627 
X-CRM114-Status: UNSURE (   9.18  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Alexander Dahl <ada@thorsis.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Durai Manickam KR <durai.manickamkr@microchip.com>, Claudiu Beznea <claudiu.beznea@microchip.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Claudiu Beznea <claudiu.beznea@microchip.com>

There is no need to call runtime PM put APIs on error path of
`atmel_qspi_sama7g5_transfer()` as the caller (`atmel_qspi_exec_op()`)
of it will take care of this if needed.

Fixes: 5af42209a4d2 ("spi: atmel-quadspi: Add support for sama7g5 QSPI")
Signed-off-by: Claudiu Beznea <claudiu.beznea@microchip.com>
Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
Reported-by: Alexander Dahl <ada@thorsis.com>
Closes: https://lore.kernel.org/linux-spi/20250109-carat-festivity-5f088e1add3c@thorsis.com/
[ csokas.bence: Rebase and clarify msg, fix/add tags ]
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 093eb4fd7dd2..e62683226768 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -930,11 +930,8 @@ static int atmel_qspi_sama7g5_transfer(struct spi_mem *mem,
 
 	/* Release the chip-select. */
 	ret = atmel_qspi_reg_sync(aq);
-	if (ret) {
-		pm_runtime_mark_last_busy(&aq->pdev->dev);
-		pm_runtime_put_autosuspend(&aq->pdev->dev);
+	if (ret)
 		return ret;
-	}
 	atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
 
 	return atmel_qspi_wait_for_completion(aq, QSPI_SR_CSRA);
-- 
2.48.0



