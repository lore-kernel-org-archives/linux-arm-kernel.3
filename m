Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F801C5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mK+aHqMyUy9njtJyec2hF8DLwos0hr+XP1bl216r8YQ=; b=paZUW6C05BsAYSktp//xj63yct
	vjydStfBC4KGMsjZtleJv6rPmXjNUopcvbFPuKqVgi7YzSDrwicLvK9ZnCrI2I5W/Iy14BnQr2jp0
	gO84PaPwJmGX+CRZRJ34aKbryvQqXmvcnIJ32REHfBaIS/cXlWusa/5Akgjp+ysv9t/TY078IBz8i
	cyWje4VqdcJKqHvHDk7Kl25aOQTTSwTArOpD/W6iNLkbQIgwNaqeqjjFnYCxoo7frOBaNzzWBxaF2
	W/fRoHj+F4fQKIYEyBG7ME0YFYJkzJKJPYIsoA7twWU1I5OWGk/dom0wmyxmlJu37iHV5/H6bcATh
	qIl7UY7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wC-0000000AeB2-3Hld;
	Sun, 09 Aug 2026 20:16:04 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wA-0000000Ae8b-187H
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:03 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9G993077201
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mK+aHqMyUy9njtJyec2hF8DLwos0hr+XP1bl216r8YQ=; b=j/JeoyK6QvGzfGHB
	ZJM7uNlRFk7P9Goo9zIO0UiL/WOWQDMnkUrs9Sud3lDk0pNCVx6pLp8ubUyQPRlz
	MCP+3FgMudL0UoWNPwQf63/Bag/i284Y778eGXKlZTK2V4wMK5u975aJfkNPM5/o
	JSQRKeLO0UXpBHXV1JT30UK7qq0jnJhIMIwikGfEt1gAefTv3YQpo1jEZvEH9mPH
	jtCck0F8Hi8c1B710uwX4xod+wapDUScDH21k+A3LELc3ybfgHjy5FfMbhuLQwJo
	CuXEyosTJ0vV9PsGtbI/2xZ1uXQxrKoRqJjrYsxcUTQYhzGpU63zCQLfS87DbB0R
	t2PXeA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwwr9kbpc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:01 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c01ff996dso17386201cf.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306560; x=1786911360; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mK+aHqMyUy9njtJyec2hF8DLwos0hr+XP1bl216r8YQ=;
        b=CKX9EU/Vd+01f9o/cOy5Xl4k4ngeK+YH6xtekoHMQKFXGB/EhnTqI6tTYwjTbymjYk
         8n4Tb+/l0TYVGkW+NdSaRkRFLVQsQxaxbBeLooZ82wOn+p52gK9inkoPKvFvgURO6n4b
         ktqL0LIRJz1dJXoOkSlESxUozueaKv5c/LkkX0+RGeW41+e4vjpr3YeTDpDprxUN03+/
         5ukoK0TLUI5ZNChZBXxMEcPPZzsakRhuER1Z6krNvLYvym9MaevJWaArhK1MZ1R99ROP
         Jtx26Nnu45EbZAvzyJXxeCONbEJzzzBG3mUN0m/LF1rY9OkZyVHJRIB8mnwHMV/8/0Zi
         eGhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306560; x=1786911360;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mK+aHqMyUy9njtJyec2hF8DLwos0hr+XP1bl216r8YQ=;
        b=fnZakG0dJHXjGVsxXgfDGHM2BlB9ddutYdiWIVoU3TfsEGVwbsgi8Xjl53RW8uPHUJ
         tfeBR/fRv6RUUPFjBM7VMMzarSvBHXVzjmqR2MVtCUXQz6g3doEiLgU3XDDm9C3KAU1i
         ZpbiO3Na900s3vq7kcNGS8+JkwVz6K1WQNPYX10DLOkr2az4nz7+Oe3u9t0Ixty9iMtk
         LvcbFTcBNIvch4tdFxjV3ShSDUxKt69+9apGiTXrk7H8uPYad4Yfjem7ZbyO/H1U85ox
         lEK2hBxcU5c+FWcidCCdIfkf6vCirPwg8G6/K6Ms/Ap9Hf9u5FAs4VNExu82dglHXa1S
         k37w==
X-Forwarded-Encrypted: i=1; AHgh+RprWAtCv708Jkl+7sUm7SdEzCsCRn4VUjtk5K2JoOi4n8H+yxAQSkuq39NFzyC9XZ1DA43nOsxjvFmQixyNgye+@lists.infradead.org
X-Gm-Message-State: AOJu0Yyqhhjp9VCZYQJDxrggXypm/9U/dCitXDcBnChBcPQ1gSRrjVFe
	9K066LiPZdBD9rSqrXVy2S0ZfDOrIEBC0LHJxslnDqOe0B4Iy3DuoSYOiQIlKL3FvgzKodI4Dj1
	O9I9QilDQEXzC/9jFM7BVjVXbXbDk15BxyicYkgifSmgdIdC3DtPncsUuEe9qzW1UCnVKc6jBkB
	x/4cuvzII8yA==
X-Gm-Gg: AR+sD12ZxsufI+5+s7qbu+zcKfxW3iQHTdmrCrTh3dLRsX1K0GtR6f+CaTJ5FVHLfo5
	oEy5sXJEcVTyiw2z0lSY61J72hCxWmWLQd9z+5ewmeC8U+UViOY4jM+P6SapmE9t72WF0vLkU5q
	EXnyjs7iUT3pEofIrydT4ssM/G9vOZq2wh2IUqmFHC9OY4J/iBZSv+IHOH7k55m8u7qYudbseHK
	jUfjkwudFz/ggcRLiJ86+wJ7KevkLfrP4wWZd1jvCKzsJ5WJSIL9KwZ7Jal/6RsmWXLTqBc2bi+
	Bu99dSDoZkv2BBBKugopOKsJD4x9Gp/cNjbyYh1Ye6bm47TZXFxae+dOU3BLYpkt1GG8nF9IDqc
	4w41BNNmY/DlEXiGweIb8VvOc5A3fbw1YlJgypqZcs/xsg5oa9J1iiet30GGjJnR8RWDv3wP11T
	kvf4vXHEE8pQgOUw==
X-Received: by 2002:a05:622a:2592:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52d1904b11dmr207282441cf.33.1786306560345;
        Sun, 09 Aug 2026 13:16:00 -0700 (PDT)
X-Received: by 2002:a05:622a:2592:b0:51c:17cd:1fe8 with SMTP id d75a77b69052e-52d1904b11dmr207281981cf.33.1786306559841;
        Sun, 09 Aug 2026 13:15:59 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.15.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:15:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:44 +0300
Subject: [PATCH 05/12] iommu: qcom_iommu: handle the SMMU global register
 space
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-5-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5119;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=+sGtB20DBa8qqNqIVi9KLViUpBY6FE9rYJuuV2Wv9ck=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/uzq2IIlj4vq4UZMQqBWgBuq+dTL6lcATnd
 c3oAVUOahGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7gAKCRCLPIo+Aiko
 1bVqB/9eOKxGGydYLpvk9Ll8KLUoK8OR1oxKAUEbO6UsA81v/vRkXO63K1qpBCDgCEm5PKDUWRU
 uifVOkGaX72mkIcVut/2vzGPPy13y7IPlJgrbCqLRtABm8rc3bkXJ7GWPz4UAr8GlhseKxRlKSU
 0JLgzEPhnCZHojnfzZh/SSQbzL2Ko9pn27JCzCqPchnz93OJRPWLQCRatWoYh7k5cRzvdhGZhaO
 wxVEwgFPXz2U6zS8QQBYkkpTgS9WAuE02UwaOk7ez89Hd3c91uE3hXi26dG1UpcwC/l1AhzCpN4
 tx6nesPf/snfpK6qeo9u56hJqx/dxq0J6oEeQXdUpg948oVe
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=d73FDxjE c=1 sm=1 tr=0 ts=6a78e001 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=2qLXTtW6F1X4e_bQErwA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: lFaqDXqKLzXcjsUIPU3o3I_3lrQbCVIG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX+O2cpze6JkrC
 ZGV9R2uX1ZYHdfK5HUf2z4/ZhRFKp1YzqlrQJykUUDutWhPOJdX6lMsrGWHQbDg0LLqeS5hH7uR
 cJ5vJQRGyh870vv+NtoFx1J4qY8Yy1Q7dbU4vTBlSSZfEDnDGzfvlBpGXOD4Bf+1VtTfxD+PjPr
 ClYJNE6apzyqH/yT+Hi8DGk9xqsnowD9ILAJua8s9N8CYIoRolVWizRnoJOSm0ZGYNjyy5W1OGi
 A8YKYo1tKQCOVzUNuk3rq4FoiZeFEVDTHLi5J1azdUHrvmSiBJqXY22Lt11TSpJMNvN6lmBMcjf
 l4gyDKioosPMDSAyT9zjBHz1D1q38tLsOwuccEvdi/xqdDvj50oRGpqGS7D+8DDh8KKFny0dkNY
 bc4B+nQfGTe+o45z4Dw/4kru9fOpFZsUF3CQmG5WpwlKBhX9udW33jacsV7lsLC5oetgifMBPtm
 ytGsKFrR3Jng/dfkCtA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX3d5oMS+Btzc7
 Kkk1Pte4EhyeGlo/SPpHzburlLFvgl1jq8VarAx3j4RWHPPbPKi8ExIma8Zz6RyBEabT0TeuXFK
 rFExUHEmU/hurGeCoYRNIbWJBWItr9w=
X-Proofpoint-GUID: lFaqDXqKLzXcjsUIPU3o3I_3lrQbCVIG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0
 spamscore=0 suspectscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131602_333229_68C46BEF 
X-CRM114-Status: GOOD (  27.04  )
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

On msm8974 the OS has to access the SMMU global register space: the
non-secured instances need it fully programmed and even the TZ-managed
ones expose OS-writable implementation-defined registers in it. The
driver only knows about the msm8916-style "SMMU local" region in
resource 0, and has no accessors for the global space.

For instances with a per-instance configuration, treat resource 0 as
the global register space and require it. Never perform the
SMMU_INTR_SEL_NS write on such instances - offset 0x2000 from the global
base is the implementation-defined MICRO_MMU_CTRL halt request register
on this IP, not the interrupt select of the separate msm8916-style local
region. Provide gr0/gr1 accessors for the following changes.

Do not clear the FSR of the context banks at probe time on such
instances either: they sit in MMSS power domains which may well be off
at that point, and an access to an unpowered register block stalls the
bus. Skipping the clear is safe and preferable to powering the domain
up for it. Safe, because a collapsed context bank has no active logic:
it can neither latch a fault nor assert its interrupt, so the window
the probe-time clear protects against on msm8916 does not exist while
the domain is off, and the first runtime resume fully reprograms the
context bank - including the FSR - before translation is enabled, so
any fault state the bootloader left behind is wiped before it could
matter. Preferable, because taking a runtime PM reference just for the
clear would be a power cycle with no lasting effect (the cleared state
is lost again when the domain collapses after the put), and the
get/put pair is actively harmful for the MDP instance: at IOMMU probe
time the display is still scanning out from bootloader-configured
state with no kernel driver holding the MDSS GDSC, so the final put
would power the scanout domain off mid-boot. The same treatment
already exists for the TZ-secured contexts, which skip the clear for
banks the OS cannot reach.

Assisted-by: Claude:claude-fable-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 44 +++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 77c01f217d7e..428b18697244 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -34,6 +34,9 @@
 
 #define SMMU_INTR_SEL_NS     0x2000
 
+/* GR1 sits one 4K page above GR0 on the msm8974 QSMMU */
+#define QCOM_IOMMU_GR1			0x1000
+
 enum qcom_iommu_clk {
 	CLK_IFACE,
 	CLK_BUS,
@@ -57,6 +60,7 @@ struct qcom_iommu_dev {
 	const struct qcom_iommu_cfg *cfg;
 	struct clk_bulk_data clks[CLK_NUM];
 	void __iomem		*local_base;
+	void __iomem		*global_base;
 	u32			 sec_id;
 	u8			 max_asid;
 	struct qcom_iommu_ctx	*ctxs[];   /* indexed by asid */
@@ -130,6 +134,26 @@ iommu_readq(struct qcom_iommu_ctx *ctx, unsigned reg)
 	return readq_relaxed(ctx->base + reg);
 }
 
+static inline void
+qcom_iommu_gr0_write(struct qcom_iommu_dev *qcom_iommu, unsigned int reg,
+		      u32 val)
+{
+	writel_relaxed(val, qcom_iommu->global_base + reg);
+}
+
+static inline u32
+qcom_iommu_gr0_read(struct qcom_iommu_dev *qcom_iommu, unsigned int reg)
+{
+	return readl_relaxed(qcom_iommu->global_base + reg);
+}
+
+static inline void
+qcom_iommu_gr1_write(struct qcom_iommu_dev *qcom_iommu, unsigned int reg,
+		      u32 val)
+{
+	writel_relaxed(val, qcom_iommu->global_base + QCOM_IOMMU_GR1 + reg);
+}
+
 static void qcom_iommu_tlb_sync(void *cookie)
 {
 	struct qcom_iommu_domain *qcom_domain = cookie;
@@ -749,9 +773,10 @@ static int qcom_iommu_ctx_probe(struct platform_device *pdev)
 		ctx->secured_ctx = true;
 
 	/* clear IRQs before registering fault handler, just in case the
-	 * boot-loader left us a surprise:
+	 * boot-loader left us a surprise.  Instances with a power domain
+	 * may not be accessible yet; they are reset at first resume.
 	 */
-	if (!ctx->secured_ctx) {
+	if (!ctx->secured_ctx && !qcom_iommu->cfg) {
 		ret = pm_runtime_resume_and_get(dev->parent);
 		if (ret)
 			return ret;
@@ -845,9 +870,18 @@ static int qcom_iommu_device_probe(struct platform_device *pdev)
 
 	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (res) {
-		qcom_iommu->local_base = devm_ioremap_resource(dev, res);
-		if (IS_ERR(qcom_iommu->local_base))
-			return PTR_ERR(qcom_iommu->local_base);
+		if (qcom_iommu->cfg) {
+			qcom_iommu->global_base = devm_ioremap_resource(dev, res);
+			if (IS_ERR(qcom_iommu->global_base))
+				return PTR_ERR(qcom_iommu->global_base);
+		} else {
+			qcom_iommu->local_base = devm_ioremap_resource(dev, res);
+			if (IS_ERR(qcom_iommu->local_base))
+				return PTR_ERR(qcom_iommu->local_base);
+		}
+	} else if (qcom_iommu->cfg) {
+		return dev_err_probe(dev, -EINVAL,
+				     "missing global register space\n");
 	}
 
 	clk = devm_clk_get(dev, "iface");

-- 
2.47.3


