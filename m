Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 722C7D1118B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 17:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8TfK+4PegTpbC0dzvRLmi5aNfYCQa5XXLe69RiPnQcY=; b=1nmb2RDDumVO938mQFELmgcab7
	BBM5ZrbC12WgaTuhp+cj/V0x6gBNT6wEpY0odFesKVjMgOaIRY/zt4KrHehBd/cOSaQVoizYd+XPe
	xdBpxSBDwsbTGqGpeXiOSs4GrA4T0oZ9of4FkNdr7r4I7cxw0yFsHNX2pcFV3wI5G+hSwwunDLFsz
	bwe/F9IPrgX/daMNGXEb70f+8Kos2HwxoerXTRWzjDOP7NVJtSuyiB7E/NIr4BKXRqsbeKRGB/1k3
	C0Av+b6yc8pp3pElMtOGVYvFRfNSRbZ2Fo//GW2mdkWMOPaQ+hN+xytsW+6XCJ7PCeVXU08HaI3Ob
	L/9CFReQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJRx-0000000FOiU-2Z6t;
	Wed, 26 Nov 2025 17:37:05 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOJRs-0000000FOfD-2ooo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 17:37:02 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 653271A1D87;
	Wed, 26 Nov 2025 17:36:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 37ED460721;
	Wed, 26 Nov 2025 17:36:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C1501102F2334;
	Wed, 26 Nov 2025 18:36:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764178610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=8TfK+4PegTpbC0dzvRLmi5aNfYCQa5XXLe69RiPnQcY=;
	b=dbOe6nvTTRT3KyxTM0HZMVyjYxjsxEVyjrBR2sL0RV3JL/toUrH7apvFsou7CQSCyf+bVf
	Asoyscn89JIcI5txhm/zJ1Iu4GjPsKjKSIzB3sPyuWDxGYEbl2OWN2U91hd1+Xay2Lp+oY
	b3ZHwEyv9bzLzRGdcBj/3z7deDxy3PhUlKtAljDKtLoloZSrnf+C2LOgCnEAAAj2PIjGIE
	Mr9xnaDiR+swuF8PCQjwYvH5aUXC/gqV+NNzndsSGaPlZeJ/lIKYeI+Ei+tKoHo7l35nvL
	JALtExV+DFvkXaKBhRCoHlKl58B0+MLKkD7dhY8x9/fqK9C+I2D67PinkipMiA==
From: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
Date: Wed, 26 Nov 2025 18:35:44 +0100
Subject: [PATCH 02/21] dt-bindings: display: tilcdc: Add fifo-threshold
 property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251126-feature_tilcdc-v1-2-49b9ef2e3aa0@bootlin.com>
References: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
In-Reply-To: <20251126-feature_tilcdc-v1-0-49b9ef2e3aa0@bootlin.com>
To: Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Tony Lindgren <tony@atomide.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Markus Schneider-Pargmann <msp@baylibre.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Miguel Gazquez <miguel.gazquez@bootlin.com>, 
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-omap@vger.kernel.org, 
 "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_093700_850056_7023A97A 
X-CRM114-Status: GOOD (  10.76  )
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

Add the fifo-threshold property to control the DMA FIFO threshold level,
which specifies the number of words that must be loaded before the DMA
FIFO becomes ready.

This property is needed to support the da850-evm board configuration
which requires a non-default FIFO threshold value. Currently, this value
is specified through the deprecated ti,tilcdc,panel binding. Adding this
property to the tilcdc binding allows for proper configuration while
migrating away from the non-standard panel binding.

The default value is 8 words, with valid values being powers of 2 from
8 to 512.

Related commit: 55da73fa7a68c ("ARM: dts: davinci: da850-evm: Increase
fifo threshold")

Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
---
 Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
index 34ac1fd04d5c6..bf6d506e25e17 100644
--- a/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
+++ b/Documentation/devicetree/bindings/display/tilcdc/tilcdc.yaml
@@ -46,6 +46,13 @@ properties:
       The maximum pixel clock that can be supported by the lcd controller
       in KHz.
 
+  fifo-threshold:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [8, 16, 32, 64, 128, 256, 512]
+    description:
+      Number of words loaded before the DMA fifo becomes ready. The default
+      value is 8.
+
   blue-and-red-wiring:
     enum: [straight, crossed]
     description:

-- 
2.43.0


