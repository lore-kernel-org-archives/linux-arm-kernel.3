Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A3EBC71136
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 22:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HXSa9B9J2FkeGT4PKUZGBGTcf10cHbFGccTdZDDZdaA=; b=HTCxCpx7WAEhujwa0aECFRD6hQ
	RWulcsRvD8d81HT8N74nLJdaYikCVEqDXEXqUJBUcbgnTJwirPfoZzE6zrys4eSdvqEvimyrs44Sd
	ZTAfATwrzwHkj5qdY/yQaLguLDIodzAKM4o+GjL01Ql4nITnT9rsSZgkKspiToNuSfLvbfcm1JzAt
	MWSDGDUjKFhjyjiptX9LfRClU4iTAoq/dbrTmChSIUEIC9qR2W+s/S4y0IyiGO0hreXDL9GHLrn0o
	03Fv6Ufh9oG2BdBDQsdjSfh5K45Xsj8os9gx6rE9yzRJm6LQNkegeXm6FtFNDg+u6a0K5YnBjYgtr
	W2TV7gOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRI0b-00000005f4V-30o0;
	Mon, 16 Jun 2025 22:08:53 +0000
Received: from out-170.mta1.migadu.com ([95.215.58.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRHtE-00000005e6n-2nP3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 22:01:17 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1750111275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HXSa9B9J2FkeGT4PKUZGBGTcf10cHbFGccTdZDDZdaA=;
	b=Mn/zUG2QLLNhYeX2c9acd3FovpjK/9Kkpa3OQ1zhNTVCTlKrWbvOT6I9mZsLdHbw1hgEN+
	4mIeXOWd3L9iz6v9oOsMWIEtmrUhBRP2rrv0g3zAkSsvUefXApCC82XXx9JKbRzOriLwoZ
	o8lBHp3GA6DY5eRIaDsh+nci5t86Bf0=
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
Subject: [PATCH v2 3/9] spi: Support multi-bus controllers
Date: Mon, 16 Jun 2025 18:00:48 -0400
Message-Id: <20250616220054.3968946-4-sean.anderson@linux.dev>
In-Reply-To: <20250616220054.3968946-1-sean.anderson@linux.dev>
References: <20250616220054.3968946-1-sean.anderson@linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_150116_850193_E8E8311F 
X-CRM114-Status: GOOD (  18.83  )
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

From: David Lechner <dlechner@baylibre.com>

Add support for SPI controllers with multiple physical SPI buses.

This is common in the type of controller that can be used with parallel
flash memories, but can be used for general purpose SPI as well.

To indicate support, a controller just needs to set ctlr->num_buses to
something greater than 1. Peripherals indicate which bus they are
connected to via device tree (ACPI support can be added if needed).

In the future, this can be extended to support peripherals that also
have multiple SPI buses to use those buses at the same time by adding
a similar bus flags field to struct spi_transfer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

Changes in v2:
- New

 drivers/spi/spi.c       | 26 +++++++++++++++++++++++++-
 include/linux/spi/spi.h | 13 +++++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 1bc0fdbb1bd7..9fbf069623a8 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -2359,7 +2359,7 @@ static void of_spi_parse_dt_cs_delay(struct device_node *nc,
 static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 			   struct device_node *nc)
 {
-	u32 value, cs[SPI_CS_CNT_MAX];
+	u32 value, buses[8], cs[SPI_CS_CNT_MAX];
 	int rc, idx;
 
 	/* Mode (clock phase/polarity/etc.) */
@@ -2460,6 +2460,29 @@ static int of_spi_parse_dt(struct spi_controller *ctlr, struct spi_device *spi,
 	for (idx = 0; idx < rc; idx++)
 		spi_set_chipselect(spi, idx, cs[idx]);
 
+	rc = of_property_read_variable_u32_array(nc, "spi-buses", buses, 1,
+						 ARRAY_SIZE(buses));
+	if (rc < 0 && rc != -EINVAL) {
+		dev_err(&ctlr->dev, "%pOF has invalid 'spi-buses' property (%d)\n",
+			nc, rc);
+		return rc;
+	}
+
+	if (rc == -EINVAL) {
+		/* Default when property is omitted. */
+		spi->buses = BIT(0);
+	} else {
+		for (idx = 0; idx < rc; idx++) {
+			if (buses[idx] >= ctlr->num_buses) {
+				dev_err(&ctlr->dev,
+					"%pOF has out of range 'spi-buses' property (%d)\n",
+					nc, buses[idx]);
+				return -EINVAL;
+			}
+			spi->buses |= BIT(buses[idx]);
+		}
+	}
+
 	/*
 	 * By default spi->chip_select[0] will hold the physical CS number,
 	 * so set bit 0 in spi->cs_index_mask.
@@ -3070,6 +3093,7 @@ struct spi_controller *__spi_alloc_controller(struct device *dev,
 	mutex_init(&ctlr->add_lock);
 	ctlr->bus_num = -1;
 	ctlr->num_chipselect = 1;
+	ctlr->num_buses = 1;
 	ctlr->target = target;
 	if (IS_ENABLED(CONFIG_SPI_SLAVE) && target)
 		ctlr->dev.class = &spi_target_class;
diff --git a/include/linux/spi/spi.h b/include/linux/spi/spi.h
index 4789f91dae94..70e8e6555a33 100644
--- a/include/linux/spi/spi.h
+++ b/include/linux/spi/spi.h
@@ -228,6 +228,11 @@ struct spi_device {
 	struct spi_delay	cs_hold;
 	struct spi_delay	cs_inactive;
 
+	/*
+	 * Bit flags indicating which buses this device is connected to. Only
+	 * applicable to multi-bus controllers.
+	 */
+	u8			buses;
 	u8			chip_select[SPI_CS_CNT_MAX];
 
 	/*
@@ -574,6 +579,14 @@ struct spi_controller {
 	 */
 	u16			num_chipselect;
 
+	/*
+	 * Some specialized SPI controllers can have more than one physical
+	 * bus interface per controller. This specifies the number of buses
+	 * in that case. Other controllers do not need to set this (defaults
+	 * to 1).
+	 */
+	u16			num_buses;
+
 	/* Some SPI controllers pose alignment requirements on DMAable
 	 * buffers; let protocol drivers know about these requirements.
 	 */
-- 
2.35.1.1320.gc452695387.dirty


