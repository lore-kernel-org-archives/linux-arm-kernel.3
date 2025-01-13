Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 158FCC02180
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 22:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sfuoe4QkJRXY5AklibDsSi8CWuVubAYiZECv4k/v6/E=; b=lTq4tULNh8z15lXC8nuvgFcUZN
	Y9SyvvEoxXwO87AFv3Jy2EyvASJDdRs5IsUcv2sKq/fu4i+ZNF2HOjnxXWQf5ZM6cuN/lRzVgD1dB
	UqtfsBNI7h8NxDZLxkSsbEevpweN99s96EnT181oHDo8dYv3zRC+pbg0iUqxyJMe0jMTIjFnqOjsq
	DjzV+5LPug+Frncu8VAp+1MzB43oUCoKmm4E9BoNRWklHupBZUhbpX1JbGb4tIVc3JhLt7DvZvffa
	ruzHb0hA9K1VLl3bGg9shd3AKr4F5/L23Yafdh9ei2GqR0PJ9uONjMSBETGCJfFYufNqcfahNxZXM
	uanqF7fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSW4-00000006l4p-2OtO;
	Mon, 13 Jan 2025 22:02:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMO-00000006jUc-2NBe;
	Mon, 13 Jan 2025 21:52:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=CC:To:In-Reply-To:References:
	Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sfuoe4QkJRXY5AklibDsSi8CWuVubAYiZECv4k/v6/E=; b=KFx9ZuTS3bWNsMM485VnLf43lN
	jS4TLpkoY3Vahv3YZQFsoPT5X1ThhhsiNrAocUWwQIDZLkKRgk06SvY2m1J5JzLRQufceICWRkFvo
	7jxsS6k6lKT03ovgXwwk2LQpOcLLHOJhSUZxD2eBrqmtIvrdV9dWOqOeqXocHV7EJNk9DXNJQTl5+
	eQABjY4lj5ke/VL8S/W9xQTCbanEX+nwpKySEcuSXmfRsRfS+4H6qebU98Hz5EHBOYV0tlL9GdkCl
	bbvRGzZ7CfexnXewfhYye2rIbPNdW1HcgI9P0fKhPmebdS/8V1CJ97AhfuMyQqdrhsoP/6RvoL8+3
	yEiWNAXQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXSMI-0000000AMKM-3HQI;
	Mon, 13 Jan 2025 21:52:34 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DKsKK5026110;
	Mon, 13 Jan 2025 21:52:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sfuoe4QkJRXY5AklibDsSi8CWuVubAYiZECv4k/v6/E=; b=cibM2qq4/INeNNRR
	16z88V8HZVQHvBpH1yDf8Kh2GD/pIqd36ZjmFgKVEKJsqKozXUlLjgJee8WH6LWK
	bYw6KsdzXvy5HQ83jQdDI2VCulSqrJ+0VNEQVJasafEiSJz+AfTEdZkinQwVmTrd
	ITMsmoFpT0h4VQY/CPYbADq4AwWgc2Qv4UEChaR/KJABWfGXY0B5bm5uSSdA4gCy
	3Qy9c52MNRC8FSD/8khBkTHGq1bqGXLlXRD0edwe5xWNAKdO+CjiUR0tM5FTtb03
	Wj1MXzZMxtNC4/UuZFiUTuKkYYcsYCBJKhOZBoA2BWfpLUEFkRWhJUY6EPv8C1Ci
	TZEmBg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445a9283gv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:18 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50DLqHQJ004887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 Jan 2025 21:52:17 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 13:52:17 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Mon, 13 Jan 2025 13:52:08 -0800
Subject: [PATCH 2/7] dt-bindings: phy: Add the M31 based eUSB2 PHY bindings
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250113-sm8750_usb_master-v1-2-09afe1dc2524@quicinc.com>
References: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
In-Reply-To: <20250113-sm8750_usb_master-v1-0-09afe1dc2524@quicinc.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel
	<p.zabel@pengutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        "Will
 Deacon" <will@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        "Konrad
 Dybcio" <konradybcio@kernel.org>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>,
        Trilok Soni <quic_tsoni@quicinc.com>
CC: <linux-arm-msm@vger.kernel.org>, <linux-phy@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-usb@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        "Melody
 Olvera" <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736805135; l=2521;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=jkLRa0xS8P4ZP48np0eU+uRA0kZYFutdbnCvsk/H7dw=;
 b=/00u484P6tljgMqoZXayerqfqw34NJrxsIvpLVUbXAeIUXCMhAtKbh+v7hQ9tB43SiSQ5aQA2
 4M3O948dxweAgsA+doaQ4huq9RYmzr7NycFPsa6IzHzjIbcFG+Soo41
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 8coVCkMEx28PFfNmXNNT3682Mo7gMsGc
X-Proofpoint-ORIG-GUID: 8coVCkMEx28PFfNmXNNT3682Mo7gMsGc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 clxscore=1015 mlxlogscore=999 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2501130172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_215231_299002_FB375834 
X-CRM114-Status: GOOD (  14.44  )
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

Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
 .../bindings/phy/qcom,m31-eusb2-phy.yaml           | 84 ++++++++++++++++++++++
 1 file changed, 84 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..5eba90e270e2b90a71cc8072fefe5994cdd1f605
--- /dev/null
+++ b/Documentation/devicetree/bindings/phy/qcom,m31-eusb2-phy.yaml
@@ -0,0 +1,84 @@
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
+  - vdd-supply
+  - vdda12-supply
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/qcom,sm8750-gcc.h>
+    #include <dt-bindings/clock/qcom,rpmh.h>
+    #include <dt-bindings/clock/qcom,sm8750-tcsr.h>
+
+    usb_1_hsphy: phy@88e3000 {
+        compatible = "qcom,sm8750-m31-eusb2-phy";
+        reg = <0x88e3000 0x29c>;
+
+        clocks = <&tcsrcc TCSR_USB2_CLKREF_EN>;
+        clock-names = "ref";
+
+        resets = <&gcc GCC_QUSB2PHY_PRIM_BCR>;
+
+        #phy-cells = <0>;
+
+        vdd-supply = <&vreg_l2d_0p88>;
+        vdda12-supply = <&vreg_l3g_1p2>;
+
+    };

-- 
2.46.1


