Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EE88E77180
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 15:20:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MhyYi3omGRnJ4xrIWU3FFWLqU8O9eOLgbzBS2yGefp8=; b=rcbeW2Kegy3dG9GAygcfi3iSi5
	th0uhQKyaVNU0cEAexg2pnNuOcG0UJYr5SP975pdsNcR92E5nurHMgyHw0IVkDHyY2bAH80tvZpy2
	MDIbtkljhKO9fitWLlFgf/cM6RsvmiFn4Yezj6loBsxqD/JMmuLJtZkHIwib/U47WLHRXEmvXQ6M3
	dqztfPHo7D6Ks5VxNUxMVRHtW4GoezNNignpBZ5IuCESBpNCW5g068dCAGAQKhoQ2PJkp5gLpRoZT
	FSGbq1nZ49PcUXZLyXfvr84vpN8aACXWmSOJKIyIOMY+TwoCVqLcw0aZY97Vu6Ly5aybSQFhd5Mot
	nBCoHcUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLkyt-00000000jvI-05SI;
	Thu, 12 Dec 2024 15:19:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLktx-00000000ioe-3CYq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 15:14:55 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BC7ZGnS027291;
	Thu, 12 Dec 2024 15:14:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MhyYi3omGRnJ4xrIWU3FFWLqU8O9eOLgbzBS2yGefp8=; b=NPGeUyy8va9IMehu
	OQkBnf40Y+SB4Bt5c3Gyd8U9jJaUD5kaqQqgkthmcIurDasiULdB/AQPf1/f/7Gz
	10IYz+OWn/eZDrD+sDIXh7x8FWib3M0XudmLTWVjDFt8MiTE2QNp0O+XwKYuzLQe
	sBF4jfX717SlLs2m8fmuF9+gPimzzv5SPNCWgRyqIzI9C+N/aw3SoWy4AB10A48d
	qp7S3nSn6NY44LVfrDtQlDssCAgN7dxaN0fNuhS4t8yhsBIFrWNQwKB9g1xbd84a
	/5isy83XCcxVf11N8wkB8OKj9M4tFGCEvsKkvxsCL5tA50Y/SC10uHVCE81TbLnx
	jXnDhg==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43etn8xmyf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:14:43 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BCFEgWs015827
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 12 Dec 2024 15:14:42 GMT
Received: from hu-bibekkum-hyd.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 12 Dec 2024 07:14:38 -0800
From: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
To: <robdclark@gmail.com>, <will@kernel.org>, <robin.murphy@arm.com>,
        <joro@8bytes.org>, <jgg@ziepe.ca>, <jsnitsel@redhat.com>,
        <robh@kernel.org>, <krzysztof.kozlowski@linaro.org>,
        <quic_c_gdjako@quicinc.com>, <dmitry.baryshkov@linaro.org>
CC: <iommu@lists.linux.dev>, <linux-arm-msm@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <quic_bibekkum@quicinc.com>
Subject: [PATCH v18 3/5] iommu/arm-smmu: add support for PRR bit setup
Date: Thu, 12 Dec 2024 20:44:00 +0530
Message-ID: <20241212151402.159102-4-quic_bibekkum@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
References: <20241212151402.159102-1-quic_bibekkum@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y47mA5046DxVcCu3Jr1sNyNbvoJh9c6c
X-Proofpoint-GUID: y47mA5046DxVcCu3Jr1sNyNbvoJh9c6c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 impostorscore=0 adultscore=0 suspectscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412120110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_071453_807699_20F6BAE8 
X-CRM114-Status: GOOD (  18.72  )
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

Add an adreno-smmu-priv interface for drm/msm to call
into arm-smmu-qcom and initiate the PRR bit setup or reset
sequence as per request.

This will be used by GPU to setup the PRR bit and related
configuration registers through adreno-smmu private
interface instead of directly poking the smmu hardware.

Suggested-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Bibek Kumar Patro <quic_bibekkum@quicinc.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 52 ++++++++++++++++++++++
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |  2 +
 include/linux/adreno-smmu-priv.h           | 14 ++++++
 3 files changed, 68 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index d26f5aea248e..818fdbd706da 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -16,6 +16,8 @@

 #define QCOM_DUMMY_VAL	-1

+#define GFX_ACTLR_PRR          (1 << 5)
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -99,6 +101,47 @@ static void qcom_adreno_smmu_resume_translation(const void *cookie, bool termina
 	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_RESUME, reg);
 }

+static void qcom_adreno_smmu_set_prr_bit(const void *cookie, bool set)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
+	u32 reg = 0;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return;
+	}
+
+	reg =  arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR);
+	reg &= ~GFX_ACTLR_PRR;
+	if (set)
+		reg |= FIELD_PREP(GFX_ACTLR_PRR, 1);
+	arm_smmu_cb_write(smmu, cfg->cbndx, ARM_SMMU_CB_ACTLR, reg);
+	pm_runtime_put_autosuspend(smmu->dev);
+}
+
+static void qcom_adreno_smmu_set_prr_addr(const void *cookie, phys_addr_t page_addr)
+{
+	struct arm_smmu_domain *smmu_domain = (void *)cookie;
+	struct arm_smmu_device *smmu = smmu_domain->smmu;
+	int ret;
+
+	ret = pm_runtime_resume_and_get(smmu->dev);
+	if (ret < 0) {
+		dev_err(smmu->dev, "failed to get runtime PM: %d\n", ret);
+		return;
+	}
+
+	writel_relaxed(lower_32_bits(page_addr),
+				smmu->base + ARM_SMMU_GFX_PRR_CFG_LADDR);
+	writel_relaxed(upper_32_bits(page_addr),
+				smmu->base + ARM_SMMU_GFX_PRR_CFG_UADDR);
+	pm_runtime_put_autosuspend(smmu->dev);
+}
+
 #define QCOM_ADRENO_SMMU_GPU_SID 0

 static bool qcom_adreno_smmu_is_gpu_device(struct device *dev)
@@ -210,6 +253,7 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	const struct device_node *np = smmu_domain->smmu->dev->of_node;
 	struct adreno_smmu_priv *priv;

 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
@@ -239,6 +283,14 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	priv->set_prr_bit = NULL;
+	priv->set_prr_addr = NULL;
+
+	if (of_device_is_compatible(np, "qcom,smmu-500") &&
+			of_device_is_compatible(np, "qcom,adreno-smmu")) {
+		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
+		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
+	}

 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index e2aeb511ae90..2dbf3243b5ad 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -154,6 +154,8 @@ enum arm_smmu_cbar_type {
 #define ARM_SMMU_SCTLR_M		BIT(0)

 #define ARM_SMMU_CB_ACTLR		0x4
+#define ARM_SMMU_GFX_PRR_CFG_LADDR	0x6008
+#define ARM_SMMU_GFX_PRR_CFG_UADDR	0x600C

 #define ARM_SMMU_CB_RESUME		0x8
 #define ARM_SMMU_RESUME_TERMINATE	BIT(0)
diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index c637e0997f6d..614665153b3e 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -50,6 +50,18 @@ struct adreno_smmu_fault_info {
  *                 the GPU driver must call resume_translation()
  * @resume_translation: Resume translation after a fault
  *
+ * *CAUTION* : PRR callbacks (set_prr_bit/set_prr_addr) are NULL terminated for
+ *             targets without PRR support. Exercise caution and verify target
+ *             capabilities before invoking these callbacks to prevent potential
+ *             runtime errors or unexpected behavior.
+ *
+ * @set_prr_bit:   Extendible interface to be used by GPU to modify the
+ *		   ACTLR register bits, currently used to configure
+ *		   Partially-Resident-Region (PRR) bit for feature's
+ *		   setup and reset sequence as requested.
+ * @set_prr_addr:  Configure the PRR_CFG_*ADDR register with the
+ *		   physical address of PRR page passed from
+ *		   GPU driver.
  *
  * The GPU driver (drm/msm) and adreno-smmu work together for controlling
  * the GPU's SMMU instance.  This is by necessity, as the GPU is directly
@@ -67,6 +79,8 @@ struct adreno_smmu_priv {
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
     void (*resume_translation)(const void *cookie, bool terminate);
+    void (*set_prr_bit)(const void *cookie, bool set);
+    void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
 };

 #endif /* __ADRENO_SMMU_PRIV_H */
--
2.34.1


