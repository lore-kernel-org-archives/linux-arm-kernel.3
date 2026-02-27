Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1278FEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qu3VwVqFUErqqhT6kqOGF4xtzFD/7VOFEEX2oN69G7U=; b=d+BHhqD8Hx+QZx7Qkd6CGbs4rF
	EsW/uS3VH84qNqq+PSBIzEy6K7RLS2liz2N7jBpYmaiSrQ9YZZ4fphcxAn6WqXz7IwsEouYd9vrDc
	9Z06QcoUhPDyaG4bspTB0qse8lpBo6rt8M8UDsRTSGfjG5MXVWq/nyHSyPdIXW7yZvj8sH1fpsR7A
	qzGX2Pep0jFzowWyKV4/HiV5Vd9WqQeMr7CU7sJBPpO9A6jQEjcypq8Uq+JePMypjyCK/NtxIvcjQ
	fVFhNJpUtDTCTufcTngx5Hjb/C5IYnnlPwbM8HkSuuBghcYC9YD6bvno0daSjFGoEBa4IFIDsEPXW
	XP90qEnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHk-00000008XCn-2ls3;
	Fri, 27 Feb 2026 14:57:44 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHZ-00000008X8X-3rZB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204252; x=1803740252;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=jDlPP0Dhjhl6jNJafNK8XeaZ3H+YJC5WkqOkIyeSUdo=;
  b=g/ap9LV5FWO/kIByomHFFE2H4Vm0qHe8WVVkk0G8utF1NajF81k15aug
   kc7Ysi0fAIxTOht7OkBA7sULcvuX+S54lFQAlBLyv6U4i30QmX6zSbYOt
   /ZjmTQEoSGZRm1ngMqaST34JgmB3NdHzqB+PwlGCWjEXslxYaXftw1fAi
   guTsq6oxAqDwYdkOs2MtHxITGDJBSIxvsvCsGtmpwyCh48W7KFLAUf5L/
   OGd2rayLuH8BWFxmpyYYUEnqpQJ9WzMaR37MXPwN/KAcwhGWjGZt0am4k
   WdD+5kP2NqMbDSp3rMpfZn6n9NVxiUtrSm3joEKdfMes5CHTmKISN4D4k
   A==;
X-CSE-ConnectionGUID: wgI98+BBT5OZU+rH87zgwA==
X-CSE-MsgGUID: V/pfDvvOTpKSt0UAbksa+Q==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="53970561"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 07:57:27 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 07:57:08 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:06 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:42 +0100
Subject: [PATCH net-next v2 4/9] net: sparx5: move stats initialization and
 add deinit function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-4-10ba54ccf005@microchip.com>
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
X-CRM114-CacheID: sfid-20260227_065733_967608_FF220F4C 
X-CRM114-Status: GOOD (  15.55  )
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

The sparx5_stats_init() function starts a worker thread which needs to
be cleaned up. Move the initialization code to probe() and add a
deinit() function for proper teardown.

Also, rename sparx_stats_init() to sparx5_stats_init() to match the
driver naming convention.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c |  9 ++++++++-
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c    | 16 ++++++++++------
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h    |  3 ++-
 3 files changed, 20 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
index 049541eeaae0..d42c57bead89 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ethtool.c
@@ -1244,7 +1244,7 @@ const struct ethtool_ops sparx5_ethtool_ops = {
 	.set_pauseparam         = sparx5_set_pauseparam,
 };
 
-int sparx_stats_init(struct sparx5 *sparx5)
+int sparx5_stats_init(struct sparx5 *sparx5)
 {
 	const struct sparx5_consts *consts = sparx5->data->consts;
 	char queue_name[32];
@@ -1278,3 +1278,10 @@ int sparx_stats_init(struct sparx5 *sparx5)
 
 	return 0;
 }
+
+void sparx5_stats_deinit(struct sparx5 *sparx5)
+{
+	cancel_delayed_work_sync(&sparx5->stats_work);
+	destroy_workqueue(sparx5->stats_queue);
+	mutex_destroy(&sparx5->queue_stats_lock);
+}
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 4271f4a29cad..bcc7b895fad6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -743,11 +743,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	if (err)
 		return err;
 
-	/* Init stats */
-	err = sparx_stats_init(sparx5);
-	if (err)
-		return err;
-
 	sparx5_board_init(sparx5);
 
 	/* Start Frame DMA with fallback to register based INJ/XTR */
@@ -986,12 +981,18 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_vcap;
 	}
 
+	err = sparx5_stats_init(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to initialize stats\n");
+		goto cleanup_mact;
+	}
+
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
 	err = sparx5_register_netdevs(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to register net devices\n");
-		goto cleanup_mact;
+		goto cleanup_stats;
 	}
 
 	err = sparx5_register_notifier_blocks(sparx5);
@@ -1004,6 +1005,8 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 cleanup_netdevs:
 	sparx5_unregister_netdevs(sparx5);
+cleanup_stats:
+	sparx5_stats_deinit(sparx5);
 cleanup_mact:
 	sparx5_mact_deinit(sparx5);
 cleanup_vcap:
@@ -1035,6 +1038,7 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 	}
 	sparx5_unregister_notifier_blocks(sparx5);
 	sparx5_unregister_netdevs(sparx5);
+	sparx5_stats_deinit(sparx5);
 	sparx5_mact_deinit(sparx5);
 	sparx5_vcap_deinit(sparx5);
 	sparx5_ptp_deinit(sparx5);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index e4c39cca7b26..97d53e229ad6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -514,7 +514,8 @@ enum sparx5_cal_bw sparx5_get_port_cal_speed(struct sparx5 *sparx5, u32 portno);
 
 /* sparx5_ethtool.c */
 void sparx5_get_stats64(struct net_device *ndev, struct rtnl_link_stats64 *stats);
-int sparx_stats_init(struct sparx5 *sparx5);
+int sparx5_stats_init(struct sparx5 *sparx5);
+void sparx5_stats_deinit(struct sparx5 *sparx5);
 
 /* sparx5_dcb.c */
 #ifdef CONFIG_SPARX5_DCB

-- 
2.34.1


