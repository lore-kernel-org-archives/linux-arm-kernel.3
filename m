Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F159C55160
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 10:44:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RhWNujsirI0jOvowDKbeq9EaWuRNqj98QVONJqH0X1E=; b=C1Ow2kbH7pha1dyVcwdTX7XUNf
	N2HqsJz/N9B018tISEdPsXrCTk8UxFjBEHr8hxAG4DnR0ahlpiRSPilGbjwmf9zVIFIWDguUbOsY4
	1yu7hM8bH1VhpTzF1hXUS2hGX2xlJ2Q6rymFnK+mRmLu0DuryE0ANXB3r+12yvHqA3Sr3JsxGfAG4
	/JgYYsBXZxPgObJeWhT/iCAHiRC956I8GKMZf6qCD3RQ2mQk7TuEqry5dkvVu1e+O5QvjflD339ne
	KiiAfQJoG6cib4CVWCR2vX0lZhUPF/LJgkROz5hNfcyqNn5IYRWZHu0LVOpX/2u8PaLpcFoc1dOSp
	UyRfAFWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOFT-0000000AFTZ-1nB8;
	Thu, 30 Jul 2026 10:44:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpOFI-0000000AFN7-2AUe
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 30 Jul 2026 10:44:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=RhWNujsirI0jOvowDKbeq9EaWuRNqj98QVONJqH0X1E=; b=orU3CQFjFEx9I/1q0sQlvEpunU
	TdXDB//fdvji16RtX37Y6P0Ry23zZ3USxPtsY1D1tWVf0/PNwNmwF0IftGg+PVjbyuzwGQJT3Pj2O
	Q86u95jEjlfw6TroRRHJ28NTCa3mp1Fvx4b/vGB/PhZc69PI96n+dPUbTAS7sntnrpZxNPbFU03pW
	2w/1smrN6xCAmf/OTVLgul52cHDblCXubXDixkA9XrqsoKLPTwasA0Gu5Ouc2TI1IZhVU51UMav6u
	i8xhhDIOgkYX97anJF0oLdtJwEiRxJud6e8orEuByOLR+T7Ct9+Xg/iMoCEUxFUmh777/VpntYgYe
	QL9PepeA==;
Received: from mx0b-00622301.pphosted.com ([205.220.175.205])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wpOFD-00000006asf-1K1P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 10:44:11 +0000
Received: from pps.filterd (m0241925.ppops.net [127.0.0.1])
	by mx0a-00622301.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UA4EdF3329173;
	Thu, 30 Jul 2026 10:43:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ambarella.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	com20210415pp; bh=RhWNujsirI0jOvowDKbeq9EaWuRNqj98QVONJqH0X1E=; b=
	jXa+Uae36PpC90tHvAFyjIzDqgpQaZglz1X85CGgeTbiMBku7Nl3QRoUXX4u66LN
	xFb7x0RgVH5m/WKvYuTVm3rKBRI+IreYEv5E+M30h+TMGzFN46Qa/QzPEAGD+M0f
	8Lt+IJrXbJxjezePxYBLa6nkuiyjb2aWuow4uDodbB2hO8TXM0feBIocE3lK4VAT
	CPmV1faBDyOXVfPcXEghyE15ocV7GF91I3EqaRqmwPdfocxakSW5/ISXkjwhYevs
	AmZznl5hT4XgE+X19px5UofDUyxAyR3Hd2blVA9Cf2cmzoimQeF0ann0VoHo55AA
	GC922bx5kdYcU0U/Icns9Q==
Received: from webmail.ambarella.com ([12.30.244.130])
	by mx0a-00622301.pphosted.com (PPS) with ESMTPS id 4fq8twhnb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 Jul 2026 10:43:47 +0000 (GMT)
Received: from ambtw-mbx5.ambarella.net (10.2.4.226) by
 ambus-ex-se2.ambarella.net (10.1.4.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.45; Thu, 30 Jul 2026 03:43:45 -0700
Received: from ambtw-cas3.ambarella.net (10.2.4.228) by
 ambtw-mbx5.ambarella.net (10.2.4.226) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Thu, 30 Jul 2026 18:43:42 +0800
Received: from shbuild7.ambarella.net (10.4.8.70) by ambtw-cas3.ambarella.net
 (10.2.4.228) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Thu, 30 Jul 2026 18:43:41 +0800
From: Long Zhao <longzhao@ambarella.com>
To: Arnd Bergmann <arnd@arndb.de>,
        Alexandre Belloni
	<alexandre.belloni@bootlin.com>,
        <linux-arm-kernel@lists.infradead.org>, <soc@lists.linux.dev>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, <devicetree@vger.kernel.org>,
        "Michael
 Turquette" <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, <linux-clk@vger.kernel.org>,
        Linus Walleij <linusw@kernel.org>, <linux-gpio@vger.kernel.org>,
        Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>, <linux-serial@vger.kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, <linux-kernel@vger.kernel.org>,
        Long Zhao
	<longzhao@ambarella.com>
Subject: [PATCH 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Date: Thu, 30 Jul 2026 18:43:24 +0800
Message-ID: <20260730104330.81367-5-longzhao@ambarella.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260730104330.81367-1-longzhao@ambarella.com>
References: <20260730104330.81367-1-longzhao@ambarella.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
X-Proofpoint-GUID: GUv3i7IBWAu9EPKs0Wuq5WebVmFi4sHm
X-Proofpoint-ORIG-GUID: GUv3i7IBWAu9EPKs0Wuq5WebVmFi4sHm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfXwjOXmroR+mrF
 g1f55CC4ZO+8j4Uc4xOorZDuU8Z9vh5mGePex7HEvV7axzR6yydisiJ6bX7RSk5nD1zYU1qbi48
 u+djlb0A3B4qvsxjAjKqYnOlGvzJJNqVcMh+MJtJySTsncgNj5IASZ58diHRI00blEUkB75Q8e5
 PE3ZYjjI1eealRbRRh0cfGHT/Ds4dkp+P2WgQmcX1GdBzFOz20WJhkuufmK3GxIMpH8alDMIoF2
 NABbRqQf3ACjzyOfAYOiJTceXzP9wau2K76FXZI7dNktqlTPGvq1eSVp/TxJmg7B+99MtzFkW3k
 a4l5c5tDm2j/9WKYS+80KY0MtidieLZDzLZ3p11AapGEuiwgD6/QrbX3N5tHelwAvFh4Hc0KGby
 SgusrWT1m8iWTl9aZ9VjViRoE+Ew4+z5oelQsACnTDvyJiXnCgyb9vi2o2KcHrrN+mr/Kg1ML/W
 jVdtDZgWa5+sE/qPFSg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA4MCBTYWx0ZWRfX8RpevsQ5jjuf
 D6c461uXXXdonoxZiEFgyRX96gOPLieQEDzhUUCV0xR6UEDfIKRUTrjjxA8Sq3SRIPX72TFCWd8
 VNy30C8hWDX0+AWn9O1VLj3/ruGvIzOQo0/PCSG2jOTwTh7ZmL+g
X-Authority-Analysis: v=2.4 cv=PNE/P/qC c=1 sm=1 tr=0 ts=6a6b2ae3 cx=c_pps
 a=DgnZYc2JwZ3KnY28M5UqXQ==:117 a=DgnZYc2JwZ3KnY28M5UqXQ==:17
 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yXVIz-0bn9infC194UBj:22
 a=KblO7da7ppA7TBl3N-nE:22 a=gEfo2CItAAAA:8 a=ppJngBeKAAAA:8
 a=hceH7U2dzhA7nS9dVpoA:9 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_03,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 adultscore=0 malwarescore=0 clxscore=1015
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_114407_676015_EA368A3A 
X-CRM114-Status: GOOD (  14.90  )
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

Add the CV75 pin controller binding and pinmux ID header.

Signed-off-by: Long Zhao <longzhao@ambarella.com>
---
 .../pinctrl/ambarella,cv75-pinctrl.yaml       | 167 ++++++++++++++++++
 .../dt-bindings/pinctrl/ambarella,pinctrl.h   |  11 ++
 2 files changed, 178 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/ambarella,cv7=
5-pinctrl.yaml
 create mode 100644 include/dt-bindings/pinctrl/ambarella,pinctrl.h

diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinct=
rl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.=
yaml
new file mode 100644
index 000000000000..8a331c642fad
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
@@ -0,0 +1,167 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/ambarella,cv75-pinctrl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Ambarella CV75 Pin Controller
+
+maintainers:
+  - Long Zhao <longzhao@ambarella.com>
+
+description:
+  The Ambarella CV75 pin controller configures pin multiplexing, bias and
+  drive strength for the main GPIO banks. Pin multiplexing entries encode
+  the pin number and alternate function with the AMBA_PINMUX() macro from
+  dt-bindings/pinctrl/ambarella,pinctrl.h.
+
+allOf:
+  - $ref: pinctrl.yaml#
+
+properties:
+  compatible:
+    const: ambarella,cv75-pinctrl
+
+  reg:
+    items:
+      - description: GPIO bank 0 registers
+      - description: GPIO bank 1 registers
+      - description: GPIO bank 2 registers
+      - description: IOMUX registers
+
+  reg-names:
+    items:
+      - const: gpio0
+      - const: gpio1
+      - const: gpio2
+      - const: iomux
+
+  interrupts:
+    items:
+      - description: GPIO bank 0 interrupt
+      - description: GPIO bank 1 interrupt
+      - description: GPIO bank 2 interrupt
+
+  ambarella,drive-strength-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: RCT syscon containing the drive-strength registers.
+
+  ambarella,pull-syscon:
+    $ref: /schemas/types.yaml#/definitions/phandle
+    description: Secure scratchpad syscon containing the pull registers.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^gpio@[0-9a-f]+$":
+    type: object
+    additionalProperties: false
+
+    properties:
+      reg:
+        maxItems: 1
+
+      gpio-controller: true
+
+      "#gpio-cells":
+        const: 2
+
+      gpio-ranges:
+        maxItems: 1
+
+      interrupt-controller: true
+
+      "#interrupt-cells":
+        const: 2
+
+    required:
+      - reg
+      - gpio-controller
+      - "#gpio-cells"
+      - gpio-ranges
+      - interrupt-controller
+      - "#interrupt-cells"
+
+  "^[a-z0-9-]+-pins$":
+    type: object
+    allOf:
+      - $ref: pinmux-node.yaml#
+      - $ref: pincfg-node.yaml#
+    additionalProperties: false
+
+    properties:
+      function: true
+
+      pinmux:
+        $ref: /schemas/types.yaml#/definitions/uint32-array
+        minItems: 1
+        maxItems: 96
+
+      bias-disable: true
+      bias-pull-down: true
+      bias-pull-up: true
+
+      drive-strength:
+        enum: [3, 4, 5, 6, 7, 8, 9, 12]
+
+    required:
+      - function
+      - pinmux
+
+required:
+  - compatible
+  - reg
+  - reg-names
+  - interrupts
+  - ambarella,drive-strength-syscon
+  - ambarella,pull-syscon
+  - "#address-cells"
+  - "#size-cells"
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/pinctrl/ambarella,pinctrl.h>
+
+    rct: rct {
+    };
+
+    scratchpad: scratchpad {
+    };
+
+    pinctrl: pinctrl@e4013000 {
+        compatible =3D "ambarella,cv75-pinctrl";
+        #address-cells =3D <1>;
+        #size-cells =3D <0>;
+        reg =3D <0xe4013000 0x1000>, <0xe4014000 0x1000>,
+              <0xe4015000 0x1000>, <0xe4010000 0x1000>;
+        reg-names =3D "gpio0", "gpio1", "gpio2", "iomux";
+        interrupts =3D <GIC_SPI 163 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 164 IRQ_TYPE_LEVEL_HIGH>,
+                     <GIC_SPI 165 IRQ_TYPE_LEVEL_HIGH>;
+        ambarella,drive-strength-syscon =3D <&rct>;
+        ambarella,pull-syscon =3D <&scratchpad>;
+
+        gpio: gpio@0 {
+            reg =3D <0>;
+            gpio-controller;
+            #gpio-cells =3D <2>;
+            gpio-ranges =3D <&pinctrl 0 0 95>;
+            interrupt-controller;
+            #interrupt-cells =3D <2>;
+        };
+
+        uart0-pins {
+            function =3D "uart0";
+            pinmux =3D <AMBA_PINMUX(44, 1)>,
+                     <AMBA_PINMUX(45, 1)>;
+            bias-disable;
+            drive-strength =3D <8>;
+        };
+    };
diff --git a/include/dt-bindings/pinctrl/ambarella,pinctrl.h b/include/dt-b=
indings/pinctrl/ambarella,pinctrl.h
new file mode 100644
index 000000000000..20463d5acc66
--- /dev/null
+++ b/include/dt-bindings/pinctrl/ambarella,pinctrl.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
+/*
+ * Copyright (C) 2026 Ambarella, Inc.
+ */
+
+#ifndef _DT_BINDINGS_PINCTRL_AMBARELLA_PINCTRL_H
+#define _DT_BINDINGS_PINCTRL_AMBARELLA_PINCTRL_H
+
+#define AMBA_PINMUX(pin, mux)  (((mux) << 12) | (pin))
+
+#endif
--
2.34.1

NOTE: This email (including attachments) contain Ambarella Proprietary and/=
or Confidential Information and is intended solely for the use of the indiv=
idual(s) to whom it is addressed. Any unauthorized review, use, disclosure,=
 distribute, copy, or print is prohibited. If you are not an intended recip=
ient, please contact the sender by reply email and destroy all copies of th=
e original message. Thank you.

