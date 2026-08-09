Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03A5C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 20:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=; b=NwrrQ/skr0Q+ZcSBMgcp2ANkAx
	5Ns6ixMq297mVxeVknaKHU/xjZp9TbYH+KPEBgUH7AJh4PITeUw2lLAhkwa+NIJUi/NfkccGlwYG6
	ov6XZ1RCgDnFtXKXC5SL7MnWr6XzGci/eX+znj5pEaUA0wiBYA1fksffeJh65D6MJIhhqgG8k9AAB
	puQOlvhXJIormLxjvDB3ct8fqXEJS1VKCFjwxISz642PERKrWNMCnR99/yRP+56/DIVMPd+pGCk2r
	AF8aotkr/A9wxPYJkpxRoPQaIT13SALCUM2O2dXge5S2OJ3Bukf51tSOReOzNVMIEaqCm8SbL1JhE
	mcV9kKsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wO-0000000AeMi-1LPY;
	Sun, 09 Aug 2026 20:16:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wt9wI-0000000AeFl-0IJ4
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 20:16:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 679I9ekB3420110
	for <linux-arm-kernel@lists.infradead.org>; Sun, 9 Aug 2026 20:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=; b=Qb6CJz25S4FQJlTx
	833BUXomBMUMS14QDTk19YWp88mdoDpnzTB0TVxNpYXS9GClRQi03eM5u6o8rKNz
	Yg5pxNwz9n9bQbHSBFCa3jmIiSOJGDVOZTvMd1yop7i4W8dk5uaoI7J0k+SgFGXS
	RqPEHqSVKWQFl4b/y/sNqgdJOWF5Dk/Bgid4X5C+x18VIEYkUOnjmVqWr9KFOFjV
	+q1QO4cmeMmaGbmcVE1IliunDMNVdCaI+Sng0rm3EQBA2+U4FzJoJGQIJaRCuGhv
	9oeB3mZUB/KbMl3LeRC610xu6i40GjZANd6GFkT42XulsueMaCiQiEjNt0buOyVn
	J0FjEg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fwvhvbfb1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 20:16:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-52d33c89a29so9348121cf.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Aug 2026 13:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786306568; x=1786911368; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=;
        b=iNPrQA07EyTENhFzozYIoeCiXrw7ayw9hOnMF0ilCciovMWr++o1OMVobw5/4TGf5B
         TWccC0KPUveT3GRTubOCBf6Jhjrr2kZf9VvJThQCxRiy46vb+U2G/x+1oRBsZ/1uzwAe
         elvPeEyMY/ke2Zvn1oFrKMuQXWcd0kGp3tvwDs/rwAF3kEXhAcLoyNy+jOk7Ea+ROoB4
         WEQ4cDTKOfXMNf9MIrbk+z11IPZYfydxRGG3lTaO7KByeLakTj378Q3cNhBtHOXeSew7
         Nj/VjpiyFGDw/GyA+lKoKVVCxDfLWJS9H5AnIAeJUDAVuCY35JELpxRpzMON2BsRZx+3
         emJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786306568; x=1786911368;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=niNCsZBrzIAQrp1eBI5we31XmUPx78SVfLUuwrIpCKI=;
        b=FwgQ/zIs8LwTbyOP0IghjlzPdYYPu3JxYhLUH1ImER2kdWYA3TaZKD34J4NFwHBXH5
         UPLQbthpnzyKbvjuR6HNtKfvtZ++Oq81ARURjBrmSwvS57hAPtvcVDYyKzSl9kQUlaN5
         l/N/gyOv27i86HroI6NBbCd8Sd6vrutABASOFmmZ5mMPuGM05ecS9MJszTr9cnAyCCWD
         WC741CawqDbtI9bTz3Mc+WhCr9rgBPpzu0tu96+ovqrNTY46wmSF4s6JP9YuJ6Vt6JI5
         x1nQZbNcqwpfUtiO6O0AAo3Mcm6lW1Paf2ibNLJabkD0YxjCjEH3h/oi1+j9I8gIjlGS
         EIiQ==
X-Forwarded-Encrypted: i=1; AHgh+RqRMdKXwsEmlGoJV33/QoHAc4KdnejV1uajDFpdhPbefsvlxFj2oXBoRSi6u+v7BjrE554IZHTu4wps1Z9/ljka@lists.infradead.org
X-Gm-Message-State: AOJu0YwAGGQtlRVtFLK5rOYctUp9I1oWiNGNxZNvWT/K/wQG1S3/2qx8
	NysJpNPUCxwrM9T7lr/MjYLXSvsxb9NhKa50slDmhAXWt1r6w88cQkzOt5Ih02hw0ASnYtqL1Qk
	GiByfy3W3mgIZOGfi3vOvb6cxwr+2CCV6ADlyOQMzzmWAuzjSDGOTdP5zlQdCFTRT9ZbPSs+nT3
	R0zw9A9JXGsA==
X-Gm-Gg: AR+sD11GyPeBGMusnQs1d07LHpMPWJ+CcFoV0DEiqagYc4j57GrzcpKCCFZfK8cDxYJ
	scAgbJyJzRwX0ohBeKcYuhSDjEyucDMJjCLWieZw3AiWbaVRjp66+EJHB0RmOrxl4JcNcDpca5O
	kFtrL8ZqEOSZMyN6PjS+dTdosKM8NYJO7UbjyBoHFn9zu1O4QjJ0eLAXHSwcKNjgc7vkpzRAE+z
	dBxkGiNMdbhaRTXmCxnQVA4hwjUYNAT7VHBL6nFTehSxNrsVnp+0Nihao/+oR0sGOjy3vnJfL9j
	9pHK0dHc1KryrFBnigUy/BWEgIaNhJPNzLS+9dPhU7diTi751GKUsiqWZ/0wxk+MBKfrBwK9Elw
	rUIr1Hl3glLr8sDy3slKwIqcNgYOqOk8T7xASq87CSxbQc5QgEZdVbvzPOTw37xZWrqDE1ZDzik
	TJxC6hOjlnabxDxw==
X-Received: by 2002:a05:622a:345:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52ce6108188mr399320101cf.26.1786306568248;
        Sun, 09 Aug 2026 13:16:08 -0700 (PDT)
X-Received: by 2002:a05:622a:345:b0:51c:73f:e3a7 with SMTP id d75a77b69052e-52ce6108188mr399319631cf.26.1786306567794;
        Sun, 09 Aug 2026 13:16:07 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b3055f3cfasm1589259e87.70.2026.08.09.13.16.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Aug 2026 13:16:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 09 Aug 2026 23:15:47 +0300
Subject: [PATCH 08/12] iommu: qcom_iommu: halt the micro-MMU while
 programming context banks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260809-msm8974-iommu-upstream-v1-8-87f5cd492560@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4172;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=eWQLDpa3TqCo4a5U/agcUYC2p0tFCZgkGn1lkr3Ubro=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqeN/vrrz5nTKhkhA8RhmCiIASpJNOV07B733ja
 VVfkmPfjWiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCanjf7wAKCRCLPIo+Aiko
 1SL5B/91QjVcyjSegd6cf/tLGXyVqJRDRnmGHZ6f//+zYHAc6FdXNDi6ba74FeoxKTtQx+MHzsD
 T33SDClz594ZGavBDNexQ9+LiBrW5qnZCC7hexo59OCPrHqt68x/pBn2s6TT3/X/11zFoeGOkSC
 nQVwW+Ad7yiUkjK/aKaiIeoQiLVeUpCzmgZOX4ofXLznfGr5XuNosJhW7OoHBVAjunRpM5R5KfT
 UN2WBxZhi2bptuWFiLuZjpJCZ2EXtDYI96iMlW0rITgaS42ZC/x8Ol8g1qiMkqeolNzZwPgkxFZ
 TpwaL9hyXttkkGoAUzmaT/tT60KE8ZGtGKXZmICIpVXdsCWm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=eqbvCIpX c=1 sm=1 tr=0 ts=6a78e008 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=3K1L26fHcIV91VHLagoA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: jrU2wBjtYU2p84QSD8p5ufa_fdXCBl2B
X-Proofpoint-GUID: jrU2wBjtYU2p84QSD8p5ufa_fdXCBl2B
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX7PyfzHYCXgmj
 oqVVZRUWFzFBioAcOPGNXbqfKlYCVWpQKoxC7tgkd5MV1YEeYrU6wTX+utQzlKOF5tc7XXQNdRd
 z+d1b9bUDGjh/TxbqzteZBcLwQXt1d3Wb3IqHQLBTmuS6UGskR04IGYJV12KCByxpCX/ZdkXePO
 Px7hfsHcpsYXXdQGuNGkZdREMsgOF+3cwQ0G+0Euj//oplEmKBhDiUSweqWMCczWGaAcQVXyB2z
 GF5fn9yUamNVQzAd+6EGTvr0ksP9OmLL2Qit3/K6eXACBFC8dXV0FV/4OV6DmV7n4xJzllZPspV
 MtxdttpNQs4Fmq2384mpxoEsJnUOT7goI4DXPdgSNrDHtdCfaSS0v8/aFb9C+VAQxN05K+efLlQ
 /zswId/+1d3W4cLaNZHS8nDj31DcVob3lUL9yGJFds7pE/uq7UxH4cqpOJvb4adbM7ICL9TfrCe
 tAU+jQgSQxUGEmFVVLQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA5MDE4MyBTYWx0ZWRfX41ra5nxOZ+2W
 KHYY6M3NqKVIwoRcs9xPp3wQuaA1A2Vts6AHtbG6fR7bqn2WBQRDs02jrFaWd9e3tgUhMaQ9FhD
 N+wB5p3H3IJY/rrukz7DKMbLhaVWMIU=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-09_06,2026-08-07_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608090183
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_131610_244785_073B6C00 
X-CRM114-Status: GOOD (  19.35  )
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

The context bank registers are reprogrammed underneath a live translation
front-end. This happens at attach time, and again on every runtime resume
for instances that have to replay their context bank state after power
collapse. Rewriting SCTLR, TTBR0, TCR and the MAIRs while the micro-MMU
keeps accepting client transactions races the in-flight traffic against
the new configuration.

The hardware provides a handshake for exactly this: setting HALT_REQ in
MICRO_MMU_CTRL, at the start of the implementation-defined register
space, stops new transactions from being accepted and reports IDLE once
the outstanding ones have retired. Downstream drives it through a
qcom,iommu-enable-halt property.

Add the handshake, under a per-instance flag as the handshake is not
wanted on every instance, and bound the wait rather than spinning
forever, so that an unresponsive front-end degrades to a diagnostic
instead of a hang.

The halt is confined to context bank programming. Applying it around the
global reset as well resets the SoC before the console comes up,
reproducibly, on an APQ8074 DragonBoard.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/qcom_iommu.c | 44 +++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/qcom_iommu.c b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
index 8e9488c47d5c..f27f8722ee64 100644
--- a/drivers/iommu/arm/arm-smmu/qcom_iommu.c
+++ b/drivers/iommu/arm/arm-smmu/qcom_iommu.c
@@ -37,6 +37,14 @@
 /* GR1 sits one 4K page above GR0 on the msm8974 QSMMU */
 #define QCOM_IOMMU_GR1			0x1000
 
+/* The implementation-defined space sits two 4K pages above GR0 */
+#define QCOM_IOMMU_IMPL_DEF		0x2000
+
+/* Micro-MMU control, at the start of the implementation-defined space */
+#define QCOM_IOMMU_MICRO_MMU_CTRL	(QCOM_IOMMU_IMPL_DEF + 0x000)
+#define MICRO_MMU_CTRL_HALT_REQ		BIT(2)
+#define MICRO_MMU_CTRL_IDLE		BIT(3)
+
 /* Redirect all cacheable requests to the L2 slave port */
 #define QCOM_IOMMU_ACTLR_BPRC		(BIT(28) | BIT(29) | BIT(30))
 
@@ -66,6 +74,8 @@ struct qcom_iommu_cfg {
 	bool				 no_afe;
 	/* context banks lose their state over GDSC power collapse */
 	bool				 ctx_restore;
+	/* the micro-MMU must be halted while its registers are programmed */
+	bool				 halt;
 	const struct qcom_iommu_sid	*sids;	/* one SMR slot per entry */
 	unsigned int			 num_sids;
 };
@@ -339,9 +349,41 @@ static int qcom_iommu_reset_ns(struct qcom_iommu_dev *qcom_iommu)
 	return 0;
 }
 
+/*
+ * Halting the micro-MMU quiesces the translation front-end: it stops new
+ * client transactions being accepted and waits for the outstanding ones to
+ * retire, so that the context bank registers can be reprogrammed without
+ * in-flight traffic racing the change.
+ */
+static void qcom_iommu_halt(struct qcom_iommu_dev *qcom_iommu)
+{
+	void __iomem *reg = qcom_iommu->global_base + QCOM_IOMMU_MICRO_MMU_CTRL;
+	u32 val;
+
+	if (!qcom_iommu->cfg || !qcom_iommu->cfg->halt)
+		return;
+
+	writel_relaxed(readl_relaxed(reg) | MICRO_MMU_CTRL_HALT_REQ, reg);
+
+	if (readl_poll_timeout(reg, val, val & MICRO_MMU_CTRL_IDLE, 0, 100000))
+		dev_err(qcom_iommu->dev, "timeout waiting for micro-MMU halt\n");
+}
+
+static void qcom_iommu_unhalt(struct qcom_iommu_dev *qcom_iommu)
+{
+	void __iomem *reg = qcom_iommu->global_base + QCOM_IOMMU_MICRO_MMU_CTRL;
+
+	if (!qcom_iommu->cfg || !qcom_iommu->cfg->halt)
+		return;
+
+	writel_relaxed(readl_relaxed(reg) & ~MICRO_MMU_CTRL_HALT_REQ, reg);
+}
+
 static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 				   struct qcom_iommu_ctx *ctx)
 {
+	qcom_iommu_halt(qcom_iommu);
+
 	/* Disable context bank before programming */
 	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, 0);
 
@@ -369,6 +411,8 @@ static void qcom_iommu_program_ctx(struct qcom_iommu_dev *qcom_iommu,
 
 	/* SCTLR */
 	iommu_writel(ctx, ARM_SMMU_CB_SCTLR, ctx->sctlr);
+
+	qcom_iommu_unhalt(qcom_iommu);
 }
 
 static int qcom_iommu_init_domain(struct iommu_domain *domain,

-- 
2.47.3


