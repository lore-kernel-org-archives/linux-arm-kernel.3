Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CE5C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Jul 2025 09:58:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6uo0/Rv3qtzptZevcC/+w15cuneDye/jL7LkgBPk7SA=; b=d+mwFpjEIJk7LaPaB7xRcgxBVk
	TN74gdlqtMt0xlo/q9v/s5rWiEAEKuFd41I7a5ZoQLjlklbUHbdZ9kFwYLtSzXIZhKv1TRAUmc9os
	kBcfiiSa0g1jodbv1Ou7YCDBH+56S78XpsHWjTyg3QqO7IORRD4LBvptMB/q7eBKmgoXtyrQjiSb8
	3wC8ONNz/rrc9a7ZvI19JqmgApYMMBmHNeqdUYDn31n18YhMNsx2k5P80VZyquB2BGZiNhYQU83xi
	blZm3ww8cbMHNZGGcqkClrfjjuser9Q6KlM0VTNsZ9dUmzEQ0NK7kpjfuQGN08erFjh8N+Ez1wkhL
	gcwMSFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzea-0000000GMvp-46sR;
	Sat, 05 Jul 2025 09:57:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXzcH-0000000GMot-3cS4
	for linux-arm-kernel@lists.infradead.org;
	Sat, 05 Jul 2025 09:55:31 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5654Die8005108
	for <linux-arm-kernel@lists.infradead.org>; Sat, 5 Jul 2025 09:55:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=6uo0/Rv3qtzptZevcC/+w1
	5cuneDye/jL7LkgBPk7SA=; b=FSH7ScJxAEIYvmIVyhGLFFdiHL7pQvofNPM+bS
	Uty1FCC1AhWh7mvB3VVR1olAS3SKXHmGWY5k8NkK/zCt3vHV9wg169GNAX/eFPxn
	I1HrutFf9XxX/W1FVxxcUnIBKEzI+taaW5wD+cGgdYPqj9jxRmhy36RlwfiBsHww
	Ym3uX+dFHuaa/4EvNUgFgu52xHLcRPdkaKpHdzPbCHpotLczatASZyY8HKSUXZQA
	zbktXuX0Y6MivF24NWAQVWOPGwYzHi4G7lwtwsKcskSJPJF4qDiYHlCDG5zRRLqj
	mtPTRizcXGXMFOU9Q9I+PZ3GV7zxiTkoYFGDZhjLMLXquKvg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pvtk0fp6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 09:55:27 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d3e90c3a81so119937985a.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 05 Jul 2025 02:55:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751709326; x=1752314126;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6uo0/Rv3qtzptZevcC/+w15cuneDye/jL7LkgBPk7SA=;
        b=KZzqRSK0wA8MntaBKfxYUb16/GyBJUiNyx0zWUX3p/UoRVkuXJCz6tVA/MoCrbkm44
         HCqqvDimhuXZSVitAPh8BIHYG0B7UX+46d6ODiawNwoL01cXITqPgsD7pGuYJvsZ3v/m
         0970WdiWArBFyuQwev/1LxqieMiuGUy7y7EIDUPIm7PpqKVsKWs9sjO1dF5qvzhIVwTp
         kik3cbVzWGiYlvIEdsJDZa/uuapcaCiBtlze0ZltGVbYguFDbQjNs/QAQWpjgXj6uERo
         djgsDw4kxoR6bD8GICGT8MWcmX2xsyEO3Is+qEsMLSBz6TN7x0rbXP5oytBlCCxb3fNk
         gquw==
X-Forwarded-Encrypted: i=1; AJvYcCWA5Eh2nYhqh6p5gg0ra5ONFYnPqs/3U1IxXgintHaU4Z1EED4+cCQ0l+4mlN8jauvne5rVB+CNAQCXqpn4ISxN@lists.infradead.org
X-Gm-Message-State: AOJu0Yza6MPbE017M8igbLXeicz1unIy4QaFKkSMpZxS6cpFfA4fB2NY
	0zjsCULpWyq18guMRb4/TIb/7iDwZZbmmF89rmq0pIjPzFCDRI3nnxLhISI2j6ql3QjqY7JedNZ
	sHzlD1x0nsss9QRBdjkAdAC7Oe+SIMFQDUtfgrhBbUwUuSAGNZczY8+YTs4g/MHW5hQdQftfW9e
	nCbQ==
X-Gm-Gg: ASbGncsTj1A1sFWsgJYe/jexTPvMUQCAJ4eOOYgpXClWqpH0lATK2gu8rlEjFEMK4TJ
	HV9+y+GeqEUJAQdc7JTx0w6YiFlwLn46iXwdzu+A03YKHgxb+d3O51boR4km4XBflVkIWQF/j9u
	oF4AkppevypzlIFadzYwslJL+Gr8BwMIdFfr1SUm0TQIAxyt5eTYC0gkLEAOa5zZS1++VK1K1z6
	y+xrAXQALJ2NkECE/9JS/57d0LlTtRBw3yFxSH5C28qmoO+SRgOGwfnR9JAaGffpWuNTy/m0REu
	diB91x4SI1UWxnsBHV3hi14GD6JZHeGHou9nSP7gPW0XFmukEBstWiLqZXZESzTbr8u+Ai4UCJ9
	ghv33DUQipzshHXSL7aKcEZ9UqIE0vOAyZe4=
X-Received: by 2002:a05:620a:6082:b0:7d2:18a1:cd5 with SMTP id af79cd13be357-7d5df161e03mr588111285a.29.1751709325657;
        Sat, 05 Jul 2025 02:55:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHE8KfDhqB/NbaCPKYqo7Ux5mkzFzkMX+HPMqyGTeNSITo2+WSahMj1k4Q92D4imbOcrfQKMA==
X-Received: by 2002:a05:620a:6082:b0:7d2:18a1:cd5 with SMTP id af79cd13be357-7d5df161e03mr588108885a.29.1751709325150;
        Sat, 05 Jul 2025 02:55:25 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384ba7aesm524758e87.205.2025.07.05.02.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Jul 2025 02:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 12:55:19 +0300
Subject: [PATCH] iommu/arm-smmu: disable PRR on some of SMMU-500 platforms
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-iommu-fix-prr-v1-1-ef725033651c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAIb2aGgC/x2MQQqAMAzAviI9W+jUKfgV8aCuag/T0aEIsr87P
 IaQvBBZhSP0xQvKt0Q5jwymLGDZp2NjFJcZKqosdWRRTu8vXOXBoIotUWPNbFxNDeQmKGf1/4Y
 xpQ8xpLz/XwAAAA==
X-Change-ID: 20250705-iommu-fix-prr-600451b1d304
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>,
        Bibek Kumar Patro <quic_bibekkum@quicinc.com>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10232;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JGeBWNQ7SOUaSfLmBoBeYMzuXj2s3WsyaN23v9zFEIk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaPaKIp4CP7PdrUdGM0f7ikogTsm54Xj4B8Ly/
 667pqXwivCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGj2igAKCRCLPIo+Aiko
 1TcMB/0YzadNI5OfscFm2/tsfVF/roOdhAwrj2xq47UPIKm2lX84xxhCD9BUPSpvpa4CI14tkuG
 BDFllzG6FQ4IOkM3QVwgMUM/xSZoyRYtkYerIWS0kw+RvSNM3wBc+KAr5K+yCVaB7QDbkUje64C
 z3oWcyjdHQ11J089A7Kpq4Iq3tQqAWM0VOOm6r6FyluezFKGfa2FbrjjI41HQatMghTbKoMXZm1
 vM3yX40xhnuP4dQhVCEjv5bl+DGcJN3tPXfGrNy8LnkTYip39OG7yf4TY3Q186q56OEkCH9nd7K
 eYhDOR7EUhoAD5GuN0ijtzp/s6MrFqBQ/vAbtLk5+bOJ/rVi
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDA2MyBTYWx0ZWRfXy9DC1RtjOsBR
 6hn5fK6r6ZhC+1gVJPZJvb772GILAtESgtOkILa74S6KBoDZcP2uZG4POCEyAFPe3G5LjZ5PSwv
 LDiPsztk2dvXtt2uJNV7UmkxOfPTx74++392pMwnZJEPpbXkuPEP99o9SU9aeE2TrWNboblWfej
 XmpsMeqDdZxSbxV/hwIyBta8gffYEiSahHedIUCgJa3iTXH6Sd3JunY1+13Poc/7ksmEyTn95Qp
 INLrKziTqZFdiNvBAEJccdLIJcI/AebyMOmi+2jRQ6RF3lZxzLtLZEDE2Vg/FmEt7eA/amllO0c
 IKFIxd7BKAB2h8MoqrckEEHi1dqlbIORcbAbpjG77w8uUI+hfx7eeKczGMFmpKw8yfzXI5lvu/6
 ULhOdG2WTkgYz8ZYdHZR7Q98jld4mxmU9r6JixPegHVDFkvnxGZRHXszI0vlUBnWeiBfzg9A
X-Authority-Analysis: v=2.4 cv=Vq0jA/2n c=1 sm=1 tr=0 ts=6868f68f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XLurikqG2CS-mm0B5QcA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: fUGcJW1VIdhb9fhS4jwSUdYQKdouOAnz
X-Proofpoint-GUID: fUGcJW1VIdhb9fhS4jwSUdYQKdouOAnz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 lowpriorityscore=0
 clxscore=1015 mlxscore=0 malwarescore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250705_025529_930846_D9007B26 
X-CRM114-Status: GOOD (  20.58  )
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

On some of the platforms (e.g. SM8250 / QRB5165-RB5) using PRR bits
resets the device, most likely because of the hyp limitations. Disable
PRR support on that platform. Instead of adding more compatible checks,
set PRR-related callbacks through the match data, making it easier for
other platforms to apply the same workaround.

Fixes: 7f2ef1bfc758 ("iommu/arm-smmu: Add support for PRR bit setup")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
I currently don't have access to other devices from these generations.
It might be necessary to apply the same workaround to other platforms.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 134 ++++++++++++++++++-----------
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h |  11 ++-
 2 files changed, 91 insertions(+), 54 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 62874b18f6459ad9a8b0542ab81c24e3e745c53d..f1cb30cd99af6020a8b472f11d4999ad70d0bce0 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -55,6 +55,11 @@ static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 	return container_of(smmu, struct qcom_smmu, smmu);
 }
 
+static const struct qcom_smmu_impl *to_qcom_smmu_impl(const struct arm_smmu_impl *base)
+{
+	return container_of(base, struct qcom_smmu_impl, base);
+}
+
 static void qcom_smmu_tlb_sync(struct arm_smmu_device *smmu, int page,
 				int sync, int status)
 {
@@ -313,9 +318,9 @@ static void qcom_smmu_set_actlr_dev(struct device *dev, struct arm_smmu_device *
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
-	const struct device_node *np = smmu_domain->smmu->dev->of_node;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 	struct qcom_smmu *qsmmu = to_qcom_smmu(smmu);
+	const struct qcom_smmu_impl *qsmmu_impl = to_qcom_smmu_impl(smmu->impl);
 	const struct of_device_id *client_match;
 	int cbndx = smmu_domain->cfg.cbndx;
 	struct adreno_smmu_priv *priv;
@@ -351,14 +356,8 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
 	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->set_prr_bit = NULL;
-	priv->set_prr_addr = NULL;
-
-	if (of_device_is_compatible(np, "qcom,smmu-500") &&
-			of_device_is_compatible(np, "qcom,adreno-smmu")) {
-		priv->set_prr_bit = qcom_adreno_smmu_set_prr_bit;
-		priv->set_prr_addr = qcom_adreno_smmu_set_prr_addr;
-	}
+	priv->set_prr_bit = qsmmu_impl->set_prr_bit;
+	priv->set_prr_addr = qsmmu_impl->set_prr_addr;
 
 	return 0;
 }
@@ -558,65 +557,89 @@ static int qcom_sdm845_smmu500_reset(struct arm_smmu_device *smmu)
 	return ret;
 }
 
-static const struct arm_smmu_impl qcom_smmu_v2_impl = {
-	.init_context = qcom_smmu_init_context,
-	.cfg_probe = qcom_smmu_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.write_s2cr = qcom_smmu_write_s2cr,
-	.tlb_sync = qcom_smmu_tlb_sync,
+static const struct qcom_smmu_impl qcom_smmu_v2_impl = {
+	.base = {
+		.init_context = qcom_smmu_init_context,
+		.cfg_probe = qcom_smmu_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.write_s2cr = qcom_smmu_write_s2cr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+	},
 };
 
-static const struct arm_smmu_impl qcom_smmu_500_impl = {
-	.init_context = qcom_smmu_init_context,
-	.cfg_probe = qcom_smmu_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = arm_mmu500_reset,
-	.write_s2cr = qcom_smmu_write_s2cr,
-	.tlb_sync = qcom_smmu_tlb_sync,
+static const struct qcom_smmu_impl qcom_smmu_500_impl = {
+	.base = {
+		.init_context = qcom_smmu_init_context,
+		.cfg_probe = qcom_smmu_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = arm_mmu500_reset,
+		.write_s2cr = qcom_smmu_write_s2cr,
+		.tlb_sync = qcom_smmu_tlb_sync,
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
-	.context_fault = qcom_smmu_context_fault,
-	.context_fault_needs_threaded_irq = true,
+		.context_fault = qcom_smmu_context_fault,
+		.context_fault_needs_threaded_irq = true,
 #endif
+	},
 };
 
-static const struct arm_smmu_impl sdm845_smmu_500_impl = {
-	.init_context = qcom_smmu_init_context,
-	.cfg_probe = qcom_smmu_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = qcom_sdm845_smmu500_reset,
-	.write_s2cr = qcom_smmu_write_s2cr,
-	.tlb_sync = qcom_smmu_tlb_sync,
+static const struct qcom_smmu_impl sdm845_smmu_500_impl = {
+	.base = {
+		.init_context = qcom_smmu_init_context,
+		.cfg_probe = qcom_smmu_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = qcom_sdm845_smmu500_reset,
+		.write_s2cr = qcom_smmu_write_s2cr,
+		.tlb_sync = qcom_smmu_tlb_sync,
 #ifdef CONFIG_ARM_SMMU_QCOM_DEBUG
-	.context_fault = qcom_smmu_context_fault,
-	.context_fault_needs_threaded_irq = true,
+		.context_fault = qcom_smmu_context_fault,
+		.context_fault_needs_threaded_irq = true,
 #endif
+	},
+};
+
+static const struct qcom_smmu_impl qcom_adreno_smmu_v2_impl = {
+	.base = {
+		.init_context = qcom_adreno_smmu_init_context,
+		.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+		.write_sctlr = qcom_adreno_smmu_write_sctlr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+		.context_fault_needs_threaded_irq = true,
+	},
 };
 
-static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
-	.init_context = qcom_adreno_smmu_init_context,
-	.cfg_probe = qcom_adreno_smmuv2_cfg_probe,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
-	.write_sctlr = qcom_adreno_smmu_write_sctlr,
-	.tlb_sync = qcom_smmu_tlb_sync,
-	.context_fault_needs_threaded_irq = true,
+static const struct qcom_smmu_impl qcom_adreno_smmu_500_noprr_impl = {
+	.base = {
+		.init_context = qcom_adreno_smmu_init_context,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = arm_mmu500_reset,
+		.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+		.write_sctlr = qcom_adreno_smmu_write_sctlr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+		.context_fault_needs_threaded_irq = true,
+	},
 };
 
-static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
-	.init_context = qcom_adreno_smmu_init_context,
-	.def_domain_type = qcom_smmu_def_domain_type,
-	.reset = arm_mmu500_reset,
-	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
-	.write_sctlr = qcom_adreno_smmu_write_sctlr,
-	.tlb_sync = qcom_smmu_tlb_sync,
-	.context_fault_needs_threaded_irq = true,
+static const struct qcom_smmu_impl qcom_adreno_smmu_500_impl = {
+	.base = {
+		.init_context = qcom_adreno_smmu_init_context,
+		.def_domain_type = qcom_smmu_def_domain_type,
+		.reset = arm_mmu500_reset,
+		.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
+		.write_sctlr = qcom_adreno_smmu_write_sctlr,
+		.tlb_sync = qcom_smmu_tlb_sync,
+		.context_fault_needs_threaded_irq = true,
+	},
+	.set_prr_bit = qcom_adreno_smmu_set_prr_bit,
+	.set_prr_addr = qcom_adreno_smmu_set_prr_addr,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 		const struct qcom_smmu_match_data *data)
 {
 	const struct device_node *np = smmu->dev->of_node;
-	const struct arm_smmu_impl *impl;
+	const struct qcom_smmu_impl *impl;
 	struct qcom_smmu *qsmmu;
 
 	if (!data)
@@ -639,7 +662,7 @@ static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,
 	if (!qsmmu)
 		return ERR_PTR(-ENOMEM);
 
-	qsmmu->smmu.impl = impl;
+	qsmmu->smmu.impl = &impl->base;
 	qsmmu->data = data;
 
 	return &qsmmu->smmu;
@@ -686,6 +709,13 @@ static const struct qcom_smmu_match_data qcom_smmu_500_impl0_data = {
 	.client_match = qcom_smmu_actlr_client_of_match,
 };
 
+static const struct qcom_smmu_match_data qcom_smmu_500_impl0_noprr_data = {
+	.impl = &qcom_smmu_500_impl,
+	.adreno_impl = &qcom_adreno_smmu_500_noprr_impl,
+	.cfg = &qcom_smmu_impl0_cfg,
+	.client_match = qcom_smmu_actlr_client_of_match,
+};
+
 /*
  * Do not add any more qcom,SOC-smmu-500 entries to this list, unless they need
  * special handling and can not be covered by the qcom,smmu-500 entry.
@@ -712,7 +742,7 @@ static const struct of_device_id __maybe_unused qcom_smmu_impl_of_match[] = {
 	{ .compatible = "qcom,sm6375-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm7150-smmu-v2", .data = &qcom_smmu_v2_data },
 	{ .compatible = "qcom,sm8150-smmu-500", .data = &qcom_smmu_500_impl0_data },
-	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_data },
+	{ .compatible = "qcom,sm8250-smmu-500", .data = &qcom_smmu_500_impl0_noprr_data },
 	{ .compatible = "qcom,sm8350-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,sm8450-smmu-500", .data = &qcom_smmu_500_impl0_data },
 	{ .compatible = "qcom,smmu-500", .data = &qcom_smmu_500_impl0_data },
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
index 8addd453f5f1c9659fbfbc68a84a3ab1267b356e..e805ad604339463b706a43e359ccca657d42a602 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.h
@@ -24,10 +24,17 @@ struct qcom_smmu_config {
 	const u32 *reg_offset;
 };
 
+struct qcom_smmu_impl {
+	struct arm_smmu_impl base;
+
+	void (*set_prr_bit)(const void *cookie, bool set);
+	void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
+};
+
 struct qcom_smmu_match_data {
 	const struct qcom_smmu_config *cfg;
-	const struct arm_smmu_impl *impl;
-	const struct arm_smmu_impl *adreno_impl;
+	const struct qcom_smmu_impl *impl;
+	const struct qcom_smmu_impl *adreno_impl;
 	const struct of_device_id * const client_match;
 };
 

---
base-commit: 7244e36657076b597ac21d118be9c0b0f15fc622
change-id: 20250705-iommu-fix-prr-600451b1d304

Best regards,
-- 
With best wishes
Dmitry


