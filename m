Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB63CCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 15:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=; b=AV43IKLD/M19i0hwsGZjnf0em/
	j+D7KgrsIxTa0LkanM3ZE8qnvFhXuvJfRY6Q9wp0rAzr0uHnQlaY+YamR9Uqeou9fvRArnloT/qpk
	iRC9tKydHgS1kwSjSbDKV0JHS48arFgP8gGBRgqd81p3Tfea3448RNSrba2BMp/k/Z7f+fDvfMP/P
	Z9FvcMcg2tIvfxwFa/wZIjbLdwlbWOYBE7WCpg7iu+cVuAY5hrLzp7pLd5hiLhLcB6jDgTmBLdHQ+
	F/w91PtGaaTuqEovwNKAMdT2evi/Cb7smjy1TERJgn366uZ/AhgA5uVmf71J1j/XjPuu94FtHluhI
	99apfKaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZah-00000003uzU-1Jhn;
	Tue, 29 Sep 2026 15:17:59 +0000
Received: from mail-wm2-x11.google.com ([2a00:1450:4864:31::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZad-00000003uws-13Wg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:17:56 +0000
Received: by mail-wm2-x11.google.com with SMTP id 5b1f17b1804b1-49e7bcb94d3so32627435e9.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695073; x=1791299873; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=UpjqVudIG0wfjzxFzYk+oRv6SQlFty0QP2hGYAF3wrATrdLz9ghmUSS0l/yz6lyN3N
         HAlG52knh5A4CaT+Cr0M+M3/f0khxo3rBefgSxtcGcr0G9z+bup+UHKZI0R2VryOhLEB
         +BhXiDor/DOl0xlTwOzH2WLFYNUd4E/qwmGJG6oir30FM+einkLBj4u3RWCP3uwE0iaT
         GfWisMeTsG4SmxLSiyDDAmLSujCoAl+BVY8Hd1xCGyXED0LMTHfbqyMYMnCIlPSqn6uk
         1ePI6iKeWjuVayFqNePDxWDyL6uSXZloUyf0fXx3nA+8lq2JRWk7gcwbJOhRZ54T3GIL
         e7KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695074; x=1791299874;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YshmIf8br7QZ8gBxtu/Vo13g09V/Sk1mprmtIBCHo2o=;
        b=kz+5qw6fEnwsFiwHBykp7MGc0GEq4zl0fZYDAZqrN3mAa8aypJntq/yaPeX//1FHWA
         UuTiLngBNNonK9lToeqwgVEOyRCPwfqYzpxGFnWbEs6PhKvk13yhJWZgPvyU7k3HmSPI
         SIUqCBfF1uQLWxVmOcE1nhlq8jWVsJERmCxWoNiShzJSyKEP1nvxpJoeGKbP5yzX3maW
         /10Nc/SbtLjA3Qm01TvxTmeAgBOEeNK9VOLXOpv5AiMrzuAlNM1xiO0M2P+5Eb/lZubV
         U17E2ek0ZlmRft6xryEZKU+XxA6DO0KdDAgRHzVztlq19WmlrN0yAeqrKwAU5lfyMOlA
         uxqQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6WqbKRVBLRusW28SfELnrTZ6kAEgyoOCxcivBy1vAU3snn8d4IFAINdtxqWbEkVKh8P93Z9S1ikUQ709MSqzZ@lists.infradead.org
X-Gm-Message-State: AFuF++l+EEc13BtEC1sMU4XSWZiwfgj4ScKbezQyx2KhM7CFJZYXEqMm
	k2BlT8cPIcGX8MXf1IZDZQ9cu2MYjRyVURa/6n8c99W+6UrNoNTYSDWf
X-Gm-Gg: AYBFou1C3bjczHf6NsMDbiLyynOnRrioduGL+edos6bCy6w2tX+ariD+fOfAsWCd/Q8
	Wm3R8KmwwPNeAzlu+6i2OuzZQYgMCMvc7pb64ujGgxuKBBZtQKKMTWAfzgxaYgKuOgoYOd0/TYd
	PYbow1CxirDAjKmdKexP0pZeGhkBRkwX0TILHPGMItQfvfA4JwaIc6vh6zeTsW9QFbn/BN5bOlr
	dj+aYIOwjprX8//7UeA4S7n8zcFyof6pt+5B656is8j9Fcz2FveNGOr9CYu11KrgIz+qIwFp7B9
	rlmKeubNpgTE2zywCYQ2XFS0v0+cG7KWlFW+RUTpU6DXxo/N4EizLH5cz1qINewZ/JYYBYLfz0N
	cXNxH8gpU/+CoBL5RqM5/stBhzE06VsFVDhFC2oDSfHpdgzOlV4W4zhs6kSoHJzjMaVDUBmgUFI
	/BLj8GJctWhTDAuxYalhXMHIRoZhej1Qw5IrR2SYjhsNOz+DjAHXMvoeC86t6bg4JhzekN7jAzw
	5235wfe3LdwfxkZP+6U+BJakbrET8mXf7X+sfxWTINJaiNlHRQjq5Wnb8x91oNeJnzOlT7W1Zev
	o2yAsAvngWYw6vrC4/WRcnllGAgbsv++
X-Received: by 2002:a05:600c:c3c1:10b0:49c:fc6e:8caf with SMTP id 5b1f17b1804b1-49feaa1d628mr198851025e9.19.1790695073277;
        Tue, 29 Sep 2026 08:17:53 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:52 -0700 (PDT)
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
	Josua Mayer <josua@solid-run.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Mehmet Fide <mehmet.fide@screeningeagle.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Stefan Eichenberger <eichest@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH v4 05/13] dt-bindings: net: micrel: Fix RMII clock select property type
Date: Tue, 29 Sep 2026 17:17:32 +0200
Message-ID: <9a0f70dc168278a484bb336835bf2e419a9d089d.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081755_310631_4DEEA202 
X-CRM114-Status: GOOD (  12.16  )
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

