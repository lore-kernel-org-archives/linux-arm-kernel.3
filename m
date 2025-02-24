Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB05BC021BB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 14:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sWKqOX5BSiiuBOfVvs+gR33D/sqaIKO5jTjWIObEE8A=; b=ymoCg08QpxUaLMMsJQPVzJsVwC
	J58nXVSBrTNeieZEr+gxRyBN78WmFFB1pJyDkAlTrG4Wd+wUrg5EFnwvGsQktqzWsFK+IUdW8Htyj
	YrCEYLUo3iFtlOyYjt1m2OGZsZbTJWH+79dXIabB8Uma7maKciVDYELLfEwS8uVIPrwoDbY4YLeRk
	2U1naSbkShheegH1zrpzqX0qLrEN0rfclKXsMB99K9TkZZAH+YPPFOJFdgXEPy0HSHjDDOaQRtJsF
	23h+bH2Oa6WBpHBoEmZmU+2FfnC6Vwu113O6Q6Vv33sC9iqqTFlHrjsAs4h1S1aSkd/2Gl51lkutT
	sauubPqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZq7-0000000EBEx-3iy7;
	Mon, 24 Feb 2025 14:53:47 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmZS1-0000000E64v-2NrC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Feb 2025 14:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1740407333; x=1771943333;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sWKqOX5BSiiuBOfVvs+gR33D/sqaIKO5jTjWIObEE8A=;
  b=iWE7UCGA0o/OvWKSUWkwLXKWkcSsGYAYh/mECFrfN0uDWNawzPsXmHdv
   lzqS+e3I+isqMnXs/kcWxg8KXh3hdEOo8Gewqo/aP/NfkblDqvdY1QtcP
   XEvjFjHkkH6oUHMEtz3MszZuMHbmneuFk8xBR8tU7VGqxDSZiKkm5h7Oh
   XXsYmKCY/KI3knf9KO8C+jz1YOQLi3FSwmZ187KL/mQ4JEv77j8Kyv9G8
   Evm2tQE2BoUfj3So/2lRHNnbXOXfXjaPtyHGnXgCca3Xk24io9PIsikrm
   /jkDByr7nvxzZo9iBIFeJ02yfPHfBWY2OU5CgxDpARv3k/ye2deyN4bg7
   w==;
X-CSE-ConnectionGUID: nlRWI6nFT6yE2yzHATWdoA==
X-CSE-MsgGUID: lPDIY21vTlyNPODEk8h+bA==
X-IronPort-AV: E=Sophos;i="6.13,309,1732575600"; 
   d="scan'208";a="42042107"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 24 Feb 2025 15:28:52 +0100
X-CheckPoint: {67BC8224-28-6E0A4539-DBC44C3A}
X-MAIL-CPID: C472B7EE68207FE8A685CB9E4A0C8BC4_1
X-Control-Analysis: str=0001.0A002103.67BC8223.008B,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 35F021679A1;
	Mon, 24 Feb 2025 15:28:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1740407328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sWKqOX5BSiiuBOfVvs+gR33D/sqaIKO5jTjWIObEE8A=;
	b=JOHuXYZ5msjXIsVC2G/ioyQOMnlvTAobJnlbb00ytJhaFlW4p79i/tfXezswfLiSEpnucL
	wiPx5EmNMbTMrDspxE4J7CD6Ftu14fzUyhmxc1AeFzYzDix8wUYaDbr2i+nugXZrH1BIiI
	NzYty9WJQMz2zicYz65xzrbi7/m0AVgrGvrPqmRWDIqCv9FBzRy6+CDEcYoPWq+3pM3ddV
	PBjpL/Dp5zErebxHVKBQkRrKpEVVH/v3O4hCJ9GAHo+CKs4TGQcBWS6ZDetCBb2Yp5+5NJ
	ni5NSPcuq0I9ovwZrl46uYrS+BLjaU7DbLkAa2U1K7lheII1Y56DKV5DT8kkDw==
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux@ew.tq-group.com,
	linux-clk@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 2/6] dt-bindings: soc: imx93-media-blk-ctrl: Add LDB subnode into schema and example
Date: Mon, 24 Feb 2025 15:28:23 +0100
Message-ID: <20250224142831.485159-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
References: <20250224142831.485159-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_062853_898689_06F43D33 
X-CRM114-Status: UNSURE (   9.50  )
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

Document the LDB bridge subnode and add the subnode into the example.
For the subnode to work, the block control must scan its subnodes and
bind drivers to them, do not misuse either simple-bus or simple-mfd
here.

Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
---
 .../soc/imx/fsl,imx93-media-blk-ctrl.yaml     | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
index b3554e7f9e76d..d914dea6ecbb5 100644
--- a/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
+++ b/Documentation/devicetree/bindings/soc/imx/fsl,imx93-media-blk-ctrl.yaml
@@ -24,6 +24,14 @@ properties:
   reg:
     maxItems: 1
 
+  ranges: true
+
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 1
+
   '#power-domain-cells':
     const: 1
 
@@ -46,9 +54,20 @@ properties:
       - const: csi
       - const: dsi
 
+  bridge@20:
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: fsl,imx93-ldb
+
 required:
   - compatible
   - reg
+  - ranges
+  - '#address-cells'
+  - '#size-cells'
   - power-domains
   - clocks
   - clock-names
@@ -77,4 +96,36 @@ examples:
                clock-names = "apb", "axi", "nic", "disp", "cam",
                              "pxp", "lcdif", "isi", "csi", "dsi";
       #power-domain-cells = <1>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+      ranges;
+
+      bridge@20 {
+          compatible = "fsl,imx93-ldb";
+          reg = <0x20 0x4>, <0x24 0x4>;
+          reg-names = "ldb", "lvds";
+          clocks = <&clk IMX93_CLK_LVDS_GATE>;
+          clock-names = "ldb";
+
+          ports {
+              #address-cells = <1>;
+              #size-cells = <0>;
+
+              port@0 {
+                  reg = <0>;
+
+                  ldb_from_lcdif2: endpoint {
+                      remote-endpoint = <&lcdif2_to_ldb>;
+                  };
+              };
+
+              port@1 {
+                  reg = <1>;
+
+                  ldb_lvds: endpoint {
+                      remote-endpoint = <&ldb_to_panel>;
+                  };
+              };
+          };
+        };
     };
-- 
2.43.0


