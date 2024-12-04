Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71DD1E7716D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 22:29:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:Message-ID:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=KRjpFeJFwblmAtEAARVx5E6IoRyDcUDcuisAWgu+n+g=; b=RvcogV9ruSP2Z2ntsBM+Rb8Ue2
	yRj7svMNL+VQz/ULpw+6+m8g4bxuRv2khzBd7tYOWsMFjDbJkNFMT+LzXGG7L7lrSlPbAu/EgTk1L
	GG4HXQVr4knM1qAp0Uzcl68Ptifwmk6WVlgBDPDvMMdaVOSP4ozbmjb5js3lT6/z3KakjtDqHGObq
	XuQMZwOq2Mo89fOWJTqqSaMqhWKf1ck+RJbj4wPsTJW/o3z8BC1KnbxYD7DDxPwXWbGylaHd83v6O
	dEIbe58AgOdD7RMe5Ji0QoeSrVv3WS2baqHbXRT+9CcgN3pLe0vMXjJ227LFrA7m/f6ElIEgKDqu9
	FGnwuCvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIxrd-0000000E22O-2aom;
	Wed, 04 Dec 2024 22:28:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIxqc-0000000E1sk-1cqA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 22:27:55 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Ffhtp023308;
	Wed, 4 Dec 2024 22:27:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KRjpFeJFwblmAtEAARVx5E
	6IoRyDcUDcuisAWgu+n+g=; b=d587a/xCCUV1xlZVo1Dl/5L+of2hPGKT5zxEOH
	thyRn+cQD2qZfs5Ofjma1eiGH0MFDBSbFIodivsMW824TDF/8ozzr1LvX2GUeI91
	qPTMgGUCVddolZSgSQ5I4TJLiWr0uvF0XqgU7RLr7m6LNjT77FVWQ/BupgkZh68/
	wxD8aAF9gHw2kM3cd48H7W87NBYX8trgtXDOj1mXlXK0ysCEM3I6VTzZV/fNcaH8
	Sma2aP8594N1NallT5AzxdUGX/FNtrTDT3RyFiCG08N6y1SDzayX8ddl/kLkYRjX
	6EkzfZ7Xmg5hmM0oKZdzi+qiJLKPEOgFrRA2SjP/WTdqh6XA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43aj42ab51-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 04 Dec 2024 22:27:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B4MRgJw026652
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 4 Dec 2024 22:27:42 GMT
Received: from hu-molvera-lv.qualcomm.com (10.49.16.6) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 4 Dec 2024 14:27:42 -0800
From: Melody Olvera <quic_molvera@quicinc.com>
Date: Wed, 4 Dec 2024 14:27:25 -0800
Subject: [PATCH RESEND v2] dt-bindings: arm-smmu: Document SM8750 SMMU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20241204-sm8750_master_smmu-v2-1-9e73e3fc15f2@quicinc.com>
X-B4-Tracking: v=1; b=H4sIAEzXUGcC/0XMsQ6CMBSF4Vchd7akLbQUJwdZHXQ0htR6kSaWa
 gvEhPDuVhfH/yTnWyBisBhhmy0QcLbR+iEF32Rgej3ckdhbauCUl4zTkkSnKkFbp+OIoY3OTYQ
 qWelrXdRSSUjHZ8DOvn/oGY7NqTns4ZL2LnhHxj6g/pMsobTgrMq5olIISRh5Tda0zj9mDHr3D
 TuY3HgH6/oBfVqR27AAAAA=
X-Change-ID: 20241204-sm8750_master_smmu-0867ab939686
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg
 Roedel" <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski
	<krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Satya Durga
 Srinivasu Prabhala" <quic_satyap@quicinc.com>,
        Trilok Soni
	<quic_tsoni@quicinc.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
        <iommu@lists.linux.dev>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>,
        Melody Olvera <quic_molvera@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733351262; l=2153;
 i=quic_molvera@quicinc.com; s=20241204; h=from:subject:message-id;
 bh=V0EjKFyoMiFzOVSQ2/2Apzaa49TPf9F5tzWQ/pgCq8s=;
 b=b77X0mjGkOducpwujz+ZTFigyyl4sxFcRudE/3M71yfrHCMXSz3OvnqXB2KCIKYweMCE4YVkf
 WXjsjpTpNhFAIaUO5T6SQ6zhQUHGzyi9zCJ+z22B+qZ+5N/wZZApIBi
X-Developer-Key: i=quic_molvera@quicinc.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YXbxqXhYN0xtRyb2g79QR4yAhObGnCo9
X-Proofpoint-ORIG-GUID: YXbxqXhYN0xtRyb2g79QR4yAhObGnCo9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 bulkscore=0
 mlxscore=0 mlxlogscore=972 lowpriorityscore=0 clxscore=1015 malwarescore=0
 priorityscore=1501 spamscore=0 adultscore=0 suspectscore=0 impostorscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2411120000
 definitions=main-2412040172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_142754_551404_285F21E8 
X-CRM114-Status: GOOD (  10.72  )
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

Document the SM8750 SMMU block.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Melody Olvera <quic_molvera@quicinc.com>
---
Resending since I forgot to include linux-arm-msm.

Changes in V2:
- added additional documentation for gpu and clocks
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index c1e11bc6b7a054e6e839b4cff356231170d95093..e4e067a2b778e3b9ed30bbb973b50b2b86ddd2f1 100644
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

---
base-commit: bcf2acd8f64b0a5783deeeb5fd70c6163ec5acd7
change-id: 20241204-sm8750_master_smmu-0867ab939686

Best regards,
-- 
Melody Olvera <quic_molvera@quicinc.com>


