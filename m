Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A885C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Aug 2026 06:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=; b=3sVlp1n3FPXBigdLSQOtBqDQee
	7o17His6lQgQfJJ8iSx+xhzHQ2+YIo0wIFKKnaG3FRXY1n583oar8zSVH/wHau/5xkGxl3UGAZtDs
	0l/leL1AQuMszcOkTvXlqWiUPCRqbYlz3TnzlwBw+2FKKf2DvgXunpmayGBiB0dPJYYHBi+5ArJ2L
	2nRX7Zzshwb3PJrB/Rf6FORo38bNY1XJs+oATFtjYqfD34PN3yE1iHmsG+SdMgZIvrJ9y4wQkm6DU
	bBJw2j4dcswGkGmokuJ9KKHWpievjMBAkwIr+XuyDGYsml6np7VDp1X90tHurdEdMmF1LgRRZLHpH
	bvpROcrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyl5v-00000000FXc-3nnh;
	Tue, 25 Aug 2026 06:57:25 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyl5r-00000000FWe-0u4Y
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Aug 2026 06:57:12 +0000
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-c207cb16cf5so688433866b.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 24 Aug 2026 23:57:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787641029; x=1788245829; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=;
        b=iDSJnIwV56wSx0rTexwLW9vExT5UzTOCZcdQxKd5ICTomvJ4CyhP3dDGpu/mIG1N+S
         vRCE4+PLecnbXMnUPgvCx9c7igZRFHhDD3H0miKPUCrmNh62UCiwUbhGH6X5XsyBqdSJ
         G1hpmRFkRrO7LZqtwroCeF0ndLxP093htKNGoYl2U5yDe8vve4M/1LOrL2/oXZg0oQ2e
         +pISAnvYICydNyUBrZZ4IzQLuZBgk8QViY+qLuA4/ZNr2yGXV+qUwKqAhQ+E81N4nhBZ
         iZX17QrcR9rj9nbbd6nWKG5ewEPaJEPrDrRXEq+ahov4lrt2b7yWId1LeXVudsscExkW
         2ecQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787641029; x=1788245829;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=aGsywrVc7pNW0Md7H8+wlhF2HFeJ9iI14b9xdhdHZ1o=;
        b=fOvzQsv6boW6lbXXMkyX1ezeQWJ6yMgq+woH4i2wEzbOgMfIKID41bja2VP5IzDbCE
         sAkqaWEN4GGG8hWwJ5gmN6Uk/SjG6/FJrgH6AaVRka9n8FMJkonN3wLzeHkwLafWDmeu
         3nDzPYVZq5ANAOduBbt2JMStv0L3Vl3wxUO8cSpt4qMERFUbt8H7P15+MqCxsfz+MCxF
         PU/9+RPszQDmIobGlhAP2a+bphS2uYrgm8bC8vttFJC0UST63UER0vSYa4HIArLTzras
         r/zhqauNPf12jYwgnUnUNaKekqYJP+F//NHQwoK+qNXfFirjzCeduf39uatrfc6uHcA+
         Hb3g==
X-Forwarded-Encrypted: i=1; AHgh+Rquwr4c5mmutdCAyCYMeExWVVEsg6xsJ7zaPeZC6Cw7o1o1bbVbdA+esj0aUe/GqiBxWzxb+ayKnz716+tQHy0B@lists.infradead.org
X-Gm-Message-State: AFuF++n1PrG+NqRNrHtPcZ3bWE2dRU6wP1Dd3x3avl/nFdMtoXXPpVPZ
	xBlaLCYCkKs5nmyGpVKlQ2t5JPBd3eOMSXoXlK+vHJRJbvR5oTu6FjVx
X-Gm-Gg: AR+sD11uT18WbHKbJBd9nUy0GBR2VC/v63574g5Z4O+3H6sto0pE/aeDP56wsjx+McH
	mmbDEMZkdkNMtC2OU1SrqAL/aIWmjsaKRykHDCprRE3m26kCZw8S4KtPl2AMdQOqdoI379A+nzt
	qwlPSzbfwwXE66PPfF+4Day+8l7+YVSHsRkUsbAcyZBU2tZwc854dxBi+lQDPvRC+LThaSXYXl5
	l3O1i72zDJR17ZlEjj1s1hT1nuE/IEhP+HN79iEORxUP1QDfTftQCWqGO4lUKR2kPX5Bwnx0+cI
	4Wb6H1P17npOYNkudzAuVXm3V8f2COK9zWb+fJi9fLVu7Dujh77TCqJqkBe9mU+d+bgiGkxqynl
	LiBwnm9MZO0iBtpsvz/JBbMcgth98KPcjaCfZ88VD3ts/Gn79j6TXBGojeH0xzxxctsrQCCBxI0
	caWP185Qlep29bF4V74BbDMuzL2KQKxR05wcuXagVTN3bsHrn4hk2UGwG0LZxvqdJn/jp0mP2A/
	uvg2x65i46215/uFqg6RP4N6SzY9o8zTDlSRf/TjGK2gJhxeHqowo0u
X-Received: by 2002:a17:907:ea8f:b0:c20:ff26:336e with SMTP id a640c23a62f3a-c246a605cb7mr3318528066b.14.1787641028952;
        Mon, 24 Aug 2026 23:57:08 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-70-208.net.vodafone.it. [5.90.70.208])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24d6f203acsm613534266b.24.2026.08.24.23.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Aug 2026 23:57:08 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	alexander.h@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Josua Mayer <josua@solid-run.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Tue, 25 Aug 2026 08:56:53 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787586961.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787586961.git.stefano.r@variscite.com>
References: <cover.1787586961.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_235711_682616_D60CEBCA 
X-CRM114-Status: GOOD (  10.09  )
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

Add DT compatible strings for the Variscite VAR-SOM-MX7 SoM variants
used with the MX7CustomBoard carrier board.

Both the first and second hardware revisions are supported, including
eMMC and NAND configurations, with WM8731 variants available for the
first hardware revision.

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - 

v2->v3:
 - 

v1->v2:
 - Fixed commit message
 - Fixed spacing

 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..b732ff810265 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-emmc-mx7customboard
+                  - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                  - variscite,var-som-imx7d-nand-mx7customboard
+                  - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+              - const: variscite,var-som-imx7d
+              - const: fsl,imx7d
+          - items:
+              - enum:
+                  - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                  - variscite,var-som-imx7d-v2-nand-mx7customboard
+              - const: variscite,var-som-imx7d-v2
+              - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3


