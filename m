Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A15CFCC065
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 19:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=; b=RIyd+bGoKcwoPd1J73c8uW07Ip
	jR+0xdqas8YVCAzQi2PMBQLKKOl3/8upTAjt4E3KoTlnUuPXyK0Owp5Yko9csUzCEvoa0Z8BBdnvO
	e4tecsDJV4BnxqlFhlzZAgGEuAvO4O7BfmidxImetTXR+oZ9eFAWxV9U+fXONwa+nLb0HJb5hwxT4
	LIis5IoNdtjZGvR28zjPbATIat7LSVKKg7alCmaAlrtM/bALKb8GC/+uxImMDWUMsiZj4vMEIr4Hh
	X2i4tqhgkUcTFcgMIwiI0JiW3+fFYwo2WHIRwKW8TJj1szC1rSJZOKRfC42vzkgUwGtL1Kg+yTMRP
	0XUNeetQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaRE-00000004MhM-0PIN;
	Fri, 06 Mar 2026 19:02:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaRA-00000004Mev-2VaA
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 06 Mar 2026 19:02:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=; b=XCqvOtybykZvU0ERIOQsixq3sZ
	WD/SKeIXu4LV3GgZJRmfKBGRUu7STzyIQZY/bS/dMT6HBTMd8lcBC4Z/DVhW9UtxLT9Kq55XmAOt3
	ae3I8HLQFBCm5OhmgtgjPDG05zRYbigRzfrqiRSNZgIOer4DO53EEbozMxfQPcO5zuw9QLGywGtRl
	PmZOzbvBvCVfOHec8N1k27mt9DkuykDzB/rhdilVbO53lmuCLr4hlLwJl5NPIhkEdQAxFtBbfT/k0
	OFGaQPwQh2KRSFFyjg+hIT7MpwsAx9K+wQj/6PsOVyb0Jo2Drwf1Nk3Dl1dWhi2LJ9c+XcDxTPPLV
	rgV5oiSw==;
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyaR6-00000009UuP-2Jn0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 19:02:11 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-439b2965d4bso5312486f8f.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 06 Mar 2026 11:02:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772823726; x=1773428526; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=;
        b=RqnO2o4UvIQ9bNc+eaW+o6iFv320olsjCMBGySgZnKTKpNpou6zeuKbr4hmGkhKy8n
         yKDdRe2tEqjABdC3YQpVw0A7wP+a7HVmLqTZz3yD2pjS2ovCf2MZr4IGecLoLwOAnOpF
         AB71DZZN0yyBg+G0nH3MLQ1Vd5SjDz7e1nJnTlz8pd9Wx3VbhjLKBvlTwIgLF94SFtKo
         FEGugSbQ5CWIGEVjjaQSaX50Yg9dOJtunQI+fXshT4MyBVXQkGyhPw1pfPm8aS0vTiOU
         jxu/ylFdF5LErvD7vGaL2phdnFFMaHAFDjO3WJ5FAVQggRb1aGoRvzrOpJJzUhTOO/q3
         wy7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772823726; x=1773428526;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=h38h80KHifUI84SS+z6wlkgcplrzkREaoXBLQFpmips=;
        b=s7DOVlvnaoBcHWUTvakC+PFrCmVdeNY8mCSzv72RvjeTMjWDY2YZusgZVWsUvyQArm
         wVRUlzftBADYKFU8+fgxO+AVDv/tSITzaa1GP5PblNFUPILO4silqnbUvmwuB2sBVWdn
         hzIciDeOmBdLBbBE9loWRib7S+fV9ipW69/ptZW89/98lX8wMZKXICG8fAWjY8KK9A3K
         QA+JTpMGcpYaM3uYXnf0xirRnpRq3JfLlYHoyr+JcEA2QUrrEIPLE1pIgHEKwUMAE0zo
         /n9DqumUkSlv2KSPZJT+mgDQ+qoszW2WwrzhckTn/la3In/hg+r083DBUPbJmLOacYU9
         zvOA==
X-Forwarded-Encrypted: i=1; AJvYcCXQwpVMh0g6h/9a5epVQ1fdYgAl7m4291sXbeqs7qhHeZEvMtT32txYriZduYeoRVM4ESazdeeB/dfVKTdAvCLs@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/NwcaYjd4MTFLvxHTxIxoDASNkY6RXa/kOxvhRTCPbmMM7XnW
	4tFKYWlrJe3WskAunDTd6K/9V+LOXbsrYPf3INr9mXgS+nWyF0iRROA4
X-Gm-Gg: ATEYQzxSIZ583pDgGnhyitFpHFA8gRVv1+EGUDUE873dZWC6hquNNFQMXDVqfVeZDrO
	h7AUiEj89/aTn1Bt6IKt8kZPSVfgQMhtA2eyOCBurM/Rf+LKW4OTeVCv+DHMI0a4BnaRzEW2PAn
	eiUoeGYgC5HZ47nGnUl87DB5cExvNarbBLRX9LOTDGModi8m9a3r2lSrauXHM7a7STs+ljrC56X
	PCGlPg6UBO1WkOampVHIpNn6I0M3q/zfH6+7FlclefyWEmlHdV0Q0WlqszKa/Fe9f0ILyNpsZZc
	vCpFWK4iV0/76MRQWRprcL2kqjPOXuT7cIrUk8ySnNWaHu9UeJ+Fkf0LB5ft9Qety+7HaotXiKg
	IjGPJE7L0YQo70C3kdW/l83rcayGWUynotUkGEumlRtEMyNoPE6kb4Ykvrin7nUsUpvzk+/HRnC
	Qj71NwSkneF/06VMDMDi+pyQaOYGznAs6X6z0mFW29yum3uw1I3JKlJe8=
X-Received: by 2002:a05:6000:26c7:b0:439:b79d:b9ac with SMTP id ffacd0b85a97d-439da67c237mr5354464f8f.45.1772823725737;
        Fri, 06 Mar 2026 11:02:05 -0800 (PST)
Received: from Ansuel-XPS24 (93-34-88-122.ip49.fastwebnet.it. [93.34.88.122])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-439dae2ba66sm4743436f8f.20.2026.03.06.11.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Mar 2026 11:02:05 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v6 2/4] dt-bindings: phy: Add documentation for Airoha AN7581 USB PHY
Date: Fri,  6 Mar 2026 20:01:51 +0100
Message-ID: <20260306190156.22297-3-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260306190156.22297-1-ansuelsmth@gmail.com>
References: <20260306190156.22297-1-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_190208_690940_D7515C49 
X-CRM114-Status: GOOD (  19.69  )
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

Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
for the USB controller.

Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
always supported. The USB 3.0 mode is optional and depends on the Serdes
mode currently configured on the system for the relevant USB port.

To correctly calibrate, the USB 2.0 port require correct value in
"airoha,usb2-monitor-clk-sel" property. Both the 2 USB 2.0 port permit
selecting one of the 4 monitor clock for calibration (internal clock not
exposed to the system) but each port have only one of the 4 actually
connected in HW hence the correct value needs to be specified in DT
based on board and the physical port. Normally it's monitor clock 1 for
USB1 and monitor clock 2 for USB2.

To correctly setup the Serdes mode attached to the USB 3.0 mode, the
"airoha,usb3-serdes" property is required. This can be either
AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 and is used to identify
what modes support the PHY and what register to use to setup the
requested mode.

The first USB port on the SoC can be both used for USB 3.0 operation or
Ethernet (HSGMII).
The second USB port on the SoC can be both used for USB 3.0 operation or
for an additional PCIe line.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/phy/airoha,an7581-usb-phy.yaml   | 71 +++++++++++++++++++
 MAINTAINERS                                   |  6 ++
 2 files changed, 77 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml

diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
new file mode 100644
index 000000000000..ec467fb7f971
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
@@ -0,0 +1,71 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Airoha AN7581 SoC USB PHY
+
+maintainers:
+  - Christian Marangi <ansuelsmth@gmail.com>
+
+description: >
+  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB controller.
+
+  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
+  always supported. The USB 3.0 mode is optional and depends on the Serdes
+  mode currently configured on the system for the relevant USB port.
+
+  The first USB port on the SoC can be both used for USB 3.0 operation or
+  Ethernet (HSGMII).
+  The second USB port on the SoC can be both used for USB 3.0 operation or
+  for an additional PCIe line.
+
+properties:
+  compatible:
+    const: airoha,an7581-usb-phy
+
+  reg:
+    maxItems: 1
+
+  airoha,usb2-monitor-clk-sel:
+    description: Describe what oscillator across the available 4
+      should be selected for USB 2.0 Slew Rate calibration.
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1, 2, 3]
+
+  airoha,usb3-serdes:
+    description: Describe what Serdes line is attached to the USB 3.0 port.
+      Can be either AIROHA_SCU_SERDES_USB1 or AIROHA_SCU_SERDES_USB2 as
+      defined in dt-bindings/soc/airoha,scu-ssr.h
+    $ref: /schemas/types.yaml#/definitions/uint32
+    enum: [0, 1]
+
+  '#phy-cells':
+    description: The cell contains the mode, PHY_TYPE_USB2 or PHY_TYPE_USB3,
+      as defined in dt-bindings/phy/phy.h.
+    const: 1
+
+required:
+  - compatible
+  - reg
+  - airoha,usb2-monitor-clk-sel
+  - airoha,usb3-serdes
+  - '#phy-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/soc/airoha,scu-ssr.h>
+
+    phy@1fac0000 {
+        compatible = "airoha,an7581-usb-phy";
+        reg = <0x1fac0000 0x10000>;
+
+        airoha,usb2-monitor-clk-sel = <1>;
+        airoha,usb3-serdes = <AIROHA_SCU_SERDES_USB1>;
+
+        #phy-cells = <1>;
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 364f0bec8748..d75f59118a9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -779,6 +779,12 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
 F:	drivers/spi/spi-airoha-snfi.c
 
+AIROHA USB PHY DRIVER
+M:	Christian Marangi <ansuelsmth@gmail.com>
+L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
+S:	Maintained
+F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
+
 AIRSPY MEDIA DRIVER
 L:	linux-media@vger.kernel.org
 S:	Orphan
-- 
2.51.0


