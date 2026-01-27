Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CE07D2F000
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 12:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Ds2ZJGE2krsn4P3tEHEukVhMuBmMD5Z71E4XCCNGtXw=; b=n1zUcoSGCPOHxoIdoOuyDEth1T
	ymi7xWoouzItJ2b0dVB4nazMb0AxvEae5v1lGM8SNYd0Z2aIDUCQ+H2v344nOT187hm5CgMRRuMOg
	WGX8lpjauiXNq6Bry4+7ebTSKHlgcOe06w5ixvxKnToJJMz7FDiK2DhqVmroR3HDIdVhLbwc1Y+MG
	nMieg0vELQTY3jQJVZYZDHVS08zXzDHAOSHQYUKZUTqjPYFkrXNSuoNUee+bx8E/uAExO1rDm+Gty
	bijHpLEkjZeLWDLS35IqdF+ZSsV/7Jzfu9j2Na48QRMQYjgKGMGd/Vu0/v+lWp/zQUdBlJZcZZilU
	fqcgC4gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhvP-0000000EDD9-1QbX;
	Tue, 27 Jan 2026 12:12:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkhvN-0000000EDCm-3Sbs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 12:12:03 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60RA5WRt1268757
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:12:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Ds2ZJGE2krsn4P3tEHEukV
	hMuBmMD5Z71E4XCCNGtXw=; b=NnoQkF2rmO4tVZEjiDNcK1ybXCDrgwGdusJNVW
	lBKCM+RTyjlJQNHAUzhIOY2COeOx/nNrcyJV+/zhVxPL6Y5BzRUsje0hVzQfzDhy
	rNwhVjlCjA3kkrkxKqOKiWjHmOkNHlEykoNE8ZotZMCE+6wZv3TgvYzD6ymHU0uI
	5xtmQncwi0xJCyjP3Z84yDNXxswAVSuD6ar2X5Cy8WA+6vQK+oLWNVhRjHSRpr7G
	V+uppQdq0D3MP0DH2sWU3Mfj6ryj1wu8EojE+TPS9OP7ZP1inENOM3NFWbKX30k7
	xdFIgpc4uSDX7u6db3GVdlVfHFdesB/J6bwpD6/5IlJtzBIA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bxnyaskhc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 12:12:00 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2a7701b6353so55947615ad.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 27 Jan 2026 04:12:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769515919; x=1770120719; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ds2ZJGE2krsn4P3tEHEukVhMuBmMD5Z71E4XCCNGtXw=;
        b=aY7S0YoeJG5R3oXxWhdIHJDAKZ8scpXAhH1qSwAFQjmXFOcTEyObltz7rthnDAOSYo
         LMJbwWXfvx53qeL/Rh8QtAhS74WkQWFxWIIxaIbd+LN1OmItR6zdobzeCQpypu6ATARk
         HCeOkfgJlkOeKZ+Xie7SGfrjmmVhtTsXVRyl3d0UI4KHFkmnbVl4NIIU01NnzW0UyJCw
         eoWLTeh8kPEGfjmpjqPydr4EusISXgzmnARpoZ3MZXjuGLFl/zAImHmjZ87mUJ1MgUh9
         1HPga9CBoRhjHXMZxHYaGELYTevBmz8VP7ahHEQCiy5xfYZoKDcUHEqxsFQOnCUaBV5x
         6o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769515919; x=1770120719;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ds2ZJGE2krsn4P3tEHEukVhMuBmMD5Z71E4XCCNGtXw=;
        b=p9SN9hxtql588TcyBggwNtaIw8Lodq/mnJPshzf/bs8LJp75xu4XI3g8blK+iv5Yf6
         A6WiJwWOr1S/q6CzefqaS/dQO07W9sFIBJ2Is0j756xKuP6iDUd6v2p1L5NNTJf3BO+g
         myxJVtzi9jXLbfhYMYaOIRRuyMwC0QxWnsPG+8Rd7jrmHbGtPqSq9zkDUY8ytNeoTkrM
         aXtS84EFko1i8Ypt3vP1DnfjilJS61nwqVnspk4aiUZewSrTwrRLEa80CtV7hsdVCJDp
         ZLS1uoFCFoTZY0JMy7EFw5whL6U87hvBrbq3FAEP/g8Ky9N4hPsZSjwqoZaeatC/1XWz
         GYJg==
X-Forwarded-Encrypted: i=1; AJvYcCXIYGdWfOQhd7gTRF2uGV5br/x5hz0bkD/YMFumtIvC3ooK91xBtsrwZJBPK4sDDY4ZNa7HE4KsOkkBqwtg27cZ@lists.infradead.org
X-Gm-Message-State: AOJu0Yye45rApwZLtHH2p025h3QsiEEoRwNqyC/+stOciU0wSm4lGrnT
	Ut1ORrKErjip2Yj624l3WRMpwK8zYVrenF9XDcD1+Ut7glf/PuNOVwPmu2DrHhR5ECPZBcK9yuc
	2YsIibPzzociIMk+bgRXMsOaEhGDICrJwo3OlhdBTkFdQeCwBuDiVooK+MzvhRSwoJod5rWago4
	VmFA==
X-Gm-Gg: AZuq6aKtSLo9peJoWE6FM6NLJzTi8h2Ez/GltRhuAYPaB+XPp7eyntnquCnRLs+DgMV
	IjeDrUNA83rCjJe9YgrCgs6PV+GHCTh8rj7xSvXL1bwMgMCltZzq8K6RnyDJ4yy6QJmn+GUcbp7
	NBioTCSc5jDG91DMymjLGvA81xO0t+fL4FpGYLSl1a/49cRjbpmgoZrR3/ymBIxXRMC7DW7twcC
	CcmjlYSPaRsosYJoFqZhtStgWHyWa4Z+nQYicIL5IATntHUBdFi5cwWRCiWPE3Zy4j7AJ9U3QDu
	lHSCrxSDgSaM5y3/HwVNTl9rRKNAQ04lUWVGkYanfCwf4ug9Dc13bqipkUg+Uxg9sfye2whRLa4
	AgYfGWPSP5bKl5DTH48Afy8ePB8+9Xd2CQw6A0f4f
X-Received: by 2002:a17:90b:28ce:b0:353:3977:a082 with SMTP id 98e67ed59e1d1-353fecc6684mr1373175a91.1.1769515919139;
        Tue, 27 Jan 2026 04:11:59 -0800 (PST)
X-Received: by 2002:a17:90b:28ce:b0:353:3977:a082 with SMTP id 98e67ed59e1d1-353fecc6684mr1373156a91.1.1769515918627;
        Tue, 27 Jan 2026 04:11:58 -0800 (PST)
Received: from hu-guptap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-353f6159ad6sm2489474a91.14.2026.01.27.04.11.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 04:11:58 -0800 (PST)
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Date: Tue, 27 Jan 2026 17:41:45 +0530
Subject: [PATCH] iommu/arm-smmu: Use pm_runtime in fault handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAICreGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDIwML3eLc3FLdooJcXYukFDPzlCRL45TkRCWg8oKi1LTMCrBR0bG1tQB
 3HEI/WgAAAA==
X-Change-ID: 20251208-smmu-rpm-8bd67db93dca
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-GUID: PCBKZlReW9UnyLSi9eW_bQh4o9IFMBKC
X-Authority-Analysis: v=2.4 cv=JZqxbEKV c=1 sm=1 tr=0 ts=6978ab90 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=-SalRf7IlQZ7Iv0L3QwA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: PCBKZlReW9UnyLSi9eW_bQh4o9IFMBKC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI3MDA5OSBTYWx0ZWRfX+mmdo0L4KiAh
 jOBnQ3NZXumPqgsXLBFWZFd364Jp5Jia5qR39uamwqRa9fA1JcsO4A+p6WqHApVhFwvC+ESGONr
 UwG4Xq4Yw/qw1zGd20AO+ZITOfE5uxjuM8Z1mSln0ReFSREiibXjGa6gXZxCZmsxhASbkqDs9zY
 8LeT6nFGhjg9eR7AiI50jhbBn62lJbA5KLP4gX4dZh7C7k+VNQu+O74p8Tqxpf53BmVCkUBpPrE
 Q1/ldiKlHo4jdCmQDGaFxMumBS+BeQeME3AyWS7yu+ewwdwqMB2HbV9KKB1XjecMQ+QiOkmfHxi
 nCtguPEYWMSrcu1yG9bXOH96n4VLTbn/c3gebLGvz2s8FzCy01ca1SD+IKxyYKtyUGfoVq7r6uG
 U1LKWMHn4Vh/M8qpK5oAlIaYUYE4O8/wHolfitczwFt+2ob5vV/7ItCr5IAh9RfFOFRuFYvlxOj
 kqNVpfPt6g8PDqUvdrA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-27_02,2026-01-27_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 lowpriorityscore=0
 malwarescore=0 spamscore=0 adultscore=0 clxscore=1011 phishscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601270099
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_041201_995749_DEB8056F 
X-CRM114-Status: GOOD (  19.84  )
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

Commit d4a44f0750bb ("iommu/arm-smmu: Invoke pm_runtime across the driver")
enabled pm_runtime for the arm-smmu device. On systems where the SMMU
sits in a power domain, all register accesses must be done while the
device is runtime-resumed to avoid unclocked register reads and
potential NoC errors.

So far, this has not been an issue for most SMMU clients because
stall-on-fault is enabled by default. While a translation fault is
being handled, the SMMU stalls further translations for that context
bank, so the fault handler would not race with a powered-down
SMMU.

Adreno SMMU now disables stall-on-fault in the presence of fault
storms to avoid saturating SMMU resources and hanging the GMU. With
stall-on-fault disabled, the SMMU can generate faults while its power
domain may no longer be enabled, which makes unclocked accesses to
fault-status registers in the SMMU fault handlers possible.

Guard the context and global fault handlers with arm_smmu_rpm_get() /
arm_smmu_rpm_put() so that all SMMU fault register accesses are done
with the SMMU powered.

Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  5 ++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      | 53 ++++++++++++++++++++++--------
 2 files changed, 43 insertions(+), 15 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 573085349df3..2d03df72612d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -317,6 +317,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
 	const struct of_device_id *client_match;
+	const struct arm_smmu_impl *impl = qsmmu->data->impl;
 	int cbndx = smmu_domain->cfg.cbndx;
 	struct adreno_smmu_priv *priv;
 
@@ -350,10 +351,12 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
+	if (impl->context_fault_needs_threaded_irq)
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+
 	if (of_device_is_compatible(np, "qcom,smmu-500") &&
 	    !of_device_is_compatible(np, "qcom,sm8250-smmu-500") &&
 	    of_device_is_compatible(np, "qcom,adreno-smmu")) {
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 5e690cf85ec9..183f12e45b02 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -462,10 +462,23 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
+	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq) {
+		ret = arm_smmu_rpm_get(smmu);
+		if (ret < 0)
+			return IRQ_NONE;
+	}
+
+	if (smmu->impl && smmu->impl->context_fault) {
+		ret = smmu->impl->context_fault(irq, dev);
+		goto out_power_off;
+	}
+
 	arm_smmu_read_context_fault_info(smmu, idx, &cfi);
 
-	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT))
-		return IRQ_NONE;
+	if (!(cfi.fsr & ARM_SMMU_CB_FSR_FAULT)) {
+		ret = IRQ_NONE;
+		goto out_power_off;
+	}
 
 	ret = report_iommu_fault(&smmu_domain->domain, NULL, cfi.iova,
 		cfi.fsynr & ARM_SMMU_CB_FSYNR0_WNR ? IOMMU_FAULT_WRITE : IOMMU_FAULT_READ);
@@ -480,7 +493,14 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
 	}
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+
+	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
+		arm_smmu_rpm_put(smmu);
+
+	return ret;
 }
 
 static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
@@ -489,14 +509,21 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	struct arm_smmu_device *smmu = dev;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
+	int ret;
+
+	ret = arm_smmu_rpm_get(smmu);
+	if (ret < 0)
+		return IRQ_NONE;
 
 	gfsr = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSR);
 	gfsynr0 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR0);
 	gfsynr1 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR1);
 	gfsynr2 = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sGFSYNR2);
 
-	if (!gfsr)
-		return IRQ_NONE;
+	if (!gfsr) {
+		ret = IRQ_NONE;
+		goto out_power_off;
+	}
 
 	if (__ratelimit(&rs)) {
 		if (IS_ENABLED(CONFIG_ARM_SMMU_DISABLE_BYPASS_BY_DEFAULT) &&
@@ -513,7 +540,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	}
 
 	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sGFSR, gfsr);
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+	arm_smmu_rpm_put(smmu);
+	return ret;
 }
 
 static void arm_smmu_init_context_bank(struct arm_smmu_domain *smmu_domain,
@@ -683,7 +714,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	enum io_pgtable_fmt fmt;
 	struct iommu_domain *domain = &smmu_domain->domain;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	irqreturn_t (*context_fault)(int irq, void *dev);
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -850,19 +880,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	 */
 	irq = smmu->irqs[cfg->irptndx];
 
-	if (smmu->impl && smmu->impl->context_fault)
-		context_fault = smmu->impl->context_fault;
-	else
-		context_fault = arm_smmu_context_fault;
-
 	if (smmu->impl && smmu->impl->context_fault_needs_threaded_irq)
 		ret = devm_request_threaded_irq(smmu->dev, irq, NULL,
-						context_fault,
+						arm_smmu_context_fault,
 						IRQF_ONESHOT | IRQF_SHARED,
 						"arm-smmu-context-fault",
 						smmu_domain);
 	else
-		ret = devm_request_irq(smmu->dev, irq, context_fault, IRQF_SHARED,
+		ret = devm_request_irq(smmu->dev, irq, arm_smmu_context_fault, IRQF_SHARED,
 				       "arm-smmu-context-fault", smmu_domain);
 
 	if (ret < 0) {

---
base-commit: fcb70a56f4d81450114034b2c61f48ce7444a0e2
change-id: 20251208-smmu-rpm-8bd67db93dca

Best regards,
--  
Prakash Gupta <prakash.gupta@oss.qualcomm.com>


