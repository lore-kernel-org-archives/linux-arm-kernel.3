Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0783C61CE8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Jun 2025 10:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=teU+mTm6ak5tVEBBaLvWP5VkTQ9LPJyHqUDdQRmKWKA=; b=c8xT3hP7aftSPd/5iYdISRtWtR
	L5sn/Zrfn37MPEt7iSf0JOhhkNCwgw/9w91bOYxKRIGwkkpjHWBai29gNpr7IkkdbmKBFXJThCyyh
	+Ydt2MpU8QRnk39u5F20LrQ+3PpcjVop1eDedmC0O8cG5Ko4Kxs9HQH8KGZ4dIWKZqkb9+HPyOGhu
	9vXXdgI6nDA5SuEs5mcT3vCOeGF775obKzUowixjsRYobz4UC/6I8hc5vL+HIZ1pGzy9Kq09nt4YQ
	gdYE6QwI58JPLriBzijSKqMXTxdDmQGjAdWEhPHg1n+jziyQLUu+9Ge2C7AYjyXP0D8Pk1P25sIAC
	JVAFDtHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZST-00000003rvL-3lGW;
	Mon, 09 Jun 2025 10:10:25 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOZOG-00000003rYy-2Fc4
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Jun 2025 10:06:06 +0000
Received: from isaac-ThinkPad-T16-Gen-2.lan (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 35F967F0;
	Mon,  9 Jun 2025 12:05:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749463554;
	bh=Oxi6CvbtEwJFAIheS0Yjn81hSn8AcxgbUDDVGvBrago=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KqiG/a9DhTbbfF1wJw6AV7gP30WzcwlHVANqLm2+Qlfq+XKFk83yU83H9YI7P59ed
	 p++JtIXxXNcw2Emrfgbsn9tM7BDFRWwDp1uzSEb3zx39UVvwTv8BC8Owb0z4k0igdu
	 i5fHUWFSlAxdjPaXB1l0LwPAOYHqaTS6KD9qA4EU=
From: Isaac Scott <isaac.scott@ideasonboard.com>
To: laurent.pinchart@ideasonboard.com
Cc: kieran.bingham@ideasonboard.com,
	rmfrfs@gmail.com,
	martink@posteo.de,
	kernel@puri.sm,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	linux-media@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Rui Miguel Silva <rui.silva@linaro.org>
Subject: [PATCH v3 1/2] media: imx-mipi-csis: Refactor interrupt status registers
Date: Mon,  9 Jun 2025 11:05:43 +0100
Message-ID: <20250609100544.571821-2-isaac.scott@ideasonboard.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250609100544.571821-1-isaac.scott@ideasonboard.com>
References: <20250609100544.571821-1-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_030604_867067_5EAF8F1D 
X-CRM114-Status: GOOD (  16.53  )
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

The NXP i.MX 8 MP CSI-2 receiver features multiple interrupt and debug
status sources which span multiple registers. The driver currently
supports two interrupt source registers, and attributes the
mipi_csis_event event entries to those registers through a boolean debug
field that indicate if the event relates to the main interrupt status
(false) or debug interrupt status (true) register. To make it easier to
add new event fields, replace the debug bool with a 'status index'
integer than indicates the index of the corresponding status register.

Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Rui Miguel Silva <rui.silva@linaro.org>

---

Changes since v2:
- Changed enum names to MIPI_CSIS_EVENT_TYPE_MAIN_0 and
  MIPI_CSIS_EVENT_TYPE_DEBUG
- Added imx-mipi-csis to commit title

Changes since v1:
- Switched from magic numbers to enum.
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 74 ++++++++++++----------
 1 file changed, 41 insertions(+), 33 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index d060eadebc7a..72432a8062f5 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -248,8 +248,13 @@
 #define MIPI_CSI2_DATA_TYPE_RAW14		0x2d
 #define MIPI_CSI2_DATA_TYPE_USER(x)		(0x30 + (x))
 
+enum mipi_csis_event_type {
+	MIPI_CSIS_EVENT_TYPE_MAIN_0 = 0,
+	MIPI_CSIS_EVENT_TYPE_DEBUG = 1,
+};
+
 struct mipi_csis_event {
-	bool debug;
+	enum mipi_csis_event_type status_index;
 	u32 mask;
 	const char * const name;
 	unsigned int counter;
@@ -257,30 +262,30 @@ struct mipi_csis_event {
 
 static const struct mipi_csis_event mipi_csis_events[] = {
 	/* Errors */
-	{ false, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,	"Wrong Configuration Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error" },
-	{ false, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,	"Data Type Ignored" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,	"Early Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,	"Early Frame Start" },
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_SOT_HS,		"SOT Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_LOST_FS,		"Lost Frame Start Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_LOST_FE,		"Lost Frame End Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_OVER,		"FIFO Overflow Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_WRONG_CFG,		"Wrong Configuration Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_ECC,		"ECC Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_CRC,		"CRC Error"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ERR_UNKNOWN,		"Unknown Error"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_DT_NOT_SUPPORT,	"Data Type Not Supported"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_DT_IGNORE,		"Data Type Ignored"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_ERR_FRAME_SIZE,	"Frame Size Error"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_TRUNCATED_FRAME,	"Truncated Frame"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_EARLY_FE,		"Early Frame End"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_EARLY_FS,		"Early Frame Start"},
 	/* Non-image data receive events */
-	{ false, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame" },
-	{ false, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame" },
-	{ false, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame" },
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_EVEN_BEFORE,		"Non-image data before even frame"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_EVEN_AFTER,		"Non-image data after even frame"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ODD_BEFORE,		"Non-image data before odd frame"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_ODD_AFTER,		"Non-image data after odd frame"},
 	/* Frame start/end */
-	{ false, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start" },
-	{ false, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge" },
-	{ true, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge" },
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_FRAME_START,		"Frame Start"},
+	{ MIPI_CSIS_EVENT_TYPE_MAIN_0, MIPI_CSIS_INT_SRC_FRAME_END,		"Frame End"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_FALL,	"VSYNC Falling Edge"},
+	{ MIPI_CSIS_EVENT_TYPE_DEBUG, MIPI_CSIS_DBG_INTR_SRC_CAM_VSYNC_RISE,	"VSYNC Rising Edge"},
 };
 
 #define MIPI_CSIS_NUM_EVENTS ARRAY_SIZE(mipi_csis_events)
@@ -765,32 +770,35 @@ static irqreturn_t mipi_csis_irq_handler(int irq, void *dev_id)
 	struct mipi_csis_device *csis = dev_id;
 	unsigned long flags;
 	unsigned int i;
-	u32 status;
-	u32 dbg_status;
+	u32 status[2];
 
-	status = mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
-	dbg_status = mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
+	status[MIPI_CSIS_EVENT_TYPE_MAIN_0] =
+				mipi_csis_read(csis, MIPI_CSIS_INT_SRC);
+	status[MIPI_CSIS_EVENT_TYPE_DEBUG] =
+				mipi_csis_read(csis, MIPI_CSIS_DBG_INTR_SRC);
 
 	spin_lock_irqsave(&csis->slock, flags);
 
 	/* Update the event/error counters */
-	if ((status & MIPI_CSIS_INT_SRC_ERRORS) || csis->debug.enable) {
+	if ((status[MIPI_CSIS_EVENT_TYPE_MAIN_0] & MIPI_CSIS_INT_SRC_ERRORS) ||
+							csis->debug.enable) {
 		for (i = 0; i < MIPI_CSIS_NUM_EVENTS; i++) {
 			struct mipi_csis_event *event = &csis->events[i];
 
-			if ((!event->debug && (status & event->mask)) ||
-			    (event->debug && (dbg_status & event->mask)))
+			if (status[event->status_index] & event->mask)
 				event->counter++;
 		}
 	}
 
-	if (status & MIPI_CSIS_INT_SRC_FRAME_START)
+	if (status[MIPI_CSIS_EVENT_TYPE_MAIN_0] & MIPI_CSIS_INT_SRC_FRAME_START)
 		mipi_csis_queue_event_sof(csis);
 
 	spin_unlock_irqrestore(&csis->slock, flags);
 
-	mipi_csis_write(csis, MIPI_CSIS_INT_SRC, status);
-	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC, dbg_status);
+	mipi_csis_write(csis, MIPI_CSIS_INT_SRC,
+			status[MIPI_CSIS_EVENT_TYPE_MAIN_0]);
+	mipi_csis_write(csis, MIPI_CSIS_DBG_INTR_SRC,
+			status[MIPI_CSIS_EVENT_TYPE_DEBUG]);
 
 	return IRQ_HANDLED;
 }
-- 
2.43.0


