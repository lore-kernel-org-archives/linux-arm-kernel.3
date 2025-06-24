Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C17A7C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Jun 2025 06:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=nN5DSvHCSuBkptHmBvDqh97njY
	QC/NvYOHwvxUw5qf4RWgc59sVgrT5snBoTnDZSDLyOgW56IuX7Yg8Cb4AnToJDSuLXuQXVUsn5G31
	BXfuO+9h5QUGzvv3L8/+EhBLcH/XmtzJ+rnyB9DA62nc3qqGQmNgwqgzj1lJVDUb5Tf1SsUUsR3VY
	6QjuvTWP/BQ34XJj+BlLjqjRNOpELUbtu7tUtHKfIpD9eWjrYhK7iAVsPnW8v5eeRoj+wHnuvz/vL
	kwosV/1M5CwtJVGXjdPVCbK5gOsi46EbMS3GzXTDNwuJJXerdKy2boxyONEM7dlxjPmvnsYSCm7S7
	zqYHhaig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwvi-00000004kRy-2uLN;
	Tue, 24 Jun 2025 06:14:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTwmB-00000004j90-3fuw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Jun 2025 06:05:01 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3Dd6g016970
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=0SmpNFp+B8v
	w9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=; b=nqBAxHyDFBaUQe7lELFAaV1X57k
	iE3MPmBjSgHZOhVws0HedSNThOc94RrczqMNOIuhdwd7kagpGwcFwAHH7vGMcAih
	NC2JxpwX2Y8fpw+gUeLtSb5XckodLvlB4xd6BDvA7vccfbnYSS+W4O8r4kg7Jbnx
	AQqB0DULZBJja8EvHvxM50WMpurVsl4kFY9zDW8vnGcf0aQ/ScFMnwjqFAsT/IfT
	D9Uy1qzGcN/HEgta/a8i3DCYRzTDG2wpwjXR0Pjx+DOJ50eb6TmFhL3vJ4s5y5S5
	bWL36NN2nF5fIgw5O5SEZ881FFrG+PE5UgxxcUrXHL3jcnjfrxqUez2eYyg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttt5mp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 24 Jun 2025 06:04:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-231d13ac4d4so69567185ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 23 Jun 2025 23:04:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750745098; x=1751349898;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0SmpNFp+B8vw9+MbCCEs5ee5DB9AM9lfQmDfPKr7t7U=;
        b=a1+QuzAms/S4EEOq71cLwvhP56pPbDEFCBLCG5BOabgip7egvrjZr5oMb7utwnxPBk
         sjjY8PxalFKdyvKMj+9kcamd1xnIuyrHQHIRc+thGwF1gjhk8z2/7N2fTLQzBdl4Tl4P
         X8kTQIXYEEbDBtjxySQXfcj7TjeVuCzrQU2TikNyO0BQfD3nhKEOmsURk8nJ1t62n625
         GDxohG2RgebpoCs33f4J29joEz0BiVLVwYO/vroJDU/anyFaS0dfIHerB6RJsf2tJadK
         hmdPfLeNiLUHw+FgVqb5hNiY697nl4u4ChfQ8dfKw/GWK8cqGmryGVch9daWNF+N5GK8
         FYHw==
X-Forwarded-Encrypted: i=1; AJvYcCVZAeDRwiXh5nGMfr02kq3cpXcp3vY8zvPrQ+1Cj4rRgA66dk13ELk42j/a3O8iQQsB9YuUQuHWPXXhUab+0utf@lists.infradead.org
X-Gm-Message-State: AOJu0YyvaX1y1z8jepelkua7AzkFCwmHFBgvFIqGWZRLQ0XuGJT/IXJF
	IlNrGbUYlKgen5y33EYabdZgBKsrZTluzaA8tSJ8YJ1yHJnFo9C6zXyHdx+UV2tuc7TbS6H+72E
	MwsOnwRb4HYarT0eTZ4L3Cgjc5RNED7+nwR1Y0iLQrrSgHuuf5QExvorlJJlqvjocoWg6PTu14V
	Xz1w==
X-Gm-Gg: ASbGncsTl3DfAlQKdPiHm7hJsIDfHKLOEnIsVWhgBys+lYiRiVOPB1xUStXZHi5EM8c
	3NcRHPr26cVmSDuuXbfTqMwauEapIAEzYiCqz33fFg0rmzY5b+Y7iVGUn23l20Tnfx80GSqy+gO
	omVaDVGjWXuvmOLvqGNgRk1jLoIBaMz79cK4D6qkpzsTQFLyNKyb4ePGkxOBnRFVz53EFi48ebm
	u+HQACskCc9WiWl2wmtuwrTZh2K1kp5jOEIcTziERNwOVBQR+TKSW/v9dMyJ/H663Z6gA68S/Y6
	BoteZZCCoCaCxkdMT2iMBSbO1N+rkiqhP1fIwWmWjP1LnXAWHENpwqc5g6l8WkdrmNCMz/Jaxo4
	M8g==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr276912065ad.16.1750745097808;
        Mon, 23 Jun 2025 23:04:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkSv1e6yZscpoifQQotP3Hcj8oMsbM5jLX5umPQVB1S7t8NeSUBaboum0YltNjUtaGRZQVxQ==
X-Received: by 2002:a17:902:ce0c:b0:235:15f5:cc30 with SMTP id d9443c01a7336-237d97d1abamr276911685ad.16.1750745097450;
        Mon, 23 Jun 2025 23:04:57 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83937b1sm101371455ad.52.2025.06.23.23.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 23:04:56 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        jie.gan@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v3 03/10] dt-bindings: arm: add an interrupt property for Coresight CTCU
Date: Tue, 24 Jun 2025 14:04:31 +0800
Message-Id: <20250624060438.7469-4-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
References: <20250624060438.7469-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a400a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9
 a=324X-CrmTo6CU4MGRt3R:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fJVj7ZpwUmbZ-ZCgBaIhYWAIZ1r-e8Pr
X-Proofpoint-GUID: fJVj7ZpwUmbZ-ZCgBaIhYWAIZ1r-e8Pr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA1MCBTYWx0ZWRfX7ve/IYhorBoq
 IydWtDgJGWRVTRMU0Yo+wRNhtDPybDs3jAV9qrtZTIKhJIpgiAF0wSv/Y90CAdPEPhNo6nh70xp
 HuO1X8/Tjh5RqBm4bUPM4NfgRtqrxLeJPGNc9X38KHTBaZ981iQar98nZeiuz6w2Ut6jfyytCIs
 qqcE9MxVEystX4Ol1/ish+TbtSdzksE54gYMZwWGx5iywT7mZATRGZReAdy7bn65EZq9FYz0ey+
 Vl29Tcevq9Oq5jfGG/bhP8Lqd7F4/v9wPyQxcdPuYhVokHPHTtRmvIUAcT+DtpghUNs5avb03tt
 aNZZ+LQswh6MWqUZ/1LwFxVrm3Xk7k1eAaHQH9K+3M4xeew9ms2UgaFxFY9cokpKtNgPyLb+po5
 bA7xlI2sf6n97tBE7Fk0ZsONmSqzP6tNskBmCOUxzKvHZDdo8gMYGAtLavQfWURS43Cdzkqf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_02,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_230500_099932_A8119DB9 
X-CRM114-Status: GOOD (  14.23  )
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

Add an interrupt property to CTCU device. The interrupt will be triggered
when the data size in the ETR buffer exceeds the threshold of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../bindings/arm/qcom,coresight-ctcu.yaml       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..ea05ad8f3dd3 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -39,6 +39,16 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Byte cntr interrupt for etr0
+      - description: Byte cntr interrupt for etr1
+
+  interrupt-names:
+    items:
+      - const: etr0
+      - const: etr1
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
 
@@ -56,6 +66,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -63,6 +75,11 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names = "etr0",
+                          "etr1";
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;
-- 
2.34.1


