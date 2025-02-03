Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2627EC02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/wAMNkaLpLRnVz08FGxjiocHC74acXvxCjV+I7fHh70=; b=ioGyhu/Ey510YlWAupeRkPYjoL
	Uf0t+uOS6rG+OeFoR2qpnNp1YbPEuXhXTcz1cxlSosDO1bLbs+bnhoGuZrMvNWi/+kAQ8Y9hakywZ
	KO880pi2Hz1770nzVUAbbnfcArxMQsKvjH+fVqfXlP7eL98H74hj4vLcOPEYYH2V861+NJInVRObM
	YeW1nEAobjvD90kCksDsgEkncycP9iAA/DcmYTPoGiX19wFAIwHQIyu+HDzr7RRapqW1zZDJijtLi
	Y4bpM69NOvntITSFnmjR9wYfh1zRHfBoYaLyBOMGpCfJFZqFD7l5McEGQwCrWm5clXH0Ow9x0N8JY
	yJzPVcQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepNG-0000000Ec4a-0jrr;
	Mon, 03 Feb 2025 05:51:58 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepJ0-0000000Ebeo-17iX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:47:35 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 512N0Zf2007832;
	Mon, 3 Feb 2025 05:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wAMNkaLpLRnVz08FGxjiocHC74acXvxCjV+I7fHh70=; b=WInzdb9j22/Ut2CT
	oi+SoZ5P9ZAz21zugDCXKFFWBGQ1IJbz17r21fGmyvSaFcRdm42u7GX4Q7cjHBf8
	CcEjOSFKGwT1YnuyZfULsQDwBX6ijWYUqIsXaF5ByJK/iShNRO2+B7ksql3of6U8
	TVc35z4+E+VB5M4K9tg9/CycVQuJIWPdDwqpCgaL7Ehxo7qe3ovtueypQSsT4eWh
	VaxRSSgtYoaauBXCEQQAOinL9R02COddCJkNzSGrH/WtLSkNU2WCdo1htp8cAclI
	SIakWpfNwKlXyXBTWSEWi7X+MmBfqdm9snwDJ3jkxPutmHJZEMkzmNGYOg0fo+hc
	N7Sv8Q==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jd428rm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 05:47:27 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5135lQB0017286
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 05:47:26 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 21:47:22 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Date: Mon, 3 Feb 2025 11:17:01 +0530
Subject: [PATCH v4 1/2] dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250203-b4-branch-gfx-smmu-v4-1-eaa7aa762f48@quicinc.com>
References: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
In-Reply-To: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
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
        Pratyush Brahma <quic_pbrahma@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738561638; l=1546;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=PwPs+GNNpY7tL5KTtexek1KcnldeKWBfrDorxewc4fc=;
 b=Sa8sIZPt5gMMG62yAvrif98Kl/Q4co4oMU0gVEq6/3AYVdIAXKwppyVHtbh9kmiS5rlTgBODQ
 +/HO8e9DTv4DkeBFy4RazSYRJP0caMk4pQmQ9BDYynJ0+6g0/SQWg22
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: IE-Mrq591AMxYJ4L2A39E_vgiEvqqZKS
X-Proofpoint-ORIG-GUID: IE-Mrq591AMxYJ4L2A39E_vgiEvqqZKS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=847 malwarescore=0
 spamscore=0 bulkscore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 adultscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502030047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214734_428435_4ADC8514 
X-CRM114-Status: GOOD (  12.01  )
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


