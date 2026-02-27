Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D694FFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kSUQ9azScqb3bqW4Ljz3irxXAFM579L61m1zVluKd0M=; b=34/FOrY9KnjQbUZhv1qf/h1Lir
	tEBm+9SN/S7aeIpXGw+cqktAH9oPhOJYiHjPMeurXFaMVk797NNV6LjDCZ406L8uOz/FNXF2RKMn8
	omh9457eeTo9cf6vOsme6spHjWC+/iWn03sW55sN93PCd8Gjt2OGUNRKdvmAPHpMDjHvqv31gJxiF
	vm5IV9iiRKS66eOj51cNR7+tyMqfF72kg9jPnG2vijR7diIN2EpUD7YVdK2N0lXWTxHFFhUxq9pbS
	Df+sS5jCTpzDxOSsQ23vGI5nMYBhOtGSABdxoTOHG11E5noLUGOUm21+3TUluflVFpsrOpcAv7Ag3
	VKzIO6FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHb-00000008X9m-36rp;
	Fri, 27 Feb 2026 14:57:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHX-00000008X8X-1Ejr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204249; x=1803740249;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=QuZtKrwJ6nTCMVf8hjdLyFF0aUMoEHD05EoYboEqLIU=;
  b=FY6ftB2yf6NqydWpsULfLLl1ge8Gdzdp8Z0TMPQXqmP2/VCRuPKKngpZ
   qgCYjKqxvUIPQVGvXfXtdCB6MFiiogrvsjPMHAxiwhXdjNSdfb8XRxSsQ
   aCDHxf53dH/75YnYGMdetHhtCc2WbZV5QNWCr0WHffbETQnpFq7tXo8NJ
   4WVRA/p5aqF4V5xWT14RFDO8HLOZppV95Ba7Wd6mxuUK+31SSIERvBn9C
   z2Bl/9twLmTHocg9xZ5WWuZryHEjgV8qW3yMbGBM2vXfvfJsysU0xs1t/
   80x61MQ5UwRez3QG47BVQJ6Ep+RxhdrrGLjplPABVRxZWsQb/KzjiexRT
   A==;
X-CSE-ConnectionGUID: wgI98+BBT5OZU+rH87zgwA==
X-CSE-MsgGUID: cYck7q/MSl603WhN33PF+g==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="53970560"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 07:57:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 07:57:01 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:56:58 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:39 +0100
Subject: [PATCH net-next v2 1/9] net: sparx5: move netdev and notifier
 block registration to probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-1-10ba54ccf005@microchip.com>
References: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
In-Reply-To: <20260227-sparx5-init-deinit-v2-0-10ba54ccf005@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>, <maxime.chevallier@bootlin.com>,
	<rmk+kernel@armlinux.org.uk>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_065731_341740_A6A9DF5B 
X-CRM114-Status: GOOD (  12.92  )
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

Move netdev registration and notifier block registration from
sparx5_start() to probe(). This allows proper cleanup via goto-based
error labels in probe().

Also, remove the sparx5_cleanup_ports() helper as its functionality is now
split between sparx5_unregister_netdevs() and sparx5_destroy_netdevs()
called at appropriate points.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 41 +++++++++++-----------
 1 file changed, 21 insertions(+), 20 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 582145713cfd..0ca4001a3667 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -773,20 +773,11 @@ static int sparx5_start(struct sparx5 *sparx5)
 	mutex_init(&sparx5->mdb_lock);
 	INIT_LIST_HEAD(&sparx5->mdb_entries);
 
-	err = sparx5_register_netdevs(sparx5);
-	if (err)
-		return err;
-
 	sparx5_board_init(sparx5);
-	err = sparx5_register_notifier_blocks(sparx5);
-	if (err)
-		return err;
 
 	err = sparx5_vcap_init(sparx5);
-	if (err) {
-		sparx5_unregister_notifier_blocks(sparx5);
+	if (err)
 		return err;
-	}
 
 	/* Start Frame DMA with fallback to register based INJ/XTR */
 	err = -ENXIO;
@@ -835,12 +826,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	return err;
 }
 
-static void sparx5_cleanup_ports(struct sparx5 *sparx5)
-{
-	sparx5_unregister_netdevs(sparx5);
-	sparx5_destroy_netdevs(sparx5);
-}
-
 static int mchp_sparx5_probe(struct platform_device *pdev)
 {
 	struct initial_port_config *configs, *config;
@@ -1020,10 +1005,26 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
+	err = sparx5_register_netdevs(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to register net devices\n");
+		goto cleanup_ptp;
+	}
+
+	err = sparx5_register_notifier_blocks(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to register notifier blocks\n");
+		goto cleanup_netdevs;
+	}
+
 	goto cleanup_config;
 
+cleanup_netdevs:
+	sparx5_unregister_netdevs(sparx5);
+cleanup_ptp:
+	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
-	sparx5_cleanup_ports(sparx5);
+	sparx5_destroy_netdevs(sparx5);
 	if (sparx5->mact_queue)
 		destroy_workqueue(sparx5->mact_queue);
 cleanup_config:
@@ -1047,12 +1048,12 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 		disable_irq(sparx5->fdma_irq);
 		sparx5->fdma_irq = -ENXIO;
 	}
+	sparx5_unregister_notifier_blocks(sparx5);
+	sparx5_unregister_netdevs(sparx5);
 	sparx5_ptp_deinit(sparx5);
 	ops->fdma_deinit(sparx5);
-	sparx5_cleanup_ports(sparx5);
 	sparx5_vcap_destroy(sparx5);
-	/* Unregister netdevs */
-	sparx5_unregister_notifier_blocks(sparx5);
+	sparx5_destroy_netdevs(sparx5);
 	destroy_workqueue(sparx5->mact_queue);
 }
 

-- 
2.34.1


