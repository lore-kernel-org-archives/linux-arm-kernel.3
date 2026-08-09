Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67B11C5AD5A
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8yX2uvlIC/AyCu7NKmE2TS3xQ1wV6P6EK8NgrBlFOpE=; b=mCysXGxc0uAE/PDZr07+Ym7UlA
	Nf7KozP8eFPvaWHFjUimiaHDYRyZYNgiXwsop9WdLv3Zn36xV0pWuzmKziEvIqKe7JWvyHy1w5sFL
	RJDL+X5H9Ne5SiX2sZsMYHTmS8gx8M9ye9blyC9DW0sW5yaZLxhq4vu0L6AJzYW6i8w1Mo5XRQVWR
	C066ODQkjopGUU+YPz3FP8uvciRjXIkqqq7sI1qONI1bW9M8/Opxgyi/PbtNIw3lKuuLyIIbmM/DE
	h80KCh/Y8fb1+u5Vj4Wiwb6T2i3s1wLLY2C9aMyPoDVcSJ5HJNLukT+gpWpFQU6bxB6UMoX4nzM0h
	jCJGXuQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9w7-0000000Ae6B-08lm;
	Sun, 09 Aug 2026 20:15:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9w3-0000000Ae4B-0N2x
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:15:56 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9YLW390444
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:15:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8yX2uvlIC/AyCu7NKmE2TS3xQ1wV6P6EK8NgrBlFOpE=; b=PaUMagiHy/M083UU
	OPCrXT8i+jMRrju1tVMeF3pJ6smSm4MHRNEpiCxUoYbk2SjYnCUGfCb4wny53Hu/
	HrCTZbKwoUYLOFdCGZWtWwrJGCzNuqG/qX3BA9sz6zSomCKV7/nJ8c6xSYWGdyuW
	Ama4SLlQN13tpbWk31/TSbxWoaMdcLcLINRPJgvA/w5eN9qnXkGwDaj8NDpAfy1F
	8YOHAVtr3YNiEmo8vg9w64ZTkNL2q+yOgXXxm0v5T9CEw3f0Kjs1pBj49/LZeF4I
	5G2OWgMA/wreXDayPlrIL+arwnma/AU3bbR7NLq4nPMpeaMBFF/rpwD/Rm1r3d3a
	dQ8Emg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwt5gkpng-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:15:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so9346461cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306554; x=1786911354; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8yX2uvlIC/AyCu7NKmE2TS3xQ1wV6P6EK8NgrBlFOpE=;
        b=TqTpB0OPIjvKHUyUF+xAisnjgsdy0qb0bToepKn2WtoXy17uDbuQaBXtmMs97/H/Q3
         WI8SfV7EmunmijSYqvO/lktS+1e7wIxUYwRWQo+d/EakjgHihfZ8dCT5IaYpXRSC/sC5
         /BF72bmIPn3ZndWBHf4OVHgyH1LekliNJDJSGTc7X1B87Y6YdoiSYMeUyufFtR7UK8wr
         t1AjQ+RYwDVaXHiP5lieLiXEtcdINXXQsJm7ANaVqPaIt90R/V3VGvdZihRIWti4Yhmi
         05rdwbufBFQrE8JI1ZrJIcnx+sovyozYCDtq6M5Oekv6tmQGWXdj4fFRPgIpvDd7WeJ4
         /96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306554; x=1786911354;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8yX2uvlIC/AyCu7NKmE2TS3xQ1wV6P6EK8NgrBlFOpE=;
        b=cBKXhyZwEecYaTrCAGByzYGPz4oo9XXZmE7GoJmG+SvNSFNe9iyLkTu7SGYNApF4zm
         4BO3V7Al9Zx6NP2vmhGymjop6lq6MsxXUFYHR8ShkrFU05aZL1yeFn+c3jmJ3d2sqHMl
         B7YmJibQjKHvUJ7zmoHUsi9prK39X84ZqxHi4/f037g1KrYYtqbw6UChLbBshlsnnbZg
         KEgGvqMQE6rjY49/dlDax1+ZsE3FbmeU4SKwDBlwwHbHbsrdI08xiQqkGBPhg7uqQ81/
         0BaKv+6xw0nrsiJcOoNR2+vFWN14HFSksZFW+zs2QQ7YArC4nZ2EJwWs6ntcuC4Sgspu
         TyvQ==
X-Forwarded-Encrypted: i=1; AHgh+RoKAn6TT4EykFWEFYvhFafbscl7t7wu/1eAB/+I3B3yJuPjVyvEgpFw0Euxt30iCYhfe7y7oGmsPqH+2IKp/uTi@lists.infradead.org
X-Gm-Message-State: AOJu0YzGdMB+gI4J9ldAtl66ypkdNS9vQs4kBwJ5xJ+SqjHlSM9+mGSt
	GBfgSmNgYTh/4Dkhm01yBn5cJFmVQPHgPbquvrNaMatLk9iQ7qzb4CJX60i7FKfNujakDc/9kv0
	0nNoJ2Rym0F4dfT848u+7eAnJzfDFUrqBw64plxK13Zk8PQB/NvQUvxAIDsB0VlHfgliFxGULsv
	PUtamb91y9Wg==
X-Gm-Gg: AR+sD11AV+jNEoS4STi+fqqgXahASV3yc775ARaKyhPL3WwryjnAykRAuZs1+ALNSfI
	r8FOIQ62YhkT6sVLf5VVrMpX7tiTFLXvVmRDh8ckbcx/x5uGuiTOPCQsibIjpJ6AMNN3edSXFpn
	3P3NsmXz5YZF5id386R0TS45JdHP/00q0AJ2rEyfd9gzyzthA/6ucDU8itsYZUUr+kQ3MDLUnIn
	wLmdsoYVHhKvtGV3k7cHEk3TxMgJwboXJG7+H7WCGufZwhhbyYljHZAskhl7s0a8QFWXU9Gx6nq
	fcCtu5BKk6jU5qMvcERTbfufbI7zKa4XFlekUvrGaxN8WJV4zBwaaVQyxtMDyzAy851zIQXHUlH
	//UFHEYbgVpIN/cZfpHlwKlFtDPH3QCF+bqsTUr7jPmLb7g5BgilSghADTsZcIv9dG7xuJvt1JJ
	tQyYdF7n0v/Am0fQ==
X-Received: by 2002:a05:622a:1820:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52ce5f606b3mr397018741cf.5.1786306553702;
        Sun, 09 Aug 2026 13:15:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1820:b0:51c:ae7:fa1d with SMTP id d75a77b69052e-52ce5f606b3mr397018341cf.5.1786306553324;
        Sun, 09 Aug 2026 13:15:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:42 +0300
Subject: [PATCH 03/12] iommu: qcom_iommu: extract context bank programming
 into a helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-3-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4252;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=csEY5kAK1o0MObErtcP/fI47l7/+8j45w1x7Lk7YzUQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uriw60rs+lsE378Y69ErulMz7J4LxQ7Xse
 VKKqpoQgimJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1V4nB/4xLHYwqddsAkj0i7R1FY8Pzik/aBfxcQ7lN5soSofsB1wkagZDML9XPhBgzl4rWtXPqtX
 5tShzbnY0XMI6WJVPz8ZF0+9kaFtmqaRQSZci2m4+Kd+K4mhDWhfks6Bs9oQBEoCkxRPdYYzyTh
 /1aiPPFUYyRkR2qYqmyqENTIAGo9EPjxEPHkDEV/HOEdtGiu8wGwNmsduECngv1h+aaFJkyUEpu
 n8Ml/pyU5SN1GRTxM4VGUhq8umq50AmnPxW0tNWnkBZuMti3nTnvM5/9kiLK5haiP1AsQpH9IH2
 fI5mzihG3hVaNNrA7pZ3+g33/+CRc9ki8oatn/Mpkviu9ZR8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=c6Cbhx9l c=1 sm=1 tr=0 ts=6a78dffa cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=GTiPovFEgKA3HYAQ8hUA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX4WjMp5OENUrN
 8qv7kQ448Up55an/tI7DhO/J7HpXmKhfdFj7yGtonfs0zZQeIA6tIiGqG3tUisOwFiN/Xi2ZIzq
 AKzLiCbem0sFyqxwOSuzrU1/YJpFXUM=
X-Proofpoint-ORIG-GUID: LMQqgDpFyWRVpWARM8EMF06Pzo66P0jO
X-Proofpoint-GUID: LMQqgDpFyWRVpWARM8EMF06Pzo66P0jO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX+pPyG3/GMZol
 kS4EVyTgBID2Gl9Eab9scWfTHRbbujOf2AcgfX2+mot6bEKgcOTcV9CDIWy7XIAN9+tkd4m43d7
 WumqF3khmPXulmb4ef0WR9sA1qKajhMmnK68sP5jZajg5kilp74WSZA9Ws4vkWEzume81J3vGzg
 w4fOuLtAmlY9n+j0BQpUa4MDQttehljqITBgRLHRIZz6NpQMnfp9AGTfEXonvizDYr+b8fYcUyE
 2kmrXMeA938yS/UsHMeWTZjNHDvavApO9o43QcWolhANFS/edURQYKr1RjcKcqrGZBV1xbDd1y2
 PaO71fa/5nhaxySPNas6kWrIZSlSgMaXjQhqZtzhXaU7aHp0U6fKQr1G3C7Ul8a4p8yTB15ecq7
 F34swpg2FwfK+GHc/wxCgyjG6Wvj5dn9mQA/U37k34FsKsN5UlUxr+6ivDpcT6zQgcCAydEs1Mo
 6h3XkoMEi2oAWsb2/9w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 phishscore=0 impostorscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 spamscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131555_139187_E511B159 
X-CRM114-Status: GOOD (  18.59  )
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

qcom_iommu_init_domain() programs the context bank registers inline,
with values computed on the spot, so no record of the programmed state
is kept. The MSM8974 QSMMU instances about to be supported sit in MMSS
GDSCs and lose the context bank state whenever the power domain
collapses, which requires the driver to reprogram the banks at runtime
resume.

Stash the computed register values in struct qcom_iommu_ctx and move
the programming sequence into a new qcom_iommu_program_ctx() helper
that can later be replayed from the resume path. No functional change.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 66 ++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 26 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 21d18ce67b98..5bbb51d9bd65 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -61,6 +61,11 @@ struct qcom_iommu_ctx {
 	bool			 secured_ctx;
 	u8			 asid;      /* asid and ctx bank # are 1:1 */
 	struct iommu_domain	*domain;
+	/* programmed context bank state */
+	u64			 ttbr0;
+	u32			 tcr[2];
+	u32			 mair[2];
+	u32			 sctlr;
 };
 
 struct qcom_iommu_domain {
@@ -213,6 +218,32 @@ static irqreturn_t qcom_iommu_fault(int irq, void *dev)
 	return IRQ_HANDLED;
 }
 
+static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
+				   struct qcom_iommu_ctx *ctx)
+{
+	/* Disable context bank before programming */
+	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+
+	/* Clear context bank fault address fault status registers */
+	iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
+	iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
+
+	/* TTBRs */
+	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, ctx->ttbr0);
+	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
+
+	/* TCR */
+	iommu_writel(ctx, ARM_SMMU_CB_TCR2, ctx->tcr[1]);
+	iommu_writel(ctx, ARM_SMMU_CB_TCR, ctx->tcr[0]);
+
+	/* MAIRs (stage-1 only) */
+	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0, ctx->mair[0]);
+	iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1, ctx->mair[1]);
+
+	/* SCTLR */
+	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, ctx->sctlr);
+}
+
 static int qcom_iommu_init_domain(struct iommu_domain *domain,
 				  struct qcom_iommu_dev *qcom_iommu,
 				  struct device *dev)
@@ -267,32 +298,13 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			continue;
 		}
 
-		/* Disable context bank before programming */
-		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
+		ctx->ttbr0 = pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
+			     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
+		ctx->tcr[0] = arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
+		ctx->tcr[1] = arm_smmu_lpae_tcr2(&pgtbl_cfg);
+		ctx->mair[0] = pgtbl_cfg.arm_lpae_s1_cfg.mair;
+		ctx->mair[1] = pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
 
-		/* Clear context bank fault address fault status registers */
-		iommu_writel(ctx, ARM_SMMU_CB_FAR, 0);
-		iommu_writel(ctx, ARM_SMMU_CB_FSR, ARM_SMMU_CB_FSR_FAULT);
-
-		/* TTBRs */
-		iommu_writeq(ctx, ARM_SMMU_CB_TTBR0,
-				pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
-				FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid));
-		iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
-
-		/* TCR */
-		iommu_writel(ctx, ARM_SMMU_CB_TCR2,
-				arm_smmu_lpae_tcr2(&pgtbl_cfg));
-		iommu_writel(ctx, ARM_SMMU_CB_TCR,
-			     arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE);
-
-		/* MAIRs (stage-1 only) */
-		iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR0,
-				pgtbl_cfg.arm_lpae_s1_cfg.mair);
-		iommu_writel(ctx, ARM_SMMU_CB_S1_MAIR1,
-				pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32);
-
-		/* SCTLR */
 		reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE |
 		      ARM_SMMU_SCTLR_AFE | ARM_SMMU_SCTLR_TRE |
 		      ARM_SMMU_SCTLR_M | ARM_SMMU_SCTLR_S1_ASIDPNE |
@@ -301,7 +313,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 			reg |= ARM_SMMU_SCTLR_E;
 
-		iommu_writel(ctx, ARM_SMMU_CB_SCTLR, reg);
+		ctx->sctlr = reg;
+
+		qcom_iommu_program_ctx(qcom_iommu, ctx);
 
 		ctx->domain = domain;
 	}

-- 
2.47.3


