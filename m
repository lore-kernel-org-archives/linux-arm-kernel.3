Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F51AC369B4
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Apr 2025 09:50:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rJTrLJsWBAygM6/+ONh0vr3tYiSRbueh43nL89KqoeI=; b=hK6z4lJNDpGlL5nnSRqi4IkqHc
	Q9ywAhKsoSylMm3ccNgV6WJeslAFl+qUO9CyAebZ55Jl69hjvdeQFMbjEVpzOOJ+X2CslafB0GBfF
	y+LmDKtHM2HcN3Mn/7MKwEdhmQhrX4jIRTSe1RMrABBS4ONzrrISDC4hONT0u/M2LYRbbxq0leeug
	URRKmOyI7zc4n1C21Qfvht2Ui7A0DYP0fRv3+D4vOShuDnEOKWFwd+zGPhlgxnFNHOQRyYblUScNk
	TZlowF/EZUrY6SNu8SfU4lr+oRGfz2qKQBGDPWlE5qwtjE6n+JwpU0MkO9xXf1NC8GiWnBpBftfrp
	WBqqhUnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4cwL-00000005DD2-3KJn;
	Tue, 15 Apr 2025 09:50:49 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4clf-00000005Aqw-1Zt8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Apr 2025 09:39:49 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tKsj031959
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rJTrLJsWBAygM6/+ONh0vr3tYiSRbueh43nL89KqoeI=; b=FHWMXvAycthToF4u
	kWY3LkZlw4lL71qNYa8J3bB0TCyDe0UWCU5Xpm6GmmMapstGAjkvM4byIIpEZGTR
	BfTYPBep0LJz8qsfaOmwhOMGrIKvGBHVf+Cmfvlq4KTtxHVJoKJtgE2MSnZxJGCQ
	DROHDTFGRsdPAH+zwLjWGt6lNJPQoGdcydcmW/NaBuF4DCrK1fBBKxqMfJYYnxhr
	1i6mJAIT92n2kWzPFbQ1Xq8SUfr2FWfR9ba/IymhSWJ5J1SQIRjRWZitK/snIyNC
	POSxR84AhIvOdtpNRYaEFyAgGsHqusZ1pHCitPvd6TpuwSUBg8Zkt5guLnIKqWKv
	quCj8A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yfs17j0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 09:39:46 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c543ab40d3so787622585a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 15 Apr 2025 02:39:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744709985; x=1745314785;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rJTrLJsWBAygM6/+ONh0vr3tYiSRbueh43nL89KqoeI=;
        b=f6+WVHlMgRw5/EHJejv+LLgn1Sk4En6npAGJ15Vg58dJ/qWWk+OkyNqbGX+7gJJl+v
         Dg6BbE8ZdYH16XKISO6IjZEJFms7mtEzIpQUNympu8lfYYyCF9YhsVgC/ClgHSwBgj9A
         0JFUvKn3frCVUSZZiTgJke+6vKoIUtedHaQD3qIHP40KUdUnssfAOMF0Zw2KrLUptUg2
         8f8TRw3EN3tQByWz0hU65XymvtLkgz8R6ZrDEhu6u36VEfchBKWGvnZZRdUiBsPQIzDg
         MNF/ytfEFqDIwDrcRalVC/QkP/I2tiHU4J6ttVMR4IJpBD6l4SeyWYsk3UKlS9+tKpZJ
         BHqg==
X-Forwarded-Encrypted: i=1; AJvYcCVnH0HgXLlCBWiVhoSgPEVfhMVgnQ0KFRPE/aYGs6lHtClNEAe1wpf79pgq7stjAQIbsXOuoUjcIhun29dEjA+9@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7Kn5DHYSQ7uV5f/iEj5YJYeoSEAlg5rq8nc9VAlhTYd4UqHHs
	E//S6jxAhgqcTiPY4qhw+1j4FOcrwLGWPfvgjx0n0oJ7x2D76YJiHz/17YXszX+2qi5lILVOl/n
	PvZ/Igaj6/R8E2QhPVrot77fQ5rlBSZYIighEf3LuKkSNcVEEqk4bBTK4mfIG1tWvyAG8qQCLlQ
	==
X-Gm-Gg: ASbGnctB8jbhTzmYHHqHDk0jZZhOvi5+oEAm3OZc7gNErxYHf/KRjtvVtQihs88y+I9
	YZBYcz+e4xaE66f8NmNNC57W4FdxMzaphledunGN5L6q3CWCeVXXKNshXaO+kX6XuKoeVGvp/vP
	L04Xlylc5GtcTtyalxKo1wIjTDoOY7nyvP7qLrvdZI48aogYM3ibZ0wW9H6bFWVfNWyb44uPU37
	mb+lBltj6OhedcJ52FJXzqe4n//NdT5SIqVOAEPyfW0dtNR+8v0pjyoRYUZ5fvmkdJ3TcHF0hZ0
	a27vceN4dPRGRwMF4yL4gqy7QHCekSuPA9o2krys9NdNLgsEuHF53WZSL1IOR8VHh1aqRj5wQU6
	XDX+P2dhZsXQcOMmDnRPsZlqX
X-Received: by 2002:a05:620a:1a91:b0:7c7:a5e6:d287 with SMTP id af79cd13be357-7c7af12a31bmr2168954285a.52.1744709985185;
        Tue, 15 Apr 2025 02:39:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH+dYTWo9NYCDq3k17wFUFhLrpxoNnBz9sk5MqXgGK080OnZZQwUk2cwHjT0c+469o/ZTllyw==
X-Received: by 2002:a05:620a:1a91:b0:7c7:a5e6:d287 with SMTP id af79cd13be357-7c7af12a31bmr2168949285a.52.1744709984659;
        Tue, 15 Apr 2025 02:39:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f464cbc60sm20141901fa.24.2025.04.15.02.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 02:39:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:39:33 +0300
Subject: [PATCH v3 05/10] dt-bindings: display/msm: Add Qualcomm SAR2130P
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-sar2130p-display-v3-5-62314b1c9023@oss.qualcomm.com>
References: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
In-Reply-To: <20250415-sar2130p-display-v3-0-62314b1c9023@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=14907;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=mhVUBuasCeOBkqrxG/5PgGqIfKxDHldHx8QOIkjyyg4=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBn/ilWyB0IH9WLeMZ1SByTf6u7l9X6VjEuWoE8Q
 NzEJ/hDC2CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ/4pVgAKCRCLPIo+Aiko
 1UG2CACaO97KCWNDtuqr6tHOQ/0z9XkUjF2P4XS/sPWkkj+J63jbAPxPbptDrcTnnxAwZDkYIsY
 y1nlnoKH2FDFqsT16WKYjkJGNt0E2JnablySPz5vA7u6dJZrUloEsyLmrijQdS5VihXVdbeIltV
 mJeUBdMxiQ9dzlSCzv3IT/ePJrsxuSZbBTmjp5otVw8ZXIji7nZdXeJNJKB80njRQ3PQhxZ1Zv+
 jnHIB6KiW2YHW9YZ/qD/1wsFh0wyGvmVGtYxOhhKNxhacZMafF/KZwSRimqcdhIaA1/8oUmdVL7
 oqeb9gR3DO8dibbd+uOUc/xNAy/4l3AawYG+ZFXxCc1Xsu04
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=P9I6hjAu c=1 sm=1 tr=0 ts=67fe2962 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=-YBHemuPtO_JcOlGpNkA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=sptkURWiP4Gy88Gu7hUp:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: tMKqrpcdW8Q0aGFgSNelvx2zNR3mQYIw
X-Proofpoint-ORIG-GUID: tMKqrpcdW8Q0aGFgSNelvx2zNR3mQYIw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 mlxscore=0 spamscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_023947_609538_12DD545D 
X-CRM114-Status: GOOD (  15.45  )
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

From: Dmitry Baryshkov <lumag@kernel.org>

Describe the Mobile Display SubSystem (MDSS) device present on the
Qualcomm SAR2130P platform. It looks pretty close to SM8550 on the
system level. SAR2130P features two DSI hosts and single DisplayPort
controller.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 439 +++++++++++++++++++++
 1 file changed, 439 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..870144b53cec9d3e0892276e14b49b745d021879
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -0,0 +1,439 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/msm/qcom,sar2130p-mdss.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm SAR2130P Display MDSS
+
+maintainers:
+  - Dmitry Baryshkov <lumag@kernel.org>
+
+description:
+  SAR2310P MSM Mobile Display Subsystem(MDSS), which encapsulates sub-blocks like
+  DPU display controller, DSI and DP interfaces etc.
+
+$ref: /schemas/display/msm/mdss-common.yaml#
+
+properties:
+  compatible:
+    const: qcom,sar2130p-mdss
+
+  clocks:
+    items:
+      - description: Display MDSS AHB
+      - description: Display AHB
+      - description: Display hf AXI
+      - description: Display core
+
+  iommus:
+    maxItems: 1
+
+  interconnects:
+    items:
+      - description: Interconnect path from mdp0 port to the data bus
+      - description: Interconnect path from CPU to the reg bus
+
+  interconnect-names:
+    items:
+      - const: mdp0-mem
+      - const: cpu-cfg
+
+patternProperties:
+  "^display-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sar2130p-dpu
+
+  "^displayport-controller@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sar2130p-dp
+
+  "^dsi@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        contains:
+          const: qcom,sar2130p-dsi-ctrl
+
+  "^phy@[0-9a-f]+$":
+    type: object
+    additionalProperties: true
+    properties:
+      compatible:
+        const: qcom,sar2130p-dsi-phy-5nm
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/power/qcom,rpmhpd.h>
+    #include <dt-bindings/phy/phy-qcom-qmp.h>
+
+    display-subsystem@ae00000 {
+        compatible = "qcom,sar2130p-mdss";
+        reg = <0x0ae00000 0x1000>;
+        reg-names = "mdss";
+
+        interconnects = <&mmss_noc_master_mdp &mc_virt_slave_ebi1>,
+                        <&gem_noc_master_appss_proc &config_noc_slave_display_cfg>;
+        interconnect-names = "mdp0-mem", "cpu-cfg";
+
+        resets = <&dispcc_disp_cc_mdss_core_bcr>;
+
+        power-domains = <&dispcc_mdss_gdsc>;
+
+        clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                 <&gcc_gcc_disp_ahb_clk>,
+                 <&gcc_gcc_disp_hf_axi_clk>,
+                 <&dispcc_disp_cc_mdss_mdp_clk>;
+        clock-names = "iface", "bus", "nrt_bus", "core";
+
+        interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
+        interrupt-controller;
+        #interrupt-cells = <1>;
+
+        iommus = <&apps_smmu 0x1c00 0x2>;
+
+        #address-cells = <1>;
+        #size-cells = <1>;
+        ranges;
+
+        display-controller@ae01000 {
+            compatible = "qcom,sar2130p-dpu";
+            reg = <0x0ae01000 0x8f000>,
+                  <0x0aeb0000 0x2008>;
+            reg-names = "mdp", "vbif";
+
+            clocks = <&gcc_gcc_disp_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&dispcc_disp_cc_mdss_mdp_lut_clk>,
+                     <&dispcc_disp_cc_mdss_mdp_clk>,
+                     <&dispcc_disp_cc_mdss_vsync_clk>;
+            clock-names = "bus",
+                          "nrt_bus",
+                          "iface",
+                          "lut",
+                          "core",
+                          "vsync";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_vsync_clk>;
+            assigned-clock-rates = <19200000>;
+
+            operating-points-v2 = <&mdp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    dpu_intf0_out: endpoint {
+                        remote-endpoint = <&mdss_dp0_in>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    dpu_intf1_out: endpoint {
+                        remote-endpoint = <&mdss_dsi0_in>;
+                    };
+                };
+
+                port@2 {
+                    reg = <2>;
+
+                    dpu_intf2_out: endpoint {
+                        remote-endpoint = <&mdss_dsi1_in>;
+                    };
+                };
+            };
+
+            mdp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-200000000 {
+                    opp-hz = /bits/ 64 <200000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-325000000 {
+                    opp-hz = /bits/ 64 <325000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-375000000 {
+                    opp-hz = /bits/ 64 <375000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-514000000 {
+                    opp-hz = /bits/ 64 <514000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        displayport-controller@ae90000 {
+            compatible = "qcom,sar2130p-dp",
+                         "qcom,sm8350-dp";
+            reg = <0xae90000 0x200>,
+                  <0xae90200 0x200>,
+                  <0xae90400 0xc00>,
+                  <0xae91000 0x400>,
+                  <0xae91400 0x400>;
+
+            interrupt-parent = <&mdss>;
+            interrupts = <12>;
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_aux_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_link_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_link_intf_clk>,
+                     <&dispcc_disp_cc_mdss_dptx0_pixel0_clk>;
+            clock-names = "core_iface",
+                          "core_aux",
+                          "ctrl_link",
+                          "ctrl_link_iface",
+                          "stream_pixel";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
+                              <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
+            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
+                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
+
+            phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
+            phy-names = "dp";
+
+            #sound-dai-cells = <0>;
+
+            operating-points-v2 = <&dp_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+                    mdss_dp0_in: endpoint {
+                        remote-endpoint = <&dpu_intf0_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+                    mdss_dp0_out: endpoint {
+                        remote-endpoint = <&usb_dp_qmpphy_dp_in>;
+                    };
+                };
+        };
+
+        dp_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-162000000 {
+                    opp-hz = /bits/ 64 <162000000>;
+                    required-opps = <&rpmhpd_opp_low_svs_d1>;
+                };
+
+                opp-270000000 {
+                    opp-hz = /bits/ 64 <270000000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-540000000 {
+                    opp-hz = /bits/ 64 <540000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+
+                opp-810000000 {
+                    opp-hz = /bits/ 64 <810000000>;
+                    required-opps = <&rpmhpd_opp_nom>;
+                };
+            };
+        };
+
+        dsi@ae94000 {
+            compatible = "qcom,sar2130p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae94000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <4>;
+
+            clocks = <&dispcc_disp_cc_mdss_byte0_clk>,
+                     <&dispcc_disp_cc_mdss_byte0_intf_clk>,
+                     <&dispcc_disp_cc_mdss_pclk0_clk>,
+                     <&dispcc_disp_cc_mdss_esc0_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_byte0_clk_src>,
+                              <&dispcc_disp_cc_mdss_pclk0_clk_src>;
+            assigned-clock-parents = <&mdss_dsi0_phy 0>, <&mdss_dsi0_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi0_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi0_in: endpoint {
+                        remote-endpoint = <&dpu_intf1_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi0_out: endpoint {
+                    };
+                };
+            };
+
+            dsi_opp_table: opp-table {
+                compatible = "operating-points-v2";
+
+                opp-187500000 {
+                    opp-hz = /bits/ 64 <187500000>;
+                    required-opps = <&rpmhpd_opp_low_svs>;
+                };
+
+                opp-300000000 {
+                    opp-hz = /bits/ 64 <300000000>;
+                    required-opps = <&rpmhpd_opp_svs>;
+                };
+
+                opp-358000000 {
+                    opp-hz = /bits/ 64 <358000000>;
+                    required-opps = <&rpmhpd_opp_svs_l1>;
+                };
+            };
+        };
+
+        mdss_dsi0_phy: phy@ae94400 {
+            compatible = "qcom,sar2130p-dsi-phy-5nm";
+            reg = <0x0ae95000 0x200>,
+                  <0x0ae95200 0x280>,
+                  <0x0ae95500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc_rpmh_cxo_clk>;
+            clock-names = "iface", "ref";
+        };
+
+        dsi@ae96000 {
+            compatible = "qcom,sar2130p-dsi-ctrl",
+                         "qcom,mdss-dsi-ctrl";
+            reg = <0x0ae96000 0x400>;
+            reg-names = "dsi_ctrl";
+
+            interrupt-parent = <&mdss>;
+            interrupts = <5>;
+
+            clocks = <&dispcc_disp_cc_mdss_byte1_clk>,
+                     <&dispcc_disp_cc_mdss_byte1_intf_clk>,
+                     <&dispcc_disp_cc_mdss_pclk1_clk>,
+                     <&dispcc_disp_cc_mdss_esc1_clk>,
+                     <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&gcc_gcc_disp_hf_axi_clk>;
+            clock-names = "byte",
+                          "byte_intf",
+                          "pixel",
+                          "core",
+                          "iface",
+                          "bus";
+
+            assigned-clocks = <&dispcc_disp_cc_mdss_byte1_clk_src>,
+                              <&dispcc_disp_cc_mdss_pclk1_clk_src>;
+            assigned-clock-parents = <&mdss_dsi1_phy 0>, <&mdss_dsi1_phy 1>;
+
+            operating-points-v2 = <&dsi_opp_table>;
+            power-domains = <&rpmhpd RPMHPD_MMCX>;
+
+            phys = <&mdss_dsi1_phy>;
+            phy-names = "dsi";
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            ports {
+                #address-cells = <1>;
+                #size-cells = <0>;
+
+                port@0 {
+                    reg = <0>;
+
+                    mdss_dsi1_in: endpoint {
+                        remote-endpoint = <&dpu_intf2_out>;
+                    };
+                };
+
+                port@1 {
+                    reg = <1>;
+
+                    mdss_dsi1_out: endpoint {
+                    };
+                };
+            };
+        };
+
+        mdss_dsi1_phy: phy@ae97000 {
+            compatible = "qcom,sar2130p-dsi-phy-5nm";
+            reg = <0x0ae97000 0x200>,
+                  <0x0ae97200 0x280>,
+                  <0x0ae97500 0x400>;
+            reg-names = "dsi_phy",
+                        "dsi_phy_lane",
+                        "dsi_pll";
+
+            #clock-cells = <1>;
+            #phy-cells = <0>;
+
+            clocks = <&dispcc_disp_cc_mdss_ahb_clk>,
+                     <&rpmhcc_rpmh_cxo_clk>;
+            clock-names = "iface", "ref";
+        };
+    };
+...

-- 
2.39.5


