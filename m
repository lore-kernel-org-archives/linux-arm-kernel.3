Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82C1BD2ED17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:45:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+Nzql5r62pcLSgpHhPzlIpwDJKN/eNaqMW1y6EcuY0I=; b=BfSAw3NBP0JS3uBDgq1I06J/Wy
	Kk0hoWgOS9I2YungeigpXjwPCYI673DswyMMPH6B6VLTGVpt3xD2OcCIwz5vXY5VNTDN+Uzp1pZ7i
	kA3vhtaApoy2swS1IPuXI4MDaIB45ccdGK3PdIb9azvsuIGKTbdFKwVOuQd8IYUFFvVvtjkw3SilK
	shLEqqIGjj11Rz/5RFCVM3wxQ7yyUiYr+f42nxPMGYuAPPp70G/XH2+gVpYLkdGoEArbVT77H/jQR
	8b4CUEpG7nVY05Z6pAGE1TRhi605FazEOPSCB+LT387gItqS+GZkjBckI0wQEu9MSLn06fPGJWJ/T
	myCzMRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDv4-0000000469N-1rlc;
	Tue, 20 Jan 2026 15:45:26 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDuo-0000000464S-2o3f
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:45:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6D6FC148AD59;
	Tue, 20 Jan 2026 16:45:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923908; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=+Nzql5r62pcLSgpHhPzlIpwDJKN/eNaqMW1y6EcuY0I=;
	b=r7lb5MFejvrhiSo2K5dptvovWuqrYR/wTxir21irifHGKPgSn/3FusOKSrqoTwPHmU6M6x
	/1BLwjsDY+I4L9+9YgEJhyD5aCLPs6cI8O8MZE6W308/rrlP/Q4KnoM6OgcJosj7k2TWiu
	+bZLELhhsYSCN3HEr8waErYoYsoyBtzfZnPVw9A+qUsca3iUe2EOHMPzoMOGN9v+R7W0hR
	s3i3pwEB5f8AYnXONS6DxQs+C3BqESKq/gYUKeN+wZq6EPSwU+Xmcf6J1PzDVVMK8SfA9l
	LtAZuHwJTWaF1Qu3G7tcABIfTdO0ikUxV3V06tjPzwBPvUG6om+5WOW1pO86KA==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	stable@vger.kernel.org,
	Srinivas Kandagatla <srini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v3 10/19] nvmem: microchip-otpc: Avoid reading a write-only register
Date: Tue, 20 Jan 2026 16:44:44 +0100
Message-ID: <20260120154502.1280938-4-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_074510_868942_60C0F9A9 
X-CRM114-Status: GOOD (  10.42  )
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

The OTPC Control Register (OTPC_CR) has just write-only members.
Reading from that register leads to a warning in OTPC Write Protection
Status Register (OTPC_WPSR) in field Software Error Type (SWETYP) of
type READ_WO (A write-only register has been read (warning).)

Just create the register write content from scratch is sufficient here.

Fixes: 98830350d3fc ("nvmem: microchip-otpc: add support")
Cc: stable@vger.kernel.org
Signed-off-by: Alexander Dahl <ada@thorsis.com>
---

Notes:
    v3:
    - Reorder tags
    - Add stable tag
    
    v2:
    - Add Fixes tag
    - Remove temporary variable usage
    - Reword misleading subject (s/writing/reading/)

 drivers/nvmem/microchip-otpc.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/nvmem/microchip-otpc.c b/drivers/nvmem/microchip-otpc.c
index df979e8549fdb..e2851c63cc0b4 100644
--- a/drivers/nvmem/microchip-otpc.c
+++ b/drivers/nvmem/microchip-otpc.c
@@ -82,9 +82,7 @@ static int mchp_otpc_prepare_read(struct mchp_otpc *otpc,
 	writel_relaxed(tmp, otpc->base + MCHP_OTPC_MR);
 
 	/* Set read. */
-	tmp = readl_relaxed(otpc->base + MCHP_OTPC_CR);
-	tmp |= MCHP_OTPC_CR_READ;
-	writel_relaxed(tmp, otpc->base + MCHP_OTPC_CR);
+	writel_relaxed(MCHP_OTPC_CR_READ, otpc->base + MCHP_OTPC_CR);
 
 	/* Wait for packet to be transferred into temporary buffers. */
 	return read_poll_timeout(readl_relaxed, tmp, !(tmp & MCHP_OTPC_SR_READ),
-- 
2.47.3


