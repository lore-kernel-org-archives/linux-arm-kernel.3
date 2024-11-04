Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14B09D132A3
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 09:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nq4+8zGPVzwbKy77FvdUljap/8xgrvYCNGaZHBGYgWQ=; b=LBx9XFTGln7koH2aJkO3wu6wFM
	jc2uO2cD8Wv8eom9wDwPuym3JKXGHRcIEv3kIOHCtZlkhPtx8P5/jonrk5W81RKJPJQEQv+Ii8rxy
	EhePNIkvsjiUgNWQ6wHeoE4hF1eK8Rlosoc6yDfnJKhS/BZmEKLzYEHt5ii2W44pYoUNn6rxWsKSL
	Lb3E4GdMWB+v4myPrBybWGauqCWYe+n2niq5o8k1RVwR1eltRyT7oH9fD2+F+YNUtpyShgzd1rSqR
	lneOlO1cXkXwqLEb9HbdX630mTWHE2CBtc8npjfsLi8kXwtbHzz+GpT0bdxgwaSbR9sG4Dqu+PSc1
	PJ3Na+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7tB0-0000000D7fe-3aDm;
	Mon, 04 Nov 2024 09:15:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7t6p-0000000D6Vd-42Mo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 09:10:53 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A3Mq0X8021752;
	Mon, 4 Nov 2024 09:10:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Nq4+8zGPVzwbKy77FvdUljap/8xgrvYCNGaZHBGYgWQ=; b=aGPS4/c3nOkG1nMD
	JUHtUgDoUCZG1Xu1a3jEEs0DMSKM/GJIED5kHGgNwldR4OyRQqnmrIKBwU5BUomK
	mtxo0WCayUOaHOcV/U15uDBWq3gIOWCSfABeLBuV10sgxR2zTXiBY3Kr1dWq1qdq
	CCOTIA1eC1YmCIv6bBY8dFrS3cgkiSqnGyeT85NdrkqTJqBjKVUpXT62ez7qVUAx
	6ToksjhbZXOa6VPcPs/icazWgOv40nCk+tQDwcKYW/Xmvz6/fzhN3qmx5IOZ6Mxg
	hl5L2865dl2LLrw1YmyF00+/mowj/A0wJRGF0+2BM44wVH40rkeza0ww/ZzEtS0p
	5Q507g==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4ykh2c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 09:10:33 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A49AWhC001993
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 09:10:32 GMT
Received: from lijuang2-gv.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 4 Nov 2024 01:10:27 -0800
From: Lijuan Gao <quic_lijuang@quicinc.com>
Date: Mon, 4 Nov 2024 17:10:08 +0800
Subject: [PATCH v5 1/5] dt-bindings: arm: qcom: document QCS615 and the
 reference board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241104-add_initial_support_for_qcs615-v5-1-9dde8d7b80b0@quicinc.com>
References: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
In-Reply-To: <20241104-add_initial_support_for_qcs615-v5-0-9dde8d7b80b0@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Thomas Gleixner
	<tglx@linutronix.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon
	<will@kernel.org>
CC: <kernel@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        lijuang <quic_lijuang@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1730711423; l=1010;
 i=quic_lijuang@quicinc.com; s=20240827; h=from:subject:message-id;
 bh=WfEGy1gBvQLlivvSWlt/WjeCG3t+mDbKbgZ3QWdSCdA=;
 b=7cbodv3J87bpHsFHl+NUPzorRC1cQY/ObrvtSq4sp25Vue0cZAWBYbA1Zhgel1gp1vHRPlEV4
 eAsLoG1/oSFCNG9mosAjhVGHbyKwk3GD4FQwo6d5I9ITs1zqrbacKNU
X-Developer-Key: i=quic_lijuang@quicinc.com; a=ed25519;
 pk=1zeM8FpQK/J1jSFHn8iXHeb3xt7F/3GvHv7ET2RNJxE=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: nXi4wwxvxKIBECq2LdL39no_tF9mwYSw
X-Proofpoint-ORIG-GUID: nXi4wwxvxKIBECq2LdL39no_tF9mwYSw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=998
 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_011052_050026_E9AD0B49 
X-CRM114-Status: UNSURE (   9.95  )
X-CRM114-Notice: Please train this message.
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

Document the QCS615 SoC and its reference board QCS615 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Lijuan Gao <quic_lijuang@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 0f18cb35c774..a1d03d341498 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -42,6 +42,7 @@ description: |
         msm8996
         msm8998
         qcs404
+        qcs615
         qcs8550
         qcm2290
         qcm6490
@@ -897,6 +898,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs615-ride
+          - const: qcom,qcs615
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.46.0


