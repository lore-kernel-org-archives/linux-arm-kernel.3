Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6730C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:28:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=; b=FTSEAAdZ8wON0smsOnd8s/MuiR
	0JW7uJU1xuqW4XFW/dIgruAGGk373HtoAdslLFxotCl4dvtYFp/k5OQDMb5wAju/xkOsUaxapbztG
	AE0kcfWqNep8AmeenDLd3UnkGkbQZ7EpNrXjQ1jfvtH813LkTkIhx5xMKW7P+vt608FBzjeXXL4ld
	TCM5r77r+XB/BZxgkvVCF8Fv11O8FFdnqK3PaPbwraUDxPEU+rbqoCehfCCNPUcvAn9kVp8wHcMi6
	N5QR7WdDDcFsWAqrUW/bHIm7yMPY0tEQvbE/jpMaR98agIe1IYgQKGbXELBbtyUZDGDa3BCTWAAT/
	q+eX/y4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOM2-0000000DIej-2mRy;
	Fri, 21 Aug 2026 12:28:14 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxOLy-0000000DIcx-36yB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 12:28:11 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-6a1a546a6bbso1866848a12.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 05:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787315289; x=1787920089; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=;
        b=BegJFUTgWcI73BSfXbuIJXanmoXmy3ZsSB3rcQBgDi8Zpv5rEBhN27ChBJfJVBNTBf
         znyyEc7HUDZzJJv5izVTvsIP0UIQUCBieRfKQL7cKPRX0JQeMjb9EOOHZRywEfcISkZF
         m94eYIlZtUQe6VJH8VsHxcPbGJKpu+AKrA4KuS3ydTJS/uykzLBeBFyMAES3EfHkiKfQ
         tf1JVReWA5fsGVy4hFzIdTrsJy/LPBI00QxX7ECXHoHo+G3mDqxX8UGeN1yPY+ENL0Dm
         6fIB3XuF4dzbpWZDGk4/OXrySudp+SrpxLzhPOKTgo9JOtx99hZgK3+0aSscN3JYd8gz
         s3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787315289; x=1787920089;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=rnb1hnrwJYg9Ac5/Vnbdf4M0HUhLsGXMbMJwhXncPks=;
        b=dYy+hKlIGarFAvscbvHNc1rlvxM57/0kCZSdRqL2miYYScURngjbuZdGTEX9uNpk0B
         v0t8BTdSrWp5/E1MjDV42YQhSduX93i68X8GvMrd/QpdNhqQqBqr6diocSpKaMcwClKn
         RjWgbLbpLiKO8vYetIpPJcc5BERISnEQULINnWIKEtBOmgl2vX8plqz5lNYkuxaw4TJk
         xAt+rdgb2liLzvSyfDrrY/00Z6EPkLROyGRtJ+0OuA9yCeWPTTpqlfqXQPbvc2MvMZvZ
         lzA+VgHn+k7CdXJ6ffryVKQTtUT9ILG2JEfCJJLeQn4EYPGHULQEhjyMFLNUMhyePZ10
         S/uQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq98Vo028v4tX7bmBoDcTWyzJH/STohqYY4/Rm7faBh1EBZaiQlMHlzPbYetlTb0dtcfjCpj5UvABREzykNMZzU@lists.infradead.org
X-Gm-Message-State: AFuF++mz75AG/mStMugfYpvO3dxhQFynCdgBWrL/IOHMluOFRcJZOqSE
	frHOgR+UXl7gupA4ckhjaQp0tdY6K0hBygGBO4qebq+T6IspRLUAiTPv
X-Gm-Gg: AR+sD11RwZr0oTRI7/KF517J1Vem3ojdeyas7DsiiQR3mBOew985vQod2dvJJwLtZCV
	nf/hTpTmBAvkFql29IvUVHPXgLOM4Ls4bqzpkqQoiNtzlf8lg3lz/EJG6Rb+voxphCV6wT0xLnJ
	Lst66+5xBUw6a054SHRrYRW4KQUE3LzKYoct1ZKEvIxj6UMwmcEQ+CB68hS/aS0jl5n2LTsv3Yy
	N9hyEhFG7LkYm8AVHz1seXnVXYgm+K5gd04CDI+rhiBI8Qzx2CPfuCfpJFtbEho8C6xP8NII67D
	nUCShF7YRiCbFcmxWKaMrOJ8URsA2APuOat8bR+dy2C0BojWJcer6sGd9mXqauoeFeB9vQ0qF1K
	/aamaTLeu9BALNFww/KrSzLOy28EBhvhpLcHqBKMbq2LfKXAehP4W0Rzc3WkiaRiT8NBt8JlTur
	28XANLd2Sbhaw/oM0dzO+5UubH5dpvgHfaYxRzftsRSeXID/vUbQsrU1a5smzGHQxOhFmUR90UQ
	YPvbXRFke7tnRNs+QyCbZEFJMRwZr/uUMiFigw2yhRLY98iHuO5ZKISmq6kMWs79gcx
X-Received: by 2002:a05:6402:847:b0:69e:9213:11b with SMTP id 4fb4d7f45d1cf-6a42f1bca7amr5773872a12.13.1787315288354;
        Fri, 21 Aug 2026 05:28:08 -0700 (PDT)
Received: from GLaDOS.station (mob-5-90-140-38.net.vodafone.it. [5.90.140.38])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a3feec9c9dsm6608874a12.4.2026.08.21.05.28.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 05:28:07 -0700 (PDT)
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
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Hugo Villeneuve <hvilleneuve@dimonoff.com>,
	Marek Vasut <marex@nabladev.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX7 boards
Date: Fri, 21 Aug 2026 14:27:50 +0200
Message-ID: <2e7d5abd893afb7f5362a5b3b8ee83730546674f.1787314780.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1787314780.git.stefano.r@variscite.com>
References: <cover.1787314780.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_052810_797082_38C297C0 
X-CRM114-Status: UNSURE (   9.84  )
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

Both the first and second hardware revisions are supported, with
eMMC, NAND and WM8731 configurations.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index 656f2596e1d5..20a225420d20 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -950,6 +950,23 @@ properties:
           - const: toradex,colibri-imx7d-emmc
           - const: fsl,imx7d
 
+      - description: i.MX7D Variscite Boards based on VAR-SOM-MX7 Module
+        oneOf:
+          - items:
+            - enum:
+                - variscite,var-som-imx7d-emmc-mx7customboard
+                - variscite,var-som-imx7d-emmc-wm8731-mx7customboard
+                - variscite,var-som-imx7d-nand-mx7customboard
+                - variscite,var-som-imx7d-nand-wm8731-mx7customboard
+            - const: variscite,var-som-imx7d
+            - const: fsl,imx7d
+          - items:
+            - enum:
+                - variscite,var-som-imx7d-v2-emmc-mx7customboard
+                - variscite,var-som-imx7d-v2-nand-mx7customboard
+            - const: variscite,var-som-imx7d-v2
+            - const: fsl,imx7d
+
       - description: i.MX7ULP based Boards
         items:
           - enum:
-- 
2.47.3


