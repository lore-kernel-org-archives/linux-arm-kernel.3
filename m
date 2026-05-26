Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7494ACD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 14:42:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=; b=fqo5CFkE/hpbOUSExawSa0qF2V
	wzi2eg9huHQ0EfNHcgsHBfB1eQOO7JzLj4Gbc9frEDZGQFk/N+eDyEj13UUW+iH+7Clkrt47VSCUJ
	/DIwqVhvVn3Sx185g5JVhSg1OUNQPhX9TW22bE5l3MHEe7BCAH8PWKJjNsYYC6B3DKY07oX8TqzR5
	6J7fpMv+bIPGPRCccruIqDk+bsDrEdXYIPiy5pesy7KYQ1AnUO73ooPPx8BEmGK4cQecXgpHBiGry
	FKETEJJ3z7YglHFq+EoyQHMCo8UJSETPTtdQlR5MyLdXnfJqbO0vFhufajHmDgc4a73KAYzGVfYPT
	LDAiDjcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRszE-00000002CAL-32UD;
	Tue, 26 May 2026 14:42:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRsz8-00000002C6m-1enS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 14:42:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QD41Q13693598
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=; b=aVGcPvTgv2YSFGEJ
	jbYVspkCi4oJEZxGaLQ0iIXJJ65m+tYsFcMeyM7PdZWtaF0aLa7YaRvl9jtjd6Nd
	Z3eB3OkMTwYHglIlq4Y7rvjqzHEVQTEG+MkxM4DlY+TLbOseicNzPaexP25KdtXz
	HNEvWKc7IDLalyn//AULyBB0UcWBeR7rIBnf4JjjlQKGWfH8IYOGNNP4p782r5FU
	O1/a1beG2N+tuGKHiJoEqg8EI43b15EFR5m5TZzYWn8AKgZPSe9DyO8z1VhwU5jk
	CkIAIsWvdjcGmW4Rp8uvNxHwQy07DbQT7mj3AfqoMV6bu7ru4FyJRzCV1jXc9G8l
	g+DqlA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4edc2yggya-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 14:42:21 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-82f7bec24fdso5016012b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 26 May 2026 07:42:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779806541; x=1780411341; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=;
        b=f395LyDsVmRlG+Eujre7n3lbuSTRUD0pE9d773uRJFSFX8oyaox1bDX6T8teQk3js1
         cfNlDChP9t2ooTo2yWfJql5PQTOEGF+4s8IYtbx1WLZAx4gy19flDh0fpqjTUiRaiYv3
         7cO7kh1Wj7lsSsoixNcCxdnr1mfM5XUrSK13bi4/CwaBbuaebC6bL5/flp478JNCp9oI
         6+HVy21NZ6mtjMezNSDk/OOKcgw3ne5loAGm2u/oxasAx4/EHfotAEk12l3HnAuIBr5m
         tIddq/f4qTGt2uWE7e73MPZKy1exGuZ4DUyPxVWHwJTJpJf1FoUQYeABXFJaWelDmAdj
         yXDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806541; x=1780411341;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xRdaTvmyfldisjcDw2f2AG9vJcoFbevlImNBlXGnaqU=;
        b=YPbRnqTssi5URLqp26TP/wcZzHAg5Le5pKVUNws3ox+aLK4dswTA8GqJB4pNz9P6Dh
         PqmpQ0HiXitnDGhZy/KePwsgVHYpiZ/1NO2i0yzpptZ28+HjPvv7u8mrmEQ+tGNz3n8S
         iGRPdOY/gqA6BQSSljnK1klxdtPUYt6Ia5QV5jWMqsQ6cCzwA4CEt7ywf8/RjnGApPBq
         QptSNXLX5gZoOvTfxg5foEPmPn2wXk39kJc9Z9aIKGmPJ3GCVRLed8Q20cyTX2mW2T+3
         G/zpa1bo6sNe7oN48HhNJCpmD5PzvA9KH7wFTHVbNaulPlDvMgfL+DMTDroNIPXjK7MK
         Ae9A==
X-Gm-Message-State: AOJu0Yy0swIW2fR1F1rDe1/4fmhxCc1RN50HH3ob/ZPwMyJAq3/L8Ujn
	uFKkgj4kwqsl5j8QsiYa2coqX6Dr5pdFdyEm0lJLareM3/I1mq9H/a4zGo+A+5Vuy9ikEimnRqH
	zZpMsjAlHVEkq6Z1axctJ+MLnEpuTS/HD8LNKBqHkBKOuDTEepaZ93RttdE4YtImNAcsqfyhpC8
	wcfg==
X-Gm-Gg: Acq92OFIW3m+w/x9vkwHXhHsJ/Gc9uwz/5VaxxulZiDc8zaTbyYxmTTxNZT2Qi6tMLH
	++eqWiOgn1id+08Y6/jubmRDh/zlaPDPAuBXkYfnzFRfbf49kSwrdpPZk7WG0+2CHJx/dmbvcJW
	errHgoO2aJX60MZSIOb9kj0B9+6QPh6xwjBVqy+Qm8uoedPComsaT04S3wL+ov2Hgnt2TkD2ewG
	iX16oKhXWpEzN+C84/TMQlMPn6ryuptgaKaifudrBV1SM40WGMCfFg7+Dv/VCddEaJuS7imxG/O
	6fjDgm+LNY0kTNOmllCLAygj0YunY+QiH18GXxEX6/Kwb0tOEELeL2yoCiukRaRdbrVmkzwaGwB
	ULkUkH2cEAAiY6TKwhkHEFPFm8CGXISzAIsIo/0JIZSzg36MgWYQ4
X-Received: by 2002:a05:6a00:8c10:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-8415f6e8fc0mr17753512b3a.45.1779806540964;
        Tue, 26 May 2026 07:42:20 -0700 (PDT)
X-Received: by 2002:a05:6a00:8c10:b0:82d:62ed:b01d with SMTP id d2e1a72fcca58-8415f6e8fc0mr17753487b3a.45.1779806540473;
        Tue, 26 May 2026 07:42:20 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164acc288sm15362019b3a.10.2026.05.26.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 07:42:20 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Tue, 26 May 2026 20:12:03 +0530
Subject: [PATCH v2 2/6] iommu/arm-smmu: Add interconnect bandwidth voting
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-smmu_interconnect_addition-v2-2-2a6d8ca30d63@oss.qualcomm.com>
References: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
In-Reply-To: <20260526-smmu_interconnect_addition-v2-0-2a6d8ca30d63@oss.qualcomm.com>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779806527; l=5501;
 i=bibek.patro@oss.qualcomm.com; s=20260408; h=from:subject:message-id;
 bh=enf3+ZPlPMPCTgLbtus14tXkNZXCGM3zYc7lLFmNwZ8=;
 b=5d3nHDhy04hWjF4+t0oXqcQisvn2D3hkiltQR8u/D4ZOaNXWUXZ+Dx8dm99JGymfCvg4snhA9
 /S+Tl5jz0SfBV0ZP6FN8x/4AJYqKmyAf4mKOb2z1v7X32OMPgJFAoJo
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=V4oTa+TgRi7dib76fc92V+rslyRCAKbK8D4b2RVsMbc=
X-Proofpoint-ORIG-GUID: Jp88YHa_O6FLDrdwXBCSbEJS4QJMywP7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDEyNiBTYWx0ZWRfX1xcB0XGnqX4N
 MzNABZaJDuAbKZ1HOkqMk60PBFLffsHb/VBpy+5DI5dXEzaEmbxgUHQQZzgt/XLWocnnTxLSCZV
 1sNOMSd4pbStNwpDnTS6nOdJsAx+jxI6mKjA5H5k5EmeGU354jFVFuc5I7pHjD24CQCIzHmrIRz
 cjlgBMRJVIxhz2PrhOGfbSCVz/KpJ654cTTbDSaV9XO9IB063hoyYbgulDmquzd5RHFxBqL8ht8
 QkoqrCA9jovsHM71ghZ5mWqrGp9KDy2K1irQJKGltEo9L3OYZMMohuXar0ZYpO+roAn/MjOfPFO
 HxmmVfogy9j4RMMOcK6NNz+X95Xvwo5F/MRok7LZs9edM+mWwSdWMbxqWiCGk7EhOAuEBYvg1XP
 Y6hcdsPXvdYagIovf0SbFcTdGmcBQ3RY6k+oUZfq+PJr95XnOf1ydBR7ppBsfKne1BPCrREppTU
 cAoh2IcwO+mpkt8KS5A==
X-Authority-Analysis: v=2.4 cv=CYg4Irrl c=1 sm=1 tr=0 ts=6a15b14d cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=taUV0mOn9u7JAoyayg0A:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: Jp88YHa_O6FLDrdwXBCSbEJS4QJMywP7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 priorityscore=1501
 impostorscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605260126
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_074222_447193_B6230BDD 
X-CRM114-Status: GOOD (  26.73  )
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

On some SoCs the SMMU registers require an active interconnect
bandwidth vote to be accessible. While other clients typically
satisfy this requirement implicitly, certain corner cases (e.g.
during sleep/wakeup transitions) can leave the SMMU without a
vote, causing intermittent register access failures.

Add support for an optional interconnect path to the arm-smmu
driver and vote for bandwidth while the SMMU is active. The path
is acquired from DT if present and ignored otherwise.

The bandwidth vote is enabled before accessing SMMU registers
during probe and runtime resume, and released during runtime
suspend and on error paths.

Generally, from an architectural perspective, GEM_NOC and DDR are
expected to have an active vote whenever the adreno_smmu block is
powered on. In most common use cases, this requirement is implicitly
satisfied because other GPU-related clients (for example, the GMU
device) already hold a GEM_NOC vote when adreno_smmu is enabled.

However, there are certain corner cases, such as during sleep/wakeup
transitions, where the GEM_NOC vote can be removed before adreno_smmu
is powered down. If adreno_smmu is then accessed while the interconnect
vote is missing, it can lead to the observed failures. Because of the
precise ordering involved, this scenario is difficult to reproduce
consistently.
(also GDSC is involved in adreno usecases can have an independent vote)

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 57 +++++++++++++++++++++++++++++++++--
 drivers/iommu/arm/arm-smmu/arm-smmu.h |  2 ++
 2 files changed, 57 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3e75c3b9fb1364cdc92e82c5aa499..07c7e44ec6a5bd1488f00f87d859a20495e46601 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -53,6 +53,11 @@
 #define MSI_IOVA_BASE			0x8000000
 #define MSI_IOVA_LENGTH			0x100000
 
+/* Interconnect bandwidth vote values for the SMMU register access path */
+#define ARM_SMMU_ICC_AVG_BW		0
+#define ARM_SMMU_ICC_PEAK_BW_HIGH	1000
+#define ARM_SMMU_ICC_PEAK_BW_LOW	0
+
 static int force_stage;
 module_param(force_stage, int, S_IRUGO);
 MODULE_PARM_DESC(force_stage,
@@ -86,6 +91,36 @@ static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 	}
 }
 
+static int arm_smmu_icc_get(struct arm_smmu_device *smmu)
+{
+	smmu->icc_path = devm_of_icc_get(smmu->dev, NULL);
+	if (IS_ERR(smmu->icc_path)) {
+		int err = PTR_ERR(smmu->icc_path);
+
+		if (err == -ENODEV) {
+			smmu->icc_path = NULL;
+			return 0;
+		}
+		return dev_err_probe(smmu->dev, err,
+				     "failed to get interconnect path\n");
+	}
+	return 0;
+}
+
+static void arm_smmu_icc_enable(struct arm_smmu_device *smmu)
+{
+	if (smmu->icc_path)
+		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
+				   ARM_SMMU_ICC_PEAK_BW_HIGH));
+}
+
+static void arm_smmu_icc_disable(struct arm_smmu_device *smmu)
+{
+	if (smmu->icc_path)
+		WARN_ON(icc_set_bw(smmu->icc_path, ARM_SMMU_ICC_AVG_BW,
+				   ARM_SMMU_ICC_PEAK_BW_LOW));
+}
+
 static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
 {
 	/*
@@ -2189,6 +2224,17 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	if (err)
 		return err;
 
+	/*
+	 * Acquire and vote the interconnect path before accessing any SMMU
+	 * registers (including ARM_SMMU_GR0_ID0 in arm_smmu_device_cfg_probe).
+	 */
+	err = arm_smmu_icc_get(smmu);
+	if (err) {
+		clk_bulk_disable_unprepare(smmu->num_clks, smmu->clks);
+		return err;
+	}
+	arm_smmu_icc_enable(smmu);
+
 	err = arm_smmu_device_cfg_probe(smmu);
 	if (err)
 		return err;
@@ -2273,8 +2319,10 @@ static void arm_smmu_device_shutdown(struct platform_device *pdev)
 
 	if (pm_runtime_enabled(smmu->dev))
 		pm_runtime_force_suspend(smmu->dev);
-	else
+	else {
 		clk_bulk_disable(smmu->num_clks, smmu->clks);
+		arm_smmu_icc_disable(smmu);
+	}
 
 	clk_bulk_unprepare(smmu->num_clks, smmu->clks);
 }
@@ -2294,9 +2342,13 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 	int ret;
 
+	arm_smmu_icc_enable(smmu);
+
 	ret = clk_bulk_enable(smmu->num_clks, smmu->clks);
-	if (ret)
+	if (ret) {
+		arm_smmu_icc_disable(smmu);
 		return ret;
+	}
 
 	arm_smmu_device_reset(smmu);
 
@@ -2308,6 +2360,7 @@ static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
+	arm_smmu_icc_disable(smmu);
 
 	return 0;
 }
diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.h b/drivers/iommu/arm/arm-smmu/arm-smmu.h
index 26d2e33cd328b8278888585fc07a31485d9397e2..c00606a416b2f4bb44a35e5d67f6ef801df68e1c 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.h
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.h
@@ -15,6 +15,7 @@
 #include <linux/bits.h>
 #include <linux/clk.h>
 #include <linux/device.h>
+#include <linux/interconnect.h>
 #include <linux/io-64-nonatomic-hi-lo.h>
 #include <linux/io-pgtable.h>
 #include <linux/iommu.h>
@@ -335,6 +336,7 @@ struct arm_smmu_device {
 	int				num_clks;
 	unsigned int			*irqs;
 	struct clk_bulk_data		*clks;
+	struct icc_path			*icc_path;
 
 	spinlock_t			global_sync_lock;
 

-- 
2.34.1


