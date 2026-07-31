Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BC13C55167
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 02:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YfzAVera8YPzEZfXN0c8xQO741Yx6s8VOLnFqWs4cSQ=; b=gN58o/VjWtK1OaAMuCdbVycdNI
	5CwUPR9lCED3CaJNV+MFgBy1oEUsJPrudc/30jrjHErxVDszb56W/hKuYsJBrZuHQidB/qor+HieZ
	vAAv/XmimOmlQXLO6Qu677g1wIAbzVobgkcyYnB+rf6ArkVjsmZkJmxKVQHlS0m35tHVu/ceEsX0S
	TYoTTEvyWVrCyxeUY2M4Xzgsv2XCAY/t1B336xDQs5futrxYSgMU01ul0wfM/2Bd0ozmte+9hhtzS
	KBVi16eymxVRTcrOKWEjKz4/VR3UXnaSv1803/g2Jl24vqLi1HqFLFGaaQ35skF/Eixdgr+DLGdF6
	yzw4x7IA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpd8y-0000000BdRE-2jps;
	Fri, 31 Jul 2026 02:38:40 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpd8p-0000000BdPK-41Jq
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 02:38:33 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-8484f229529so465075b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 30 Jul 2026 19:38:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785465511; x=1786070311; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfzAVera8YPzEZfXN0c8xQO741Yx6s8VOLnFqWs4cSQ=;
        b=bqaq+HGuSCTtR+xD2hH/GOEVK+E7D7EVFqQO6Bikfnp5DTsCNJ6BM0KZ7Ul+/rAD6U
         Qgp8RLJ85PWycHQtFOp9a64FrDaoZZTIT3njrjYM/z/guODKdqQ06STZGquRyqtjTdWC
         V0FObKioC/q1k19AHfTKzNlORpcMzoAKOs8scy7gd5ciNmSsMIYmFM2/aYbJXtv7Rb1Z
         HbzrOYiQnfhxMJgCUZcdg/v0H+TKQ8h0W1wEX6VCDJ8Omtnk1gUKjShi7hTdxX6qRyX9
         84xGZBS4ByH1lYeJRDDzt7U0YtkQPLz1yaVnV/iKc9SWFMAjaYp4SrBry251VUq3AOWE
         RyZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785465511; x=1786070311;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YfzAVera8YPzEZfXN0c8xQO741Yx6s8VOLnFqWs4cSQ=;
        b=SehoBwQTdXeWDhtqHKK3MhyPLR1Hp+ytVhyctK2krymLcfYTeE2+9w9lUJbJqVgunb
         eBadU594glgElsY2pwgtyw4nU4mfqZExJCTQ7TOPfHp/0JMJUHMvLmqQ87Heh1qTa7mJ
         BWIz1EJl/J8UpZHblq+MAJigdwTbgCgA29Rtjp1TLt1vximMC7niZGix5i74HsR5XF92
         Q0mNBHMVkQ/IvqcISRY9t8PXnHG9M6ibDhjcTUOPz0l8ftuxgHx7hfUQmn/1yyRH7iLY
         ozGBc6rqjfcDy7o7AdrODyHP7SRb+lsWHl081nmz1xE/DJjjkJEKVxhp21cYZHtmh23T
         Hisw==
X-Gm-Message-State: AOJu0YwoSpkkc9kQKNbHb+Mgx/O2Gb7nwdogGJ2erZweUXqtOnWqLw+w
	kITP3iSdRXbl+bp4hpqDkYzWfplkyrhpS6dwHe7pSlDRlQ2n6y7rL2h4Fq/aEA==
X-Gm-Gg: AR+sD12JhFDIQpCrMs5/md+76+hsvqRNSn0HSiT59qb1DzzSWwtRqPC9c5uuDeSXp2G
	84S5DVEWLu3WaUfKQv3jgEORBFn5zdLvVS/GDBUpt5M0FsoKdxKLQAXTNxLpc6tEakL0FRkD3qr
	sbE7/yG6LTcUWvSwBgYsSmrq8d1n2Y/YyZPRBvfuIZS+BdGFYRbDMFVWhy5lZ4p2XwbZm8uXbzS
	Mn9bCdWsvAhje4wXgH5KYH7iU/ZM36YtSP3NseZbHe/t8kPz4KlI3WNu9+9GLCwCET0Fz/Fs4Lq
	99QptpE5eGiCSRGkjoHg+UnOsnw3Rx7TlWPtxdNpSj4aQ/pRMoMxovCTUrt+3t9r35ek3WXq5Nu
	DGsY/+XMqYV+Ys6UKWFyJiao2DV830Q7No68CaaBPKYH3mpoH+B6/ieAz7wlny1TzrJXpbd4fFe
	JNSEFU9eTt3f912mzp+N4qgd7jvl3paRNMBwjMv8tPcfLO0t38hA+wQieJPCKGmIGN1JEweTQRB
	Ge3wfBpA0E5TPNc+/CZ3jHKUW/CRyGiIF9fYEldwlwsokkZkAA=
X-Received: by 2002:a05:6a21:6f8c:b0:3be:b0b3:3962 with SMTP id adf61e73a8af0-3c91b12935cmr74236637.9.1785465510997;
        Thu, 30 Jul 2026 19:38:30 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe3808a8d9sm81938a12.7.2026.07.30.19.38.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 19:38:30 -0700 (PDT)
From: Chi-Wen Weng <cwweng.linux@gmail.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	cwweng@nuvoton.com,
	cwweng.linux@gmail.com,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
Date: Fri, 31 Jul 2026 10:38:17 +0800
Message-Id: <20260731023818.1626075-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260731023818.1626075-1-cwweng.linux@gmail.com>
References: <20260731023818.1626075-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_193832_022457_42107559 
X-CRM114-Status: GOOD (  13.36  )
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

From: Chi-Wen Weng <cwweng@nuvoton.com>

Add a devicetree binding for the Quad SPI controller found in
Nuvoton MA35D1 SoCs.

The controller supports SPI memory devices such as SPI NOR and SPI NAND
flashes. It has one register range, one clock input and one reset line,
and supports up to two chip selects.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Chi-Wen Weng <cwweng@nuvoton.com>
---
 .../bindings/spi/nuvoton,ma35d1-qspi.yaml     | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml

diff --git a/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
new file mode 100644
index 000000000000..377ccf4fb224
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/nuvoton,ma35d1-qspi.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/nuvoton,ma35d1-qspi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Nuvoton MA35D1 Quad SPI Controller
+
+maintainers:
+  - Chi-Wen Weng <cwweng@nuvoton.com>
+
+allOf:
+  - $ref: /schemas/spi/spi-controller.yaml#
+
+properties:
+  compatible:
+    const: nuvoton,ma35d1-qspi
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
+  resets:
+    maxItems: 1
+
+  num-cs:
+    minimum: 1
+    maximum: 2
+    default: 2
+
+required:
+  - compatible
+  - reg
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
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        spi@40680000 {
+            compatible = "nuvoton,ma35d1-qspi";
+            reg = <0 0x40680000 0 0x100>;
+            interrupts = <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>;
+            clocks = <&clk QSPI0_GATE>;
+            resets = <&sys MA35D1_RESET_QSPI0>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+        };
+    };
-- 
2.25.1


