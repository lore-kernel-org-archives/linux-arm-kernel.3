Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9904EF8FEA
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Mar 2026 14:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDZV0P10JHiS3PFCsjMMTuxBNi7S5uJQ9QvuX7DlB6U=; b=HSy985j62nISvq559/FII5Xstw
	h5O1HkP8m6vony1NQ7G87gR/XrTqXLFv9TJb2vK0NZ2EpdI1a/+T9LMxXzs/GiIo6mygzckCQzptq
	e/7+aark580u/7WrPbWkQHigw1p5jmrlCP5knm7xxHXeJcwV3g1OQMUItt39Bz+x0yhNleLXdchDq
	PE18fi6NFslBze2vqxfaGTDhrm1ZORFlVE4YMtKSBYJB+/ahrztiQDtPY/MibEQjJWDDLCtdG1VeJ
	u9H1WqQFaNTKaNrMWhs5IwmFGQjabn9EDmkuW0kFIWbsvKW6KCpMzOljEfHq0eSpmJpDqEAeUU6IR
	dHB+C1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqz-0000000HJDw-2aMk;
	Wed, 04 Mar 2026 14:05:33 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmqr-0000000HJ1p-0Ye0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Mar 2026 14:05:28 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-483a233819aso67917705e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 04 Mar 2026 06:05:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772633123; x=1773237923; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KDZV0P10JHiS3PFCsjMMTuxBNi7S5uJQ9QvuX7DlB6U=;
        b=QPycpSm/cjJOGP8xk/oBW6Spfr5NtECWfovliONwvmq73X2kfeBxkTubr8tVKoC5sN
         O8nQXXNwqYsjKWcaWu1/bNdfWCtOgTBaM9Wa4uRRkMSq188EpyqUUMC3BCh6HIloPJJ3
         KKvv7QUYD+eF8j7XuFDffbVwt/rznv8N6QMQwaZCR7jBm7yvE2D5KVYD6M4Kz8J6Bfok
         UKnhLHpWENajvdkWIHrNK2nHUKt5Qtt/HE2WsiHihMhUXMztUXFXKp/RthJZJUYI5mic
         6go9op5VGoeXvhTW7Hxr3wy0db9dXMi0P5zupXzRUzp2SVwYGOo2nCQDcuFNOW8i39kr
         5dnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633123; x=1773237923;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KDZV0P10JHiS3PFCsjMMTuxBNi7S5uJQ9QvuX7DlB6U=;
        b=CVTB0ax8KWT5p/GcYyYqNUmDqy5RTaDWDlvkfHvAUiWbdZvgenhGxfxy1HGzye4bfZ
         6O84vxMe8xv0maIjOSEoC0S4yPlENP04WMhTq79fpEe6iAAus5jdwwQYSwVpGbXMBey6
         QF3kSt0J9qezABlg4SLwdA880P22/VwZCob9P7gPcjuM9/v9BEwV8qGjWSCnSaXGDtII
         VTxImdH+xp41uRvWpHeEz4f/E1uZxSeznG+UY6+pbYsHti2OU6s+dXRXebY5u7jqzYmn
         z0D7hSowk7MmPuI3IlKZaxQEByW/lWHWhd+9EubyljqUpWogo5+GG6OaZ+aWqeX1qSyG
         YAhQ==
X-Forwarded-Encrypted: i=1; AJvYcCWWs/CAbk+sCl9tGAV7UFk9QIcwfSjK9fC/stscIjukNwtaLrHn8ocorfwdQJNxoDe07rDxGSOe6wlr/QW19zVZ@lists.infradead.org
X-Gm-Message-State: AOJu0YyaRWyZnLjp96gml3jbqKRcMHRUMDjUF4Eyhq1L2ezAxIJPNeJE
	kJgdlMELolA58EQIZa64HQ5b6qYcD3oeB3lTwlyaUrbv47NGQ/TQ8NQWZzjvyrgB4jE=
X-Gm-Gg: ATEYQzyuRpxTwNmOOEhOhAXZ4b80xq5358QxfVpVhVE6ZUr7tkPYRAOmwRMpPz6seLg
	9EkqmedqfdDVMaFUex5nPPDxYMAn4ya+5lFNWYI4/Y5q2TWTsXiBwBzrqdfw6fgUWIzMmk6WT3z
	SL1pij066ojJXhl7kgj3C/PylIVMGKtUvV/m84vsB52nsuukwRcxLAFPOgWjRf706jXlxV+PMJj
	nbt68+2pnWZ5zX09j+okwuQHLnFC7lWQwjisL+o9hs7RvlabQHOkXciIBXWGLRXAFRltJxcAK1D
	wCZy7lYuRQl4fmT0s7tX1mcWfKKzr4booXubqxLvdcQm4DpdVr54+tebZxe27rtv/xLDQmAD7xG
	Qe1OX3haDDoHkJIKE4CQYFDyvkXJlU+SdVzDPhsy7w2RBz1GI4KKtm3u8ETk2XPwf5oUPxyw6Mo
	XdQW/ZjVZH2+xa+Q==
X-Received: by 2002:a05:600c:1d05:b0:47e:e57d:404 with SMTP id 5b1f17b1804b1-48519886971mr40240665e9.16.1772633123129;
        Wed, 04 Mar 2026 06:05:23 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-485187b6ffbsm59296165e9.2.2026.03.04.06.05.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:05:22 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 04 Mar 2026 14:05:17 +0000
Subject: [PATCH v6 4/6] dt-bindings: media: Add the Raspberry Pi HEVC
 decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260304-media-rpi-hevc-dec-v6-4-93868ae6dff8@raspberrypi.com>
References: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
In-Reply-To: <20260304-media-rpi-hevc-dec-v6-0-93868ae6dff8@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060525_228953_16DC625F 
X-CRM114-Status: GOOD (  15.10  )
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

Adds a binding for the HEVC decoder IP owned by Raspberry Pi.

Instantiations of the decoder IP can currently be found in
the Broadcom BCM2711 and BCM2712 SoCs.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../bindings/media/raspberrypi,hevc-dec.yaml       | 72 ++++++++++++++++++++++
 MAINTAINERS                                        |  9 +++
 2 files changed, 81 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
new file mode 100644
index 000000000000..fe3361bddd1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
@@ -0,0 +1,72 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/media/raspberrypi,hevc-dec.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Raspberry Pi HEVC Decoder
+
+maintainers:
+  - John Cox <john.cox@raspberrypi.com>
+  - Dom Cobley <dom@raspberrypi.com>
+  - Dave Stevenson <dave.stevenson@raspberrypi.com>
+
+description:
+  The Raspberry Pi HEVC decoder is a hardware video decode accelerator IP block
+  developed and owned by Raspberry Pi.
+
+  Currently it can be found in the Broadcom BCM2711 and BCM2712 processors used
+  on Raspberry Pi 4 and 5 boards respectively.
+
+properties:
+  compatible:
+    oneOf:
+      - const: brcm,bcm2711-hevc-dec
+      - items:
+          - enum:
+              - brcm,bcm2712-hevc-dec
+          - const: brcm,bcm2711-hevc-dec
+
+  reg:
+    items:
+      - description: The HEVC main register region
+      - description: The Interrupt control register region
+
+  reg-names:
+    items:
+      - const: hevc
+      - const: intc
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: The HEVC block clock
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    video-codec@7eb10000 {
+        compatible = "brcm,bcm2711-hevc-dec";
+        reg = <0x7eb00000 0x10000>, /* HEVC */
+              <0x7eb10000 0x1000>;  /* INTC */
+        reg-names = "hevc",
+                    "intc";
+
+        interrupts = <GIC_SPI 98 IRQ_TYPE_LEVEL_HIGH>;
+
+        clocks = <&clk 0>;
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 4d7e31232eeb..7c641a4f91a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22045,6 +22045,15 @@ L:	linux-edac@vger.kernel.org
 S:	Maintained
 F:	drivers/ras/amd/fmpm.c
 
+RASPBERRY PI HEVC DECODER
+M:	John Cox <john.cox@raspberrypi.com>
+M:	Dom Cobley <dom@raspberrypi.com>
+M:	Dave Stevenson <dave.stevenson@raspberrypi.com>
+M:	Raspberry Pi Internal Kernel List <kernel-list@raspberrypi.com>
+L:	linux-media@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/media/raspberrypi,hevc-dec.yaml
+
 RASPBERRY PI PISP BACK END
 M:	Jacopo Mondi <jacopo.mondi@ideasonboard.com>
 R:	Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>

-- 
2.34.1


