Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 432E3CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iM1sHOGG2M3rYdpznjo57r4A3DIVjRNoNhy+sBDRzSs=; b=cop7vE8HML5IilYwzsAgPY4TAT
	UkG0x5Jp9DihrmQrqfPmcmYKnNyPoySf1/Rr09LG5AmMMYtkvdroStcfW0qC2oTFj6mI9aUzpPPcP
	5F6/VOSCxXVsN/xTAGMsMd+ntLVtIHTv1JfzcQ0gg6ysLUroq9o4ddJdPJQd+38MOlT3T/Y0lUJDD
	zlEDnPeJcl93ZxYjnZ76ZS288CLzQzONN0fj5h18dBKk3UieCDVeqwDKR6Kpyu17UkUpaN5Nr+NjH
	d4CFHeGeCyLWVSxnOtufQSEa8Km6svrjjG1l5wkVsHaXnTTpORoXQ4tV6KvroDtA5QyyGjfyvYCHF
	5BA7jefg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHl-00000001EHs-1C3u;
	Sun, 14 Sep 2025 12:56:53 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHi-00000001EEy-2Z1O
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A08B96019D;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3ADC8C4CEF5;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=PWktnbKRR/csBSa+TtAeLTOjYJ8uGFc3oo299yXS8Bk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=MrK7XiSkUkQbBf8PHxjrdsNy3szbKC63xIH73M2Mmpg1PBjnxS8dC0YToYh9ImGWC
	 qmY1KAQTgBxq0rUWJ0mLZqxDMjOfoiIQPCDp4c8Z60wGTj81PmAcYDh/86zgHmRz57
	 5n46ANLsDVujUgRGzXBS/itJSaapbCMrFjYdgJk3+87GKep5XUIIIKtmg4x0wJm9Hd
	 pLugNsI2REuPZwg5EDYCylVnKzgCJLvbK6rclrdbrbf3QX+hB0VwjhfgkzxN3MEgTg
	 4qfma2vWthjCF/G6EtjsaT2DDa5pW5RSeYwpd91Q0rrMgJtaculv1ikIPJVmt/NGto
	 YizflX96D2Nag==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AA69CAC594;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:07 +0000
Subject: [PATCH 02/11] usb: typec: tipd: Move initial irq mask to tipd_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-2-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3274; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=PWktnbKRR/csBSa+TtAeLTOjYJ8uGFc3oo299yXS8Bk=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3ZWnNi1l1+uPmrJ70m6BRIn6Tff6bR4bhm6v+qTrE
 bNiYp1kRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi+VqMDFe454eVH1vL+FtT
 ZP3SBak+XzJeTmp58mp7QNv8pdYiNQYM/2vfndrw/hFb/937Ex83TLR8p26723Lp4pM5iZNcvu5
 u38oOAA==
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

Since the irq mask was originally added more tipd variants have been
introduced and there's now struct tipd_data. Move the initial mask in
there.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 1c80296c3b273e24ceacb3feff432c4f6e6835cc..6d8bcbc9cad8a1394e066504d4c5ca570edd4e4f 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -112,6 +112,7 @@ struct tps6598x;
 
 struct tipd_data {
 	irq_handler_t irq_handler;
+	u64 irq_mask1;
 	int (*register_port)(struct tps6598x *tps, struct fwnode_handle *node);
 	void (*trace_power_status)(u16 status);
 	void (*trace_status)(u32 status);
@@ -1298,7 +1299,6 @@ static int tps6598x_probe(struct i2c_client *client)
 	u32 status;
 	u32 vid;
 	int ret;
-	u64 mask1;
 
 	tps = devm_kzalloc(&client->dev, sizeof(*tps), GFP_KERNEL);
 	if (!tps)
@@ -1337,16 +1337,6 @@ static int tps6598x_probe(struct i2c_client *client)
 		if (ret)
 			return ret;
 
-		/* CD321X chips have all interrupts masked initially */
-		mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
-			APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
-			APPLE_CD_REG_INT_PLUG_EVENT;
-
-	} else {
-		/* Enable power status, data status and plug event interrupts */
-		mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
-			TPS_REG_INT_DATA_STATUS_UPDATE |
-			TPS_REG_INT_PLUG_EVENT;
 	}
 
 	tps->data = i2c_get_match_data(client);
@@ -1364,7 +1354,7 @@ static int tps6598x_probe(struct i2c_client *client)
 			return ret;
 	}
 
-	ret = tps6598x_write64(tps, TPS_REG_INT_MASK1, mask1);
+	ret = tps6598x_write64(tps, TPS_REG_INT_MASK1, tps->data->irq_mask1);
 	if (ret)
 		goto err_reset_controller;
 
@@ -1527,6 +1517,9 @@ static const struct dev_pm_ops tps6598x_pm_ops = {
 
 static const struct tipd_data cd321x_data = {
 	.irq_handler = cd321x_interrupt,
+	.irq_mask1 = APPLE_CD_REG_INT_POWER_STATUS_UPDATE |
+		     APPLE_CD_REG_INT_DATA_STATUS_UPDATE |
+		     APPLE_CD_REG_INT_PLUG_EVENT,
 	.register_port = tps6598x_register_port,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1536,6 +1529,9 @@ static const struct tipd_data cd321x_data = {
 
 static const struct tipd_data tps6598x_data = {
 	.irq_handler = tps6598x_interrupt,
+	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
+		     TPS_REG_INT_DATA_STATUS_UPDATE |
+		     TPS_REG_INT_PLUG_EVENT,
 	.register_port = tps6598x_register_port,
 	.trace_power_status = trace_tps6598x_power_status,
 	.trace_status = trace_tps6598x_status,
@@ -1546,6 +1542,9 @@ static const struct tipd_data tps6598x_data = {
 
 static const struct tipd_data tps25750_data = {
 	.irq_handler = tps25750_interrupt,
+	.irq_mask1 = TPS_REG_INT_POWER_STATUS_UPDATE |
+		     TPS_REG_INT_DATA_STATUS_UPDATE |
+		     TPS_REG_INT_PLUG_EVENT,
 	.register_port = tps25750_register_port,
 	.trace_power_status = trace_tps25750_power_status,
 	.trace_status = trace_tps25750_status,

-- 
2.34.1



