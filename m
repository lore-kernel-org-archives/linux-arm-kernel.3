Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C15A7C9830E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Sep 2026 13:37:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=; b=IM5mh9CHROwsOhEz0nUR5gMY+J
	vjYyM0vK588e5NQ5oRhuk7Up2jmt5vTVaoVGc6IpTRcuOkWuoq9NWQ/C/E+XE+z23sEBe37Slg/IR
	DYSIj3GHjoM2qqXFUWV5bJcHnU1zy5QbM4kZ+M/o1S3rIIWqMo/iK8AucZMakg01lv4PLcfE4Rc1t
	7j1xDkbeh2nSxbXE0zHjPZ8JZgGGLM2isLxyYYI/mpbh/m1Er44+4BZSfg3WLLFQzVEYGFyEn6p46
	IGSP6EVSfdSr+bjTV0BaUSvR9LRWIB5ZmWDBEs4drOCbls4XTMpxugEE2WkZxDoRsJk8pGqqIe2Yf
	l74ovjJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAoHF-0000000GKh2-4As7;
	Sun, 27 Sep 2026 12:46:46 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAoH9-0000000GKdo-0JMZ
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Sep 2026 12:46:40 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49d1fb0cf5eso20331655e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 27 Sep 2026 05:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790513197; x=1791117997; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=T5yKH/tIA9Ih112J7WoPDsn/wArCENqRJ063MzeE9/uGtstdpFDetMxcAdvLBHzLgW
         QWqzKHhG9lplWzJm0cGjZG9P7WvaAb4VdVeofHjFvRaL3eRFwolyPEGRd3vKtK4osFe/
         5PuB3+e0jwfh/HY1oCaGzHiU4KgNCpqMoUsNkV81I4X0yaIgmNkedc2VshL99w4sqqja
         5lmJ2eAwI3M90B+vpRxKmY5nv3txDRXsOyrqJr658Aydmr3Fz013WViMLNeFBXQfASz8
         uJvULN2Spr3V8ZOGo+nIwQXZzT6GmWZT0MQJLlIzGJGd3rjGzqHFbjvhkqf1Zg9wmWBV
         n5aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790513197; x=1791117997;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=Bf0kXSwhrNRumY4WyN3Ko7asbnNM535mLBI5kc/iQiQyFOpr0si6dJ8FIATeqw6gtj
         8BQgobQyNY5n0iJI83qfXq3BzHtitJjUGZSPAiGr5x1kLdHQhTDKV3KN6BL8bvp92RLT
         wMHB9Z2bAjC0PptFKoEB6296ai1zVqFT5FW5x2NdHAOM69GOERbxl31mnxdZJ4HXiCqs
         KEQMEj/vnVNwSSpckrIqhvt5zNm7oxC3fes1BkDd2AGz1cfqz9QaFZVfAe9nNFD9MC89
         +bETadt49MADdfRDsiJvsUzKusf0qufTCNdDBrBnaFJgu/Jueyo4SF/Pd9RPisvH688M
         pVWg==
X-Forwarded-Encrypted: i=1; AKwUvBzVRfSAaVZxlu0vDTdBxEcXEw/CL6G8qIifdiZvUXy9m7s2DXbnBIf12FimjAMKvytXs6Mkfl6Oxcbgphlk0muL@lists.infradead.org
X-Gm-Message-State: AFuF++lAKBMTu40qQfCrgsiSU4CBVsrounYX4x6ue0UGCotoCeTczp+h
	RV6eazEUtUjJ5Q/HdF7Uru9LLYCcLX84Ub3EkqOGeoMbd2y742hQTwpA
X-Gm-Gg: AYBFou02hMRd8VCqwIN/dIyyPnXSGEG4KrMXcR291gxwl0sRLFy1XbIK3B70i6uHUlc
	JdnlLjihncRcXF6VCp1Flfe+XUHX7YMNiLN2IfQHKMsOXgQzFBgfbIJg5tkA4FGROaEZCQqhhdi
	pypTqM4eH3pLyiq1ODl3gOgBafAUuFS5r68OjYpwh4yAD0FoD3joYvtVO6VHMeDbAKIggZkfzE/
	CQdJUVmW/VWnKWTFbIaC+UrIHS8AGuWnXFWZwfZh/FeSxLP6n6b6cOx7WRQ8OKGqdb98I+VhceC
	iMcMBvumPx+N5LAsGmoPxxe+B+OqxRhMHmOEAlJ681cPiwRuT52pjokO4EtR/UM+mYYdzPbOjK8
	JHEiK89AXoFGz/c8p6zmUBFXb95BhxwVD49QNV1fYUMrU7WcJrvtwgsqKgYAlg392KdyLyv41l+
	WfhDvVGjK13ifRk5MKpYohIaZ/ctk7gWDSjzkN9roCjNbDIlhSZIqDtNhgGUMKFJ2ZZ1Va6qXG1
	uCkiZNVngcxijfYJ9e1B1Y8kE+d6cUD/ZMtFQ0DYWpA6264bbf8mXD12W9cltAxmqbAdIvqct4K
	aU/4I8ddJWzT934CMgLhjw==
X-Received: by 2002:a05:600c:4ecc:b0:4a0:174:579e with SMTP id 5b1f17b1804b1-4a001745829mr23006575e9.28.1790513197048;
        Sun, 27 Sep 2026 05:46:37 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fef60da94sm148440605e9.4.2026.09.27.05.46.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Sep 2026 05:46:36 -0700 (PDT)
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
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v3 03/12] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sun, 27 Sep 2026 14:46:18 +0200
Message-ID: <2596c9e2fd59d04abb2eb4f4abb98767d2d2ebdb.1790512621.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790512621.git.stefano.r@variscite.com>
References: <cover.1790512621.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260927_054639_157013_3602F07F 
X-CRM114-Status: GOOD (  11.96  )
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

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
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

