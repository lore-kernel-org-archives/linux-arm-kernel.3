Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2867CA1002
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Sep 2025 02:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wxrn1xPJXjVzjC6eiOM9+qgIFPLs1DYtRf+UTTdmbuA=; b=ytdPvZ14fbOdG3+dPx0tP2nNX9
	cRbRM3g7bSHxXKFYsz7LGunbVPglGreIX3BG00D5COT4opwjYUjPrtaQ98gwEgobVjMdZzxHw/jc1
	2La4d+1VBHBxGrlxeRCCkLD+/CMl5qKilDedU6xyaabrqfSE7/UV5qPW/bpWe21qicG29W/7+NgLG
	AKPbD+K3TCZPx8eMH/5jvJ8jrvfbRsxlkJWEmZAi+DDSimNS3bjylc5fopcUgpdvCb5LUd92F7fFu
	1QYzIDFI7gfSyzYlJyjNaftZg26r2HbBzrazmjBgbuFqUD29EXdHZzVG7ztshmB9eVM6xgHqwxosj
	oV0Li8Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuM2l-0000000G1Cn-3Rqv;
	Fri, 05 Sep 2025 02:19:15 +0000
Received: from mout-p-101.mailbox.org ([80.241.56.151])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuGCd-0000000E8xU-10XA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Sep 2025 20:05:04 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4cHr714Cqdz9tNg;
	Thu,  4 Sep 2025 22:05:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016301;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxrn1xPJXjVzjC6eiOM9+qgIFPLs1DYtRf+UTTdmbuA=;
	b=scEoM5kEKoU33XYZBy4HohcKw6x2DVLWAJRGUa75UzrYSetwsUmMkcIkt3LQPrK+ZxBJlS
	iNkCu7T7SaAfvX3Lf2SvEj3BUaxMlZtJ93jqjcJbu2ylGG3Th8g/mb0GmtJhq6/H1wQnsX
	22Z9/Trkiufy29vMw4BdxEbFqfr9SbgHVF5CNxYPLuyfLvtpHzxDLiNt7eMp4sYTajNF9f
	r7AimCVNaJZr4mc2N0Udx5Ho8fr+1VKZL8+iFGWanQXM2ahvt/7KpAUgnQeb3r7qBPRB1w
	0ppMb5iJZMV2HFtSUPmK0Tk0yEZv5P+fnuBh2UCMDu0w/WtVrHzKGTtd9NW00A==
Authentication-Results: outgoing_mbo_mout;
	dkim=pass header.d=mailbox.org header.s=mail20150812 header.b=mZ3kdp8r;
	spf=pass (outgoing_mbo_mout: domain of marek.vasut+renesas@mailbox.org designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=marek.vasut+renesas@mailbox.org
From: Marek Vasut <marek.vasut+renesas@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1757016299;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wxrn1xPJXjVzjC6eiOM9+qgIFPLs1DYtRf+UTTdmbuA=;
	b=mZ3kdp8rOtZe2kNIT/MoDTxLy/nhzngoVbACCe7DXBKVsrNATERldm+Mrx/rex1bXd3aIL
	799fPEcjFEkZcEzGE8W40HLs5yc0k8AVa/3ML/CJRrmx0AGvCORltqQ9IqZjjup6L5dqEM
	AZzY1M1iO56cDG9Uo7k2vj7OnWw+eIXVzVpEI/TyMp1gm2IIva9c1sD38WWmoenfdebVGy
	znq5aAfF2cIvJvFyUfEETGpthZUmjOna9UP7A66dkxC0dMjNGsPbqTGfQCqn9HvYrbkQTU
	+Z1VP1O5WXDQDuirvqxBE/RJt7Edy39QOSCgfwsY6yUeZ5D4bgcBzVpIo7JT2g==
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Robert Foss <rfoss@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org
Subject: [PATCH 4/4] dt-bindings: display: bridge: renesas,dsi-csi2-tx: Allow panel@ subnode
Date: Thu,  4 Sep 2025 22:03:08 +0200
Message-ID: <20250904200431.168363-4-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
References: <20250904200431.168363-1-marek.vasut+renesas@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: fenskp44gq75nsuwf4tpwxqtz5nw9hky
X-MBO-RS-ID: 9f8996e81f69a55848b
X-Rspamd-Queue-Id: 4cHr714Cqdz9tNg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_130503_420330_00FD5DC6 
X-CRM114-Status: GOOD (  10.49  )
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

This controller can have both bridges and panels connected to it. In
order to describe panels properly in DT, pull in dsi-controller.yaml
and disallow only unevaluatedProperties, because the panel node is
optional. Include example binding with panel.

Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Rob Herring <robh@kernel.org>
Cc: Robert Foss <rfoss@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: linux-renesas-soc@vger.kernel.org
---
 .../display/bridge/renesas,dsi-csi2-tx.yaml   | 53 ++++++++++++++++++-
 1 file changed, 51 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
index c167795c63f64..f663bc6a6f831 100644
--- a/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
+++ b/Documentation/devicetree/bindings/display/bridge/renesas,dsi-csi2-tx.yaml
@@ -14,6 +14,9 @@ description: |
   R-Car Gen4 SoCs. The encoder can operate in either DSI or CSI-2 mode, with up
   to four data lanes.
 
+allOf:
+  - $ref: /schemas/display/dsi-controller.yaml#
+
 properties:
   compatible:
     enum:
@@ -80,14 +83,14 @@ required:
   - resets
   - ports
 
-additionalProperties: false
+unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/clock/r8a779a0-cpg-mssr.h>
     #include <dt-bindings/power/r8a779a0-sysc.h>
 
-    dsi0: dsi-encoder@fed80000 {
+    dsi0: dsi@fed80000 {
         compatible = "renesas,r8a779a0-dsi-csi2-tx";
         reg = <0xfed80000 0x10000>;
         power-domains = <&sysc R8A779A0_PD_ALWAYS_ON>;
@@ -117,4 +120,50 @@ examples:
             };
         };
     };
+
+  - |
+    #include <dt-bindings/clock/r8a779g0-cpg-mssr.h>
+    #include <dt-bindings/power/r8a779g0-sysc.h>
+
+    dsi1: dsi@fed80000 {
+        #address-cells = <1>;
+        #size-cells = <0>;
+        compatible = "renesas,r8a779g0-dsi-csi2-tx";
+        reg = <0xfed80000 0x10000>;
+        clocks = <&cpg CPG_MOD 415>,
+                 <&cpg CPG_CORE R8A779G0_CLK_DSIEXT>,
+                 <&cpg CPG_CORE R8A779G0_CLK_DSIREF>;
+        clock-names = "fck", "dsi", "pll";
+        power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
+        resets = <&cpg 415>;
+
+        ports {
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            port@0 {
+                reg = <0>;
+            };
+
+            port@1 {
+                reg = <1>;
+
+                dsi0port1_out: endpoint {
+                    remote-endpoint = <&panel_in>;
+                    data-lanes = <1 2>;
+                };
+            };
+        };
+
+        panel@0 {
+            reg = <0>;
+            compatible = "raspberrypi,dsi-7inch";
+
+            port {
+                panel_in: endpoint {
+                    remote-endpoint = <&dsi0port1_out>;
+                };
+            };
+        };
+    };
 ...
-- 
2.50.1


