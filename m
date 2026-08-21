Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E7ADC5DF9B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 16:13:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=SdlhL0vqdpG3hWE7d4ve4rtcj5
	pK4W6Dibf4DPZy3+x/D2hPH+HfPw2K8/OBhg+Co8/yKzz3lJxzPbFrcVKDi9j2uClNr25F+sYS35d
	MeK9UtFVU8EODFYAfVzzzKdlDqJoInmWaIIJBRP1vDCkc80t9LSE3y3G4KtqtCI8hYNQJfviAJ9XF
	rhBqWa2CP0jemOO+9+SKlTUNzUJtyzPX0QVc3jQVvXH0eV3mqmD5pat8CqAeoiX7ovtNlQ8HW/sGO
	QrL0VSoHWXX5HvSDHiRDZ2ehKgiI5avBRhTxQefrN5GRhqzmKNLVpgtYbtjxeTRQdenXXIYvC6ScA
	vJ/mdEBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRr8-0000000DlT6-2DyS;
	Fri, 21 Aug 2026 16:12:34 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxRp7-0000000DlEJ-39gl
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Aug 2026 16:11:05 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67LFm9mg2832687
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:10:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=PPgLb3lwYUJG5+g0
	fvDX8DuCMbQHqT5CJKUFNy3H/gjJu01HE+uh+zeAB7nNSuRFJ38rJNbXeHWJcJaq
	B/kzKAoh3QkAb85xB1RribP/fRNwjngplIQU9P/PVICnayAvGyw0c79BKcpljzIL
	jJyrxP1kQ0LEnnsVnT30ptJYg2CAqWXamT9Bs598DixiGdiKYKbciUz67nDpVDoc
	woxYhb6L46ftHDcHOFr1Tbmzzdd1Sk1iHW6/uPxqo68rnyb/ULHR7cvJxGVcc9Ea
	P97ZMserwIs6kytqEkLqfBBBcKUottzi9cgsUEKYiYaLGPvYDHucNrmXq2G13VVV
	ED08Aw==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g6cdsk5na-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 16:10:29 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4ad778bacbeso2139959b6e.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 21 Aug 2026 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787328628; x=1787933428; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=ZtxFh3tkUygUdTIPHzs4QCtrLibGdF4x2uQHJ47C8Cii1eqCGf+xAVUsQYTAoj/+bL
         JhedO4+f7J2E3DoCjR8IG9dKGzA572p5DjLH4hr7xh8rbjBvEWEnu2Lq8tfpNOJhtJlU
         EsMTVplxfnCPkGNHIkxtRuqYCQl+esW6ESZyUXKUDrvofS4GCn/yPupXkg5UiV8TI1tG
         44UpNARO2sWam/4nqMr/CGnERJ9PeJfoH6kIfjGNTfIogX1gveOf24vl7xl0dBp/AugT
         VZKriv9fdc+iObS/L6shBtCxJ696FyGjW8sX0EiN9ONj5x/PXm+SLgp5ZMnyOYWa+G9j
         KNog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787328628; x=1787933428;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=MK3KyNP8AwddFygfddsSOa1iJqNvzfC3rNfWKX2Pyn6hCFwyGVUKUXu1q6kmQGoXt1
         2ZC/2iR8FZnTIk8yzsFobCvBOe2fYEnP4if6jZBItApKusCwDukqnav1Hn8LZECStQIp
         dDGT6c4KtAyzCmy7W8UKMu34+gDYGaG2Pj6w3lZWA+clBDTjRZwKp6vfhJiGBm5WQ0BX
         WKtea6j9Q7e/D3PnBx6rk/vU54LtyIT+Zrl+det30aEM/drXaGnvSLOwpE558mLhF4jE
         0uXw3AbSwyGMGr+JLARdglVyvOfQ/BIDiblvtuXPR5Gipl2WFWcLZVxNMmKBJd1WgllJ
         cLqQ==
X-Forwarded-Encrypted: i=1; AHgh+RqNJFbrSEmGFVESyUpzJq6F8pBBggdYavBl07OGOVzyveOq9MDMwkqNQ0LeMSktwZB38AKWbq7Vxt71+l536hrN@lists.infradead.org
X-Gm-Message-State: AOJu0YwqDDySLaSqolZkp8suxDgptF4iyXGq5SwQuAndulLNXy+icvOl
	g+U3wGhIdU3yVCJcRIAiy+KpQWHXy5Hw6llBvJa9LwANMmi1453F3i/6wPg9YkkQCQoITyDoEDw
	TDSYPfi9lFzSmRhd7HrHcplgBe1VHtbx8t5gSluOud6jjPBO6VGYhstWHO5QP2SS7qB1KGO070j
	6Efg==
X-Gm-Gg: AR+sD11oja8NNH9MogiXelrdMqRCU3JVSyvmlutV/6hlwisu2DjQ7BxcYOTYOKeQfKA
	0u5o4214m83fN4KqBhO0/l4az+xE+QTXSL+4LhLv88dEH9IylCXEGdRhsRp9saJSqKfL2+xl3zn
	Vx4syhiinamKexEC9LQju50qM4GGK60J5tEb6STUuIco3PCMlcTYqDVUr2VlURFeN61DkKZH2gk
	AQoaFfJ9ubweXsHI0pJhRxmPjnokBtyzYnbRD/aT9SPzch7HnoiCBRDtQopT6byEKxhT6WFhyqp
	dBRjy7IAGZeOlQS5ra3Ow/sjiWel4bGL7sFy8ZGuEvNSxSz+eT3FpoNdQvMlWkkj2tszXJeFap+
	gEn+pmfjp+S4JEWeQIDxZ8iq9Tb4ex9aRdbZONF2+0BHck6khuLQGoEb7wiLhsmpAOHmB2xo+s1
	hzTc+vqixSP7vk0YLuNZu+lvA=
X-Received: by 2002:a05:6808:4703:b0:4ae:f5be:fe30 with SMTP id 5614622812f47-4b2ef468b49mr7770359b6e.18.1787328627575;
        Fri, 21 Aug 2026 09:10:27 -0700 (PDT)
X-Received: by 2002:a05:6808:4703:b0:4ae:f5be:fe30 with SMTP id 5614622812f47-4b2ef468b49mr7770153b6e.18.1787328626352;
        Fri, 21 Aug 2026 09:10:26 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b2d6d34c8esm4804321b6e.13.2026.08.21.09.10.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Aug 2026 09:10:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Fri, 21 Aug 2026 21:39:01 +0530
Subject: [PATCH v3 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-kuno-soc-support-v3-8-196e2b306368@oss.qualcomm.com>
References: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
In-Reply-To: <20260821-kuno-soc-support-v3-0-196e2b306368@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787328540; l=3999;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
 b=Q8ZMyfCR02v6uEtw3VdSdFS9dyKXekOPxO3TtqHZoj3K4816tbpTbhYqHkkim/lnsQ8o+qV+P
 v6BsZGvbu9bC/aQR+sWrFAmb9kEc2bUcNItHHwaqPKy3uBIi4CPkbRG
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-ORIG-GUID: eVsI94yCFmYgQ1PaPvUyBds2ertZsAX8
X-Proofpoint-GUID: eVsI94yCFmYgQ1PaPvUyBds2ertZsAX8
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfXycKuRskZJ17b
 Sw4uAs36nqWm4oZkMJd/hwGDZ7MGZQMtL2Fkbw0p3/BBu78bBXhEEz4GIswXm5z0C5SHC25cdqN
 NRpuBlbRh7QoKlDsvm6Y/5SNy+dfMKQ=
X-Authority-Analysis: v=2.4 cv=RN2D2Yi+ c=1 sm=1 tr=0 ts=6a887875 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIxMDEyNiBTYWx0ZWRfX+wIeooCQWQ9x
 ORx5ptRgfrZq9bf3S6EsdSiX5QXoA8qW0VHBu81uPaB3TpSUg7OYW+knhRam+K7HSfio6tJpGZj
 Vpl0ZAyxjC3b+pBLoaipHOJLctRGarIq87fgzDyUg4TAYCskKauI6FTC2B8x+nisF+b2pIIOW1s
 +CrLbrj35bC9JiKQgrW5u9XKyZWJIfybod7N83DpUhvdICInEVIIBn1MHrRSyQsA2+/F4/WBNGx
 wKQlzD9lPU9iApB0gYONOTf/EOg8gsO9Fwbp5OeBFzKlCpRDdwPHED107pu3jwPYBIoe5SmQOcw
 TrsRQAWcLqPxl68kkAbCf2/F4gxkKfHLNJqEB+DOFPmISz7/5B90OnhiDiu5Kqs7Uce7a1G+pXw
 u7BZEuQNg/zRLEvM1sVTkoNfvFjclwZdqvVUp0IvhqpxGb+6k7foqUEMseQI0z/I3T6mF7hpAeX
 A2ELzKBgebuz0RWunkQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-21_05,2026-08-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 phishscore=0 spamscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608210126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260821_091055_000173_FD96699A 
X-CRM114-Status: GOOD (  16.79  )
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
 .../bindings/pinctrl/qcom,kuno-tlmm.yaml           | 110 +++++++++++++++++++++
 1 file changed, 110 insertions(+)

diff --git a/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
new file mode 100644
index 000000000000..2250526dfae2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pinctrl/qcom,kuno-tlmm.yaml
@@ -0,0 +1,110 @@
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
+                qdss_cti_trig1, qdss_cti_trig1_mire, qdss_gpio_traceclk,
+                qdss_gpio_tracectl,
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


