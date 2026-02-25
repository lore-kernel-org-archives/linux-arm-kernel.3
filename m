Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F13CFFD376A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 17:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=; b=Wofh7nyAQpzfZS7xOIpF8aZBYU
	uGIDnYoff3fUi+1N3M2gtQ3a5+Q3ckDEhS7cfYAJKd7tIJP79agWcqu/5hr/1wWUAFZXCXuf5VUns
	MadllVbtLGuXq/ShZfsliNj+SZf+LVYHvhMYEe5UqD+J6s+NX6mMfcRoADH/yqBLpmy5vLK/1+vOm
	pFcAfwfFydJKfELf3D7qg5aLIVef9lt4LmpYKQmetR1QrC/Gvpn4qfTS7Fz4MfZ194kDqeNeddGaU
	8+vQbrPusDFojg6yxqSZQ7snrweHMSbm7+0Y6DSNs4Ai3CMcFWETswoC6jCf6dz4GyiFaovtcVOCJ
	l1DDKTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIIv-00000004bCb-39tg;
	Wed, 25 Feb 2026 17:04:05 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvIIr-00000004b7c-1mpu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 17:04:03 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-4398d9a12c6so1009378f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Feb 2026 09:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772039039; x=1772643839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=LmZvhwm+Xk0pV19bDD/izg0eOhGEQD1tBLaADwL6HdPdH+v1oa7G6Viy41sZUjbE9Z
         IV+T60cdXH+9QeKNmkF2qi3PoyiMpkyU17fnJjgy3wKfntaF8koMYCtnqkH/MDOaAUEO
         od9MJggRq218vxdQdUNYASp1/UaHUrs9gQnCuyuilDn0N+j81FA/rnRn6TjJRev/EP98
         VmdYuVbLHVadYmSai9URsO4tWnyKYZ35xCS29IpR2ELOIXvLanQkzcvD57IPzZ8Qvpds
         FJbnTw1rqXz8K0hYWhm0ZIWAcR9BSOJQPZxXwtDF8NtAfyMQyWRyRZJVf3Qij1RSGW/R
         +7UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772039039; x=1772643839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=ZzcBMI+AcV0xh5sfkbMbuZiKJiDrdrg0Bc0kj0idDAFfvgP+sZTBoP+aluxkXpYPdn
         uIyUFz49MLVxqzh41tsckYtCFPbmDveDev98MJJbMfeEty5r6ZLk0EvXJiDC1bJka4lJ
         g1g2ngw10feAXw76o7FbOWnRbjECKOxwsDvY587Ha9GSsnk18i1vTo6IGzjSwd0DkEbR
         Qx+eLxrQDKq0nxc57g7LLfQMddmpKXQ85A5byijf/qnVr048lJgVHqtSI9Ja6JvWqHgY
         IR4Z/UrmhCLMy4LwThSow36GHhTB914w6nHDSJwk1g+8j7mqwtF54WV1SiZN+qGMkGRl
         PhwQ==
X-Forwarded-Encrypted: i=1; AJvYcCWExFLNl+LoqaKEoR+5huEA7IYDSwblI5fCRuRn3zbG5KwVIQrr0RGncTDGrVyw+zx2EehAVgNK4y9L+bx1lz6I@lists.infradead.org
X-Gm-Message-State: AOJu0YzQttfLRwzQjjnhD/ap42Bd5aOUpjaXtxvv6HUba4nDXq2nZA1r
	EMi19naVYFYRSkFKlDlwnfM0YxB8llVGdyjasUuHiztRAS7MJZBdrir2
X-Gm-Gg: ATEYQzzeDA5w+WWnMH8HIpKaOb6C7fE0tfCHiCb03GReIbPeNZp4PKOPFW8YR05Jz2h
	CUW1AzwRMfqci3FU4eXv2y7G3PGMy/s+neQ+m7LURCb6jxzV0h4TdFW3C/xn2MoiHWtt2pvtdhD
	khs5zlaSfrNNs+QLQJQ0CgHb8uPyqj/MBTgmu8bjgMUlF9LrbFmDzW+5oLMcqm4X4wOE5ge9lJS
	IzsHGLePqumiSJNXVO85N81vuyG3hnsdkWdEwT6ziNwOPZ2V479sylGM9ss6QXYOoKBzOgvN/vF
	4x2AecwxqWoXhAU/zQb9UzXfaNVA1APwqnM0X33uYkgQdbubgC+bHkOMimNuI24vZmZJsOwQlJt
	rZRzilR/3vBc6SCQoAt9jY6a8PurOee4pSQIo5LBnZu7vfg4F275HP5wP6rkMAEyQqkAK+/D/tk
	IPB/OUYqbQZFjjI4IKMZOoWCIfq3+q+axd8lK3h3LvNtVXNgS4KAa33M3mx8ZamOM5FWZJ7ig9M
	PxJ17bfQhYx6tENhRoQF/DpbT0P1SgUFJ2vyfw=
X-Received: by 2002:a05:600c:6094:b0:480:3ad0:93bf with SMTP id 5b1f17b1804b1-483a95eab61mr271791555e9.24.1772039038835;
        Wed, 25 Feb 2026 09:03:58 -0800 (PST)
Received: from Lord-Beerus.station (net-188-152-100-94.cust.dsl.teletu.it. [188.152.100.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70b3f3sm88276935e9.6.2026.02.25.09.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 09:03:58 -0800 (PST)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Stefano Radaelli <stefano.r@variscite.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
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
Subject: [PATCH v6 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Wed, 25 Feb 2026 18:03:36 +0100
Message-ID: <20260225170347.77841-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260225170347.77841-1-stefano.r@variscite.com>
References: <20260225170347.77841-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260225_090401_499306_8CE29E87 
X-CRM114-Status: UNSURE (   8.99  )
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
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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


