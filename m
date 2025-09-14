Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C2B6CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5MJDqKCGu1vyf0Qusgiu6yKK7PIJxgDcYnxeramaYZM=; b=J6SsyQsTfTD3Qu/KJjQBXekhiJ
	Mpinos7sI0TRtQIccr4oSPeUVfBFHUJFRiHKOpe/9sZ+gRcCP3eL9V1VmD8IihL+Abx13nGpvpYxn
	xO77Z23Nfd9qce/4uF3KYTZ2wr7hsZIvDJf4s0kErL6/d1zwjc73y6BFaOQxFBd9+my320zBZTKTT
	5rqC79GQf18wo6Ldd4Twu71AHcu4ihzFMSk/CGrbNCgoMsDuYEcazCEliJZFfImrwo5J7T/clbor1
	pDuTxooPLEwT1AvaBRuln50t5osF2iidU7mqVQgRa6nW3A+rIUqEzfgFX/jzLZJlcNYDNKkK4SBjb
	aNmh8dgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHk-00000001EH8-2kcI;
	Sun, 14 Sep 2025 12:56:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHi-00000001EF2-2Hxe
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AF019601A6;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4765BC4CEFD;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=sUkw4q4IY9bSBtfRWTCcqxsVU/bRRgymfhNhDOYa7GM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=UKIriVviyUhz8icNz7vYIZIyWaQo2Ume4+meCG3F82iYctnWeBsLBv04fHA1ORYFL
	 goUJuNn6iCYECVoe6zenmbb7Fn9CbXCHcLQAo1H6mRDRFWvBBrlRkaKhOEv5PeSOA/
	 67fm8/bvlcpFc4USAWcxW+SIIWPXJG7YjA3wrOumBcUu0j18BoAOFsTbmDpBX1dKzL
	 r+WU1Zv6373AO/YeyS8z5WnCaleljYvgq8vC6qnAwkgkR9KFf1ZhGV8niVZWmw67Yw
	 TX7ChdhBWhihjWcfUBZ0YBGZNLUn7SactmuwuQPnb5hn57ud0dwmaRjgGu7rCvRpGA
	 UFOHDaEUuGYnA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 392A5CAC58F;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:08 +0000
Subject: [PATCH 03/11] usb: typec: tipd: Move switch_power_state to
 tipd_data
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-3-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=sUkw4q4IY9bSBtfRWTCcqxsVU/bRRgymfhNhDOYa7GM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3dUsr4w3vX+QVSXGvMxFZcrDtVoXH5RLtggZ/rJZ/
 /2estWfjlIWBjEOBlkxRZbt++1Nnzx8I7h006X3MHNYmUCGMHBxCsBEOC4wMvx2C9vxyGm3uVL+
 22CjJTeOqO9RmHLXoSz7d4bkrAbP3JUMv9n1lYzm+l3In8Zg+X23Yu43lV3TPnLxqn08GaAu0HR
 UnBkA
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

When support for CD321x was originally added no other hardware variant
was supported and there was no need for struct tipd_data. Now that it
exists move the special case in there so that we can drop the
of_device_is_compatible_check entirely.

Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index 6d8bcbc9cad8a1394e066504d4c5ca570edd4e4f..4815c5c462837865a5f9d37bbc139249c82c2f75 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -118,6 +118,7 @@ struct tipd_data {
 	void (*trace_status)(u32 status);
 	int (*apply_patch)(struct tps6598x *tps);
 	int (*init)(struct tps6598x *tps);
+	int (*switch_power_state)(struct tps6598x *tps, u8 target_state);
 	int (*reset)(struct tps6598x *tps);
 };
 
@@ -1293,7 +1294,6 @@ tps25750_register_port(struct tps6598x *tps, struct fwnode_handle *fwnode)
 
 static int tps6598x_probe(struct i2c_client *client)
 {
-	struct device_node *np = client->dev.of_node;
 	struct tps6598x *tps;
 	struct fwnode_handle *fwnode;
 	u32 status;
@@ -1331,18 +1331,16 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (i2c_check_functionality(client->adapter, I2C_FUNC_I2C))
 		tps->i2c_protocol = true;
 
-	if (np && of_device_is_compatible(np, "apple,cd321x")) {
-		/* Switch CD321X chips to the correct system power state */
-		ret = cd321x_switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
-		if (ret)
-			return ret;
-
-	}
-
 	tps->data = i2c_get_match_data(client);
 	if (!tps->data)
 		return -EINVAL;
 
+	if (tps->data->switch_power_state) {
+		ret = tps->data->switch_power_state(tps, TPS_SYSTEM_POWER_STATE_S0);
+		if (ret)
+			return ret;
+	}
+
 	/* Make sure the controller has application firmware running */
 	ret = tps6598x_check_mode(tps);
 	if (ret < 0)
@@ -1525,6 +1523,7 @@ static const struct tipd_data cd321x_data = {
 	.trace_status = trace_tps6598x_status,
 	.init = cd321x_init,
 	.reset = cd321x_reset,
+	.switch_power_state = cd321x_switch_power_state,
 };
 
 static const struct tipd_data tps6598x_data = {

-- 
2.34.1



