Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60F76CA6002
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Oct 2026 08:26:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=; b=KXXTEoJkQsVpmYEZN5vnPv+oBV
	yeb3JZF2QXQGsMdEswEbz25ipAnBRM2o5k/5kAP23c0zUl4gprwpCQjYUY6ZDl4dY04omJA0n0wcV
	qne4NTU4pEK4gRr3u1q4I0LeOVx92PEvJLav8Hs0qwg++08HphHBWGRrtNlE4l2M5WMR8o4iEN6Z8
	7OjhwOmYIecX2YER6v1j5sA3luARQzVznjl+r2Pnukb0gFWAXt+ONaSde7GMBMFayze39vsqimVCo
	oTr48Iyfw19MHJrx0rKhjHLsXp+1O7ZbqOku+GzgI9UZqnzdj6kwrhL7fbaZd1LCIpkzA15+LbRgc
	4cajTR/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyy-00000001wSw-3QBY;
	Wed, 07 Oct 2026 08:26:36 +0000
Received: from mail-wr1-f42.google.com ([209.85.221.42])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEMyu-00000001wPJ-31Mo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Oct 2026 08:26:34 +0000
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b0be347b8so1213456f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 07 Oct 2026 01:26:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791361591; x=1791966391;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9iDEeSRYepWdUPmgZSkaxaPn0y4xYgwY4k/M0MT4wvc=;
        b=nuWvgjR/vDo5GhNP2jiJekSL8ObGbyuqrvuHK6F6bAB2WyD0hT/R+CCrgWKYPOAgGu
         OSyEIXRd5Sk2EFhEHAdsHnvaXJwE79wAfb6mayyQLQj0kiV3fn8gQwFJgk35KdTg3JY0
         fh0janm/yYySvtYEaJIucz1MCLjR4e9HjQaMdwD+rfRpYY2dKhGM9I5544DAt37ueBIe
         Ssk3ri6pvMrQQEkRcjw6q+ACd7u1msnviWxBZAea6CNMuttbsIKOgAFaqc/VDjDwtSmp
         x0dZUNZuHjyQRtqbYdrwYgKlx+qH/Ns4kFNvSO2+Xcj/SzRipifTS6WhcEYQXkmxuceu
         559w==
X-Forwarded-Encrypted: i=1; AKwUvBwdIpvYnpKzbcN9TBPCUnK2oMbyA4AD9TM256ZJv1i1x9u0iN5cqCSZ/l4eYb9KYhWlUhtAE3eDCpmekdTB6xG0@lists.infradead.org
X-Gm-Message-State: AFq9FYKpvcAH1PzFazPB/rwVHSOyP/Sz+viTeLAjAlXM1Nb5Arjd/coE
	QOcymKmuXxPGjVyIh8p32h4MUXLmd9yEVvQ3cOizTWrB0LCCSmMLvPqUql4tWrSY/8Mk2w==
X-Gm-Gg: AYBFou38lD/E2JUZUI+Ljnt5X1srieATscKcleAMkrDomc4P1p9uDvWL9gU8n/dO4N/
	ETslVSszAcV9sZUXrFUeJyHZYlNwnNoc9/EIcnohVzhLcBBwm1BrH5rjAaAIbV/UOPLdCagYPyH
	/PYerS/cfzFd7ZRnzQdKQZQC5E5iGbd0wfR1CvApNmvB6mgT0qPsngqZlvpyfr+uyppglHSZH23
	zi4zW1oNVdvYVYvHm+GjbcaeDFrNUNZelb+JrWEYPMTGlv18pffhV6x4UoK5P9ru5Dcp9U2l9bZ
	z095s5P9tSEnGTv8ga6BbueeFvLVjJcj5B6Ovb7oyqrDDFFrmPCurvbXnj3U1sKGk4L/oFI01go
	Z8L/2OnZ6oNrM3tY7rbzv/yznN+hwoxlYF2NAU+YJwrl5gBKGbIr8onX/WpCH8nE131x38yF7r/
	j6cHxecbdO6BP0Vl8wOSuYz+8BLp+nUVDx6GK0w4k6AomwVSePdqb1VtVJS8e/WLG5h+Lu2EEoc
	4oUr5as6H9KI1sqAGapEwv7uifM1kWHmo0=
X-Received: by 2002:a05:6000:2dc9:b0:48b:123e:2f5c with SMTP id ffacd0b85a97d-48c7278ef3fmr3047018f8f.29.1791361590762;
        Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
Received: from threads.localdomain ([84.70.176.222])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48c71d3b502sm4251370f8f.52.2026.10.07.01.26.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 01:26:30 -0700 (PDT)
From: Lucas Tanure <tanure@linux.com>
To: xianwei.zhao@amlogic.com,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: netdev@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC PATCH v2 2/7] dt-bindings: net: amlogic,meson-dwmac: list the compatible combinations
Date: Wed,  7 Oct 2026 09:26:22 +0100
Message-ID: <20261007082627.63807-3-tanure@linux.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261007082627.63807-1-tanure@linux.com>
References: <20261007082627.63807-1-tanure@linux.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261007_012632_784913_EE5A50E8 
X-CRM114-Status: GOOD (  12.30  )
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

The compatible property only checks that the first entry is an Amlogic
name and that "snps,dwmac" or "snps,dwmac-3.70a" appears somewhere in
the list. It cannot express which fallbacks each SoC takes, so a SoC
built on a different Synopsys core cannot be added without loosening
the check for every other one.

List the combinations the device trees actually use: Meson6 and
Meson8m2 fall back to "snps,dwmac" alone, the others also name the
3.70a core. The example used a two-entry form no device tree has, so
give it the Meson GXBB combination.

Assisted-by: LLM
Suggested-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Lucas Tanure <tanure@linux.com>
---
 .../bindings/net/amlogic,meson-dwmac.yaml     | 30 +++++++++----------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
index 5c91716d1f21..90ef79161ab1 100644
--- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
+++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
@@ -129,20 +129,20 @@ allOf:
 
 properties:
   compatible:
-    additionalItems: true
-    maxItems: 3
-    items:
-      - enum:
-          - amlogic,meson6-dwmac
-          - amlogic,meson8b-dwmac
-          - amlogic,meson8m2-dwmac
-          - amlogic,meson-gxbb-dwmac
-          - amlogic,meson-axg-dwmac
-          - amlogic,meson-g12a-dwmac
-    contains:
-      enum:
-        - snps,dwmac-3.70a
-        - snps,dwmac
+    oneOf:
+      - items:
+          - enum:
+              - amlogic,meson8b-dwmac
+              - amlogic,meson-gxbb-dwmac
+              - amlogic,meson-axg-dwmac
+              - amlogic,meson-g12a-dwmac
+          - const: snps,dwmac-3.70a
+          - const: snps,dwmac
+      - items:
+          - enum:
+              - amlogic,meson6-dwmac
+              - amlogic,meson8m2-dwmac
+          - const: snps,dwmac
 
   reg:
     items:
@@ -172,7 +172,7 @@ unevaluatedProperties: false
 examples:
   - |
     ethmac: ethernet@c9410000 {
-        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac";
+        compatible = "amlogic,meson-gxbb-dwmac", "snps,dwmac-3.70a", "snps,dwmac";
         reg = <0xc9410000 0x10000>, <0xc8834540 0x8>;
         interrupts = <8>;
         interrupt-names = "macirq";
-- 
2.56.0


