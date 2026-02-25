Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C452EFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lMbt5BMXsLoyzWPafrrZtwaR4qv1Bkw59zpQzOq0pHU=; b=gPHuKJqeYgtbCzcPocoSLa2e0x
	aDO+gOpgc5yj9FDq1JK+VwArs+Qr2o9AJXjkEQqBGTJzvUnK3loqtQ/KKQdSii4dCRdMNHRY90zrl
	7xaobu6qtZX07Acu1bcBjUW5roCIQ9BUuEq1xm57hcxiCpisUc9kv6R5qLp8OqrT2sQxZbTNqSs7u
	AiTzPx1Z+osoedM2MOJYCMcyuMkFV6umN71MawMfmnXvYD6hysIzgLCkETF1Z3OeD3d3ePaskcghs
	acKHqGBXeROwRjk+UwEMFtY64oeniRnD4QB93PbncYSGGU94Da7xF5vl0x8Iqo0Dn2BZjHZRxaGl9
	be579FWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAql-00000003cxX-44UM;
	Wed, 25 Feb 2026 09:06:31 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqf-00000003cvb-2ZAP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:06:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010385; x=1803546385;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=SjGo6ZLzuUnmkoqGRlfVYGuWFR89kHfN9qVzMB3AD+4=;
  b=LMPROzs5vn41TxC/Uc+pZQknSobhQBkWIcCk2MCj9j8lNXis/y1XegUj
   N/ant6A4N3e+2R8sPh2Ecjv9+HU4iYtHMQ5JwGtUnUGQ8kdMsFQcSkCE+
   F4KcX5Xtr2YB9tfalHPLwkPVtSSB4xfuoYqGt+/uiGm9wdoakG8+9uQIZ
   e8Y6TZSSr6hbN/Q9zT5ummoFCpFI8t5Es7MJz7N1amM0xUR3KGADJybD4
   XXCEG8jeNvSctG97ESNg9j9IkYs0nTCkwmvIfwM7LOtXqfpzQ1s/TVxUP
   cR7liz3oUoL3KDfBZerB76icrh8zFSSVyLBQ+crYFFfGBHkHmeZaRzDpy
   w==;
X-CSE-ConnectionGUID: GvK6L9OjSSuGPw39llTOAQ==
X-CSE-MsgGUID: SVwWFSU9S9+y8DN8tRTZiw==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61259300"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:06:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 02:06:16 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:14 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:27 +0100
Subject: [PATCH net-next 4/7] net: sparx5: move MAC table initialization
 and add deinit function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-4-97036580b9f0@microchip.com>
References: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
In-Reply-To: <20260225-sparx5-init-deinit-v1-0-97036580b9f0@microchip.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
	<davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
	<kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Steen Hegelund
	<Steen.Hegelund@microchip.com>, <UNGLinuxDriver@microchip.com>, "Richard
 Cochran" <richardcochran@gmail.com>
CC: <netdev@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_010625_661986_FAD8F2D4 
X-CRM114-Status: GOOD (  17.16  )
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

Consolidate all MAC table initialization from sparx5_start() into
sparx5_mact_init(), move it to probe(), and add a deinit function for
proper teardown.

Also, make sparx5_mact_pull_work() static since it is only used within
sparx5_mactable.c.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../ethernet/microchip/sparx5/sparx5_mactable.c    | 27 +++++++++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 31 +++++++---------------
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  4 +--
 3 files changed, 37 insertions(+), 25 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
index f5584244612c..626ce6f9046d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
@@ -419,7 +419,7 @@ static void sparx5_mact_handle_entry(struct sparx5 *sparx5,
 				  true);
 }
 
-void sparx5_mact_pull_work(struct work_struct *work)
+static void sparx5_mact_pull_work(struct work_struct *work)
 {
 	struct delayed_work *del_work = to_delayed_work(work);
 	struct sparx5 *sparx5 = container_of(del_work, struct sparx5,
@@ -489,8 +489,10 @@ void sparx5_set_ageing(struct sparx5 *sparx5, int msecs)
 		 LRN_AUTOAGE_CFG(0));
 }
 
-void sparx5_mact_init(struct sparx5 *sparx5)
+int sparx5_mact_init(struct sparx5 *sparx5)
 {
+	char queue_name[32];
+
 	mutex_init(&sparx5->lock);
 
 	/*  Flush MAC table */
@@ -502,4 +504,25 @@ void sparx5_mact_init(struct sparx5 *sparx5)
 		dev_warn(sparx5->dev, "MAC flush error\n");
 
 	sparx5_set_ageing(sparx5, BR_DEFAULT_AGEING_TIME / HZ * 1000);
+
+	mutex_init(&sparx5->mact_lock);
+	INIT_LIST_HEAD(&sparx5->mact_entries);
+	snprintf(queue_name, sizeof(queue_name), "%s-mact",
+		 dev_name(sparx5->dev));
+	sparx5->mact_queue = create_singlethread_workqueue(queue_name);
+	if (!sparx5->mact_queue)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&sparx5->mact_work, sparx5_mact_pull_work);
+	queue_delayed_work(sparx5->mact_queue, &sparx5->mact_work,
+			   SPX5_MACT_PULL_DELAY);
+
+	return 0;
+}
+
+void sparx5_mact_deinit(struct sparx5 *sparx5)
+{
+	cancel_delayed_work_sync(&sparx5->mact_work);
+	destroy_workqueue(sparx5->mact_queue);
+	mutex_destroy(&sparx5->mact_lock);
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 28ee45815c7f..97dd3cea0554 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -688,7 +688,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	u8 broadcast[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	const struct sparx5_consts *consts = sparx5->data->consts;
 	const struct sparx5_ops *ops = sparx5->data->ops;
-	char queue_name[32];
 	u32 idx;
 	int err;
 
@@ -728,9 +727,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 			 ANA_CL_FILTER_CTRL_FORCE_FCS_UPDATE_ENA,
 			 sparx5, ANA_CL_FILTER_CTRL(idx));
 
-	/* Init MAC table, ageing */
-	sparx5_mact_init(sparx5);
-
 	/* Init PGID table arbitrator */
 	sparx5_pgid_init(sparx5);
 
@@ -757,19 +753,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	if (err)
 		return err;
 
-	/* Init mact_sw struct */
-	mutex_init(&sparx5->mact_lock);
-	INIT_LIST_HEAD(&sparx5->mact_entries);
-	snprintf(queue_name, sizeof(queue_name), "%s-mact",
-		 dev_name(sparx5->dev));
-	sparx5->mact_queue = create_singlethread_workqueue(queue_name);
-	if (!sparx5->mact_queue)
-		return -ENOMEM;
-
-	INIT_DELAYED_WORK(&sparx5->mact_work, sparx5_mact_pull_work);
-	queue_delayed_work(sparx5->mact_queue, &sparx5->mact_work,
-			   SPX5_MACT_PULL_DELAY);
-
 	mutex_init(&sparx5->mdb_lock);
 	INIT_LIST_HEAD(&sparx5->mdb_entries);
 
@@ -987,12 +970,18 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_ptp;
 	}
 
+	err = sparx5_mact_init(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to initialize MAC table\n");
+		goto cleanup_vcap;
+	}
+
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
 	err = sparx5_register_netdevs(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to register net devices\n");
-		goto cleanup_vcap;
+		goto cleanup_mact;
 	}
 
 	err = sparx5_register_notifier_blocks(sparx5);
@@ -1016,14 +1005,14 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	sparx5_unregister_notifier_blocks(sparx5);
 cleanup_netdevs:
 	sparx5_unregister_netdevs(sparx5);
+cleanup_mact:
+	sparx5_mact_deinit(sparx5);
 cleanup_vcap:
 	sparx5_vcap_deinit(sparx5);
 cleanup_ptp:
 	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
 	sparx5_destroy_netdevs(sparx5);
-	if (sparx5->mact_queue)
-		destroy_workqueue(sparx5->mact_queue);
 cleanup_config:
 	kfree(configs);
 cleanup_pnode:
@@ -1051,11 +1040,11 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 	}
 	sparx5_unregister_notifier_blocks(sparx5);
 	sparx5_unregister_netdevs(sparx5);
+	sparx5_mact_deinit(sparx5);
 	sparx5_vcap_deinit(sparx5);
 	sparx5_ptp_deinit(sparx5);
 	ops->fdma_deinit(sparx5);
 	sparx5_destroy_netdevs(sparx5);
-	destroy_workqueue(sparx5->mact_queue);
 }
 
 static const struct sparx5_regs sparx5_regs = {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index 6a069434fca6..e4c39cca7b26 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -470,7 +470,6 @@ void sparx5_fdma_reload(struct sparx5 *sparx5, struct fdma *fdma);
 void sparx5_fdma_injection_mode(struct sparx5 *sparx5);
 
 /* sparx5_mactable.c */
-void sparx5_mact_pull_work(struct work_struct *work);
 int sparx5_mact_learn(struct sparx5 *sparx5, int port,
 		      const unsigned char mac[ETH_ALEN], u16 vid);
 bool sparx5_mact_getnext(struct sparx5 *sparx5,
@@ -489,7 +488,8 @@ int sparx5_del_mact_entry(struct sparx5 *sparx5,
 int sparx5_mc_sync(struct net_device *dev, const unsigned char *addr);
 int sparx5_mc_unsync(struct net_device *dev, const unsigned char *addr);
 void sparx5_set_ageing(struct sparx5 *sparx5, int msecs);
-void sparx5_mact_init(struct sparx5 *sparx5);
+int sparx5_mact_init(struct sparx5 *sparx5);
+void sparx5_mact_deinit(struct sparx5 *sparx5);
 
 /* sparx5_vlan.c */
 void sparx5_pgid_update_mask(struct sparx5_port *port, int pgid, bool enable);

-- 
2.34.1


