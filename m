Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10ACCCFD314
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Dec 2025 09:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ggHwlto0XwvSJdtajVmDjymKGhgcw6gW4Q8NqRJyiBY=; b=h/9XmmvYlK8EgSYjOLLh/ULbbN
	uIEF8oRTIoFPVzC0SvARuLydCEbvferrlT+MISy6Ih/xNFI0GLCHPPf2M6EUcFy32a5UcH8TI857d
	QbJLGLQhTA/Dy32dIO5QGWPJwHh6v69u5En5VJXAjGC5z80UcIFK4IjC7NypxDjWjfzTiKP0H3ZUw
	QjK1D+KjlULlMR7biUUhb5ogF4MyMbFxmZReADPnsB2hAsQvDL3IPsYZYsp/Fm5zHQqaA3NeimdRD
	O6IK2z+qTk+mZCqXBPT6jQ4iFsn0AV3dg5PVKzG+qAvlX6rRuzhUWSuBONlDrv7AXNFfbjqGoZEvm
	zjkC5jDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUiQs-00000002JRt-2UZc;
	Sun, 14 Dec 2025 09:30:26 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUiQr-00000002JRk-2M9y;
	Sun, 14 Dec 2025 09:30:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C9163600AE;
	Sun, 14 Dec 2025 09:30:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF490C4CEF1;
	Sun, 14 Dec 2025 09:30:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765704623;
	bh=0n3uJxHqX735kn4eG0/+bhoqe1AcToHA7kHImCjcZBc=;
	h=From:Date:Subject:To:Cc:From;
	b=AWeuqQUGrdXf1eD20KsNuPVWAk1M+Uz4UJ3bcZIkZC2hMm0sXHEXtWUSpQYiDN+LW
	 0UPiBQKHzRk57pddyvYX49WFKWAbO4r+cVh3uU1OMVL4FbNNKy6ASa19pje5JT1tFT
	 71I6xHiTV0z6shx7HOA2hlr7O42h6gDEkBQLHeXBBIwiFKpG4YhdIemc7XSW8ExqDZ
	 lRW83blw5c7k9WoH9WZWAYRQ1Lx+8W47b/YS6pdq+4izV80/vEUlLcaPGzr1pR8cjX
	 Z/8RNT2+pyopdWpB8micIV6ov/mPZlwphR+hxLk5R+TgZ47XGjChGYuFmzsdIr0ghj
	 wsocXbACFp7oQ==
From: Lorenzo Bianconi <lorenzo@kernel.org>
Date: Sun, 14 Dec 2025 10:30:07 +0100
Subject: [PATCH net] net: airoha: Move net_devs registration in a dedicated
 routine
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251214-airoha-fix-dev-registration-v1-1-860e027ad4c6@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2M0QpAQBAAf0X7bMueI/kVedjcYl/QnqTk320ep
 2bmgSymkqEvHjC5NOu+OVBZwLTytghqcoZQhYYCRWS1fWWc9cYkF5osmk/j0zucaiaKqekiteC
 Hw8S9/z6M7/sBdsmVxW0AAAA=
X-Change-ID: 20251214-airoha-fix-dev-registration-c3a114d58416
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
X-Mailer: b4 0.14.2
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

Since airoha_probe() is not executed under rtnl lock, there is small race
where a given device is configured by user-space while the remaining ones
are not completely loaded from the dts yet. This condition will allow a
hw device misconfiguration since there are some conditions (e.g. GDM2 check
in airoha_dev_init()) that require all device are properly loaded from the
device tree. Fix the issue moving net_devices registration at the end of
the airoha_probe routine.

Fixes: 9cd451d414f6e ("net: airoha: Add loopback support for GDM2")
Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
---
 drivers/net/ethernet/airoha/airoha_eth.c | 39 +++++++++++++++++++++-----------
 1 file changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/net/ethernet/airoha/airoha_eth.c b/drivers/net/ethernet/airoha/airoha_eth.c
index 75893c90a0a17c528c27fc0e986de194e7736637..315d97036ac1d611cc786020cbf2c6df810995a9 100644
--- a/drivers/net/ethernet/airoha/airoha_eth.c
+++ b/drivers/net/ethernet/airoha/airoha_eth.c
@@ -2924,19 +2924,26 @@ static int airoha_alloc_gdm_port(struct airoha_eth *eth,
 	port->id = id;
 	eth->ports[p] = port;
 
-	err = airoha_metadata_dst_alloc(port);
-	if (err)
-		return err;
+	return airoha_metadata_dst_alloc(port);
+}
 
-	err = register_netdev(dev);
-	if (err)
-		goto free_metadata_dst;
+static int airoha_register_gdm_devices(struct airoha_eth *eth)
+{
+	int i;
 
-	return 0;
+	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
+		struct airoha_gdm_port *port = eth->ports[i];
+		int err;
 
-free_metadata_dst:
-	airoha_metadata_dst_free(port);
-	return err;
+		if (!port)
+			continue;
+
+		err = register_netdev(port->dev);
+		if (err)
+			return err;
+	}
+
+	return 0;
 }
 
 static int airoha_probe(struct platform_device *pdev)
@@ -3027,6 +3034,10 @@ static int airoha_probe(struct platform_device *pdev)
 		}
 	}
 
+	err = airoha_register_gdm_devices(eth);
+	if (err)
+		goto error_napi_stop;
+
 	return 0;
 
 error_napi_stop:
@@ -3040,10 +3051,12 @@ static int airoha_probe(struct platform_device *pdev)
 	for (i = 0; i < ARRAY_SIZE(eth->ports); i++) {
 		struct airoha_gdm_port *port = eth->ports[i];
 
-		if (port && port->dev->reg_state == NETREG_REGISTERED) {
+		if (!port)
+			continue;
+
+		if (port->dev->reg_state == NETREG_REGISTERED)
 			unregister_netdev(port->dev);
-			airoha_metadata_dst_free(port);
-		}
+		airoha_metadata_dst_free(port);
 	}
 	free_netdev(eth->napi_dev);
 	platform_set_drvdata(pdev, NULL);

---
base-commit: 8f7aa3d3c7323f4ca2768a9e74ebbe359c4f8f88
change-id: 20251214-airoha-fix-dev-registration-c3a114d58416

Best regards,
-- 
Lorenzo Bianconi <lorenzo@kernel.org>


