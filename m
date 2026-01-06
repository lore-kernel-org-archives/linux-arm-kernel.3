Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67117CDC19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 13:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=; b=37sl018zv8Srvl7q+H9NiEu8WD
	tHqrQ5m29wxQs5jeDKi2OEvbU8XzUumCrZjygb5FOFN5kKuwDQI5Q+9Qh1LpXSxoDUm7gI3wPBTDu
	rEa1vlZBG2b0vtHdCn1IRAc6zZWQGxyGuvqeumddieV4UgCH+iWDGTzUgI9OvoY+IfTqe07u2/kCf
	euCIeBRnEd3cpaJJu3TiK/uEjDFMWBT9PzeT3fkeW4myWfAcnrhnh/ATOC99lwxSqMkicl0XysSQJ
	fgSOjr5owrd+htSLb2yhfxO+Kz6EcYPJt2gntdn6fTZ+6lWV7xoIvAbgYi39MwIXTdUTiDekAVn/q
	r4z2NBNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6nh-0000000D3QX-42Zy;
	Tue, 06 Jan 2026 13:08:41 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd6nd-0000000D3PF-2rVT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 13:08:39 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-47d3ffa6720so9332855e9.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 05:08:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767704916; x=1768309716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=NzvW76BcEpBP8lPve7Rf59iAX9q4xhU11ne0/9IrtHjZXNrTraRmdy1GENIjJKoygY
         qMeczmpBoaOei1z4b/zktVBLhE7hGLq9W/BacVGtzUsyfkVGDhngTsY+jsRgAjPbOoAK
         9m1xPrkSqBpieVSaBGYWdorJ1PdwL+h5GaLNoiAfIc2+tE4TyO+4KEAwonzOuT5zW83V
         riKJD1F15pEcUlu+Srao7yXl9hLnGof1r00ZAuHAqNVRHQQJjhzHjQISuXLnVdW6DFSI
         09gXDX11qapMiw/1UD2QdnFyEeVhJMwjQtDWcBHb1qzXCP6JIOnfubx7okPQf5ruX6mZ
         vWWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767704916; x=1768309716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=CN0WXqehr8lcm8r1HW9MNX782wsSNIlc9MRuKIjWwsM4oAwcT739ujvFJrkK5JdlId
         XG4cihhxkSEzfrHbjtk5mc4Q0yBz1AGPaUIm6i5JeEdgsqCdGFsMjfBaFFPVIkF+FXXH
         gBKUSENp03dDLBlmXQfKqZyNv7rT6mO0m9cK4vxFjJ4Pl4BXxlMu42FAbvyr+5umrLMA
         nthQk/NXOlGg5ukWEYPzU2r6xBmGgUgbNFM8A6Tec2a4tnO9Ka6QCv75haSs3q4Adxde
         LhEl7DNBbE3NPwj06LIpe5HGpZB3QLS0/BAoP/npG3GVmP/qQMXtAabfY+lNyiBQoqlV
         4jVg==
X-Forwarded-Encrypted: i=1; AJvYcCVX4MlcJP0JsL5sc2v51RzBw9tUh0oseoVlP3Yc870+Yv1DDIGQQV3hiBoy3xEtDkmii6jM9fypm//NH6h32Gac@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/J48lcbARB4+WEyFAlL+07jH2cBDd/7ngNaSe7WLP/LWGRp0S
	58BRVAKuFB2qdYm8qkR8AyUgkA9j1eutUsF+6hsY9soVPK8PDSYW7UWN
X-Gm-Gg: AY/fxX5j902XhiC6G2QeJBLprVNT9FCiu2TMVF0XJzSMDAVCYhHRz4qriL2PpFMCyrJ
	khpi1E5e9Rd21tRMOzTMTGOTsMhOVoReWoV+Kh2bFwlFF2bj6nT4aaE6aWr0EKMTW9p8dw36AdL
	m60BBYdcYbHszw+IoPvnGAdQN4O1/ZLkvhHTg1+UvWGjPQ++JuDhCvtM+Ipt2iOA2MIN/NNAT6i
	Yc2OHgH8PphTIaqClc1LFCcMPGKSwGaRcD3jvBXVudLWdyMT4qdML5j3nUVlwJMYR3cIpd3V0VL
	JnrxZYoF6OQ8VIcBdIjyk7ctlryicWXBlbhB64Ww+0Pc6IuOuAJVEi17kO8GcOTBYoG3oS95DO3
	I/BQTCN3kgA8t//Vntvo22Uq/R97fkosD5MsRmWwkGBm9oHXupoUIj9l0qXyL8mvjEkphugKTtB
	vyr4VgaFKGSPmnxOlzUC3h6c+3kN2PH66zqe7lXPh78XDSwWaPvy23XZKfFnkr8C5+gfkZf5nb7
	ZrmwpCdzN8k7wgmAjOHyYTwqQ==
X-Google-Smtp-Source: AGHT+IF3dwzodQVxu/OJ1KFwSm2ssmdCm4Q/0W0IwVXzXdhGRs95TqIkNDIchCoIlCEBm89aLRYtuQ==
X-Received: by 2002:a05:600c:a10f:b0:479:1a0a:ebbe with SMTP id 5b1f17b1804b1-47d7f38038dmr21927105e9.14.1767704915405;
        Tue, 06 Jan 2026 05:08:35 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d7f70bc4fsm41601635e9.15.2026.01.06.05.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 05:08:35 -0800 (PST)
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
Subject: [PATCH v4 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Tue,  6 Jan 2026 14:07:30 +0100
Message-ID: <20260106130741.91532-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260106130741.91532-1-stefano.r@variscite.com>
References: <20260106130741.91532-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_050837_748038_A92A8365 
X-CRM114-Status: UNSURE (   9.35  )
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


