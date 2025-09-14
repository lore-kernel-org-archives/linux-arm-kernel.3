Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78F03CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 12:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dbrh7OmpmMk9UnAN8rLg5dTsfTO5dcLiryJ2B+JyWPE=; b=G13UzwxggZGu7oMdT3Ult9PdrB
	qhiaMvd74GgKYWJVU9NYNH3Vi3FSp7HZypw9b9WgllEAtPyHTRJDDldS9sBvK2rp28Fe1q9qjR7Cm
	gj7d+C8BcmEjC9zy1wOZrfYmuI3R/uuWQ4cDQkQvxTD8BHm8dXvJ/YWBWoapZOA84a1BOq0RKsGMJ
	WitxIcV5huBKiU6dtfg0tx2/+xkaipSLZze8i6xiSEAS759B7zkPbu/GFEs6DKqx5Z/ZQeHIkVv6F
	8szzd2bb7wC9Sx4VI+KeAwFK6fU588ErCnlb3VI7tCgyGc4Xkim4i3VAZkYwkgYvk2k2mNQWN8SPG
	ZCmdGvTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHw-00000001EOd-0mLE;
	Sun, 14 Sep 2025 12:57:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxmHi-00000001EFV-48Td
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 12:56:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ADCE2441F1;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9116BC113D0;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757854608;
	bh=GGf5QllyT61ysY566RYqLFNgno0l8ltEvVdR6bQN+qM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dUiC/OiPYVS67Ur/9+AsrvRREGlm8DN1DpiNoBw52tkpafCjIOzwwZKVpzpQeY0YF
	 cRCAGhcg5/Ip0c7K8DqHXDbX6lplqkc5LlnyIEYDHfmm69pCDCXZahusoAf0JTxsod
	 2xCQEvpLXRDo5OiNi6dLRooc+veev4v3p/Rud3P5DoJxC4i2mWbjYQd40Arf5loYZZ
	 q8HTJbQHgO5mHGURKk0nAMty5TyRPONgO9pC0EDl6J1QYpiuXvPT9KLcaROIwnJv4M
	 TJL/5+iPh+znhMxR+4UttogN09YOSNAVvZ+RzXZy2uQd6SAM5nB4CerZwI4RvEhujX
	 d6qE3roA9M2qg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B193CAC587;
	Sun, 14 Sep 2025 12:56:48 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Sun, 14 Sep 2025 12:56:14 +0000
Subject: [PATCH 09/11] usb: typec: tipd: Use read_power_status function in
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250914-apple-usb3-tipd-v1-9-4e99c8649024@kernel.org>
References: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
In-Reply-To: <20250914-apple-usb3-tipd-v1-0-4e99c8649024@kernel.org>
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Janne Grunau <j@jannau.net>, Neal Gompa <neal@gompa.dev>, 
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, 
 asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Sven Peter <sven@kernel.org>, Hector Martin <marcan@marcan.st>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1337; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=bWtfpNYNeM/tSnjKG/cu9lo0fgNBV8UwebqdAD8QF6w=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ8ax3W0fT4QWvHjcHsSxxazpQTznhJi5f6z3y7An5ln3b
 P2nOPtnRykLgxgHg6yYIsv2/famTx6+EVy66dJ7mDmsTCBDGLg4BWAiO9YxMizxXdt8xmyvCMd+
 OT/u2Xp5b2WOnH/htPnnscbuD14rN9ow/FN4cELDUCZsyTmfYg3HXOOccPE1d5Z0z/hxp3zW177
 8cBYA
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_055651_061397_CACBF5C4 
X-CRM114-Status: GOOD (  10.75  )
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

We need the initial power status to be able to reliably detect connector
changes once we introduce de-bouncing for CD321x next. read_power_status
takes care of this and also forwards the status to the trace subsystem
so let's use that instead of open-coding it inside probe.

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 drivers/usb/typec/tipd/core.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/usb/typec/tipd/core.c b/drivers/usb/typec/tipd/core.c
index e16c6c07c72a3e285f1fc94db72bed8dc3217a1d..f546f4ae563af3d411ec6591fe9c3b122e4efaab 100644
--- a/drivers/usb/typec/tipd/core.c
+++ b/drivers/usb/typec/tipd/core.c
@@ -1549,11 +1549,8 @@ static int tps6598x_probe(struct i2c_client *client)
 		goto err_role_put;
 
 	if (status & TPS_STATUS_PLUG_PRESENT) {
-		ret = tps6598x_read16(tps, TPS_REG_POWER_STATUS, &tps->pwr_status);
-		if (ret < 0) {
-			dev_err(tps->dev, "failed to read power status: %d\n", ret);
+		if (!tps6598x_read_power_status(tps))
 			goto err_unregister_port;
-		}
 		ret = tps6598x_connect(tps, status);
 		if (ret)
 			dev_err(&client->dev, "failed to register partner\n");

-- 
2.34.1



