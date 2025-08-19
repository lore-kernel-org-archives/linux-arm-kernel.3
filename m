Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7B8CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Aug 2025 14:19:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=; b=rUr76MTVfv3iFskT3MPF/hIeb2
	IAhMaFUimC0gmogRXymO0zn45cwg1j37ZS+2gQYP0766X+x58mKhzcrMHi2baC86zj+xLP6LKPd96
	5va+vpAZnsj9w07H9vMnIXw634lwrkET9rFjXdYjkb7Kb8qHIVnBfQY9XEAXMMIGyUpHAlMGo1v5S
	XFhMj3v1Puu+jlu4T9fgV7HLQhcLx7pCimZ26THtyJFAVVpRZ0fLHQ+hdjVTXFBjIo3E+LunEotlp
	FiB61oa5dricFu2SPRyQSpHM5NCnb3oL3xbuCGWwITSp0OjQx4hBBmwfLaRAXocVrO/W5yOIq7NZe
	2oyirXtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoNBC-0000000AjX3-1QFJ;
	Tue, 19 Aug 2025 14:19:14 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoKp5-0000000AKlL-2RaB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Aug 2025 11:48:16 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-76e2ea94c7dso5719144b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Aug 2025 04:48:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755604094; x=1756208894; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=;
        b=etPSyox4C1xZ0aCZN5aDUeJ6thcMaTaa2fzwJifPyrWFxrBs/3BdsM6rE6kEjAI6Dk
         DqLAU8pKrhCNzXUQsxeX+ZMPjLmMMomqIJCa1RQvFWwk7EtFDL77T4SiZQN5Z+3x1i4N
         aHvP/pFDwuI20FN/VoLTwIo9dzGKZc2I21cnrxIMD6Y9G5eUed34c69wKR2qan82BffA
         2MI+qaxW+mkCNgqZEuqjLixR+CSGihAttd1pk49/x2xyFHn6S4YfwN6tuOMNOmlkKsUf
         NMS6IvoTfEc5l4DFU421TGpICaz4MM7pIVA3UadATowjjXBbiAPNLfAZ2caf8N8fmqYg
         xBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755604094; x=1756208894;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FBxHD5/WjVJ+H6FOdZLWHLUBELVzL67VAq9dX93Pcug=;
        b=m4LDOfU+3ZtO11FzirfAqhswoE1nZ2Nu4lx1QCzxxXjxUNj6Ol+BoJmJlo6Mjsi/WY
         goipj/+GhgtQFuVDAbxhbznIqNS6KILRVGn1JDcwgktBdBao/rIcWQWlcq034nwleJ4z
         UpEa6obgam2y1GGl1JeLLhQ+NNo1bbhkIOR5Mde5TV/DQMSEwsNpFDg+P7BnvE+6w6Lw
         VqdMhtnLzLLzeNKDmyBg+qj9w2A2pCjN070Gys8mRXRQvZOG8pG2W259427qnERu0scb
         2lo4dbzoFnrLTLfKjWCULx8rHrQp6V/F9OxfIYqa1y+eLtSoo6i/BjukRZFcZzcu2vi5
         7XaA==
X-Forwarded-Encrypted: i=1; AJvYcCWI3a49iExgHU7oUsPeZJ2x0rPIEU7wk6MfQ/cz6aHLeZO39KaxEQ02FzWWQ0bvTbYeMPVy3VTHTND6IQe2KCbh@lists.infradead.org
X-Gm-Message-State: AOJu0YwdqU7R80LckoGzppX95SYmhwPkYjPOezZLI3lLC8dlUN7Qfb2w
	PNP43B39PrcY4L7fRGv0+wdWHYwGUzj6M6oL4dwDtohIidi6VQBUeZeG
X-Gm-Gg: ASbGnct8R58Qq/m9nq4Cewgb94eDCZqm/k6sVjc9WkdxuLVMA2T5Lo4VGjHGOPugPrg
	OWHkQaohDh6NE/en+2MKhmO+m5HtZEif3MBI64rSB/1BL66GWUMdlH9y8K8AOt4uwVMeGQzFdbG
	fac0WaMCilptFe46D9XK2DKPx+NDrWsYFDM35Kl6O7sDGAZGpoJsDQUKEZ80H7pgcT/gV4wm4Cx
	rXDFaolc0+DWAZEUco0jXNb49oy2pcxP0Diq4XtvANuZUpS8qmDp2/JK9lUkMzT4AcpjM8v1dru
	zAhSJKiXxZYkobMQfuYESRcrS/N2om+e6FfGSTo+hdKuTsAsuu7GKFMXKpuLFZMCeZttRShuPyu
	z503/C9EcX20aFBI2ivpbyJQwetv08keXUSELeKmCTC0+8wUi21wV4+eWYNO+iUZy4A+tOKJs7K
	D4vezpFSEbmntXnQ8=
X-Google-Smtp-Source: AGHT+IFjTYI7L8+Tc1wo47L6JKf/YYDxT3E6ajTWF/Wb72qSoljfkLbdAWqppksKIyFsvHI6OufsKg==
X-Received: by 2002:a05:6a20:e02:b0:243:15b9:7662 with SMTP id adf61e73a8af0-24315b97a4fmr453322637.60.1755604094461;
        Tue, 19 Aug 2025 04:48:14 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b472d76a430sm10286316a12.43.2025.08.19.04.48.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Aug 2025 04:48:14 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 19 Aug 2025 21:47:53 +1000
Subject: [PATCH 1/8] dt-bindings: rtc: Add Apple SMC RTC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-macsmc-subdevs-v1-1-57df6c3e5f19@gmail.com>
References: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
In-Reply-To: <20250819-macsmc-subdevs-v1-0-57df6c3e5f19@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3470;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=qrLflRK+GGZAbgfPL/rFlU+6xRQThTOb/YM9H8lO9nI=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlLUvLW/t9TY3X828uY+j3N4tfaNPs36lVfYtfSUT/vz
 aUtnny4o5SFQYyLQVZMkWVDk5DHbCO2m/0ilXth5rAygQxh4OIUgIlcnsbwi9lA+FqsqeAjBbeZ
 BrLPr01d/llLcuo8Nj1Wk7Ub5VyfODIyTOup3rVm68M7nlNTVf5xK6zZPSf11ynGC3bdnmIcSq7
 buAA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_044815_628940_DF58B091 
X-CRM114-Status: GOOD (  14.48  )
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

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 8a10e270d421ecd703848f64af597de351fcfd74..38f077867bdeedba8a486a63e366e9c943a75681 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -41,6 +41,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -75,5 +78,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..607b610665a28b3ea2e86bd90cb5f3f28ebac726
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa45799dfe07de2f54de6d6a1ce0615..aaef8634985b35f54de1123ebb4176602066d177 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2397,6 +2397,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.50.1


