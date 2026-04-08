Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1FEA10F9963
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 17:40:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=; b=GWMTcP5WpEwNsau19KXpCujLX5
	+wS9g0EnWY+JyRqW9FmWM2lrhAsL+rbS1UfUVo7IdcsBGRZlqQhM4bjSTdyPMOLi/90z2VUi5XhJb
	st4zzrVsDokEGhhhMnj3n0za7Nej/xpKNoETxqDxZrFk6iyYgSUUV73Oq58tCNuqfqUHxpodz5YJv
	ta8r9yh5rveshDK9msEA2gKkBSdclOY0+fS4j49uzE7b2LV9wvCkLOjmVl5MCYIICeHtkiYgNMLmM
	y+LMTSNk+E2rVyMIbL5tvrct/xB3QWrgzlx0T7Rg1Ru7nXZIXza3/9Aqk+ATDEOpsbLIK6P3od3Ao
	pxYAfbnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtR-00000009CcV-1uo7;
	Wed, 08 Apr 2026 17:40:45 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAWtO-00000009CZB-2x9B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 17:40:43 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cf7683a28so44462f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 08 Apr 2026 10:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775670041; x=1776274841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=;
        b=ki9z5BsFu0DOVK2e1Xvwih5g9cvjrTze5eJbFKdgWvSvjEcaRV4UHexozF/CI70mzC
         oun5XQWbjEyF9PDvAPydU21WkfRxynMqfVCwyVyugN6YAJ8fW9/O4QSfTNd9RF6aePa1
         wnFhMXAkCy/AhENBFwGgHXcvd8gQwB7aUj5OPKIOYKoN8W81mMfpRXhxqk49gMrvyzU0
         blECoOrVxxjW8Q68B8ccvuEtl4WpiYfPZWIsbMShSTJ3JCpoVgR0iRr1Y1D8177P93HE
         DjILCeDig9ZDwzpps5xBHCyIquRRYjjQKlxACytaClHW7OjVVGf5uChAuKEXkVirpQt3
         GEVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775670041; x=1776274841;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kBqPX62gE29RPUhtAwboPIfLOZlTavt7gFwp4D+1oYY=;
        b=qvvIsXgvvIwuur6LQn/UXbRvQRBPiDblD26RM2xYM/b9dWV3jAV8Wp8ubzc+NP9cPA
         HpANOLYp0/Y26+ImscIM1ha9Wv3w32LEXuiFvzYlc61LQCdso9gpI0CENjr/uLAu3zlU
         IRYNaeiXCez9WDhIH/SSP7IXl2o6sd8nmHaybgmJrYuN8VMEIqqSTFUEJs4D/iPHaKfp
         DC/0FcAwm3P3b6w/uSgI00CoeWKUt3ljxlmTvDPeOWg8sN/gi//94m9uqLhi7CONEQBg
         JhHXF9X5JbUYiXJKngxssraU5uxUKzeWmHoNDc9r+Cfc/Yyfe3Ep9H5Pm+YtfAY1vLku
         v3SQ==
X-Forwarded-Encrypted: i=1; AJvYcCVhNgDGNWFbQT+4M0YLta0qoigv1VXhVBRKXsLepPKsyx0GjuxnZcr7qqKc3Y3NJOas+be/9Ej6HzCmkm/AlQJ2@lists.infradead.org
X-Gm-Message-State: AOJu0Yz9djV2T+KuPMXKdMPPBayQhW7Rbtp0xrIgaIlh2UEZGYgEpVc4
	ereE19t/lhP4wP50Xr9FOr7kPzsThRPWr7F4GfMGaFhh1EbzFgaTZl91
X-Gm-Gg: AeBDietmT/dFAYoB3SzZXOrH/xHeaA0H3ttsPCigso5gLPCnK5+45w8Uz2SSU56akFC
	tMAj/KxB0cAqc1axKBf12f8H+qR6z27XlL0TN538bspJac2tJxbMh9eQSlrfEpcpKc54+xUs0mk
	2Z5uXKAKlNmje4490mhKtwmUG0gVvnTePy34rnh8cwbz9W8ot941y1goIEEzepEr4xsqPGqT4ew
	35NSAnNXY37BkhfnnhuhGG11hgPr7WE0gbT6DkT8HNQhQEChenuvRy7sV1aCehJadj0B/7XFnFF
	wVeak4vIqi82ZjbK4nItoND1AtgwmupyI21aucjVy7j+HriHgZfhcHF3Xj0eJLMRIY6aWiiXVKQ
	1mTRJalsJo+R0e99O7JliBvEjJ1C5M9TcqDEGM5MZZ6DV37+ddrJ8Z7YbEE/ICEv/2MwoDUDQps
	AIzNMvQPTMJzZ2j0gEp2lifrfrXPji+dAfa3HPDY6I6KOmcB2shRD3OXtbTR28xrdRo03rFw8WG
	d3slv7ZdQI/F4qLiRlNQPjXYZbMjErBmLNGZA==
X-Received: by 2002:a05:6000:1789:b0:43b:6356:7d00 with SMTP id ffacd0b85a97d-43d2927baf3mr31918164f8f.17.1775670040620;
        Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
Received: from Lord-Beerus.station (net-93-144-20-233.cust.vodafonedsl.it. [93.144.20.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e1fe0b0sm61774659f8f.0.2026.04.08.10.40.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 10:40:40 -0700 (PDT)
From: Stefano Radaelli <stefano.radaelli21@gmail.com>
X-Google-Original-From: Stefano Radaelli <stefano.r@variscite.com>
To: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Cc: pierluigi.p@variscite.com,
	Stefano Radaelli <stefano.r@variscite.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Markus Niebel <Markus.Niebel@ew.tq-group.com>,
	Maud Spierings <maudspierings@gocontroll.com>,
	Alexander Stein <alexander.stein@ew.tq-group.com>,
	Ernest Van Hoecke <ernest.vanhoecke@toradex.com>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	Primoz Fiser <primoz.fiser@norik.com>
Subject: [PATCH v1 1/3] dt-bindings: arm: fsl: add Variscite VAR-SOM-MX91 Boards
Date: Wed,  8 Apr 2026 19:39:44 +0200
Message-ID: <86635091cd5db0ecb7f07c5ad9d6f735ec349485.1775669847.git.stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1775669847.git.stefano.r@variscite.com>
References: <cover.1775669847.git.stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_104042_765719_57507AF6 
X-CRM114-Status: UNSURE (   9.46  )
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

Add DT compatible strings for Variscite VAR-SOM-MX91 SoM and Symphony
development carrier Board.

Signed-off-by: Stefano Radaelli <stefano.r@variscite.com>
---
 Documentation/devicetree/bindings/arm/fsl.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
index b29362cb650f..3c31e5167348 100644
--- a/Documentation/devicetree/bindings/arm/fsl.yaml
+++ b/Documentation/devicetree/bindings/arm/fsl.yaml
@@ -1614,6 +1614,12 @@ properties:
           - const: variscite,var-dart-mx91 # Variscite DART-MX91 SOM
           - const: fsl,imx91
 
+      - description: Variscite VAR-SOM-MX91 based boards
+        items:
+          - const: variscite,var-som-mx91-symphony # Variscite VAR-SOM-MX91 on Symphony
+          - const: variscite,var-som-mx91 # Variscite VAR-SOM-MX91
+          - const: fsl,imx91
+
       - description: Variscite DART-MX93 based boards
         items:
           - const: variscite,var-dart-mx93-sonata # Variscite DART-MX93 on Sonata Development Board
-- 
2.47.3


