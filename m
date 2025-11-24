Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAF22CFD313
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Nov 2025 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MEAZ+s7oSiGGfdL5l2JcoHJfpVSigWIAdB2fV9O9CG0=; b=m5enx9udYrltc8qob3KxjGYT69
	c6ODXFVs9zTQ0RYKo+cIH6TmlgJHmdqCCuCESUt1vN4M6y6GuhPUR2PpcbZe6IN+r0Y+YtDRxxAm9
	Jmn3xPwJfTXilCeW36kb3D8VxklhLvzf7w5YTKYboEGLkb1pDVOd9ExyyZVBfYxaB6B/N97RBEZzE
	Kb/WfKu+qnWe4ZzaI1flZAM09aH+Eccx8Sw92YybhUMEr9M/Kq1G18gXYxIVdCZw/gk1o3/LiI8n8
	yQyJc1HE1KjYWQNJOBboxsivACd9kvhMD/1b3WlsGwYFrWe1vmnAsr7d2+ttRZVJyzJ2j75/T+wKO
	5gFarlXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa6K-0000000C55W-1gnn;
	Mon, 24 Nov 2025 17:11:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNa6J-0000000C54x-061s
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 24 Nov 2025 17:11:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=MEAZ+s7oSiGGfdL5l2JcoHJfpVSigWIAdB2fV9O9CG0=; b=altQf35iP+mGd8Iwsld633LNEb
	rLz7Op9s8IFamrcsCSAfXKjik2xW8JzpCbbmPJQYpsq5u9S6huLKY5BktcS4mUDT5OfZvNYW36JR7
	TqbXHrK8Pn3ByRWQSysNvUeiE4hplY3QnHLpIoQGUfxafYvDsT6qA7p/ZRHEhNrTNnB98SSaBAwxl
	mUNyja0k+dwR2V6pkwr1lZ5/oWtzlr5ToGbas/s98on4+zf4wo0l2OZOROFx2eJhHCFe5qSR82vd5
	R1erOL94p3EguhDXrIoAXZr5kyPTgbNTKDyxXc4vc/GujluBQLHTGerSJtDb1aq9YdXzT6g4NF7Xs
	4QBOSJrQ==;
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNZEe-00000004BGs-1k4U
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Nov 2025 16:16:18 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AOFuKEa776425;
	Mon, 24 Nov 2025 17:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MEAZ+s7oSiGGfdL5l2JcoHJfpVSigWIAdB2
	fV9O9CG0=; b=E/5MMTPqEDmfq6ryTUYL63jD6c/tKq9PRhh2pIF5tNBopuIxKQ3
	BNi+Xck2IY540ouLWD5nDo+kHAbcUjpWzzXmSBiOcic2ocWrZL5CqS2CQHSoUhsv
	Cktj0fXM4jp8Kvl3ww+pT+wHeKejAiOGR8vrnlk0fY2eVFrpfbvxSzGg1OiXBNgi
	dtqVQ5wcJQl/viyfnrdPG30+xDEd1e52OlX0j4wgJqEnEH7VfQbsXmDiBa09e7aU
	ShwXBBbvFVkL0IsmGs+Ktfdj91AWNQP+Of3iRrrnTkzSVjswWgn/Qk9ENxqw17iH
	Zw/gy8vkasqskp/wuLC7Y+M507xuceovuYw==
Received: from apblrppmta02.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amr8s8p65-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 17:11:23 +0000 (GMT)
Received: from pps.filterd (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTP id 5AOHBKN0009720;
	Mon, 24 Nov 2025 17:11:20 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 4ak68mp3jf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 17:11:20 +0000
Received: from APBLRPPMTA02.qualcomm.com (APBLRPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 5AOHBKi0009706;
	Mon, 24 Nov 2025 17:11:20 GMT
Received: from hu-devc-hyd-u22-c.qualcomm.com (hu-charante-hyd.qualcomm.com [10.213.97.134])
	by APBLRPPMTA02.qualcomm.com (PPS) with ESMTPS id 5AOHBJJt009692
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Nov 2025 17:11:20 +0000
Received: by hu-devc-hyd-u22-c.qualcomm.com (Postfix, from userid 389980)
	id 03B065CE; Mon, 24 Nov 2025 22:41:19 +0530 (+0530)
From: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
To: konrad.dybcio@oss.qualcomm.com, robin.clark@oss.qualcomm.com,
        will@kernel.org, robin.murphy@arm.com, joro@8bytes.org,
        dmitry.baryshkov@oss.qualcomm.com
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
Subject: [PATCH V3] iommu/arm-smmu: add actlr settings for mdss on Qualcomm platforms
Date: Mon, 24 Nov 2025 22:40:30 +0530
Message-Id: <20251124171030.323989-1-charan.kalla@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: zhEoXNapgT-dT2HT6KIXUnkKzQbZfBZg
X-Authority-Analysis: v=2.4 cv=KP5XzVFo c=1 sm=1 tr=0 ts=692491bb cx=c_pps
 a=Ou0eQOY4+eZoSc0qltEV5Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=6UeiqGixMTsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=9jHMADLK-yuNcm8qUCkA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDE1MCBTYWx0ZWRfX5+9mBA7RbRKH
 rV/GX26iziPG5dGVd/nqYxfqb4CA6iES8k3CUb+hCijnWYAMg11TVOL380zMiHkX8qylb+HXJuZ
 TBq4Z6OL5CVi/1IbiwaW9klGy9JiJCE5M+U+NuqcmgVPtseYZ3yYZV+Q6WcB9F8CoCHm37E2y61
 hZHKVVx7xno5fqfN0RWxjwPQGLTICmxMsNJQ2gGhbTZARDRagaJix+Aqg15GaDmQnINLXwf35m8
 8zzZr4zytZsOYylajQZAQHpJ4yDIlF1qe5L/N/KqhEg65GkVFkq40zAE1rz1fEVkzwSLksry1X2
 A0gVQJn45qTZupXZTYePhybabeX2mCZ2HSRuL4QuT1JrIVoh895Bb1RCm09Fmdgfw7bewu2YxPB
 3db084beeIx9st7bfvLJk/GPyjItZw==
X-Proofpoint-GUID: zhEoXNapgT-dT2HT6KIXUnkKzQbZfBZg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_06,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 impostorscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 bulkscore=0 spamscore=0 priorityscore=1501 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511240150
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251124_161616_733541_CBB163CD 
X-CRM114-Status: GOOD (  11.88  )
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

Add ACTLR settings for missing MDSS devices on Qualcomm platforms.

These are QoS settings and are specific to per SoC thus different
settings, eg: some have shallow prefetch while others have no
prefetch.

Signed-off-by: Charan Teja Kalla <charan.kalla@oss.qualcomm.com>
---
Changes from V2:
 1) Add actlr settings for all the mdss devices on Qualcomm platforms.
 2) Improved the commit message that explain why different ACTLR
    settings
https://lore.kernel.org/lkml/20251118171822.3539062-1-charan.kalla@oss.qualcomm.com/#t

Changes from V1:
  1) Added actlr setting only for MDSS and dropped for fastrpc. --
konrad
  2) ACTLR table is updated per alphanumeric order -- konrad 
  https://lore.kernel.org/all/20251105075307.1658329-1-charan.kalla@oss.qualcomm.com/


 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c21a401c71eb..ead1a59d40ae 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -41,12 +41,34 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,fastrpc",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,qcm2290-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
 	{ .compatible = "qcom,sc7280-venus",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc8180x-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6125-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm6350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8150-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8250-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8350-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8450-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ .compatible = "qcom,sm8550-mdss",
 			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8650-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,sm8750-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ .compatible = "qcom,x1e80100-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
 	{ }
 };
 
-- 
2.34.1


