Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AC0CCCD192
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Oct 2025 13:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CI/090gSC0NTuHfVAhb5eoKhHpV1yacyXpcBOsxYpDU=; b=a2snsPNM0k6jEeFGaOnrB9EExn
	BG4HYtUjst9deHFepUeGCMFOSBuN5fNN2fR7oCe3uqyEtkHn9mMAvrVIPu70PIAV1M5VBDeB6DUwJ
	XyG7a/U9iwT+bhZkUkxhEz4KWDCp/U2fE09nbegCU+ouFgA599SXwEh2z0cFNrbie3NPXnKkjFh20
	jWP2yG9OWjGfbMQYDHvj3w7GrGsB8Dc8ZM0Fup3YRwvgdNe+mK+vaGfJQAtKN6emhLnp7o3DSK4Hy
	ufWlIzD7ut1XqvOohAsBS69ySRqJqPvU5o/E0eI8uJQaU99/1P1pkr93naKf+F2sZwlMkt8aGZ2Yx
	g0Zatd9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Jz-00000001fl9-0esK;
	Wed, 15 Oct 2025 13:13:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v91Jx-00000001fjx-05Wx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Oct 2025 13:13:38 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59FBBZcQ015803;
	Wed, 15 Oct 2025 13:13:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CI/090gSC0NTuHfVAhb5eoKhHpV1yacyXpcBOsxYpDU=; b=Yujg7KvjQ4xiwLt5
	yJ7V/lTxREtrahXxLZuTdxm1/SPHILfuGOv91UbJUQUVlPRsyqBdNuwLqk9s7bRW
	4L/lYbfX8C+EVuSY8jnn+2HEmJdPUbu3sJde7V7vcwZ3NMYy0fasxBdoqYZeHAwu
	fCZbc7cwqBR2nCJzg9Q899OyhvdAGuS5ukhn2xWVv5Invqy90YDxr9/8T80XH3Wh
	KsV+qZQTtai+vu6qYdNZjo2joy+iP0L5Kk5TJfAhH6KeQiI1lW//o7TcIDnPkKiX
	AHHOdtN1+KQRZEzTdv4FaS7WXZ0538G61uxGWwAZYYdJBmbH7pKxh/bEuB0oh9Va
	GCBOKw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49qfm5mkem-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:13:29 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59FDDSfk013166
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 Oct 2025 13:13:28 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 15 Oct 2025 06:13:23 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <quic_vikramsa@quicinc.com>, <quic_nihalkum@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v4 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Wed, 15 Oct 2025 18:43:01 +0530
Message-ID: <20251015131303.2797800-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
References: <20251015131303.2797800-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Beugbd9VNU_hfIPFlVYPEdGT4Sev8iww
X-Proofpoint-ORIG-GUID: Beugbd9VNU_hfIPFlVYPEdGT4Sev8iww
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDExMDAyMCBTYWx0ZWRfXwKbz+oxJDidY
 AohjJlfZmKvx4NrrTbWYaE2uIJO0cJA9mAv2JGqbObq7JoHkMQzJbEgHZdbaFxqN7PKUs3eiM+e
 durjp7/eXBNjZ9TpXsXBjJjhZG0bjHoFm/jt2COYiwzygbtWWpFoT6E0rPW0pGzmxDdeTViH2nO
 Cih8TduD5A1IMGiZPDzwxLMEGhH0k5GB+IY15MR0VeNml32+IiPlc3A7t5JSuGGYwFSIrGBkpwH
 awqKvC/NHmAcz48jZ3roUMpyjA+ySaIRJPAwcYKby8TblcWOZxQavwpPo4Dmi9ehR8e5Oc1Qe6G
 iB1LeVBUsK4fmZDjhA6XkdkCdTDBQjgsfgCyyRLX6PSbnppuwUhbWWS0MloLu70WrMKydvg6RbO
 J82EWZh9v3QpRsVG5+pMwti0PVXN6g==
X-Authority-Analysis: v=2.4 cv=V71wEOni c=1 sm=1 tr=0 ts=68ef9df9 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=phzA4CzYhpZqrDFsW3YA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-15_05,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510110020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251015_061337_170499_8E348A9D 
X-CRM114-Status: GOOD (  11.47  )
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

From: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>

The three instances of CCI found on the QCS8300 are functionally the same
as on a number of existing Qualcomm SoCs.

Introduce a new SoC-specific compatible string "qcom,qcs8300-cci" with a
common fallback.

Signed-off-by: Nihal Kumar Gupta <quic_nihalkum@quicinc.com>
Signed-off-by: Vikram Sharma <quic_vikramsa@quicinc.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..ef6af05f7585 100644
--- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
+++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
@@ -26,6 +26,7 @@ properties:
       - items:
           - enum:
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
               - qcom,sa8775p-cci
               - qcom,sc7280-cci
               - qcom,sc8280xp-cci
@@ -129,6 +130,7 @@ allOf:
           contains:
             enum:
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
     then:
       properties:
         clocks:
-- 
2.34.1


