Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93406C61DB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Aug 2026 16:39:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=wVtiVzeZgl5MtkcSYi3QgyrHj7
	98GfP4v7keATf/jhAQIHqJ6cKG+DtBpA4gjlDaiZ/Ve20/yKVCcBMcGkYLSDBj/txDrJveDi1mo2P
	BMrcZrjdVhdJB1b5Yk3c9AM42I+fIaPQ8ljynpqLw/EcYygFyLfItAfG81XtNTIxpt+mj46MewlFM
	UphoW5NJvejkoZVIIci9EaRS5d28MjCaRJ+oF/6PQTosjNsBH3DJeWLMcZMXiuTet/WHciaoZifIM
	tcS6Yd+wiqXlhHBVz2kynDAzMu9oGzZcJhKd1QQwaJZsJoAl1ZJqf241bWtoq8ZivdXrb0NwyIPcx
	pf7Tor3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd8b-00000004N04-13kb;
	Thu, 27 Aug 2026 16:39:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wzd8X-00000004Mxe-3qlQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Aug 2026 16:39:35 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67RFbjUS296995
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:39:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=; b=lRaTDKn2ImD9Y6EM
	c+HsLUu1yqskFKM6MvArwolSn092MkzomwwJWJzWqcfc6irggHPgvoJVXEPGeSsm
	Fr0NM2WEgKWpMicjignIZ3MRUe2oP9ydVJq5tvi0BE+e4mFJgUZt4CLDNjQlQPNs
	JFNyEvuH/dNSHLQjcHXrPARPnGuLBZ4s+AUp7wGCrqPFgddZ2dxuuGAPFLYJhbC8
	bz6D3VoXcRdCA3qvlbwjl5oQH9nS0dsSFG34TDPUxs92ny307LBeXnXsDaYX8USP
	6AukRjz68MJaIPeSVaq646iPhU5j1DkcmCg/Vp4FbQScfmuJbXcxG+TCFUbndIa0
	pXwBIg==
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gam6fh8dm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 16:39:32 +0000 (GMT)
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-4412c255fd4so295456fac.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 27 Aug 2026 09:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787848772; x=1788453572; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=d8txVnseKgqTv6Io0P2LTwFzIXOxack5QOEY16OSq+yFPS9g5JnDfqas5gJ7ogHU1l
         0NnYE/gZbo3nu/ocL4seuJ+AK4L/+d10WqCr7AHv7szLmrX0APmohT66P9x378oYJ9UJ
         MnLNRUHw1mGdK2vnmifjDcBrjhot2zO6IIT7iybHXfAKLUOs5oxy3HZyiRIHOjNSQW2T
         LoU83qaFPrmf8ae1zIIGWxmEjVTo14nyNQTU+lYtETg6Q5JJ/SCwS8t/x+pyqbxX0gnj
         pnBLNV7r7h+3bjvtXlMnNuDsTvS5RuAyu8Xu4FjqwgjCYobKXjyTSAdYVqBDdhso3BXy
         kuCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787848772; x=1788453572;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yS6bCkgNl2tfRL+N0AQpU6w6x0P3yKp8A+VMwA4EIUo=;
        b=bf9iiSkFo5Co4IwNAPqUgjhEyX5QB0io9bzVvroZtACKpXBc4emsxyBsXLPaQTv+y+
         EwshfKyA8aDwct2SHCb578RTXugvBMTf7CUdUM5W/6WP1N1Zzs0XTKfHLx252PU8VV7s
         5OLm/PYU/Cjty3wjO1PxHRXvuIkTutFSd1ufk0upEEFjQVbnRc5lK42b2mQFIdln9VZU
         0+yhLxnU27UvrDgEJweR8g10s9xa6wnd+jIMmZI+iPL9b4ygzvbEKiMCAaU0a0VqUsZs
         0TRbEtOj3LpHFdXiScYnPagxSBONkeX+ANpOoEeUAYmdQQV7zlIk4MSwoNIhoh8BQzy8
         jv2A==
X-Forwarded-Encrypted: i=1; AHgh+Rrs9NavtemW/+cI9N1sfy/lklaH8OpirJCxlqjF5WI5eg1TgDjNk3/R0OSSYs+5tUReNvU/QCxilQh6FS0QhIp5@lists.infradead.org
X-Gm-Message-State: AFuF++kEqUFvq1ZyP+lpprA0Cn2hQ8gGvn+GicFnenwL5Kl1bfG7pMTE
	s5JsvyCfqa39cRGmTmGdp2QlabAbvomcO+2f1TnIoxAvboruFr/M7Gl1h3dv5JsIey2DVwtaYSi
	ckZI24yjEjy8p4BNey98tyI3CkFgmYC/vV0rFqR9oPn8f65LaYa7OT0AlrZKJXnDnkdrz2rBSue
	IAhA==
X-Gm-Gg: AR+sD10eRiz6qYsPm5Bpfy/ZqNunvqpa+Cj8pzf+4MEE2Pt8B+hSayFnbIMCPY0goDR
	ZGuEBKVZasAxWb4VqOFKClycJWDrLdtbQAv9e8P+SUGQa+DNA/5Jw/Wed3pJcfo9bck/8tVb26b
	n1hnUa+FN9ldl6qUtg+ieM2s1jxNHAbBgimxJHyL/1l8s9JX+B/kTT9+weQWATcV4ZUWULyjUh/
	Jz/IlZCPTvB8Ijg0xA+PGbFQK43GKAjwcAFs0/EMEW/fHFo6FIwP5JHqJKW1lz7Dc4jJf31a9vB
	Cu8ujdZxXasrEDmXwNLFjUecFX5XYdssruE6+JxbITPDLBKCvi9ct5ROXFibPOU/CAKVlEKn/HH
	j+eGV575/tU07pbfwmtNQYrbZdLJO5xvjipb6L1DIBE1EOJVGKGKVh+xRKKM6VhuT7NpitxLpG0
	2BhIhBQVKXQMD1hQF+SdCfhXw=
X-Received: by 2002:a05:6820:c2c2:20b0:6b1:404f:6eb4 with SMTP id 006d021491bc7-6b1a0424049mr12747559eaf.9.1787848772169;
        Thu, 27 Aug 2026 09:39:32 -0700 (PDT)
X-Received: by 2002:a05:6820:c2c2:20b0:6b1:404f:6eb4 with SMTP id 006d021491bc7-6b1a0424049mr12747483eaf.9.1787848771608;
        Thu, 27 Aug 2026 09:39:31 -0700 (PDT)
Received: from hu-hardshar-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6b1a24bce78sm4253171eaf.3.2026.08.27.09.39.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Aug 2026 09:39:31 -0700 (PDT)
From: Hardeep Sharma <hardeep.sharma@oss.qualcomm.com>
Date: Thu, 27 Aug 2026 22:08:09 +0530
Subject: [PATCH v4 08/15] dt-bindings: pinctrl: qcom: Add Kuno TLMM
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260827-kuno-soc-support-v4-8-dd34f235fc1a@oss.qualcomm.com>
References: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
In-Reply-To: <20260827-kuno-soc-support-v4-0-dd34f235fc1a@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787848688; l=3999;
 i=hardeep.sharma@oss.qualcomm.com; s=20260204; h=from:subject:message-id;
 bh=9Fecwe0sAktGee+deC69QVwT+mIH7oP8T6NEsor/Km4=;
 b=fwLGC9BZJIM5/cbpxIquX/TnSdBSPeRCEgbOicDICXCkapdsB4ssHBS5BUut2kAvBatwP8yAA
 assKcfeMqvABvnEGMHmDn+jlO5WBEyhGQF3ncvO0mJgMRD5KdDrNKxg
X-Developer-Key: i=hardeep.sharma@oss.qualcomm.com; a=ed25519;
 pk=IvwPDKA2xr6jWaCIBBY2ran/H0124QUzVfun+CtEikM=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX+m2aH75fw+HU
 KyM633O3hQETAlUTLU1dTFxSFH0frAjnge8bJuGhL6maN8S0cNNojRzOeFdlK9CneI1XHaUmULG
 M2jH1T1LEsAY1Qs8PU6xF5x5bOz84l4=
X-Proofpoint-GUID: UpFclkdXzi1cjaTnV1SdMtY1jS5_aBZl
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI3MDE0MCBTYWx0ZWRfX70NVcOsAP1h7
 GoBguBOzdyc3xxhWQb2yAnAnNpjr4b0md36oUSqdOGwVB6RDExPfxcxiu3izZbTUiYq98Q2tZtL
 IDr9ZB9+F4uT1iwU8na10JambmSCT36rCA19JScZWDgpPaXnrCIL69xZx/qflEupldjWphoCPzN
 M1Jw+uLPQkQphWsgPiT3Zs3tJZ21PZ7666G0WV4p0XWz0aUDexTqn8rtXs5hWTCHfAZlAwtEBx7
 bXEmSOcEG1K4+MKTkIFxs1rTNsnwNbVTeo8DS0bBuIzCbWocKQnEstJZVoO9koM92dEMV6kfarS
 5z5bwq1ND1/mg52cnz1fpSl7dbVGqHB1Hy6CAvwbDZFIBcqG/A6FYnD3s9bVKJpSyWg1jboQ9vw
 MCBfZC4EcDUwdhjGjBpuHOndnQ1QlbfFMdHPoLVhejpeE/oNliJcjcnor7U6yXdEASbZpUC6H4F
 vhCOE/zvm4SsqSxi+EA==
X-Authority-Analysis: v=2.4 cv=eIgjSnp1 c=1 sm=1 tr=0 ts=6a906844 cx=c_pps
 a=Z3eh007fzM5o9awBa1HkYQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=CaveSyEksWnKhASb3GUA:9 a=QEXdDO2ut3YA:10
 a=eBU8X_Hb5SQ8N-bgNfv4:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: UpFclkdXzi1cjaTnV1SdMtY1jS5_aBZl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-27_07,2026-08-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 phishscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608270140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260827_093934_135934_AE528622 
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


