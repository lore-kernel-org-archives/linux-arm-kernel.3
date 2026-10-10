Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 326F5CA9ECA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 13:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=; b=ycRm5tu7zpxkTho8O8Tb8J48Fk
	LId1SLk1odjUi/fdbRIT42m5d2ZxlF8kA0FUpYAsL1U6YrKXKkypmHvJYJKZkZEA6L0cVkjs4ATFp
	qenTmXvoVJXWCc1PxSaxotvTbLEK5ooOKnyq2VxDaPXzou8wjqhlcJh5NVkbDZLDN4FYV6VX4iSDS
	/+aykK7fLz8lgjGJ1Akn1nw/SCSN5cNu1zB2LcEds+pnrYwTD3hBBdCZ05gzB5Ejw7AD4XI/wLtMe
	LmrudBTjnHHA3fcEEEcZizg/Hfouwk8I9LdN47z8iQeNPai75/kBwviMLO1alWfDdEjREZLkxvKl4
	A30NjWCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWh3-000000083SW-2R3e;
	Sat, 10 Oct 2026 13:00:53 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFWgt-000000083Il-38PI
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 Oct 2026 13:00:44 +0000
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-4a1635f7c89so5682585e9.2
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 Oct 2026 06:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791637242; x=1792242042; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=;
        b=EbVuEgqNd1hA5hKqsPLhFjK8JkH6GfCdrIaRssslKRXpb0+i2o7wTNrAnIHzTiGtlR
         dZpmMpv17JXf514MXLitkSMKtfjT2cj9KXTv1ZEHgyDmFas66qC7xoZ/uLAyCKvtBhJ3
         +//tYiUToypM2M53p2sidA4cXMHvJ465/Uz4gKGppMxalI6FUDg3Se/mZNEkAKn+8Bly
         +gx1PTXj0oXeIH38ZQsSiqc5AUFo/jIIBQMBuXQEHyVlLKhA0ufH5d8riUY9rsEb1p+s
         o6SsfI2meEiiqjaGzZv/5QKfDE4lQSsDT7c0ft7OujUoodquc4xAgbq/nq2Piq7D1IJx
         SW2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791637242; x=1792242042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eZRXuafeSGm7SScy7RMeNaydNiquq0qtlWJM32llwhM=;
        b=x5FnuPCqwCM9aGO6kqKMUUGblOFuLf8g4fiPSTMorvThjuva/vtkQAsnd8U+0WGAcP
         WBgr7O54kymXrXak6EnaOCh1DDqsJ15frqYnLDlyKW++m6+PH+WWBBDhKntedZn9CYF5
         RIL+ig+mdxwjnxTc7NwBu7S2JcguaoxN3jlnc3/TsDajHumA6omzzykLP7tsm11LR0+q
         r5U8qL4nvUkiftMuXmzgsQBKVBn5mMywiz2TAkBKDNRPzaWjDsmIAqb97BZYfjGXetQt
         qX49kI/U/WMTGCFdR4zqPPUW3Ri3g8mbINRFQo1cwVJBRBakHML9boWmmMdftZOa/UM5
         5nzA==
X-Gm-Message-State: AFq9FYLjVHLnUDJJn+5XlZUyBw7q8wPiNbG63EsH3ql+HLdV6J66KTkW
	a/5jWAntAlCXN30eKMugZnH2WwFEjdp38HKXjB5ssO3ELvSR78iLXMzpDIpLvfpy/wz4Ew==
X-Gm-Gg: AYBFou0n7fRuukvj6Ug6N8TSciby3b4PsEduS4Zz+HtvpSSUwjixK/v1Br8msdiEK+j
	jd2SiOS0RsusXpj3iLIpm0FLblKl2QihvLXF1ai01thmKUipJyzeAJ7IThu47lH/L2YwRy/ZaQA
	cAjd6HE1VT7NHQeaHHMSD1+v1FE2N78N771tYJyhUWqNjssxst/38TuluozoGy8pkqjJ8kGXr+c
	wFtDwbOK9147juiCc3+aXn3lNYf5VQyshivXsfBWDXfkzsgkbLFmwAvzNxrJ71W754+eekmMI33
	hqVY+D9TrL9X9fQ2mNSKcEo0BXY6zFyN14bv02ox5KxAj/a2v2B32RL3gFWoaqzgqj//gu7UCCI
	bhYXBxEh2jYQTdpQGaLoxvmhSR0DhQ2Y3V52DULOr1lGYim5k2hxJ9S3Q6MdJak1VvPvTrnOBNs
	45Yd0VaC3CfWNS2XCH5HeWBJD5DzW7dC+hseLLfIwJUCK73DxysuzxW3aLg0LQ11iKB4EjhALvP
	zaDUa/Pnm54lDHByQXTortQUEDn/r06V4SEdqXJtGQZyu4ZWpYVTMwXbOcCtiirf4K7mDeQvWxq
	HM4wqf1b6SJ3qR3ULLZ00dG7ombmKhj91lAlVHLXcXEfr9+MGihMg9MF1i1Izg==
X-Received: by 2002:a05:600c:4ecb:b0:4a1:76c9:5408 with SMTP id 5b1f17b1804b1-4a18e4a510emr95532245e9.11.1791637241030;
        Sat, 10 Oct 2026 06:00:41 -0700 (PDT)
Received: from navid-pc ([2a01:4b00:a856:6220::a11])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a190c49d5csm162309975e9.3.2026.10.10.06.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 Oct 2026 06:00:40 -0700 (PDT)
From: Navid Ghahremani <ghahramani.navid@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	arnd@arndb.de,
	linux@armlinux.org.uk,
	stefandoesinger@gmail.com,
	robh@kernel.org,
	krzk@kernel.org,
	Navid Ghahremani <ghahramani.navid@gmail.com>
Subject: [PATCH 12/24] dt-bindings: PCI: Add ZTE ZX279128S host controller
Date: Sat, 10 Oct 2026 13:59:50 +0100
Message-ID: <20261010130024.177503-13-ghahramani.navid@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261010130024.177503-1-ghahramani.navid@gmail.com>
References: <20261010130024.177503-1-ghahramani.navid@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_060043_824607_86C92F3C 
X-CRM114-Status: GOOD (  14.63  )
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

Describe both DesignWare hosts, the two control syscons and the shared
Wi-Fi reset lines. The shared-resource model remains an RFC question.

Assisted-by: LLM
Signed-off-by: Navid Ghahremani <ghahramani.navid@gmail.com>
---
 .../bindings/pci/zte,zx279128s-pcie.yaml      | 97 +++++++++++++++++++
 1 file changed, 97 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
new file mode 100644
index 0000000000..57a4e96610
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/zte,zx279128s-pcie.yaml
@@ -0,0 +1,97 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/zte,zx279128s-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx279128s PCIe host controller
+
+maintainers:
+  - Navid Ghahremani <ghahramani.navid@gmail.com>
+
+description:
+  The ZTE zx279128s has two PCIe host controllers based on the Synopsys
+  DesignWare PCIe IP, each with one lane. Their clocks, resets and PHYs are
+  controlled through the SoC's Top CRM blocks.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    const: zte,zx279128s-pcie
+
+  reg:
+    items:
+      - description: Data Bus Interface (DBI) registers
+      - description: Controller wrapper registers
+      - description: PCIe configuration space region
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 1
+
+  zte,crm:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    description: The two Top CRM syscons that hold the clock, reset and PHY
+      controls of this controller.
+    items:
+      - items:
+          - description: phandle to Top CRM 1
+      - items:
+          - description: phandle to Top CRM 2
+
+  reset-gpios:
+    maxItems: 1
+    description: Board reset line. A device connected to both controllers
+      (the MT7915 Wi-Fi chip of the ZTE ZXHN H3600) has its lines listed in
+      both nodes; the first controller to start resets and releases it.
+
+  enable-gpios:
+    maxItems: 1
+    description: Second board line that is driven together with reset-gpios.
+
+required:
+  - reg
+  - reg-names
+  - interrupts
+  - '#interrupt-cells'
+  - interrupt-map
+  - interrupt-map-mask
+  - zte,crm
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    pcie@f000000 {
+        compatible = "zte,zx279128s-pcie";
+        reg = <0x0f000000 0x4000>,
+              <0x09500000 0x1000>,
+              <0x1c000000 0x200000>;
+        reg-names = "dbi", "ctrl", "config";
+        #address-cells = <3>;
+        #size-cells = <2>;
+        device_type = "pci";
+        bus-range = <0x00 0xff>;
+        ranges = <0x82000000 0 0x10000000 0x10000000 0 0x08000000>;
+        interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        #interrupt-cells = <1>;
+        interrupt-map-mask = <0 0 0 7>;
+        interrupt-map = <0 0 0 1 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 2 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 3 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
+                        <0 0 0 4 &gic GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
+        linux,pci-domain = <0>;
+        zte,crm = <&topcrm>, <&crm2>;
+        reset-gpios = <&gpio3 5 GPIO_ACTIVE_LOW>;
+        enable-gpios = <&gpio3 7 GPIO_ACTIVE_HIGH>;
+    };
-- 
2.55.0


