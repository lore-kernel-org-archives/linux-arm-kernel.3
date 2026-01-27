Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F98ED2FEDC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 19:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:
	From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L2WGzxcUI3nAQ2/FLgph/gl4hpJAAImGCNEHoLFOXz4=; b=OF/VbOOVwgq7IWvq1OybZzWnYE
	0NaYRxH5XV4qHybS7X9C10maffVO6sF45ExoteAPg6gd5eum/9V2dviS9nElJwCKQyBorwZrFPaS6
	RNgruRtTYPgbq1S9Bh/hnCZzEGyLrBJF/siEh6zynxBRO+FQWQHJkcQDjX1J3rcm95OoMJuW0CDzi
	jABcFRlA6xDhrq98anMvCNYtiNQKsXJHbbu2snK6D4u8vwFMdqDisHanmydhH+fGtJHBuFoiUZNi1
	Oqbw5EJL+eDhUEV9ELbeXvYqwpYhhgi5Axuvjo9RFpXdra42tecOegdESkuGU44mTlVrw9R+a8qG9
	Gr2fWZug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYM-0000000Eu20-0Jtt;
	Tue, 27 Jan 2026 19:16:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoYC-0000000Etxx-0jme
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 27 Jan 2026 19:16:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Sender:
	Reply-To:Cc:Content-ID:Content-Description;
	bh=L2WGzxcUI3nAQ2/FLgph/gl4hpJAAImGCNEHoLFOXz4=; b=PSNl6IxVLe4+fklVRzHEhm5uc6
	Tun3Ozqe1XgHLiOBhkXNqCgwdZljkx7OXiYMglOcvMZFxTo2E1CffPpervVy+B6wGtQ5WjkL6noR9
	Dgq8ypfbXjegk4IaAUeZN+l0Oj5nbpQLuf+theDuZnDyPwHLjE5g9mPc89zQlHgxFIScC1E7uvvEx
	E0rkAbkkS62xiWdRSHoyeC39EIgin3OeBLBO8eYQMv6mMtjYYP+oDnl4B9+7S50KWVuGupTVlPzeS
	tFQ86HfzHDKM0vyfcNBNkkAQb2bLzHb3Xcchru3VCNQVPa9JezRxjVhsbruQcMkawIutNnekQOgn1
	b+i06xog==;
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkoY8-00000007UQO-4649
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 19:16:31 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-4806e0f6b69so4965e9.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 11:16:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769541386; x=1770146186; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L2WGzxcUI3nAQ2/FLgph/gl4hpJAAImGCNEHoLFOXz4=;
        b=jAJd9lCOmr6G6DWzj/gDewFa2ghNmOoqpLBBH6RWaOPnS7UeL7To0dO+QIXru+lB1E
         ROhabZ/if0i/vHdOq/00YEQRYNvWAwvJDqsP4yKU6m4qbVfmS620RW8rVK40PgOLqDch
         p7Nd7CL2cQioGcOwQ6LHBHdXcsBKDIGUoGJmAKglwkB1mqBy2ObGEfirPb5YPPaFuYTh
         dRxtkR8jBtdUe2mr6E7ow5NAkzMCcbFsjwdcuUNRo7CjztpzZ+D53nK6klj6eLpoSZvD
         C4g8Q4AwE+nwBSBGpjMdlQ0x3pqqJoq7ISOB5ZEAlnJHvOjIIXrXWdbYxGmyO3SfZys+
         Z/kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769541386; x=1770146186;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=L2WGzxcUI3nAQ2/FLgph/gl4hpJAAImGCNEHoLFOXz4=;
        b=WbF6LkFH6DEV6O6c7pjjHOxlEqPmxnx7fINg/8bxGfL7Z4P2eMHhruuZAViisenDJr
         6cD/MCMPNk7BgztW77hPnQYsJ1+NZZ5Ea5qxanVrUOnTBOXB7qd0C5FjjFY5G+DGbatr
         uyYMoynu2ZXjjZHIyIjBYpFfbQk/IK295LoG3iR9tcJBDWWTTee5AuM0tzAa9GLpN3QD
         GU1LBnu8PZJf4oCJhpB7pdIYpDOmA3vRzq1pxcSJEUoxJwPFqRuUExsksIKmX8NkBequ
         QJxqEVSS0NJZQdmdFBqCiOKLRH4KGJOlBl5jt/El5N8pqAFyc4LwujU03MhiMAyidzRz
         Rauw==
X-Gm-Message-State: AOJu0YyMqHa+SM6rvdifzziOwS8OMqhSiqLvOFebE7bnf/vKqGN0Qng5
	HU0nKmFBYdqhSGzeWXM2Qnd04+53qOnpZRWV4Syv6mTmywOwTgUffT8RrGJPug==
X-Gm-Gg: AZuq6aLA9HeAdskVHiZPpJJqkQhXro44oqHDZzsMqvWvz5tGrSnIvGTcarBdMVR95gM
	O4zf95xxg8xCeV9C3dJJelPuxJqSywOD4QG3siNzbZHam7Vv48dWtgzpNRWGurj/ZF4t6eLhId+
	xIEfm/0GUyLTnqCAMsDc109gTYfmuxQGmiRjBEls1pc3ei7h0EvSVZjXpwtIrsdKq7ydAu+dh9B
	JeM+C71wLDpu4p9CWHqN03DH3gPF4+DMPAAD+Bh0W64cywujg9ob+FHXZQVMEWO1H5dcv8Nj1qX
	HWmgxaURGxIPqsjtOfQcMBATMpjeFKU2Btk60TzsQdC6aCh277PtmCHsQT9ZCaMqiCI6eFlnKFW
	W1UIcT6T0RPjM9YAzdM8Z0fN+xprJK+T3AEFqcFtq46hGRP+VG0ec55kwnlqpGBrIQimqb3VaO3
	71UnqLyeLhEurnqtS3jsEDFMJL
X-Received: by 2002:a05:600c:4e8b:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-48069bfaa4bmr30079675e9.5.1769541386182;
        Tue, 27 Jan 2026 11:16:26 -0800 (PST)
Received: from strix.doe.home ([197.250.227.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4806df6056esm931525e9.2.2026.01.27.11.16.24
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 11:16:25 -0800 (PST)
From: =?UTF-8?q?Stefan=20D=C3=B6singer?= <stefandoesinger@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/6] ARM: dts: Add D-Link DWR-932M support.
Date: Tue, 27 Jan 2026 22:16:13 +0300
Message-ID: <20260127191618.551317-3-stefandoesinger@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260127191618.551317-1-stefandoesinger@gmail.com>
References: <20260127191618.551317-1-stefandoesinger@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_191629_244992_CD6D6801 
X-CRM114-Status: GOOD (  23.84  )
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

---
 Documentation/arch/arm/zte/zx297520v3.rst     | 102 ++++++++++++++++++
 .../devicetree/bindings/arm/zx29.yaml         |  20 ++++
 arch/arm/boot/dts/Makefile                    |   1 +
 arch/arm/boot/dts/zte/Makefile                |   3 +
 arch/arm/boot/dts/zte/dlink-dwr-932m.dts      |  21 ++++
 arch/arm/boot/dts/zte/zx297520v3.dtsi         |  38 +++++++
 6 files changed, 185 insertions(+)
 create mode 100644 Documentation/arch/arm/zte/zx297520v3.rst
 create mode 100644 Documentation/devicetree/bindings/arm/zx29.yaml
 create mode 100644 arch/arm/boot/dts/zte/Makefile
 create mode 100644 arch/arm/boot/dts/zte/dlink-dwr-932m.dts
 create mode 100644 arch/arm/boot/dts/zte/zx297520v3.dtsi

diff --git a/Documentation/arch/arm/zte/zx297520v3.rst b/Documentation/arch/arm/zte/zx297520v3.rst
new file mode 100644
index 000000000000..497ba5091194
--- /dev/null
+++ b/Documentation/arch/arm/zte/zx297520v3.rst
@@ -0,0 +1,102 @@
+====================================
+Booting Linux on ZTE zx297520v3 SoCs
+====================================
+
+...............................................................................
+
+Author:	Stefan Dösinger
+
+Date  : 27 Jan 2026
+
+1. Hardware description
+---------------------------
+Zx297520v3 SoCs use a 64 bit capable Cortex-A53 CPU and GICv3, although they
+run in aarch32 mode only. The CPU has support EL3, but no hypervisor (EL2) and
+it seems to lack VFP and NEON.
+
+The SoC is used in a number of cheap LTE to Wifi routers, both battery powered
+MiFis and stationary CPEs. In addition to the CPU these devices usually have
+64 MB Ram (although some is shared with the LTE chip), 128 MB NAND flash, an
+SDIO connected RTL8192-type Wifi chip limited to 2.4 ghz operation, USB 2,
+and buttons.
+
+Some devices, especially the stationary ones, have 100 mbit Ethernet, and an
+Ethernet switch.
+
+Usually the devices have LEDs for status indication, although some have SPI-
+connected displays.
+
+Some have an SD card slot. If it exists, it is a better choice for the root
+file system because it easily outperforms the built-in NAND.
+
+The LTE interface appears to be run by a separate Cortex-M0 CPU that runs a
+non-Linux binary blob and communicates with the main CPU via RPMsg.
+
+2. Booting
+---------------------------
+
+Generally CPU and GICv3 need to be set up according to the requirements spelled
+out in Documentation/arch/arm64/booting.rst. For zx297520v3 this means:
+
+1. GICD_CTLR.DS=1 to disable GIC security
+2. Enable access to ICC_SRE
+3. Disable trapping IRQs into monitor mode
+4. Configure EL2 and below to run in insecure mode.
+
+And an unrelated: This needs to be moved into a driver eventually:
+5. Configure timer PPIs to active-low.
+
+The kernel sources provided by ZTE do not boot either (interrupts do not work
+at all). They are incomplete in other aspects too, so it is assumed that there
+is some workaround similar to the one described in this document somewhere in
+the binary blobs.
+
+The assembly code below is given as an example of how to achieve this:
+
+#include <linux/irqchip/arm-gic-v3.h>
+#include <asm/assembler.h>
+#include <asm/cp15.h>
+
+@ This allows EL1 to handle ints hat are normally handled by EL2/3.
+ldr     r3, =0xf2000000
+ldr     r4, =#(GICD_CTLR_ARE_NS | GICD_CTLR_DS)
+str     r4, [r3]
+
+cps     #MON_MODE
+
+@ Work in non-secure physical addres space: SCR_EL3.NS = 1. At least the UART
+@ seems to respond only to non-secure addresses. I have taken insipiration from
+@ Raspberry pi's armstub7.S here.
+@
+@ ARM docs say modify this bit in monitor mode only...
+mrc     p15, 0, r3, c1, c1, 0
+mov	r3, #0x131			@ non-secure, Make F, A bits in CPSR writeable
+					@ Allow hypervisor call.
+mcr     p15, 0, r3, c1, c1, 0
+
+@ AP_PPI_MODE_REG: Configure timer PPIs (10, 11, 13, 14) to active-low.
+ldr	r3, =0xF22020a8
+ldr	r4, =0x50
+str	r4, [r3]
+ldr	r3, =0xF22020ac
+ldr	r4, =0x14
+str	r4, [r3]
+
+@ Enable EL2 access to ICC_SRE (bit 3, ICC_SRE_EL3.Enable). Enable system reg
+@ access to GICv3 registers (bit 0, ICC_SRE_EL3.SRE) for EL1 and EL3.
+mrc     p15, 6, r3, c12, c12, 5         @ ICC_SRE_EL3
+orr     r3, #0x9                        @ FIXME: No defines for SRE_EL3 values?
+mcr     p15, 6, r3, c12, c12, 5
+mrc     p15, 0, r3, c12, c12, 5         @ ICC_SRE_EL1
+orr     r3, #(ICC_SRE_EL1_SRE)
+mcr     p15, 0, r3, c12, c12, 5
+
+@ Like ICC_SRE_EL3, enable EL1 access to ICC_SRE and system register access
+@ for EL2.
+mrc     p15, 4, r3, c12, c9, 5          @ ICC_SRE_EL2 aka ICC_HSRE
+orr     r3, r3, #(ICC_SRE_EL2_ENABLE | ICC_SRE_EL2_SRE)
+mcr     p15, 4, r3, c12, c9, 5
+isb
+
+@ Back to SVC mode. TODO: Doesn't safe_svcmode_maskall do this for us anyway?
+cps     #SVC_MODE
diff --git a/Documentation/devicetree/bindings/arm/zx29.yaml b/Documentation/devicetree/bindings/arm/zx29.yaml
new file mode 100644
index 000000000000..d6ee850b0373
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/zx29.yaml
@@ -0,0 +1,20 @@
+# SPDX-License-Identifier: GPL-2.0
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/zx29.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ZTE zx29
+
+maintainers:
+  - Stefan Dösinger <stefandoesinger@gmail.com>
+
+properties:
+  $nodename:
+    const: "/"
+  compatible:
+    oneOf:
+      - items:
+          - const: zte,zx297520v3
+
+additionalProperties: true
diff --git a/arch/arm/boot/dts/Makefile b/arch/arm/boot/dts/Makefile
index efe38eb25301..28fba538d552 100644
--- a/arch/arm/boot/dts/Makefile
+++ b/arch/arm/boot/dts/Makefile
@@ -39,3 +39,4 @@ subdir-y += unisoc
 subdir-y += vt8500
 subdir-y += xen
 subdir-y += xilinx
+subdir-y += zte
diff --git a/arch/arm/boot/dts/zte/Makefile b/arch/arm/boot/dts/zte/Makefile
new file mode 100644
index 000000000000..416c24a489cd
--- /dev/null
+++ b/arch/arm/boot/dts/zte/Makefile
@@ -0,0 +1,3 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_SOC_ZX297520V3) += \
+	dlink-dwr-932m.dtb
diff --git a/arch/arm/boot/dts/zte/dlink-dwr-932m.dts b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
new file mode 100644
index 000000000000..b38b0f2bee8b
--- /dev/null
+++ b/arch/arm/boot/dts/zte/dlink-dwr-932m.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * D-Link DWR-932M Board
+ *
+ * (C) Copyright 2026 Stefan Dösinger
+ *
+ */
+
+/dts-v1/;
+
+#include "zx297520v3.dtsi"
+
+/ {
+	model = "D-Link DWR-932M";
+	compatible = "zte,zx297520v3";
+
+	memory@20000000 {
+		device_type = "memory";
+		reg = <0x20000000 0x04000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/zte/zx297520v3.dtsi b/arch/arm/boot/dts/zte/zx297520v3.dtsi
new file mode 100644
index 000000000000..6c1b22a64713
--- /dev/null
+++ b/arch/arm/boot/dts/zte/zx297520v3.dtsi
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: GPL-2.0
+
+
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a53";
+			reg = <0>;
+		};
+	};
+
+	soc {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		gic: interrupt-controller@f2000000 {
+			compatible = "arm,gic-v3";
+			interrupt-controller;
+			#interrupt-cells = <3>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			reg = <0xf2000000 0x10000>,
+			      <0xf2040000 0x20000>;
+		};
+	};
+};
-- 
2.52.0


