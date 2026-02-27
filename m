Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BBBFEFB54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 14:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H2lkVGV2MrGhkfGcTeh937Su9uV8k6Yms+G1AUUTgtw=; b=1VVNvfquFBtn2eGPkeUtrEVHjP
	ERbCNkiXgNdI9DiUYcJipCyLlLPBFi+6dU87f+XOWg9tk1iWoB0DCcLelas7wHlOxCCL1v+sTx1Mu
	pXc4K7xu1FJ4M4sCkpw4HbBVKHiv71CxTDFw52XsfO3X3eCyDAB+Aqby1pkkJWvx2eNwcVMKq2/pm
	AwAEjfBQBpUSRLxMGqSZcdXfFf3e5MupD3RNMJDQKbWRhlHj6Z/LmQiYUQxtQcK8Zd6mezbW4qqDS
	Q2+hBYdi2eHselywUlTAutck8/GK+RtQ8mwtiWxHzJZDyLMVQ3rGZs+OQDDHAoaPXHLPR605qb788
	p43/WLQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHr-00000008XHi-3Cgj;
	Fri, 27 Feb 2026 14:57:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHk-00000008XCa-0mAz
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 27 Feb 2026 14:57:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=H2lkVGV2MrGhkfGcTeh937Su9uV8k6Yms+G1AUUTgtw=; b=CbBlzRx/B4mXLbxl62FX7w90aX
	k6etUIwLlJuhOfR5QREcDGDvVc81ozXo/f1DdE2PytyW85sToYadjFol9XMGZlA/qPkUQeXhTdkwK
	9t1l8zd/t7tos4UEfOVVvjDfl/MI3lNo59+0XDOnw7cYyc6nW1EeEXdbmzcECrSEa59AZarVQ5cWL
	OADrwSLeSgsbBxBOgqcc2GrVj/J/cqb9bgzPdIkSq1Dmkd4VhiPUPy0a3QKv7ZqjcLJxjywJR+bgz
	BmJNBt4BgpTdjEXj3OABEofsi8QBfcAWgSmwYE4z59cdItBLRCrI2fEutFhFXr4CNUyN2ahhUkrIi
	rkqXUuaw==;
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvzHf-0000000DIEc-4AX2
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 14:57:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772204258; x=1803740258;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=TZmrEqNYunFkfCNtjB0WvV61y+JRk2jGtPFp6ATKH94=;
  b=bD0uOSlueFbOqqrDRpL1IdhWvJm0lSHjHkNmaZzwNBxYV3x2Kv48z4a+
   jPrxqAUQv9IXKf3ZpkUSuy1Zqy55BOKa20Sb+9RSoEXlCNv8KVL4m33BT
   y0/85rqn1TosB1eVS+x0SKJwMNTEig/E8r8kPRWagokVYHQzPMpdQJKrj
   ll0l/jVntrQFuBoOPV/v/cBNYO6uJN6/TPWu6zV9QS5T5XF/hARk4tBmc
   iIhuKR4zUpS8IJnsgqsAUfq+tuGpPnlDLq7RPegYRcSUaDtVaYLAa3siv
   JtS7Vk38vLrVSOWfHkl2q2F5aC/EME67+5cGTiird2+gMLu3ykUbCtYN9
   w==;
X-CSE-ConnectionGUID: wgI98+BBT5OZU+rH87zgwA==
X-CSE-MsgGUID: NwFtLTw4RKuhXMCJaqmLrw==
X-IronPort-AV: E=Sophos;i="6.21,314,1763449200"; 
   d="scan'208";a="53970563"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 27 Feb 2026 07:57:28 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Fri, 27 Feb 2026 07:57:16 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Fri, 27 Feb 2026 07:57:14 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Fri, 27 Feb 2026 15:56:45 +0100
Subject: [PATCH net-next v2 7/9] net: sparx5: move PTP IRQ handling out of
 sparx5_start()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260227-sparx5-init-deinit-v2-7-10ba54ccf005@microchip.com>
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
X-CRM114-CacheID: sfid-20260227_145741_039585_D48B3A16 
X-CRM114-Status: GOOD (  16.61  )
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

Move the PTP IRQ request into sparx5_ptp_init() so all PTP setup is
done in one place.

Also move the sparx5_ptp_init() call to right before
sparx5_register_netdevs() and add a cleanup_ptp label. Update remove()
to disable the PTP IRQ and reorder ptp_deinit accordingly.

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 34 +++++++---------------
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 18 ++++++++++++
 2 files changed, 29 insertions(+), 23 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index d37f34197e84..f359008d2205 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -761,18 +761,6 @@ static int sparx5_start(struct sparx5 *sparx5)
 		sparx5->xtr_irq = -ENXIO;
 	}
 
-	if (sparx5->ptp_irq >= 0 &&
-	    sparx5_has_feature(sparx5, SPX5_FEATURE_PTP)) {
-		err = devm_request_threaded_irq(sparx5->dev, sparx5->ptp_irq,
-						NULL, ops->ptp_irq_handler,
-						IRQF_ONESHOT, "sparx5-ptp",
-						sparx5);
-		if (err)
-			sparx5->ptp_irq = -ENXIO;
-
-		sparx5->ptp = 1;
-	}
-
 	return err;
 }
 
@@ -957,16 +945,10 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		goto cleanup_ports;
 	}
 
-	err = sparx5_ptp_init(sparx5);
-	if (err) {
-		dev_err(sparx5->dev, "PTP failed\n");
-		goto cleanup_ports;
-	}
-
 	err = sparx5_vcap_init(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to initialize VCAP\n");
-		goto cleanup_ptp;
+		goto cleanup_ports;
 	}
 
 	err = sparx5_mact_init(sparx5);
@@ -983,10 +965,16 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
+	err = sparx5_ptp_init(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Failed to initialize PTP\n");
+		goto cleanup_stats;
+	}
+
 	err = sparx5_register_netdevs(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to register net devices\n");
-		goto cleanup_stats;
+		goto cleanup_ptp;
 	}
 
 	err = sparx5_register_notifier_blocks(sparx5);
@@ -999,14 +987,14 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 cleanup_netdevs:
 	sparx5_unregister_netdevs(sparx5);
+cleanup_ptp:
+	sparx5_ptp_deinit(sparx5);
 cleanup_stats:
 	sparx5_stats_deinit(sparx5);
 cleanup_mact:
 	sparx5_mact_deinit(sparx5);
 cleanup_vcap:
 	sparx5_vcap_deinit(sparx5);
-cleanup_ptp:
-	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
 	sparx5_destroy_netdevs(sparx5);
 cleanup_config:
@@ -1032,10 +1020,10 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 	}
 	sparx5_unregister_notifier_blocks(sparx5);
 	sparx5_unregister_netdevs(sparx5);
+	sparx5_ptp_deinit(sparx5);
 	sparx5_stats_deinit(sparx5);
 	sparx5_mact_deinit(sparx5);
 	sparx5_vcap_deinit(sparx5);
-	sparx5_ptp_deinit(sparx5);
 	ops->fdma_deinit(sparx5);
 	sparx5_destroy_netdevs(sparx5);
 }
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 8b2e07821a95..a16ec8136d6d 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
@@ -606,9 +606,22 @@ static int sparx5_ptp_phc_init(struct sparx5 *sparx5,
 int sparx5_ptp_init(struct sparx5 *sparx5)
 {
 	u64 tod_adj = sparx5_ptp_get_nominal_value(sparx5);
+	const struct sparx5_ops *ops = sparx5->data->ops;
 	struct sparx5_port *port;
 	int err, i;
 
+	if (sparx5->ptp_irq >= 0 &&
+	    sparx5_has_feature(sparx5, SPX5_FEATURE_PTP)) {
+		err = devm_request_threaded_irq(sparx5->dev, sparx5->ptp_irq,
+						NULL, ops->ptp_irq_handler,
+						IRQF_ONESHOT, "sparx5-ptp",
+						sparx5);
+		if (err)
+			sparx5->ptp_irq = -ENXIO;
+
+		sparx5->ptp = 1;
+	}
+
 	if (!sparx5->ptp)
 		return 0;
 
@@ -660,6 +673,11 @@ void sparx5_ptp_deinit(struct sparx5 *sparx5)
 	struct sparx5_port *port;
 	int i;
 
+	if (sparx5->ptp_irq >= 0) {
+		disable_irq(sparx5->ptp_irq);
+		sparx5->ptp_irq = -ENXIO;
+	}
+
 	for (i = 0; i < sparx5->data->consts->n_ports; i++) {
 		port = sparx5->ports[i];
 		if (!port)

-- 
2.34.1


