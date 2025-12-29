Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65DC7E92733
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 15:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=; b=vakgWzO+YCA4NmNVk3bPfVw4Eu
	u5BgU+urfVORl7l4BruIzLOp4XCB2OFkoJH4JtO39HOdvuGNu9ZAoDAhLcMQEBdDzQdeC3IsRfOSZ
	43CuL8oWvrjE3SFP4mX9lBQQ3AHfFLy4Uv7osRMcFP1vXXsrFseLVz8TfQqvCd3uZJJ5nSNVuNTn0
	2Ad7DKnJH5F7CShil/dcWWLHIbLiTdi4f+GOf2Pc5oQv3ZCRDbJ1SphzhBTOHcBfHxDZHWOzoDrsj
	8jrSrByTMA1i84w5OjYk61O/F0/P02+zCH1+S60+Tpxds3ANMyO6fXzVVLGRd+vGU1McedsyPihm2
	ExAq801A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEnt-00000003oiH-17if;
	Mon, 29 Dec 2025 15:05:01 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaEnp-00000003ogy-0Kqs
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 15:04:58 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-42fbc305914so6089615f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 29 Dec 2025 07:04:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767020695; x=1767625495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=MSEwbOWOFQfWt5VbjMD7smG3PsfHJ9Zgwqx2M0ZPTytQCFS+qdv9VMEPVNeqbcTr/0
         FEL/ai/GAAoh52B1f27r0Axy+819zAqHwp1lZbreYXsUurnlCv/wc1Cv4YX9TPPun/Qn
         GfaGhQhOtJCrILW1vm+rD+4vgSvuGq9A/GND9SG4VHke9fTgfDjsI5PB8vFpyYHqebGK
         2woxQer7jJox3Nnx9ySXUDgiR+jAggr2wQ28wVSQRWAMc/8/yVyhWtazfmUw3jSR2h+m
         +Jpqgi+B1KYNoV/ZIMyGVzBxZpG3XSt/mDylr9li9KR3MWXnrN7ReAvT1Yo5+dgeRzlS
         kmfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767020695; x=1767625495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uEMVDwEDv+HPhVXY2LXDlZKQau7yTOfmnEyR/lVD/RA=;
        b=VhFHRx8vMbriIESelNBO9Wyf2MKBtZk2ym0Oz0JIoGPNdvccCv/9BhQUfHwT/Sle7M
         KPuRv2gol0OBEk77CenYHOYSlxTGpzJWjpOQWo+ok8OtytxOWxwnPt5wEVpevahfKujR
         POPcZ4xiURR2pxBgg1sB8KnBosPv6nL5xT/DxqJLxMbZyIWbgiRyMvwTFkJBFUEouITD
         ujN9pPyv22GON1x4EwBee9YPuMWdcppsn9epr+nnZRZDQNsYYBaNUFWwh5dyhJJvDfgt
         xOpNU2oDeRWKqtiOrfrQmQq8cv+LHuhAVOokuEFLkOK2E+t46WUd2Oq5Ms9aLwe7umEd
         er7g==
X-Forwarded-Encrypted: i=1; AJvYcCV4ywDD/1TqquxD4fdqAAwqoBG+7WvMnJqAB675tlDD41djOi6prXL8yInFV2dtZFXLRe7TOxBO/1Kollzo1HQJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxqBZCW9Ir9kDVgdMQuog+a9IWGnVYQkUbxyhl00a9QR3RVVclp
	C2C3ywiatb8CEyQdboV+HvEZmuQGPDiL5C3FJMry+UIAs6eSO1VZApnG
X-Gm-Gg: AY/fxX6Jgux07KRvFZBEFexe1D0o8tQ/nQgmmflcHgBk3wDzSK8rXXK28bx1xpIdtkn
	weX71+94HOfHh3ZbDAvxJ5LFX6PnBK0s3Aa3w5MPQG90moOOppkJ27cHJHtlCthtbSg65DXUlLl
	x+gakLaW9pY7vEFdrkVlMs0R8UVwK7I5SxyVa/SKn7pATHFiv/CWdBlHjWcHw5K7CUiyEOGiX+m
	f8/wNeyELwqStDDqXgfEQMGohBG5W9LHucxZSjeAjGeaxf0JoyLWvTsNgwkt/mNQjUVjeJYc4uv
	ftaHHR6addZVEHipjVtiBdbug+2qgQucZ4M6JZMkOr3hJXDHNbG89VfUpIvvrPivkpb7UfDCuhW
	rioN/jg+iqdCIAF8ybVrqrox5lwQ/+TVssMujZvJuJ3d130PysFtlBcRdHvAeNy4McJqvS+qCen
	e5fECcwfYFOGvN2Lg3Kd/XCYb7vWIsuk0lWbPjrKWpMnIdJ/h2ONEIDKsdxtRNl0d4V4FU7lRkT
	3VL8nvP+CfsBTPZWKuY
X-Google-Smtp-Source: AGHT+IHQvAPLxhpI/fIrtRdA0CEG8n5wHY5t2lV2gupren/JOtxs3WLlDRopxfjEnT3s0+fhv7N8JQ==
X-Received: by 2002:a05:6000:40ce:b0:42f:bab5:953b with SMTP id ffacd0b85a97d-4324e4cbf86mr29308961f8f.16.1767020694920;
        Mon, 29 Dec 2025 07:04:54 -0800 (PST)
Received: from Lord-Beerus.station (net-5-94-28-220.cust.vodafonedsl.it. [5.94.28.220])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4325d10cc48sm52899902f8f.16.2025.12.29.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 07:04:54 -0800 (PST)
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
	Yannic Moog <y.moog@phytec.de>,
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon, 29 Dec 2025 16:04:09 +0100
Message-ID: <20251229150421.57616-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251229150421.57616-1-stefano.r@variscite.com>
References: <20251229150421.57616-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_070457_140283_7F4BA76E 
X-CRM114-Status: UNSURE (   8.73  )
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


