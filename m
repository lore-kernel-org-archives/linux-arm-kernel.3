Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 964ADC624CF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 11:36:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kq4Izzq5XdqMBMVYoLts+aXbOTFck3gOl5zHzsMu+xM=; b=Gsbvyrnr8gaz/gJFXoyKwIWAFE
	ETO3sObA9T5mEinomjDceemVm8ZWXEXnlEktOXwC9MvhvrYP+9rdaZNfikTtg3RmvFyRGraEgoi24
	OGhKHPcY0uGglBKpup6xnMw7fzchaKj/KHeHgBUxGlYeqjMPF8iqNLby0Yi0qttt+cPlWvZ3fPfDy
	a37xeULoKkQz2VOLP63cHzPy7yoZTENAo9ZDYCklFergoeH3FyZbnKlpo6Xg3a6wDhIznxPPFFrtl
	nXEJY3+66QxLzF1muRe9hGsRJ78zzxLmDUZefLjZv5wnAmaK0cehFKbaAWRM1gPWHWpd1UxFAElFx
	3Yj8mZ7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mmf-0000000Bhlq-12at;
	Tue, 01 Sep 2026 11:36:09 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=twmbx01.aspeedtech.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Mmc-0000000BhTz-1s09;
	Tue, 01 Sep 2026 11:36:07 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Tue, 1 Sep
 2026 19:35:39 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Tue, 1 Sep 2026 19:35:39 +0800
From: Billy Tsai <billy_tsai@aspeedtech.com>
Date: Tue, 1 Sep 2026 19:35:34 +0800
Subject: [PATCH 7/8] i3c: mipi-i3c-hci: Improve AST2700 PIO TX queue
 utilization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260901-b4-i3c-hci-ast2700-v1-7-19909e7cbd7e@aspeedtech.com>
References: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
In-Reply-To: <20260901-b4-i3c-hci-ast2700-v1-0-19909e7cbd7e@aspeedtech.com>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li
	<Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	<joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, Philipp Zabel
	<p.zabel@pengutronix.de>
CC: <linux-i3c@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Billy Tsai <billy_tsai@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788262538; l=5389;
 i=billy_tsai@aspeedtech.com; s=20251118; h=from:subject:message-id;
 bh=oaf8rylZXdyfnF1JAoViZJfEllE3F20K/vr6f/aHROE=;
 b=RYohPmXVU7MlqRAhyOatovdjRP4ydQzRQ7LkGAAOgee7Mv0uUdh/XLOduNYCIoVJYOpr5oaV6
 WSWWqbdoS/iCxtJEqyf0uGiKli6UpiCiqM3aA+Od6cRFNwFmpZvFpmL
X-Developer-Key: i=billy_tsai@aspeedtech.com; a=ed25519;
 pk=/A8qvgZ6CPfnwKgT6/+k+nvXOkN477MshEGJvVdzeeQ=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_043606_520177_3B16FDF0 
X-CRM114-Status: GOOD (  15.47  )
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

The PIO TX path only pushes data once STAT_TX_THLD reports that
tx_thresh_size words are free, with the threshold set to half the TX
FIFO. The FIFO is therefore never filled beyond half from a single
wait, which under-utilizes the queue, and sending buffers larger than
the threshold makes software race against the hardware draining the
FIFO, resulting in an unstable flow.

The AST2700 vendor block exposes the TX FIFO read and write pointers,
which give the exact number of free entries. When is_aspeed() is true,
size each burst from those pointers, using CIRC_SPACE() to derive the
free-entry count, so the FIFO can be used up to its full depth. Other
controllers keep the existing threshold-based flow.

Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
Assisted-by: Claude:claude-fable-5
---
 drivers/i3c/master/mipi-i3c-hci/pio.c           | 25 +++++++++++++++++++++----
 drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c | 11 +++++++++++
 drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h |  6 ++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/i3c/master/mipi-i3c-hci/pio.c b/drivers/i3c/master/mipi-i3c-hci/pio.c
index 6bd5e43364a1..3d70257dcc1d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/pio.c
+++ b/drivers/i3c/master/mipi-i3c-hci/pio.c
@@ -15,6 +15,7 @@
 #include "cmd.h"
 #include "ibi.h"
 #include "pio.h"
+#include "vendor_aspeed.h"
 
 /*
  * PIO Access Area
@@ -295,11 +296,23 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
 	p += (xfer->data_len - xfer->data_left) / 4;
 
 	while (xfer->data_left >= 4) {
-		/* bail out if FIFO free space is below set threshold */
-		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+		unsigned int avail = pio->tx_thresh_size;
+
+		if (is_aspeed(hci)) {
+			/*
+			 * The vendor FIFO pointers give the exact free space,
+			 * allowing better TX FIFO utilization than the
+			 * threshold status.
+			 */
+			avail = aspeed_i3c_avail_tx_entries(hci);
+			if (!avail)
+				return false;
+		} else if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD)) {
+			/* bail out if FIFO free space is below set threshold */
 			return false;
+		}
 		/* we can fill up to that TX threshold */
-		nr_words = min(xfer->data_left / 4, pio->tx_thresh_size);
+		nr_words = min(xfer->data_left / 4, avail);
 		/* push data into the FIFO */
 		xfer->data_left -= nr_words * 4;
 		dev_dbg(&hci->master.dev, "now %d left %d",
@@ -316,8 +329,12 @@ static bool hci_pio_do_tx(struct i3c_hci *hci, struct hci_pio_data *pio)
 		 * also get some bytes past the actual buffer but no one
 		 * should care as they won't be sent out.
 		 */
-		if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD))
+		if (is_aspeed(hci)) {
+			if (!aspeed_i3c_avail_tx_entries(hci))
+				return false;
+		} else if (!(pio_reg_read(INTR_STATUS) & STAT_TX_THLD)) {
 			return false;
+		}
 		dev_dbg(&hci->master.dev, "trailing %d", xfer->data_left);
 		pio_reg_write(XFER_DATA_PORT, *p);
 		xfer->data_left = 0;
diff --git a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
index e32dea0d5fc3..182111b857c9 100644
--- a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
+++ b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/circ_buf.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/i3c/master.h>
@@ -45,6 +46,16 @@ void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len
 			 FIELD_PREP(ASPEED_I3C_IBI_TERMINATE_LEN, ibi_max_len));
 }
 
+/* Free TX FIFO entries derived from the vendor FIFO read/write pointers */
+unsigned int aspeed_i3c_avail_tx_entries(struct i3c_hci *hci)
+{
+	u32 ptr = aspeed_i3c_read(hci, ASPEED_I3C_QUEUE_PTR0);
+	unsigned int w = FIELD_GET(ASPEED_I3C_QUEUE_PTR0_TX_W, ptr);
+	unsigned int r = FIELD_GET(ASPEED_I3C_QUEUE_PTR0_TX_R, ptr);
+
+	return CIRC_SPACE(w, r, ASPEED_I3C_TX_QUEUE_ENTRIES);
+}
+
 static void aspeed_i3c_phy_write(struct i3c_hci *hci, u32 reg, u32 val)
 {
 	writel(val, to_aspeed_vendor_data(hci)->phy_regs + reg);
diff --git a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h
index 84afb2bec956..7147abea830d 100644
--- a/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h
+++ b/drivers/i3c/master/mipi-i3c-hci/vendor_aspeed.h
@@ -52,6 +52,7 @@ u32 aspeed_i3c_read(struct i3c_hci *hci, u32 reg);
 void aspeed_i3c_write(struct i3c_hci *hci, u32 reg, u32 val);
 int aspeed_i3c_phy_init(struct i3c_hci *hci);
 void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len);
+unsigned int aspeed_i3c_avail_tx_entries(struct i3c_hci *hci);
 
 #define ASPEED_I3C_CTRL				0x00
 #define ASPEED_I3C_CTRL_CLOCK_STALL_EN		BIT(14)
@@ -68,6 +69,11 @@ void aspeed_i3c_ibi_grow_threshold(struct i3c_hci *hci, unsigned int ibi_max_len
 #define ASPEED_I3C_DAA_INDEX2			0x18
 #define ASPEED_I3C_DAA_INDEX3			0x1c
 
+#define ASPEED_I3C_QUEUE_PTR0			0xd8
+#define   ASPEED_I3C_QUEUE_PTR0_TX_R		GENMASK(24, 20)
+#define   ASPEED_I3C_QUEUE_PTR0_TX_W		GENMASK(16, 12)
+#define ASPEED_I3C_TX_QUEUE_ENTRIES		32
+
 #define ASPEED_I3C_INTR_STATUS			0xe0
 #define ASPEED_I3C_INTR_STATUS_ENABLE		0xe4
 #define ASPEED_I3C_INTR_SIGNAL_ENABLE		0xe8

-- 
2.34.1


