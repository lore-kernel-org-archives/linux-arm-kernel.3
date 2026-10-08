Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B84CA600D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Oct 2026 19:40:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=; b=MYhBJEa1Y8lL4+vIfHt8bxit0/
	lj96jbpTodSvjrk+ga1zzp1GpudBOE2cWYZgplQUr4pSdA+Hm90dGyDrhUKU6koVOhXuIWQfFK42t
	MrbZ5ofdCemooFyX2qo0Q0cKi1BoS4T5jBMoSpoV3XjQi4JVz2WmVU7mM0hWNZpOeQdX5sgLY+o80
	LwXe2joDn3a+56TFEw7v4oPFk8WrrJRfHJBjOaPj93/Z2PJbtjUyneOx7h5d2J4Sz6N8TS6wpk+0n
	af8Rtzj+avdjI/4HztzFjpWOzlnnFY9Lm6br9GtKmWsArmI/9K/rzedxQtSiyICJZwiRLhnFohOwe
	GcaFOFyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyc-00000004wWc-0Osc;
	Thu, 08 Oct 2026 19:40:26 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xEtyW-00000004wT0-0TVO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Oct 2026 19:40:21 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so58799405e9.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 08 Oct 2026 12:40:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791488418; x=1792093218; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=VYAENyaQkUe+3KSYjUU5ay4jrw8mXJ2UAN6YallyZeEY/ttkyBBnSzhnw8wZUCRo8u
         rPz/kRSjiuBMWiYzUMEkSrviz7IxMDRYxWZU+frHvJhi86CH2aynRr6ZUWs9zjvs9Kjh
         w1i8wZwGU2ZxePQBe9LRSu6BlRPKhfMC/K3ozeXUjwiePzIPeDMNn9kI4g4pX/9SwGB0
         3455s+TCJWEI9Rb/nC9z7D0XB/z8t29X1yjr0WHXtT3n/f5tQxhvy0lTPcZT774cvD9l
         JchNORT2jHBWPnJDKzNkomcadZvjrhWtTqV1kKpVtT7GE2TBM5l930m7mVBl6JUpkwgE
         tbkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791488418; x=1792093218;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ne6jQNHZSute3MOl6uhvR02t4ZAiYz3hjPWK7wQg7Q=;
        b=xkAQBVBeTkhC8lRymEEq+Rcj96b7LP7Jh0Kkzn6S8HzXWf9cVpg/87Rx6pqSQ4RYr9
         8KcZSNeBoi/WSjsJRWNlf2t60UjvdvkPOv4uHpcf3P4DKW5+/EqI0VvtS+TSIOjQ0MHo
         LivMiMPO58cm8rZMRGeYJv3C7I2xItlX47xIuD+iY/wL48N5qxyY7eIo1/KCpSJIQewb
         C3qH5HCFipo3mM+K3d/JU+vIw+0Zg6b9iWtCRpfcVixrSDw8JtKsMsDCpA/s6FRsHerm
         bsL1mebrh9qyIeXJ6koJAmprt6Qp4NCjHP/XvmJfvgnO1c8R3H4KV4ZcLstpr8PqN7X/
         h49g==
X-Forwarded-Encrypted: i=1; AKwUvBwFEKSsjlHOE1gsS6Dr6IihV48IUmqbEs4fkSYbLuQNxFUT9JiR5/6Azg80q9oroq6eCtKUhg1cweermPcVPXsT@lists.infradead.org
X-Gm-Message-State: AFuF++lADgjwnuyEt2esPxvqTvZWt/U9AUP6npZEtYS7dOLzndwMabZJ
	m0TNFVu3/7+RydJf/Hm01qZ2P58BiB0ur8H2njn8VzToMCBB4zQ0RFl1
X-Gm-Gg: AYBFou3dOt2fQm+rjTTsWkZhzsEMWMbo2Ig7KDpsPtcY3HLH1DHwpoMVPa19VGUlPvB
	/V9kCAxO27uoXfi9GZsV9wagmCuYrnYXZvz56MrzDFp8KkcrEPe4VRTungoUic8aUVrFkZlO2YQ
	DhY2VGiePlQOpvracZAtM/uLgCCygh0T3PVpI7lBtk7ZiDHuVbZJWbqa1aGovVFW7UQvnOIG4Ip
	0VB0W28o5M+oLcDpoiu8m6srjPHDDq6NYJbaallweB4D6yHh2kTbfXaf+toBErbDWWjfjZ72AqI
	nAAEXYdRQvldCWXKh5mU94l/Kl2k+hCRJMVO4zo2/WcR2zAq4utCZfjVgHgoYg8DoVB1+oAwJz/
	bPju6pbSilBk1Y/jC0b62uiWq3+oEBjBnoLb5XJ97MoUdtNG5WHzN3/oLEpdh5Qps6YigQJzYSr
	YJOJZPICp2X9l4sCHra9UVzqdHIyzkf+4vkrEpmphN9p+EJ5z1PVtHVNM9wD+VyfI6+1AIgga44
	tCrIXN4IwnooRbV7QGr1HgXO0gRLF0/CQ6EMmnCaAuDejPvkZW4TMU+938SV9KpXClkJjd5cw5z
	qTyZ5DpyivKoBP15SiUROQ==
X-Received: by 2002:a05:600c:5391:b0:49f:cbf1:e77b with SMTP id 5b1f17b1804b1-4a1802eab67mr140228155e9.10.1791488417829;
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18c1e33d2sm1419065e9.0.2026.10.08.12.40.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Oct 2026 12:40:17 -0700 (PDT)
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
	netdev@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Thu,  8 Oct 2026 21:37:42 +0200
Message-ID: <e5f0dc2bdf5574c907c0efdc8b5b9974a32e2cbf.1791487179.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1791487179.git.stefano.r@variscite.com>
References: <cover.1791487179.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261008_124020_184195_6C3B57CF 
X-CRM114-Status: GOOD (  11.28  )
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

Document new VAR-SOM-6UL configurations on the already supported
Concerto carrier while retaining its legacy compatible. Add
VAR-SOM-6UL variants on Symphony and DART-6UL variants on
VAR-6ULCustomBoard.

The new compatibles identify the SoM storage, wireless and audio
options followed by the carrier, module and SoC compatibles.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v4->v5:
 - Collect Krzysztof Kozlowski's Reviewed-by; no binding changes.

v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index f044f6fce51f..ca6778b8777f 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -835,9 +835,46 @@ properties:
           - const: phytec,imx6ull-pcl063        # PHYTEC phyCORE-i.MX 6ULL
           - const: fsl,imx6ull
 
+      - description: i.MX6ULL Variscite DART-6UL board variants
+        items:
+          - enum:
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-emmc-wifi-iw61x-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-sd-card-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-brcm-wm8731-6ulcustomboard
+              - variscite,dart-6ul-imx6ull-nand-wifi-iw61x-6ulcustomboard
+          - const: variscite,dart-6ul-imx6ull
+          - const: fsl,imx6ull
+
       - description: i.MX6ULL Variscite VAR-SOM-6UL Boards
         items:
-          - const: variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+          - enum:
+              - variscite,mx6ullconcerto  # Variscite VAR-SOM-6UL dev kit board
+              - variscite,var-som-imx6ull-emmc-sd-card-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-symphony
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-emmc-wifi-iw61x-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-symphony
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-sd-card-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-symphony
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-concerto
+              - variscite,var-som-imx6ull-nand-wifi-brcm-wm8731-symphony
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-concerto
+              - variscite,var-som-imx6ull-nand-wifi-iw61x-symphony
           - const: variscite,var-som-imx6ull # Variscite VAR-SOM-6UL SoM (6ULL variant)
           - const: fsl,imx6ull
 
-- 
2.47.3


