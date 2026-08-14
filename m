Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93E4CC5B572
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Aug 2026 07:33:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=; b=NKF7OtrTbjIyYh8hSMq+h+sUNp
	KoJswZkJqtg6niqzpigQ570feXTf1ha4W0XFLLYw8Zwj6RomHtBRomPTRtMijnqdYYtkBkwByEsOz
	/xIGObLplS4L1idvSvl9bLM+c36NB2GXGrxkJboAFiUhML4mWy+KYmVVXiW2kBe1+A+YqoUR7E6rP
	Cm3CWsdYyiILy6o4Yv7KO0eAxoOZ2h0BLVPaITOGu5s8uBpVZcPruebQdM8r9D+Gyl2MtjnJZvX/6
	/AGJ6ntZLGQ1ek48fLkjBX8Ofp/8LlNg/uVlZI/vKE9aOgvwmt0ZzwXj/iU2sKP7KmWUn9V7uxPua
	sQURpFDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPi-00000002AXx-1hBv;
	Fri, 14 Aug 2026 07:33:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wumPf-00000002AVJ-3qmd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Aug 2026 07:33:13 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67E4QX53282846
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=; b=JO7d7EFRu2glBHAw
	bAN6yPdczbHuZT1pSDgP9hlRmEqT6vOP87+s8dHg4552v7Tk12oQLe0lIqbF4eKM
	op+GKvuYKB930gzHJ6FFgNUaBYrN+6lNPQJZih9uHF0xsuFfopszmdtxghveuzSe
	hgfC4jWrQsut9KLyUIJdFiyWKgoutmhpI7yCaQ1gUYaRUCBoe63lBNjHxHa43A/5
	fzysoF61a8zX/XmeAowlHubC3SrUHYe6Zi7suXXBP5Ly5q3DtG2VxR3/Ze2hVHQ2
	zWbBRU/2DtMYNstHb+mhw10DjMJw/b9p2FXY7wWP0mjywQCbB0PXYdNo0FXzQdkM
	w/WPcg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g1h90u5ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 07:33:10 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e8e864ef0so1105661a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Aug 2026 00:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786692790; x=1787297590; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=;
        b=I4pijS59QeIGVN5DUZhmiYDMQ2ZfN9zH6Hfma2vMz20otGs7ICmb/zEXXkL3He8uuk
         hLJJvvzfPspFyzn2R+9Pa4Jd19olfZqS+t22s77BhYl+Zk+9+hIaTzHWOdoGlK+9WTtD
         iiAyo97zFniufE+3wAHfs+Vl2mEKJcOl/6wnwoq0ktd++uNxFpFqC6N6HRysONdv+BNS
         cXsUfD/hYi2uxybkB2ako4ahvWhurIlm6yY7Bumb9oB3M968G97OWEuTnM1mVXZjwcyt
         o2oCXaOMMEC2PFwu17MsVv3RobWOjITGALt9nyLAYPT82IXeOO1e7ZVSyNfUtqbaiVT2
         c1Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786692790; x=1787297590;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=A3v6CEl22R3ZSvcqUczYoW5Tyuq2qb91XkxugMVwZ7o=;
        b=JDK/kgyU7PQQn46O3QwYbW1WKQI04NTIHYRFyCJ4lBbKjEkQWFE5uWV7uXKI3nFaLp
         UEQyvwgewY4m7ekC6E8pSXUit3PUBWbD4veQugHXwIyTK4/uRzhVsnYVH2qx+HmYiXXk
         Q9clOAqx3GXzzMAMs5PUxErlO+bNGs6L29wK6eE/0+PEW30Q/jqvbkomw4rbMhaoXtTh
         gqTNIyLxx+YI/jx4I3943PU4r8c6RqHeV2jikQXOsmD05SI9ONLNMO4rkTN0TMyAAfA1
         6hZMPVKcaxRaK28MVEfF7gXgDBEy0QfbiZUgovqBu1aLdqVWT97Y9Jwz1IfjbnmqBPTn
         eKiA==
X-Forwarded-Encrypted: i=1; AHgh+RoU+jpOsP98IPHej+BWNQNK7kmo+V/5embtSrlooIab//BuusaNseJTQncivxCVFKsqtQU1ilXq6QDCrLY+7MJ7@lists.infradead.org
X-Gm-Message-State: AOJu0YyqJaH5ZEyMJdLsWHAD1dMRoegRwDvin/6JxQwHfhZ0nQxbyBJw
	lx935EtcoKeHYU8OQuFOgH+Unf7BL8pz3qjWJNBzx5l3/LlF51doFv41fUwI0aJTwbRmwryhF8m
	WQC37nr2uvcHQuJuFq0BxKxvpcPu0V5aLy6q36ksRgHn6LjAkJNc1hxXteYkazFYBugdip8fR4+
	sDsQ==
X-Gm-Gg: AR+sD10ki9mGQxN1PfIAjMiRXmkiPMFLLxbmoC3/eJc2ok2qWO9Fz1deWPKjgPbykSv
	3EqlBjWB/bzjcgAp4nhgbYtXdgXoMA3aFcBjQchqy5nvBhHSiYBj7UAPelbMOATGssPkas0dt3N
	czPTkzH/dgm5aeyUTePsaiYYbhW8kAIufpJFeuHSUcWR0UZKNk8jN3IV8KzWIpVePhCs0dtAhHr
	ZOf34wYGYfV2+Kz7kDY/n5YebnkPbwau1KavzieEWVPH38LZ5lPr7zVQp/jmTpGnLFhVo/tiyzA
	0XnxUV6WjJslNz1k7dc4zQ7V9cwRcADunbxAWMZy9bw/m66VBIEbG8btP5CTZ7RpFy+b5lKaioE
	fXqG1TkgUPXTQb3omvmaJnq0Bbuw8Y2rljIz2AIrfkUGKV+gh97skGFcrv6OOa7zidRsIS9x2/N
	fUAFcRBh9BpoxdfXLZ3bRhKyM=
X-Received: by 2002:a17:90b:1f88:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3933bd46d96mr4390041a91.20.1786692789848;
        Fri, 14 Aug 2026 00:33:09 -0700 (PDT)
X-Received: by 2002:a17:90b:1f88:b0:392:c868:35af with SMTP id 98e67ed59e1d1-3933bd46d96mr4389986a91.20.1786692789380;
        Fri, 14 Aug 2026 00:33:09 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-320ea804233sm1062280eec.26.2026.08.14.00.33.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 00:33:08 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 14 Aug 2026 13:01:39 +0530
Subject: [PATCH v2 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260814-kuno-soc-support-v2-8-3079794f0f73@oss.qualcomm.com>
References: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
In-Reply-To: <20260814-kuno-soc-support-v2-0-3079794f0f73@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Taniya Das <quic_tdas@quicinc.com>, Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786692714; l=3960;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=4z/M2eUF++qMVVESopEVCO5xHLKHISN/jqlSOg71SV4=;
 b=hEeDgEgfigIgPHtEobpT5LzskiygxdZVnX2CdaOAWLjSjBFijGbnfdypOdmfi+V70J0wZrgYV
 9Uxtp4FCfLTAxs6dYTuBNUJPLrrVOKEgljY70GNM4h2fQK31poTO2zu
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Authority-Analysis: v=2.4 cv=Ovh/DS/t c=1 sm=1 tr=0 ts=6a7ec4b6 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX+cd3dRDqt4Fo
 EXyZD2E1jXTykQEG8mO7R6sjSUht4/jD6HmNdPbBQ0qHwEXbOrioBu5HBnsyyrVPJFaPbbrB/K+
 Mt2Z0PacF0XloF4s3Gbkpo2NZymgADw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE0MDA1OCBTYWx0ZWRfX47lyWAzZKLDn
 JRe4kyJ0FUCYYeb6HQsfKNUqO6jv+h8mUDoXuoXK/1uQSksBJhUYvwEfLyeHUJAdLkqUoZT1lDM
 CqWjy27PDn3J7asrYjOwnBVfbMgaE5FKPhLaAXL4Au64Ze0E4QvF8gx//lMl+bEjtLbfyZ4kozl
 GIaTp8gnhFBLMm+gfOjpd6IRyIEtxZJjjj3EGsVNiOOUePUGcjn6u1vSvDMWEJiYrlZPvnsU7BH
 OlMxBoIEbd/bgP2g91ggfQn0jfroW7CmYQXQvbheibpyu6Hx9kLkYOGTpN+xV1A+Hzifo32PsJa
 Kd/Gd+YZJ6ny39UIj8wQJxgeG5EQz5no9PpQY9w6BGLwt0dkA0SSLkTaixb5xqBdP2cBGZ6hwSh
 7MCMnrG7rE+mW7DoheJXydWdWlIQ85+AMzU1f72gJjJgToHVFl/ZL1/VztQNn/ykVXm75Y8tsNE
 m7zhMs/EO0+F3kh2e8w==
X-Proofpoint-ORIG-GUID: KK0UG4E16ZGjR1qpqN2yNMaMqrl1c5eR
X-Proofpoint-GUID: KK0UG4E16ZGjR1qpqN2yNMaMqrl1c5eR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-14_02,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1011 phishscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608140058
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260814_003312_110162_82E0555E 
X-CRM114-Status: GOOD (  16.52  )
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

Add device tree bindings for the Top Level Mode Multiplexer (TLMM) pin
controller block found on the Qualcomm Kuno platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
---
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..6db65d2e1c23
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,109 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pinctrl/qcom,kuno-tlmm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Technologies, Inc. Kuno TLMM block
+
+maintainers:
+  - Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
+
+description:
+  Top Level Mode Multiplexer pin controller in Qualcomm Kuno SoC.
+
+allOf:
+  - $ref: /schemas/pinctrl/qcom,tlmm-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,kuno-tlmm
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  gpio-reserved-ranges:
+    minItems: 1
+    maxItems: 55
+
+  gpio-line-names:
+    maxItems: 110
+
+patternProperties:
+  "-state$":
+    oneOf:
+      - $ref: "#/$defs/qcom-kuno-tlmm-state"
+      - patternProperties:
+          "-pins$":
+            $ref: "#/$defs/qcom-kuno-tlmm-state"
+        additionalProperties: false
+
+$defs:
+  qcom-kuno-tlmm-state:
+    type: object
+    description:
+      Pinctrl node's client devices use subnodes for desired pin configuration.
+      Client device subnodes use below standard properties.
+    $ref: qcom,tlmm-common.yaml#/$defs/qcom-tlmm-state
+    unevaluatedProperties: false
+
+    properties:
+      pins:
+        description:
+          List of gpio pins affected by the properties specified in this
+          subnode.
+        items:
+          pattern: "^gpio([0-9]|[1-9][0-9]|10[0-9])$"
+        minItems: 1
+        maxItems: 36
+
+      function:
+        description:
+          Specify the alternative function to be configured for the specified
+          pins.
+        enum: [ gpio, audio_ref_clk, coex_uart, ebi2_lcd_a,
+                ebi2_lcd_cs, ebi2_lcd_reset, ebi2_lcd_te, emac_mdc, emac_mdio,
+                emac_pps_in, emac_ptp_aux, emac_ptp_pps, gcc_gp1_clk,
+                gcc_gp2_clk, gcc_gp3_clk, mi2s0_data0, mi2s0_data1, mi2s0_sck,
+                mi2s0_ws, mi2s1_data0, mi2s1_data1, mi2s1_sck, mi2s1_ws,
+                mi2s_mclk, nav_gpio, pci_e_rst,
+                pcie_clkreq_n, pll_bist_sync, pll_clk_aux, qdss_cti_trig0,
+                qdss_cti_trig1, qdss_gpio_traceclk, qdss_gpio_tracectl,
+                qup0_se0, qup0_se1, qup0_se2, qup0_se3_mira, qup0_se3_mirb,
+                qup0_se4, sdc4_clk, sdc4_cmd,
+                sdc4_data, sdc4_tb_trig, sgmii_phy_intr, spmi_coex_clk,
+                spmi_coex_data, spmi_vgi_hwevent, uim1_clk, uim1_data,
+                uim1_present, uim1_reset, usb2phy_ac_en ]
+
+    required:
+      - pins
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
+    tlmm: pinctrl@f000000 {
+        compatible = "qcom,kuno-tlmm";
+        reg = <0x0f000000 0x400000>;
+        interrupts = <GIC_SPI 212 IRQ_TYPE_LEVEL_HIGH>;
+        gpio-controller;
+        #gpio-cells = <2>;
+        gpio-ranges = <&tlmm 0 0 110>;
+        interrupt-controller;
+        #interrupt-cells = <2>;
+
+        spmi-state {
+            pins = "gpio78", "gpio79";
+            function = "spmi_vgi_hwevent";
+        };
+    };
+...

-- 
2.43.0


