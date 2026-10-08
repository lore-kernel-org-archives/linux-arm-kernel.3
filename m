Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A564CA600E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=; b=LTL4F5y71h0+Ag016pnWlHn7kg
	KxktIRj3PtigT/BxQ5LyutzLK8+9sOD8Vra5JUqS4tmNtEOpDwo4T1iEYWrDctFHthv2efwL+DrNU
	2u+OWWWI2/14cYf3NCRkSuIygY0lvW84/bFswRXkneagy4XAwSQxYEnmNjRBSI1lhYmtWc4YaDin+
	q40I17AgPwY3G2/jQWn9Zt0Ds7LzHStn3g7AhigE/wZgfb4X6ODom6wBuNN0jLNjrcZRG8fTW0vIq
	THLAZo4JM1m7GsZSB4LfPcYcEVwrOpBMevTo0BNzWFMPi1Fh6BNyF0+MChynZ1Zbk8n62oLnkoeDW
	gj9i+tYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyh-00000004wb6-21BM;
	Thu, 08 Oct 2026 19:40:31 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyb-00000004wVW-3AUs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:26 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-4a17baef589so25909435e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488424; x=1792093224; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=OdX3HK1Ob+3TLu54s1LOW7L67vdUbNhnbmEsKt/qTK2o30Jcnp5fi9D2+sbAvBU8WB
         cCAwJmAzsCk0XwcesnZ7Dc2srr1m6WhkcFlbVNxNxLqtAjJA69KJBfat4Q0UMeKeapmH
         Ej6rOiRIBvHIppYcT94P/wogVG/XQtW38jkkcjAt9G8+4mAWg8Tfym2+eE9+fk4on1uF
         CPMns+++/tblh6Y/ULgxeYY512yymw4s/xYHTkBh8aRocDeuxRCMHOdN6DBKyzLxWnC6
         2+1hNGtoUtBTMDbI8TvaxOZh9QbziclBfjYZ+wbMC9j8j+3R4m0Wc6swZqFagZN6Ftot
         IpfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488424; x=1792093224;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=3V/KESF44OWIlxoBBD4DKvOD0PQK3Y0aOYvdpaZuhdA=;
        b=U1ouXQ0Z0VeqleaOtNg4xCUuVrzHYv/bEpJzsdOFaiHI9jrElPl33wj6Ej7tvjs7gy
         Fw/05pdK/Uc9QvxQaNp4ZpgiU280N7tsEE/1hAZEK3xopwhBfMYcEJoNFTYxTMtFjoHY
         OkzEBZJqDVa6eAR4lfGp6DW96xrtMexvIgCZvQ0RbNAJIH1VpDdnZ3yFSG88kljzAHD6
         yo14tDoxWGgcmGoFxXfvfKOaPiPQV/3wMZvRwQLVAOI+zqUFmif8kgRiA5noWwHyAFaF
         p3l1qVpflOMTvwBPXhaq3eP/S1Tny51UurQuDufm6TqQeZAkRr2NGFh8AV1giHVz0uIP
         leBw==
X-Forwarded-Encrypted: i=1; AKwUvBwlIo5hZqPgSaqX5pZY6MVqIdHs9aTqgLvPGKPiznzDa+ij1MqTHtIJqXYqNyei5GIAJSgL0Kz+Z7YCemhdnAsV@lists.infradead.org
X-Gm-Message-State: AFuF++mwmgVamEk1ssExLZgsiVVjpFU0Q2yIuvpLOxzwWtLjKsTJdyVI
	FwlOEQYE247UHV4E2FyCtJYUTeMDJNr6srmyfsLLdV+82MdoihmTYEue
X-Gm-Gg: AYBFou1ry2WEMLD871LQ1AsOwUNEncsI9b4uQwcEUsSAyhANIhMJ88Qk02xyV/2iNzK
	rKZPyupFY9AHO1r+RtEJNhAmGrDfvt8OrwyVNNvNxlJPjGyFky6C7JAQjRG7Sjb/d6rl1Tq6a2F
	1l3uZ71BPNgJyktV3fup5dvzhPmfp/Zr3o5UNbga+DwpZdjGOxguwM1ujT5gpD6AFyqtdNS+TWt
	a5bh5/+0AJG4J3CsSiBquPseI4wEdr/hAykhF5xtwS999q3Pprnd1e0xAXeZjYJLBeUk9Rl6Nzp
	0XOPgBns+GGD0ErYGBs47lFYFB7I8TR0jZ0AGs7a5/CWCr3BgD3z/lvbIr1wsCN/i7FMbCw/fnu
	EJTcnnlsqjYZEqIgTjB66NzWuTqKSkXSKLlcqW7KOfvdi/jKISNk9NgLLtmE2ij1qO9dlsZy0tC
	FHDcdRmZFcLTIBzGd359RgaS5SAVYzsM25rhzS89flTV/FEiLlYzk4CjCBHBgWci0R2rzyQoKQu
	uFU+fx+kktaFn+XjSPfcqWKdITbG4R+01Y09lzG5lci1GMfjAdkv7mR+6mjHQ/Aj1ZePC1txtLP
	tTd5kn7UwUwkxEmmoTLM7Q==
X-Received: by 2002:a05:600c:8b51:b0:4a1:7d56:663b with SMTP id 5b1f17b1804b1-4a18066ca69mr110758385e9.24.1791488423759;
        Thu, 08 Oct 2026 12:40:23 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:22 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	Shawn Guo <shawnguo@kernel.org>,
	Joseph Guo <qijian.guo@nxp.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v5 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Thu,  8 Oct 2026 21:37:45 +0200
Message-ID: <759d62ee229f0cbb83a51cacbb70ed7dacf4ea3b.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124025_818484_97AA87DC 
X-CRM114-Status: GOOD (  11.41  )
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

From: Stefano Radaelli <stefano.r@variscite.com>

The binding describes micrel,rmii-reference-clock-select-25-mhz as a
boolean. dt-schema requires properties ending in -mhz to contain an
unsigned integer value. A bare property therefore produces a
property-units.yaml type warning.

Describe 25 MHz selection as <1> and keep the property restricted to
KSZ8021, KSZ8031, KSZ8081 and KSZ8091 PHYs, which have the RMII
reference clock select bit. The driver checks only for the property
presence, so this does not change runtime behavior.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Rob Herring's Acked-by; no binding changes.

 .../devicetree/bindings/net/micrel.yaml       | 27 ++++++++++++++-----
 1 file changed, 20 insertions(+), 7 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/micrel.yaml b/Documentation/devicetree/bindings/net/micrel.yaml
index 6fa568057b92..a1f876dc00de 100644
--- a/Documentation/devicetree/bindings/net/micrel.yaml
+++ b/Documentation/devicetree/bindings/net/micrel.yaml
@@ -63,6 +63,14 @@ properties:
     minimum: 0
     maximum: 3
 
+  micrel,rmii-reference-clock-select-25-mhz:
+    enum: [ 1 ]
+    description: |
+      RMII Reference Clock Select bit selects 25 MHz mode.
+
+      Setting the RMII Reference Clock Select bit enables 25 MHz rather
+      than 50 MHz clock mode.
+
 allOf:
   - $ref: ethernet-phy.yaml#
   - if:
@@ -90,6 +98,18 @@ allOf:
     then:
       properties:
         micrel,led-mode: false
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - ethernet-phy-id0022.1555
+                - ethernet-phy-id0022.1556
+                - ethernet-phy-id0022.1560
+    then:
+      properties:
+        micrel,rmii-reference-clock-select-25-mhz: false
   - if:
       properties:
         compatible:
@@ -105,13 +125,6 @@ allOf:
           description:
             The RMII reference input clock. Used to determine the XI input
             clock.
-        micrel,rmii-reference-clock-select-25-mhz:
-          type: boolean
-          description: |
-            RMII Reference Clock Select bit selects 25 MHz mode
-
-            Setting the RMII Reference Clock Select bit enables 25 MHz rather
-            than 50 MHz clock mode.
 
 dependentRequired:
   micrel,rmii-reference-clock-select-25-mhz: [ clock-names ]
-- 
2.47.3


