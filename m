Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B8D9CCFA04
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 07:53:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WfHcdCY+e08e/1Qn/B+3vs4cSNT1ySicRxTSQHw1zs4=; b=obi046pHLBfPA5b5G/Meo+SR0n
	HNWAfryTkg/fLUZoGr0zOaGUa/Lg750MAHuBKc+htJ33eDQUV5dYKqm9E8WF38OazC3ZNE3Jm+DI9
	+Y+QTbM/6ZUJwyBSpp/dDMynxOZJ2n1M5pEwomNxhjrVAnCAQqqL4mmsTwNtZf/dR8d0FuJwiYItX
	K08DA1agCyQIkjAwQnMJqaPenSGEMFEBzoPuCZl0kKS9/8trHaULk+64MFYEFVoNwCMIzh8A7nMCv
	mt18AjdN5nllJ+TOzHQ9SQMeH7zhYQX90MaM/zOKRBVW4/2+/CG+Yx3AwqqOWr7b5PMdgsEvjZFUT
	hQiArXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYKc-0000000DEtS-44LT;
	Wed, 05 Nov 2025 07:53:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGYKZ-0000000DEsR-3KHr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Nov 2025 07:53:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5A57q7Tr2904354;
	Wed, 5 Nov 2025 07:53:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=WfHcdCY+e08e/1Qn/B+3vs4cSNT1ySicRxT
	SQHw1zs4=; b=GsQVfuKaQ+AAR0NNWC05x78NmnmrMinprOBr2h3fRX6kzdEzEmK
	/Q3pUN6hzSxkOGaLL6Rn/EwwChCMkhIIBqu8XqUhivKVTdWya+U7HYzfvloXOwPl
	elJqfz4QYIyt92zOJ9/NxE5FgNd+BF/isJazKwRR3h0F2VXiUHGIIAZ2uH5exkf0
	uT0ZEypWsBkMMGYgT3SDyrVZh/PSDEeZ/NoFYdv/Pw3c9m2BZrZL6kYO5TMKQ/++
	eH9PTUiCeGjl/JFGt6Y5iLvznLM0EZXXitmP0M6IePslR9+Bcq6SbsdqrKWteidb
	Jk0H+VDrnaWTBFqAWgiBGf7DRZPMOmQ/YBQ==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a7mbbtgwb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 07:53:14 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5A57rB3P016283;
	Wed, 5 Nov 2025 07:53:11 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 4a5b9mbfw9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 07:53:11 +0000
Received: from APBLRPPMTA01.qualcomm.com (APBLRPPMTA01.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5A57p76q014357;
	Wed, 5 Nov 2025 07:53:11 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA01.qualcomm.com (PPS) with ESMTPS id 5A57rBp4016277
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 05 Nov 2025 07:53:11 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id B2C435DA; Wed,  5 Nov 2025 13:23:09 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, will@kernel.org, robin.murphy@arm.com,
        joro@8bytes.org, dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [PATCH] iommu/arm-smmu: add actlr settings for mdss and fastrpc
Date: Wed,  5 Nov 2025 13:23:07 +0530
Message-Id: <20251105075307.1658329-1-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: g_pz8dCGrU-BSQYq5IksI9jId3nMmTI4
X-Proofpoint-GUID: g_pz8dCGrU-BSQYq5IksI9jId3nMmTI4
X-Authority-Analysis: v=2.4 cv=MK1tWcZl c=1 sm=1 tr=0 ts=690b026a cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=KZ8tkDdTZV_0uGpIK1sA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTA1MDA1NyBTYWx0ZWRfX1frM+T4RaKlk
 oKRbbTZZBfqjpfVr8oqLBvfEcO6f9ZxUYr0Bh2PnHT3fb3NhpJI5yR1WeR/JkwFKw+ZKdRPibhx
 Y2kvxViI3+i9KUv9v9fFVw9K/MXL6U7vFNCUYt/sQQbz0bIW1eUCLCLXPw4kcN0kxAjbm7TINJy
 V+CW7TSOdDgbIjBEeyHD56sE/lnVJdpLYgmrl/B+i5mohblH5Fwns1dcYT0Tz/CynP/splgJI4t
 TY3TV+82/mX918IwXM0dhb2JnZhJPFeQpoX5CWCzVaT2e6i6g4TDSddS1d7BCRgkygo2iN/hXOZ
 AS5qwa3nHu1z7T6c7x1/orCAYUMIGgNEvmXC/q+FESTu8jqEPReWUDB7+Rftv1qeellNj/Qk5P0
 5mzaJP3nX2iLrDYma7p3Stqwxam85g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-05_03,2025-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 bulkscore=0 clxscore=1011 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511050057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_235323_836901_46D633AA 
X-CRM114-Status: GOOD (  12.46  )
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

Add ACTLR settings for the device nodes with below compatibility
and is mainly targeted for sa8775p:
1) sa8775p-mdss
2) qcom,fastrpc-compute-cb

As a side note, "qcom,fastrpc" compatibility is already defined but that
seems inept as the devices that will be attached to the SMMU is going to
be with "qcom,fastrpc-compute-cb" compat string.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c21a401c71eb..c76f6076f487 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -47,6 +47,10 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sm8550-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sa8775p-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,fastrpc-compute-cb",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ }
 };
 
-- 
2.34.1


