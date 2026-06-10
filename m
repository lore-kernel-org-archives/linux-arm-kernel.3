Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0034DCD8CA8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 03:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aX/h3JPBtDP5eEo8S5UCA3kPcg5M0Mv68w4Fd4D5N/M=; b=MfwZXUpP86dfVG5wRzlFtxV7vN
	QZWmumWtnc7lJ+tAd3NQiR8poebtGJHSV4YzfKLgA5I30vQe6IHzzMghVPtLcQeWl4YSnSWfsAyHy
	tQGLD06oHjaUV/IUMUBnScK5K3yf1bcF98Cy7Qq6EzSV0mAU1dcgzrtlRYDrRyV37jUMDh/0qF2nv
	e1FpwSoNXGwVoCq9GMo6GAKKo9OkcCCJtqFl0Ni1EFZWDliAmPtAtzS53Dvbm4/4/ppzqjEmqmbha
	3FHm/mVfdrkOEzFXU0ME+Lq+XSGCUAqwgplxf2x/KSI2GDf0eJNvKiwpn4/Wh9f41Qsv4U+skqrEs
	NFuAjSPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Ew-00000006iQ3-1Csc;
	Wed, 10 Jun 2026 03:04:26 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wX9Et-00000006iPH-3ijG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 03:04:25 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c86307c4e6bso1060886a12.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 09 Jun 2026 20:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781060661; x=1781665461; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aX/h3JPBtDP5eEo8S5UCA3kPcg5M0Mv68w4Fd4D5N/M=;
        b=Mt6prevKA2Q/hPP/5/ctLBWZGUs8keYhaegXGeBrRS1Q3h1nRoffEumfI5y3pRDQyx
         QYQ2RwCbUb+tBleWE8fWV+5y2ts5+ig3/ifBMsM+XXMcI5IsXqy0Mk+Gw41wpTvLlFLw
         bUnTKqNMtv3gmGDE0/H+R133qutIxmCPY2au3H77J6PvmUYBcN6xya2kY2YdFu8aOvDS
         aH+bbTSPa6rShwxG1vbj74OVWUddlaxl9cQ+vbnNbh7N/GiW2XjSgBwxvkj+ArqfN0KQ
         l+h05UnxnYiIjR5aEzoGE82Ki/bpt5F18uE0DfLZxdWvjTijPh+BSK5kkMemKPFTXkJh
         sVTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781060661; x=1781665461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=aX/h3JPBtDP5eEo8S5UCA3kPcg5M0Mv68w4Fd4D5N/M=;
        b=BleOeWnxQ9xTvFwhzEwVo/eelXXLUfpfEGS2ouu/aYFrHctZ7ER4rcIm3ArCEBvbjm
         ptJ3HFayFaR6DZRZdmiE8BvgqNv+i+MeiQxK5eSOyHOrwhtDNHDM8eOWVgYVTUL3STjn
         vWAqkNOc+/yOuAayEOWBCJPRpp+jaywxjOnQKPtSZagvBkPwAoX7o1pPUQ+eACU+I77U
         olWQKsz5UVfarJe7o9MEn911Krb0PbEo9vSxYniAZFujRSUtlPdiulFyxbit+Keuf7nr
         JkoZ9E6UpQ5xZI3q9RabyPnjdH2pf7yCIPBgZEBzzBJ1nV3dVXrMNoiAH02vyzLtG0tF
         ibTA==
X-Forwarded-Encrypted: i=1; AFNElJ/MliZSfESAJFNkhwoQfbqAb0IDouT3fX9eq2vSqFE5aawQnJANA15YppeTw505k65MuqtC8TtwtDpKYUJ9+Y0Y@lists.infradead.org
X-Gm-Message-State: AOJu0Yxm9WcxDSO0QJM9u054lPZhlpqpAzAtXfjcmzCz/TRKUrDtl8e2
	qKYbdiSfMpGtRoGIUI7RkrYag+1P5SPTbjaREU1thk3jsT+92k0+0GB8
X-Gm-Gg: Acq92OGoM9Rqy4FjPqgChpE8y8ks8pKRL4Y5qaLcUGMuIUJPUflnKPeLdu/5wtjZ5l+
	psWO6HVIDSzJZ8mThN68m4mVUysuYZTyOOgEQ/uPuAwld7fAVPPXTk4/95M80jjHl4P0bMDs9Oe
	5e7ird4y+0wODrKi2r+r/abJAk+2AZWFxMfE9F7f6nj2HhjnUizTZ2jXPCwKQfOGjMQ0UcoTqSx
	GOnQ4m7X8I0I08SESDnYn9I9TKwibuJytd63zpb0H583hKHLg+79g5PPUxosMPQWa+h4qmgFjPB
	QktMM4/GStp3rZ1qep3sLCwyLOfxCncVnjptSFhUYfLHXCWHOdHeAxWjyr8boZc9zqH/mp09lYG
	4qazAgNIttbOE2M++00H9PeR2QzVGOnVXsgh1I3fktsYULtRG6OBYgtiY4TNdT4N9qOhp9hmX3g
	OHE2pPckp63UD5GoAqPFiO6209UoWFuEmmeqXr7Qq2h7GFucEMMQXIevhm3+ns5OZfFLkvQHaOQ
	bu9Smy6+EheC0SraoBe
X-Received: by 2002:a05:6a20:d524:b0:3b4:88e7:87c7 with SMTP id adf61e73a8af0-3b53bc648aemr7501936637.17.1781060661587;
        Tue, 09 Jun 2026 20:04:21 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c85df0a61b3sm19927082a12.17.2026.06.09.20.04.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 20:04:20 -0700 (PDT)
From: Zi-Yu Chen <zychennvt@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>
Cc: Jacky Huang <ychuang3@nuvoton.com>,
	Shan-Chun Hung <schung@nuvoton.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Zi-Yu Chen <zychennvt@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v4 1/3] dt-bindings: i2c: nuvoton,ma35d1-i2c: Add MA35D1 I2C controller
Date: Wed, 10 Jun 2026 11:02:06 +0800
Message-Id: <20260610030208.2020275-2-zychennvt@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260610030208.2020275-1-zychennvt@gmail.com>
References: <20260610030208.2020275-1-zychennvt@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260609_200423_937556_D9BEC63A 
X-CRM114-Status: GOOD (  14.05  )
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
index 000000000000..f2c004049d86
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


