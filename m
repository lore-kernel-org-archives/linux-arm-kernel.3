Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A7FF364AB
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 18:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=; b=wxAsyxKu6Af1HyehgGAReDNhrQ
	lmJKXXclujggUs2cojq4y167fE77id3X+qpoDSpCTNeLvFE/ws6MMWzDpBLjKpnb7/IZgoDHbUGDh
	44CeLXum3xLyS3CgxRXu+tA10+CuW3apecWWCIuDeBoKVcn+kvAklTvtX03ZMQ3gLRvII0X1UbUEp
	mFhP28BN9TGYLJvKE9sDGh4C61uF6/00A4aF0hKwiGoZ60FGGmPBrybhVoGosXw12km1vpy14bwlS
	HcJFEAlqLNd0QV5QPdMIShAU37ucy5DsRFjwrnVo9DXJNkkjrPZ3rGOPb8nCAJ90P2oU3LRy2xOgV
	hYNrzCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqS-0000000B3jh-0c3t;
	Thu, 09 Apr 2026 18:11:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAtqP-0000000B3ix-23C4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 18:11:10 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 639CxmOt1729915
	for <linux-arm-kernel@lists.infradead.org>; Thu, 9 Apr 2026 18:11:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=; b=XKvrJSQDAgXU8sK3
	xbOjc8eraxv+LNeSD8Eq9ob7R9xjRHIl6mnk/g5ngqdG4Sw4eTrnsf6lYhK8nXbV
	ZJnswpX7BKqcdN7CrMQzv91IJhIE2exj/5WnzYMrMqdVEBfECnIdmsGp4nR6iQZY
	IHITAuUgU0HDbIywHv6QQg1E7nd2/0VDlL7va2iN4++fTRAULc+plre7OWbCPhV5
	Zl7bNSYS2iFNujDhIYuLDgh/TEsTkL3HCgdyl1rSif8LHaMuz7sBtHSX3ZXkqXcs
	awVH1bllaa9171wbpCMBBuPtD/BMjEOGP3VUSaQmsH2RBgsZ5P756+tsgQP3BaPA
	bGJRBw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deckxh5xf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 18:11:09 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-c76bd4feb9fso841654a12.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775758268; x=1776363068; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=eKC+OAx+damcq622QkwlF750tBgT1kgmFbyQkcd2bXoo15C20ukCn5T5rQINzsgT4+
         zaPVvj9vpVTmUn0Zq0wm2jYfe8ITH3/lA0fd7gO2FHcuRD64FZ/z7RH5zmZ5bdMtHqkk
         ttXnkYwNhFrZmaKH36923ORUibMYpwu/SVShza2gHlwJn2xIJUT3zXTsQ/VpOau28G3v
         YMwa9TKGfWE2Fe2Ude4gcHMHIb8zY1bjhfOkPaYDpyNCpfEjtxSm2VwRg6tup62MzNM7
         gQdklOfO7/9s+g9WiNQXsatxdqDEywmqSOoJH+wvrw6s9841kXuZ+2wmt6DnBIEoBGia
         klvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775758268; x=1776363068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LsdYNRKM7gJvG9sWEFYTczXbszVaCSCTuz9faLmMR/A=;
        b=f0gyu4MF8iABexvGgvV1obeoTLW8YAUQ3dPcsb333ERe0iHo2e1Xce+M1vbx6Q9hjp
         6f1x7SGtCToBdTN4tN71qLsy3i+kDE2IrdvMbMmWA8/3N8Ds+jzf6QsqNzUYKxCWreSW
         QkDzC8LTj+zyFR7lp8iYIzn4KgXokOsfEInzAd2FuiNUVRyTdhXJ2o/Zd/xeTSuidyd+
         bIcqNNW1ur0C032NsKxr7nM78bjbWxIHQ04JWg/m7ZxeiKdBbaIy9mcjA2Sf9vFP8jGG
         ldyElIKW93WjmlCPg12qg3aaE//G4gA/zqNwltd0gS6wQa4sVKj3P4BZnWasYWue+XeG
         m/2A==
X-Forwarded-Encrypted: i=1; AJvYcCXhZtQ5yiZs6mDaduda8AGbRejga+nsz3BjlVnVyBKl4P1q4iLEghWThUV6dUP06eS9dGO/r49LkfjMmLO2QZcU@lists.infradead.org
X-Gm-Message-State: AOJu0YwMVONMnjSDURcZVczhzWfW12cPhF/VZlFFJcPYTU4+5lmnBViX
	+ZrhQVBrvGEfwTZSs+a9lKlz5wMhu6SvNMEQQtMxuhIlCJmnUavwoP6BKls3phk3ysH9ae2/bCU
	2/wX4m4vLp1C+RgSSzCnJjV5LVkCsBa4xI8OH0qfMrukU1b1xRxsNBUCGi+8XEt/3VcUt1lyqK8
	Gxog==
X-Gm-Gg: AeBDieut9xRiXT+zGOIJ+pVA8p+yZsuHseFxs8njEoqjJDOi3aa1pPpn1BVAlS2afvf
	idggCBLxbU9fNpuWecS9ycx9/3fXdUFXHYd++FS0c3IgaATTEg+2hqjX7/XKzCEYl96NYnmFNW+
	/ptzBgymWgZuNJimNjr39mGI1DQzMFGqI5WJSD2o+UPgRlloaThkPs0ygsQ2IFyGvoZEHGSReNK
	9tvqMAtXOwiVv0bNPTR3KAQ86I+xO7lgdR+nQFJFFGn8SpnFOecFNR+0NTyiTwNupNtHJndGP2U
	I4wl4hvHMy4nS61L4LUKXsgGVyISsdrBLPi5xjmoFNwzAhuWZtmxlSUx6tIngChvJeJLXu5qc9b
	Ryx82AtDNpqi3k4H4mTf+a/wtl6+fUcNpP6DIg2bEi8vqoQ==
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752543637.60.1775758268193;
        Thu, 09 Apr 2026 11:11:08 -0700 (PDT)
X-Received: by 2002:a05:6a20:3d0d:b0:39f:2b71:d79c with SMTP id adf61e73a8af0-39f2f2f733emr26752500637.60.1775758267599;
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
Received: from hu-tdas-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c7921a2d9ebsm66132a12.30.2026.04.09.11.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Apr 2026 11:11:07 -0700 (PDT)
From: Taniya Das <taniya.das@oss.qualcomm.com>
Date: Thu, 09 Apr 2026 23:40:42 +0530
Subject: [PATCH v2 1/8] dt-bindings: clock: qcom: Add video clock
 controller on Eliza SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-eliza_mm_cc_v2-v2-1-bc0c6dd77bc5@oss.qualcomm.com>
References: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
In-Reply-To: <20260409-eliza_mm_cc_v2-v2-0-bc0c6dd77bc5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Imran Shaik <imran.shaik@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-arm-kernel@lists.infradead.org,
        Taniya Das <taniya.das@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-aa3f6
X-Proofpoint-ORIG-GUID: tk-kNBU_8LQAdh6IAwkcOdkVmqqu8i5S
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA5MDE2NyBTYWx0ZWRfX2M7N2sKkG/UV
 Fx50oKfCe+WTG/P8XZBN/hr+br5Pk2dSAlSvs+Bk3UXODWw6Myw01slSPiMuwJF3UktXoiEEq3S
 Kp5J+aP5P8s7mleC6N3p7Kk58UHIS3wxX2jwR9nWaBkIFEErxdXk/ff7+QBRZWqNsCsbysF+Vgl
 hfl5ojCNLKebTGWIXbCO+jDFsbcMnCnhNMHL5wPfFK1H4bQjMJ9Iu/O4ZQbcjqVuJ4l22iANpk+
 JvNlWUBXFDZJU0G4dubZnVJuyFclZMP4ScAmKQ07mr7F52ts4gWBsWTflYHcUtdpunwGOVCXyx9
 tR8Ig2AJrsDX71VO40Ys28HITmpcWWNs1PD+OtLkjqv+tYtpg2prLgH9GEycZ+SuXZdo2Ddsfiu
 1hYp5HBDzt94dprzhP1Q4vmC/SVxKH2bdJUSLLAYMLlsssaQ/SixMP+mZAHE2M7PjJm8BMBlkR3
 7Z1Jr0Y6mAYiesHsNPQ==
X-Authority-Analysis: v=2.4 cv=OMcXGyaB c=1 sm=1 tr=0 ts=69d7ebbd cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=gEfo2CItAAAA:8 a=EUspDBNiAAAA:8 a=O5AFsRJ8ltlpu4YWMHwA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-GUID: tk-kNBU_8LQAdh6IAwkcOdkVmqqu8i5S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-09_04,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 clxscore=1015 impostorscore=0 spamscore=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604090167
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_111109_662639_0EE27CE1 
X-CRM114-Status: GOOD (  14.64  )
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

Add compatible string for Eliza video clock controller and the bindings
for Eliza Qualcomm SoC.

Signed-off-by: Taniya Das <taniya.das@oss.qualcomm.com>
---
 .../bindings/clock/qcom,eliza-videocc.yaml         | 51 ++++++++++++++++++++++
 include/dt-bindings/clock/qcom,eliza-videocc.h     | 37 ++++++++++++++++
 2 files changed, 88 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..26a0c85f26b13ca8e7a4f5f418e8c98235f10558
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/qcom,eliza-videocc.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/qcom,eliza-videocc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Qualcomm Video Clock & Reset Controller on Eliza
+
+maintainers:
+  - Taniya Das <taniya.das@oss.qualcomm.com>
+
+description: |
+  Qualcomm video clock control module provides the clocks, resets and power
+  domains on Eliza.
+
+  See also: include/dt-bindings/clock/qcom,eliza-videocc.h
+
+properties:
+  compatible:
+    const: qcom,eliza-videocc
+
+  clocks:
+    items:
+      - description: Board XO source
+      - description: Sleep clock source
+      - description: Video AHB clock from GCC
+
+required:
+  - compatible
+  - clocks
+
+allOf:
+  - $ref: qcom,gcc.yaml#
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,eliza-gcc.h>
+    clock-controller@aaf0000 {
+        compatible = "qcom,eliza-videocc";
+        reg = <0x0aaf0000 0x10000>;
+        clocks = <&bi_tcxo_div2>,
+                 <&sleep_clk>,
+                 <&gcc GCC_VIDEO_AHB_CLK>;
+        #clock-cells = <1>;
+        #reset-cells = <1>;
+        #power-domain-cells = <1>;
+    };
+
+...
diff --git a/include/dt-bindings/clock/qcom,eliza-videocc.h b/include/dt-bindings/clock/qcom,eliza-videocc.h
new file mode 100644
index 0000000000000000000000000000000000000000..1e922250a7fae77f5c996208d50ff372b252aa51
--- /dev/null
+++ b/include/dt-bindings/clock/qcom,eliza-videocc.h
@@ -0,0 +1,37 @@
+/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+#define _DT_BINDINGS_CLK_QCOM_VIDEO_CC_ELIZA_H
+
+/* VIDEO_CC clocks */
+#define VIDEO_CC_AHB_CLK					0
+#define VIDEO_CC_AHB_CLK_SRC					1
+#define VIDEO_CC_MVS0_CLK					2
+#define VIDEO_CC_MVS0_CLK_SRC					3
+#define VIDEO_CC_MVS0_DIV_CLK_SRC				4
+#define VIDEO_CC_MVS0_SHIFT_CLK					5
+#define VIDEO_CC_MVS0C_CLK					6
+#define VIDEO_CC_MVS0C_DIV2_DIV_CLK_SRC				7
+#define VIDEO_CC_MVS0C_SHIFT_CLK				8
+#define VIDEO_CC_PLL0						9
+#define VIDEO_CC_SLEEP_CLK					10
+#define VIDEO_CC_SLEEP_CLK_SRC					11
+#define VIDEO_CC_XO_CLK						12
+#define VIDEO_CC_XO_CLK_SRC					13
+
+/* VIDEO_CC power domains */
+#define VIDEO_CC_MVS0_GDSC					0
+#define VIDEO_CC_MVS0C_GDSC					1
+
+/* VIDEO_CC resets */
+#define VIDEO_CC_INTERFACE_BCR					0
+#define VIDEO_CC_MVS0_CLK_ARES					1
+#define VIDEO_CC_MVS0_BCR					2
+#define VIDEO_CC_MVS0C_CLK_ARES					3
+#define VIDEO_CC_MVS0C_BCR					4
+#define VIDEO_CC_XO_CLK_ARES					5
+
+#endif

-- 
2.34.1


