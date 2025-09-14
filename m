Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DDB2CAC594
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZoCd+PlzAT9nUVHPwMBXIm0Hp4RU/3rKlU1L4Z5oHdI=; b=FUZU4macPH2RznEURHct1FFfjL
	9kkMRnvQEwpiqvlsjchwdxKGpv7A76imVqg4mxCgMR1Sv0ty+gsbO8nkAh0g/CCNepofB2vfBXpZ5
	V5gzeKekXbLj24Cbi8Bqb7tWITqRmpMF0mGmCCiwN5Sw41mY+qO0p/rrdYxpVC8clMD0ktuoc7fmz
	i9zuSOyXYBd+ryVksWwuKN0ShlpH/uUvrkF/VKqBj7YhCL6tnahqlLqhoDprfWuWTYRclFBPEwsNQ
	ytiy6anXHD4D5Hfb+HgC9+i+kons2qxyqbdNYt2y0WnYUSsDUpnxKmrP0xHAfcUHSBvB/YPnzRFGb
	pch4MKgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHu-00000001ELh-0l5V;
	Sun, 14 Sep 2025 12:57:02 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHh-00000001EDZ-2B04
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 757FF441D5;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4DB05C4CEFB;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=bkv8jzt0SlhPpGAzBP2M8JpCFXBPIbTEJnxp6p0XalI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DLr8NEOJI+EWwgLIw/sjWoQtam15iOEQ5xG5nR4uotN6ha4LFHoa9dHn4XDJp2fqu
	 kKcHecuYr59bZU4PG4i7UA6dvUq36O+69Vw/whoCqLgDXZLowN7gzJvLWxNOi7m16q
	 IRQZYOzC8/RjUyAqk7RU1qbbRO/pS39WbPrzMqhXL+wiaqHXTvjhGmqTtYVCbPTgSR
	 iZk0FI1AJYaBf92UV+66hwvacH8dmreWPOAYRrRHjIX6WnehVGUaBsmsvLgBXOu7yj
	 0Aye4AlZNtZVHzxL9wlb4x3ClNOhOZFB28RmbTd4z7eNRq+vjSBG+PVUwZ0TgWw2hm
	 /JD+1z/drr4Ng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4650FCAC582;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:09 +0000
Subject: [PATCH 04/11] usb: typec: tipd: Trace data status for CD321x
 correctly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-4-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5739; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=bkv8jzt0SlhPpGAzBP2M8JpCFXBPIbTEJnxp6p0XalI=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3TWOx5a5PDk+//kDq4+bnjO8VtS7GLfdIn6ayaaYu
 3xVNbcud5SyMIhxMMiKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmMsmdkaF7c6PJOa7Q3B0f
 Qn/kPk8KmmF+c6Jx2F2huKD0Ov5zd/cwMkys3p097WyZ0Y69JX+UpkeZNDW+/cS/vTZRr1ymQe5
 OFgsA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_055649_628713_28F7499C 
X-CRM114-Status: GOOD (  13.35  )
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

Some bits inside the CD321x TPS_DATA_STATUS register have a different
function compared to the original tipd chip. Add these and introduce a
separate trace function to show them correctly.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c     |  8 +++++++-
 drivers/usb/typec/tipd/tps6598x.h |  5 +++++
 drivers/usb/typec/tipd/trace.h    | 39 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 51 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 4815c5c462837865a5f9d37bbc139249c82c2f75..19d713937870304e68325a441b0de63eb5db3b80 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -114,6 +114,7 @@ struct tipd_data {
 	irq_handler_t irq_handler;
 	u64 irq_mask1;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
+	void (*trace_data_status)(u32 status);
 	void (*trace_power_status)(u16 status);
 	void (*trace_status)(u32 status);
 	int (*apply_patch)(struct tps6598x *tps);
@@ -492,7 +493,9 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
 		dev_err(tps->dev, "failed to read data status: %d\n", ret);
 		return false;
 	}
-	trace_tps6598x_data_status(data_status);
+
+	if (tps->data->trace_data_status)
+		tps->data->trace_data_status(data_status);
 
 	return true;
 }
@@ -1519,6 +1522,7 @@ static const struct tipd_data cd321x_data = {
 		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_PLUG_EVENT,
 	.register_port = tps6598x_register_port,
+	.trace_data_status = trace_cd321x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
 	.init = cd321x_init,
@@ -1532,6 +1536,7 @@ static const struct tipd_data tps6598x_data = {
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
 		     TPS_REG_INT_PLUG_EVENT,
 	.register_port = tps6598x_register_port,
+	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
 	.apply_patch = tps6598x_apply_patch,
@@ -1545,6 +1550,7 @@ static const struct tipd_data tps25750_data = {
 		     TPS_REG_INT_DATA_STATUS_UPDATE |
 		     TPS_REG_INT_PLUG_EVENT,
 	.register_port = tps25750_register_port,
+	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps25750_power_status,
 	.trace_status = trace_tps25750_status,
 	.apply_patch = tps25750_apply_patch,
diff --git a/drivers/usb/typec/tipd/tps6598x.h b/drivers/usb/typec/tipd/tps6598x.h
index cecb8d11d23972dab0d8c15458b4052af7510b03..03edbb77bbd6d8093b2560db83e5913e25d06154 100644
--- a/drivers/usb/typec/tipd/tps6598x.h
+++ b/drivers/usb/typec/tipd/tps6598x.h
@@ -197,6 +197,11 @@
 #define TPS_DATA_STATUS_FORCE_LSX	     BIT(23)
 #define TPS_DATA_STATUS_POWER_MISMATCH	     BIT(24)
 
+/* modified TPS_REG_DATA_STATUS bits for CD321x (and likely also TPS65987DDK) */
+#define CD321X_DATA_STATUS_HPD_IRQ	     BIT(14)
+#define CD321X_DATA_STATUS_HPD_LEVEL	     BIT(15)
+#define CD321X_DATA_STATUS_USB4_CONNECTION   BIT(23)
+
 #define TPS_DATA_STATUS_DP_PIN_ASSIGNMENT_MASK GENMASK(11, 10)
 #define TPS_DATA_STATUS_DP_PIN_ASSIGNMENT(x) \
 	TPS_FIELD_GET(TPS_DATA_STATUS_DP_PIN_ASSIGNMENT_MASK, (x))
diff --git a/drivers/usb/typec/tipd/trace.h b/drivers/usb/typec/tipd/trace.h
index bea383f2db9de5bbf1804fbad9ee6b134407b932..e9e40425138a01f15e35867f38f62e13623dbcec 100644
--- a/drivers/usb/typec/tipd/trace.h
+++ b/drivers/usb/typec/tipd/trace.h
@@ -217,6 +217,26 @@
 		{ TPS_DATA_STATUS_FORCE_LSX,		"FORCE_LSX" }, \
 		{ TPS_DATA_STATUS_POWER_MISMATCH,	"POWER_MISMATCH" })
 
+#define show_cd321x_data_status_flags(data_status) \
+	__print_flags(data_status & TPS_DATA_STATUS_FLAGS_MASK, "|", \
+		{ TPS_DATA_STATUS_DATA_CONNECTION,	"DATA_CONNECTION" }, \
+		{ TPS_DATA_STATUS_UPSIDE_DOWN,		"DATA_UPSIDE_DOWN" }, \
+		{ TPS_DATA_STATUS_ACTIVE_CABLE,		"ACTIVE_CABLE" }, \
+		{ TPS_DATA_STATUS_USB2_CONNECTION,	"USB2_CONNECTION" }, \
+		{ TPS_DATA_STATUS_USB3_CONNECTION,	"USB3_CONNECTION" }, \
+		{ TPS_DATA_STATUS_USB3_GEN2,		"USB3_GEN2" }, \
+		{ TPS_DATA_STATUS_USB_DATA_ROLE,	"USB_DATA_ROLE" }, \
+		{ TPS_DATA_STATUS_DP_CONNECTION,	"DP_CONNECTION" }, \
+		{ TPS_DATA_STATUS_DP_SINK,		"DP_SINK" }, \
+		{ CD321X_DATA_STATUS_HPD_IRQ,		"HPD_IRQ" }, \
+		{ CD321X_DATA_STATUS_HPD_LEVEL,		"HPD_LEVEL" }, \
+		{ TPS_DATA_STATUS_TBT_CONNECTION,	"TBT_CONNECTION" }, \
+		{ TPS_DATA_STATUS_TBT_TYPE,		"TBT_TYPE" }, \
+		{ TPS_DATA_STATUS_OPTICAL_CABLE,	"OPTICAL_CABLE" }, \
+		{ TPS_DATA_STATUS_ACTIVE_LINK_TRAIN,	"ACTIVE_LINK_TRAIN" }, \
+		{ CD321X_DATA_STATUS_USB4_CONNECTION,	"USB4" }, \
+		{ TPS_DATA_STATUS_POWER_MISMATCH,	"POWER_MISMATCH" })
+
 #define show_data_status_dp_pin_assignment(data_status) \
 	__print_symbolic(TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT(data_status), \
 		{ TPS_DATA_STATUS_DP_SPEC_PIN_ASSIGNMENT_E, "E" }, \
@@ -388,6 +408,25 @@ TRACE_EVENT(tps6598x_data_status,
 		    )
 );
 
+TRACE_EVENT(cd321x_data_status,
+	TP_PROTO(u32 data_status),
+	TP_ARGS(data_status),
+
+	TP_STRUCT__entry(
+			 __field(u32, data_status)
+			 ),
+
+	TP_fast_assign(
+		       __entry->data_status = data_status;
+		       ),
+
+	TP_printk("%s%s%s",
+		  show_cd321x_data_status_flags(__entry->data_status),
+		  __entry->data_status & TPS_DATA_STATUS_DP_CONNECTION ? ", DP pinout " : "",
+		  maybe_show_data_status_dp_pin_assignment(__entry->data_status)
+		)
+);
+
 #endif /* _TPS6598X_TRACE_H_ */
 
 /* This part must be outside protection */

-- 
2.34.1



