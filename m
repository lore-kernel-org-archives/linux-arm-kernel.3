Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C8E7D5B161
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 06:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puwrNkeefsGsVdj92cwnxJqsErXN0jD9MjSzI5I3bKc=; b=SVtiL40jfAEtOLhgscWPPMSYlD
	Hz0LF7dTc+GDEQlH3Hu3p//3NUCfa1U/WeDoYn3RQfM3rqND4sm+g1DU853uUg0CSlpxq4g4ds4gI
	jcI4Bj+8fO+3FkltmB1bRyAF0ESUxs6aiE/k16HwaOvXWnrVS73yVZNHZWOio/oQCK33QoAUYZW4P
	q8JqRoUQ3BjsSnbWJrV/UOrLeB8LcStnAUTWTpOif5yF012gtJPSACEYAHzUFOh1Dm1lMD5JvYrwD
	hgjVTfeQYCIGp2VLDFDQHDMWDclUb492QAcbHdWeHMJu6oVy9c7kSdAOfVSEATDCNQLSr71pmn1f2
	0Fwz3Icg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOSa-00000004m5K-1Dsd;
	Tue, 16 Dec 2025 06:23:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVOSW-00000004m3W-1Wrx
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 06:22:59 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BG5Ip2N175730;
	Tue, 16 Dec 2025 06:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	puwrNkeefsGsVdj92cwnxJqsErXN0jD9MjSzI5I3bKc=; b=fJ/7WZOMOqgE6s7I
	p4+Bulv+aU6KLdAj7Oyfl1d+B/bj7tBDE3M+eL2AO/0XlErBDaiGl59O5meBG2nj
	zCcU0M9H7Lrr1Z1sPpTYVbqTjvKf8BUUgRvT8nk49RXDe507MgS2GRLcWrStnBO7
	+DR/0E9Aglq3N2OIhsXYWo4wYLcs+MY4mxzeu1OyGjCob2tViDUrgXjCRgf3kA4K
	3h1hDqqxPfpl/kFjR4FyAwakFmgul29HAFPh58A0zciQ3S0yHTD/DnEKoFIcmZjn
	qpinRWAEaGkhwz8adTfr5IBsjiOYanOKDwG4YSHiKo2dFOAf5TM2rhNhfdM5hj7U
	C7Pu0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b2kmm35xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:22:49 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5BG6Mnso000841
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 16 Dec 2025 06:22:49 GMT
Received: from hu-nihalkum-hyd.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Mon, 15 Dec 2025 22:22:43 -0800
From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        "Vladimir
 Zapolskiy" <vladimir.zapolskiy@linaro.org>
Subject: [PATCH v7 1/5] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Tue, 16 Dec 2025 11:52:19 +0530
Message-ID: <20251216062223.2474216-2-quic_nihalkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
References: <20251216062223.2474216-1-quic_nihalkum@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE2MDA1MCBTYWx0ZWRfX7sUMFXc26J0I
 wJMyWJy7yZrLUM9LjzSKTtEKDcO2+eLSMJ5HJ5ZgzNXmC0LipctABUn2npuHTqN/HdliTWzbcbj
 oVp22sbrUFfK+u+UrDtJB8g3XiMOpjkhOvFBiV6ZUNtusyroMKyKa0H/Wm7iOmLcFFkfi9A9Cms
 ax+dkDYtnVMqGW/56JzoLbsiUlbvqeTDGqVFsT3iAXUO026G7LB1tGExLLWLknFLd3C5GD1goRr
 dEilO9+BhnRPOtfJFkcixUANoBM/WOQmxCfXV9laV3XpQLvEwYIqfizn9hRiPDBYiZ0t7xHFYlc
 CWMse5whSJvh295Zu3MVoEc2XxwLRVCKhc7KjXPrNo+XEPpoIrgcGafmGT1GxteZv3sH4SIbj4j
 7HOuBkplZalgVHCaeRXWotZQIUngCw==
X-Proofpoint-GUID: k7S8TqrLBDFd9RaVRjD5hFD2LP7fcie8
X-Proofpoint-ORIG-GUID: k7S8TqrLBDFd9RaVRjD5hFD2LP7fcie8
X-Authority-Analysis: v=2.4 cv=EcTFgfmC c=1 sm=1 tr=0 ts=6940fab9 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=wP3pNCr1ah4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=s_BFhqDHtHiVpoTEQLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-16_01,2025-12-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 clxscore=1011 phishscore=0 adultscore=0
 bulkscore=0 priorityscore=1501 suspectscore=0 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512160050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_222256_410000_90CA39A3 
X-CRM114-Status: GOOD (  11.04  )
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

The three instances of CCI found on the QCS8300 are functionally the same
as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
common fallback.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index a3fe1eea6aec..399a09409e07 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -28,6 +28,7 @@ properties:
           - enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
@@ -133,6 +134,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sm8750-cci
     then:
       properties:
-- 
2.34.1


