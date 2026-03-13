Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C111105F782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:03:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=C8lFhRT5j1MgzK8IQI5i/ksUOm
	DOmn6/CdBSTUs+o0+SkGkoz0HHZPAeLBzjgZqoooUH7lO2bTqSfNPCzkdwzTaNZ/neSAqGzyOZeZ0
	U3kKf748XVpGtvBNMIdOF51iK84+8nLzLQuO8Jn5tEWyX45hL9HguWgxCfh0vi1iDwW+ZzMAgEyrZ
	R3sPtXuSptbykqvS3nsMFh2mQxWtqwHCHQpyqXKiYRHpLcIKWYKpkUc7cPBX2bnye4/AVb7uUAabu
	7ZHJD8S6bNAR1C6dTpxu9OHG9Xi80DwljKtydHok/9zGy6aLmu/cKF5oWY+xEPRDaWsxuH/RmEIM+
	Wf4l9j0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQF-0000000HLC3-1YZC;
	Fri, 13 Mar 2026 09:03:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0yQC-0000000HL9u-1qV9
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:03:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tcBj1014832
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:03:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=; b=n0vDKuNl+IOtEaYG
	EBGvgVYeVY71ct51G5mLn78Prteo/suCcPjzVYKx03+q4NSOrrBIyED0zu99gus0
	ZTHa3sfEBzncUNa+1OLXPimH25lc90B/6q2b1lpgCWQfYKPqJpJge2qija8b/6BW
	D05+t5mneaf5wspe1IFVO5w5ybgQBfYu9e1zeVyqBG7ECFbULmPnSYjZqOqk8kix
	XiiHGc09Fqfh5RKtzDYWVGujENJSd0vBoLnEaCL7RfU3zMzV3Csd5kN9X0kUuQiV
	Vxy16Sn4YwbdstfKkU6PFepucR4+yQ7D03I/FX5mssSbIwtZaDD8t0tFhyrPrlBR
	Q3cUpg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cumvdmqev-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 09:03:03 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2aec805eec4so13918635ad.1
        for <linux-arm-kernel@lists.infradead.org>; Fri, 13 Mar 2026 02:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773392583; x=1773997383; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=gNXUyHplBdAQAkJfbbbspb5V5b+AC7r3K5/W/ZeN16rpY+j6OiARfL6ZWjbvT2nfOm
         2Z2R58HmTFCulfUNlrpTE5R6TVrL2feKeWMOFBj66jI4XuIT++C8cgZWINCa+KtEr8SV
         fRUBr4rmRupVCOlnyRuM3GbZWxltXTC0K5nfZ/F5Y6qbLXX5GZfHVKt4/DwDjCghPTuU
         CdQAMQyzemT2/A9XRzonsbk3ct9fLNlHUn/iC/2mmIgPrKGIbSo2lM6qYmiMtiTm/lAp
         VipzNEv42CfWNfCA7iLJD2VztHMCVkJuAiqWqfGjeJBbvweUyxAZGMcOr4ggAJY0DjhC
         eFDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773392583; x=1773997383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5AiUjeizRXgIt0pWaEk9wGXXVAIJo5RCeKWJBfIhvcE=;
        b=iFa44gyjmfZ7wXOYE/9/oVct89woDpAMHfAFqUVxPWxi0VzwNAfGeVxKhpwQIZEbcK
         kvszD7AzrKSAfi8kfhjFp1G0k8eu4gS29YFb+633A593Z4lS3zQ9g5KHS0Ukfn3yZOsI
         rIuL8MvsyODCwW2G0LZJsWR3qqwSyPJdNm+QnlmxNkq9nM4OiJLXDLGKQDPPIkOhMINJ
         6/EsFFjo6nSq72kSDylV7z/qDoWJ34pbIdHyxuRm2DLtgj39KnfaW/V5ze4WxbaNUN0C
         NChG67xaJapjZKZXIjr0ls3pBIRsZfGIYKVCsZ8S4v0e7y40+KPq340jYMqoLpSIWJrR
         Cq8w==
X-Forwarded-Encrypted: i=1; AJvYcCVd2NE6pKRDZdS5UKO2D93hKaOAM+trkRAzmvNPP9MSHovpTRpwfJpot1Gt56mgOA5B4uGBn6BzhI+dla2E0gvY@lists.infradead.org
X-Gm-Message-State: AOJu0YziIeqeJunR+Ue/kdb9rl7lXQrfJJt+jVPwBKVNNEMTAW7ykljX
	EeaGD2KgrZGq5PzICyQjYPfP9WitL6Fz9eX4eyOmK5JKcapO21Db8fZtC24Qjg2CJhyRkcAWTg6
	S3IEUt1gMhhzdNrA2MoKRg3CerJ6HW7quQA7hbrFFtffeUgrOTj5GgME8Zk3osflYRYCqa0DyRE
	RIzQ==
X-Gm-Gg: ATEYQzzBuphKcx6ltkykl+KHrgDPY6ArdstAXsaWF37u/eZV4D22HIGDZ3yiadCHp02
	AmqG4ohHZYQxKbwpdbpNoqKCvL2cWO1vMUQcvoSkoOtkQcUMyvf1JqJUxfoLxKLZOfF2qT28tWY
	X3+uMLeMA2ckw8LCwmY2OxhYBHcHnvgnPBtsYc+LmPnfTwHzsvEWxyH01+7G/zGxtmQPhTdyETB
	FJNMWIHvCjQkkjMd2Iu6xZXOHg+AAcBl876V3yYJ7x5cfwZ4gkmFkHP2amf79DotixWUiMAmY3J
	aY1iYIlRPUUKr0YYaW1utSyPWpyF3hES7d/Zre//bAAIerukEPgi812bC9C7GyuUZIVHyRRVAzc
	qUcWi78hJFI4ASOomPk88iIP/tMzuFdQMA8Y3pTdhm4EzO8xsvyV7UDTyPhiT3rUcwga6UuAc+s
	P+UGL7vm1E
X-Received: by 2002:a05:6a21:748e:b0:398:b72a:94c1 with SMTP id adf61e73a8af0-398ecb44697mr2160737637.30.1773392582566;
        Fri, 13 Mar 2026 02:03:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:748e:b0:398:b72a:94c1 with SMTP id adf61e73a8af0-398ecb44697mr2160701637.30.1773392582022;
        Fri, 13 Mar 2026 02:03:02 -0700 (PDT)
Received: from jiegan-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c73ebb9ed44sm1269275a12.34.2026.03.13.02.02.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 02:03:01 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 17:02:08 +0800
Subject: [PATCH v15 5/7] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-enable-byte-cntr-for-ctcu-v15-5-1777f14ed319@oss.qualcomm.com>
References: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
In-Reply-To: <20260313-enable-byte-cntr-for-ctcu-v15-0-1777f14ed319@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach <mike.leach@arm.com>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, Jie Gan <jie.gan@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, Mike Leach <mike.leach@arm.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773392552; l=1751;
 i=jie.gan@oss.qualcomm.com; s=20250909; h=from:subject:message-id;
 bh=DsL6kcYT3hY1q2jvZSOp/rxfO6RBNAUHqHA9yEMzJAk=;
 b=wxo93JaqfmmRQZHWnlaOdqCh8k2BX70514xVcuOFt1uLiFwTUsN5vwD98y42Myh1S5EFfwppp
 kx24azgXIP4C71B5gX+knl1PmnT3R7S6lISm0O61Xnmgmsl0qvnG4BB
X-Developer-Key: i=jie.gan@oss.qualcomm.com; a=ed25519;
 pk=3LxxUZRPCNkvPDlWOvXfJNqNO4SfGdy3eghMb8puHuk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA2OSBTYWx0ZWRfX6ji1v/5iOwCE
 zw14xOCRCSzZpBflErA68mS0Q0m4UABawQzoEaztfjY/UkGabn5i2R9iO0UIAYWRHQQdy/2dXfg
 15xftk4aauqnmGVyf6N1gVKJu4a4b5LpHtYBdRrk9PBkx3A/4k82hA3g/HNfxeab/KfO3uqg5+S
 k5dczSyBBEEKAhEw5YO1tjSuQ1XmGWoTl8tx2mcJrl6dcuFDBOFRtlPOt6gBV1z1xe7fUMDxXfX
 qcpzpTGxxq6CNb7gG5ehLT4DEdQdx09Js8SV9ov8Ip37kwPCsc78ZhbG8Y+6GziRSVRkPuDar0Z
 gm6HzEn0EoxmxK/SLruZX3svELo+3iZFoQ1PkwBYFkfIEdvQsalEZVHOSkGGl/ld3aeKSdZmqOE
 wuCeBoBXaHAiZuFk3Q2nkWjdST93dUWdGNhd29LfCk670U+2Y1x0Gd2xTdk5zFkzn3nLtHnxj9M
 L3IDrv1CyYrFu5WtM3w==
X-Proofpoint-GUID: lHq_s38Cwwo6CwJJkzov8NYcQ_D168Fh
X-Proofpoint-ORIG-GUID: lHq_s38Cwwo6CwJJkzov8NYcQ_D168Fh
X-Authority-Analysis: v=2.4 cv=XsT3+FF9 c=1 sm=1 tr=0 ts=69b3d2c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603130069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_020304_602502_EDD03A9C 
X-CRM114-Status: GOOD (  14.06  )
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
Reviewed-by: Mike Leach <mike.leach@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index e002f87361ad..2981001a7d7f 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -44,6 +44,11 @@ properties:
     items:
       - const: apb
 
+  interrupts:
+    items:
+      - description: Interrupt for the ETR device connected to in-port0.
+      - description: Interrupt for the ETR device connected to in-port1.
+
   label:
     description:
       Description of a coresight device.
@@ -65,6 +70,8 @@ additionalProperties: false
 
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+
     ctcu@1001000 {
         compatible = "qcom,sa8775p-ctcu";
         reg = <0x1001000 0x1000>;
@@ -72,6 +79,9 @@ examples:
         clocks = <&aoss_qmp>;
         clock-names = "apb";
 
+        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
+                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
+
         in-ports {
             #address-cells = <1>;
             #size-cells = <0>;

-- 
2.34.1


