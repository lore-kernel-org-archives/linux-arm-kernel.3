Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ECA4CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  6 Sep 2025 16:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oRUnVVwkTzhlp52SpHfJTBS58hnI1XYX2uQ7kYv5hBI=; b=ztXpa5Vj3FloAMU3YgmTFwuqOT
	W8AWwZGl7FDboQXgXcwMgwDaX5VPk8BcrHLPNJMfXylofmasvkgk4uGJArmcsFCudEfk31ZReY3a4
	PpTl3Tc/DJn+MDkqej+4dLz9tzk3FPj6cfhZjSP98dwXi6HtBsf5BwmVJN4LRdt/2bwVXzPwHD6Vy
	OrHJodkB1uj/NwdjwGIgwLEyZxM4Le6jfkI9F8UQEG7mUg94jrD7BCvOXJUzDYOo/Lbns3cgfFdbv
	/+dM3yfdSz8hSSEIvRJ6rmT7yMV8aGftlxwkyIqXci3LxYNKBpiCIuwTKiKn0TV5C868jWyt5tFXz
	/8PE/VoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuviC-000000086hz-13v8;
	Sat, 06 Sep 2025 16:24:24 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuv4o-000000081hr-3Ghu;
	Sat, 06 Sep 2025 15:43:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0861C45214;
	Sat,  6 Sep 2025 15:43:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9DB4C4CEFE;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757173419;
	bh=sNTZAaAEhZ4bZmshDMImxkogVK30dZbNtflvQruejvE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kmOayccZkJJMb63vm0aS7JLNNdJhS6PbG3OWEQwS8KtzMkIr77criH2f8uyMJpDrH
	 bK3motw7FPQBK3kRkcmv0tznlgxFgClAas3laNJPGqHl7CBKTnb9yWTjOEWW/lT7oh
	 cq39FCWN5mZmbTCvnHfUAM0surpmUkVglT+S8HOGWj4FrZp7xGuCiMvx4oAvkFPbLQ
	 Bfcxi/rXbVRbgjhn1fRjMvqzqD18T5liFhM4uwCdPeBeDhRhWqAuBLZBU2JxczEmo6
	 maUIJM1XYh6/xZ9OpMjQjiIn7ASGILssKhUtfqJNp/CsjKNW5gvwmL9DMEf2c+CWXb
	 ESR37MuJDPVOA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0183CA1012;
	Sat,  6 Sep 2025 15:43:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sat, 06 Sep 2025 15:43:24 +0000
Subject: [PATCH v2 11/22] usb: typec: tipd: Register DisplayPort and
 Thunderbolt altmodes for cd321x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250906-atcphy-6-17-v2-11-52c348623ef6@kernel.org>
References: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
In-Reply-To: <20250906-atcphy-6-17-v2-0-52c348623ef6@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Felipe Balbi <balbi@kernel.org>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>, 
 Ran Wang <ran.wang_1@nxp.com>, Peter Chen <peter.chen@nxp.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, asahi@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5545; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=sNTZAaAEhZ4bZmshDMImxkogVK30dZbNtflvQruejvE=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8aesAWq7/26v3KU6b/5FV7sJCgg+cC670702QUWsgt/i
 shbd+zvKGVhEONgkBVTZNm+3970ycM3gks3XXoPM4eVCWQIAxenAExEso/hf23UuqatXw5m7eMV
 UzawcguYtjD8tOoJLe31k1wCLy0sWsjwP/7XzPnr76v6H9bQmBo+OY1j4/nveuzZFsxG7123xh1
 LZAUA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250906_084342_891690_2EA26BBF 
X-CRM114-Status: GOOD (  14.23  )
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

Ports equipped with a CD321x are only found on Apple Silicon machines
and always support DisplayPort, Thunderbolt and USB4. Register these
port modes unconditionally.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 85 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 82 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index afd11b3e1ae596c7f3283e4336aaa57874c9378d..c7cf936e5a61a331271c05b68ff1b77b89c0f643 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -16,6 +16,8 @@
 #include <linux/interrupt.h>
 #include <linux/usb/typec.h>
 #include <linux/usb/typec_altmode.h>
+#include <linux/usb/typec_dp.h>
+#include <linux/usb/typec_tbt.h>
 #include <linux/usb/role.h>
 #include <linux/workqueue.h>
 #include <linux/firmware.h>
@@ -144,6 +146,7 @@ struct tipd_data {
 	u64 irq_mask1;
 	size_t tps_struct_size;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
+	void (*unregister_port)(struct tps6598x *tps);
 	void (*trace_data_status)(u32 status);
 	void (*trace_power_status)(u16 status);
 	void (*trace_status)(u32 status);
@@ -185,6 +188,9 @@ struct cd321x {
 	struct tps6598x_dp_sid_status_reg dp_sid_status;
 	struct tps6598x_intel_vid_status_reg intel_vid_status;
 	struct tps6598x_usb4_status_reg usb4_status;
+
+	struct typec_altmode *port_altmode_dp;
+	struct typec_altmode *port_altmode_tbt;
 };
 
 static enum power_supply_property tps6598x_psy_props[] = {
@@ -964,6 +970,76 @@ tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 	return 0;
 }
 
+static int cd321x_register_port_altmodes(struct cd321x *cd321x)
+{
+	struct typec_altmode_desc desc;
+	struct typec_altmode *amode;
+
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_DP_SID;
+	desc.mode = USB_TYPEC_DP_MODE;
+	desc.vdo = DP_CONF_SET_PIN_ASSIGN(BIT(DP_PIN_ASSIGN_C) | BIT(DP_PIN_ASSIGN_D));
+	desc.vdo |= DP_CAP_DFP_D;
+	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
+	if (IS_ERR(amode))
+		return PTR_ERR(amode);
+	cd321x->port_altmode_dp = amode;
+
+	memset(&desc, 0, sizeof(desc));
+	desc.svid = USB_TYPEC_TBT_SID;
+	desc.mode = TYPEC_ANY_MODE;
+	amode = typec_port_register_altmode(cd321x->tps.port, &desc);
+	if (IS_ERR(amode)) {
+		typec_unregister_altmode(cd321x->port_altmode_dp);
+		cd321x->port_altmode_dp = NULL;
+		return PTR_ERR(amode);
+	}
+	cd321x->port_altmode_tbt = amode;
+
+	return 0;
+}
+
+static int
+cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+	int ret;
+
+	ret = tps6598x_register_port(tps, fwnode);
+	if (ret)
+		return ret;
+
+	ret = cd321x_register_port_altmodes(cd321x);
+	if (ret)
+		goto err_unregister_port;
+
+	typec_set_mode(tps->port, TYPEC_STATE_SAFE);
+
+	return 0;
+
+err_unregister_port:
+	typec_unregister_port(tps->port);
+	return ret;
+}
+
+static void
+tps6598x_unregister_port(struct tps6598x *tps)
+{
+	typec_unregister_port(tps->port);
+}
+
+static void
+cd321x_unregister_port(struct tps6598x *tps)
+{
+	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+
+	typec_unregister_altmode(cd321x->port_altmode_dp);
+	cd321x->port_altmode_dp = NULL;
+	typec_unregister_altmode(cd321x->port_altmode_tbt);
+	cd321x->port_altmode_tbt = NULL;
+	typec_unregister_port(tps->port);
+}
+
 static int tps_request_firmware(struct tps6598x *tps, const struct firmware **fw,
 				const char **firmware_name)
 {
@@ -1505,7 +1581,7 @@ static int tps6598x_probe(struct i2c_client *client)
 err_disconnect:
 	tps6598x_disconnect(tps, 0);
 err_unregister_port:
-	typec_unregister_port(tps->port);
+	tps->data->unregister_port(tps);
 err_role_put:
 	usb_role_switch_put(tps->role_sw);
 err_fwnode_put:
@@ -1529,7 +1605,7 @@ static void tps6598x_remove(struct i2c_client *client)
 		devm_free_irq(tps->dev, client->irq, tps);
 
 	tps6598x_disconnect(tps, 0);
-	typec_unregister_port(tps->port);
+	tps->data->unregister_port(tps);
 	usb_role_switch_put(tps->role_sw);
 
 	/* Reset PD controller to remove any applied patch */
@@ -1598,7 +1674,8 @@ static const struct tipd_data cd321x_data = {
 		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct cd321x),
-	.register_port = tps6598x_register_port,
+	.register_port = cd321x_register_port,
+	.unregister_port = cd321x_unregister_port,
 	.trace_data_status = trace_cd321x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1615,6 +1692,7 @@ static const struct tipd_data tps6598x_data = {
 		     TPS_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps6598x_register_port,
+	.unregister_port = tps6598x_unregister_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1631,6 +1709,7 @@ static const struct tipd_data tps25750_data = {
 		     TPS_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps25750_register_port,
+	.unregister_port = tps6598x_unregister_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps25750_power_status,
 	.trace_status = trace_tps25750_status,

-- 
2.34.1



