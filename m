Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CDE9CD98CE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Jun 2026 15:34:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wbmalnm5VJpnaLDuaocsCfhfiTIsHFVDQa8Miy/j3e0=; b=ydJ2QCYSvBWzcFmckDM+ceCh32
	yTxV0ZsjzEf+48xWnjxiZhuZvXPFrjp9PvISvnJ5Zh57R3AvY1MdjJ/sxwnlIgIG8gxcP6S/9EA4K
	aYURCcwDJ0+7026oHhSRq3YBVTiTq57oSgRiOXRuq5AMqJ6t9BhL2V3MO3fUvJryNewuJFR3PiTvq
	4hgMIh4mZ5bO0P2HTIxAEHpk6wgtsIOtIwz2+YecRvFoBw0wKHWYKIBgJLK+KZsaD0DJIw3KzQKjq
	hqIhdqK4R8hnFE7JMNU6/DOqfcfbhGCU5bmWzkNhRwx3zf8NJd4XjqJoj3VQBJMBNKSnq2968PU8f
	fSKG8JjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3u0-0000000B9qK-1jLN;
	Fri, 12 Jun 2026 15:34:36 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wY3tw-0000000B9mK-3F0p
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Jun 2026 15:34:34 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-490b613a17bso9676395e9.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Jun 2026 08:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1781278471; x=1781883271; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wbmalnm5VJpnaLDuaocsCfhfiTIsHFVDQa8Miy/j3e0=;
        b=2dV1X/J8oH5zwGvezv+uLAD8YA6sZTcb3x9vvCFe3dYhDVXV1n4dCK7X1h5gHdVgwg
         dN3Piv1QJmwXVgpDlBsix4ctb3t1v6/x+jZGUyeqCtWFC8kbrxToosg0oLzYa9IiAzwq
         IAV9DHWXkZxx0rlrPVaRYbN1uTDYA12TtlLYfPj8gake15CleuODtnbUhyFpFwX9xCTf
         +VHYdI+16pTLVAQFltGiowlSelaymC/PQZP5ILONTTIZFlinhx5jmyqbgZiIdcq5aNeE
         XyhANj6DoSbro8VG+Cnb9bq+rcFFFx8SqP7P2QqoHJ2SqMvovNRe77iozATajEvdLief
         rf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781278471; x=1781883271;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wbmalnm5VJpnaLDuaocsCfhfiTIsHFVDQa8Miy/j3e0=;
        b=jAeT49jWTT/yFCfs4lgXnLrWAKFImJFuMmdXMXFkOvamxXor6b65OwBDD0KbQUpQ58
         DM0MVoo7bZ/3OgCpXeEPyjXBL2oVNd/z6wd+z8pQRlV+pu/IkiTgbFH4AJbQsubGPxic
         WGNg5+KNNLqkAoI3vHP+tUsmJbOYKgqDH0+MUrefP/wYlzbVvywAA1MmOcgqx6du/OWV
         rX2O7F0/mK0V+G8lPE8iHo48+uMhW3ngYtGHrNIyJJLdZLjZHiuHzV+rj6Dt/Ck1t6j5
         dZRDYEpSE2OLuWFAsnQltk0X1/KOk3qia1XTcjkyMUiCF6b/Kkv1TJ4Jetvm6VJn5ubG
         luzA==
X-Forwarded-Encrypted: i=1; AFNElJ+UYEVrF0nekxWohH9UvV95mxpyAk2D6FA9afux/6+QFhqYqHJ1A66DHXvxlo+6rErcguPYt+0vmMW7BbLRI1Me@lists.infradead.org
X-Gm-Message-State: AOJu0Yz304Z9+lCyQ561YHlz4GKmgvkLAzK7g/oAjrccdw6ZHZly4GUs
	sgwb1bPD2NilHK1YxIUMDab375t2ItxUcKRMklGFtTpqKRVZAO66E1H9z7jsaKVONlU=
X-Gm-Gg: Acq92OGAD68BhBhfI3Pr+7FI4bGD7hgDCJFStMQUWe8m7NNQK8xZM4DFeZWjHDXRiTp
	7zFaYBXa9WwfIu0teKazSbvzyrAUiksjILlO/r83DERiQfAmpCfrmSGSYeCGSRiwYmj/syZbP33
	pAXpeDjx/xpdmDrZSEv7OVtg2YChalAh9RXY1GjbSjl/843cn0eu4S84mje5nio7VE6owMdStw0
	nLTYyJf0FXGW3AmQTqU0G+0MTbAygZ8Bs/CmSxkbX91IWZSA3eQQ1vEL2gQgvB1rmEPLxwezmMd
	NRZklM7pxIHjUtyS/aZOAi/F4ePODBaRJkFZTnml9mfn/9tlW4O35B1TqrZvwx+NxTlrx5TNgSN
	GC5BRcjkKetOEHOQrP19dtK8mLcze3xGdMQEqGvv02nqwe+CB94dSzZ9C7Ooul+qTfKKeBTwQAR
	tXbXSuZd/zawNC4CQeTi3C7wYmaeZMKx5Dd28LXrFK
X-Received: by 2002:a05:600c:218e:b0:490:e913:6562 with SMTP id 5b1f17b1804b1-490ec4cd29fmr35235545e9.2.1781278470979;
        Fri, 12 Jun 2026 08:34:30 -0700 (PDT)
Received: from alchark-surface.localdomain ([5.194.92.128])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f2b0d28sm6916641f8f.20.2026.06.12.08.34.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Jun 2026 08:34:30 -0700 (PDT)
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 12 Jun 2026 19:34:15 +0400
Subject: [PATCH 2/4] dt-bindings: mfd: Add UGREEN NASync DH2300 MCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260612-dh2300-mcu-v1-2-ab8db1617bc0@flipper.net>
References: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
In-Reply-To: <20260612-dh2300-mcu-v1-0-ab8db1617bc0@flipper.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Heiko Stuebner <heiko@sntech.de>, Liam Girdwood <lgirdwood@gmail.com>, 
 Mark Brown <broonie@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Alexey Charkov <alchark@flipper.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3098; i=alchark@flipper.net;
 h=from:subject:message-id; bh=4CdqJb5/HIWgveoRMI3NaAYB6L+dedEtCpwu5Ims3hw=;
 b=owGbwMvMwCW2adGNfoHIK0sZT6slMWTpqP3Nj81sWn2taeoKuTcNcRfLlmYlhwcG+24/FBm4Z
 6HzivQjHRNZGMS4GCzFFFnmfltiO9WIb9YuD4+vMHNYmUCGSIs0MAABCwNfbmJeqZGOkZ6ptqGe
 oZGOsY4RAxenAEz1rh8M/x13n5tk9cLl+katEyfOLJDZ/yjji9ehq7ueSXRELfs14+oGRoaLAjH
 bTj6vLX9z/nvSsQPLp+UEWIp8PS/XftCqz2VmrTsjAA==
X-Developer-Key: i=alchark@flipper.net; a=openpgp;
 fpr=9DF6A43D95320E9ABA4848F5B2A2D88F1059D4A5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260612_083433_095115_E39FB9A4 
X-CRM114-Status: GOOD (  17.30  )
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

Document the UGREEN NASync DH2300 embedded controller (HC32F005 MCU),
which is responsible for gating the SATA drive-bay power rail and
providing a hardware watchdog.

This is based on disassebly of a GPL binary from vendor firmware for which
no source code could be found, so parts of it can be inaccurate. Only
the power gating function is confirmed.

Signed-off-by: Alexey Charkov <alchark@flipper.net>
---
 .../devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml | 62 ++++++++++++++++++++++
 MAINTAINERS                                        |  5 ++
 2 files changed, 67 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
new file mode 100644
index 000000000000..847970c609cd
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
@@ -0,0 +1,62 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/ugreen,dh2300-mcu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: UGREEN NASync DH2300 embedded controller
+
+maintainers:
+  - Alexey Charkov <alchark@flipper.net>
+
+description:
+  The UGREEN NASync DH2300 NAS carries a HC32F005 microcontroller on I2C that
+  acts as a board embedded controller. It gates power to the SATA drive bays
+  through an internal register and apparently also serves as a watchdog
+  (unconfirmed, as vendor kernel sources are unavailable, works without it)
+
+properties:
+  compatible:
+    const: ugreen,dh2300-mcu
+
+  reg:
+    maxItems: 1
+
+  regulator:
+    type: object
+    $ref: /schemas/regulator/regulator.yaml#
+    unevaluatedProperties: false
+    description:
+      The SATA drive-bay power gate controlled by the MCU.
+
+  watchdog-gpios:
+    description:
+      Optional GPIO line used to ping the hardware watchdog function of the MCU
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/pinctrl/rockchip.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        embedded-controller@4c {
+            compatible = "ugreen,dh2300-mcu";
+            reg = <0x4c>;
+            watchdog-gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+
+            sata_power: regulator {
+                regulator-name = "sata-power";
+                vin-supply = <&vcc12v_dcin>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index f1caa6e5198b..ca27df7cd684 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -27633,6 +27633,11 @@ L:	linux-input@vger.kernel.org
 S:	Maintained
 F:	drivers/hid/hid-udraw-ps3.c
 
+UGREEN DH2300 MCU MFD DRIVER
+M:	Alexey Charkov <alchark@flipper.net>
+S:	Maintained
+F:	Documentation/devicetree/bindings/mfd/ugreen,dh2300-mcu.yaml
+
 UHID USERSPACE HID IO DRIVER
 M:	David Rheinsberg <david@readahead.eu>
 L:	linux-input@vger.kernel.org

-- 
2.53.0


