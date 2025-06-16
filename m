Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F88C71159
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:11:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYfaovqReb0YC/IVKoaet5lnN16Aykfnj2HI88YzzQU=; b=h2ycIDFUqorZNU/fyv5i30lsot
	PDq85mKuJKEfy2nP6opKN5WIKaOBlGc6Syekufd1VVaBkXVlwzAD5rj0Q6bKvHPbmDbjRpdz0qcQX
	/i1CfAfPA3L5R0mNhr5B6L7l659Ns834BuUO5VkoJIdHu0Wc9yYGNHQUAVprCM53WveMJr1+ea9lR
	d8c9QE2w/r09WU9jG4oWEo2+O1bZH2pMV80sJqnIq0xbggQp5GoFLJTarAwnHCHd4uWc2j1IFMgtf
	O/5QLdpbujUe93yjVGNpIGcT7c/rpioQRTxXWE2YejRCsjeayxGcftVFUnlbKpVaJYl1wAHqkxSOx
	zD32UFTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI2n-00000005fQZ-1zO1;
	Mon, 16 Jun 2025 22:11:09 +0000
Received: from out-188.mta1.migadu.com ([2001:41d0:203:375::bc])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtI-00000005e7d-1Pnu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:21 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111278;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYfaovqReb0YC/IVKoaet5lnN16Aykfnj2HI88YzzQU=;
	b=iVSfe4829NP8fycZu8j2fpXmtjF/KVdc9OyiEFUGfAAeDc97G2/yleYdCKG++p79wq3CqZ
	vvZQ01SnJykyrg3vFPJBHUT96AnYHB+6PgkH7ajQbyXXB8oCwB5tZIdeGn11n9EoVNwvWH
	h4LI5mWdcBlHSrBUwsJ0FCgIEEgvuPo=
From: Sean Anderson <sean.anderson@linux.dev>
To: Mark Brown <broonie@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	linux-spi@vger.kernel.org
Cc: Jinjie Ruan <ruanjinjie@huawei.com>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	David Lechner <dlechner@baylibre.com>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH v2 4/9] spi: Add flag to determine default bus
Date: Mon, 16 Jun 2025 18:00:49 -0400
Message-Id: <20250616220054.3968946-5-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150120_517271_C890E8B8 
X-CRM114-Status: GOOD (  12.95  )
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

The ZynqMP GQSPI driver determines the default SPI bus based on the chip
select. For compatibility, introduce a flag to determine the buses from
the chipselect when the spi-buses property is absent.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/spi/spi.c       | 7 ++++++-
 include/linux/spi/spi.h | 2 ++
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 9fbf069623a8..d9d0c24cee0b 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2470,7 +2470,12 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 
 	if (rc == -EINVAL) {
 		/* Default when property is omitted. */
-		spi->buses = BIT(0);
+		if ((ctlr->flags & SPI_CONTROLLER_DEFAULT_BUS_IS_CS) &&
+		    cs[0] != SPI_INVALID_CS && cs[0] < ctlr->num_buses) {
+			spi->buses = BIT(cs[0]);
+		} else {
+			spi->buses = BIT(0);
+		}
 	} else {
 		for (idx = 0; idx < rc; idx++) {
 			if (buses[idx] >= ctlr->num_buses) {
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 70e8e6555a33..cea93b0895b9 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -621,6 +621,8 @@ struct spi_controller {
 	 * assert/de-assert more than one chip select at once.
 	 */
 #define SPI_CONTROLLER_MULTI_CS		BIT(7)
+	/* spi_device->buses defaults to spi_device->cs[0] */
+#define SPI_CONTROLLER_DEFAULT_BUS_IS_CS BIT(8)
 
 	/* Flag indicating if the allocation of this struct is devres-managed */
 	bool			devm_allocated;
-- 
2.35.1.1320.gc452695387.dirty


