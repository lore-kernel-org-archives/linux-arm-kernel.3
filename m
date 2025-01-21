Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57B1C02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 06:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XNEd4f3lsublZxdjuJqaZcs0gWmUyU+UY0g9XZEOvBQ=; b=XELVjb/4ll/swsqhSjRgke0s8t
	OT7YZL3PA7SgVQGrEbq8XX5Ldw1o+tfvvXvV+DXtOL0pq2KEGIY+qXc+GdXzMP5aBlZKXXAfojfm+
	1HXll4g5tyxyXAGLlF3Qkw+2MZofPt123CxGoabf3wAuyg6gV4bwBBAjeFQoq6tOf4ehMt0MyNGCO
	0uWjpGOz1cUSCoGZFAaLQfEHWtp8g2hDluLawL1/UB2IOyU7Xos858E0XKTDZmuwofXiU1wtg8zLz
	jq4FeJ786hrlaAAGlxhhLnhm8dT9hL2yB3YcZNvzB1ncA+eza6ovp0VP2+q9bQgYeTQaWJyc2g+MG
	32q3DRiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta7xh-000000071IA-2zE9;
	Tue, 21 Jan 2025 06:42:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta7v9-0000000710Z-13v9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 06:39:32 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50L1ssVL004975;
	Tue, 21 Jan 2025 06:39:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=XNEd4f3lsublZxdjuJqaZcs0
	gWmUyU+UY0g9XZEOvBQ=; b=PRQ6ISYwaXJUTSt12rSCbSVPccg5dd3csP5aQ4wT
	8o25myG45vbahE/zGybjduVipsn0CrEv1YdbiCDNsNAIBgav6H3HFWfUIKt9UlJ8
	cBv3wo2Rc2da3rZSPk/u1ZFToa5oXkS8MGWd5aPkg1dOl4QEjMWH6KlfE4Ql5PRl
	ctaviiyLsrhbwZEmiRiYaSqFJLptwpW3p3ql2BNMhDPyMNskWqTXJKKHMOx5kAXw
	Cxq5jd6EW6YPuARE/GeNpolcl3/dK65dVMDTDJKiHawQXcNWzltCszk1ZApsVADY
	4gWHUnEAtCWqhc0/PU4GG6pmUaGgzhTKxlbzh0PUdHJuNw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44a2b80j6u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 06:39:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50L6dNdw009977
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jan 2025 06:39:24 GMT
Received: from jinlmao-gv.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 Jan 2025 22:39:20 -0800
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>,
        Alexander Shishkin
	<alexander.shishkin@linux.intel.com>
CC: Mao Jinlong <quic_jinlmao@quicinc.com>, <linux-kernel@vger.kernel.org>,
        <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-arm-msm@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: [PATCH v4 1/2] dt-bindings: arm: Update compatible for remote etm
Date: Tue, 21 Jan 2025 14:38:59 +0800
Message-ID: <20250121063900.3211-2-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
References: <20250121063900.3211-1-quic_jinlmao@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: zgX1agSx2X6ZtC1coKaNhIWUTr162H9d
X-Proofpoint-ORIG-GUID: zgX1agSx2X6ZtC1coKaNhIWUTr162H9d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-21_03,2025-01-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501210053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_223931_294746_FC3A8680 
X-CRM114-Status: GOOD (  11.84  )
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

Use different compatible to distinguish between different remote
etms.

Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../bindings/arm/qcom,coresight-remote-etm.yaml       | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
index 4fd5752978cd..199f2ca4b8a9 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-remote-etm.yaml
@@ -18,7 +18,14 @@ description:
 
 properties:
   compatible:
-    const: qcom,coresight-remote-etm
+    contains:
+      enum:
+        - qcom,coresight-modem-etm
+        - qcom,coresight-wcn-etm
+        - qcom,coresight-adsp-etm
+        - qcom,coresight-sensor-etm
+        - qcom,coresight-modem2-etm
+        - qcom,coresight-cdsp-etm
 
   out-ports:
     $ref: /schemas/graph.yaml#/properties/ports
@@ -38,7 +45,7 @@ additionalProperties: false
 examples:
   - |
     etm {
-        compatible = "qcom,coresight-remote-etm";
+        compatible = "qcom,coresight-modem-etm";
 
         out-ports {
             port {
-- 
2.17.1


