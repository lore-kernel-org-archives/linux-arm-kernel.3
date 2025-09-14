Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CE5DCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m1kWwMiiqnBUY2BdDZWo2u4ehjOk01tA44JAxlat1d8=; b=1L33wZd7LYD7qSyo9JAX5zBEd6
	TizScrr3a7DsmA3C8atneNzelmU7gGVb/s8mMpKomj4hm0SQNANqq9sMbGTRXh3cwlx/uaU+Cuy34
	bsQgAtePtk25DmCX6d8MdNE9ivNrR7GCqsmGRfBVXiqXwqQ7Td4i2A2KU9bOr/fUHYSNPVMAmUyW3
	prLszTT7fDfjXOkbuCp612QYnhb7MFZk+Ee4RclgAWWTOgE7b6pv4w5tK7FWodu5eGZ9wDSuYH6TM
	l2R4N7IG3x8V3lxZeV7boOjLLeojMz5IOcFjo/9pILF8p9FXzCuSt4aiR+PeT6stwsTe6Vj62Oq80
	Q6JlSCrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHx-00000001EQP-0XMY;
	Sun, 14 Sep 2025 12:57:05 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHj-00000001EGE-2bYb
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B945E441F5;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C748C116B1;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=n4r7zMHDw/fPAOcEpKAkNiWA7bMT/Gk7NMP0eqPegkY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GM70exrUvCkp2VCAXOJiUKn+Z4tj1+T8uSrT32ZEsG0/B7Z74yLzH0CT47sje+w0r
	 8eA/HYlhfe1AA6h4MDnlFGuJiTDgRScQw1vzlU1XQk4udUy82TJp7tpB/3pqA8ylVe
	 rQU7OCqi3ZZ8YX7W670D7TBB+A5cGx805prxYKueQgUNamFNrHeMs9iSPQnAdrc3nT
	 yg1CWhL4ydmXp6rwNcX8v9CsQx3tT2Orsb/JCAmHBnoz/5qwvQpfNkPr6kRnenaI07
	 72hoA7IRtTXZJOsaXC72rr8gBTZf8G0oO0cUMigWHFdJz8maX9j/07aIKQNyj469Zn
	 eWTtSk4TNRrOw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97B98CAC598;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:15 +0000
Subject: [PATCH 10/11] usb: typec: tipd: Read data status in probe and
 cache its value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-10-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1585; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=SEqFsdZj9wQbFtYLraoDyZILplcZKiIw4Wc/CN9A6bM=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3R3KDnc5D/soHDFte8ez7pDPf1GvbN65wT4Mj0Mll
 u659+lbRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAi7w0ZGfYv3iFd9mtTW2v9
 0d1Lth41ipia1Tzt+f5U+4Ucgb+uHFdkZJjUeyaPZcEPpqe1lQECrt+ktZJ+vuW5/cLsyNqzh/b
 /i2ADAA==
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_055651_715709_FF5647FE 
X-CRM114-Status: GOOD (  11.13  )
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

From: Hector Martin <marcan@marcan.st>

Just like for power status we also need to keep track of data status to
be able to detect mode changes once we introduce de-bouncing for CD321x.
Read it during probe and keep a cached copy of its value.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index f546f4ae563af3d411ec6591fe9c3b122e4efaab..f347e5bc625497ddff270e3e9e4d2ddaf3ca6bc1 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -176,6 +176,7 @@ struct tps6598x {
 
 	int wakeup;
 	u32 status; /* status reg */
+	u32 data_status;
 	u16 pwr_status;
 	struct delayed_work	wq_poll;
 
@@ -538,6 +539,7 @@ static bool tps6598x_read_data_status(struct tps6598x *tps)
 		dev_err(tps->dev, "failed to read data status: %d\n", ret);
 		return false;
 	}
+	tps->data_status = data_status;
 
 	if (tps->data->trace_data_status)
 		tps->data->trace_data_status(data_status);
@@ -1551,6 +1553,8 @@ static int tps6598x_probe(struct i2c_client *client)
 	if (status & TPS_STATUS_PLUG_PRESENT) {
 		if (!tps6598x_read_power_status(tps))
 			goto err_unregister_port;
+		if (!tps->data->read_data_status(tps))
+			goto err_unregister_port;
 		ret = tps6598x_connect(tps, status);
 		if (ret)
 			dev_err(&client->dev, "failed to register partner\n");

-- 
2.34.1



