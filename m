Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0660C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=; b=UQwdyOVmVd5V5sViA2hD037ImJ
	NGsVI4yTcc/eBXwmAxPTzhICPhW2gXZu1U8HWr4ZZatVT8LiOkx5XgwVIvusGZmHgUC7ftP4/XYRt
	rVXhinizrRwqjKAWO6XeaYcbMrL37qFLlBkojwI21LmZ5fUIErs03GfAotysRohW1Lncasf1MPuMV
	Qp1hiG38yCb+hH1Nhsc7ZqqsFajRzFg7pI1WHeEdVi+r9JTu/otV0X8P7Pjmq6QUpFFsmezGpJjMG
	h1z/51RNcZGZm8S3JBEGHKBIh/8MBrndm+17GFS3dFv5CRzhT+ahSeUz+TnEXF+mBZODB7as1umHi
	OTbisljg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wF-0000000AeDC-00Eq;
	Sun, 09 Aug 2026 20:16:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wB-0000000Ae9s-3jqN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:05 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9PJZ3419972
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=; b=f6ifMYWnVZIcKQF8
	TCEfTy166WQUM5RlhwY7s/HwgiDZb2UQjHtwn4kYzBKiDtK4kBjd4dpqEl4trbQk
	oBeJb6y+jkUFGu6PnNIbIGEFLxfN0FUV2mFaLk++Uedvxz7mHtH90fm6xYuOHbMD
	4FflWeAZWFkDQDj33GtU94N55zr+azKXaz1Ztr42jfvpph2nwTINTvNVIKN9sMni
	8us5SwYrw6DV6IZ5X+tlS6QvLnraNlPhAj7X3Nm+3R4+xk47V7DtKqoVndDZI1vk
	gPay5Sr1+BUCCDwMc7UhYJQtciKOyjDQWIxwT+p2ZRlq+TL+gZ9gyKD5jzW44X2+
	uJYhDA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvbfan-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:02 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52ce3c7cb2eso22461621cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306562; x=1786911362; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=;
        b=IQBsY3JHE/MperD17ugtkt3sLVIEZ62VhhSWO3kg6OYOpzLsT7kMqD8J1mfe099RdP
         2ZaE3ISKhKb42RcW1yEJ+lzbpYCMH2e8hZjFnWYByNMuoZZz5Q+939OTcVIkvcTD0YjQ
         9MDtvzL6qRwcSc6eDQcoMvaxhwYeUB9Rvyy53rp73ZETxYeeD6IS8WrWBMx/xpGebB4Q
         MLOTGOeg6uCgTGu3/4JQrid0/UpQI3VQWfhJ0UwQ5o7TLJXOya+lPNXEgAVtNs+k9eVE
         UPamXPJkJ9gEInz1cZmnwPJI2nx6p2jSYwWSAaX0GMV2hAZztBRgBRxxUZLejJ62j/aG
         YGSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306562; x=1786911362;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Rry4GguH7Meqgz11UcFuJ1AWrZzOU1PZecUYu+VWlPA=;
        b=oAY70NOZbHetzhQC+cGwlapprbP0mwBTzOm+wvBMdDB9sfBNBe5u4BecVPTaQ0vHpj
         fgk7an/PKsfzxrv8QTTc/GfLeQ5c3gZVW/tn/ZW/MOvmrUfC9f3FMQq+nRJOgVDg9KLI
         PlXR5L6Qb3b2keyl1Nlv7MnvGq1x8J5PnP9rQKnEm8tgw+I05f3UgyRIEP7WfMgmUeq8
         RVKN0pWVKwIgwMb1l/tjIZ3zomAd7W6NFU5c4D+SP9nmu8amfMO9MB4Tdqt/M0Xam+db
         48/oN/XExhXjRIlfotw+axvXnCy2MxUmAUUrt8bioeVGw9cMHXOfKqch5QSg9l6aLU0F
         Z2IA==
X-Forwarded-Encrypted: i=1; AHgh+RqUDLWFKJTV1zkAYMNqOPH3AmOfNKRPJNMT5m3RfvGbTkUy64pV03pydt2cB5oUPIebToJUsYajBuUVQ6YYaoRr@lists.infradead.org
X-Gm-Message-State: AOJu0Yw4jkqB3gjSDvPspu5HyScBIlklwPrTwvUN8JGPEuycUQ2TZJyc
	sl+L6Epkz+8HuMt+pSigVJ5YdSzeJVGOMNTjJhcgjltFaFDJl/xvFX+IMI2t5IswGzFvo95ppok
	qkfyp7ACIlT7coXJdY72Igj2NW9JesP04rfE7ZGAeh3C5GepP8UK3f1Lm0nYGJsD2R6yZcj6dxi
	6Zsc/sAZBMYA==
X-Gm-Gg: AR+sD11/wPcvreLVfHGQZRbDzj92uHMg17N+Na+hKjS6PmHOTi+5/Syhnm2W7/qk+le
	BUj5qJg8kFitwCwzvvmKKCJSrNDV/Wfp1pYsE1A8C+n5vGDcGbpvuUnLIV3IureFH+fAHpIVzPf
	o7Sv1CiQ9ZLzKd2HN0z9X5vliX8i4RZY/6HB4nvIeV5IMB3aXoi+uNPHOTMcSdfFa+EOxHuh0Oz
	ZsoaAhfyQTQ3sI/cw8ENhnSgtt7TTgrDxHDV3lm1w/xEoUuF87yODYrrgKXjXYalOjqYzHik85N
	GPgggwxFDtL9AHFl5QmEiTKqPiriiUqYMDDlF8/RwHsTJrS1GHcLNSTT9X2gkTrd8BsPWKfCu0T
	7IePm9Bv30Gfnlm3U3JvcSTaQ8VtRh/sYjvtRAtaN5Z+EJ2yiUtfViyI/HpemhWVtESTuCMGvI1
	VrjgSxvTQCfeD1Qg==
X-Received: by 2002:a05:622a:295:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-52d0b04c1d4mr255757941cf.11.1786306562259;
        Sun, 09 Aug 2026 13:16:02 -0700 (PDT)
X-Received: by 2002:a05:622a:295:b0:51a:8b64:69e0 with SMTP id d75a77b69052e-52d0b04c1d4mr255757591cf.11.1786306561854;
        Sun, 09 Aug 2026 13:16:01 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:45 +0300
Subject: [PATCH 06/12] iommu: qcom_iommu: support non-TZ-managed instances
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-6-87f5cd492560@oss.qualcomm.com>
References: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
In-Reply-To: <20260809-msm8974-iommu-upstream-v1-0-87f5cd492560@oss.qualcomm.com>
To: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Luca Weiss <luca.weiss@fairphone.com>
Cc: linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8021;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=GXiPIZglCzQ57hkuCOyXRgoYx4cKxjmC6a7IKdJwtLo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uChgqZG3WWQT+NkfhYIemGVi4SeH4M9Loa
 b8wCfB3QRaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1SyUB/kBncagbuWWJlhIctG68KKAARV2R4j44ig3zbUgnJR6HMbSoX8P+5TMSGfD8t6XEfy0T+m
 zibX2U1bMqIdkRQzFrWkNnP1llgcnJc5oVlOASoDx4IlX0+gKGv9XSV1SYA7jByQ5w5qLfq135P
 9oyqfKrb6Tqt4+xaf9IbfK/JfOEaK94ICzEXk6oVkXuzGpJgcAG6Dpjm6pQsNq09KrWatRYMcL5
 pNJdula8C+b4jevA0ysfoRW4zBLLjgPFs2ENqkSTrGozUe9fk+/8TsP+X4qU6HYaeneGA1xBO4x
 Uq/xKbOECYLsTR4bYWNDuVH+SBlkeoAwGua1HW0i+yq7DHGv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a78e002 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=9TCwowKhpjj2XBowZ20A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: liITO1wEb02hydnylMsi1eHrmI9OHPzX
X-Proofpoint-GUID: liITO1wEb02hydnylMsi1eHrmI9OHPzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfXyyGaypqzI6Io
 ysZG9VRSLvx8bTM9UQAMaQtifT2mrrcjyZVasNjaGThFHVXA/swmoyIS0J6fSUiwSGI29iqtgS3
 QJCEdVLhfDYU3ENsNO7R7sqMaPM9bGlqL1ovYPZenErq38C+d3FntHSc2eMgJlQrDpe+VbJu7BT
 L68MQHJW7Ilz05N2lQDMzPnhLmdN6QGnCmD/o5012fIY2/GMy7rNKtFELUd2Gg98p/3AW/siLvB
 TGRfQc8B6ZIAl71rYXrbOvy470ZMwTff0Ur/wel+lzCY36DIptkzVgHqSyMznwdzOa6hB5Aspra
 3pPldAhCwnBq8sZBC2uhWweLawOXNGpJiKMoe44ceZCGpNLjZ6nMzww3RwUD+qmNQB3j8hk0ga8
 OK+EnjO02JWLY/XVvhM6dRK9rRMJeSxHDu6XuBc4x9SdoeXtCePzaWJBmIpL7bsCldT5ZQg0Qdo
 OtBWuX9fHVAjcCDihlA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX4vzqC2mJkKLr
 WwzOkfHO+fRaTKogAEGGWHh7zUabiG9TIsQNdPGat7phZg2fMG8SdVpmc+uqllul0K1eEzwLOed
 8+IL2UcVwVxdGEcNIoim2QB0416wluU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131604_053944_47EBF682 
X-CRM114-Status: GOOD (  25.45  )
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

The GPU on MSM8974 has never been usable upstream because its IOMMU
cannot be driven: unlike the MSM8916-style instances this driver
supports, where the secure world owns the SMMU global register space
and the OS programs just the context banks after a restore_sec_cfg SCM
call, the MSM8974 GPU IOMMU is not managed by TZ at all. Nobody sets
up its stream mapping, so attaching a domain leaves every transaction
unmatched and the GPU faults on its first memory access. Verified on
the APQ8074 dragonboard: restore_sec_cfg is only accepted for the
secured instances, while the GPU instance exposes its ID registers to
the OS (IDR0 0x78034404 / IDR1 0x10000003).

Add a non-secure programming mode, derived from the downstream
msm_iommu-v1.c driver. When qcom,iommu-secure-id is absent, reset and
program the global space at runtime resume instead of calling into TZ:
clear sACR/sCR2 and the global fault state, invalidate the TLB and all
SMRs, install the per-instance stream mapping (SMR/S2CR/CBAR, with the
downstream MEMATTR/NSCFG/VMID/IRPTNDX values) and enable the SMMU with
fault reporting enabled and stalling disabled (sCR0.STALLD, matching
the downstream terminate model). The stream ID map is per-instance
configuration data since it is not discoverable from the hardware; the
SMR index allocation keeps ASID == context bank index, which this
hardware requires (downstream msm-3.10 commit 4d92ea10aac3 ("iommu:
msm: Use CB index as ASID")). Also set CB_ACTLR to redirect cacheable
requests to the L2 slave port, as the downstream driver does for every
context on this IP generation - on MSM8916 TZ owns CB_ACTLR, so the
driver never needed to touch it before.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 107 ++++++++++++++++++++++++++++++--
 1 file changed, 101 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 428b18697244..3b07c4cf23fe 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -37,6 +37,9 @@
 /* GR1 sits one 4K page above GR0 on the msm8974 QSMMU */
 #define QCOM_IOMMU_GR1			0x1000
 
+/* Redirect all cacheable requests to the L2 slave port */
+#define QCOM_IOMMU_ACTLR_BPRC		(BIT(28) | BIT(29) | BIT(30))
+
 enum qcom_iommu_clk {
 	CLK_IFACE,
 	CLK_BUS,
@@ -46,11 +49,23 @@ enum qcom_iommu_clk {
 
 struct qcom_iommu_ctx;
 
-/* Per-instance configuration, absent on msm8916-style instances */
+struct qcom_iommu_sid {
+	u8			 cbndx;
+	u8			 sid;
+};
+
+/*
+ * Per-instance configuration for instances whose global register space
+ * is at least partially OS-managed (reg points at the global space and
+ * SMMU_INTR_SEL_NS must not be written). The stream ID map is only used
+ * on non-secured instances.
+ */
 struct qcom_iommu_cfg {
 	enum io_pgtable_fmt		 fmt;
 	/* the walker faults on the AF bit despite it being set */
 	bool				 no_afe;
+	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
+	unsigned int			 num_sids;
 };
 
 struct qcom_iommu_dev {
@@ -62,6 +77,7 @@ struct qcom_iommu_dev {
 	void __iomem		*local_base;
 	void __iomem		*global_base;
 	u32			 sec_id;
+	bool			 non_secure;
 	u8			 max_asid;
 	struct qcom_iommu_ctx	*ctxs[];   /* indexed by asid */
 };
@@ -256,6 +272,71 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+/*
+ * Reset and configure the global register space of an instance the
+ * secure world does not manage: global fault state, TLB, stream
+ * mapping (SMR/S2CR/CBAR) and the global configuration register.
+ */
+static int qcom_iommu_reset_ns(struct qcom_iommu_dev *qcom_iommu)
+{
+	const struct qcom_iommu_cfg *cfg = qcom_iommu->cfg;
+	unsigned int i, num_smr;
+	u32 reg;
+	int ret;
+
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sACR, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sCR2, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sGFAR, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sGFAR + 4, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sGFSRRESTORE, 0);
+
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_TLBIALLNSNH, 0);
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sTLBGSYNC, 0);
+	ret = read_poll_timeout(qcom_iommu_gr0_read, reg,
+				!(reg & ARM_SMMU_sTLBGSTATUS_GSACTIVE),
+				0, 5000000, false,
+				qcom_iommu, ARM_SMMU_GR0_sTLBGSTATUS);
+	if (ret) {
+		dev_err(qcom_iommu->dev,
+			"timeout waiting for global TLB SYNC\n");
+		return ret;
+	}
+
+	num_smr = FIELD_GET(ARM_SMMU_ID0_NUMSMRG,
+			    qcom_iommu_gr0_read(qcom_iommu, ARM_SMMU_GR0_ID0));
+	for (i = 0; i < num_smr; i++)
+		qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_SMR(i), 0);
+
+	for (i = 0; i < cfg->num_sids; i++) {
+		const struct qcom_iommu_sid *sid = &cfg->sids[i];
+
+		qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_SMR(i),
+				      ARM_SMMU_SMR_VALID |
+				      FIELD_PREP(ARM_SMMU_SMR_ID, sid->sid));
+		qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_S2CR(i),
+				      FIELD_PREP(ARM_SMMU_S2CR_TYPE, S2CR_TYPE_TRANS) |
+				      FIELD_PREP(ARM_SMMU_S2CR_CBNDX, sid->cbndx) |
+				      FIELD_PREP(ARM_SMMU_S2CR_MEMATTR, 0xa) |
+				      FIELD_PREP(ARM_SMMU_S2CR_NSCFG, 3));
+		qcom_iommu_gr1_write(qcom_iommu,
+				      ARM_SMMU_GR1_CBAR(sid->cbndx),
+				      FIELD_PREP(ARM_SMMU_CBAR_TYPE,
+						 CBAR_TYPE_S1_TRANS_S2_BYPASS) |
+				      FIELD_PREP(ARM_SMMU_CBAR_IRPTNDX, 1) |
+				      FIELD_PREP(ARM_SMMU_CBAR_VMID, 3) |
+				      FIELD_PREP(ARM_SMMU_CBAR_S1_BPSHCFG, 2) |
+				      FIELD_PREP(ARM_SMMU_CBAR_S1_MEMATTR, 0xa));
+	}
+
+	qcom_iommu_gr0_write(qcom_iommu, ARM_SMMU_GR0_sCR0,
+			      ARM_SMMU_sCR0_SMCFCFG | ARM_SMMU_sCR0_USFCFG |
+			      ARM_SMMU_sCR0_STALLD | ARM_SMMU_sCR0_GCFGFIE |
+			      ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GFIE |
+			      ARM_SMMU_sCR0_GFRE);
+
+	return 0;
+}
+
 static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 				   struct qcom_iommu_ctx *ctx)
 {
@@ -266,6 +347,9 @@ static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 	iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
 	iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
 
+	if (qcom_iommu->cfg)
+		iommu_writel(ctx, ARM_SMMU_CB_ACTLR, QCOM_IOMMU_ACTLR_BPRC);
+
 	/* TTBRs */
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, ctx->ttbr0);
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
@@ -327,7 +411,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	for (i = 0; i < fwspec->num_ids; i++) {
 		struct qcom_iommu_ctx *ctx = to_ctx(qcom_domain, fwspec->ids[i]);
 
-		if (!ctx->secure_init) {
+		if (!qcom_iommu->non_secure && !ctx->secure_init) {
 			ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, ctx->asid);
 			if (ret) {
 				dev_err(qcom_iommu->dev, "secure init failed: %d\n", ret);
@@ -907,8 +991,12 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 	if (of_property_read_u32(dev->of_node, "qcom,iommu-secure-id",
 				 &qcom_iommu->sec_id)) {
-		dev_err(dev, "missing qcom,iommu-secure-id property\n");
-		return -ENODEV;
+		if (!qcom_iommu->cfg) {
+			dev_err(dev, "missing qcom,iommu-secure-id property\n");
+			return -ENODEV;
+		}
+		/* The secure world does not manage this instance at all */
+		qcom_iommu->non_secure = true;
 	}
 
 	if (qcom_iommu_has_secure_context(qcom_iommu)) {
@@ -981,8 +1069,15 @@ static int __maybe_unused qcom_iommu_resume(struct device *dev)
 	if (ret < 0)
 		return ret;
 
-	if (dev->pm_domain)
-		return qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, 0);
+	if (qcom_iommu->non_secure) {
+		ret = qcom_iommu_reset_ns(qcom_iommu);
+		if (ret)
+			return ret;
+	} else if (dev->pm_domain) {
+		ret = qcom_scm_restore_sec_cfg(qcom_iommu->sec_id, 0);
+		if (ret)
+			return ret;
+	}
 
 	return ret;
 }

-- 
2.47.3


