Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F294C98321
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Sep 2026 14:48:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=; b=VDYEUpfI0k4P7pYwL/m/PLInW9
	fJB5pyVXLDTDbCKj9bVCH1/gLhv39I0yDHAd0wWoBetang5uCxaMd8bUR005a4NTekAXShEHpIWds
	4Z3eFnyRnu56VmNGxa33+NIxXNsVcEBCeLJMYk0YrWB/opy4AbKf6+ByfUES4r+1fskhQh7XX7459
	iBJ04p8/KxQKwe2ni2av7+D7e/sZBaq4AHYU79cNaHsLjb0aXG1QSDw2Ajv9YZKR/Er7/heDkDM54
	bJgFmPisaxkYwQIDs1jJTvb0pbKwnbZQaK7IR64yWoMuKozVqwRaorEJaeIDhC4CuYQjGm8VmE23R
	2QedOx4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6WS-0000000DWDB-0g2h;
	Fri, 25 Sep 2026 14:03:32 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xA6WP-0000000DW9S-02Ie
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Sep 2026 14:03:30 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-485933b2522so816645f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Sep 2026 07:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790345007; x=1790949807; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=ZR/6W87l/u0VbtWwTqabIv/CcMAy/MCv7+U6vxDz5vPib3KjH5uUlTgMbMq/hD0tJg
         UQaSbZsViTyHk0BW7IEG7EmiYj5OMU6McEoDQuoSX9mB4UF8cXsZnbTOsXj66QJf4xHH
         WEkz5RcEg0fsYsrZP3FZLxO0yOzX9y5quBgLn7uKgREAiS1U10ozl/k7IXJ9wHOCQM00
         7KSFWX8VJUUAxvhWS0qCgsZ6rClp7yJ/mapvEfpQBrfgFwSlatD4hvr1I8ATu4dpgCeo
         Yr7481hTonQzbDCv6qj+E5P5NMoeA7oCUSJPhIvWaK6qts4VuOr63Ddwjefx4Q6gCMOR
         8lAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790345007; x=1790949807;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=rAAzoNU0NjCxzZdtaLk3anDz+vHYVUbjBqqburXNSPKr5qM+jFa2+CKdKAzjrVd4yl
         wtD/cu8jJGFM48/Y4E3HwAK/zmGn30q6sVfFtzZsAza91JRYIj//cuZ6pDHwGh3/w994
         z066qRdD7eKV/LfCstlHSH3zvE5fFyvhY0quAkcI5oxL27Z4VQo4+9d8s4iRApgLFe34
         09piiY32bq2IeP7GgzrXhi20Am+3KmYhbU5c9vXeyol3PUqhDuo1sMC5bbW4w1h94jJP
         B6vKWAuXQm8U9/WVG0mJTOP+zQG9qnb3r9kyf4lECRsteOpXUwZl5wHpTsulZhAyrJkd
         hzFA==
X-Forwarded-Encrypted: i=1; AKwUvBz1/J0Ts8bPinCnr2o6X5/7Hf9frvVTJB6Lo4dFUxdy+0qVC9f1+sQB8TqPJn7NLc5bV6j4UQm2vs6Dz5EzQdka@lists.infradead.org
X-Gm-Message-State: AFuF++k5x1ZKUxFyyXCrQvrlwxIz1PmoRCQyVhiRKZHSt7PsUWaOu/Af
	LRqu/T3ENCHyJNLATQ3g60tf2zgR86kguBa8dF/s2G8pYxuDltEu/lMz
X-Gm-Gg: AYBFou3F60oqFOPu4QwNHgXIOiIAFcOrxqLRJNOBIRqAy86PmtgT2J4+pGA3UbAwIpv
	l/X4tXt2bcnMFcyzKqWQu8ZTTdVQq7ZrQCFQC30xSkPQuvPsj9cxJeck5Siywf62xLOrrcjk61u
	tc/xLFdzYQj2lcHcl/9LSMu1TR5XIhykkupdC54dRrls7HaxueT90u+Esnm+w+8lKB9HnII7zOm
	YGiAwLRmfzG1OOEvl438bTiyvIZ9luZFl6+WAZcHThGz0OsNpL8i47UjJbw+EZdjDsd0C6+AUUZ
	iKVlLau+j2iSCdBw/vTzIFZyJjUn64fJwTm6WdbLme6jDnE4HKMNXmNGCfMvA5GLNgkr5GmRBxM
	HcyUPVlNF1A3KtLmUmFwQHyziCc8UZoPC1VeIoZOmbnoZ+4vOaq8FAzt15DFSSBnClCtn6CqF8g
	tbCdB5ESHklxjLAO2TZq2xlFrGSNFld8sXSvhuXRoiLUB0yhc6/6/pFPvRHPaA5fk6YdOJb/Ejg
	iKE35hvdNO1U1lJryBklQFkckYaWHCVLEuh7Kcs79dFipBm6M4/MSnPw6A8hGdy0J5XGUZINhP0
	jqlT/WnByX1n3uTslfUwyg==
X-Received: by 2002:a05:6000:2511:b0:487:27f9:840 with SMTP id ffacd0b85a97d-48871726b7cmr10342107f8f.53.1790345006448;
        Fri, 25 Sep 2026 07:03:26 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4887a355c65sm7522431f8f.19.2026.09.25.07.03.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:25 -0700 (PDT)
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
Subject: [PATCH v1 02/11] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Fri, 25 Sep 2026 16:02:19 +0200
Message-ID: <6580cb8231c0ccada44d3e510374f6c21b65d283.1790344389.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790344389.git.stefano.r@variscite.com>
References: <cover.1790344389.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260925_070329_089270_AB978A88 
X-CRM114-Status: GOOD (  11.55  )
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


