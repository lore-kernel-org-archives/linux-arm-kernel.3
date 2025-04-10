Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38B8EC369A2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 01:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q5C8avXIxcx6eZTU/R7g1j6DX3AayD2O7YvtYRznlQ4=; b=R2VXW+VS5nQAAxTkyVnIZvc2QW
	G9ibaeiBZcPtFg657ZWk69m+jN1whpYdVEDXUyDYdlw1RU9VNSaTPM97w8sNHli0ByQ/snU4SJb0H
	1aAbQ+pHYicJkmO+X4Svf7kNyrNkrDdb959ml4uN+umHGbatu82q8mZ+9/ZjB1ZSjvHDwZLLQA4ZR
	Q8BWwq1t4yBWCxJ4s2Lc4TQn2dAdDTxdOEvzHDXWF4zkGhwO9OnSjrB2QDyEEygaL+3qK0zTCuLsF
	XNgnfrVdNxMqTRAQ0H7sE0VED3pfXNMK6GNMckdY4CjeLpnaxBB+t5lvK95hsIHrfp+GSgw/0Lije
	1wonh2GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gsq-00000008xZG-3K5q;
	Thu, 10 Apr 2025 01:39:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2gnj-00000008wer-3zm9
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 01:33:57 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 539HErb2027501
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:33:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Q5C8avXIxcx
	6eZTU/R7g1j6DX3AayD2O7YvtYRznlQ4=; b=MujjNClyaI06HBsPxeKNYGbeSll
	rq9Bz9OOS8XGeaWhIDYUqMAtR9YPCPsqG2HSKlv1YFChTU6+xx/u5eL1TCit9Ecl
	4hyoo0qNfv78fXQVbqEI5sLurarUPTmWVqmFj8AqoKtXmjbMwGizIDCxLf+nGvf0
	xtk4+OqAtT55MGoggMnm3xSocUOIyhbv54XMQ8vdkR1wDppKNi4y54Y+zJ0KrI5e
	nLxv8KIvs5tqqnHim5U4lOehFREFqIe7POTEvxJmh5Q07TpY0dU6duG7JuIVXkOi
	PaTgDJI10crIWnMa2XhzpnN12ixwqwsPwuI5FDNhhxJkgP/igia3UxSzLMg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twcrnbjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 10 Apr 2025 01:33:55 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-229170fbe74so2303605ad.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 09 Apr 2025 18:33:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744248834; x=1744853634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q5C8avXIxcx6eZTU/R7g1j6DX3AayD2O7YvtYRznlQ4=;
        b=CDlCG9mRrGCDX5BSnp1ahypUo/871PICMG14Wth6KZo9TenB1Z6idhv4BLY/8yq9tf
         745Pf/wSx0o5UkxtRTJZqHm2rcAAJ7qtQR/GAvs6j2lKlQTTOG2IDsDdnU6rxV2lumeb
         C44sVlm3W89PeFYeWEPFkCfz06EXUTGp9G1DmrV0AtrulXXtBp4VZYenAJjyQjnqTaZj
         GsCkrv14lT7kTabcqPxfVolRKJWmca0MjO91IS1K3pCQuBkpyVn++EDeGrbXCrIazniM
         r1MSJslZS0uZKhniTOOIRvZfXBuRTEU529LIDmPDdUa4WLpJsry1vGK0YpEW6e9yPua+
         3HQA==
X-Forwarded-Encrypted: i=1; AJvYcCUaN/CEgJXVPI8TV161L5nbG3EKJZhxUT+PMPZhK/KsWzPSPzgtLbaMwnO5X8mz+UqdFxbpJ08v3ytvgtYfQYWy@lists.infradead.org
X-Gm-Message-State: AOJu0YybIyeGc9ikwv2re/Z7sOO1mymnQoay/pZVUjUDcIExgC+9mGs+
	uvhGtRflvwuCN0xOWXh9U5rsRt2WYrghXmG6LLQBqPlFBoeQ65cgEHTLwZBC8J18h9QWaPH5k7m
	ydi+Up/pBRxDnhMnUT1gWs5NTiguGQYRGoimn3AqYIbCfDNQaF0+LNu4AK7YXa7NUZznauWj/hA
	==
X-Gm-Gg: ASbGncubUDxm7zqHyPR/tH0S1D6zQ2uSJWXChNJ8Fn09MYW3KoafYWaI8ivRQML5ak5
	A1J2szLD0iTmBoSdoafO4KmSn2ujGXY9uYC2vTqWou6LTQJHrqDM0kj6pphf0RQtbmOfyYj6QR6
	VV2s3pnBFWcapWg0LkBCXzL9OVQFF7685QciDpuBk+VX9PlVdsgvGPR+UH6/3jrCbNnnrxyLCBg
	YssGZCfntbZSFdXgPo6xrX/QwWK84vWKYN6whCGfFY6UoR0hwqTUquM6bVDB0+/onD/pXotKwnI
	2H67newDZ4KSTQcwdudJpHXeWVk3Q0UH3GMJxMI4X5TWfo1NQ44cEkh8Pz1ntvtK6gZyN2s=
X-Received: by 2002:a17:902:f650:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22be0388945mr5828915ad.37.1744248833679;
        Wed, 09 Apr 2025 18:33:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFuGLiA2GpR0NJuAdO+G8PI7iF8HwBXSjne50t51n8f56D/aAMKowziVlwmYW3huuRGfdtbHg==
X-Received: by 2002:a17:902:f650:b0:224:10a2:cae1 with SMTP id d9443c01a7336-22be0388945mr5828615ad.37.1744248833241;
        Wed, 09 Apr 2025 18:33:53 -0700 (PDT)
Received: from jiegan-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7ccb596sm18801815ad.220.2025.04.09.18.33.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 18:33:50 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Alexander Shishkin <alexander.shishkin@linux.intel.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Tingwei Zhang <quic_tingweiz@quicinc.com>,
        Jinlong Mao <quic_jinlmao@quicinc.com>, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: [PATCH v2 2/5] dt-bindings: arm: Add an interrupt property for Coresight CTCU
Date: Thu, 10 Apr 2025 09:33:27 +0800
Message-Id: <20250410013330.3609482-3-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
References: <20250410013330.3609482-1-jie.gan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: u94a3DKobu8V6Qb-nRHjRMAWoTChKigq
X-Authority-Analysis: v=2.4 cv=QuVe3Uyd c=1 sm=1 tr=0 ts=67f72003 cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=gSyxy6DGYGa4b6s9XCEA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: u94a3DKobu8V6Qb-nRHjRMAWoTChKigq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 spamscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 priorityscore=1501
 clxscore=1015 phishscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504100010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_183356_135963_7429D216 
X-CRM114-Status: GOOD (  14.20  )
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
when the data size in the ETR buffer exceeds the threshlod of the
BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
of CTCU device will enable the interrupt.

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


