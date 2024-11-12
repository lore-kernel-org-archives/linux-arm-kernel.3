Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AE89D42BB3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 17:04:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H/raMPv2tM9fV7OuJ3QaWVYaELt3Sr0uTCpF8SYhXXU=; b=A8pV87FN4Mpxnul63ec4KgCqv6
	cvhVFldWVZD7blk2GNv053ZBl2DL9XylArVRB6AIpIhBmJ8T2raogLGUUF4vOP7ICC1ZSJk19vo4i
	0wkH6yaT2AfVcAnITZy4n/S3deHysnnt5Ryz46cVYvKSYIDA/BXrKultkf6ITHaozV3HFIyvdjh3Q
	zQdHJohnHRQ3OqNYi7J52e5U0FvtH4IwJl/YV9hM1JMrQsNFwU3ru1e2twtyJAbndBlZ5Yafun28R
	nqffQ7InH7g6Fr5XYC5zS04B+/MXxCXZA1e7rUFsi78rDpSAwkW9diiVuyynk6n9PNFTrwzmzWd4A
	E5fvUFPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuJ2-00000004HLw-3tW4;
	Tue, 12 Nov 2024 17:03:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAuB8-00000004F1k-0ZSE
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 16:55:47 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4ACFklSa005225;
	Tue, 12 Nov 2024 16:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	H/raMPv2tM9fV7OuJ3QaWVYaELt3Sr0uTCpF8SYhXXU=; b=HmI8WY5n/HbkpR8B
	P56aTOlj0LvfWI5sDHOPjSgjIhw5CwNdXLzfw6SeUV1oFWxjI2JRN3M1sBcI1fh1
	31seDXpzfBr89LpFi87LdJjso+ER64fjKakkEEpSECf/XJqwYS7Yrc+bvSRJ9uXX
	5HUU3/tyKQTcbxkf3QNecVFHfZJJWxXEL0fGGezpiB3d/k4ctvprSJEMrimVeRBo
	l0GRf1WLkQXlQmkU6GamG47sVXndWbBE8YwpdrlG/MgFGWMiT6E3vM/9iOMEznkA
	nv4gkX7aCLyUL0R3+QrNTMXKNlMavARkObCLbmlzzbx4W8mAfsF5hK6PzFKvinwy
	uQ5uUQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42v1vfsrbk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 16:55:36 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4ACGtZfc001984
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 12 Nov 2024 16:55:35 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 12 Nov 2024 08:55:31 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH v17 1/5] iommu/arm-smmu: re-enable context caching in smmu reset operation
Date: Tue, 12 Nov 2024 22:24:50 +0530
Message-ID: <20241112165454.2698269-2-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241112165454.2698269-1-quic_bibekkum@quicinc.com>
References: <20241112165454.2698269-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rAgQzRs5uFpS67A40w_G_XOxXLuX4PwH
X-Proofpoint-ORIG-GUID: rAgQzRs5uFpS67A40w_G_XOxXLuX4PwH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 suspectscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 mlxlogscore=999 malwarescore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411120135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_085546_325783_7C808E66 
X-CRM114-Status: GOOD (  14.54  )
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

Default MMU-500 reset operation disables context caching in
prefetch buffer. It is however expected for context banks using
the ACTLR register to retain their prefetch value during reset
and runtime suspend.

Add config 'ARM_SMMU_MMU_500_CPRE_ERRATA' to gate this errata
workaround in default MMU-500 reset operation which defaults to
'Y' and provide option to disable workaround for context caching
in prefetch buffer as and when needed.

Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 Documentation/arch/arm64/silicon-errata.rst |  3 ++-
 drivers/iommu/Kconfig                       | 12 ++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c  |  2 ++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/Documentation/arch/arm64/silicon-errata.rst b/Documentation/arch/arm64/silicon-errata.rst
index 65bfab1b1861..92207d55fd1c 100644
--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -198,7 +198,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3     | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
-| ARM            | MMU-500         | #841119,826419  | N/A                         |
+| ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
+|                |                 | #562869,1047329 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-600         | #1076982,1209401| N/A                         |
 +----------------+-----------------+-----------------+-----------------------------+
diff --git a/drivers/iommu/Kconfig b/drivers/iommu/Kconfig
index ade4e8cf2a3e..90ba5818af81 100644
--- a/drivers/iommu/Kconfig
+++ b/drivers/iommu/Kconfig
@@ -367,6 +367,18 @@ config ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT
 	  'arm-smmu.disable_bypass' will continue to override this
 	  config.

+config ARM_SMMU_MMU_500_CPRE_ERRATA
+	bool "Enable errata workaround for CPRE in SMMU reset path"
+	depends on ARM_SMMU
+	default y
+	help
+	  Say Y here (by default) to apply workaround to disable
+	  MMU-500's next-page prefetcher for sake of 4 known errata.
+
+	  Say N here only when it is sure that any errata related to
+	  prefetch enablement are not applicable on the platform.
+	  Refer silicon-errata.rst for info on errata IDs.
+
 config ARM_SMMU_QCOM
 	def_tristate y
 	depends on ARM_SMMU && ARCH_QCOM
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
index 99030e6b16e7..632f1667ceb3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-impl.c
@@ -128,6 +128,7 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu)
 	reg |= ARM_MMU500_ACR_SMTNMB_TLBEN | ARM_MMU500_ACR_S2CRB_TLBEN;
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sACR, reg);

+#ifdef CONFIG_ARM_SMMU_MMU_500_CPRE_ERRATA
 	/*
 	 * Disable MMU-500's not-particularly-beneficial next-page
 	 * prefetcher for the sake of at least 5 known errata.
@@ -140,6 +141,7 @@ int arm_mmu500_reset(struct arm_smmu_device *smmu)
 		if (reg & ARM_MMU500_ACTLR_CPRE)
 			dev_warn_once(smmu->dev, "Failed to disable prefetcher for errata workarounds, check SACR.CACHE_LOCK\n");
 	}
+#endif

 	return 0;
 }
--
2.34.1


