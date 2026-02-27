Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585C9FEFB5B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jPrKMb2B8GNaLtE1gwPBwDFyy/oBajww/6pkNNDUz6c=; b=USrjaEvZuNgxPHMiqRd3aUXAKN
	3Nltp7JNUf0yBBi7W2OFo3QrSM2VbrJQL4m+iLzRrXiERb4ATT3iGeYvn/gvQOwNG67aMwSTg26Yi
	NsyLXuAsO1kr2ixm/k1byzW5eW1Fj/nRl8gD3LmKsW3LzMVvB2qeS3+Q8Fqf43tiAL9/lGUMV2D7e
	BMWlEor2k/Ch9JoxoZx5zrlL7K/CAT0/G3dxPuOr2iwwQirjtIwtslvxxwrEOXJL1G2HaOw56vjPY
	IZLo1hqr1ykHeEch0YkF0w1tiB2D4BuYTqVTf7ATKJ7r73oiuDwACl+QtK1/uh+nu4YvGotIFEcPr
	AUdsKJ+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHs-00000008XID-0Ol9;
	Fri, 27 Feb 2026 14:57:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHl-00000008XDd-3S1t
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204265; x=1803740265;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=ad/LhZWihMSxoB3f8xRbFoDYpgaS3dn/F656MTIvq44=;
  b=dhXGDPGl12zlwVqPElvruepr9FDxhWiXzXU9Osh5gMDvfN4qfpsO8wBm
   7WFEF8FLxPazHn2F4gwYJqn9L3nSao6ejykgM2/8hwFHtLRHERJ80IlA+
   z07IwdnU9/6AfnhKOHvTdCWyPMhQaJ0KbXbM20+7GD6zwQGvvp5ma4RKH
   1S97g8Xgw4ohb3udfISYDwKDQDWrtHojT757vCgYriY9TJGmulpqaq+EF
   qIHsiEVQVjAb+nOb7BeobNgn9XPgtUAE4/A4xKQwBhDHo24gYaO9cTLL3
   WqJpUE3ztwtSdz4NMOcPVMZqfzyhOsTuJ84MrO9oiK5nUrA0XnXCKqR6h
   A==;
X-CSE-ConnectionGUID: wDbLW9d7SnOseX1061A6kw==
X-CSE-MsgGUID: QlVELnkhTC+anAGdFG6OVQ==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="221253468"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:57:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 07:57:03 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:01 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:40 +0100
Subject: [PATCH net-next v2 2/9] net: sparx5: move VCAP initialization to
 probe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-2-10ba54ccf005@microchip.com>
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
X-CRM114-CacheID: sfid-20260227_065745_939378_81FE512B 
X-CRM114-Status: GOOD (  14.25  )
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
index 0ca4001a3667..fbd75423f2a7 100644
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
@@ -1003,12 +999,18 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
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
@@ -1021,6 +1023,8 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 cleanup_netdevs:
 	sparx5_unregister_netdevs(sparx5);
+cleanup_vcap:
+	sparx5_vcap_deinit(sparx5);
 cleanup_ptp:
 	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
@@ -1050,9 +1054,9 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
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


