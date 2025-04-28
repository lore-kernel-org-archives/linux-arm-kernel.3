Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A491C369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 14:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WKpFz0sFR5mCvXUjLxoDEJGO4+bSqpZN4lZyQeOmWkQ=; b=TQEx+vyEwIrHzTFEgTR5oemogh
	cZnXueegpOIa3NJ1NPjyBHLIf4/cdL6eDDhAa0UL+QdUZ7fRD4vnOWgqcBl5vSY+tTwzcMD3Um0bl
	WVSvM+2GAc4qa86DZIqnVDgFN2TJs8kkxk5GzjSeA0tMO12vApi7BQOIj7RcTCw6wC7vQThC5b74R
	dJJBNVMt1FrnIoc0zmSuObp9JUHSgSQJfzO6flzADRR3AfxTzNSST6GCS1B2YDmpCVMEjYp/HF/cl
	WfPfLNsQ08sYc07X5FzvRQoItXFVJUVM3gYiz9JnZ4g5Nzk+ngU59FeOkfibF77XQ51izFu4Q7Y7c
	rkeL918Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9P32-00000006ZVS-3Nvw;
	Mon, 28 Apr 2025 14:01:28 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9P14-00000006ZDp-04AL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 13:59:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1745848766; x=1777384766;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=WKpFz0sFR5mCvXUjLxoDEJGO4+bSqpZN4lZyQeOmWkQ=;
  b=hAWdxv54aF/AyNfu/5thP/kioGmIFK2YVnQzXq9JwpdCqGSriS02dKJ7
   aJ8k3zWrWbVmfhYH5TpD5Ut+w2KzMKtw3rgocCvFR/MptyaiMlBGRZvlL
   ZzpfX6YOjEKzmw7UTif9VncyPkMWUbCP/jI896Q4CXLNI7T0W+2kKQdcw
   dGvMTjpxRCAXod6vlEd5P4DnSiiBJSOTcCvimLZOt0UCNnLmN+GL+MdOZ
   X/f5xg09AQeawPiY3ZEs6zE6jkNn91/gEj/dMzQgxl18rbvXCVUWM5vhW
   njulTqBPail+oPbk/vqQYKHMnMH3gKiRsSewFi6h9RiJA72YJ3Ob5h5Vn
   A==;
X-CSE-ConnectionGUID: 9CeSALBcSamhBdAtN/0Uaw==
X-CSE-MsgGUID: 1lcsG385T/uI+2rHjKtZmg==
X-IronPort-AV: E=Sophos;i="6.15,246,1739833200"; 
   d="scan'208";a="43759129"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 28 Apr 2025 15:59:23 +0200
X-CheckPoint: {680F89BA-26-2417938-F0170C2B}
X-MAIL-CPID: ED23F6D0B04F11E4999A0A2C1B96DE42_2
X-Control-Analysis: str=0001.0A006396.680F89B9.007A,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5A111615E0;
	Mon, 28 Apr 2025 15:59:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1745848758;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=WKpFz0sFR5mCvXUjLxoDEJGO4+bSqpZN4lZyQeOmWkQ=;
	b=UJbPZw/EeB14ZfS1ldzTzTFLeJF7p0m/+I5DS+PogBIKzwX9ySrbfmPO+qon4qkcnVWAGX
	d5zGmfOae2tq9xt2KCQmHm5I9Qoxb7zIKkTe/ezD7vjz9V6Gjk+Qi3VDffo8eQuV3KLGHC
	bhw3Evp1LuwWkZKuEFRU/rHOubaZ8mOx3C/cYljCbrtURicoUXkYt/xc6oU0TtU+9kdaqm
	R/m2Glz1ARWF80VyorozyfBCTwm+o3cDpB4vq9priXL0Uhxl5eoZApV7oKH2+sCwOKJoJ0
	mhTQfy7fcBiEFha0afAjdTkBZZ7Si9Nrj9oB0hIS/eNHJKi6NIxF8vEjnf5Tdg==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux@ew.tq-group.com,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 1/2] dt: bindings: arm: add bindings for TQMa95xxSA
Date: Mon, 28 Apr 2025 15:59:08 +0200
Message-ID: <20250428135915.520432-1-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_065926_532762_F9DEC69D 
X-CRM114-Status: UNSURE (   7.59  )
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

TQMa95xxSA is a SOM using NXP i.MX95 CPU. MB-SMARC-2 is a carrier
reference design.

[1] https://www.tq-group.com/en/products/tq-embedded/arm-architecture/tqma95xxsa/

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
Changes in v2:
* None

 Documentation/devicetree/bindings/arm/fsl.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 447054b52ea39..a6cf65e10d43f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1419,6 +1419,16 @@ properties:
           - const: kontron,imx93-osm-s    # Kontron OSM-S i.MX93 SoM
           - const: fsl,imx93
 
+      - description:
+          TQMa95xxSA is a series of SOM featuring NXP i.MX95 SoC variants.
+          It has the SMARC form factor and is designed to be placed on
+          different carrier boards. MB-SMARC-2 is a carrier reference design.
+        items:
+          - enum:
+              - tq,imx95-tqma9596sa-mb-smarc-2 # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM on MB-SMARC-2
+          - const: tq,imx95-tqma9596sa         # TQ-Systems GmbH i.MX95 TQMa95xxSA SOM
+          - const: fsl,imx95
+
       - description:
           Freescale Vybrid Platform Device Tree Bindings
 
-- 
2.43.0


