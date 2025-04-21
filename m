Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A643C369AB
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Apr 2025 22:31:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=z21sgBy2prBFvxD7Iu70V2uFVC
	K7d8B/GdqYizy7IaH/iQ3BFn7bfpTmWPY+LUAKLG5LvfAwkQ2K76Hr1fSIioSAUWcIkJdjP0QvCCo
	FUJWkIGGrJZwEOx3QY7C0N8BcSZLfS2xs36fStWc+tPB6lEBaLAJBKnmqc5km14EO/yzj3Rd73RgK
	w88wq8+oLOuI140Rt0LT1JdiIhrXQZ5Okx/aOZy87WPCwLRSY7T7YQIvFfemXdNK4/Il2esWiGBYR
	pFRCMBIf84Bxs7khLkqhDCK7npF1/G9STegz9Kj+CFw/6yPx454SkmGFTRvk7dXrArlBJBMnhpqmK
	3ufWzh/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zfL-00000005LDX-1IqY;
	Mon, 21 Apr 2025 22:31:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u6zC1-00000005Gge-2xgV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Apr 2025 22:00:47 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3oWd010256
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=; b=HilkUqmWXxAwE28F
	Viqe2dXhxLlb0IxwGEVep9mG4tuUu48kMS3H2cbv9BRJPX8nZiiH7i4do0jxXPID
	Zei4XhACINfxA1KXR+SvSDzLohP76oMTVabm8odlLYo+YcTwzWQa2Wq6UdeDp/TQ
	CGgRXX2gfiV0imKXzV+BX9x6efyem/16Pak6azTdXI2vS/XVzji6pwIR4xTNvIfl
	deGvcP6QZFdLwR6nMoegyymR1H0uGr2dDTh6Ighp3WAO0HzNKdjlHZ2pmGW4DJtP
	XQ8So+lYXg6lFwg7Wr0fdaojG7AWzBwbET4rWz3ZUtAFon9C6B/sXG3WdVAQ6uGG
	BbcheA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jdd8q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 22:00:44 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-73dcce02a5cso1453390b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 21 Apr 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272830; x=1745877630;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yWhw1LvOhszFsVVXvJgT1USSc8+4N0aEBK16X6WxLSo=;
        b=pEjd8pvg+AXrlvd0cyoTK4dthNF7CIeZZufjyTchbnNjRXaJEpEYNW+0uha9RuFC/r
         M0DtnsOTrHrdSbA2fOcHTNAydfmm2bxS7yJVV754czsRj6alNi84zIiu8rNpcPA6ARNA
         e4s71EHk+P99miVHhR/0aIOLb7f2XrpOC+ybEPcu+2vOmOSBEUD0p8cSagKk8f3XoFo9
         HTSyWvYIq2sYg1KJUiGQLeU6zf10flpwDyxCZHxCZKouUYRabz7m06yZyLKmbl0gcm+H
         DlwOpw9k5VUFiteqV5t+ZFmAvMx6YjzaAlYjloW6uxO6I46Mc28MVrei4zTbzPxQ55qc
         dOqg==
X-Forwarded-Encrypted: i=1; AJvYcCUydAQ0aVjWfNrbY65Kg81AntkIkDwSaupyUhJzjbUFVlqkBfXdkYheN/qNj8sHko/JlYVVop9Fpl5LrC+SwEv8@lists.infradead.org
X-Gm-Message-State: AOJu0YyUmDRmz6zC9SXHdmXHHg70+jhUJ32u4pWVgmwuo5/yxoiksyj+
	ixeg0kHSm+sdo2fhmgCw4mL+lbkxQRou2DMy/olsgFR2lYcQzpwAWAKO64jtK2hcea9vpiQt/IH
	gAZaKprS1H+r1KBLMEUPactqDOeBRoevfrLF+Ow13HZliEfrhe5/nHbJKh1Uw4UjivHS6xjN0iw
	==
X-Gm-Gg: ASbGnctNaY/wBI9edc4ujfDjRtH83DET5sdgXYqAPHJVeCGRZCVh9fPCHyriRofU024
	g17uA/9WPsVMqrB8152xh9ASh5EE3h+tenVWRiG2yZs4VZceZWgIOS9lm7yOzrRyApJRX/d8adD
	VDbbjsxa8Jfha/ukCSam9OD0txo+BrjkOLLjfkT0R933lirCb1by/F58nNXXsvDyk+HW/oQcVwf
	g5Uk4fYab0Zz10sTW3xwNDFo6ZgFKLw3gWDaw6pcE9oQBZ3TSEn1d2yUwTA1YeyoIvUigj4YGCV
	0OtkJ/nuGGbfXWMR4qlp90TS8yXeNZ4H7RJSLIacL/4/nlDk0GdXkWugNQgwNTdSx+A=
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr20385412b3a.3.1745272830079;
        Mon, 21 Apr 2025 15:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4J8IINuI6AyXzme/otRBuArMyNq7mt7WxH5Fyest1FG90iDOU07/f3k4YrNeQTPBFvXAHvg==
X-Received: by 2002:a05:6a00:98e:b0:736:5c8e:bab8 with SMTP id d2e1a72fcca58-73dc144c7aamr20385326b3a.3.1745272829473;
        Mon, 21 Apr 2025 15:00:29 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:29 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:09 -0700
Subject: [PATCH v5 02/10] dt-bindings: phy: Add the M31 based eUSB2 PHY
 bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-2-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=2425;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Wud7UEFHXJQ0decZnINKeSi+hAdh0llCKpYCfH/oedY=;
 b=wiSsNBP6n3SjbBERNylScCBtTJlneM21/7EzLO8v2iwkdZFE1SInRBkCTbCfb6uv759DgDsKR
 s5qHIbAdL55DeXzCxEHZ1VzgkSDumKF59mzN/WW2mOURwT77Xj3/T1U
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=6806c00c cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=gEfo2CItAAAA:8 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_ZfBLJ5mcqDn8hZp9PAA:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=sptkURWiP4Gy88Gu7hUp:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: vd4GGEfz19Z4YAH38k-DHJDZNBYjgC8k
X-Proofpoint-ORIG-GUID: vd4GGEfz19Z4YAH38k-DHJDZNBYjgC8k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_150045_890149_631084AD 
X-CRM114-Status: GOOD (  16.87  )
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

From: Wesley Cheng <quic_wcheng@quicinc.com>

On SM8750, the M31 eUSB2 PHY is being used to support USB2. Add the
binding definition for the PHY driver.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 79 ++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..c84c62d0e8cbd9fc1c0da6538f49149e5bc7e066
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,79 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/phy/qcom,m31-eusb2-phy.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm M31 eUSB2 phy
+
+maintainers:
+  - Wesley Cheng <quic_wcheng@quicinc.com>
+
+description:
+  M31 based eUSB2 controller, which supports LS/FS/HS usb connectivity
+  on Qualcomm chipsets.  It is paired with a eUSB2 repeater.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - qcom,sm8750-m31-eusb2-phy
+
+  reg:
+    maxItems: 1
+
+  "#phy-cells":
+    const: 0
+
+  clocks:
+    items:
+      - description: reference clock
+
+  clock-names:
+    items:
+      - const: ref
+
+  resets:
+    maxItems: 1
+
+  phys:
+    maxItems: 1
+    description:
+      Phandle to eUSB2 repeater
+
+  vdd-supply:
+    description:
+      Phandle to 0.88V regulator supply to PHY digital circuit.
+
+  vdda12-supply:
+    description:
+      Phandle to 1.2V regulator supply to PHY refclk pll block.
+
+required:
+  - compatible
+  - reg
+  - "#phy-cells"
+  - clocks
+  - clock-names
+  - resets
+  - vdd-supply
+  - vdda12-supply
+
+additionalProperties: false
+
+examples:
+  - |
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc_usb2_clkref_en>;
+        clock-names = "ref";
+
+        resets = <&gcc_qusb2phy_prim_bcr>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+    };

-- 
2.48.1


