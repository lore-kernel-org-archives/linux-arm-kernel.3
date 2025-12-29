Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C51FE92FE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 21:37:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=; b=eENacraGCUfiOlwk/yOFaHTNb2
	AgEEL1O8bD1+Xv5Xv2e2caUpu11yLPP3JSPRolmuwb84bwLp3gTBaP0e7Uw/7FWyTxafAsJWe9LRU
	+LJJsG7x5E2HmDHp9xhLnBmmreZh47dKXvUnhp2X3Ej8uCL8IGXDUBgi2/F8G2BHdBK7w9kZhyX45
	Xra2c0hX4RqxtxE9s97nMEunKbsImG2RH/CH1LHw+SifjEyoIwpKy358v/C6Wrh7eyN7vWyii67tr
	JrTlKR3I81iSsytyxewYIUOSpKrJXJxw1hOBgUEJEoITnYYl87zgZkWFCx+tLUufPOyFkIFl2/Uuh
	bzLQaXJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaKvt-000000045TJ-2j0T;
	Mon, 29 Dec 2025 21:37:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaKvq-000000045S3-05UW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 21:37:39 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4775895d69cso39657885e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 13:37:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767044256; x=1767649056; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=deJtT14KjMPrCKLCNncxraMtzIJ078xCpVc+yNss2XgZgmfsGIpaIkfKTgkAe9kk2O
         WIuOdLlmV2wWpxJpPbbpuws5ft/9MRiE75Nl3ss6VAHum+1gDjPz8gs6CknDEjlPGfAS
         D1mAmw4UnTyDpgK52KXuJx8KBuE8K5qS/ChrGJXyQ8dxfbygx36kEpTIVjrgMwySfcH1
         vWtR+pYmIyf8RJSmzH7+z47kLz6NmOdxJobES5Hl3fRkw6/3pcrZgx/eMX2XiIiPjNMn
         JrQ4gc5jwz6+ut+r6Xv0/9WlP8FZK9jWw16hQnYBtBHQtomvnw2keA4kHSky+B4uMjPD
         lvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767044256; x=1767649056;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=VrmXmGn3kdlK9woZD5AO1ovXliyYLNgSPa1p6e0O2iFb/o/q4lsVYC0P7M+o03vDP9
         Di8SDuZqjrlE+Fc3vQ0IdaHaAuyxJnKVSElFMXZ4oPH5gjNwJ5DmIJ8JRFUbHY78FN1W
         nyBvG2jmfKOci0GnhvHtxiCcL71Nxmypm8yJ+KIceZ/ShSh+ZqWuZec3p2kwBOTRVDEE
         TfrD44x6Kwuz1aIZgE/w7HwNsUVLIihZpGUUNz7C/Bc9z72bOu63hTf1qJ5wEuaHjcQz
         WzUB+lFgfyzkq0TtSsxDV94pQAeyH7lZa3RaYKSUeoZ6T4qTkacNoeFPy7pL6XTkRkFN
         OHeQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKCAPQK+1OyGqgA0BGTdddQhYEe6kENKPpGqKE/zAA24HmXsXNP73Zq3KEzmgeJ10Rh1HkA0j0YGNhoznJo/x4@lists.infradead.org
X-Gm-Message-State: AOJu0YzI/P2pKQz5PsODWPutbN3n6BcIf0UptqI0we/lXUMlL/0+K9yN
	ZPFxjXnJvvEhTE01996ZRGiExm1RmJjZvNROUg1GSZMKK5h9HPHNXDXz
X-Gm-Gg: AY/fxX6Ws8AHr093lXR2xNABkLXWh+f8oltYGM/7s1tJogiQ9fu5X4ocUlKBGhfS0Qm
	JIQ/g/kVx3QGBJ207Dbzey4LJTIiuOkB9ZSqDog7Z3uU4Y0zk3tzQLXeejj6gjdxogv4OXYQ7Xj
	2zKk568sGEXgbD6q3cYdmy8yy2c8/2m2h6n1xiZwlgQi7GdzRr5+zy88FsSfInN5gsB6yr02aar
	o3j/+mCubJw47acf4+gGjLY42oNXQNzlMZrAvnGzn6g2tbmSKDRsb2LeKzWoNuSyOpk3X98sH2Y
	m/V1A/AO9DaLC4avk6a7ZxcL9ozQKjpeTe0Q8fOISQlpwiukP+xt61hhGgZXBC6l4Vvxw5aSIay
	Np94oNzsJtEDO4QeeBtcS3+tBu5tIIa+4APIh9CfOgvjkyBxO+fgCb1BlcaGR6RzsFFUcJCyvtz
	Ic7GKB8ro8rA+x/sLZCmr5QorXxcLJ2k+Lb1Fk7qspzzd4fa5j8D0DmPAY2FBFie4gJxswsvm3b
	T8zFp5WN9RjQn1iteUh
X-Google-Smtp-Source: AGHT+IEM9dsLV55UGCsXY4JibCS2ViZO1P66ipFVvqFYhEkKmsY1uN4e6nM9TXduuaQlPfzsV4ViRw==
X-Received: by 2002:a05:6000:2c06:b0:430:fd0f:28ff with SMTP id ffacd0b85a97d-4324e4d3764mr42020757f8f.26.1767044256097;
        Mon, 29 Dec 2025 13:37:36 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324ea1b36fsm64046230f8f.5.2025.12.29.13.37.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:37:35 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon, 29 Dec 2025 22:37:15 +0100
Message-ID: <20251229213726.79374-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229213726.79374-1-stefano.r@variscite.com>
References: <20251229213726.79374-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_133738_091411_5B569AF4 
X-CRM114-Status: UNSURE (   8.84  )
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

Add DT compatible strings for Variscite DART-MX95 SoM and Variscite
development carrier Board.

Link: https://variscite.com/system-on-module-som/i-mx-9/dart-mx95/
Link: https://variscite.com/carrier-boards/sonata-board/
Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 68a2d5fecc43..2a957a593abe 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1449,6 +1449,12 @@ properties:
           - const: toradex,smarc-imx95     # Toradex SMARC iMX95 Module
           - const: fsl,imx95
 
+      - description: Variscite DART-MX95 based Boards
+        items:
+          - const: variscite,var-dart-mx95-sonata # Variscite DART-MX95 SOM on Sonata Development Board
+          - const: variscite,var-dart-mx95 # Variscite DART-MX95 SOM
+          - const: fsl,imx95
+
       - description: i.MXRT1050 based Boards
         items:
           - enum:
-- 
2.47.3


