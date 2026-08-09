Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46088C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=; b=3tcf8jIAO0Azu5oDWts1cdVtly
	JimAnVHW8kMpmzmgG/vRLD+ryI/FvprLaL1GlXvVfaQo045+7gImOoxYlK2h3qcyVdvRaOJ+qO3cU
	LuYG9kTCRuWn/x/8b7X5444Vedede03VTm0nhLQhevD1xU0s7PEmatD4hsT/1fIp9NAMt5+46efav
	OwaFbgwuN2Ig7HYBgPRSV3ihnw95nYSdUr+E3yodYHeDf0in5fOQW4mknMFnrgnJBjb9MKNCcbnTr
	w3NV1q3YQae34Z+kcg8Q1Aru18bwCHHWhhKRYq8u1D8j+fGVpKfGzbhPjWC8FIYgbRgWJnoPy5Km0
	DX5k9HGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wA-0000000Ae8y-2oti;
	Sun, 09 Aug 2026 20:16:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9w7-0000000Ae6A-0Ux5
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:00 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679JtVv53633261
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:15:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=; b=hugp1TU//+Y7E4E+
	+J0TC8uiNW79BzjVj/3E7KOXq2tWwyVHMmKhldTcq3ioaPQW0Mijz82KNAftbuWf
	kfrXLtTMtcxkD1vObp1NBJAzt7RwLppTeYiZ4XNINhj7DcrRUAVDnmJ65Saa+D8L
	LUbkTwkf+o7GM3sJeg5UqMRiFEAi8pcDuOpxW3WhEAW21js9nRAZhQpJSXEt4NTr
	3SOjF7qu32emElhcNClMJ5aTqtQ45DQQjkpx79qJ3vt4D/BNITdtqoQcEEBO/mDi
	CsxKOTF5D3Q+6hD6E44hiJYHo3FoRVqOQiPa7WcI+f3a9gXdMA2PiicJtJeZXngM
	2Pjnzw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvbfac-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:15:57 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-529ae8e96e8so10897401cf.3
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:15:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306557; x=1786911357; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=;
        b=XN2hWyVLSZbD9V4EXxBrWQf0n4a13E40OEyi/6gkoLBdzpylU9g8RIMRCPWPRSWu1a
         GJC3BuJ9FOgwDq5PMAcDj+BD5wwBiob1B0DOxafU1i3ln1YDsG4YBUUalfz+wUoAVXiS
         Jy1MnH+Xuxsdz+lyuFZT7mq22ks50K2rTdcgD9xU5qFjFR7zc9CqWZuhvw2K/k+Lid0H
         hJMqE3MoZMFZmiqNKg+TFzLgjcGWmqxqQW8n8sfgSz1o3CCTQvvmiluyDnb6frZy0bYo
         hmwxEEshJGA7HDCCMspgGOrnakhtsVE3sdPhsIcVwzZ8TOeOMGQP237BunKzQaoV7vGs
         8YaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306557; x=1786911357;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8lsx+cwstTAjNdnrioPo3X9hiGJFMki8t0ZkS427TRk=;
        b=ok6yFiZkSvTDnGEc1BuTMW1v/Hr9ZI8YhW9ozZuGiELhvOMEYYx9aLREsPQI8jnhbh
         Bpx/OBWzi1snYNCGb3xhg5Iqk+753h4rw59PBbV1fiOtT59RpADVYsvBJiva1cg4VEZR
         LMg5fYLYcjmE2rSDdfkWIFncqFiGE/2LbpuYDRpkeM396PlnyDBNUIPzGhswyrC70M2J
         6/fQwy/Hp/fIZoYyDHfzKgxTAKETQUHJXh73g7WAO1mOMJomCxpjfyymhQ+AjtLIzb0u
         hmGCGgJRKd4nCY+Btt8GMmhwNHZhoOzKfPpxs/eU6Mpic2G56ribFkWYHo7WHSlfxbdP
         isrA==
X-Forwarded-Encrypted: i=1; AHgh+RrEUi/QtTyQqywSyQMHC6AWg0iPyG9MadAVxjqcNrJ8y+Lb9ahuEfPmFZ57w/jrCQwdP8KXhKRrOiMrus/Qt1GS@lists.infradead.org
X-Gm-Message-State: AOJu0YwfbcEuiQ+S3l7IYdDsZVNmBXmV4wtMOwKYl5EciSDTPKthA8HE
	Dt2Hid9MJzIlAHMzoN/umrUsYNUXMjt+IuaQd0wdzute4Ih4SkDnhul3Z/JI9xm7Z2ne/UqN1vx
	nD0kGGAPwpiR/FQqDIF5neY8iNrNe60WxssNMO6fSbPoAqjbduJ0bivfeZ34IfsoHivZdGJi/JX
	Nt0vgwwfmd0Q==
X-Gm-Gg: AR+sD11bZG3wiqUSbCZQb/q5VB3e1YGMN9fNltjdZEVPmPJqLNsOFDL7kCIoFcGAWwP
	s7rXIs8GVqzoD2c71QLrPL2WPNTqPitsJqL13mMw5cx3ZA5mvACRAN7XGKybTbPacLE3c9wPppN
	4uz0Z/KMGZic9jyUHoSGakCIEGEekOHUP1u84Woy9CQuxXZphQgBpsNEmxj8EFACMn517F+pdtp
	U2B7hGH+Jon1KCL+CX82WbskrNvsO5jc3HCvKVQ7EsBMwvz6pEkdz/4fBWqrttFix+xkxfiaRoX
	B+gEUF4l8KsNjEqeQtyMrjIlBxynWv/aFpQkyGZopYb2/Tk32QR7CWjg8NdC3uOn2fjdXgWjsDD
	UrFVi0ttCGgwvuAaBthEXiCSL28WB8/WRKopjSubea665RZuo6B7Z1SwxwZVSFuOM3ciwTvcLaV
	b1d8yqgy9drB72mA==
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr458823981cf.23.1786306557142;
        Sun, 09 Aug 2026 13:15:57 -0700 (PDT)
X-Received: by 2002:a05:622a:480c:b0:51c:1c73:5943 with SMTP id d75a77b69052e-52ce6145233mr458823271cf.23.1786306556491;
        Sun, 09 Aug 2026 13:15:56 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:53 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:43 +0300
Subject: [PATCH 04/12] iommu: qcom_iommu: support the short-descriptor
 pagetable format
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-4-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6439;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MyFwP51+yZ/c9HWtYLGPLcbLLtgX59e5z1/cjBJidcU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uxbRFsDXIdIPxjyJX5z4BPN+Bao/YMpv3M
 /rtWeCXf4iJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1ZmDB/wLpAF5I4ooO0aH/Ttyxv6B7kwIdY7FJlzh/jVhEqu7WGpxIjwqBPSn/IwhalxN6KIsw2m
 weEaL02pDPZy+sckhBNY/F17ukcL0NfQLd8T99WbxSbkuJj0LXW2u5tQE6D02tgTpmH1DhpUNXc
 ivHOOVGrJ8vX47fH4yzAjAfTkl91QQRYwNctqyZQNBgKgMSWeklmY2ywG4tPL+2ueckypB7UjaR
 8r93l7jf1ka2KqlhJYSUlAdSEA6/PZv4Cvo4TxtnLm5XWC7T5/fe3EcGZm582npaPaz2p591qdo
 71N1zJP+3f0W3lrbjBGgGJIqrkbk4g1wVkgtkOz7hwwPa8Ze
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a78dffd cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=aiaqajgxMVtR3Km9lW4A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: L7rrHkzhSlpPhr5y5iquCH0jCzgRBIqW
X-Proofpoint-GUID: L7rrHkzhSlpPhr5y5iquCH0jCzgRBIqW
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX6759xyVznLUS
 q5c4QA60uoT3K7KELDuihC0N0aTjnOt9nLRJEuW7VFuiI/QUF08zm3eEcnNayvXPYHp4O8aB++g
 skfNtsSkj8czzHw0V2hP9vq4RtGxVVZLqTHteB2hHdZGr4QQ8qGxhVzIb3oLTpH6kp7PvjCO9hU
 yPntw+SKl4C0d8C18WPpk99Y51hGo1hLz825xDflSe2lsbxz/OHEvIXU8/6d7zmT/N3fP0YqGzq
 ReHIlnRb9A4u4UVsAnKwd8m27dVk3Bs7su2PU34saAmkwh3h365H0YYPQymztNkHyFmmrrY8VVc
 Xa920dWyroXQlfaanMlXNSprw5HAAVkGqj0hvoFLGDBwOPUIDGF7IqNJo7rKz1KhffcsFabsrOa
 Ei5z/PFaEH42Dfw60U2KDnuT1ciTIFxE2UEj3a+NBEYbwl/r7Ew5PfnWtYkVo8rq6BjtDnEGNBL
 WCiyng8rx1qxweovKJg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX6SyoRdK/+1eg
 gA6cknKR/DPmLEwBLyzzUO0eC/P24fe0JERbW0r2wFruvk64xefCj6vZipWrJqFQRrdhoSH2RTO
 sfFrGMGTolMVtdLq44Ox/UupyQ+ZzEs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131559_479144_3AAAE2D5 
X-CRM114-Status: GOOD (  23.78  )
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

The MSM8974-generation QSMMU does not walk the LPAE tables this
driver hardcodes: every access faults with an access flag fault
despite AF being set in the descriptors, and with SCTLR.AFE cleared
the walks still return garbage translations (observed on the APQ8074
dragonboard GPU, which locks up on its first ringbuffer fetch). The
downstream kernel only ever used the short-descriptor format on
MSM8974; its LPAE support was reserved for the newer APQ8084 IP / TZ
revision.

Introduce a per-instance configuration structure, selected through
the of_device_id match data, carrying a pagetable format field and an
AFE quirk flag. For the ARM_V7S format, program the ASID through
CONTEXTIDR instead of the TTBR0 ASID field, reuse the MAIR register
offsets for PRRR/NMRR, restrict the output address size to 32 bits
and keep SCTLR.AFE disabled like the downstream driver does when the
no_afe flag is set. No instance sets a configuration yet.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/Kconfig               |  1 +
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 54 +++++++++++++++++++++++++++------
 2 files changed, 45 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/arm/Kconfig b/drivers/iommu/arm/Kconfig
index 5fac08b89dee..596e643961c3 100644
--- a/drivers/iommu/arm/Kconfig
+++ b/drivers/iommu/arm/Kconfig
@@ -138,6 +138,7 @@ config QCOM_IOMMU
 	select QCOM_SCM
 	select IOMMU_API
 	select IOMMU_IO_PGTABLE_LPAE
+	select IOMMU_IO_PGTABLE_ARMV7S
 	select ARM_DMA_USE_IOMMU
 	help
 	  Support for IOMMU on certain Qualcomm SoCs.
diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 5bbb51d9bd65..77c01f217d7e 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -43,10 +43,18 @@ enum qcom_iommu_clk {
 
 struct qcom_iommu_ctx;
 
+/* Per-instance configuration, absent on msm8916-style instances */
+struct qcom_iommu_cfg {
+	enum io_pgtable_fmt		 fmt;
+	/* the walker faults on the AF bit despite it being set */
+	bool				 no_afe;
+};
+
 struct qcom_iommu_dev {
 	/* IOMMU core code handle */
 	struct iommu_device	 iommu;
 	struct device		*dev;
+	const struct qcom_iommu_cfg *cfg;
 	struct clk_bulk_data clks[CLK_NUM];
 	void __iomem		*local_base;
 	u32			 sec_id;
@@ -54,6 +62,11 @@ struct qcom_iommu_dev {
 	struct qcom_iommu_ctx	*ctxs[];   /* indexed by asid */
 };
 
+static enum io_pgtable_fmt qcom_iommu_pgtbl_fmt(struct qcom_iommu_dev *qcom_iommu)
+{
+	return qcom_iommu->cfg ? qcom_iommu->cfg->fmt : ARM_32_LPAE_S1;
+}
+
 struct qcom_iommu_ctx {
 	struct device		*dev;
 	void __iomem		*base;
@@ -65,6 +78,7 @@ struct qcom_iommu_ctx {
 	u64			 ttbr0;
 	u32			 tcr[2];
 	u32			 mair[2];
+	u32			 contextidr;
 	u32			 sctlr;
 };
 
@@ -232,8 +246,11 @@ static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR0, ctx->ttbr0);
 	iommu_writeq(ctx, ARM_SMMU_CB_TTBR1, 0);
 
-	/* TCR */
-	iommu_writel(ctx, ARM_SMMU_CB_TCR2, ctx->tcr[1]);
+	/* TCR; the v7s ASID lives in CONTEXTIDR instead of TTBR0 */
+	if (qcom_iommu_pgtbl_fmt(qcom_iommu) == ARM_V7S)
+		iommu_writel(ctx, ARM_SMMU_CB_CONTEXTIDR, ctx->contextidr);
+	else
+		iommu_writel(ctx, ARM_SMMU_CB_TCR2, ctx->tcr[1]);
 	iommu_writel(ctx, ARM_SMMU_CB_TCR, ctx->tcr[0]);
 
 	/* MAIRs (stage-1 only) */
@@ -252,6 +269,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct io_pgtable_ops *pgtbl_ops;
 	struct io_pgtable_cfg pgtbl_cfg;
+	enum io_pgtable_fmt fmt;
 	int i, ret = 0;
 	u32 reg;
 
@@ -259,10 +277,12 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	if (qcom_domain->iommu)
 		goto out_unlock;
 
+	fmt = qcom_iommu_pgtbl_fmt(qcom_iommu);
+
 	pgtbl_cfg = (struct io_pgtable_cfg) {
 		.pgsize_bitmap	= domain->pgsize_bitmap,
 		.ias		= 32,
-		.oas		= 40,
+		.oas		= fmt == ARM_V7S ? 32 : 40,
 		.tlb		= &qcom_flush_ops,
 		.iommu_dev	= qcom_iommu->dev,
 	};
@@ -270,7 +290,7 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 	qcom_domain->iommu = qcom_iommu;
 	qcom_domain->fwspec = fwspec;
 
-	pgtbl_ops = alloc_io_pgtable_ops(ARM_32_LPAE_S1, &pgtbl_cfg, qcom_domain);
+	pgtbl_ops = alloc_io_pgtable_ops(fmt, &pgtbl_cfg, qcom_domain);
 	if (!pgtbl_ops) {
 		dev_err(qcom_iommu->dev, "failed to allocate pagetable ops\n");
 		ret = -ENOMEM;
@@ -298,12 +318,22 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 			continue;
 		}
 
-		ctx->ttbr0 = pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
-			     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
-		ctx->tcr[0] = arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
-		ctx->tcr[1] = arm_smmu_lpae_tcr2(&pgtbl_cfg);
-		ctx->mair[0] = pgtbl_cfg.arm_lpae_s1_cfg.mair;
-		ctx->mair[1] = pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
+		if (fmt == ARM_V7S) {
+			ctx->ttbr0 = pgtbl_cfg.arm_v7s_cfg.ttbr;
+			ctx->tcr[0] = pgtbl_cfg.arm_v7s_cfg.tcr;
+			ctx->tcr[1] = 0;
+			/* PRRR/NMRR share the MAIR0/MAIR1 offsets */
+			ctx->mair[0] = pgtbl_cfg.arm_v7s_cfg.prrr;
+			ctx->mair[1] = pgtbl_cfg.arm_v7s_cfg.nmrr;
+			ctx->contextidr = ctx->asid;
+		} else {
+			ctx->ttbr0 = pgtbl_cfg.arm_lpae_s1_cfg.ttbr |
+				     FIELD_PREP(ARM_SMMU_TTBRn_ASID, ctx->asid);
+			ctx->tcr[0] = arm_smmu_lpae_tcr(&pgtbl_cfg) | ARM_SMMU_TCR_EAE;
+			ctx->tcr[1] = arm_smmu_lpae_tcr2(&pgtbl_cfg);
+			ctx->mair[0] = pgtbl_cfg.arm_lpae_s1_cfg.mair;
+			ctx->mair[1] = pgtbl_cfg.arm_lpae_s1_cfg.mair >> 32;
+		}
 
 		reg = ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE |
 		      ARM_SMMU_SCTLR_AFE | ARM_SMMU_SCTLR_TRE |
@@ -313,6 +343,9 @@ static int qcom_iommu_init_domain(struct iommu_domain *domain,
 		if (IS_ENABLED(CONFIG_CPU_BIG_ENDIAN))
 			reg |= ARM_SMMU_SCTLR_E;
 
+		if (qcom_iommu->cfg && qcom_iommu->cfg->no_afe)
+			reg &= ~ARM_SMMU_SCTLR_AFE;
+
 		ctx->sctlr = reg;
 
 		qcom_iommu_program_ctx(qcom_iommu, ctx);
@@ -808,6 +841,7 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 		return -ENOMEM;
 	qcom_iommu->max_asid = max_asid;
 	qcom_iommu->dev = dev;
+	qcom_iommu->cfg = of_device_get_match_data(dev);
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res) {

-- 
2.47.3


