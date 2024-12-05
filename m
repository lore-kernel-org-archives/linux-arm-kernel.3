Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7173DE7716C
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Dec 2024 09:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=; b=cb3RYnIgR4rBluYcDJeahOEg/b
	Hsr22kEZ+4tlSuNCnnm5RFJX9NcEt+PeO1DAvfPkUHHx7r/3zkxG3UGpiNZLT7bheyWuEsgmQfgGa
	9E/xJUYGEvdKiXEEAyiavOqoM7dFJBBMV9XREaF1suDpRBwx9Ow+E+tiOozi7/HjTXkPzI0ddMaxm
	XEXjEO5l//ZZgYq3/rOABAGa0MlSJGP490woVPT2actj4ZtnEZnDLc3GuzB1TuWTb0GptpQfgbMo6
	bDaWoQTs4NOJhKDh76F63RZLPApfkv+yAgydxjR7XDPpRnN4zQgbRd0z2rVwHhN/qbjbz937Gn0rW
	hLIcBknQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ8dX-0000000FQzq-2AT5;
	Thu, 05 Dec 2024 09:59:07 +0000
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJ6MN-0000000F1hH-3Bpy
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Dec 2024 07:33:18 +0000
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-aa5366d3b47so89433166b.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Dec 2024 23:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733383994; x=1733988794; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=;
        b=v+xwC7j1ftDJczza/XL2qyBwAgIa8UCAVBKbUvgOuuwdOghVHDWJvcVMQ+6AjDyPvu
         OWm754T12+I/RnTqt49YI4OL1cEwZqwGySFvaz9CoLslw0b5RoKMp/q5hFehBO2T1Dvr
         jHmDH9D5W9mKDtkuZQD9j9cFHsebl60v/C/Km5ieJ0Wtd5YoCZqKeBCO9pXt45PQRg/K
         C6Ygj84lszCXMwVq1Boiz/4BkrO6inB7EOK18+zkrNqDjdcoF5Fdqt8Zckh5sAFmM8p+
         4A+S4/XCCOclQl+vUHTpr2I4C9cDwb0RQ6zakrtTEuutRWOLcFGjw0+o5Jq/WS0gekOJ
         72KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733383994; x=1733988794;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPcp32i194zjkohuP3ghdoazYclk/zwkpzXjsI6FYvY=;
        b=H9se+7h+yQgfZx1Lh06udcmizV1a+0Xq+W6KzsICDUzQfMALbNI58YLWCPKDs5Tqwz
         5BakoOpIdS8n4SKuorpRKk7ljCJRxmvSl8fGpJinIiLB+WGI78VKlUAM/GKiMPZ3sdia
         sd2ALHcbJTmiGaKVV5Kz/usDOXS1ExOct2S0I3AVFbhLBgB7/eH5YfsIxjaZOeFKbmWb
         gTCZKCbBbcQ7qk4cgPcnXWh2BKKsFjpL8394J+xswqcvOP5V0DI7o9WYbtjENhTdwhfH
         kH7bx3TX6pcgFmzB3+X1NZpZqSnYAQm+imNfH7V6qHP00HwqKMRpytTNC9LbPHNv4mDI
         roHQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDENl+U2k/gAkhIAryyaGafu5I+j1rO/5q0EWS9WPUQY07SExMiGMtTrIl4wUNW6s5pYdr6TyuzZ8YJGyknNeB@lists.infradead.org
X-Gm-Message-State: AOJu0Yyi7UBLlJ8HGGpRaSmeRSWswktQJojtGokUGTLEjMDESdWLOGCj
	DSsvYrhv6stz0UicUvzMziXIhT0pSyaxHZb00tUfq5zFfrhHkx/MAWhst5kZXXI=
X-Gm-Gg: ASbGncvAAiF1cJMwIXdB/DgaS91DjFvzhHA2FWLI7YDAIIZOOnBpwDoYERcyK5pkLqc
	s60AtpXW5q3jFm282nRrRGcxTClo/wLoVe3oCMCuIz6jG4DBekURqSqt7kCRhH8H9owalke2UrO
	m/PdDQgSl7//6g0Yp0ockNAd+Wx6pCIXtc5/7eK5air9TyFCSdCHw2Ay1kL+9RuCqLusZkzLTwj
	vQ+DCIsU/xwtvvKSHqfLTu8O2n7r/etJ4UNMsx7Qs1sq9fzVd1ePooc6ZRYmQi7g+Q4BtTp4S6a
	SfmBdxnYJ3geP5xnNcY3z9XJQfy/8AIjBw==
X-Google-Smtp-Source: AGHT+IG2cRFoErHvd+1EuK9aLmhx/7F0pkt3orG+NahV6/yW750scFnzkpmch+QEqJyukIDF69QaRw==
X-Received: by 2002:a17:906:328d:b0:aa5:30c0:384b with SMTP id a640c23a62f3a-aa5f7d4d1f6mr732358166b.24.1733383993763;
        Wed, 04 Dec 2024 23:33:13 -0800 (PST)
Received: from puffmais.c.googlers.com (64.227.90.34.bc.googleusercontent.com. [34.90.227.64])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa6260888casm53371766b.133.2024.12.04.23.33.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 23:33:13 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Date: Thu, 05 Dec 2024 07:33:12 +0000
Subject: [PATCH v3 1/8] dt-bindings: phy: samsung,usb3-drd-phy: add blank
 lines between DT properties
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241205-gs101-phy-lanes-orientation-phy-v3-1-32f721bed219@linaro.org>
References: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
In-Reply-To: <20241205-gs101-phy-lanes-orientation-phy-v3-0-32f721bed219@linaro.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Sam Protsenko <semen.protsenko@linaro.org>, 
 Will McVicker <willmcvicker@google.com>, Roy Luo <royluo@google.com>, 
 kernel-team@android.com, linux-phy@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_233315_793492_9F48166E 
X-CRM114-Status: UNSURE (   9.07  )
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

In [1], Rob pointed out that we should really be separating properties
with blank lines in between, which is universal style. Only where
properties are booleans, empty lines are not required.

Do so.

Link: https://lore.kernel.org/all/20240711212359.GA3023490-robh@kernel.org/ [1]
Reviewed-by: Peter Griffin <peter.griffin@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: André Draszik <andre.draszik@linaro.org>

---
v3:
* update subject line (Rob)
* collect tags

v2:
* collect tags
---
 .../devicetree/bindings/phy/samsung,usb3-drd-phy.yaml     | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 16321cdd4919..1f8b35917b11 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -83,14 +83,19 @@ properties:
 
   pll-supply:
     description: Power supply for the USB PLL.
+
   dvdd-usb20-supply:
     description: DVDD power supply for the USB 2.0 phy.
+
   vddh-usb20-supply:
     description: VDDh power supply for the USB 2.0 phy.
+
   vdd33-usb20-supply:
     description: 3.3V power supply for the USB 2.0 phy.
+
   vdda-usbdp-supply:
     description: VDDa power supply for the USB DP phy.
+
   vddh-usbdp-supply:
     description: VDDh power supply for the USB DP phy.
 
@@ -117,6 +122,7 @@ allOf:
             - description: Gate of control interface AXI clock
             - description: Gate of control interface APB clock
             - description: Gate of SCL APB clock
+
         clock-names:
           items:
             - const: phy
@@ -124,10 +130,13 @@ allOf:
             - const: ctrl_aclk
             - const: ctrl_pclk
             - const: scl_pclk
+
         reg:
           minItems: 3
+
         reg-names:
           minItems: 3
+
       required:
         - reg-names
         - pll-supply
@@ -149,6 +158,7 @@ allOf:
         clocks:
           minItems: 5
           maxItems: 5
+
         clock-names:
           items:
             - const: phy
@@ -156,8 +166,10 @@ allOf:
             - const: phy_utmi
             - const: phy_pipe
             - const: itp
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 
@@ -174,12 +186,15 @@ allOf:
         clocks:
           minItems: 2
           maxItems: 2
+
         clock-names:
           items:
             - const: phy
             - const: ref
+
         reg:
           maxItems: 1
+
         reg-names:
           maxItems: 1
 

-- 
2.47.0.338.g60cca15819-goog


