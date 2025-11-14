Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A53BCDE014
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Nov 2025 06:46:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oNx2ZEXv0ji489u+ERIBVDdlTPKxz8k9d3dCqv0kHAA=; b=H+Pg7/+mSv0r8x3VqIXCPuqohm
	H6V3zvDbOdQK79MzITtzYQ00dz5GC8i8pYzYcyX/W8vJ+wprpe94j7vvvadqUBCwlUJlkk0ndECPs
	5Ra9/7qnuzh0+vRD5nWc2sPoNafpTNquZPhmSwrVasfDkKhZQwp/2C7CqBEjsUrJ/8Oatbm8BqRpH
	wYGuid3tKcHRjR5AfRn23eKCKepH6bLNMQpAUBvS3Do5S1JKTIy11oi++zdYh7rg0tc8ml48QtFQK
	kgvS6vlujP1WE/gjfoohODsowrRqQiBE2G4V9whM4eNSDv8RvjqhKSoTa/ygdRgOTia38UxsNGJDd
	zvHW6law==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnZa-0000000BgFZ-1WX7;
	Fri, 14 Nov 2025 06:46:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnZX-0000000BgEC-3BaU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Nov 2025 06:46:17 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMbSQI1607749;
	Fri, 14 Nov 2025 06:46:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oNx2ZEXv0ji489u+ERIBVDdlTPKxz8k9d3dCqv0kHAA=; b=LMIG7mEmFahbpi+1
	JZtmrXibYK1jfVIKvSpTjast68eDnt0EszE3ZBOW1eIFWeNVJLJOzCgaVmt8q8nt
	dP01irGNLDR79n4rNDnv8xKEySDctZweN1tk6sti8SsiGjKlqNCUEMChZk09GXOA
	qbgwGKQVsqyQwUfNmbCHFScf0PF34eFbLmtgrw3M5GMxB+zH3SdFN+QHhhhc9nH5
	FX7rhOCvkqxZUEefWT8kn3yniJIdpPn2Qke9APOEyeN92HzgnZ0XL5ax/cqH8L09
	J8dT1p7H9wZeELdLwjpmy1jb8de6ZRWk5EwTnNdVSCYbzHqTGgRFns069+kjWjP5
	206t0Q==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9fs529-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 06:46:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5AE6k6RN023181
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 14 Nov 2025 06:46:06 GMT
Received: from hu-vikramsa-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 13 Nov 2025 22:46:01 -0800
From: Vikram Sharma <quic_vikramsa@quicinc.com>
To: <bryan.odonoghue@linaro.org>, <mchehab@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <andersson@kernel.org>,
        <konradybcio@kernel.org>, <hverkuil-cisco@xs4all.nl>,
        <cros-qcom-dts-watchers@chromium.org>, <catalin.marinas@arm.com>,
        <will@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <quic_svankada@quicinc.com>,
        <linux-media@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <quic_nihalkum@quicinc.com>, <quic_vikramsa@quicinc.com>,
        Vladimir Zapolskiy
	<vladimir.zapolskiy@linaro.org>
Subject: [PATCH v5 1/3] dt-bindings: i2c: qcom-cci: Document qcs8300 compatible
Date: Fri, 14 Nov 2025 12:15:39 +0530
Message-ID: <20251114064541.446276-2-quic_vikramsa@quicinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
References: <20251114064541.446276-1-quic_vikramsa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916d030 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=s_BFhqDHtHiVpoTEQLAA:9
 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-GUID: CyZD14fVkC-qv_w3uyugAJPsbol-Cm7l
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDA1MSBTYWx0ZWRfX+366aIuy2iTM
 GMcuHCgSRrWpgHaaIb5wOm/K5tAkAwJRIoNGBR7B3dZ0MuAlrcuUBEpOWRRgFgjW+ZYPIqdc/Wh
 eT0OaPf5QYp5urqyN2WYWdCPd913FkTr7y1igMJy+FsizUhq32xo9RGWl5d7R6MhrwbVnV/C14s
 B4xeTK20FVPxOwM3I752IWeAybhQIn1WnyZCL15zz7/wuYKLWLJUL1aVRiwTjAyhWS9CDszX5ke
 3sne1qhJ03+J3OSlusPq/HPDAokNYC1xSRsPLZ7OxG6ZLQwKTn/+2GaZpgi5Tle9JJxHQPuSw4h
 hEcoIvVQHnQKxDDMbNxFt9jgCpRcWlGIqrl35t6NEs73s427VoIxr9eF8OXjwRydiCIOY1Uj32s
 cNCvmVVoHlN3OLsnvN+OLdnsqVB8VA==
X-Proofpoint-ORIG-GUID: CyZD14fVkC-qv_w3uyugAJPsbol-Cm7l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-14_01,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_224615_924275_96B2CA7B 
X-CRM114-Status: GOOD (  11.10  )
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
Reviewed-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
---
 Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
index 33852a5ffca8..f1919f59d521 100644
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
@@ -132,6 +133,7 @@ allOf:
             enum:
               - qcom,kaanapali-cci
               - qcom,qcm2290-cci
+              - qcom,qcs8300-cci
     then:
       properties:
         clocks:
-- 
2.34.1


