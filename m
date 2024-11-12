Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6204D41D43
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 00:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nHCD7MrzIKXLGKUAWYVzqU7O/Rxc69UeBlTAwS4JxAs=; b=W8iZe8qIsVigSvpAHuUp08E21b
	yi+OyCyNLR8bY2xOrJ24F9ad/PQ4GacB7TJ7RPJIrov+yS2ha0g19IvgsGAay5ySDegZAFwT78TJA
	d2MnggqI7sLlhuipfPrOO2OVNAuh8PJg6k5QQVCZxzyNVIteXWByEE3P+Cirx19N/fYQQp9/V+llL
	xrwpkZrhGAAYRqX/d76tA1wAOGAB2xKkWWf3uuek768G0kJM26+7LhoAiDCxXlQ0+noSOC3v8tNfE
	inGiqrKPc9LAlnuiU6zwM9xJhVTMLIR5BhdUiyLqIuhJK2HqOHSHhpnC9CAv/Yb4uSP8h7TURAB02
	zhiAAeDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAesC-00000001lBz-1MFD;
	Tue, 12 Nov 2024 00:35:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAeqN-00000001ksZ-0L9k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 00:33:20 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ABCOd9v004669;
	Tue, 12 Nov 2024 00:33:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=nHCD7MrzIKXLGKUAWYVzqU
	7O/Rxc69UeBlTAwS4JxAs=; b=mht5CBp4JvufwzwD/5aQJIfEXXYurMQYlAlrSt
	BRS2gOau3o7N0SNSuqCvJ0b5fLl9PlCJDkhv1KAcIv/OunSzcQ+1jBGRqIov9PXv
	aec7KTJb8P1oVQvwotFuaIPHfbP04qk4AOMDxlipgDjqY1NdVf7f/JFpenxJmzbZ
	IWhNEong2BXw8OkgbeGapbbn2UzbZjU7QxPXWwA1imypuXeHpqKqlQ5uAE5Hu85w
	GBizTUSMBk7KSZzkflQNidqrm2HvAo7zIpVMCDfGVXM/JndbWZYxaS6Vttjoia5T
	hC+7yEfObRNCpjxqvDo+p7C7sIC+jcZG7VUMr1dOdX8tajvg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42syy25mw4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:33:10 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AC0X9Z3001343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 00:33:09 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 11 Nov 2024 16:33:08 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Trilok Soni
	<quic_tsoni@quicinc.com>,
        Satya Durga Srinivasu Prabhala
	<quic_satyap@quicinc.com>
CC: <linux-arm-kernel@lists.infradead.org>, <iommu@lists.linux.dev>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Melody Olvera
	<quic_molvera@quicinc.com>
Subject: [PATCH v2] dt-bindings: arm-smmu: Document sm8750 SMMU
Date: Mon, 11 Nov 2024 16:32:17 -0800
Message-ID: <20241112003217.2806556-1-quic_molvera@quicinc.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2a-CffltxWMKfCCRC6LSwTLJHzBuusKc
X-Proofpoint-ORIG-GUID: 2a-CffltxWMKfCCRC6LSwTLJHzBuusKc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 mlxlogscore=999 suspectscore=0
 lowpriorityscore=0 clxscore=1015 spamscore=0 adultscore=0 impostorscore=0
 phishscore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_163319_154680_644F1249 
X-CRM114-Status: GOOD (  10.51  )
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

Document the sm8750 SMMU block.

Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Changes in V3:
- added additional documentation for gpu and clocks
---
 .../devicetree/bindings/iommu/arm,smmu.yaml   | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index c1e11bc6b7a0..e4e067a2b778 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -61,6 +61,7 @@ properties:
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
               - qcom,sm8650-smmu-500
+              - qcom,sm8750-smmu-500
               - qcom,x1e80100-smmu-500
           - const: qcom,smmu-500
           - const: arm,mmu-500
@@ -102,6 +103,7 @@ properties:
               - qcom,sm8450-smmu-500
               - qcom,sm8550-smmu-500
               - qcom,sm8650-smmu-500
+              - qcom,sm8750-smmu-500
               - qcom,x1e80100-smmu-500
           - const: qcom,adreno-smmu
           - const: qcom,smmu-500
@@ -550,6 +552,23 @@ allOf:
             - description: GPU SNoC bus clock
             - description: GPU AHB clock
 
+  - if:
+      properties:
+        compatible:
+          items:
+            - const: qcom,sm8750-smmu-500
+            - const: qcom,adreno-smmu
+            - const: qcom,smmu-500
+            - const: arm,mmu-500
+    then:
+      properties:
+        clock-names:
+          items:
+            - const: hlos
+        clocks:
+          items:
+            - description: HLOS vote clock
+
   # Disallow clocks for all other platforms with specific compatibles
   - if:
       properties:

base-commit: 6d59cab07b8d74d0f0422b750038123334f6ecc2
-- 
2.46.1


