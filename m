Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BE80E77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Dec 2024 17:01:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Zl8RAR4+VoktxwACTb78JwmocySVvgcud/1ayJe16tU=; b=K4XJQn8YDR/SLC
	FJ1TmLuENHEqYvr0T2ric2kYApx6INpR1s8yoGAuNpIAegZvE/X9cnCtZvXAci+fEVgwW4n/T2YnQ
	VSmgwWERDUxWs0zwo+s5ZIA374G6udSw2AbW19wYpJskeUuLtFg2MVSHTAcrVI9rYkAjqAPrYXAuw
	b+ZVsb6Km7ps/X2ySVnSq47m5L4UAMN+13Fzofno2Ec0+3Sj+37r5xECNHkG5X9S4aKVlhoBfckM4
	owp49zYfDcMGnSqcJQXuTUmuz+LV3PqSdjmbBldpF7Qoet6/SfUU0nQ0Qor47JJvQX6qa5K6fhTmZ
	Nrg9bCN0/5gl5nt5qS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxPl-0000000HFmW-0BaG;
	Wed, 18 Dec 2024 17:00:49 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNxNz-0000000HFRV-35CI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Dec 2024 16:59:01 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 5EA95A0523;
	Wed, 18 Dec 2024 17:58:56 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:message-id:mime-version:reply-to:subject:subject:to
	:to; s=mail; bh=Zl8RAR4+VoktxwACTb78JwmocySVvgcud/1ayJe16tU=; b=
	UlhkcmTJ9T0bsRVvaSdvfunxQBc24iaK4u6HoRCep/wajfPYXSKEB6DuxO04ut/t
	QUUZDdPXiDuv6dheswnpqDJWd03TiiEOzl64hkfIcTXsrodQ/ZkEBa9+F07jtAop
	zVx+Xh8CK4XUgv0fhOuTiVeFDvllcH/lin6TWNMJyG3qcRDSWC8akhqyNnPmVxAd
	Gmt1F+Iin0kHr/50SRjhollSdNWJSCEUThF9wBiAqG99FD05t3upnzjSNBIcmjIF
	7H7mwpoQkkgXfsSR/qV9+GDxlOSGi3+fRTXSNzLpuftoNZqrYbdtOjUKxt2uoOIY
	0wMzga1s6lWxd6nqDG1ErHBlND6q2/b/I1GfY7GNVCcYdtcSL5bn9s9ujSkyuVjz
	Cz9XyS9jnRrNXgvvrGWvgm2u1bz+5BNQ8DK4xr7lCaSzP35TxoZzDh3JxFFHSDja
	U6rtP4HvvrmcW6BhzNR8vCtVVo8SLh50tM1rlm1jsr1kPx5V5J7dpi5QRp65xKm3
	DOgrOVmj4NFo5pLGiJc4Z3OaCivDaMbSmfri13fz/6xV2gf24JB9qhvjIz9ggego
	9re/W8tiFVuFDBybv997aRoplG9NS2hRPMRdXqIVbYyo63HmIO75tLsvbFxK5msy
	75nXQNGecyOkD+sePNXlhYyZGbFpoEKjZGRRLiSyQRY=
From: =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
To: Mark Brown <broonie@kernel.org>, Piotr Bugalski
	<bugalski.piotr@gmail.com>, <linux-spi@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] spi: atmel-qspi: Memory barriers after memory-mapped I/O
Date: Wed, 18 Dec 2024 17:58:49 +0100
Message-ID: <20241218165850.378909-1-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1734541135;VERSION=7982;MC=1721398368;ID=88099;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A2980D948556D7063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241218_085900_324745_8D183200 
X-CRM114-Status: GOOD (  16.32  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Marco.Cardellini@microchip.com, stable@vger.kernel.org, Mahesh.Abotula@microchip.com, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Hari.PrasathGE@microchip.com, =?UTF-8?q?Bence=20Cs=C3=B3k=C3=A1s?= <csokas.bence@prolan.hu>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The QSPI peripheral control and status registers are
accessible via the SoC's APB bus, whereas MMIO transactions'
data travels on the AHB bus.

Microchip documentation and even sample code from Atmel
emphasises the need for a memory barrier before the first
MMIO transaction to the AHB-connected QSPI, and before the
last write to its registers via APB. This is achieved by
the following lines in `atmel_qspi_transfer()`:

	/* Dummy read of QSPI_IFR to synchronize APB and AHB accesses */
	(void)atmel_qspi_read(aq, QSPI_IFR);

However, the current documentation makes no mention to
synchronization requirements in the other direction, i.e.
after the last data written via AHB, and before the first
register access on APB.

---

In our case, we were facing an issue where the QSPI peripheral
would cease to send any new CSR (nCS Rise) interrupts,
leading to a timeout in `atmel_qspi_wait_for_completion()`
and ultimately this panic in higher levels:

	ubi0 error: ubi_io_write: error -110 while writing 63108 bytes to PEB 491:128, written 63104 bytes

After months of extensive research of the codebase, fiddling
around the debugger with kgdb, and back-and-forth with
Microchip, we came to the conclusion that the issue is
probably that the peripheral is still busy receiving on AHB
when the LASTXFER bit is written to its Control Register
on APB, therefore this write gets lost, and the peripheral
still thinks there is more data to come in the MMIO transfer.
This was first formulated when we noticed that doubling the
write() of QSPI_CR_LASTXFER seemed to solve the problem.

Ultimately, the solution is to introduce memory barriers
after the AHB-mapped MMIO transfers, to ensure ordering.

Fixes: d5433def3153 ("mtd: spi-nor: atmel-quadspi: Add spi-mem support to atmel-quadspi")
Cc: Hari.PrasathGE@microchip.com
Cc: Mahesh.Abotula@microchip.com
Cc: Marco.Cardellini@microchip.com
Cc: <stable@vger.kernel.org> # c0a0203cf579: ("spi: atmel-quadspi: Create `atmel_qspi_ops`"...)
Cc: <stable@vger.kernel.org> # 6.x.y
Signed-off-by: Bence Csókás <csokas.bence@prolan.hu>
---
 drivers/spi/atmel-quadspi.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/spi/atmel-quadspi.c b/drivers/spi/atmel-quadspi.c
index 73cf0c3f1477..96fc1c56a221 100644
--- a/drivers/spi/atmel-quadspi.c
+++ b/drivers/spi/atmel-quadspi.c
@@ -625,13 +625,20 @@ static int atmel_qspi_transfer(struct spi_mem *mem,
 	(void)atmel_qspi_read(aq, QSPI_IFR);
 
 	/* Send/Receive data */
-	if (op->data.dir == SPI_MEM_DATA_IN)
+	if (op->data.dir == SPI_MEM_DATA_IN) {
 		memcpy_fromio(op->data.buf.in, aq->mem + offset,
 			      op->data.nbytes);
-	else
+
+		/* Synchronize AHB and APB accesses again */
+		rmb();
+	} else {
 		memcpy_toio(aq->mem + offset, op->data.buf.out,
 			    op->data.nbytes);
 
+		/* Synchronize AHB and APB accesses again */
+		wmb();
+	}
+
 	/* Release the chip-select */
 	atmel_qspi_write(QSPI_CR_LASTXFER, aq, QSPI_CR);
 
-- 
2.34.1



