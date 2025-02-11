Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7185FC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 04:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tPY11EtbrlKV3A7vtbOV1mGfJ+C0LzjLW4YvJOmb/cg=; b=yvRrlVEScbS9nrAkLIOXzVkMtH
	pXJi7zGJoTjbO4ObnX/MKphh6UzBvWb02J0/S3x90rV/JqXAocrLFBosVQEycevNDHmJU4ah9jIUd
	QSri/Lbam3e3x4bdoTsh+8TBvfVFjS6D0Bz/IrSLNr4pF9EGVsGAZZXlG72svXvASl8o2FnBFzTBr
	roEv5vBoQB3k709JYcS9GmrtO9u0pQ7UPNJ1j9XmqR2RI8acygwrnv30TshHfRrip5gMByJZjHyCL
	si8iCNlsExAjTJPpAtYr6Qh5AA8fjpksOYkzis/OWgq/P5HvJuszwbZvUhB7ngT3IWA3dGU6ysLlR
	e7i0qrAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thiD2-00000002Wc8-3yer;
	Tue, 11 Feb 2025 04:49:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thiAK-00000002WBx-0qsS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 04:46:33 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AHUrbo006164;
	Tue, 11 Feb 2025 04:46:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tPY11EtbrlKV3A7vtbOV1mGfJ+C0LzjLW4YvJOmb/cg=; b=AnzXdFzi5NZ4Pfr4
	cAi4xH1kqOQyE4NpdUmAYFHb9VrqP7Kz5qpCaX9ESDFWsVMmqxU6xDr2Q7QcZwB5
	VITDwNFUxv0WHf2nY032x03TriLZ/tlrkxY9Nk7rKhAKcWKNvtvGzWr8tO6/MSvt
	HRb7j4/KdrdIooVfLmo39WR7HYTngKxIzyxmCUb82cOkkG15ZNUNqoV7WbeIRgSW
	cyY2o4DkapGCJvWWsyR3Wp7QooPbZneCTcIceSTIty2JYcg+yNDUUBVTd5DQYKcf
	+tpN+4dzPBfnbtfMJKAWDluEA0lAZtIc52CST3YWCwSgtzUtsDDpTkfKGyB7TDBr
	d5/sQQ==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44qe5mtv32-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51B4kMwH031521
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Feb 2025 04:46:22 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Feb 2025 20:46:18 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Tue, 11 Feb 2025 10:15:53 +0530
Subject: [PATCH v5 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250211-b4-branch-gfx-smmu-v5-1-ff0bcb6a3c51@quicinc.com>
References: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
In-Reply-To: <20250211-b4-branch-gfx-smmu-v5-0-ff0bcb6a3c51@quicinc.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson
	<andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-msm@vger.kernel.org>,
        Pratyush Brahma <quic_pbrahma@quicinc.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739249174; l=1613;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=5P8SmXtkaKwfANsKyJLc7RIWz9rZPt3aenTCICKBOik=;
 b=Go41TzEgCcwWeKNYk2Ha7FZv1RfZbZI80rsL+9EWU97KFnivhjfuSLhFw1CRJ62qKdVjxzM8s
 JJdgXvOpnp6A0Bv8ws/SpvePoy81y0oIHF/eK3/q5IJB0I9ZXExQG54
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EI5W39Pvx3ryehm4d_BRfWSY29irLA-M
X-Proofpoint-ORIG-GUID: EI5W39Pvx3ryehm4d_BRfWSY29irLA-M
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-11_02,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxscore=0
 lowpriorityscore=0 phishscore=0 impostorscore=0 malwarescore=0 spamscore=0
 mlxlogscore=861 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502110026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_204632_365738_7AE9CD12 
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

Add the compatible for Qualcomm QCS8300 GPU SMMU. Add the compatible
in the list of clocks required by the GPU SMMU and remove it from the
list of disallowed clocks.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 032fdc27127bffd689ffc23630c9978c4460b336..7b9d5507d6ccd6b845a57eeae59fe80ba75cc652 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -90,6 +90,7 @@ properties:
           - enum:
               - qcom,qcm2290-smmu-500
               - qcom,qcs615-smmu-500
+              - qcom,qcs8300-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sar2130p-smmu-500
@@ -397,6 +398,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,qcs8300-smmu-500
               - qcom,sa8775p-smmu-500
               - qcom,sc7280-smmu-500
               - qcom,sc8280xp-smmu-500
@@ -581,7 +583,6 @@ allOf:
               - cavium,smmu-v2
               - marvell,ap806-smmu-500
               - nvidia,smmu-500
-              - qcom,qcs8300-smmu-500
               - qcom,qdu1000-smmu-500
               - qcom,sa8255p-smmu-500
               - qcom,sc7180-smmu-500

-- 
2.34.1


