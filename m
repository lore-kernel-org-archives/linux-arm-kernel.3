Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 028A4EFD20B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PCADmZJeIvNbLSdaRxOnBr+QndiRvwpVVCj4pyp1xww=; b=1rqS/e7w79QaSY9PKN29zUIbol
	yvDpfQTkuRJvKWT7SHkOjhYWwm+TlEKwhTgIlV17nxGuT9W/gTUQ8DN7MzXtnSA4P7ckOA2HpUuyU
	7cc3YIQS/dYWlN1rcypHL+8KgISGMQTmJ9sWZ5+pHIeXIut/31dGOG7yCFscgo/mTVOexFHx/7220
	QN/FTumlVHCkpUx0XN/8LhI44uYKQ9+k1fRkOyX6zsar8lXVw2K7+BEVgidI7NgXjuo+OygztSIe7
	pfhK2zn7G4+qoT6+K0SyPcwUczUbBTFwgcGsAMX0b+mXQSaZQlCjyMtRXhz6G18OC105Lybbox5yZ
	7zqlCjGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqh-00000003cwg-2lWf;
	Wed, 25 Feb 2026 09:06:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAqe-00000003cvb-24gv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010384; x=1803546384;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=Ms5EvdSvw59+pigEbOTMZYJRJle67s3XN/MmS6G0DeM=;
  b=lFpp0k4KQvdHwlO0f7ncNkg0ixmqqESgsmERVC/c/10Fa4wJheIiHtih
   H9if6dQFVsKTC8sfnNQjW9MVtS63cX39KyEj1lJS4iEq1/MnlBkFugDdr
   4GmTptgUmUYf4Wpe3PlRhHGSYdrI9zLu4X32q91dDbWMWwNtD30xGX3he
   WAeUvr1J+GzawqXwEOq6AQRFCilIWJNxZe6soDR9UHWcOWVPDIhxdC71t
   LmHt4KeXmVD1dETrF7Yq4LbG5JU4p6bg8gFm4a1xBhEomZN1ZS0G+as5O
   USoH85bXG1XzWpwxA3EtCASBqG+BhxWhb7GDJVnZA8gcnf0mVGk9nVUTO
   w==;
X-CSE-ConnectionGUID: GvK6L9OjSSuGPw39llTOAQ==
X-CSE-MsgGUID: wGZ5CqykQMGMVoCtVHo6Sg==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="61259299"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 02:06:23 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex3.mchp-main.com (10.10.87.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Wed, 25 Feb 2026 02:06:14 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:12 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:26 +0100
Subject: [PATCH net-next 3/7] net: sparx5: move VCAP initialization to
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-3-97036580b9f0@microchip.com>
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
X-CRM114-CacheID: sfid-20260225_010624_546324_CF933017 
X-CRM114-Status: GOOD (  14.95  )
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

Move the VCAP initialization code from sparx5_start() to probe(). Add
proper error handling with a cleanup_vcap label and sparx5_vcap_deinit()
call.

Also, rename sparx5_vcap_destroy() to sparx5_vcap_deinit() to stay
consistent with the naming.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 drivers/net/ethernet/microchip/sparx5/sparx5_main.c      | 16 ++++++++++------
 drivers/net/ethernet/microchip/sparx5/sparx5_main.h      |  2 +-
 drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c |  2 +-
 3 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 9887a260bafc..28ee45815c7f 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -775,10 +775,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 
 	sparx5_board_init(sparx5);
 
-	err = sparx5_vcap_init(sparx5);
-	if (err)
-		return err;
-
 	/* Start Frame DMA with fallback to register based INJ/XTR */
 	err = -ENXIO;
 	if (sparx5->fdma_irq >= 0) {
@@ -985,12 +981,18 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_ports;
 	}
 
+	err = sparx5_vcap_init(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to initialize VCAP\n");
+		goto cleanup_ptp;
+	}
+
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
 	err = sparx5_register_netdevs(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to register net devices\n");
-		goto cleanup_ptp;
+		goto cleanup_vcap;
 	}
 
 	err = sparx5_register_notifier_blocks(sparx5);
@@ -1014,6 +1016,8 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	sparx5_unregister_notifier_blocks(sparx5);
 cleanup_netdevs:
 	sparx5_unregister_netdevs(sparx5);
+cleanup_vcap:
+	sparx5_vcap_deinit(sparx5);
 cleanup_ptp:
 	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
@@ -1047,9 +1051,9 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 	}
 	sparx5_unregister_notifier_blocks(sparx5);
 	sparx5_unregister_netdevs(sparx5);
+	sparx5_vcap_deinit(sparx5);
 	sparx5_ptp_deinit(sparx5);
 	ops->fdma_deinit(sparx5);
-	sparx5_vcap_destroy(sparx5);
 	sparx5_destroy_netdevs(sparx5);
 	destroy_workqueue(sparx5->mact_queue);
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
index fe7d8bcc0cd9..6a069434fca6 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.h
@@ -563,7 +563,7 @@ void sparx5_get_hwtimestamp(struct sparx5 *sparx5,
 
 /* sparx5_vcap_impl.c */
 int sparx5_vcap_init(struct sparx5 *sparx5);
-void sparx5_vcap_destroy(struct sparx5 *sparx5);
+void sparx5_vcap_deinit(struct sparx5 *sparx5);
 
 /* sparx5_pgid.c */
 enum sparx5_pgid_type {
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
index 25066ddb8d4d..9b4ea3e22ef8 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_vcap_impl.c
@@ -2083,7 +2083,7 @@ int sparx5_vcap_init(struct sparx5 *sparx5)
 	return err;
 }
 
-void sparx5_vcap_destroy(struct sparx5 *sparx5)
+void sparx5_vcap_deinit(struct sparx5 *sparx5)
 {
 	struct vcap_control *ctrl = sparx5->vcap_ctrl;
 	struct vcap_admin *admin, *admin_next;

-- 
2.34.1


