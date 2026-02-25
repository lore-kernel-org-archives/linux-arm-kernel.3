Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A306EFD210
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 09:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KHMfpRm0hmAuhCuVFg1NBza9LkR1ArrjD+gOK+V1ZTE=; b=RV0BL/X1tarpFu0WTCfq94QQJP
	i8v1nCQPSNs85yqNgVlys150Kru/MLoFWrSS+VFYqRgvOLqD0B+NxJAF3k4VWLyqQr6lIFonqWOcj
	dikiUf/0BZgmApabwspQp2MzvRGfUDUAVU5Uh90wVpOPrk8WI2RREm/NUjOum90In81E4+EJVnqEP
	bRWhyvMMzlJpZfwBeNqTslXR0cAElTtQpXJpmXrP6f3EFjqAImfBbnjCVCcjuIz/rVryeMmIOwCQn
	rshvaZsQhGwIQ9/DaW9rm+oUxRBxbKML+1iL+JBAF3mCvqANfLikxzpyN4FEAaJE4ussLbOsI3LrI
	A16c5S6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvArT-00000003dMC-1fxh;
	Wed, 25 Feb 2026 09:07:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvArR-00000003dKT-1cba
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 25 Feb 2026 09:07:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=KHMfpRm0hmAuhCuVFg1NBza9LkR1ArrjD+gOK+V1ZTE=; b=QxcmnCRARC4HlgWBLraRwJvJmy
	yigBN12CelL6QdUTlw+RJnD2TFLnhkReXVQyX8OYoSgxTGYBhK0DrWqSsCaXvOnYQXTsCEuAoFjIx
	j33NS61BXVpTKnEa4ol36sS7izDWgWi1foXDajrSRu+bk925IOK+VSB319JUJ1TGf+x6jHcIe1QRP
	YGD00rOZkBF+eQwKQKqyf5m6BNdKMfvnq4gaSFmC9SSdF+zf5IpJUVxYC7sWgTc+s53LKyEEXPbPD
	6N1i4wc8MKki6JpWBpey6e1u4OWLBf2GoRcM0+qx3xuW7AFTjOF1u3NjY3H7Cg6XHP1zElzFLsoo/
	8p1s3bTg==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvArO-00000008dQA-0R5f
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 09:07:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1772010430; x=1803546430;
  h=from:date:subject:mime-version:content-transfer-encoding:
   message-id:references:in-reply-to:to:cc;
  bh=wE0FxXJQW3yVDJE1a/1GJUQdpG7aGn8J4V+MDvPXIbQ=;
  b=VLA7ECc5YSEOq9hkwfmNlPpDYjcOTckeUiwtz1/flsH3S7B1MXQfY0yq
   6wz6VjTnhaEof4jMzjfDyq/Q6HK8IH39H7qsvm0xNvGQZdAtYBufPxRwV
   6wXNXi6nly9sclOaajo4FMqTAgVnWcNOg9SzQ9NObeEJFXeqEF0jsBRUZ
   sGStGfaRXSElzKEgDV3DCxqtHJiT9nNvELnUePlZfQt7IqG7/ujldxgQP
   fJ9TQnY5oo2ajXiBdtXz/Y/6+lH+D9Vi4mErMvclPSPx8rr1g7WnXMZXP
   +yyGv4MEaCaKAJHaHpyKoo5v4MoqDN5zKSonQK7YQfB54gJfJF05mDC/s
   Q==;
X-CSE-ConnectionGUID: 1d+y6PO9SFGcdWGyfjWqeQ==
X-CSE-MsgGUID: 70P3UHu5T9G15aTdFF8Lfw==
X-IronPort-AV: E=Sophos;i="6.21,310,1763449200"; 
   d="scan'208";a="54259094"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Feb 2026 02:07:08 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Wed, 25 Feb 2026 02:06:09 -0700
Received: from DEN-DL-M70577.microsemi.net (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Wed, 25 Feb 2026 02:06:07 -0700
From: Daniel Machon <daniel.machon@microchip.com>
Date: Wed, 25 Feb 2026 10:05:24 +0100
Subject: [PATCH net-next 1/7] net: sparx5: call sparx5_start() last in
 probe()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20260225-sparx5-init-deinit-v1-1-97036580b9f0@microchip.com>
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
X-CRM114-CacheID: sfid-20260225_090710_686655_86BD894C 
X-CRM114-Status: GOOD (  15.61  )
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

The sparx5_start() function initializes hardware and enables interrupts,
so it should be the last function called in probe(). Over time, new init
functions have been added after it, breaking this assumption.

Move sparx5_start() back to being last. To avoid breaking PTP between
patches in this series, also consolidate all PTP initialization into
sparx5_ptp_init() and add proper teardown via sparx5_ptp_deinit().

Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
---
 .../net/ethernet/microchip/sparx5/sparx5_main.c    | 35 ++++++++++------------
 drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c | 13 ++++++++
 2 files changed, 29 insertions(+), 19 deletions(-)

diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
index 582145713cfd..d7e823fe4ab9 100644
--- a/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
+++ b/drivers/net/ethernet/microchip/sparx5/sparx5_main.c
@@ -820,18 +820,6 @@ static int sparx5_start(struct sparx5 *sparx5)
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
 
@@ -1000,12 +988,6 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 		}
 	}
 
-	err = sparx5_start(sparx5);
-	if (err) {
-		dev_err(sparx5->dev, "Start failed\n");
-		goto cleanup_ports;
-	}
-
 	err = sparx5_qos_init(sparx5);
 	if (err) {
 		dev_err(sparx5->dev, "Failed to initialize QoS\n");
@@ -1014,14 +996,25 @@ static int mchp_sparx5_probe(struct platform_device *pdev)
 
 	err = sparx5_ptp_init(sparx5);
 	if (err) {
-		dev_err(sparx5->dev, "PTP failed\n");
+		dev_err(sparx5->dev, "Failed to initialize PTP\n");
 		goto cleanup_ports;
 	}
 
 	INIT_LIST_HEAD(&sparx5->mall_entries);
 
+	/* Start the rest of the initialization and enable interrupts. Must be
+	 * called last, after all subsystems are initialized.
+	 */
+	err = sparx5_start(sparx5);
+	if (err) {
+		dev_err(sparx5->dev, "Start failed\n");
+		goto cleanup_ptp;
+	}
+
 	goto cleanup_config;
 
+cleanup_ptp:
+	sparx5_ptp_deinit(sparx5);
 cleanup_ports:
 	sparx5_cleanup_ports(sparx5);
 	if (sparx5->mact_queue)
@@ -1047,6 +1040,10 @@ static void mchp_sparx5_remove(struct platform_device *pdev)
 		disable_irq(sparx5->fdma_irq);
 		sparx5->fdma_irq = -ENXIO;
 	}
+	if (sparx5->ptp_irq) {
+		disable_irq(sparx5->ptp_irq);
+		sparx5->ptp_irq = -ENXIO;
+	}
 	sparx5_ptp_deinit(sparx5);
 	ops->fdma_deinit(sparx5);
 	sparx5_cleanup_ports(sparx5);
diff --git a/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c b/drivers/net/ethernet/microchip/sparx5/sparx5_ptp.c
index 8b2e07821a95..84327ee5b8a2 100644
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
 

-- 
2.34.1


