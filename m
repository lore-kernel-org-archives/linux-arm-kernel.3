Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0848CAC599
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 13:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nfDF8r/0C7OOgeJ7IcjUgs+7X24oq7h60D8kYnff45A=; b=y/kG4uiK5UedJPPNabh2/vw6jw
	fPWx+7BINWxv3UytxUNm0QHrJZGdFT/wjs5T/YilJdkCUpC8sUAyUOnqjH4dcfcb8SABX3cSY1zOU
	xYPQ21vxgs9Ow0PubOZLYDZx9MD396mwN3gsFhk0OzRNugTyWrv/r47wg2OcFeHang91WOaVpEUkP
	sGkY1cN9LRIhgq0iKnPuQSSr2lHZzKd0d8tZcuzPyr0HOuH7zDAXzc8kva0BcuCbMXVixznjmujq4
	25U+lV97vvYzTkBGHvv89dy+F5Ur5Mm31zWutuXmL+WTbPH8Z1m7ajO4GNpbusff4667Kp+OnfkTv
	ERgzuOow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrsa-0000000BXeD-235J;
	Wed, 17 Sep 2025 13:07:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyrsV-0000000BXaE-3vr3
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 13:07:21 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58HCGSvN009462;
	Wed, 17 Sep 2025 13:07:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nfDF8r/0C7OOgeJ7IcjUgs+7X24oq7h60D8kYnff45A=; b=n/MXVBAUKctwmCfR
	gF2aeWBFaCKF7G8JCv4d+QBChMtzP2D3i6/QlwtpVdETbW/CtA3i/dpeTZJUnF+F
	xV5U7H/hnjheL2lvpKaWLCXXWERGCitZ+pX6/3riJP3SnLqj+fyzpTwaierrySnB
	dP8fEtekVsr9iVKrjgiGrirPCjUChQ/g6DIyPT9kFIhVSsae0SXJbCj8P1XZOqaH
	am92TnOE/WrxiRNIRxQ1CiVfN9vWhVIdev0bGeKSMBYP4mkrwTcCDy0FaSSyU3Me
	ldXpYPZlKCQZstHTyRWzlVOP+/3VqOE/WMq48zbK0SuwLGa7Kl3lhyskHFDoGTtC
	rJI6Fg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 497fy1tejm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 13:07:12 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58HD7Bdo030936
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 17 Sep 2025 13:07:11 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Wed, 17 Sep 2025 06:07:05 -0700
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <vladimir.zapolskiy@linaro.org>, <bryan.odonoghue@linaro.org>,
        <mchehab@kernel.org>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_vikramsa@quicinc.com>,
        <quic_nihalkum@quicinc.com>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v3 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Wed, 17 Sep 2025 18:36:45 +0530
Message-ID: <20250917130647.1701883-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250917130647.1701883-1-quic_vikramsa@quicinc.com>
References: <20250917130647.1701883-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gJLrzyL47G45hq9PvGeGxtOFMJTCmCaa
X-Proofpoint-ORIG-GUID: gJLrzyL47G45hq9PvGeGxtOFMJTCmCaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE2MDIwMiBTYWx0ZWRfX0b9ZkYmGyWBs
 b9jFw5YGDv09lWrhoUWXNlw6riyBi33YIt/bmD0XqFdlU84Pyf36xRGx+UrHy8DyiCRRDwn2EcD
 E5DvlCzplrfchXQNxUKfE3fEvLNTtGZTVD/jvPLzObr4YtCKmtmoxIP/z6lgFDuKuFilALHcnao
 LWJyl2B3VzClw1YVGl15imvDrmUluvev8DwPE9DHVga0XLoiZWUiqnjuhtLmk0gIH8UsERfx9Ah
 oCJ/gHxQMvCri3rB3OPYIJugbJG+ym/e4y9HIPIF0J7Ri2tEVGlU4DN3WkQbElfny1iM9nzSMMo
 CJXRLBa0U0pGW52qAnmY1+P7QfjjgvKlj2FGmrLJkQCXo4al4CoClUGfYEwNdtJXrJaJ9AnknvF
 7dH4Rqzx
X-Authority-Analysis: v=2.4 cv=cf7SrmDM c=1 sm=1 tr=0 ts=68cab280 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8
 a=phzA4CzYhpZqrDFsW3YA:9 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-17_01,2025-09-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501
 spamscore=0 phishscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509160202
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_060720_091985_565C1EC8 
X-CRM114-Status: GOOD (  11.41  )
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
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 9bc99d736343..5604ce43928d 100644
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
@@ -242,6 +243,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-cci
               - qcom,sa8775p-cci
               - qcom,sm8550-cci
               - qcom,sm8650-cci
-- 
2.25.1


