Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC9CC624A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 12:51:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=; b=EiQ0YfGioLTdCyS5gwzjlsUxqa
	G0UiW2IymzmgblZU+KW/UPAZ2Q1eUgGlbmrM2eQUo+NPbU9MrcEneeRl3LFqym1oBz9KpxtP3gZ7E
	2nDeC74P/qSE+w46zEeJUt7O5XXNCiCJvfTbrS77on8e/1v72zN9TpE/uWCEvw3bRCQ5N8ZPWHuOI
	yceA9e4As54i9XLy7Sof9JFoX+53TSAFaugCyvhb5vXPD+IYOwCwpiixGUrTjbgyzcWkY2xoWNES1
	D2B/3A4G7SttWnh8W0rWaCPl5izeE00AjjhNa5IYfYhcEaBVq2yPNzY9nUqJUimawquAD9kr5g3yL
	Un8hRVLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11TS-00000009KwS-2j9P;
	Mon, 31 Aug 2026 12:50:54 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x11TQ-00000009KvQ-0UpE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 12:50:53 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4998b5a63e2so32654495e9.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 05:50:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788180650; x=1788785450; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=;
        b=WvP8uVkd+hHrDNSvjA59dZQtmmcDL1v5gYQgn+3dArwpFwVpvhi2uVFiJKgucjFiE9
         oDkQsXFFtm6o29wmb0Q/GJLuH9W1Ni7L5p9fw3ndVuKerRSASvUk5Ks3nHtgmgAKr2vN
         EQK1t2ln7U1GBDJyTw81brnhy1/yDS3MlMamFywgCX0P8bTWgj89zsowyElGKVI3ErTC
         +QnvI/n1CaW0hfDAMESoUtGtuQInEYrcH01FHArmd7oJabNC98t3glYO5yV6A10TmEXp
         1+YWpoTZLcz+yBTh6mtNRNwghzAhqEkfP++ucB/DxKkF/f4Q1pWWLtOlPMk0LDAcEaEn
         MP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788180650; x=1788785450;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FgpUpwzhe3ICsnKIHyf7lVPTDsFbvK8kI90BAlWw5dE=;
        b=XybqDCMiAeOmw/JUSORhigv2WK2R/uC70EeoNnLcNusUv+4eFx0vwNJlXGF+XJ9ORN
         GBqbH0EE2crtQhfmJCDCp78KsUY+sR4M++4/5hOo96DIHq1NGW44n7zB7qoG03na2C8+
         4EpuhAry17hLB4/xZiKAIOs0ieR1ZIV2KDlGYfkVLEWjx0cBlzswKL+uYp+MFtjuO426
         HmvSIwA46y4i48JM3XdNSoHdkpzIHSFiCDP+4ND9af8Pfqa08d2abhn76iif9dt4SWS9
         xk3YoGDCoSaQRlZRPBfL1pION/LrDPcIu8XofL7zECjK8YDaGZjS2yD4XgN4QYgEa4OL
         iBJA==
X-Forwarded-Encrypted: i=1; AHgh+Rq2/eIP4x7MCQRkADMEvys3L77Eu6AhhPlT8w2VlYm4btSJGh1L93x+BiH53FzTzzMVXXPWZDhHtQWFhA7w0S5L@lists.infradead.org
X-Gm-Message-State: AFuF++lG5fUe/8z9r5m8NMqu+3rYDgYHfQBj3npgKK46uFlu7LloD7We
	3OfOAkQVZ21FviuL2m751fQ+ZXjYzi4sd09qEXQW8IbFhOgdxW5nhElR
X-Gm-Gg: AR+sD10JdXT5m8JIfmKJ09BvsmOqmdlwkuEAa3PmaUI8E/U3BVV9YYCKNZiApIjGPCT
	if/IT0WCZlzSsgGfCXqY+J4yTdPC0XmbPFTzCkCBQGED2BR4+GbLFCyHCSSeAXKCTUYKMrqvtC/
	Ng3s5w+UMngXjI5GZbmMlzNVpsaHht98AKSvGV4v4nAE/lWKQIzDQSnToryvJyKNbzwA4miQr9/
	AjTmI0uPlH7n/uTzir50SS6/F0yoBgz2B0rNvU6nUxERvHBismfLwCV8t9eFz1qt02EUT81Wl3A
	/F8tHnwvqCY1qOcoi4gIn/fYxuP/Z5fIIg3iGWhhoCxt+xD1SCLFyVLfU3QvSKPRCTws0FGgsev
	Y7QBCqknt1h+/Bhko2egCPJrgTS0RpCMGdkWH1DS3cE7yvFSjqyiUdFDGQDICdfN9Oucji9wm+x
	G25iu0mwezz4mW53KgoaWS/mnrMLgBVLzTKX70ii91UTBvoUyb1zFq+pFiZ4fVLuIOESwfjLzs8
	J4a6glisUedKlT9ZnqAutmrXhfYY8ngv3zw
X-Received: by 2002:a05:600c:3145:b0:499:79b9:e220 with SMTP id 5b1f17b1804b1-49b91c44f6cmr384483205e9.10.1788180649895;
        Mon, 31 Aug 2026 05:50:49 -0700 (PDT)
Received: from GLaDOS.station ([187.14.102.85])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cd53a4678sm116571225e9.13.2026.08.31.05.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2026 05:50:49 -0700 (PDT)
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
Subject: [PATCH v7 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Mon, 31 Aug 2026 14:50:23 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1788180142.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1788180142.git.stefano.r@variscite.com>
References: <cover.1788180142.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_055052_205144_C18563C6 
X-CRM114-Status: GOOD (  10.52  )
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
v6->v7:
 - 

v5->v6:
 - 

v4->v5:
 - 

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


