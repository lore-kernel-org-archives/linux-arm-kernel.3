Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C39C531D0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBn2jjAskCbGfn7VoZyIaR2lupbEer0VieIcw6uv7AM=; b=IMxCMX1vEbDStHCJTyDOJ9tx62
	dQhPoTA2QWgr4gWRDKv5+v3NIdZagDUM/u4QIB9WCtZ1mprx1fll/g+12yOvCRJOWyGP+NSR792jl
	7gcEIzeWOL1CJTR6u7t5M1sPzS0ROhIk6nPbFQ8jLqCORNAGV18Aq75fXeA+KA+dTfNFVZH2boUZt
	uCXHW5TBXan12IpwYR1nuzRywmkAYMLLHaIeAa19PX0jkadA5MjLYEOx4iEaAMdL2LcuerU8SyENs
	59eqrHpPMdj2pBO5gpZw5tQQiQfVYukFaV9BNbcWgbuS0YU2iGO4pFylQ4lHumogu8eKb4O6mUwmP
	wtNxedfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHVU-00000002Jbo-04Ug;
	Mon, 27 Jul 2026 09:20:20 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHVN-00000002JZ4-0yWH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:20:14 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-8484f229529so1547353b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Jul 2026 02:20:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785144012; x=1785748812; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yBn2jjAskCbGfn7VoZyIaR2lupbEer0VieIcw6uv7AM=;
        b=pvSWLw/deRP3YooKBLHIHJfA3cBJ68piS718qPEaf3C13LqhFW5kZOFz5KMGnsss02
         dxbx5IDnvm6Z+o1AzuQu1nB55KfIGyIaTImkea3+TjAriCZZHh5vaAKJEvRuH0IjasOF
         75QUCGmsE82u/svtPA5zF0PEE6xF6EuzlKu9oooj5qcr+olr0T2drCnVcrGEsstuI2tr
         vXsq3jSt1MkE6tWrIStjBuLCOwowv8/7TvEF75xz32KzUjbr6XLfhxxzfJgv+1WnBLZb
         2Poc4COHX173Mf4cRdP6N07jPwd5cdEElwrOzs9HNU0dy8DfJDk/gFCgIKOWXuRJ2ZT1
         Rd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785144012; x=1785748812;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yBn2jjAskCbGfn7VoZyIaR2lupbEer0VieIcw6uv7AM=;
        b=rMXwvFodjoNVN5/InRkoqL/x+U3s5RQoYhDVm5/c7VipfgfbeRxQ8xNV+CRr/D+u+Y
         2TDCiitMMpvcoBbrPpXG/+Ihtzo1I0RE1U5dvDIXAzx1cwQ9MLoDijeVdFzNjq+ID/Mk
         vw4NFk8mRQ+ARGd8J2I0fEc548/SxvpZLfjQKBxgXpKVYCWeYXBTbT3JBfMW20FN7Whh
         YgTvjzdQItAWbxAwV8x2cdUaOql7rXUjKp/wsTErk2exILS4rlWVWB/Mqiki3Ca4PwtC
         mWeSHqwyk1B5vPkinEEsfcztwOzrQDHtwvsMqzpXWzN2R8UM7f2k8kY5q7alVDhf17xI
         X1Xg==
X-Gm-Message-State: AOJu0Yxgcft2ONR7k/Tj11SoqTbFofsX6wbW1B6NSj+DzcfmW+AKM9cQ
	gO+R5+8jCni8Wy/7tDeORSk99OkKmmGfrIrn+iafedL6LiFWXzgDyDrx
X-Gm-Gg: AR+sD13+vVMSG6lhIftSmxYC2pp7hhR1XAHVj32z8BWmCXmlXe3Cfeqw4dHHHCv6T4r
	pnt7Gy+DKKIGrc3zTDn4igRMG6E05IFOKDYF9yg8J4NH2AP26MPJMwXiRj58xLyC00ENI9OcOb2
	HstoAJca941ToLA3m4P+CURxD80dPcfSIt8nkuVPU9KRuvo9SD2QgZtqVXqnEQrpaxPzOu8uJ7c
	ZfLm9qn1GwKV+KCPnA0jJYa90vEsNgttJZ8IVzpOJ4OHXHDR/oy+9W5SR47lmvQhI2moWtriLJt
	iNri9xAlIyfyPeSc2QFag4wppnDhSaEZF14G6xdpq0IlkMIkFJIsQYyWmlY34h7LzfHE49Yw9DT
	Pa8xY1dIoE8qPFZgvc+loUQo3gtF0DEIf+X5Jnb1ULqdCpzA6kFs05iLPGgr/gJZ6XCP5+AsmJI
	QMBDgq5IQqYLvw6xsSgk4BPGoBwDeOREwoBqY3kibXH3XW7mTPbJKnCCSSWHs4kKeBFfSS5D4TW
	CQ=
X-Received: by 2002:a05:6a00:2c94:b0:847:97a4:d6b3 with SMTP id d2e1a72fcca58-84e59405415mr6004651b3a.16.1785144012199;
        Mon, 27 Jul 2026 02:20:12 -0700 (PDT)
Received: from localhost.localdomain (60-250-196-139.hinet-ip.hinet.net. [60.250.196.139])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e53253b65sm2802645b3a.8.2026.07.27.02.20.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 02:20:11 -0700 (PDT)
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
	cwweng.linux@gmail.com
Subject: [PATCH v4 1/2] dt-bindings: spi: nuvoton,ma35d1-qspi: Add Nuvoton MA35D1 QSPI
Date: Mon, 27 Jul 2026 17:18:32 +0800
Message-Id: <20260727091833.750051-2-cwweng.linux@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260727091833.750051-1-cwweng.linux@gmail.com>
References: <20260727091833.750051-1-cwweng.linux@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_022013_283812_80F7E248 
X-CRM114-Status: GOOD (  13.51  )
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


