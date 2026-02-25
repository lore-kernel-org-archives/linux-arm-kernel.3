Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96FFFEFD20B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=koA5bc4qPWrSF5Z4VPcHWpemcrfaP9JP4MBBtUtQbT0=; b=owbcxPYcFcC3E4EDOeuVvUJBvm
	sOloiKGL9wWFGOJl6DcOYZ8B9tGR4mIEmosFsMGbuLnGLtOHLWF4NFprouE5/BUK8bFLxRUHHCr7X
	+T5JjFntuezw3Hw1EsqU3JQH5SsfN0rwWWWD2oMUMNVZZpwgroQ/pgRxFcyTIAKTmNsex6nZ+sXKA
	PS2QGf/JvbLIwi696mrP0l/BLWTgk9OjK5rTuBnSQqGAhS71NtbPuMEF9oLK/b+uVuWKIOpbn+1D/
	rlV93VGupLfW/43IFzDc4orXHVuL36PAbiMFrC/HCgyZ70mbtuf6Z41/ODsJBPcGr5m5bOSkXlrN0
	61MOQdsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqt-00000003d04-2PSu;
	Wed, 25 Feb 2026 09:06:39 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqn-00000003cyH-1r5y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 09:06:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=koA5bc4qPWrSF5Z4VPcHWpemcrfaP9JP4MBBtUtQbT0=; b=oqW8YQ0PotRONPM2vT0CDJrxi5
	2XsTZWMtt7J1iJ+reo+Oze4MQ1b6Ld86c6YZtDPxJ1jSSfnoXZ7eufK9MREoXru0Yu5yGm4/tGOeN
	BZxytgo8tiiGPAl+qwrtTEZ6XZzdPMpoL1+rhzxM4VLk0ZrU78dsG6QrRubANik5Ch/4YdUeCJx34
	tKaDq20n7GTa7jOXU74VM/vZk2nSABQnYBGjNIYqd0naF62b008/9sfXFB8pdXxZhmpJbErK2bKH7
	iSslKeDC+bB6Ze/gqFR/5m/A1v6vFgx3Sw1JeSW2gcy8zoExodfobQEgam5A/4CLvME/oE6JIB+UN
	k22RCTow==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqk-00000008dIF-1AEy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:06:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010390; x=1803546390;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=CEOoIShVVz67EX2t2AqHEGK8T7hIP5WU9sisxJNNPzs=;
  b=bwtM/5nEEqtQ13x2RzrxUyqFK88jMVuHEKDrCpbzsJW8p4N5T9SL/ih1
   T1i1xTpdGiE+41/konY29Vgq2A4naVKQWozVIzWmu3y2uXX9F2+Z/hEyC
   YHPlYf+M11IKhqj4rsjGfBk4E1t8kZN4+ef9BCtUexfNf4z6zjcqnJLw2
   Z0+Bw5LMWlchydQ77fohdYvmMNGaLQAh5GaflQXHFvbZHq/EIX21pnGJo
   7kZlRlSKv6Up2vYFRALDB29+KT3nViMqnkO0kwqFC+2vy6a+bGHF3U+SN
   Ssq4M8YJNxLZFY7mm+7AH+5yevHyL4Me1Xo2x3rC4H8PL6mdhTu8dpN1D
   w==;
X-CSE-ConnectionGUID: GvK6L9OjSSuGPw39llTOAQ==
X-CSE-MsgGUID: ZyZB/CyDSGC4HN5xo0MT/Q==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61259302"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:06:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 02:06:18 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:16 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:28 +0100
Subject: [PATCH net-next 5/7] net: sparx5: move stats initialization and
 add deinit function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-5-97036580b9f0@microchip.com>
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
X-CRM114-CacheID: sfid-20260225_090630_780026_EDE51F56 
X-CRM114-Status: GOOD (  16.12  )
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
index 97dd3cea0554..17748854ca48 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -748,11 +748,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 	if (err)
 		return err;
 
-	/* Init stats */
-	err = sparx_stats_init(sparx5);
-	if (err)
-		return err;
-
 	mutex_init(&sparx5->mdb_lock);
 	INIT_LIST_HEAD(&sparx5->mdb_entries);
 
@@ -976,12 +971,18 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
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
@@ -1005,6 +1006,8 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	sparx5_unregister_notifier_blocks(sparx5);
 cleanup_netdevs:
 	sparx5_unregister_netdevs(sparx5);
+cleanup_stats:
+	sparx5_stats_deinit(sparx5);
 cleanup_mact:
 	sparx5_mact_deinit(sparx5);
 cleanup_vcap:
@@ -1040,6 +1043,7 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
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


