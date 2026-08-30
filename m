Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA5FAC624A3
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Aug 2026 20:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pnnge/FHQ0W4rdccHQTWF/5SMigOg4tf84Ptp/DmPXI=; b=k3HseDtwEjpSRpsXJ2CX41qTl9
	+OwRZdb/XgUwpVGB8nk3SxQouxnaLcPvlPVughnR9PC+/mUjEUcCw4VmFkLNzPWmw8eSvlmEe2I1f
	nM2MpJf1eTVO2enhuLXagndXULO0K6tMpHCzHyDmuEAJ+O62yd5/G2flHisJNrPWuyhiaqGZnJ+S8
	n/yKX+n/th8FMQUxWqrwYO6uQPBlWr56q/TcU4k0BoJwSe/TUDyETaUd2pkFOyHZHW82oYEZSjKBd
	jwseasaddXyfuKlOQOImVa5RTBu8qRy+sCruXGjnBNzlarc9UIuOxhGxVd9YgDGO2feUG7Xgon90q
	/t2D0qag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0I-000000082rl-1S5Q;
	Sun, 30 Aug 2026 20:19:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0m0G-000000082p7-2zs6
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Aug 2026 20:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 24CF243E48;
	Sun, 30 Aug 2026 20:19:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id E69C6C2BD00;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788121184;
	bh=q5r1Np3eUnTrcGkauW7sWKDIVR3AiUTcYWTLnTecjRk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=A/0hoQqMWvuDHEBCBUQfEehc/0HPvx1YdDvn1Pe3wJRJgr7IIIkd7pyXIz7rpHf8+
	 HhjqeA3tpxGqsRgMomY0JCexiuhPocIx7rgHQuF/MBhjTs4VI2521K/c/YsuawJ3s1
	 OTYsuQyvvrwvwJiA4bZOSRXSPu+lhRwhcPwIsjmBZtn5VmSHPwrAnxO1ZaS3f/mMnQ
	 1/QzEawK0X+QnWQd1OVekrA/VmIY6L65lcTtWX2SA9pN+Yxv+CExUIYuFVTgLGY0vr
	 Sci12T4FnhBwU0Bsaoghsw1IHx8NM6kmyi00WXRvBQkodioPzIvf9plYnNIMJCP5sO
	 zQs6CxL2ioo2g==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8542C61DE1;
	Sun, 30 Aug 2026 20:19:43 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 30 Aug 2026 22:19:21 +0200
Subject: [PATCH 03/19] usb: typec: tipd: Hook up Thunderbolt switch for
 CD321x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260830-b4-apple-soc-tbt-v1-3-44bc9348683c@kernel.org>
References: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
In-Reply-To: <20260830-b4-apple-soc-tbt-v1-0-44bc9348683c@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Mika Westerberg <westeri@kernel.org>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Konrad Dybcio <konradybcio@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5456; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=q5r1Np3eUnTrcGkauW7sWKDIVR3AiUTcYWTLnTecjRk=;
 b=owGbwMvMwCXmIlirolUq95LxtFoSQ9aUCcEvz8Zqf/RaeGPtVz3fzT37LhzIDzx/7okus8bvZ
 rM/a9itO0pZGMS4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQAT2S3B8Jvt8rrFP/3YZKd6
 zJme18FY+uiBcf2mqjmJdQFubg+UuxYwMnQV3U8OTAtjz5IzcoqU3JwielmIabrcoY+/DJOy1y4
 qZwQA
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

Look up the Thunderbolt switch for CD321x ports and forward cable details
whenever a Thunderbolt or USB4 connection comes up or goes away.

Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 522f56742aa9..5016f9dba956 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -216,6 +216,8 @@ struct cd321x {
 	struct typec_mux *mux;
 	struct typec_mux_state state;
 
+	struct typec_thunderbolt_switch *tbt_switch;
+
 	struct cd321x_status update_status;
 	struct delayed_work update_work;
 	struct usb_pd_identity cur_partner_identity;
@@ -677,6 +679,9 @@ static void tps6598x_handle_plug_event(struct tps6598x *tps, u32 status)
 static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status *st)
 {
 	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
+	struct typec_thunderbolt_switch_data tbt_switch_data = {
+		.state = TYPEC_THUNDERBOLT_SWITCH_OFF,
+	};
 
 	if (!(st->data_status & TPS_DATA_STATUS_DATA_CONNECTION)) {
 		if (cd321x->state.mode == TYPEC_STATE_SAFE)
@@ -684,6 +689,7 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.alt = NULL;
 		cd321x->state.mode = TYPEC_STATE_SAFE;
 		cd321x->state.data = NULL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		typec_mux_set(cd321x->mux, &cd321x->state);
 	} else if (st->data_status & TPS_DATA_STATUS_DP_CONNECTION) {
 		struct typec_displayport_data dp_data;
@@ -723,6 +729,7 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.alt = cd321x->port_altmode_dp;
 		cd321x->state.data = &dp_data;
 		cd321x->state.mode = mode;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		typec_mux_set(cd321x->mux, &cd321x->state);
 	} else if (st->data_status & TPS_DATA_STATUS_TBT_CONNECTION) {
 		struct typec_thunderbolt_data tbt_data;
@@ -738,6 +745,13 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.mode = TYPEC_TBT_MODE;
 		cd321x->state.data = &tbt_data;
 		typec_mux_set(cd321x->mux, &cd321x->state);
+
+		tbt_switch_data.state = TYPEC_THUNDERBOLT_SWITCH_TBT;
+		tbt_switch_data.tbt = tbt_data;
+		tbt_switch_data.orientation = TPS_STATUS_TO_UPSIDE_DOWN(st->status) ?
+						      TYPEC_ORIENTATION_REVERSE :
+						      TYPEC_ORIENTATION_NORMAL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 	} else if (st->data_status & CD321X_DATA_STATUS_USB4_CONNECTION) {
 		struct enter_usb_data eusb_data;
 
@@ -752,12 +766,20 @@ static void cd321x_typec_update_mode(struct tps6598x *tps, struct cd321x_status
 		cd321x->state.data = &eusb_data;
 		cd321x->state.mode = TYPEC_MODE_USB4;
 		typec_mux_set(cd321x->mux, &cd321x->state);
+
+		tbt_switch_data.state = TYPEC_THUNDERBOLT_SWITCH_USB4;
+		tbt_switch_data.usb4 = eusb_data;
+		tbt_switch_data.orientation = TPS_STATUS_TO_UPSIDE_DOWN(st->status) ?
+						      TYPEC_ORIENTATION_REVERSE :
+						      TYPEC_ORIENTATION_NORMAL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 	} else {
 		if (cd321x->state.alt == NULL && cd321x->state.mode == TYPEC_STATE_USB)
 			return;
 		cd321x->state.alt = NULL;
 		cd321x->state.mode = TYPEC_STATE_USB;
 		cd321x->state.data = NULL;
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		typec_mux_set(cd321x->mux, &cd321x->state);
 	}
 
@@ -771,6 +793,9 @@ static void cd321x_update_work(struct work_struct *work)
 					    struct cd321x, update_work);
 	struct tps6598x *tps = &cd321x->tps;
 	struct cd321x_status st;
+	struct typec_thunderbolt_switch_data tbt_switch_data = {
+		.state = TYPEC_THUNDERBOLT_SWITCH_OFF,
+	};
 
 	guard(mutex)(&tps->lock);
 
@@ -821,6 +846,7 @@ static void cd321x_update_work(struct work_struct *work)
 
 	/* If there was a disconnection, set PHY to off */
 	if (!new_connected || was_disconnected) {
+		typec_thunderbolt_switch_set(cd321x->tbt_switch, &tbt_switch_data);
 		cd321x->state.alt = NULL;
 		cd321x->state.mode = TYPEC_STATE_SAFE;
 		cd321x->state.data = NULL;
@@ -1328,6 +1354,12 @@ cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 		goto err_unregister_altmodes;
 	}
 
+	cd321x->tbt_switch = fwnode_typec_thunderbolt_switch_get(fwnode);
+	if (IS_ERR(cd321x->tbt_switch)) {
+		ret = PTR_ERR(cd321x->tbt_switch);
+		goto err_unregister_mux;
+	}
+
 	cd321x->state.alt = NULL;
 	cd321x->state.mode = TYPEC_STATE_SAFE;
 	cd321x->state.data = NULL;
@@ -1335,6 +1367,9 @@ cd321x_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 
 	return 0;
 
+err_unregister_mux:
+	typec_mux_put(cd321x->mux);
+	cd321x->mux = NULL;
 err_unregister_altmodes:
 	typec_unregister_altmode(cd321x->port_altmode_dp);
 	typec_unregister_altmode(cd321x->port_altmode_tbt);
@@ -1356,6 +1391,8 @@ cd321x_unregister_port(struct tps6598x *tps)
 {
 	struct cd321x *cd321x = container_of(tps, struct cd321x, tps);
 
+	typec_thunderbolt_switch_put(cd321x->tbt_switch);
+	cd321x->tbt_switch = NULL;
 	typec_mux_put(cd321x->mux);
 	cd321x->mux = NULL;
 	typec_unregister_altmode(cd321x->port_altmode_dp);

-- 
2.55.0



