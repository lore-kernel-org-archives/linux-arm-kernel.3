Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05097C9832A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 16:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=; b=OKYWk96TVhtckG17sp9+qK03qJ
	jp/wm1zpqAzuEBr0Vqn2h09lMkQWWfJWNnU7KBjQGp+ujABawJxCfglj1avFHWaidnKpIwlx5htwf
	iDVA/GabwTgVZmlpKnaUBYIJTxMFCMf+udL5/pn+wlVqs3DLLtF/xaSKEUe/h5fv7AJNAnq/r0Jys
	FLBm8QOG30xoL2sdKtaX5hZ11CUtqurXtkuSCZzRxe2zWLaYbL4Gx39zQ+BTdqut5wCyIHfR89A7l
	JON8IhQhuSRiSGWv+lmZ/E2Jw5UsrQTrw3NSYZaPj9UUbauPW7y/V5DVmjvT25eDLUBrCHt5xQ4+R
	qXTPv38w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZag-00000003uyd-44r4;
	Tue, 29 Sep 2026 15:17:58 +0000
Received: from mail-wr2-x10.google.com ([2a00:1450:4864:30::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBZaY-00000003uui-0a8w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 15:17:51 +0000
Received: by mail-wr2-x10.google.com with SMTP id ffacd0b85a97d-4843f22dcb8so3279670f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 29 Sep 2026 08:17:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790695068; x=1791299868; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=;
        b=qmDGAG6r6ncLroIbkHoUkcAZi+KMtY9cqqKxiczlUhbWrqUyAH6ZZcD95cVOQktaMw
         Mjlrm6ccKDiFI7LRPO9fQMt9KnkiM0Y/TDiQtRdV6ZNsCR5aYuh24jf5rDIuMyh1a/bI
         eMEVIqHJbnEZWScKkyfjolA0+uXzr8fFK4o1a2ykvjzsTCgqbb8W7sMRA1lP/h2l9yyK
         br1VLFwUEHx2Bygoj+8WtDpdB2y755wrbLbkuldjwq5X89zpb1akmLBWDzdL94XX9OYj
         oUsn1sPd4VadC5kbKuOH9o5Gdebs1X4+OdJbY6RORMsWccPtsFVLs3W6KOMZhuVKZPSX
         IczQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790695068; x=1791299868;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhS8YlnsGyJ9HS0RFtDMzIqZYstk1VURk3XTCd55V0Q=;
        b=iwsHa4MRPzapMulOCdZ7ZqD6VvdRUFAl4V6vbhhrZJ8QZ1N9cbwR56pPwrCX73VCgL
         3TsGLM1plXqmz4HJjrt64n7g9SwQAWm3SmWRRe6eWLVdkcT4VDFAczNNdLoVz2hamgNV
         hLLYs3XJmX2dHnM4dIt8qmhY0jFr9pKAkp5jvnfJbM9QGMHHPZJ9BHbEd8AT3JsxohgF
         K3jWkL2gXK7KTQ9LGk3Wo+PAHIyGuf3BnuqTwDCYUxw1Uwshp70mJKbusuETDgM77zvS
         gjPzIbja0cxowWtF2zsNa0bZ/KNpbG3YwD8/OybdlhWrQGhw8Z0VPlg4U6oHNhOHTDFz
         kmiw==
X-Forwarded-Encrypted: i=1; AKwUvBy9hn9hS0uv+VCEsqNuUCjo+PCphl4gdRxeq+3SPL6+CqhkHiuDIcMJJQUUdZFIHrzHFzGhVtQRUTjxC5qGWBYs@lists.infradead.org
X-Gm-Message-State: AFuF++l2LwiGr7L2N+w3+dEqG9RYqdhK8VW8OpZLim8bQzPdL820+6Ny
	k/6UUptxSSoNGsDRKc1M/pEXXFXDZuRK46nX2oq7cHPVK/6eRqwpkDDO
X-Gm-Gg: AYBFou2+mdbkLcHoKlUa9XV6fTcy2jUj47wTumEtvlVuVxnes1ooYf+tEv150Y70stN
	70JeZFK1XVFAwC87vOFihQGKkQ9Sksl0mmoY+rTfQRpGOXq2pB9TqjAl8jfSr9yMSOeLtL1ikoW
	HofFEpCrpgx8pZiLAtEG0di8k721uwt8/XlIYxHmhcfDkkM9uhMCmFj9NDRtkTmjCt19fiQnYEa
	FnoeXyBU5QJWicZHdQSs2Q+T/ffjI+c254ZMfcRt6TcM5amomRCVO7cxjcvAmfksJ777svypIAI
	Xzl8Md62IxFIySeQkwoIaFUFcr9wAZ3MtQk9+6Y8Dr+t88UZDNrxBVThS+QAV5/UFwsWIIVvnuz
	Cu+R9H3gSBLUjComvPgpDPgBxJrSB9CvE8+TjrvC62fZc9C/sLaBtdk1flIxjhEOZlVe9EZuAZH
	irynZpXJoGulXz+dOVlyiKjLm/48IPVvPJQniaxOgEhxz+bQew4a3UaR09tQA3DAjzLszTG+BUT
	huWefTigu+JGJERvCU6dDZ0Q/rFSVgT255Hv3oklU/rjLklMGBaMKufxwLGSjt7SgCv8hMpT42B
	jDte0Re6INPgp2/5ey++7Q==
X-Received: by 2002:a05:600c:8486:b0:49e:745d:c317 with SMTP id 5b1f17b1804b1-49fe66b426bmr281786245e9.12.1790695068130;
        Tue, 29 Sep 2026 08:17:48 -0700 (PDT)
Received: from Lord-Beerus.station ([31.27.155.43])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a013cf8402sm10313705e9.2.2026.09.29.08.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 08:17:47 -0700 (PDT)
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
Subject: [PATCH v4 02/13] dt-bindings: arm: fsl: Add Variscite i.MX6ULL board variants
Date: Tue, 29 Sep 2026 17:17:29 +0200
Message-ID: <075691831d4da249672c3141ab16b9e856ee42da.1790693249.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1790693249.git.stefano.r@variscite.com>
References: <cover.1790693249.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_081750_213483_17048EBA 
X-CRM114-Status: GOOD (  12.21  )
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

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
v3->v4:
 - Split the board binding by SoC, extend the existing VAR-SOM-6UL
   entry with new Concerto and Symphony variants, and add DART-6UL.
 - Drop the redundant -board suffix from the new carrier compatibles
   and use sorted items/enum lists.

 .../devicetree/bindings/arm/fsl.yaml          | 39 ++++++++++++++++++-
 1 file changed, 38 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 233687131adb..9b1224091e01 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -834,9 +834,46 @@ properties:
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

