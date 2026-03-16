Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9782EEFCBD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Mar 2026 07:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iMmUMDZrYnEz/CbNgCyWMh1qW53DcWwSxTsAKK1B7Rc=; b=kgw9JOefmOJf7idtM6n6zYAz1V
	mPpCUBWzbUq3eXexT6Qko+WT6aaEKV3MN0UG4WAn0H+3D9VG54tJy3nKjbrJmOneiU1aDVhv35bFm
	mYtUSe2kH2UL+eVLHx6bdi/eAQqtavXugRJpyM73zZ0yULmwLcXN5F07Qbmj5jZdVPOe//y+EVB+0
	oPhN+3T+HfgCYCZubdYoRP2qYvqbNexkpceq2/4KgNb6g1bQCucpdRyt0vBwuFrCSjrVt4T8k9qXP
	DrxO5F5TifTFqmyHGELkRbBgMeZh9Nx4LpEW1OqgkhkGONiVqTSNDr6AznDEXQkWSvZeiRSSCwWn8
	IK4NNmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221Q-00000003Rna-0JPY;
	Mon, 16 Mar 2026 07:05:52 +0000
Received: from mta-64-228.siemens.flowmailer.net ([185.136.64.228])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w221L-00000003RmA-25BJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Mar 2026 07:05:49 +0000
Received: by mta-64-228.siemens.flowmailer.net with ESMTPSA id 202603160705416323f8e7c200020713
        for <linux-arm-kernel@lists.infradead.org>;
        Mon, 16 Mar 2026 08:05:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=alexander.sverdlin@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=iMmUMDZrYnEz/CbNgCyWMh1qW53DcWwSxTsAKK1B7Rc=;
 b=ZZ6lPJqcW02dDWMMEConDNy30m9XX+2yRbXm/FA6paPKFtJuLlcUE2yknRPk50UXSgWbzt
 PSsEFLpLv4Ke8YS1zlKloV1KhGtlGrr8q9ruOrw9vbeTR5JhiRtNE5I/+MPQTgiO+HBiKlkf
 1U6N8ohxdSLCp51tWs5WHoFdtqL2mCsKuFt/0n82kfP4f8vs6pReiMnsnc5w4HYQ95Og2Sj4
 vqB9gKmq9SYOlEqsiBgu86D/rPO2PvTkYaDmLqzFlkSDHfH6KBxibyBaXhXNsVmWPphxkHrL
 iw8LilA8j0Y575oyve0V9/7RNOeLTjS/m4KoavWolrwLnE3ZUwPvzbTg==;
From: "A. Sverdlin" <alexander.sverdlin@siemens.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Alexander Sverdlin <alexander.sverdlin@siemens.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Andrew Davis <afd@ti.com>,
	Jayesh Choudhary <j-choudhary@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Abraham I <kishon@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/3] dt-bindings: mfd: syscon: add binding for TI K3 platforms reset registers
Date: Mon, 16 Mar 2026 08:04:23 +0100
Message-ID: <20260316070429.1545707-2-alexander.sverdlin@siemens.com>
In-Reply-To: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
References: <20260316070429.1545707-1-alexander.sverdlin@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-456497:519-21489:flowmailer
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_000548_231852_5A4AF9D3 
X-CRM114-Status: UNSURE (   8.72  )
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
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Alexander Sverdlin <alexander.sverdlin@siemens.com>

Add DT binding for Texas Instruments K3 Multicore SoC platforms reset
registers present on AM64x and newer members of the K3 family and consist
of the RST_CTRL, RST_STAT, RST_SRC and RST_MAGIC_WORD.

The planned usage is to provide reset reason information.

Signed-off-by: Alexander Sverdlin <alexander.sverdlin@siemens.com>
---
Changelog:
v2: amended mfd/syscon.yaml instead of separate reset/ti,am64-rst.yaml

 Documentation/devicetree/bindings/mfd/syscon.yaml     |  1 +
 .../bindings/soc/ti/ti,j721e-system-controller.yaml   | 11 +++++++++++
 2 files changed, 12 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd30..564fcb153a688 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -240,6 +240,7 @@ properties:
               - ti,am62-usb-phy-ctrl
               - ti,am625-dss-oldi-io-ctrl
               - ti,am62p-cpsw-mac-efuse
+              - ti,am64-rst
               - ti,am654-dss-oldi-io-ctrl
               - ti,j784s4-acspcie-proxy-ctrl
               - ti,j784s4-pcie-ctrl
diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
index f3bd0be3b279f..b8063548f50ad 100644
--- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
+++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
@@ -86,6 +86,12 @@ patternProperties:
     description:
       This is the DSS OLDI CTRL region.
 
+  "^rst@[0-9a-f]+$":
+    type: object
+    $ref: /schemas/mfd/syscon.yaml#
+    description:
+      The node corresponding to SoC reset registers block.
+
 required:
   - compatible
   - reg
@@ -133,5 +139,10 @@ examples:
             compatible = "ti,j784s4-pcie-ctrl", "syscon";
             reg = <0x4070 0x4>;
         };
+
+        rst@18170 {
+            compatible = "ti,am64-rst";
+            reg = <0x18170 0x10>;
+        };
     };
 ...
-- 
2.52.0


