Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94F70C61DC4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 17:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=oYVOc/pPijVr8XmblSY4dcMWVJ
	eboomY3SoB0nDq/JZ07w6LIQyzeKPbrt2P3HLeOI8V4tqjuvDpu1ZqK36s0xAi/z6czRT/imb7Q9l
	yuCylB/w2TklAzVQFt+3wOuy6DJYM19psDs8qEiZGPbhuVGwrS5o1OTrdpF+Zwk+cbXO0i4Nk2zZ0
	AQL5rqKvPeCM6ClwbijZRI1zKTVPM21Vui4exfY4WkyLHEtlz6hof75tzqezGm8FYdcLwnu3cN5rU
	QlOm0FrFaXYv695LzHOapipdNHF02xY4L+PV29fiizPfQB+vMpU5h1Z2b2ZF25fiWmHEt4+CH+TTQ
	QeKQ1oPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeHI-00000004Vln-3o8s;
	Thu, 27 Aug 2026 17:52:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzeH6-00000004Ve1-0HNv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 17:52:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RHXd6Q614581
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=bOhbLiwnothWZ6J1
	2k3OkBYm24gbYy7eH0y5xykv8V4Hh9DyGa1BsJkCUeMEt0owX11la+1aiTwRrWfV
	GFm/v6SA6mz7JHHuouJXS5aNYay5xcGk1QWF9g66GmfXxuEQiJGoSeAB/lAywKG7
	2VG/4jRJzIB9w5kxqoUjg2Z4ezrJs1+wggnugypTvql4jJz4gTHfP/o/0/lJel2+
	IjZxBemVfxU0WSXQdhACi4XZS2E1sk+WvVhF9TQ91GIng0RoX5pCQT+/cK4gtCRC
	G7Sjswly7Kr3mCkjDokOnW5bwNTIkWzCYakbZ5s261rDCxCUf2h6BcS9E0K93Kbn
	CDgSpg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ganr698ey-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 17:52:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d54187d8b0so2178135ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 10:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787853146; x=1788457946; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=dwmHw+bKx4flYKVqub0jj9+8zMlsrT9UHrdr/6OsJNAfkctR6VFBfRhdqRxd4cBvpT
         0MzSH47X5lUaBseP83tSUE/UfumU6hmAb2JWhvNhhLYebGUKBeZNpn5Y8PSVKzslu6Bf
         NmcBRvxM8B138ZNujxPztFpBNpQ1ZOpIM5k7rDbjoENGPyFxZxfQbRgi1T2pE5q0opHb
         JIXPTIXW2nkzZCe3xi/addTl2hyraObCFWOCp0TBXKMqyXj1gLR7vNS1ZqnW5F/MzoX7
         3KCWRt9LMkAHsO86TUBiWQVqh28jXD/PmVMSE61i64r9ArmYAdUvHtAUjTRD6N/MM9hk
         fF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787853146; x=1788457946;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=RvJUF92i7fXqZzO5y4rokQjLRHtyhWvpz39AoMYOLjQEkwWNVtWs/P9jAvlOKUgWjP
         f5W2BRFr4i79VUNKhQxRm0Eae3evS/WcnhewLJPO899TFob8GfdLZnktz413W68TZMWA
         BE8QcevROl0obxb/PSHAsOR6XjdZhzKdi6TmfsrsrE9eESDszIW/ReGCBE+WshrZBVJx
         CVw7zk0Cg1E6aF4nriwnn+SMQlHCeicEw0jzK44v5bch/Z3uRik3Ddhc4dJ4LqgsTqcF
         SmVwsCNarpTBimxEyOfS4LW3vffUA22Kohxaui1zpmyMXrmQ8//OZkOa3A+5i7CmxbAD
         xM0Q==
X-Forwarded-Encrypted: i=1; AHgh+RqFgOzEwUXQX/+rkMA9vAbJ9l/RHy1sV5bwgCiJWpJuM8ehRxZJ4xRiwoPwhbsSmjetauRKrqrvmrceT4shPQJm@lists.infradead.org
X-Gm-Message-State: AFuF++lMiUqqgt2PF7MR1bWutdm4OIlm/+25k5/q/suDB06aKLEYRUpg
	3hDU9HWHoH2JByIh+GrKI4uFOOyGO9SsEcH9BeDl6QZEBOA8muT5OJFdavOLc5p/+bzJlSowNxw
	LGFiA3khG4cPrsH6wLY2swxF7dxxogBYLTTdy4NAPLm7q3pXCOBavnTRQMFjqVmHcv/OR7LV6dX
	ysYw==
X-Gm-Gg: AR+sD10o/m6O9usXXARNj3yun57qfpFW7Imf0pJu11dnjqmyPzuUHMFSMfMJ5CaxmME
	KrwCgmwT5KoKbNqYwuVBiMFNxVCbClMg320Q+VBKcC/lyFdn8LqZbx8CkZhNmIbILWPAd3kM9KQ
	4jGYW8b9gLrvYnSonLFMsGEAtHu+deTqM2N4ouCH/i3xRksexUmcL+ENXW1MuGxN3THc0FekJz3
	Xi0lw2ILMGLoN9wagAXLHAveYw3xDb/Dg5v9FR4kMmbQ8OtJhFGopbrz3uGqyx/T7iy0AhRBl7A
	bxCYHZLcCD6Njnf7vA/LV0Z6xrO3iGnYbfu07w1ZJgSVZluZHKRM0lAqwMFUzzoNFwZeM5PZlwR
	Kie4r0QVtzxTIlvfKVxqaOYv1+1qUEIiN2It3sO8J2hyQBYTC7h0oqdf6fiYwFcjT2wygJ7OQz5
	Otlq/2Iqi5S24y4xIl6PCbQDE=
X-Received: by 2002:a17:902:da8e:b0:2d6:f961:994f with SMTP id d9443c01a7336-2d74dc6f7b8mr9361705ad.8.1787853145935;
        Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
X-Received: by 2002:a17:902:da8e:b0:2d6:f961:994f with SMTP id d9443c01a7336-2d74dc6f7b8mr9360425ad.8.1787853145503;
        Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60d25esm23889316eec.4.2026.08.27.10.52.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 10:52:25 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 23:21:11 +0530
Subject: [PATCH v5 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v5-8-6d47636a8f09@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v5-0-6d47636a8f09@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Georgi Djakov <djakov@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Linus Walleij <linusw@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
        Radu Rendec <radu@rendec.net>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787853069; l=3999;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
 b=40gNZMEgMelOIHYYXNXXlGFmvf9ZjPxiwH11wpQwtzUVtCDU7L4DEV22kqGX1adVRYLwKrdbm
 yEh8szJeuE5Am01zVrVRVneXZ/Gek/x8b4hBqCNRza3I9Bty24eGWU/
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfX9eXqEzyORiW5
 GJWm2ndOolCfXx6vIqMbP/hEOjvVid2PkTdXCf4AGfUzmGJbRj7jYJUUoVTOPgteoCB7P85q6uR
 NBELZcyfDkee8KNQEqVxRqJLi77YDqPWKvAcrEmAeZ3OGWQ6wjrJlEXyV6sy6D7ogtgHV6hx4ud
 RY6wzltWnl2DPp749ch16FzIRnI1WxpXBGErUIa1THYWCgN4Zte4HSQt79qLV/Ga7cXMXIUZoAl
 T6ggQ9gugCzx3vIdFyZJ9kS2/lr7jSsRiWRycfTBttbu30M605Y317MGcggyvVmwn9vs93/vBh8
 +Oc/1BTE7P3Pldf2CJ4yxVCvpMv2se723Ma9z0485vzWWm+IcSrIDhLvl67rU1UEFzNRtBt82Dz
 KMBQeXaeJnaRcBzobzUsMVdcfueokWAN9rSKhYXTUVdmH203eDn7CEwILSvkQ543wRZ4cjjQBza
 PDu1N5oPOm8QTk0JPmQ==
X-Authority-Analysis: v=2.4 cv=d5DFDxjE c=1 sm=1 tr=0 ts=6a90795a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: 55qOm91vRIEjum-9OxZVerqUlg2h-n-p
X-Proofpoint-ORIG-GUID: 55qOm91vRIEjum-9OxZVerqUlg2h-n-p
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE1MSBTYWx0ZWRfXwhkAkhKQVFrl
 c9cDC3hhpe7rmQGn49R3PLoNM6oz5AHagsMT/2fSHYQGCfvt/KWZEar8GazIiftjgXsVA6r5e7S
 um86YWY1qwFtAWaT9xV9LHJ6mV1tWDs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_105228_223652_2426118B 
X-CRM114-Status: GOOD (  16.44  )
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


