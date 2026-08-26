Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F4DBC61DBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 08:16:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=; b=JoQCXcRNAGZ0tJaq8Jby0fO6ZD
	TVDPypRL/7nejxrtU5dWgqJiJM3JwAl7NXeewaUjU6S2AsyV6CNDZTk9YqtigH9YgfTjlDuCiOY8f
	V/sy6pYlcbjLmLeZe1QKlgfOCd8u0dpufWB/4Ft5meUA1Kr21V4bUalnki372x8QzMsp0tlnzIcp7
	WOXAMZhDftY+/Jmd+NzCSANQd/V57IDTZcKgsQ1Egb64m4QFQ05Ltf4/EVPIKmeeX7Arv841LEWiA
	zpW36k0eY66m7qsm9cjX25pteOW3KqcdQ3vfhg5J6PLRam3cmZewhTFa+NOFkbpQO/zpYFfzZKh26
	ozHdKDWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8nm-000000024Op-1W81;
	Wed, 26 Aug 2026 08:16:06 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz8nj-000000024N2-0wgu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 08:16:04 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-c2529b3139fso29857666b.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 26 Aug 2026 01:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787732161; x=1788336961; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=;
        b=GCTIDpM0bEMfs/ZPhwlj11BUrQM1Fs19cHTRCPq7ggme5R5BezbgUMZpdT8KJNWZmK
         ndZse/F082Db9aWgiGdVKjj6S2eeeNYXB5NyJea1NazAwchdf4yXznPVzEzTMy42NvPf
         1wePNt59SdTKujuVXZoWiAOTvcDv5pFz4L/sNZ8bf4kClPNmsRh51lvAfDSYFvqGBuSF
         WfYjMw5QgddF33t+6ZVbscxFtY5jeGqvOioIWCroJayZ82dWb3LOXXVWE9xCCLgiYbhQ
         7tCUiGopWWkFvO9NxDlLujUkA7fyIB77LflHSnpwyoOxAb+DGHLmnXVZIM3GM/1EsHzG
         ShAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787732161; x=1788336961;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zB08SnEagvgroJBWvO8F5zjbyavejq+4YlAWaJHBEM4=;
        b=scrHDG/RUhvMs+kqo3Udvcyb8DjHhS6951e1yT/9mTcUvvotbzDQJLGu9kGQHpNOgO
         gDaa2Sd1BJEaezcmRRpYE0RVd3jaBCHe3iDIVeY6W4uNtl7DM3SRonKUCnxVqIR/3aL1
         2l033TY1K+/I9sf8nr4q1zIZl3vne6OJRK9ADlavPdr01jML//wOgVZq4ykVsS3qjqi2
         JPA7+KifB15kFO9ewbd+EXQFWYgRCx9l1rti2gwLYCafXLLtRpBg1Y/bpl51FKmGjgO3
         m5ndwDLkexu2BdecdhlbiZuuw7K4361BH4xmD3K5tuwEXa1ZbIM6vvyoS+m9aZyuTFoe
         4phg==
X-Forwarded-Encrypted: i=1; AHgh+RrCpGOIFOK8WVWR5/EsXSjicQoM24rFcJc8ijA2YZFJ49d5BPrfQVjRfuxKdfjIi/dXC7oY53ImII5C/tpoBHcD@lists.infradead.org
X-Gm-Message-State: AFuF++mLiAOz+Ps/MoscNtHVBsi/DU9Ngi1QoI2Ji5XDPTuWNjFEEQq+
	Mi01ukNkQ5rs8LDB+3L8szZ3m/dYrNJO6yImkztE60HVohjo8Y3uqEiK5R374hbh
X-Gm-Gg: AR+sD12dlGbecdNCzECmcGuTl0LwC7ioj7wO9MYdhxVUSj/OrBxlsGGUcF0nuXwhLP7
	7YvloYwQqcqbHKzp+kgpcc2IR7Sz5juM5CZm74rEvVxL7UKpAKtwdgc9bpGXYME0THOBQJulTwm
	5P/hjBpHgigr49bTM4tcJQ/vjs9ryrlnjYfKVK1oyzmxmwO3IUKI+Yq6CN89VObsbCNkohf9f6i
	3mKDGwkAArrhUhQsOtW5wT0mFj1GemiUl5Or5dSXzI+xfHRtQOJOe2ZhijVb4BGEYMojBvbPcU1
	OVWsCa8nXDIS6z1F/o2KneIVsQmAuzM6NIY0c/ZqVFPaTmPpnA6MVJ79wjrsdSIGONYXBReLEO1
	IzcsP0fBxNnkHO3tymW5zxEfMZLK4lM8m024z/5575MdacobBnvHjdUVWijOvz0HDCqNyQTmT5X
	c8HBKM/209BySnonN3tNC36McbBKLuIYHnMJatIOqaGmFQXpho5jqbQ5mnTJlokp6+AKnoQDiU0
	cj8OnTJlPS0aNH8+HULjjE=
X-Received: by 2002:a17:907:3d44:b0:c12:74af:51f3 with SMTP id a640c23a62f3a-c250bb126c5mr640061466b.6.1787732160791;
        Wed, 26 Aug 2026 01:16:00 -0700 (PDT)
Received: from GLaDOS.station ([91.80.77.66])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c250a88ab65sm360997566b.37.2026.08.26.01.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 01:16:00 -0700 (PDT)
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
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Wed, 26 Aug 2026 10:15:35 +0200
Message-ID: <7af24e53fc6dc0e84a7d2dce7090f5c465f470d2.1787674237.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787674237.git.stefano.r@variscite.com>
References: <cover.1787674237.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260826_011603_292479_122AD033 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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


