Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6867DD68B34
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Nov 2024 16:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2d8lH+LvVClXz36Mw/guiwdLgrwKANSS/DsNzWrGd9Q=; b=lT6YZ0Ht6CzP6vz1PTvQQ2keLp
	68+6vo+EqDXxsFz03oeFyOr9m31MOcE8r51cml2lCc4ebJX2TCv6NeXNLguhfmDdLp/j1UWdFohXk
	bdUHXeLV3kqq6d0NBdxw+9lkK387js5HO/1m9JNl+Np4muqSaL6ODN/rcLLyouf9HWQO1HohYfa5i
	yHel7e5nT4vu5BUxLi6VDszw6lkjTUNpG8GZIVfcLMB0JFcHjsnRBsAgXpDXpMLmdSZwvSY8SvKi2
	hFGNr0XNepLWjpsXrTMGA/G/LHpfXkVygr86GLVIqgf7ZO8LlJp0KRFuUzU9HpG8DNVEmXs5JqUMp
	YS9NKG7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcVO-000000004Ia-0VYn;
	Thu, 14 Nov 2024 16:15:38 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBcQC-000000002er-2IKn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Nov 2024 16:10:17 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AEAPvdJ031268;
	Thu, 14 Nov 2024 16:10:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2d8lH+LvVClXz36Mw/guiwdLgrwKANSS/DsNzWrGd9Q=; b=KPTaZ21qXAW0gQc+
	Xd/9monuKIiczx6ORPV69hBYzKaJEFY7lb6RFG+2PuDKFeTW2/WGmvdokDCXTMIJ
	gVFjqAPx6D0jOHdIVoMoTnScBfZRZjMipMWA7hUDAY1QqfUd+gpuebhA4X6onyaU
	IOiVZogv3i++uMWL+C6tnMvTzKFKCF5kHJSghgBchbTF8FFhp0zorE+GYFdboKmK
	RbdIXBpCs87iCeT/Pg5juac6dU7PEeNqkiLYqRm4Ke4WJq6J6+bzGZj3P6jpLcXt
	lgdTfNSt0ueR+5meFsLDktKs3WVYFHMsfLI7oNMJGeXFyd1cQCY3bV4ZVMbky5Ea
	7IvuIw==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42w66gucpv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 16:10:08 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AEGA7JI019116
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 14 Nov 2024 16:10:07 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 14 Nov 2024 08:10:02 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH RESEND v17 5/5] iommu/arm-smmu: add ACTLR data and support for qcom_smmu_500
Date: Thu, 14 Nov 2024 21:37:21 +0530
Message-ID: <20241114160721.1527934-6-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
References: <20241114160721.1527934-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: q47SVlZGnUZsOv5plWKerGt4nUpGic5e
X-Proofpoint-ORIG-GUID: q47SVlZGnUZsOv5plWKerGt4nUpGic5e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411140126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241114_081016_709128_A44CA547 
X-CRM114-Status: GOOD (  13.66  )
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

Add ACTLR data table for qcom_smmu_500 including
corresponding data entry and set prefetch value by
way of a list of compatible strings.

Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 33 ++++++++++++++++++++++
 1 file changed, 33 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index b595fee23836..5106103574ab 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -16,8 +16,40 @@

 #define QCOM_DUMMY_VAL	-1

+/*
+ * SMMU-500 TRM defines BIT(0) as CMTLB (Enable context caching in the
+ * macro TLB) and BIT(1) as CPRE (Enable context caching in the prefetch
+ * buffer). The remaining bits are implementation defined and vary across
+ * SoCs.
+ */
+
+#define CPRE			(1 << 1)
+#define CMTLB			(1 << 0)
+#define PREFETCH_SHIFT		8
+#define PREFETCH_DEFAULT	0
+#define PREFETCH_SHALLOW	(1 << PREFETCH_SHIFT)
+#define PREFETCH_MODERATE	(2 << PREFETCH_SHIFT)
+#define PREFETCH_DEEP		(3 << PREFETCH_SHIFT)
 #define GFX_ACTLR_PRR          (1 << 5)

+static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
+	{ .compatible = "qcom,adreno",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,adreno-gmu",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,adreno-smmu",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,fastrpc",
+			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc7280-mdss",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sc7280-venus",
+			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
+	{ .compatible = "qcom,sm8550-mdss",
+			.data = (const void *) (PREFETCH_DEFAULT | CMTLB) },
+	{ }
+};
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -620,6 +652,7 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.impl = &qcom_smmu_500_impl,
 	.adreno_impl = &qcom_adreno_smmu_500_impl,
 	.cfg = &qcom_smmu_impl0_cfg,
+	.client_match = qcom_smmu_actlr_client_of_match,
 };

 /*
--
2.34.1


