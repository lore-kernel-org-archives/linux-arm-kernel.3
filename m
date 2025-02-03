Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B23B6C02190
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 05:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=q5Rtfn1YqxNVFbmTqKHdTAzUVGKqbWFPva1lsYU5loU=; b=IQlxRs/F/DVH9J
	oyogaeCwloDiA8lBKVKSbQDLOtzOfonp+gkJItcuMAp7A/9lwm2t7QuB19pqoguX5Yo6Gr1Cu0hRh
	ucdXzFLVjNMtKJqsPAKgb7yHZjIFiVeoWIdLn3nZT3yJfydzENgzkOfWJ6Mj/LW1S+U9eVTALo+VY
	UnyFrJeQ6l7tNiMFwyAIBKX5Na47zDzSn66PVQKcLSA0jrZAodx+jFRGdYShk2wv+HN92ZYFf65Ec
	VICnR66o8Sz3MkLwpWbFntyJx2jdkP7Dmu3HxL50zm5hOJq4Lw+xXxjYbmZ7RCESQRUrlM6xrfNmK
	DGOeVWpJx/XLoeZw/i6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tepLy-0000000Ebzy-2Frs;
	Mon, 03 Feb 2025 05:50:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tepIx-0000000EbdY-3QtR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 05:47:33 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51314l0R029816;
	Mon, 3 Feb 2025 05:47:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=q5Rtfn1YqxNVFbmTqKHdTA
	zUVGKqbWFPva1lsYU5loU=; b=ltg78XKiLSzCfn667/Xhvbw1CMz+JFG/si0nCt
	3soLNja1VyIm4yGU9ZglPrOjAfXF2aJK8qNRs7X59sdTMp5yqo1HRVYaa52HExZu
	6MLgDhA1lvaTFS35XUicXO2XZTdJvu/ovUXS5AtQ78q+CyGvktkq5HDb370FeHc1
	hh0z4xH/1aRx+S0A1XXcg9XGzaIWmBoxcBIiHl2QxfhfAFfgvuulI6BHuKjGNuEe
	89pQwUl8EY98jplFZfLg60TWysuq8QH2g+t/fKa1nrh1aKfCuCAjhTGBl8ExZmr2
	FHnFBsmmgGkCdJAhGBEi3v2wwKogq9CuJ6IkufIjHHLpg9Eg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44jkt9gc5h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Feb 2025 05:47:23 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5135lMaU004178
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Feb 2025 05:47:22 GMT
Received: from hu-pbrahma-hyd.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 2 Feb 2025 21:47:18 -0800
From: Pratyush Brahma <quic_pbrahma@quicinc.com>
Subject: [PATCH v4 0/2] Add support for GPU SMMU on QCS8300
Date: Mon, 3 Feb 2025 11:17:00 +0530
Message-ID: <20250203-b4-branch-gfx-smmu-v4-0-eaa7aa762f48@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFRYoGcC/x3MTQqAIBBA4avErBvwL6GuEi2yRptFFkohRHdPW
 n6L9x7IlJgyDM0DiW7OfMQK0zawbHMMhLxWgxKqE1JLdAZdmuOyYfAF875f6IRWVvZWC2ughmc
 iz+WfjtP7fuMeJrlkAAAA
X-Change-ID: 20250131-b4-branch-gfx-smmu-b03261963064
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738561638; l=1334;
 i=quic_pbrahma@quicinc.com; s=20250113; h=from:subject:message-id;
 bh=C52hZGEnU+5L8rUb8fX1gAW+tFKzWQJaceetmBf+h7A=;
 b=ZigvjhygBZF19rnm+g8YvU1XT4/3jY7gtH5afdWi7mvmCoG25aazD0RYksaQ/FawQH2WZXlpr
 ulRzT862ONcA3I1aJGZPuucC4GsNmyXDA5lZ2B66bjOM0jqY0abSNnR
X-Developer-Key: i=quic_pbrahma@quicinc.com; a=ed25519;
 pk=YvfZKC4rRO1Fot+wlXZqsoQWnAtLqrpMyEzslw3Ji+M=
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CZtqv26BXbf8AiH0JveP80KA-yFhHDPK
X-Proofpoint-GUID: CZtqv26BXbf8AiH0JveP80KA-yFhHDPK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-03_02,2025-01-31_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 adultscore=0
 clxscore=1011 priorityscore=1501 suspectscore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502030047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250202_214731_977720_E71D0CD3 
X-CRM114-Status: GOOD (  12.04  )
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

Enable GPU SMMU function on QCS8300 platform. GPU SMMU is required
for address translation in GPU device.

Signed-off-by: Pratyush Brahma <quic_pbrahma@quicinc.com>
--
Changes since v3:
- Modified the order of clock voting and properties as suggested by Konrad
- Removed dependency on clocks in commit text as change is merged in
  linux-next before current base commit

Link to v3:
https://lore.kernel.org/all/20241227105818.28516-1-quic_pbrahma@quicinc.com/

Changes since v2:
Corrected typo in cover letter to include QCS8300
Link to
v2:https://lore.kernel.org/all/20241227104651.4531-1-quic_pbrahma@quicinc.com/

Changes since v1:
Updated bindings for gpu smmu for qcs8300 as per Dmitry's comment
Link to v1:
https://lore.kernel.org/all/20241224100521.7616-1-quic_pbrahma@quicinc.com/

---
Pratyush Brahma (2):
      dt-bindings: arm-smmu: Document QCS8300 GPU SMMU
      arm64: dts: qcom: qcs8300: Add device node for  gfx_smmu

 .../devicetree/bindings/iommu/arm,smmu.yaml        |  3 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi              | 39 ++++++++++++++++++++++
 2 files changed, 41 insertions(+), 1 deletion(-)
---
base-commit: a13f6e0f405ed0d3bcfd37c692c7d7fa3c052154
change-id: 20250131-b4-branch-gfx-smmu-b03261963064

Best regards,
-- 
Pratyush Brahma <quic_pbrahma@quicinc.com>


