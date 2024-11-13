Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7B27D41C33
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 Nov 2024 11:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d0Qg6SopdbWfAUe/2/gabBwX3iGckX9jWfCECo4NOGQ=; b=JCfkqbQ6TYwjXYRGy4o+ACztVW
	LOH8+WeTcpyxsZaBAtb4YWi3RnKyZGhx7CDHkS8f8NnT1s2dLdFxrwy/QRfW4Dbi/Ktk9/uyqpc3+
	qn3K3wf77yZzxdmrQ3hHxeKOWf4ErVfbUz4zIgoG7hAljz7NdUvuVd7XGVL5oF7zsjLRQct/io8nU
	1zXokNF5AgIy3OvxVg50Wu623serWpZRiksgUBYjcgSOaGLQXSW8bgtvQ3m31B01+PSgIjpm6FJfw
	/iqrcWfHkbmLwDQ2TvMcO62G+eBJpq8bY7eiCu6/u5Ru3zFtX+FbeZkBaDuSesT5okMXtPbnOjcWM
	KnsV/k7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBI0-00000006YAJ-0ifx;
	Wed, 13 Nov 2024 11:12:00 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBGC-00000006Xxt-1wZN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 Nov 2024 11:10:10 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4ADBA1x62828090
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 13 Nov 2024 05:10:01 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1731496201;
	bh=d0Qg6SopdbWfAUe/2/gabBwX3iGckX9jWfCECo4NOGQ=;
	h=From:To:CC:Subject:Date:In-Reply-To:References;
	b=jS5UytQ2SJ4Qmx4cY5gzqqznH9hp1GN9h5T9B6EDamIHmNMe3Z9QCskN7jP1oZsFv
	 aMMiqROJTXYrRymkTAK0m6whJig0nU4yFm+oyboXxMCAnEUuvuv/KZ0e6DWtt91gSe
	 LJ5TGo8XdDHwWiMopr4IhTv4z1N+JbyO8lDz5yoI=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4ADBA1sC070529
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 13 Nov 2024 05:10:01 -0600
Received: from DLEE112.ent.ti.com (157.170.170.23) by DLEE114.ent.ti.com
 (157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 13
 Nov 2024 05:10:01 -0600
Received: from fllvsmtp8.itg.ti.com (10.64.41.158) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 13 Nov 2024 05:10:01 -0600
Received: from fllv0122.itg.ti.com (fllv0122.itg.ti.com [10.247.120.72])
	by fllvsmtp8.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4ADBA1e8124239;
	Wed, 13 Nov 2024 05:10:01 -0600
Received: from localhost (danish-tpc.dhcp.ti.com [10.24.69.25])
	by fllv0122.itg.ti.com (8.14.7/8.14.7) with ESMTP id 4ADBA0gG021259;
	Wed, 13 Nov 2024 05:10:00 -0600
From: MD Danish Anwar <danishanwar@ti.com>
To: <conor+dt@kernel.org>, <krzk+dt@kernel.org>, <robh@kernel.org>,
        <ssantosh@kernel.org>, <nm@ti.com>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: [PATCH v3 1/2] dt-bindings: soc: ti: pruss: Add clocks for ICSSG
Date: Wed, 13 Nov 2024 16:39:54 +0530
Message-ID: <20241113110955.3876045-2-danishanwar@ti.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241113110955.3876045-1-danishanwar@ti.com>
References: <20241113110955.3876045-1-danishanwar@ti.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_031008_624800_03A989B9 
X-CRM114-Status: UNSURE (   9.73  )
X-CRM114-Notice: Please train this message.
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
Cc: srk@ti.com, devicetree@vger.kernel.org, kristo@kernel.org, linux-kernel@vger.kernel.org, danishanwar@ti.com, Roger Quadros <rogerq@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

The ICSSG module has 7 clocks for each instance.

These clocks are ICSSG0_CORE_CLK, ICSSG0_IEP_CLK, ICSSG0_ICLK,
ICSSG0_UART_CLK, RGMII_MHZ_250_CLK, RGMII_MHZ_50_CLK and RGMII_MHZ_5_CLK
These clocks are described in AM64x TRM Section 6.4.3 Table 6-398.

Add these clocks to the dt binding of ICSSG.

Link: https://www.ti.com/lit/pdf/spruim2 (AM64x TRM)
Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
---
 Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
index 3cb1471cc6b6..927b3200e29e 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,pruss.yaml
@@ -92,6 +92,16 @@ properties:
     description: |
       This property is as per sci-pm-domain.txt.
 
+  clocks:
+    items:
+      - description: ICSSG_CORE Clock
+      - description: ICSSG_IEP Clock
+      - description: ICSSG_RGMII_MHZ_250 Clock
+      - description: ICSSG_RGMII_MHZ_50 Clock
+      - description: ICSSG_RGMII_MHZ_5 Clock
+      - description: ICSSG_UART Clock
+      - description: ICSSG_ICLK Clock
+
 patternProperties:
 
   memories@[a-f0-9]+$:
-- 
2.34.1


