Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B27CD149C6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 16:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xKMe0kTY9Xwhvqu9PTgbz7NZVWtehoaaceI1KFjE78c=; b=u4hUvqMu2hj73xqgkrAdKlHBp8
	qwwH+yqK2+eFYzQCeeKBx+DhKbfBWAvbuOolwsFAzA9CjQyEDyrmhU3fXBBxM9++LydfLhXyYiZk/
	JCpgrIDjf7mJwoyHOImdryNg0HgdKP3+nBW4YFrb4EB4flbkf7o9uzOCLrJldiLxhQuI1qifCjXdF
	lDdyQaBfFETROMx0HN6K0x5Aif9LwJ3DVTCopRCMhVJRIrhp0sh7AyPWil4/dTc5s4NAGcFpdYo26
	pwCx9VthXkOzf/dgbj7wUnCmTwd3xts/U+LLh4wj8+t/ocAAKGDX80gl5dvR8CBAvCh0IZh6sNa2t
	StA4c1eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N9N-00000004RD5-1hOS;
	Fri, 25 Oct 2024 16:26:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N4Q-00000004Q07-2Lcu
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 25 Oct 2024 16:21:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender:
	Reply-To:Content-ID:Content-Description:In-Reply-To:References;
	bh=xKMe0kTY9Xwhvqu9PTgbz7NZVWtehoaaceI1KFjE78c=; b=Yw9yx8iHSknG31GLLD0M/lY4vf
	iERA3VqjY2k/eiobgB6MuD3/ZwT60ccD9XKLae+8Ll7xtfbMhj0nWpTCVWEjY/BWPdBCM6Nfuug9+
	aXiV2EUAnBI7qG7VLD1yEenCEB9qGUfq0BVFFao4uvr2X2xrmC4M9TqMgj6c/EpnubM1kzVQBCJsJ
	7AB6TVOBmljoFN258LIGGlLl5/AnIPpV0x6tubQ8kT8CyfwkirmzaMw74rYmuG6d5fitWg3VX9tbd
	rKhDEqTaqqCJzLX3PGKLC7sPFgvE7LhFMBv4ePyuAndBM1Qijq1Sy43/hdLUlnOX78PaH2l91Ig+u
	MFp8KzHw==;
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4N4L-00000008z2Z-2X6o
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 16:21:48 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4314c4cb752so21897255e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 25 Oct 2024 09:21:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1729873302; x=1730478102; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xKMe0kTY9Xwhvqu9PTgbz7NZVWtehoaaceI1KFjE78c=;
        b=lchQ7g8xGzuRtzZ45Q3X3ISDb13oiHabNtl7fm3ugfRaD0hbkMwXyLLr4rIdqhcRr0
         HWX3iDu80QkjMs0T4v95f5jUfQEqyfbXeT34HYWqu946czRVh5jidsNiuM26G7XtKh9k
         5Xew4uNVnHtdVgk19PqIa9DjDRSlyXMzJEFdS8WjhoyR39OQg2uwuTMf22Vse1NA+tPm
         W6wY0N0/n2s8x9N5ABK2etT0HNNW8jbia9FpoioLg7XX8PnOMHi2G4dUtu14a1MeEH6W
         ANVBCEKo5GCvdQaS0aUKHlWRufWPIwiW0aNwfeunhxnBSIySGr+ilwzVhFVuYkMU9eCh
         so0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729873302; x=1730478102;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xKMe0kTY9Xwhvqu9PTgbz7NZVWtehoaaceI1KFjE78c=;
        b=hn4lyaTqalhF0rDCtF4YL0JF/04DC80IIvwQdLeCyAD0j9idSUzqxJhU9flg7d+V+2
         KsqLnilNj9hUIWdNwCVhFORkVq7/XOIBf7xV+gzX59xZMXBPv+iPEjhQ6y7Q7M7akIze
         CcitrN/hon1PzyqpG5kNG9zR7CAr3C3SiaDeUYXNtbt3Aym9QbMiPBj2AOWikswVCRNc
         /tqtucQ8DhMgrfuN/dc45CMwp7t4/ndNPtvDTz7XSr6i+UFNenOGabxzqHUmrvN7LX/y
         Udc+G1YDv6vmen1QDW9C4EcQ9qPhvhcz75FiAgjBM+tYcIgXb5lKhcBXTMUNno3LjXe6
         shuw==
X-Forwarded-Encrypted: i=1; AJvYcCVZDnfk1eC9JjJf1H8RsP7XZchXLsIhLkvAmORJNOW5BLLAE8G7sM4IktwmbweC5gEqRtvZtwfRDAnZCbQ1Fi8i@lists.infradead.org
X-Gm-Message-State: AOJu0YylmzO7gZoFRU7uaGaNSB6ZZ5aQht6AupgJkePTd0P37nesuA+l
	8ozHehepls/2KGBV2G34GFqJlt0qnEhowM1Q79HZ7E04w+pcW37vrEIXf6v4Y3vhFIeyQbd/ZOc
	WB9o=
X-Google-Smtp-Source: AGHT+IEvBNXGVxmL27N28gPJzfVMQ9d1oUlz1dnIvip3TXWHgZAWbblC123aTBWd1euJZj/YLE214A==
X-Received: by 2002:a05:600c:5490:b0:431:5d14:1cae with SMTP id 5b1f17b1804b1-4318415fee0mr86584145e9.19.1729873302024;
        Fri, 25 Oct 2024 09:21:42 -0700 (PDT)
Received: from [127.0.0.1] ([176.61.106.227])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431935f6df1sm22322915e9.35.2024.10.25.09.21.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 09:21:41 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Date: Fri, 25 Oct 2024 17:21:40 +0100
Subject: [PATCH v2] media: dt-bindings: Remove assigned-clock-* from
 various schema
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241025-b4-linux-next-202041004-i2c-media-yaml-fixes-v2-1-1b4535174a5a@linaro.org>
X-B4-Tracking: v=1; b=H4sIAJPFG2cC/5WNTQqDMBBGryJZd0omxP6teo/iIiajDmhSEiuKe
 PdG6QW6fG+Y760iUWRK4lGsItLEiYPPoE6FsJ3xLQG7zEJJpVHKEmoNPfvPDJ7mEbKWu9fAysJ
 Ajg0sZuih4ZkSNLYprbRI8uZEnnxHOg558VVl7jiNIS5HfcLd/kKo/gtNCBKMqmtUBq/3i3vmX
 xPDOcRWVNu2fQGLDFeI6QAAAA==
X-Change-ID: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Martin Kepplinger <martink@posteo.de>, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 "Paul J. Murphy" <paul.j.murphy@intel.com>, 
 Daniele Alessandrelli <daniele.alessandrelli@intel.com>, 
 Tommaso Merciai <tomm.merciai@gmail.com>, 
 Martin Hecht <martin.hecht@avnet.eu>, Zhi Mao <zhi.mao@mediatek.com>, 
 Alain Volmat <alain.volmat@foss.st.com>, 
 Mikhail Rudenko <mike.rudenko@gmail.com>, 
 Ricardo Ribalda <ribalda@kernel.org>, 
 Kieran Bingham <kieran.bingham@ideasonboard.com>, 
 Umang Jain <umang.jain@ideasonboard.com>, 
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Dongchun Zhu <dongchun.zhu@mediatek.com>, 
 Quentin Schulz <quentin.schulz@theobroma-systems.com>, 
 Todor Tomov <todor.too@gmail.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15-dev-dedf8
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_172145_881340_D585E1C7 
X-CRM114-Status: GOOD (  18.69  )
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

Remove extraneous assigned-clock* from media/i2c/* schemas, retain in the
relevant examples.

Link: https://lore.kernel.org/linux-media/j7kgz2lyxnler5qwd7yiazdq6fmsv77kyozdrxf33h54ydakjz@uqjhwhoyv6re
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
v2:

- Changes series name was: media: i2c: Cleanup assigned-clocks and endpoint: properties: unevaluatedProperties: false
  Dropping the second patch in the series means the title changes too - bod
- Drops unevaluatedProperties -> additionalProperties change
  There is no clear consensus on this right now.
- Adds Reviewed-by and Acked-by as indicated to patch #1 Laurent, Krzysztof 
- Link to v1: https://lore.kernel.org/r/20241012-b4-linux-next-202041004-i2c-media-yaml-fixes-v1-0-a2bb12a1796d@linaro.org

v1:

On a recent schema submission I did what most well adjusted schema writers
do and tried to find a base file to work from to copy/paste and forget.

Confusingly/predictably I received feedback to remove or alter several of
the properties included in my devious copy/paste plan.

The first bit of feedback was that assigned-clock-* was to be dropped.
Removing assigned-clock-* as assigned-clock-* is a core property which
doesn't need to be listed in a schema.

The second bit of feedback landed on use of additionalProperties:false
along with enumeration of all required endpoint properties instead of an
implied list of valid properties from unevaluatedProperties:false.

Link: https://lore.kernel.org/linux-media/20241010-b4-master-24-11-25-ov08x40-v6-0-cf966e34e685@linaro.org

This series removes the assigned-clock-* from upstream sensor property
schemas and applies additionalProperities:false to properties: endpoint:.

A few missing properties: or required: are added to the schemas based on
output of DT checkers.

The one new DT complaint I didn't fix with the move to
additionalProperties: false is:

/home/deckard/Development/qualcomm/qlt-kernel-tools/qlt-kernel/build/x1e80100-crd_qlt_integration/arch/arm64/boot/dts/renesas/r8a774c0-ek874-mipi-2.1.dtb: imx219@10: port:endpoint: 'remote-endpoint' is a required property

Since this appears to be some sort of temporary/commented thing upstream
which I don't know the provenance of.
---
 Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml | 8 --------
 Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml | 4 ----
 Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml | 4 ----
 8 files changed, 44 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
index 60f19e1152b33128cf3baa15b8c70a874ca6d52e..d18ead8f7fc43bfacc291aed85b5ca9166c46edb 100644
--- a/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/hynix,hi846.yaml
@@ -28,12 +28,6 @@ properties:
     items:
       - description: Reference to the mclk clock.
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   reset-gpios:
     description: Reference to the GPIO connected to the RESETB pin. Active low.
     maxItems: 1
@@ -82,8 +76,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - vddio-supply
   - vdda-supply
   - vddd-supply
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
index 1f497679168c8395a94b3867beb49b251ef621fc..622243cae03caa5d14aa312df40ef5907e190d2c 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov5648.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: XVCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - dovdd-supply
   - port
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
index 8a70e23ba6abed67d8b61c33bd7a261089bddda2..382d7de7a89bcea11be384a2a3800512994f9346 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov8865.yaml
@@ -20,12 +20,6 @@ properties:
     items:
       - description: EXTCLK Clock
 
-  assigned-clocks:
-    maxItems: 1
-
-  assigned-clock-rates:
-    maxItems: 1
-
   dvdd-supply:
     description: Digital Domain Power Supply
 
@@ -68,8 +62,6 @@ required:
   - compatible
   - reg
   - clocks
-  - assigned-clocks
-  - assigned-clock-rates
   - dvdd-supply
   - avdd-supply
   - dovdd-supply
diff --git a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
index 79a7658f6d0547e4d6fb2267e5757eedf49fd416..38325cf318f7bd2cd60a4c7bbb6a65b54b855e26 100644
--- a/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/ovti,ov9282.yaml
@@ -27,10 +27,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
index c978abc0cdb35cfe2b85069946cf1be435a58cb8..f0f9726a2add89492b8c56e17ed607841baa3a0d 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx258.yaml
@@ -24,10 +24,6 @@ properties:
       - sony,imx258
       - sony,imx258-pdaf
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description:
       Clock frequency from 6 to 27 MHz.
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
index bce57b22f7b63bd73f08d8831d9bb04858ef03e0..872b8288948b2bba743f2365a55165181df156ae 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx334.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
index 77bf3a4ee89db3b5d16149470c0380ef8f1aeac1..38bd1c7304a59bb5fea90954c1e4e626a7c86f2f 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx335.yaml
@@ -24,10 +24,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency from 6 to 27 MHz, 37.125MHz, 74.25MHz
     maxItems: 1
diff --git a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
index d9b7815650fdb890418fc96c828acc9147dfb6e8..ece1e17fe34553671e61c965eb1833c5eb08131b 100644
--- a/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
+++ b/Documentation/devicetree/bindings/media/i2c/sony,imx412.yaml
@@ -26,10 +26,6 @@ properties:
     description: I2C address
     maxItems: 1
 
-  assigned-clocks: true
-  assigned-clock-parents: true
-  assigned-clock-rates: true
-
   clocks:
     description: Clock frequency 6MHz, 12MHz, 18MHz, 24MHz or 27MHz
     maxItems: 1

---
base-commit: 58ca61c1a866bfdaa5e19fb19a2416764f847d75
change-id: 20241005-b4-linux-next-202041004-i2c-media-yaml-fixes-fcf5c0c1e08d

Best regards,
-- 
Bryan O'Donoghue <bryan.odonoghue@linaro.org>


