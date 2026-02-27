Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 806DFFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0L1Xn1Qqqb/J9G3uHvqPtdMFSf49Rv4ie/T3NdbOJoI=; b=LM0D1heVK90UnNxQB0yP/wFM0r
	RTXlbR2LgGOavwwnNo3pFtA5jDAHDOPDgyWHPwmAbMkudwmeZCLBPQ5qauaOoKHIpXHfbP92SGV9G
	J+6OFmBHpgzDAiRT2GACb+P/RhRkMDS/Uqdr80mMgFOX9rW9t2jvceRkvy1fyewRzxuwrqG80x+0H
	ByLiobDKrHll/hLxcWap/6L6SqTKc26Rm6H2dZ1W0p67O4k6+i602IcorBigP4VHh+h4p1705PXYR
	cdEtkGOZZplwRcx7B7plQq4khzh3McT5z1IktTx2GNFffKI9QeCCse91d4u4r6cGYku2CByJZ5KC8
	8EebT4Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzI8-00000008XYG-3ggn;
	Fri, 27 Feb 2026 14:58:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzI7-00000008XWb-3cqc
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 14:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=0L1Xn1Qqqb/J9G3uHvqPtdMFSf49Rv4ie/T3NdbOJoI=; b=UbUGx/UIc9XMsfuBu7De4bEfzz
	bEWo2JzDZ0BpanE2O8JeLMB0Df4xnAd/zGj+r5taNWBJDUAm6BuURNIsGaDJ1EwJmnD51d9DU5B7L
	zfdMUEW6c/qoIDnwEHbpsS/XkFUuw+PKARaFRlWYvsq+3LoGaSXOeZkigk7t/3RPEQew4Arx/uQdM
	/dka8pzQX/RSmxLYau+Eag9hVghD19AbYOAbizWr6HwmffUs4cfwep0tSk1i/fLyWlNF/L3S+YUXf
	jkdIYY+Ogn6BAMtTaK4ujRwJlVsTd9iBZg1LUw6fbnCGREAFJSKcp/zZ9mq5+P/PWWdA9EEK0SbB4
	OtSrKkkg==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzI4-0000000DIHu-0mjQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:58:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204284; x=1803740284;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=g+Ri/oDlf8DOqNdyvpzURzYOTW/XRkVHBnEW5vmfepI=;
  b=q/wzrb9/VxthEWqQdO00RcD11bFbhe/NNazaOkgK4mSCYGG4walZii/S
   C5Avk2o1uxccGrlGAqzYODSr6Crfl0E5zGhO1RLWK40Py8xi1l3eZmhJL
   zj8VBiblxwek6GemI0aezfau8F/5V3pIVNemfBMCEVfLjpzauG26juQnC
   DqNN0MKm5w8qJ1R09tSxnQOlqylMGvgXZbGUwQuavOilSs8nI/fNoL6hW
   jB6ZzqqAUmK66uzTFBL92lmJLruHUEKIevl/iadvfpjYEbU4eLR2YGlFM
   slvO9JYKfOiS15NYBfPaZFNAuYypLpNb/S7VsmIiXzh1KAbFeIEv+i2R3
   g==;
X-CSE-ConnectionGUID: G0BlzcC7T0WxDxHhnL2Jcg==
X-CSE-MsgGUID: d1A61+2GSOOufFWdLtXU3w==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="285349971"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:58:02 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 07:57:06 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:03 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:41 +0100
Subject: [PATCH net-next v2 3/9] net: sparx5: move MAC table initialization
 and add deinit function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-3-10ba54ccf005@microchip.com>
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
X-CRM114-CacheID: sfid-20260227_145804_708966_59F6615A 
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
 .../ethernet/microchip/sparx5/sparx5_mactable.c    | 34 +++++++++++++++++--
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 39 ++++++----------------
 .../net/ethernet/microchip/sparx5/sparx5_main.h    |  4 +--
 3 files changed, 44 insertions(+), 33 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c b/drivers/net/ethernet/microchip/sparx5/sparx5_mactable.c
index f5584244612c..2bf9c5f64151 100644
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
@@ -502,4 +504,32 @@ void sparx5_mact_init(struct sparx5 *sparx5)
 		dev_warn(sparx5->dev, "MAC flush error\n");
 
 	sparx5_set_ageing(sparx5, BR_DEFAULT_AGEING_TIME / HZ * 1000);
+
+	/* Add host mode BC address (points only to CPU) */
+	sparx5_mact_learn(sparx5, sparx5_get_pgid(sparx5, PGID_CPU),
+			  (unsigned char[]){0xff, 0xff, 0xff, 0xff, 0xff, 0xff},
+			  NULL_VID);
+
+	mutex_init(&sparx5->mdb_lock);
+	INIT_LIST_HEAD(&sparx5->mdb_entries);
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
index fbd75423f2a7..4271f4a29cad 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -685,10 +685,8 @@ static void sparx5_board_init(struct sparx5 *sparx5)
 
 static int sparx5_start(struct sparx5 *sparx5)
 {
-	u8 broadcast[ETH_ALEN] = {0xff, 0xff, 0xff, 0xff, 0xff, 0xff};
 	const struct sparx5_consts *consts = sparx5->data->consts;
 	const struct sparx5_ops *ops = sparx5->data->ops;
-	char queue_name[32];
 	u32 idx;
 	int err;
 
@@ -728,19 +726,12 @@ static int sparx5_start(struct sparx5 *sparx5)
 			 ANA_CL_FILTER_CTRL_FORCE_FCS_UPDATE_ENA,
 			 sparx5, ANA_CL_FILTER_CTRL(idx));
 
-	/* Init MAC table, ageing */
-	sparx5_mact_init(sparx5);
-
 	/* Init PGID table arbitrator */
 	sparx5_pgid_init(sparx5);
 
 	/* Setup VLANs */
 	sparx5_vlan_init(sparx5);
 
-	/* Add host mode BC address (points only to CPU) */
-	sparx5_mact_learn(sparx5, sparx5_get_pgid(sparx5, PGID_CPU), broadcast,
-			  NULL_VID);
-
 	/* Enable queue limitation watermarks */
 	sparx5_qlim_set(sparx5);
 
@@ -757,22 +748,6 @@ static int sparx5_start(struct sparx5 *sparx5)
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
-	mutex_init(&sparx5->mdb_lock);
-	INIT_LIST_HEAD(&sparx5->mdb_entries);
-
 	sparx5_board_init(sparx5);
 
 	/* Start Frame DMA with fallback to register based INJ/XTR */
@@ -1005,12 +980,18 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
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
@@ -1023,14 +1004,14 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
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
@@ -1054,11 +1035,11 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
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


