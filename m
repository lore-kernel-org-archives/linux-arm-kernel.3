Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78EDCFEFB56
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mt2RS05q9S0gpgJCFguomrYapx3ELjifPh+0+EOlEtw=; b=3ZVJeO7NKEG0IhXsHu4bwdq1w/
	EUMOmCngiBae2AiGeY9i8svtFubfBWIEwV3NR1vMbjLv3QiWlfcWSU0WLerO1V8+5i/xkFuW4sDgM
	8Ypy5tE3QvY0UhHSmfvfF3Zmc5hHa4H6uTV9YqDZy6aI8WWWYd9nhCnKwG8nLjQg4qd2G4U0Nkf+c
	X9I+ymJUuCqzKfEhuaSXHTfcEFO0iuxUiO3nX4zlJO69wvap0mj3PTU/VhkqbTHIgra94iBpGMscY
	tjzDObZh9e/6m20+EnY5m0oifemiUv/EeSlo653znjBdcQItc0xYKo0qNONnLoDSHHuvwZjmfLjbi
	RmaWn/Lw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzI4-00000008XTP-0Ebv;
	Fri, 27 Feb 2026 14:58:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHs-00000008XHK-0GVG
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 14:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Mt2RS05q9S0gpgJCFguomrYapx3ELjifPh+0+EOlEtw=; b=dfwmlEvkikEmJoV4Ye5hA7AkFC
	7PCN+jDESw5ChOQR7QTzCZW2i/jfVWYE2G5yfQOm6rmyW8y4nVzV31V/FiL9M5EfZlJ9OBY5Fiekb
	HEZfEfIToGRZE3TYF/xl/UOaANSYKVtnbiNO/mZsfhRUlgjU+yImPHIoD58iNVvZw6/8tmVvb764b
	5nS7t1AFxx2IcBjAYCiiJeuN12nu6Tw5r9Hf2GLb8UMKN0hqGat5jzkUNrijbZHffza/K9mFF9sPI
	fGJbQHT9LFcDkVNaJH13UwbMGgS2Cg2xaANZwQjDA9fzu13nHUoxm+WzO9hm51ZJ2FdBHU57EicL+
	ychq9e9g==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHo-0000000DIGU-3k9h
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204268; x=1803740268;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=JGGgjQLyYr4k2tf/YRLE0LmiapfLAIzxEgTqt5+t/F8=;
  b=NXJ45g/stbQcuw6lTC8SkhxN4WFxRM8f7NogQslgmnknwZZFcogr7n8D
   sjcdqgTkXNDDCyuSOFU6fFKsaGjze4XoYzOZ8pSJbp8UW8DdWb0aC3+Rj
   iTqAE9zWQe13j5iPMQwgjmBLTxSK6T0r75Kcvaq5IXfQ9dJSZaG8T/876
   R25PzOnkhA27k/VA3HZkVU7q5AU+I3TtwkWznP8Kjz/rmJS1bDU7uJRSl
   g3oJIW2gftaxw1ZjcLsPAfpWslpHJ101ZEyFVwu2nc+mjUSODVRcW3Qo/
   0pZ49ACQqNA6m1X+2cItinCBa4/Ps5fcDbqEIOhpQm1jXRejSMRiUX98D
   A==;
X-CSE-ConnectionGUID: wDbLW9d7SnOseX1061A6kw==
X-CSE-MsgGUID: YOtBsiwHQzexSo0RYhF6Qw==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="221253470"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2026 07:57:44 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.35; Fri, 27 Feb 2026 07:57:19 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:16 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:46 +0100
Subject: [PATCH net-next v2 8/9] net: sparx5: move FDMA/XTR initialization
 out of sparx5_start()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-8-10ba54ccf005@microchip.com>
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
X-CRM114-CacheID: sfid-20260227_145749_371298_5433908F 
X-CRM114-Status: GOOD (  19.11  )
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

Move the Frame DMA and register-based extraction initialization out of
sparx5_start() and into a new sparx5_frame_io_init() function, called
from probe().

Also, add sparx5_frame_io_deinit() for the cleanup path.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 109 ++++++++++++---------
 1 file changed, 63 insertions(+), 46 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index f359008d2205..e4a448fd2b30 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -658,6 +658,58 @@ static int sparx5_qlim_set(struct sparx5 *sparx5)
 	return 0;
 }
 
+static int sparx5_frame_io_init(struct sparx5 *sparx5)
+{
+	const struct sparx5_ops *ops = sparx5->data->ops;
+	int err = -ENXIO;
+
+	/* Start Frame DMA with fallback to register based INJ/XTR */
+	if (sparx5->fdma_irq >= 0) {
+		if (GCB_CHIP_ID_REV_ID_GET(sparx5->chip_id) > 0 ||
+		    !is_sparx5(sparx5))
+			err = devm_request_irq(sparx5->dev,
+					       sparx5->fdma_irq,
+					       sparx5_fdma_handler,
+					       0,
+					       "sparx5-fdma", sparx5);
+		if (!err) {
+			err = ops->fdma_init(sparx5);
+			if (!err)
+				sparx5_fdma_start(sparx5);
+		}
+		if (err)
+			sparx5->fdma_irq = -ENXIO;
+	} else {
+		sparx5->fdma_irq = -ENXIO;
+	}
+	if (err && sparx5->xtr_irq >= 0) {
+		err = devm_request_irq(sparx5->dev, sparx5->xtr_irq,
+				       sparx5_xtr_handler, IRQF_SHARED,
+				       "sparx5-xtr", sparx5);
+		if (!err)
+			err = sparx5_manual_injection_mode(sparx5);
+		if (err)
+			sparx5->xtr_irq = -ENXIO;
+	} else {
+		sparx5->xtr_irq = -ENXIO;
+	}
+
+	return err;
+}
+
+static void sparx5_frame_io_deinit(struct sparx5 *sparx5)
+{
+	if (sparx5->xtr_irq >= 0) {
+		disable_irq(sparx5->xtr_irq);
+		sparx5->xtr_irq = -ENXIO;
+	}
+	if (sparx5->fdma_irq >= 0) {
+		disable_irq(sparx5->fdma_irq);
+		sparx5->data->ops->fdma_deinit(sparx5);
+		sparx5->fdma_irq = -ENXIO;
+	}
+}
+
 /* Some boards needs to map the SGPIO for signal detect explicitly to the
  * port module
  */
@@ -686,9 +738,7 @@ static void sparx5_board_init(struct sparx5 *sparx5)
 static int sparx5_start(struct sparx5 *sparx5)
 {
 	const struct sparx5_consts *consts = sparx5->data->consts;
-	const struct sparx5_ops *ops = sparx5->data->ops;
 	u32 idx;
-	int err;
 
 	/* Setup own UPSIDs */
 	for (idx = 0; idx < consts->n_own_upsids; idx++) {
@@ -729,39 +779,7 @@ static int sparx5_start(struct sparx5 *sparx5)
 	/* Enable queue limitation watermarks */
 	sparx5_qlim_set(sparx5);
 
-	/* Start Frame DMA with fallback to register based INJ/XTR */
-	err = -ENXIO;
-	if (sparx5->fdma_irq >= 0) {
-		if (GCB_CHIP_ID_REV_ID_GET(sparx5->chip_id) > 0 ||
-		    !is_sparx5(sparx5))
-			err = devm_request_irq(sparx5->dev,
-					       sparx5->fdma_irq,
-					       sparx5_fdma_handler,
-					       0,
-					       "sparx5-fdma", sparx5);
-		if (!err) {
-			err = ops->fdma_init(sparx5);
-			if (!err)
-				sparx5_fdma_start(sparx5);
-		}
-		if (err)
-			sparx5->fdma_irq = -ENXIO;
-	} else {
-		sparx5->fdma_irq = -ENXIO;
-	}
-	if (err && sparx5->xtr_irq >= 0) {
-		err = devm_request_irq(sparx5->dev, sparx5->xtr_irq,
-				       sparx5_xtr_handler, IRQF_SHARED,
-				       "sparx5-xtr", sparx5);
-		if (!err)
-			err = sparx5_manual_injection_mode(sparx5);
-		if (err)
-			sparx5->xtr_irq = -ENXIO;
-	} else {
-		sparx5->xtr_irq = -ENXIO;
-	}
-
-	return err;
+	return 0;
 }
 
 static int mchp_sparx5_probe(struct platform_device *pdev)
@@ -965,10 +983,16 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
+	err = sparx5_frame_io_init(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to initialize frame I/O\n");
+		goto cleanup_stats;
+	}
+
 	err = sparx5_ptp_init(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to initialize PTP\n");
-		goto cleanup_stats;
+		goto cleanup_frame_io;
 	}
 
 	err = sparx5_register_netdevs(sparx5);
@@ -989,6 +1013,8 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 	sparx5_unregister_netdevs(sparx5);
 cleanup_ptp:
 	sparx5_ptp_deinit(sparx5);
+cleanup_frame_io:
+	sparx5_frame_io_deinit(sparx5);
 cleanup_stats:
 	sparx5_stats_deinit(sparx5);
 cleanup_mact:
@@ -1007,24 +1033,15 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 static void mchp_sparx5_remove(struct platform_device *pdev)
 {
 	struct sparx5 *sparx5 = platform_get_drvdata(pdev);
-	const struct sparx5_ops *ops = sparx5->data->ops;
 
 	debugfs_remove_recursive(sparx5->debugfs_root);
-	if (sparx5->xtr_irq) {
-		disable_irq(sparx5->xtr_irq);
-		sparx5->xtr_irq = -ENXIO;
-	}
-	if (sparx5->fdma_irq) {
-		disable_irq(sparx5->fdma_irq);
-		sparx5->fdma_irq = -ENXIO;
-	}
 	sparx5_unregister_notifier_blocks(sparx5);
 	sparx5_unregister_netdevs(sparx5);
 	sparx5_ptp_deinit(sparx5);
+	sparx5_frame_io_deinit(sparx5);
 	sparx5_stats_deinit(sparx5);
 	sparx5_mact_deinit(sparx5);
 	sparx5_vcap_deinit(sparx5);
-	ops->fdma_deinit(sparx5);
 	sparx5_destroy_netdevs(sparx5);
 }
 

-- 
2.34.1


