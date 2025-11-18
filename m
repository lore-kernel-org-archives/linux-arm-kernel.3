Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F1A6CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TQmDCmeI6/bsQ4i+6/bcH4ArBxfNWE8Bq32UP/mRbaI=; b=fueE48XjUqNlpREwbjhnscOljd
	FEUTN5Jy0RtWDqDWvk9dPMGWjWyTJY1N5TfQJG+QPHAQJouUnCQkFFV1WhdKqjhn2zJ+IMIHDAgXO
	YpIHhXqWnGzrtpx733pUDEC3evhtNvXUkUBAjlHS3MoRfKvyRpkuLPrLPCi5UX9Ga6r7fcWsv44WJ
	6QdDMjX6twCOgdch4u30sn+cYKZe4IMIMPvLlZJyajjBpoXrgS9hq7tbjamHpxkuOAbJ/o+PlqRl2
	bImG+ZpJf/dlopI6s/ahJAtwtSQudCmEVuVfD68zmCAn8mm5pTwCYXbd6ts/Dm5gk/4DZjGpr1uQg
	aGrUUR/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPMF-00000000qdo-11EY;
	Tue, 18 Nov 2025 17:19:11 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPMC-00000000qcb-3IUZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:19:10 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AIAQmJw2926673;
	Tue, 18 Nov 2025 17:18:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=TQmDCmeI6/bsQ4i+6/bcH4ArBxfNWE8Bq32
	UP/mRbaI=; b=ZDmp2ZFRqxoIIgftPcAdPMT0OzVaS1QAK7xrk0O49frIIb4O8Iw
	NCK+WkfJsuyNraF+mfi/6ljE3phz1I7q6fGi+8CiCInsg3QVCQY3lxnvwtStTwQm
	G4761F9BxYOhRetkoosBbSrb61apSNVNo1tiBKJJjgx5pBQ6Ru5UDK9WGPRtYcF0
	dhw09dbo6zjIKErq1mZgCfYoqHrBYr0qKQWakt3ElIwqJF+31ez4xS+5Z2/dQweW
	oWmU4Yn8q089qnV2OBl/xRU0cHZ8X2s7ID5Pb6kgctVorsg8QYZyoPpZ6IzG3z9i
	xxZJE9af9dMDc2T9sbjvbpKjSZu6DsuJ5dw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agq2915x4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:18:49 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AIHIjTL018694;
	Tue, 18 Nov 2025 17:18:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4aejkmtk5y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:18:45 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AIHIjtS018687;
	Tue, 18 Nov 2025 17:18:45 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AIHIiOb018681
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Nov 2025 17:18:44 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 0EDB25CC; Tue, 18 Nov 2025 22:48:44 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [PATCH V2] iommu/arm-smmu: add actlr settings for mdss on sa8775p platform
Date: Tue, 18 Nov 2025 22:48:22 +0530
Message-Id: <20251118171822.3539062-1-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=FJgWBuos c=1 sm=1 tr=0 ts=691caa79 cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=X4sqO_BnIXgP0qhT90oA:9 a=cPQSjfK2_nFv0Q5t_7PE:22
X-Proofpoint-ORIG-GUID: b1hvGlTH4blTEgJUm6Qa2gw-cKcekBQs
X-Proofpoint-GUID: b1hvGlTH4blTEgJUm6Qa2gw-cKcekBQs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDE0MCBTYWx0ZWRfX1YsNimS3xbcd
 l5MPCLMHpKZYav7nfr+Fz4LhGkTaT4v+aR2Ill6FS5V3lKwECw9ZLWNzqiXQ+O6vlpMb6Ry1Jhn
 3asiL1SmhcvvZpwNNcImrIp4eO/HQ1LFuZhK5BKhnoyN3TWq4EDQwrQdBEmHc7RCevCaQ1F8vFZ
 4KoFkuvv1JZGGF1BDlRHRCsSb8N70YYe8+wRS2MyXfJrYQYPsC1WTcrbvlBzOU2QOHLbEPu7V9Z
 K+ce1UKKGJ9HTMxpGfCGMH/gHVIG1q2as77fQN9WIoHxH8vl0VC7qp8muvSkQeqUijFpQ4i0AAp
 37fX7VZROZhGmPAR7aAo2IkaE+33CSctms5tUjvwxCrL8v5AoaB6iA2Nko/b00yalG+TZREXwPG
 mT7G4tdnpsVcOOR3ZmbUHbw8NcrRwA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_02,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 clxscore=1015 spamscore=0 phishscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091908_944012_BB70107F 
X-CRM114-Status: GOOD (  12.61  )
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

Add ACTLR settings for the mdss device on Qualcomm SA8775P platform.
This is achieved by adding compatibility string for mdss in the actlr
client of match table.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---

Changed from V1:
  1) Added actlr setting only for MDSS and dropped for fastrpc. -- konrad
  2) ACTLR table is updated per alphanumeric order -- konrad 
  https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f645..0b400e22cb00 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,6 +41,8 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,sa8775p-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
-- 
2.34.1


