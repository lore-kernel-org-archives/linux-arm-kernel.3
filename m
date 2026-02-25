Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F52BEFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CLx42LdcO+9fJzNp3UHHONMqI2y54mEyEfJ0MOtshy0=; b=Z5RuiovzpharmmJ6FAPBYVUHZA
	I5rJnDVuDBwoAT2MbgsXgOvOSqW4Ew0a8U5AJ3ONLYXDiQL8L+KaRwtOUlIOSmHTTfHaUIIcs238g
	TwQWNduzxFVUcSrDofbv3KnyOL/M4KFvCYE4bxTLwEKmm/xBY14sig16+eFSVAbDa9Sb+VT0hRpH1
	ojvIYakHSMXVfHOpKnFsrA3EHByl4Hy0fLb0XoD9he+vjk4h7MccNawlhYzoVpy30xZ6hgRaF3ahY
	8D/u166dm45Xt7Od7mXAOpvgZs7mGtYH+oZ+fE6DRB9oyagdVeAMh8NrawNQ3KAPil4wOuOKa25pD
	CScUSeTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAr8-00000003d8D-3Ljp;
	Wed, 25 Feb 2026 09:06:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvAr4-00000003d4C-0bCZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:06:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010408; x=1803546408;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=tM4XdMCygnhhnecObA64rz3/1LPZ7QdO3ptWuL+K8Dc=;
  b=NOpzmOB9rq4fiHbK0uDuJEeBWeQ1FPKWp/sHD5nD0duOq/mRwRlKwkHd
   2Y23gAT7RbgNVN+TIA7U1uVLigagzeXg3ZLMDlPeWBgnh+vLskm0W03Dk
   A/j48dG4/8kXHyESz+bVFR2OSNCklZjTKVVuEXSvWYE2UehqAbIsUuTJ1
   Xuo8e8943mxHIAZ0AbOeKOOdmRDfLQCLmFGBZ1RQVTnZ/CaPbo+P9bpLP
   1Aa7MZXjJKRMExhtnq62CLZhdMqGNrDkI9bNpaoIgOGGlYqLpVKUWVeAF
   y5VpWh1zoIpibpLJouIS1C1XRI9yZAJ4K11NCu/phE8A5H6VXVGIzxH84
   Q==;
X-CSE-ConnectionGUID: BbhGCtIlQZOkUhkWOAVukw==
X-CSE-MsgGUID: tjMTnoSvSBiVsapcaAugRw==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="221112786"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2026 02:06:46 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 25 Feb 2026 02:06:12 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:10 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:25 +0100
Subject: [PATCH net-next 2/7] net: sparx5: move netdev and notifier block
 registration to probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-2-97036580b9f0@microchip.com>
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
X-CRM114-CacheID: sfid-20260225_010650_247910_298C55BA 
X-CRM114-Status: GOOD (  14.17  )
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
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 43 +++++++++++-----------
 1 file changed, 22 insertions(+), 21 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index d7e823fe4ab9..9887a260bafc 100644
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
@@ -823,12 +814,6 @@ static int sparx5_start(struct sparx5 *sparx5)
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
@@ -1002,21 +987,37 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
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
 	/* Start the rest of the initialization and enable interrupts. Must be
 	 * called last, after all subsystems are initialized.
 	 */
 	err = sparx5_start(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Start failed\n");
-		goto cleanup_ptp;
+		goto cleanup_notifiers;
 	}
 
 	goto cleanup_config;
 
+cleanup_notifiers:
+	sparx5_unregister_notifier_blocks(sparx5);
+cleanup_netdevs:
+	sparx5_unregister_netdevs(sparx5);
 cleanup_ptp:
 	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
-	sparx5_cleanup_ports(sparx5);
+	sparx5_destroy_netdevs(sparx5);
 	if (sparx5->mact_queue)
 		destroy_workqueue(sparx5->mact_queue);
 cleanup_config:
@@ -1044,12 +1045,12 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 		disable_irq(sparx5->ptp_irq);
 		sparx5->ptp_irq = -ENXIO;
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


