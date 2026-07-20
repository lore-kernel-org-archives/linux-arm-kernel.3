Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB9EC44512
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 03:06:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=; b=OjS9JzxIM1jvxrWxSmTR0mjiMp
	mHuHlTOAhrkFqWEB9yDARf0dNOLOdr8KGx7PiSoT09Z+OzSdoX9qVPMHcvmfbVutV4hO3iuCYmygR
	iiFHb0w/u5zpgbNhBXv+UeqiVmCNbFjO5DkD9snF3pVJb/h0lgc3pfWvaSWahBsG6cacCXxTu5vMw
	QKdk59kDmsm5ag5LIl0Skm35wCkU9kgkCLZGP7t20eILap8GCa+4mfa/1HHjt52abcLXisub6LMJH
	s+ee1y2dpDz3sQviYuzQwa+3fqZ9KK16hw8+Y9Xb7ihX8v/V0d5dodnlsc4za40iHinFMD/SKt9/o
	CjjxzJ9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleL3-00000005jL7-2G3l;
	Mon, 20 Jul 2026 03:06:41 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wleKy-00000005jJs-2wen
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jul 2026 03:06:38 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-848743155bcso2343055b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 19 Jul 2026 20:06:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784516796; x=1785121596; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=A4ZC09VwBMsQpgPw0siYgooPM23UbfTaaKRGi9GtVAlHjf2fDfAbEgWqxvyOQ50OHq
         5+MjtP+x41OEDK2XA8P1uZgTX3ixG7KdK3p70tzhfUG8HGL39kab/4MEAEsOUJdz2eR8
         bnbol2PQul4V/H1XaWtUofLI4K4FM4ZTSx0GdjbHHnuX2PvfszmhYsFv7cXjjqmII3RE
         WvfQGOoEF9FJH7/j7JUDIoK2cgNmTm+hBmbHzk6SmBi9vvy7Xef8A/TydVVsZhFgrkWr
         Hn599jE803+qYRg3/XFQcG842WQmaKzDBsHKPuj07l8n4x9GAANMCd+KUJlzQR9CQFV/
         3yjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784516796; x=1785121596;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=W2FqaMzaGINgzjJOw7zufrrcqxjVM6pp3g9UOy5lEX8=;
        b=Uzj2Sa0FU6ptQkTfqXYTiiW5Xf3dNN54RTxp8lFPrr0xr8vrJdH1x84xm+IVJewk3E
         2+QoPgdQ/0768tEaCdpXuQyMfZwGCJ70I7AXIsfQcP0F8F+Pn5PP7EuxRB4cIKAUFymH
         AQX7LbSW0z93OQe3ikw4eARXExqAJKCxjuPi1K3z8bVHLwz3kF/0VfB09MAOq87CTYeU
         yN5Y1N8okCEy1RmuDeCzkSxf1QCkNrXlvORm4qWboLA8E1mHRlz7q9Fio1O7L479XBPQ
         VAYEaEJ4lVJ0ymp+LJcVmp2PiQxaDWU1k3pMd3+STEeR/rY7SFk+TRnt+FtY8vkpS7Jb
         O0UA==
X-Forwarded-Encrypted: i=1; AHgh+RrnrX8NjQ8ZgSHkqqScNDoea06WssIroRJS3agXTlhKUPi6hyBmKZbabIj5hs4GAOxciVI3oJO0rwPgTxt9Eh0m@lists.infradead.org
X-Gm-Message-State: AOJu0YxbnD/vKQAzBvZ/gRStEsL6OcHo8qFCzeD5Zh+dWYWfX2LUtCth
	1mUevpYTN42T+j1Cdl++1gThvIEz8TlakOetZHMTXpr8OQ3Wp6RPBrlou0x4Dg==
X-Gm-Gg: AfdE7clz2A0hMaEgtW6uywBQgLiTpynX9QeHnzdNXxWSSKfwFpLn43/vjoohuGdfrO4
	lz+JqRV3YakeC3ZPfVpZ/XrN7G4+xK8gmN8MN1yEWKfnWAUWv4wKenfXmrFvefcbp+mHSd4SvtI
	5l7G/nEQm3YY/H+vxp74BbWjOGFbpJxK9L/Hpl4ZDDFj2BJlCA1R1rKPmpG8Mvx2+/KN7Ws7Iqt
	xe9f1J649mCJlr3YL42l4wES5Bd1mc+ivlC0WxhhMkIrBEDErxjx7FMWoZA8Fk7N8oOwqwWmAAJ
	uoHB+RRyTTDrN7S6ZuWl89hJ4pGZPAur4ul/fo7zAPhC8vIKzixas2aurnc0VNOlbY/b1qK12OW
	U0dWlXhNaOAVim9RbhageJpqG+CihAEE60oiTaHm+0d0iZ5UuoI05Zj1XuQ07GFDXDPiRILWIhE
	utZlXoy2cg80VMrge1GYfjjzMOZepDgTLkgbkUlwcr1+sarz9kRFkKbx/N9vAh
X-Received: by 2002:a05:6a00:8b86:b0:848:2eac:bfb2 with SMTP id d2e1a72fcca58-84c292634bemr7733935b3a.13.1784516795979;
        Sun, 19 Jul 2026 20:06:35 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2adfdfe9sm4805267b3a.27.2026.07.19.20.06.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 20:06:35 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Mon, 20 Jul 2026 11:06:14 +0800
Message-Id: <20260720030616.1067660-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260720030616.1067660-1-zychennvt@gmail.com>
References: <20260720030616.1067660-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_200636_763822_F8D20911 
X-CRM114-Status: GOOD (  13.79  )
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

Add device tree binding documentation for the I2C controller
found in the Nuvoton MA35D1 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Zi-Yu Chen <zychennvt@gmail.com>
---
 .../bindings/i2c/nuvoton,ma35d1-i2c.yaml      | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
new file mode 100644
index 000000000000..0713e1c1ecb8
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/nuvoton,ma35d1-i2c.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/nuvoton,ma35d1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 I2C Controller
+
+maintainers:
+  - Zi-Yu Chen <zychennvt@gmail.com>
+
+description:
+  The Nuvoton MA35D1 I2C controller supports controller and optional target mode.
+
+allOf:
+  - $ref: /schemas/i2c/i2c-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. The absence of this property
+      indicates the default frequency 100 kHz.
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
+    #include <dt-bindings/reset/nuvoton,ma35d1-reset.h>
+
+    i2c0: i2c@40800000 {
+      compatible = "nuvoton,ma35d1-i2c";
+      reg = <0x40800000 0x1000>;
+      interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
+      clocks = <&clk I2C0_GATE>;
+      clock-frequency = <100000>;
+      resets = <&sys MA35D1_RESET_I2C0>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+    };
-- 
2.34.1


