Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21534FEFB6E
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 17:21:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFhgYto7McT5hzgK39BtOka2li4gXIYQIg2cIWRlQQI=; b=gwBtTPFG9n9dbdJtSCByvpxLhU
	Z7hnP/8HKfpOvyKbe4B695atJiZ3sSG42C9eZkdO2g+BRwFW5MsJY3uz9kIYy2pnQQYhpJnbeElVY
	sH81jITPh2MlLSPi7QoZzyNPSIIdfg9B7+vG7WQ4WWW/fiZSbwLtKwAJ0Rcgcai/f4fv6CihCBadi
	hNYq9eToLGDTj4V4obZ3xqJGqcrSrbi6of02jL6EIPpBGRggzaC2pYYFC1yTQOq91dDOkbV5+lRdp
	D+/ai69lwtXwF8f0zuGo2J13QYysk+USZqodPwiVkHFYSmwfzQZh0qks4f2ggYrnR5WiA1XwrZc3Q
	AePZBR/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WP-00000008nQ2-3bew;
	Fri, 27 Feb 2026 17:21:01 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw1WC-00000008nIP-0XJN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 17:20:49 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-48371119eacso26332985e9.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 27 Feb 2026 09:20:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1772212846; x=1772817646; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NFhgYto7McT5hzgK39BtOka2li4gXIYQIg2cIWRlQQI=;
        b=WwBx+jdfAoxmZjBGkCi2lGmiljCadmgaIN/YcgdPgfR4DNfcS4BSgkqUiEskJaMUar
         0Sa6mOAbK03ayaDAMkEkJwI4X4m5Bn+kglh6n9OAjO+4ABfbuCzxGspW/i99jJIXs4Mi
         8HxU5H61rsqoAH/sPWBvExjcSASclsqSMW8TQDeh1wrwb1BxHxz8Ar6U006zGafCzzeE
         4yeJCACjyq7zdeYW443UuZs/X2+9ZNXLykJkqaDXFxXBPq1R80mC4LDD+bOTX40D2mom
         InRciy9i8Yl6f+cUJzdqpO6GlJueBQ/1MuFUU8hFPC9q5geUJknJ3924V/AhpLdwVrcm
         /FKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772212846; x=1772817646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=NFhgYto7McT5hzgK39BtOka2li4gXIYQIg2cIWRlQQI=;
        b=hctSAKRW4D7fJxY+wPg+IpymWlNBdZ1R7Gi6urzNbC0M7RJ2JyrjkjTT3w0VfOAu0i
         /Kt+o3DY+DcwHCtInjFk97DC3ivzrsQnyskTTq6Jhb8nhdvm0lP5RffHj4SCnR2uPr4j
         shLDGuDjsDxHND++S4KZdNccAh1TyKFdZdL2VplkeTXUOBwoSjM4uG00swTdLeYe+Dqh
         FpOmQx902HvO5+LOSNGqWIKKT4HmpJec2glKalE52fKr0Ad0JKao93oMMVmgV/PTQk0P
         /1hz1JebGYOeC+gEYEEOvY2OiLH15YRj3CFj1DhAX1r13nv6Db/Dj2xUX7MW9f/wnHGH
         XIaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7cfQrOimh5C7yHb6hFVWSJK9xgEPtWrI+TrbJMSjQnBdcbPue27he5X+T99arbpQued6zysOMKdQVlMP43bSA@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0qMIFxWJgdw//KQLzxx4/rd0c7hsHatHHLGG+ApP8OTPDhNtA
	gvV03xfDgeOeIPlB5WtEXgRS9n3Ok2jjSYOxIUvnlC7kwvlk+2ZSJ498kSMfIeqZDKo=
X-Gm-Gg: ATEYQzz0VNN0rm/LGLoomleLJJ4G9AW14m/mY6tXX90eFfnEUJ4SqYkPiBsrVMVjo5I
	SQ0erMAylGbcDBtNt6PTnzooMfCgNpBCgGQ6YFvtkcOpqwjghywt1rIIt5Xs/x2ruCC7/9jFtfL
	XdbhfOSPkaXYfHrp3giVBNKhec3qjJAYJftPZJn/yiC591+RWjEo6AxsA4Ci2ZbRlmQenugn3u0
	cmTtr0xvwkZgXhQLKIHpEjyfMz4Xb/kyFpAhKlnc/8YsWIp80nlyZZEBeyQcRppp/y9Kd5L6CCK
	oLY5f385kHNzEIkPymXxCBiNr5GrzCFrBaGfWMk8Lxq+N6+LWrLAvSpQpHw6vkt/UluJbosKB14
	qgDh5kkpKLB80avNRwyoyoizE8bfJpxNhzqoRp+JvHWYhAHDFwMEYEqkfMVnYzt1uoyshZ4U+jr
	bVaWGdcMIekVcVgJElhbXKr2n0
X-Received: by 2002:a05:600c:4e08:b0:483:c12b:fe4a with SMTP id 5b1f17b1804b1-483c9bc1b64mr53097065e9.11.1772212846166;
        Fri, 27 Feb 2026 09:20:46 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-483bfeb932bsm60828075e9.28.2026.02.27.09.20.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Feb 2026 09:20:45 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Fri, 27 Feb 2026 17:19:09 +0000
Subject: [PATCH v5 4/6] dt-bindings: media: Add the Raspberry Pi HEVC
 decoder
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-media-rpi-hevc-dec-v5-4-9bb3fc1816de@raspberrypi.com>
References: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
In-Reply-To: <20260227-media-rpi-hevc-dec-v5-0-9bb3fc1816de@raspberrypi.com>
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
X-CRM114-CacheID: sfid-20260227_092048_219415_74333210 
X-CRM114-Status: GOOD (  14.58  )
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
index 55af015174a5..5d9a495a2b34 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22044,6 +22044,15 @@ L:	linux-edac@vger.kernel.org
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


