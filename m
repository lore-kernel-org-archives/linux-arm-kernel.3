Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FEF7E6C61A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 09:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fB7H6zqOU8XA7++jjxBLmHR+yV+sy4tTZskNpFRtSKk=; b=lWGhkSsO9YCTy4YdmqohrQOqvP
	L73wvzoyAkDBoddAMNvuaud3kkdG2zQv9/mSHSqb5Xn21KlXqlxy/L/UzaOSCS5XAx1EXCN4czcc/
	WmUEQmSJMB9T7ad1aeIIzWqmZR7CJSE3UwbTi+5G47FK8XWpt9UmCG+gPdmgFle/AgzUOHKazl6UN
	eaTPB0tYJUzOT2EjmlwgqRc5Vs4APwmaEWb/sXPhSR7GrSktfnOyG9wzpKjSqoWiHgQ1nfrV6KS5h
	XhK/GaA/yYdqHeZc4zik1WlWG4rq23s+52KfExXgF7mPjqR27Hw4YzeJQn7q7cXmRZnVxIYKv2eE9
	hrZTuNUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPEk-00000008svE-05rI;
	Tue, 03 Dec 2024 09:30:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIPC8-00000008sCU-2iLW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 09:27:49 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B38YaSM004838;
	Tue, 3 Dec 2024 09:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fB7H6zqOU8XA7++jjxBLmHR+yV+sy4tTZskNpFRtSKk=; b=koD/Di5W4sHwWbU3
	H4BPln4Mp7PpVD75GHZA03Vkh/C9h7Vx3tFeKG6S18IIqiGDX9u4aGgFqMIBaMx1
	gs7YJcof3P/TlRTB7glNp9ISAlDndlCaFZWZjzEwlSMxphcrrjL73grZTgMObNaX
	meBNDwiQ58F0AoKJ6aS9MfYRtflBPMhGSRxGIRlF4hueryJ4LfkQT8u3YyB9juKm
	QM6C1/BxLPp2W5pWAZN2sMB6VQYTiY+oPrLy7ttWt+yQW4FMD2mkNL4wQbDCig1W
	aGEC6ecs0Den+oFAARha5MXyLnTJahTH4+ccG6kWA0UAJP7zI19CV6kMN57Vurkf
	M4f9mw==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 437uvjyedg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Dec 2024 09:27:43 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B39RhXJ015031
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 3 Dec 2024 09:27:43 GMT
Received: from jingyw-gv.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 3 Dec 2024 01:27:39 -0800
From: Jingyi Wang <quic_jingyw@quicinc.com>
Date: Tue, 3 Dec 2024 17:27:12 +0800
Subject: [PATCH v4 1/4] dt-bindings: arm: qcom: document QCS8300 SoC and
 reference board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241203-qcs8300_initial_dtsi-v4-1-d7c953484024@quicinc.com>
References: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
In-Reply-To: <20241203-qcs8300_initial_dtsi-v4-0-d7c953484024@quicinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733218055; l=1008;
 i=quic_jingyw@quicinc.com; s=20240910; h=from:subject:message-id;
 bh=DBENkEC0ApGIzDp6doWvNzdm8cGCKFKIypaD504T8us=;
 b=Std80+L4e9vPfuELeCtPCigDcS/ljP991PR36jXnQ2VGIQweoa+qk5/d7z3jNb8xRW45sLgqr
 edqpwu4wA6cCHLLAcwh6bpLCiRxHTMSCFGGvYUepaLrraFfx+4dhnpj
X-Developer-Key: i=quic_jingyw@quicinc.com; a=ed25519;
 pk=ZRP1KgWMhlXXWlSYLoO7TSfwKgt6ke8hw5xWcSY+wLQ=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: uec8F-4CTucGfYtSPxksAzhKjOGKUhIt
X-Proofpoint-ORIG-GUID: uec8F-4CTucGfYtSPxksAzhKjOGKUhIt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=950 impostorscore=0 adultscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412030081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_012748_692166_66021EC7 
X-CRM114-Status: UNSURE (   9.75  )
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


