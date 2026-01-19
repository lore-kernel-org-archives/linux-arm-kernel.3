Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFE7D29C5B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 18:36:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=; b=3y7qQRhriL78lPKBJZtObdal/8
	QexTgQ5rb1ZyF/6HQTdHeBV9CXMlej0iYYVOs4Q/L8jkBKkEi95xeaP9F4dEF4tIYQSaxrcLWv2++
	Wnvbh0WMsFjUHABKa/+Exaj5la0uyh3XN3YlwE9CEiWvT7MhjV+22H4GaNWocP4VppMdhlinpMRvQ
	SPf5XirFzUXb0C98W5E+xfxXgxlU/oxZWC+BQmFkvqBLdh8jzcreQf+vx/kVBqWD93qmSCUy7ojwR
	yirg7noUWFpr9BX/NKHJE+IvD4VJ/vZ7ZAUexXiioebVxlkHg1twCZeO2AofYI8KIL4on5ixgyxcp
	eHYcdauw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu70-00000002iZQ-3GNr;
	Mon, 19 Jan 2026 18:36:26 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhu6s-00000002iXm-3bJA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 18:36:23 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-47ee76e8656so53273745e9.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 19 Jan 2026 10:36:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768847777; x=1769452577; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=Qod1CShaPOtd32QP6/eap5wcpiFtq5DBTn71UX7RpOxNLQMqk23ua5Ir5bnFjXdlsb
         31UiDKNak9898mDTsQ+ZX3in9tZGG3itc1+nhnYWdE6Oa5Z2m0P4/okc499C79z1CQxF
         dcC2vlFFrHYa5iyeMrertK+k/pR2mi67v6mVdvuPReMQLU7aOAl0MoRMzIvHOjWPLdk4
         SiaNifbSC2S/6c8NyIw55e8OAjA2EzwuCqRWslhqxmVIwFZm+uPib9fgq0GAHmUV1ulU
         MTx6pDHTnQvN5gdud/p7SndEZYTNBnSJuMiqJ5NJmQPl0MEek8XPViBhwSkNePeU6/9W
         +6Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768847777; x=1769452577;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FPwTSdKW1xUCjAG9WVlRLUU2FLI+RpdIfRh7InwteVs=;
        b=kYHAWQZfLU90f/pAGxPwjTqEwO065J/W9WKXVIZ0qoYPGF5UTbrQkwzPf+qTXhCUoc
         6xJrW4hLcoBYjzrvhn6tMEHQ5C1uWFHB1F/LuJ5T0D8fWuHEBxL1c+8I7dJDBoz16A0E
         LkfnfFaNxmbQc1Erdlwz0u/gHn/o34hVOELzuc9xzusAVoML3AqAhkjBYbHYpsqXsTs7
         DWCRVAUjAJ40xAtOzOrg/GK0Jxfx52mE4oSDSO1gZlNlhVtYuu7/wymZbAGdV+HIwx/d
         YsaMsHjyv9/HcmEx1567kPwuS7hBdA2958TMeR5mWtMm7XrMXB3O1/JsplxqAzMN09UR
         1WwQ==
X-Forwarded-Encrypted: i=1; AJvYcCUM64GHVlOoqxPRStohSUZkM5H1YlNKyfOajoVWKSt1pyNksF5A0r70TLM1if+ri8cu24cTc6DVtIFfs2CCqtKt@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZjBu/JYzaZ/lXFwKmSZrKRaoUxIHCguaKsHbXVQHLEFJKWvw
	DhHNC5igzBIpyJfLNYbcMxpnKo+pIKQOIm5wJaB0zKSALONk18Sf91V4
X-Gm-Gg: AY/fxX7oqweutsujm8WPOEwEUXtMYsr0NXOBKcXHCzuFofuq8JRymILAR8iiUK4+4TO
	XgRd2+E3mFXGleNFMIVTVk59oT9VHr7F5GUMMr0PubayQHp9zSAgXE7D2DyM2hHzwb+gRok046l
	RWOicz/blq/Z/rwb/lamLkGgSfpeOOExdPZ1uhdkBHgLpM0u41PpuRHjY3SF7QQ0ozMTKL6G+nG
	OkbjLMRBF3jfrbO+2ndTxsbo4JpZ2ejknoEaSP+Uk1+7kwzZ+7IaRkuRrBKfvncoQY2Std8b5TD
	FKK1qmRnGrn0TmxRtJL/phsLXYErQUXtfGT6RaK1dYbzmlJCL28EbPFKeQ+qYoJI0ZouyD+jfw5
	Xf+74IkhYTLMkB1I+yBfQ52FrSnjbRdKTExwhNLmWlq47iTKWWPp/ZnW4z8smTKz8vOV9NJlSpP
	zfVgms43BfzxYZSo+T5ioMr3T9PmAyYjgUmEjj7CM0NzBmsUrsmaxQkiboIGDcTfn7Jw2jaoys8
	2lbzbGrvN+VlROaM4xWcGYJhg==
X-Received: by 2002:a05:600c:45d5:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-4801e30b8a6mr161135965e9.16.1768847776628;
        Mon, 19 Jan 2026 10:36:16 -0800 (PST)
Received: from Lord-Beerus.station (net-93-151-204-73.cust.vodafonedsl.it. [93.151.204.73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4801e8c9cbcsm203965015e9.12.2026.01.19.10.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 10:36:16 -0800 (PST)
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
	Markus Niebel <Markus.Niebel@tq-group.com>,
	Primoz Fiser <primoz.fiser@norik.com>,
	Yannic Moog <y.moog@phytec.de>,
	Josua Mayer <josua@solid-run.com>,
	Francesco Dolcini <francesco.dolcini@toradex.com>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: arm: fsl: add Variscite DART-MX95 Boards
Date: Mon, 19 Jan 2026 19:35:53 +0100
Message-ID: <20260119183604.88192-2-stefano.r@variscite.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260119183604.88192-1-stefano.r@variscite.com>
References: <20260119183604.88192-1-stefano.r@variscite.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_103621_805571_E3428896 
X-CRM114-Status: UNSURE (   9.03  )
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


