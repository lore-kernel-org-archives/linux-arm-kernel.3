Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A533CCD1AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 17:43:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j/K6pNfM50RfxSgZt1gAI6BQibb85E1lqSjk2vGJD9Y=; b=ZYrs36S8egOoWTEbND7WgDMU2P
	1FmJwRaD/dCLKXb4HbafWfdLXU8ePfOPDAMJmXMFuk1Mjt5CnBWlhsn7Y1qLry/URJFOj8dggKa6T
	6d1o5GswxZdXnkxK+u24YMg5MNsgDdWgn+RpgAoPWifakBCQyla6lvdr/MbebbMCA0tO5TBuBX8Cv
	VBVzXPmQ5DnOPGh8KuRXjqwAL1QLVn1df7W20stSLXt0yAJDgSQbbXPDGZCLUpwjehhsb6n4T+00h
	IhaXcHHyoGAQC+WzSLiw4PFABKAjNLvQDfDMZzJaXpsgQFl7/2TzIY+rBKkeRkErmhGssX1JRcWUI
	8YdPAjxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcrm-00000003pqI-1zBg;
	Wed, 22 Oct 2025 17:43:18 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBcri-00000003pma-1PWf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 17:43:15 +0000
Received: by mail-wm1-x344.google.com with SMTP id 5b1f17b1804b1-4710ff3ae81so26715655e9.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 22 Oct 2025 10:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1761154992; x=1761759792; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j/K6pNfM50RfxSgZt1gAI6BQibb85E1lqSjk2vGJD9Y=;
        b=n58qDITkwbSncU+VyEJkx9ITsYljHzzVduVtcK2jv9qtNUdJj+lJcDrHwntohFgI2m
         3Wza11gq8De8xe8ycXrsVPDftFmOJhcyeMPWusvtcWqchaqfSXU6sHmocMQPWWy/Pdtw
         8d2tHit7eqStd8mya5/hw4xBk/YREEfLUWUKqkP6eMnJ/t5CXPpPYM7GZZqXszoM2SUH
         c5/beILdZdwcvz8WzpJEoewEWbVuUacoIY7DPRxTY1g/wiNkpyWU1/rzNAAp91iHqgRF
         M7rqLFXqVplD9aHR4zg57eRsbmpkacQeV+QorGDNT/1Y4uwKpldOJETQgDhXXS8A+9Dj
         /u5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761154992; x=1761759792;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j/K6pNfM50RfxSgZt1gAI6BQibb85E1lqSjk2vGJD9Y=;
        b=ipEy6DlItlC6tRJZC5FDBi/fCGEXBbT+p38fa1nfnY2Wn/1f6EfwXkCHoErU2z21fF
         o4D9y6zEv9cP/G2ikpzKTnrewnJEP2uaAPLv/hXELPjXD3d9wHSmk1gzI95peXrYq5Am
         GwFUdBymA3bkHOx+wLgKgiK9AOhalmavN3ty+crZSl3rE9zWspqtO882Vh2cfgfShgZ/
         pLBEZBvFlhGWklxxQR4klsQI/asa0tmooHA0J6qDcJ0vh5fHvcODrLKxI1jdt2GE9r1Y
         2ZjtqSSny9ya+kV/eCkvxFf04d24rT0Laueq2OLqZxMzAo3GUWl2JYUzGdnZAcpx6mmF
         t2Aw==
X-Forwarded-Encrypted: i=1; AJvYcCW5TtW23WmPEIZAocuIJ0E+S7LCCvxetOlyv64ox2xZS+iPujB5SpsWAtDyFk64nqbkO21HhMo2x6fwAuROM0fX@lists.infradead.org
X-Gm-Message-State: AOJu0YzWX0IIlxMyv0iClqo5AeunCHkPgYcICiqiOzzD7WTH8/kb+1+p
	+M+anrgWQIubiq+x+WjlcXlGMuxAebucy/jXQmusINsnkU/ZoGq+GTIhxv2yLsMgw4g=
X-Gm-Gg: ASbGncticnmtveC+NfXRelQCmlkAtr/FMZCO/YFzfAFeMZB5xYZddV5ukmbpCSheZCk
	ZnOZcRlj1wnvGN9Lq8ZviUHOJvBJ9JcC1rKEnxEP8W7zcqf76/+JLWHnPC5r8SanRniIy4d7vql
	hwSNg5B48ggVPnT5mKU8f7kxA7CHCG785r3Q/7UVTaL7cqnHBRMGMdLqiUtbdzox5OiFPojsH27
	YW2pHZLSdVuJEBHASFf1eL9CheUe49u/PvTC5BJuC7t+LFPOnTEyAsV/rXgq5COfYOnc1PGEr9U
	LzAEENqSyDmDmJ/ahoOt7YBFdLG1++zpcd8A7rLh9s9oyYVdj0aRNcoSlmLtEt6Ix4M4gTUnzir
	kTrSJFozc/mFThQWYIL8We0ZZFHDDkdZdmygLu0nvFEAyhcjmOhLjWOMwFBhkLxuTeTIMFTPr3G
	B/1LnqqrZ0RwWE3KKuoLw=
X-Google-Smtp-Source: AGHT+IGaffzb8yHlNU55p9rF8t2TGW4QRT5HNlWnXs4LSZW3Gb59mNXLLVvwX2nvyEKIz0B5fJhCCw==
X-Received: by 2002:a05:600c:c091:b0:46f:b42e:edcf with SMTP id 5b1f17b1804b1-47117925d66mr115832685e9.40.1761154992519;
        Wed, 22 Oct 2025 10:43:12 -0700 (PDT)
Received: from vingu-cube.. ([2a01:e0a:f:6020:edfc:89e3:4805:d8de])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47494aad668sm43434755e9.2.2025.10.22.10.43.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 10:43:11 -0700 (PDT)
From: Vincent Guittot <vincent.guittot@linaro.org>
To: chester62515@gmail.com,
	mbrugger@suse.com,
	ghennadi.procopciuc@oss.nxp.com,
	s32@nxp.com,
	bhelgaas@google.com,
	jingoohan1@gmail.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Ionut.Vicovan@nxp.com,
	larisa.grigore@nxp.com,
	Ghennadi.Procopciuc@nxp.com,
	ciprianmarian.costea@nxp.com,
	bogdan.hamciuc@nxp.com,
	Frank.li@nxp.com,
	linux-arm-kernel@lists.infradead.org,
	linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev
Cc: cassel@kernel.org
Subject: [PATCH 1/4 v3] dt-bindings: PCI: s32g: Add NXP PCIe controller
Date: Wed, 22 Oct 2025 19:43:06 +0200
Message-ID: <20251022174309.1180931-2-vincent.guittot@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251022174309.1180931-1-vincent.guittot@linaro.org>
References: <20251022174309.1180931-1-vincent.guittot@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_104314_397043_C2B8D6EE 
X-CRM114-Status: GOOD (  13.90  )
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

Describe the PCIe host controller available on the S32G platforms.

Co-developed-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Signed-off-by: Ionut Vicovan <Ionut.Vicovan@nxp.com>
Co-developed-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Signed-off-by: Bogdan-Gabriel Roman <bogdan-gabriel.roman@nxp.com>
Co-developed-by: Larisa Grigore <larisa.grigore@nxp.com>
Signed-off-by: Larisa Grigore <larisa.grigore@nxp.com>
Co-developed-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Signed-off-by: Ghennadi Procopciuc <Ghennadi.Procopciuc@nxp.com>
Co-developed-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Signed-off-by: Ciprian Marian Costea <ciprianmarian.costea@nxp.com>
Co-developed-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
Signed-off-by: Vincent Guittot <vincent.guittot@linaro.org>
---
 .../bindings/pci/nxp,s32g-pcie.yaml           | 102 ++++++++++++++++++
 1 file changed, 102 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml

diff --git a/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
new file mode 100644
index 000000000000..2d8f7ad67651
--- /dev/null
+++ b/Documentation/devicetree/bindings/pci/nxp,s32g-pcie.yaml
@@ -0,0 +1,102 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pci/nxp,s32g-pcie.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: NXP S32G2xxx/S32G3xxx PCIe Root Complex controller
+
+maintainers:
+  - Bogdan Hamciuc <bogdan.hamciuc@nxp.com>
+  - Ionut Vicovan <ionut.vicovan@nxp.com>
+
+description:
+  This PCIe controller is based on the Synopsys DesignWare PCIe IP.
+  The S32G SoC family has two PCIe controllers, which can be configured as
+  either Root Complex or Endpoint.
+
+allOf:
+  - $ref: /schemas/pci/snps,dw-pcie.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - enum:
+          - nxp,s32g2-pcie
+      - items:
+          - const: nxp,s32g3-pcie
+          - const: nxp,s32g2-pcie
+
+  reg:
+    maxItems: 6
+
+  reg-names:
+    items:
+      - const: dbi
+      - const: dbi2
+      - const: atu
+      - const: dma
+      - const: ctrl
+      - const: config
+
+  interrupts:
+    maxItems: 2
+
+  interrupt-names:
+    items:
+      - const: dma
+      - const: msi
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - interrupt-names
+  - ranges
+  - phys
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/phy/phy.h>
+
+    bus {
+        #address-cells = <2>;
+        #size-cells = <2>;
+
+        pcie@40400000 {
+            compatible = "nxp,s32g3-pcie",
+                         "nxp,s32g2-pcie";
+            reg = <0x00 0x40400000 0x0 0x00001000>,   /* dbi registers */
+                  <0x00 0x40420000 0x0 0x00001000>,   /* dbi2 registers */
+                  <0x00 0x40460000 0x0 0x00001000>,   /* atu registers */
+                  <0x00 0x40470000 0x0 0x00001000>,   /* dma registers */
+                  <0x00 0x40481000 0x0 0x000000f8>,   /* ctrl registers */
+                  <0x5f 0xffffe000 0x0 0x00002000>;  /* config space */
+            reg-names = "dbi", "dbi2", "atu", "dma", "ctrl", "config";
+            dma-coherent;
+            #address-cells = <3>;
+            #size-cells = <2>;
+            device_type = "pci";
+            ranges =
+                     <0x81000000 0x0 0x00000000 0x5f 0xfffe0000 0x0 0x00010000>,
+                     <0x82000000 0x0 0x00000000 0x58 0x00000000 0x0 0x80000000>,
+                     <0x82000000 0x1 0x00000000 0x59 0x00000000 0x6 0xfffe0000>;
+
+            bus-range = <0x0 0xff>;
+            interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
+                         <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
+            interrupt-names = "dma", "msi";
+            #interrupt-cells = <1>;
+            interrupt-map-mask = <0 0 0 0x7>;
+            interrupt-map = <0 0 0 1 &gic 0 0 GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 2 &gic 0 0 GIC_SPI 129 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 3 &gic 0 0 GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
+                            <0 0 0 4 &gic 0 0 GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
+
+            phys = <&serdes0 PHY_TYPE_PCIE 0 0>;
+        };
+    };
-- 
2.43.0


