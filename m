Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FD0BCAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:57:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cWTwl2DocvgbazI87frdPMZaconxBICuzNilDzWoJC0=; b=EEEUgasQXXODKLaYHREj4Rk50S
	TOuoQsmlXJ5Ni3GvbWdZjDDQyIhyIvErrMcOZMUaAg0PpKjC8r7z9xFH098HUSwMm2ajUMorvodMW
	6B9kL48Tc9a2d9PAiSMUwdiszpH3ByMJ44Og0Pplrz4XBaiSloNCoaEX1e7HSXiQLLf0qs8IVgZDO
	y4F6MdeO1S0gFJT0WtW6qvV38m339qLQ1r/QM/W45FtPRAKytR0kipXpRessCvvgvvBxlZmHE9k/A
	YL74iE2hhejlYBuTSfQZwrlJ81/JNGkCgDVrVD9K6j8Vvm8WXUY/0XJ1K5J7hVMQbL8v5DiWgPhvj
	q7B/eulg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHt-00000001EL2-2WSL;
	Sun, 14 Sep 2025 12:57:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHh-00000001EDY-2BCn
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5CAB244098;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 2BED9C4CEF7;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=5qN1hUYg/yBslXEFHt0WeCqqqta8eTqmgCNW+CF8HKk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aE81kzamKD2tlYSp9L3Eur2qhzhRfskxp8Ahe5hLEYWCSvfPxZEVXRqeF7SrWx40A
	 RnabcaX+lcJRj887aGkveANQnTxdmho0q1sHRFpxYgYzUS8a2V4lIdh6ukOWPqYWlV
	 BnkbC/l5KR3WShVdU1NulN39PJAFj4nC3Q0Q8MJ9n8RgLeU2hEZudN/MN5POBKx0VE
	 fYYDvBJQVxrTwuj0mfO9Js760EjYwMiMm42aEUf59ArgFT5nUHmROzvV0bbE1RTvpC
	 ta/sgKXaGkBUWPRCfoftidGzBiXLs4FyfrNLn6eyvJEo5bZVArF26kScxwvgE0zjp9
	 M62l7jAV7LiaQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CC85CAC582;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:06 +0000
Subject: [PATCH 01/11] usb: typec: tipd: Clear interrupts first
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-1-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, stable@kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3434; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=5qN1hUYg/yBslXEFHt0WeCqqqta8eTqmgCNW+CF8HKk=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3eXmpxaJGW7hWvku6r/UlmL1WZzVa39n3rHYbfzm/
 3ydczOzOkpZGMQ4GGTFFFm277c3ffLwjeDSTZfew8xhZQIZwsDFKQATOSDKyHAtf1se//3Tsldn
 r9gafFjd2yItkudRSr397lsdIsVTwv4z/NPp7X316dnxSfaHhG4uzFl0/m7i9U+SGfoHNCqzLvR
 KP+EAAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_055649_629203_59AF2A47 
X-CRM114-Status: GOOD (  12.48  )
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

Right now the interrupt handler first reads all updated status registers
and only then clears the interrupts. It's possible that a duplicate
interrupt for a changed register or plug state comes in after the
interrupts have been processed but before they have been cleared:

* plug is inserted, TPS_REG_INT_PLUG_EVENT is set
* TPS_REG_INT_EVENT1 is read
* tps6598x_handle_plug_event() has run and registered the plug
* plug is removed again, TPS_REG_INT_PLUG_EVENT is set (again)
* TPS_REG_INT_CLEAR1 is written, TPS_REG_INT_PLUG_EVENT is cleared

We then have no plug connected and no pending interrupt but the tipd
core still thinks there is a plug. It's possible to trigger this with
e.g. a slightly broken Type-C to USB A converter.

Fix this by first clearing the interrupts and only then reading the
updated registers.

Fixes: 45188f27b3d0 ("usb: typec: tipd: Add support for Apple CD321X")
Fixes: 0a4c005bd171 ("usb: typec: driver for TI TPS6598x USB Power Delivery controllers")
Cc: stable@kernel.org
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index dcf141ada07812295a6f07e41d77f95f98116010..1c80296c3b273e24ceacb3feff432c4f6e6835cc 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -545,24 +545,23 @@ static irqreturn_t cd321x_interrupt(int irq, void *data)
 	if (!event)
 		goto err_unlock;
 
+	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
+
 	if (!tps6598x_read_status(tps, &status))
-		goto err_clear_ints;
+		goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_POWER_STATUS_UPDATE)
 		if (!tps6598x_read_power_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	if (event & APPLE_CD_REG_INT_DATA_STATUS_UPDATE)
 		if (!tps6598x_read_data_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	/* Handle plug insert or removal */
 	if (event & APPLE_CD_REG_INT_PLUG_EVENT)
 		tps6598x_handle_plug_event(tps, status);
 
-err_clear_ints:
-	tps6598x_write64(tps, TPS_REG_INT_CLEAR1, event);
-
 err_unlock:
 	mutex_unlock(&tps->lock);
 
@@ -668,25 +667,24 @@ static irqreturn_t tps6598x_interrupt(int irq, void *data)
 	if (!(event1[0] | event1[1] | event2[0] | event2[1]))
 		goto err_unlock;
 
+	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
+	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
+
 	if (!tps6598x_read_status(tps, &status))
-		goto err_clear_ints;
+		goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_POWER_STATUS_UPDATE)
 		if (!tps6598x_read_power_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	if ((event1[0] | event2[0]) & TPS_REG_INT_DATA_STATUS_UPDATE)
 		if (!tps6598x_read_data_status(tps))
-			goto err_clear_ints;
+			goto err_unlock;
 
 	/* Handle plug insert or removal */
 	if ((event1[0] | event2[0]) & TPS_REG_INT_PLUG_EVENT)
 		tps6598x_handle_plug_event(tps, status);
 
-err_clear_ints:
-	tps6598x_block_write(tps, TPS_REG_INT_CLEAR1, event1, intev_len);
-	tps6598x_block_write(tps, TPS_REG_INT_CLEAR2, event2, intev_len);
-
 err_unlock:
 	mutex_unlock(&tps->lock);
 

-- 
2.34.1



