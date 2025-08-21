Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0B8FCA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 22:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70Y4eWUFxhIiDMYLLCzoNljWoik969fB7qqMUUAtsjM=; b=KUw8uPBw8e8+bE7tc2AibNxJyw
	HYgSF6C85v49t2armK9L2ZKFa3+RD6zy/g2ufdrEPTv5dS9+fzvPhI8oBPlNPlEGtpkQ9/IoumwiP
	K0nUDAa2cRr90Ja0xBJxGwLUdbu59fPLsWTQcGu0UIjbNH+QX12iT2mk0qJJasPhyTeqy8ZO68tsN
	xv2UKF8unQVSDbVOsbKUNu+eKvPY9YyefLflFSScXyQ0M1RLO5ZfN4Prvnn+mTNOO0yDFnIMk2xQQ
	tEjgkPeUkMJQa46Kcj8XFejg4RASsHVsLethn6DnsdRWiD8/GMlOWrPbVYrRbelcIn+YYBqRTcfal
	pOtalWuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upDtW-00000000lSP-0R5q;
	Thu, 21 Aug 2025 22:36:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up7OW-0000000HQX8-3d0B;
	Thu, 21 Aug 2025 15:40:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 40C315C6223;
	Thu, 21 Aug 2025 15:40:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 905CEC4CEED;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755790803;
	bh=eKL7OgN/DvasHSMHY1JVLFsa5OJf2n5Y1v/SsiTf9mc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qRY2mg5GQkc65Ta4lI85H18iIpKkwg1ta0TR9yxaUtoRjMF0NWhL9VIQdFBSNCHPN
	 y6vmxLbthe0oKnuSV5JD8lcORuypR67ewqJvNKj4RwW6Rcrljdk1j/Kwqt6VPZM+XO
	 sdVqHx+/NZ7V8cJizDZN2aVesdXJiaD6VRO4iIhPAFj60NYQXJ6KREYac/L/lQg8g2
	 DEJV414dmCSB5MoNOYV/c+hvkvoxa4sDKgYQGyjKGjdVvH9qM5I1BtrIwjcZCynVmw
	 Ax2HmTTYSPjarUP49NbkoGOZaAh0mCcqUERebuTQ3DLAu/GO2VbQDYYQu/NXJWNz77
	 1mee46CiPDw/Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C89CA0EFC;
	Thu, 21 Aug 2025 15:40:03 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Thu, 21 Aug 2025 15:39:01 +0000
Subject: [PATCH RFC 09/22] usb: typec: tipd: Move initial irq mask to
 tipd_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-atcphy-6-17-v1-9-172beda182b8@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3168; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=eKL7OgN/DvasHSMHY1JVLFsa5OJf2n5Y1v/SsiTf9mc=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8Zy29X37j8tXW0dVX/4fuKD1QwXrzTmbLzzSqfre/7cg
 ANRd7KLOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQAT+WXMyPDlg+aeFWmbFnVG
 VHzKC/6to/fT4O6yrr6O3/yLxauu3w1j+CvEr+Aj/2KZ2tLtriqpZ9n6f6mfi3gnvSNV+u7/tPO
 +CewA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_084005_030192_57C418AE 
X-CRM114-Status: GOOD (  11.49  )
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



