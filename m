Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C49DC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g5p5A34MpJIsUrfR0gYIJqddGWsXChyJFWZEMauN/Rk=; b=2YcuLctjwgELtco+tnVhhIJgNE
	Z8wa9aZ3MaArV7vUk8h3iXV9UDMdSwKTeEMW/Ng3QVQrj8ZzrR1uMwvYRDOWqGtSfWqgQs5IhKV1V
	CqGq/fRHW6W5UCN7r7WA9AN3599nZl8OG9wObgubMqx7H9cmSQskxc6EWjf6o51RFpJkeDmmgQ9F0
	qgIfNOcY0C7Mb4nVnslD6tInKygWVt03ssvRVLEh3jZwnC8Cl3PJAym9nr740vhbvkouRNZjmsg4k
	Ze0lQo2QjbjtdS7r+ThtRjHp6fgi0C/MR4MesSAbaxQION8fHn5tZs/1Hn9s2LMH6iAM/39y+5AOO
	1bgoGvHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVlz-00000005Z1H-2f4H;
	Tue, 04 Mar 2025 17:09:39 +0000
Received: from mx1.tq-group.com ([93.104.207.81])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUWl-00000005HyD-2xre
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 15:49:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1741103391; x=1772639391;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=g5p5A34MpJIsUrfR0gYIJqddGWsXChyJFWZEMauN/Rk=;
  b=HJKQLSqu2En3cwFmtlsU0txQatRE0Xe75nwoBqa/6VzhYWiK8UsenWUg
   EAInksN4MzO8usifNZYfwZsTeg+VchoosqGe3ytCBLymdyb11jwq7Gepw
   pTVpGSUbbWtAcT5HvHYrqqm+Pi50X4XT6qfvWdVTpLGMiTDQJNJ2azr81
   6XlXsnHhIH5D4L5dHtt07FXphmzoRTNSzHBD+IReQU8//lyU77g1fF392
   fZAVLnIp1xVL5olyNrpVnYz+NCYcMVG81iHTm0JbNj1HIIawwiRhWO0Kd
   LrtImECdcWxbXhMsDxyrzkn+/NevVV+chvdU4+JcXwD5sMH8RS2jw0jlY
   w==;
X-CSE-ConnectionGUID: wnINBS6UTbaKfLbsQjXPow==
X-CSE-MsgGUID: 9dDagD/4SpiBK2DXp8Z7ng==
X-IronPort-AV: E=Sophos;i="6.14,220,1736809200"; 
   d="scan'208";a="42272738"
Received: from vmailcow01.tq-net.de ([10.150.86.48])
  by mx1.tq-group.com with ESMTP; 04 Mar 2025 16:49:50 +0100
X-CheckPoint: {67C7211E-16-F35B2447-E1635CDE}
X-MAIL-CPID: B5735A1773F397C33992F6DE6F197D7A_1
X-Control-Analysis: str=0001.0A00639B.67C7211F.00DF,ss=1,re=0.000,recu=0.000,reip=0.000,cl=1,cld=1,fgs=0
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 34F65162421;
	Tue,  4 Mar 2025 16:49:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ew.tq-group.com;
	s=dkim; t=1741103386;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g5p5A34MpJIsUrfR0gYIJqddGWsXChyJFWZEMauN/Rk=;
	b=bykKnpNcB+Sz/5BhgJVYQ+68PMg16ny4pejBB7mHy51mMLSqGaM1o505R9xmhQVt/GRnx0
	d9iNCAGXWJEMn5fFI2481U8YpnlCtt/JwCQwlYmYK49095XfyeE32lz1qDVdMv8eIo8yj3
	VWRj9trsfXFz63jqMOtaLDV5v+PvcqxcmxxtuGm2Ayg7SRrDzVQAXThEi6AIDzmjlYIzbR
	uzmenlb+GQlST/G4W02/7HHeIGdP56ZqW2nR2MhRAzmzzfD6O4a6L3Jx5APeZfG/ffSL7n
	OnfbRwIKSXtyL9mpKgkqwyQOnSygTZtJbfyIO2ngMz7+aV9uk9bB7lQRTDfTaQ==
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
Subject: [PATCH v3 2/6] dt-bindings: soc: imx93-media-blk-ctrl: Add LDB subnode into schema and example
Date: Tue,  4 Mar 2025 16:49:21 +0100
Message-ID: <20250304154929.1785200-3-alexander.stein@ew.tq-group.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
References: <20250304154929.1785200-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_074952_040422_2DCC9B6F 
X-CRM114-Status: UNSURE (   9.87  )
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
index b3554e7f9e76d..cd785111928bf 100644
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
+      ranges = <0x0 0x4ac10000 0x10000>;
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


