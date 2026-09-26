Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 957D5C98318
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Sep 2026 11:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=; b=Yr9H9XkaFg6H6Bd9XuUHHp6GaE
	xaEmWlU33u+Pwi7eojiyOhDyDSXoIJhpqYMVi4r6zhEE1e5O+x/GdtQn8UOF1aMrlc32AfLipsl0b
	Dauw9l05iVV0j3VutX5M31CGZu3cA25mYYJ5S/nSWMA9fYPPSbqbBgDKvXHZqaMlFpzSDJQASmiKQ
	SuPL3yPweyRe2GuRgxJ3pU0La2hxkVwOyoH+qobbra3kvaUid8CDIA/k//n/XuGrCa0rUgqJG3RAB
	OZ5jRVG0vZAPz1GwSgqv+nMm2Qeb1eoFEPY4T6tNKCuOaRGDuKmcu0Ii79lhgzw+harSttVLom0Cj
	hkUgHJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQEG-0000000FI5T-44Oo;
	Sat, 26 Sep 2026 11:06:04 +0000
Received: from mail-wm2-x10.google.com ([2a00:1450:4864:31::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAQE7-0000000FI25-4327
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Sep 2026 11:05:57 +0000
Received: by mail-wm2-x10.google.com with SMTP id 5b1f17b1804b1-49b912d3931so13139375e9.3
        for <linux-arm-kernel@lists.infradead.org>; Sat, 26 Sep 2026 04:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790420754; x=1791025554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=;
        b=jXZ0i8zT8OScA0L13BnDe6yEP9nCGQUic+4kQYgP7H1v4SrsedCApvoDsjU4SeUT9r
         wUst9iZ/tibDNwvEovP6Z6lgQ8LMKLEUa9KgwPmBJ1dUMTyBxpck1vpsme9hjD87vxFN
         UOxhItCABxQpsFQAaRn6gzQ79Pi+WBtRLtsxDI6mMGcbW23DK4irp2V1HsgyqkTFsZLN
         hcz0niPDsX+5TyFGK7BTVl+GNZGQs0/FFn3SFx4guWsAmbM4UYatIvpGjEgfC0BWToau
         P5DyTkooQe0RAqoQxuM7NQeOWtoZB69aLSrCURfMC9lM0IiwcQbAWYNj836HCmhgJElS
         ufhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790420754; x=1791025554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OuCfL206+SFfyH6z1qMo483rq8R+i1flYwR2z4BngNg=;
        b=xGilZWeeHxREhAVF30IwPVSBaP64un+GSSjB3YS+7eUYWtB13c7jEdN4e/FnXgNOpz
         J4LkgUMSX4FtWOm6byH8IhiChyQekTkZi+YgxB1jwG8e1AjHGKb8mx06tQHEpdCg6N+I
         sJC8Gw1WyWQLaQnpJ+5WY2nHykjWmmI/E73lNN+y7fO0e4TbvazfgyCMOa3jEsuonzJY
         6MRodnmZBT2B8jM3BE4SOYmc3lu06GEmaySeFMiMuC4OQ9JiELxg2VtxTz9nFls+RTYt
         GSwgLmZuxxWmSbknMxOmCuNC7wGv/iwyw8hwYqntbnxFNjEDjsvMdk+qAihpsV/gZP+E
         +l0g==
X-Forwarded-Encrypted: i=1; AKwUvBxN13G5efJ7a0Bx1trZDFGDc5xQqyRTw5Y81iJj1GVzimBXsYg3VfvjZbx8vWeRoIx//oi9FLE2bmLhTQpYUbUH@lists.infradead.org
X-Gm-Message-State: AFuF++ntfHxs3pziT/Fx0Qroa573fNcnxY7F0wvlXb6fyyVQcTTSWkpa
	EceBqIKyV8BQNOTkaWWLIMXNKLP7TiWDZubdmLV6gDde+6IMChW0bO1r
X-Gm-Gg: AYBFou0HbEl4uX/oFKRuAEugkB9kk1yu0S+SZ65kC3xeu+c5e0Mp8eC7HsW67Nexi0N
	7+vdF0dyfX8Q4rjkeaRz5XUq1l8Ynymeb9YforzdQPxZXUaHefx1IeUV+qsR75aLK975Yjz1kaN
	RUUGSZGQ7ZvqsrWenQRI7mqh0r5ruyd1nyywAo+0WbAVr11gngHvh2TgoxbVT3Fb6TRwVpqJ7IZ
	NLDPZGrSitP1JgnLcFuebfpf/958MSXuzbBc+oioLztzesJg6GIEvFS7IR++xlR3nv0jef/2FCN
	XZmvZd39mXpsROoJoNu/LgWGcMiepO1XKSZ25EFqk2mdVoOv2s20XDB4ZSxfZQaeyJGPGyPNOL4
	vQ7MXuBlvd6127Ajan+NKc3BVTj3M9V/ic7OMpqz7abRaVzeqvKx1Tqwbe4lGsR7p8GyZavOz+Z
	LSo8QkSewBw3aF/DkloBRGRVCZrHX2FEKc76AUGnv6yTG1y1pJAtnwga2n8xQ6ZVP8j29Ck3qn3
	GBKp4kLq+zypTuX1QsyEcuGYYUqPYaLjaxfO/dtoy+gKmcRAgrZ5HiL15KQq0IhFFEA/Pn9uc+2
	9UtBOnV7jil+aUWGa9JYIQ==
X-Received: by 2002:a05:600c:4754:b0:49c:c96a:d36b with SMTP id 5b1f17b1804b1-49fe66d1663mr148201725e9.12.1790420753924;
        Sat, 26 Sep 2026 04:05:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a64f795sm12124664f8f.31.2026.09.26.04.05.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 04:05:53 -0700 (PDT)
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
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Joseph Guo <qijian.guo@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v2 02/11] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Sat, 26 Sep 2026 13:05:30 +0200
Message-ID: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790413032.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790413032.git.stefano.r@variscite.com>
References: <cover.1790413032.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260926_040556_028488_82B2FA67 
X-CRM114-Status: GOOD (  11.21  )
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
v1->v2:
 - 

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


