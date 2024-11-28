Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690C1D690EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 08:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB7H6zqOU8XA7++jjxBLmHR+yV+sy4tTZskNpFRtSKk=; b=HpVVEv2XHpHN6jSHNA4ooMiPVM
	FkWhYCaGKzg67DUex1kbelBDf35923EA6ZPsY72pdCyw77dVc6bxQFgzb9SdYlrsJAedFnlxuR0dF
	yhWs248NjGY9vvvK7TuzpjhO/25gHO08BkIwTV6Tduo+Zuqo6HJ2kyC88ccnsNVCnaayIAfrUIb+8
	UPFVHyQqsgqBxlIBbS5zHwo2SUrRT4fRiL8MAqlfaU/fq5/KQByzSD3ATIoIJUr2X022nrKfkmS+l
	YP5nfloO7ETFXlQyz34c2CKXGQ3AiIuSZL0LL0a7YapQhECFxV7YRxrcOjGOR554Iclgvd2q27EYN
	ZmIgzb2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGaAB-0000000F3BZ-2UCz;
	Thu, 28 Nov 2024 08:46:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGa9C-0000000F320-2M47
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 08:45:15 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AS8d5U6028694;
	Thu, 28 Nov 2024 08:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB7H6zqOU8XA7++jjxBLmHR+yV+sy4tTZskNpFRtSKk=; b=DbYYrkDEDfmyaZgw
	uLy+AKvhu7PGgaKVaImbIInKP1WE5q8mzW/E3HkiK7G/OhGvSIFGnHvvUI70ddja
	F6k2s9vasRGD58bplsABc3fwn2A5//MyAs6d787Ywr5ek2bZNQ+uaYN7xfvexDrH
	1DLf2kM4enjg+GPCsel138JBJMvg35IoLddCYV7Qy/8eVo9/7rBFzPoClaDxkhkb
	rLRh6TBgAMciPUM2rauFsdcNaFkw2jMF41sZXHuCA1CxZ9NN1jVIRs6Eck4QWglr
	gao3BdPwybS2LZ8OVzIdg/gC2Ek6sm9Cj6w3RKXdyx3D3nUwOK+dVgNjqzyVTO9Y
	uWXrpw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43671e9v34-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:09 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AS8j8dj007565
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Nov 2024 08:45:08 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 28 Nov 2024 00:45:05 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Thu, 28 Nov 2024 16:44:43 +0800
Subject: [PATCH v3 1/4] dt-bindings: arm: qcom: document QCS8300 SoC and
 reference board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241128-qcs8300_initial_dtsi-v3-1-26aa8a164914@quicinc.com>
References: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
In-Reply-To: <20241128-qcs8300_initial_dtsi-v3-0-26aa8a164914@quicinc.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio
	<konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
	<catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
CC: <quic_tengfan@quicinc.com>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Jingyi Wang
	<quic_jingyw@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.15-dev-99b12
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732783501; l=1008;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=DBENkEC0ApGIzDp6doWvNzdm8cGCKFKIypaD504T8us=;
 b=cAhXmcLfDi5jRbRl1C6p3L/x1rNmLo9L3teaN+gRbMnOCU+3tsJOaBEHTFWjiReur7Sg5/HL5
 s6RGPdJbXQTByt4WMMlseM+sIWM/c+SMYPD4AELJA4xihR/Us+oCVpM
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 70aNPnlbIBTlHQhSy35K1KOgtfFJhF-_
X-Proofpoint-GUID: 70aNPnlbIBTlHQhSy35K1KOgtfFJhF-_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 impostorscore=0 mlxscore=0 phishscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 mlxlogscore=953
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2411280069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_004514_609257_62F23EF7 
X-CRM114-Status: UNSURE (   9.40  )
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

Document Qualcomm QCS8300 SoC and its reference board QCS8300 RIDE.

Reviewed-by: Krzysztof Kozlowski <krzk@kernel.org>
Signed-off-by: Jingyi Wang <quic_jingyw@quicinc.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index ca3990393510..87f1106767a2 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -52,6 +52,7 @@ description: |
         msm8996pro
         msm8998
         qcs404
+        qcs8300
         qcs8550
         qcm2290
         qcm6490
@@ -921,6 +922,11 @@ properties:
           - const: qcom,qcs404-evb
           - const: qcom,qcs404
 
+      - items:
+          - enum:
+              - qcom,qcs8300-ride
+          - const: qcom,qcs8300
+
       - items:
           - enum:
               - qcom,sa8155p-adp

-- 
2.25.1


