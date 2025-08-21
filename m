Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FED4CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=egU0zB4oBcAjO1ZEtKZ1YL5DU1B8PIi0+Ouhkek1pKU=; b=RuPgqb5p1wB3tiqQdcF8sAgABA
	pZ6n1LhvoUtXSony7vg1xYK3KxzHA2E/lFpsk95vfze4B/Y18O/UX9+t5FeMiptws7i15pbAQKerR
	YU8EI038g9kBZFYg/rlAajmh1i7YgKBRXVvfL/xISS8jG9ZzHd0hvIOJ4SwgfrtPG3iG2URqVEga4
	d8/sRiRkw2sgOXgi8S1SHUjZMECA5OjrKHXDvIk/zzGriURgvIxaN8CJK2F9qoZZLiTcE39xqAJhF
	SLF+6fJ1XVFmb8f3j+yWPXcHp54aLShNF0YdB7ZkI/hK/XTsXMEExujed9s2XpIVihvayia1y7g86
	2HjPJRtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDub-00000000mes-0WkJ;
	Thu, 21 Aug 2025 22:37:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Of-0000000HQeR-3Y2P;
	Thu, 21 Aug 2025 15:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=egU0zB4oBcAjO1ZEtKZ1YL5DU1B8PIi0+Ouhkek1pKU=; b=SRL9KcvsYfe634LEza21hlD44s
	GP9ixm6vAJwBHCx+7+1XTiau4NyI+JCdmxdosbp10maMRu7o1vgEOvpEGV1e5Vbh7PshQs+xH6jvM
	LqtOsADLLQ3daL6zD7KVGUpHz06A4n6D0jqf6w2XVPjhqIymfXt0qKpr/TescNndW0RWp6iWo7f4z
	V6N1jq76OpHXVjtj+ZIP0zLt8cR+j47ezWP3F/tjgU84rIthhcMADRHwLVDXOXm3PWbsXrnw9Qs/d
	rVFdh4FjIHOg/CWYJK0Wo7PfDomUYza3o75mp+kH2aQZPFMLWyhghb6ry9a3Vl+gIgtDuTdL37jon
	xBZY+AEw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7Oc-00000000bKA-2qyC;
	Thu, 21 Aug 2025 15:40:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 862575C6434;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D9345C4AF54;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790804;
	bh=7y9x8hEHEH19KOEuvgwq8U5ghcJb+lno5nXbqmMoyEw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tJYM5tL6aDeObfODcSihpOEuKmjZBGE8LK7q2hdcQgBLFUwKhGur7ASJ3bDwoGsRp
	 IpxfmjIyGtbmvYO48eiyOYdVAnNi1Nw+6TmCj57b4PHHvDP4JPDjpISBQdlZn4ggZF
	 zmdRI/Cq6yko95qYOJsPrpj9Mn0AsPeGiLY9k/xgqfJh3IqKP0nq+FYUPwpWqYCTep
	 GCTKM7cF96MCPCYh4X/W3e0QYuOOvWF78hUtRsNuXTgbDeLq2+F/R/RHzj2jFvj7HJ
	 rXPlA5rHKp71B6roOnokI5Ftp9uPWn3hAr3yxc96DHBW4C9rb95X99Z01ZhZa/XXEE
	 4FhRW8d+eOquw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD364CA0FE1;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:06 +0000
Subject: [PATCH RFC 14/22] usb: typec: tipd: Register DisplayPort and
 Thunderbolt altmodes for cd321x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-14-172beda182b8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5612; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=7y9x8hEHEH19KOEuvgwq8U5ghcJb+lno5nXbqmMoyEw=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy280yG+TuV3wOdP+vnLqb+fuppvYiRya3CcJaFvc4w
 +a/L7vdUcrCIMbBICumyLJ9v73pk4dvBJduuvQeZg4rE8gQBi5OAZjI7YmMDB3ua6oZjwqx+Vz4
 9tU5cLtjyeNv66cmFQYXvUwznf7tZSTDP2NXM6XHzxt7bmw8kfFUt9GV17xl2s7Dq7VbdC1ULBu
 KOQE=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_164011_275340_11AD1706 
X-CRM114-Status: GOOD (  14.91  )
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
 drivers/usb/typec/tipd/core.c | 87 +++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 84 insertions(+), 3 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 59d270eb50ea3dc49ad32ff71f8354e23c1083c9..e369897bfa017ca96e559a8bd70da11207d4513a 100644
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
@@ -145,6 +147,7 @@ struct tipd_data {
 	u64 irq_mask1;
 	size_t tps_struct_size;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
+	void (*unregister_port)(struct tps6598x *tps);
 	void (*trace_data_status)(u32 status);
 	void (*trace_power_status)(u16 status);
 	void (*trace_status)(u32 status);
@@ -186,6 +189,9 @@ struct cd321x {
 	struct tps6598x_dp_sid_status_reg dp_sid_status;
 	struct tps6598x_intel_vid_status_reg intel_vid_status;
 	struct tps6598x_usb4_status_reg usb4_status;
+
+	struct typec_altmode *port_altmode_dp;
+	struct typec_altmode *port_altmode_tbt;
 };
 
 static enum power_supply_property tps6598x_psy_props[] = {
@@ -965,6 +971,78 @@ tps6598x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
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
+	if (cd321x->port_altmode_dp)
+		typec_unregister_altmode(cd321x->port_altmode_dp);
+	if (cd321x->port_altmode_tbt)
+		typec_unregister_altmode(cd321x->port_altmode_tbt);
+	cd321x->port_altmode_dp = NULL;
+	cd321x->port_altmode_tbt = NULL;
+	typec_unregister_port(tps->port);
+}
+
 static int tps_request_firmware(struct tps6598x *tps, const struct firmware **fw,
 				const char **firmware_name)
 {
@@ -1506,7 +1584,7 @@ static int tps6598x_probe(struct i2c_client *client)
 err_disconnect:
 	tps6598x_disconnect(tps, 0);
 err_unregister_port:
-	typec_unregister_port(tps->port);
+	tps->data->unregister_port(tps);
 err_role_put:
 	usb_role_switch_put(tps->role_sw);
 err_fwnode_put:
@@ -1530,7 +1608,7 @@ static void tps6598x_remove(struct i2c_client *client)
 		devm_free_irq(tps->dev, client->irq, tps);
 
 	tps6598x_disconnect(tps, 0);
-	typec_unregister_port(tps->port);
+	tps->data->unregister_port(tps);
 	usb_role_switch_put(tps->role_sw);
 
 	/* Reset PD controller to remove any applied patch */
@@ -1599,7 +1677,8 @@ static const struct tipd_data cd321x_data = {
 		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
 		     APPLE_CD_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct cd321x),
-	.register_port = tps6598x_register_port,
+	.register_port = cd321x_register_port,
+	.unregister_port = cd321x_unregister_port,
 	.trace_data_status = trace_cd321x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1616,6 +1695,7 @@ static const struct tipd_data tps6598x_data = {
 		     TPS_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps6598x_register_port,
+	.unregister_port = tps6598x_unregister_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1632,6 +1712,7 @@ static const struct tipd_data tps25750_data = {
 		     TPS_REG_INT_PLUG_EVENT,
 	.tps_struct_size = sizeof(struct tps6598x),
 	.register_port = tps25750_register_port,
+	.unregister_port = tps6598x_unregister_port,
 	.trace_data_status = trace_tps6598x_data_status,
 	.trace_power_status = trace_tps25750_power_status,
 	.trace_status = trace_tps25750_status,

-- 
2.34.1



