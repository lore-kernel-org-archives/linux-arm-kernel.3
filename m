Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B64CA0FE2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m22CVUh5ssuA0MSvMdgCylzINTWekwPBijUpcVgPa4M=; b=YEJfya1AZhJqL/Xo8Rg6b5NtQf
	lNLr3YGhNM64zITC42KRAzrQwk5BkvCw5zdosvkfcZHLN/WHVnbNIwqNvsfx07Rb3ZxlkYTQtKSst
	lTNXxP1KOSvXUEgngtHngAhQ8xO5ZtCegSSBLUZ66/aPOmaf0E2wgpgeY1spbqm1Zyec1HQ5AT/F8
	CN9NEUlu4JA+sYADTv5yF2xtDZ5nW2ZIrj0SEtBCvsFhpINP/W5TeuWChRwsnGcaUUPW9hyx8TJMk
	BvNRhwCFYwXhSSKoSpldOGuPYpd1YEjo/J3OW9dMeeyD4eEuKXCOveOnQAjyOtksMNGzvYIPNsO/R
	blryZ69Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDt0-00000000kmo-033m;
	Thu, 21 Aug 2025 22:35:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OX-0000000HQXQ-1O8L;
	Thu, 21 Aug 2025 15:40:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6FD1760256;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C96C9C4AF48;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=Urxdz7uHH/ApxVzU2fUlpMXmcppMZ1TW/uJf2k/UbqU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=sPCBoCXLhsoIf9D+LlpaQlkp8JNDcmmyTbVUIVYwSFrkP612oMkdDpsNWCofgfaNs
	 1X6SUaEl9uK2gHNn8xHKeaag3NwACbFMn5p3T3KZQJLNOsIFDlppak1YrLCETeNkjR
	 NRCaA0rPpo5W0eyNwkJ/nhHz51rGMIDlct/G97sR6UjdO2Q3xCx/5mx98/Kedtf3cn
	 3YkVnZyNm+cWzAVGx5zob/6werMi36QSWNm9oAbr7SksUGwwWbuYyHZXfGRCaagr2Q
	 QlNZod5RC0sXRIQIPsUJ+qJUPOrSsc6vj6DYTJwpSwJFbe3zKaA/rIYqcwSykdI7V0
	 Vc9UTfPYObaGw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFAE0CA0EEB;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:05 +0000
Subject: [PATCH RFC 13/22] usb: typec: tipd: Read USB4, Thunderbolt and
 DisplayPort status for cd321x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-13-172beda182b8@kernel.org>
References: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
In-Reply-To: <20250821-atcphy-6-17-v1-0-172beda182b8@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5722; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Urxdz7uHH/ApxVzU2fUlpMXmcppMZ1TW/uJf2k/UbqU=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy240Vn53sy+2LVu8SlD+0wuwkt7TT+hVrVgW8O7/j2
 v3yE18EO0pZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATObqOkeFiTuDOHLa6CLa/
 JepWwcvnvty33KVtgvT12XXrdDhKd6sy/I+a8u5FvuSyFU0Sfkt0DqfZeulsaC7qkUjjMlMSYd/
 2mxUA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
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

CD321x supports various alternate modes and stores information once
these are entered into separate status registers. Read those when they
are active when reading TPS_DATA_STATUS to prepare supporting these.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 81 ++++++++++++++++++++++++++++++++++++++++---
 1 file changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 51b0f3be8b66a743ddc3ea96c1b25f597a1e8f6c..59d270eb50ea3dc49ad32ff71f8354e23c1083c9 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -35,14 +35,19 @@
 #define TPS_REG_INT_MASK2		0x17
 #define TPS_REG_INT_CLEAR1		0x18
 #define TPS_REG_INT_CLEAR2		0x19
-#define TPS_REG_SYSTEM_POWER_STATE	0x20
 #define TPS_REG_STATUS			0x1a
+#define TPS_REG_SYSTEM_POWER_STATE	0x20
+#define TPS_REG_USB4_STATUS		0x24
+#define TPS_REG_DP_SID_STATUS		0x58
 #define TPS_REG_SYSTEM_CONF		0x28
 #define TPS_REG_CTRL_CONF		0x29
 #define TPS_REG_BOOT_STATUS		0x2D
 #define TPS_REG_POWER_STATUS		0x3f
 #define TPS_REG_PD_STATUS		0x40
 #define TPS_REG_RX_IDENTITY_SOP		0x48
+#define TPS_REG_CF_VID_STATUS		0x5e
+#define TPS_REG_DP_SID_STATUS		0x58
+#define TPS_REG_INTEL_VID_STATUS	0x59
 #define TPS_REG_DATA_STATUS		0x5f
 #define TPS_REG_SLEEP_CONF		0x70
 
@@ -85,6 +90,31 @@ struct tps6598x_rx_identity_reg {
 	struct usb_pd_identity identity;
 } __packed;
 
+/* TPS_REG_USB4_STATUS */
+struct tps6598x_usb4_status_reg {
+	u8 mode_status;
+	__le32 eudo;
+	__le32 unknown;
+} __packed;
+
+/* TPS_REG_DP_SID_STATUS */
+struct tps6598x_dp_sid_status_reg {
+	u8 mode_status;
+	__le32 status_tx;
+	__le32 status_rx;
+	__le32 configure;
+	__le32 mode_data;
+} __packed;
+
+/* TPS_REG_INTEL_VID_STATUS */
+struct tps6598x_intel_vid_status_reg {
+	u8 mode_status;
+	__le32 attention_vdo;
+	__le16 enter_vdo;
+	__le16 device_mode;
+	__le16 cable_mode;
+} __packed;
+
 /* Standard Task return codes */
 #define TPS_TASK_TIMEOUT		1
 #define TPS_TASK_REJECTED		3
@@ -121,6 +151,7 @@ struct tipd_data {
 	int (*apply_patch)(struct tps6598x *tps);
 	int (*init)(struct tps6598x *tps);
 	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
+	bool (*read_data_status)(struct tps6598x *tps);
 	int (*reset)(struct tps6598x *tps);
 };
 
@@ -151,6 +182,10 @@ struct tps6598x {
 
 struct cd321x {
 	struct tps6598x tps;
+
+	struct tps6598x_dp_sid_status_reg dp_sid_status;
+	struct tps6598x_intel_vid_status_reg intel_vid_status;
+	struct tps6598x_usb4_status_reg usb4_status;
 };
 
 static enum power_supply_property tps6598x_psy_props[] = {
@@ -505,6 +540,41 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
 	return true;
 }
 
+static bool cd321x_read_data_status(struct tps6598x *tps)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+	int ret;
+
+	ret = tps6598x_read_data_status(tps);
+	if (ret < 0)
+		return false;
+
+	if (tps->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
+		ret = tps6598x_block_read(tps, TPS_REG_DP_SID_STATUS,
+				&cd321x->dp_sid_status, sizeof(cd321x->dp_sid_status));
+		if (ret)
+			dev_err(tps->dev, "Failed to read DP SID Status: %d\n",
+				ret);
+	}
+
+	if (tps->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
+		ret = tps6598x_block_read(tps, TPS_REG_INTEL_VID_STATUS,
+				&cd321x->intel_vid_status, sizeof(cd321x->intel_vid_status));
+		if (ret)
+			dev_err(tps->dev, "Failed to read Intel VID Status: %d\n", ret);
+	}
+
+	if (tps->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
+		ret = tps6598x_block_read(tps, TPS_REG_USB4_STATUS,
+				&cd321x->usb4_status, sizeof(cd321x->usb4_status));
+		if (ret)
+			dev_err(tps->dev,
+				"Failed to read USB4 Status: %d\n", ret);
+	}
+
+	return true;
+}
+
 static bool tps6598x_read_power_status(struct tps6598x *tps)
 {
 	u16 pwr_status;
@@ -565,7 +635,7 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 			goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
-		if (!tps6598x_read_data_status(tps))
+		if (!tps->data->read_data_status(tps))
 			goto err_unlock;
 
 	/* Handle plug insert or removal */
@@ -614,7 +684,7 @@ static irqreturn_t tps25750_interrupt(int irq, void *data)
 			goto err_clear_ints;
 
 	if (event[0] & TPS_REG_INT_DATA_STATUS_UPDATE)
-		if (!tps6598x_read_data_status(tps))
+		if (!tps->data->read_data_status(tps))
 			goto err_clear_ints;
 
 	/*
@@ -688,7 +758,7 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 			goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
-		if (!tps6598x_read_data_status(tps))
+		if (!tps->data->read_data_status(tps))
 			goto err_unlock;
 
 	/* Handle plug insert or removal */
@@ -1534,6 +1604,7 @@ static const struct tipd_data cd321x_data = {
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
 	.init = cd321x_init,
+	.read_data_status = cd321x_read_data_status,
 	.reset = cd321x_reset,
 	.switch_power_state = cd321x_switch_power_state,
 };
@@ -1550,6 +1621,7 @@ static const struct tipd_data tps6598x_data = {
 	.trace_status = trace_tps6598x_status,
 	.apply_patch = tps6598x_apply_patch,
 	.init = tps6598x_init,
+	.read_data_status = tps6598x_read_data_status,
 	.reset = tps6598x_reset,
 };
 
@@ -1565,6 +1637,7 @@ static const struct tipd_data tps25750_data = {
 	.trace_status = trace_tps25750_status,
 	.apply_patch = tps25750_apply_patch,
 	.init = tps25750_init,
+	.read_data_status = tps6598x_read_data_status,
 	.reset = tps25750_reset,
 };
 

-- 
2.34.1



