Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFA9C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 09:03:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5pgrFdf6l/LP8HdUy9LmfAejKky5DKLGarNpceFhpEo=; b=kuNq6Jr/HokeEwxGNQ6IyrHpbf
	fsHCRfMeOXNYnxdG/yc1901A9SR439iJZ3uCpH4DdIXRW8zFRBhQEUkU5aZ/wQEEZbT+V/mW5phBq
	BGC6gQP5Mon4SaMH89IWo5ppR34alIn9KoOBoRQJlvGzjUpq2NHJ74d+xT6PNSoJvWty8z0NdiSBK
	BF0TLMn+IdwsRd0WziYZm9LkR9D1me6BOYPwfOvPPadNlAwCvLpDBRglPXTVlZzpDyXWVcujeVKOs
	WgGUztOGO5QkBeK2nlpW9L+vC/Y8bSzI9onSoiizx/AXj7aVV+eul1uJNo9HvtHu/b3bHRHNocOFl
	PTsdkdTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUMu-0000000GKfI-13qn;
	Tue, 30 Jun 2026 09:03:00 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weUMr-0000000GKem-1Sy6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 30 Jun 2026 09:02:58 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CT251089895
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:02:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=5pgrFdf6l/LP8HdUy9LmfA
	ejKky5DKLGarNpceFhpEo=; b=JkrWGodwPk4peLAk+qMWZC0AXyzy2Q+fkc7M+d
	TH/GbQibgMmRAQbv+eBwrN5zg/UBUc7Ggqmo9DHdNDX7Cm8dteG+c9/c9jAn3enK
	FWMO45aCZTNrTaL7lS/GFpP/exxKV0hctZbyh+xP/grKQPDmgfjyqXucGm5LZ3B8
	HZLDQoBxBoKpuco6yizfi4P5lE7XbkxOtgdCqlP0egZTYGNcZtMDKWonrpq4Q76z
	61j64nFvKyxiqkne8TKaV4jShKJ5cqbARHfVzuIcJEGMHrwUCHRND19WJrH4eJWc
	h4ERVFLU0ghKuek20KERTdqTS6kUdTao3+1qp/fT5x9zu/fg==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f43vfhpuh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 09:02:55 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-30ba395b047so618330eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 30 Jun 2026 02:02:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782810175; x=1783414975; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=5pgrFdf6l/LP8HdUy9LmfAejKky5DKLGarNpceFhpEo=;
        b=LFlMxHA07qpqejggU2i78ZTyEShTqYBlm1/wEBy0Rgv5QAQ1gs3K4URr7QCMf3jpDr
         QuJ4iUDtlm9vRybHWogzw6TpqB0k+0GfeEXpcaTlPNlSwywi22HSeEiA5BPkKZGoygqr
         c7dykk2hhMnh3FEpZwVqI8w4JPDQCbv7gcG6HyinlkXKcFCPXGUPInCQo6JM7a4ATozX
         oyuMW+LpTsGjtrGaflbCFGSbBv91QJUjWanGsDXg8djlSerZScz6r5hw2ZaHrgvrfoJn
         Ume8D0nMBxNwiHKBgQvQSMyHueiClXfkL0sA/0uz7KCucYptREj3GO/U8aP4pbCRgjCn
         52Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782810175; x=1783414975;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5pgrFdf6l/LP8HdUy9LmfAejKky5DKLGarNpceFhpEo=;
        b=Zs6DEOj1sdB8t3y6Xs7InJFOs7PvHz2+TSYC3WCoD/5aS1AyzqWhkD5xRv9QLLVX13
         9PxyUg1zOYk2VNufQyjYSNxtTuywoVhVyRZ7rADxrYvGOPuhtdU9czZkxK5WavN+INvb
         7JZKlfso5kQrvDoTxz+zOY7OKB1TbvQDJXB7qIgHbBfpUgv4TwaP0p+UI3lVLVEbCT+2
         MtzLfsUWVD2mFHdbcTbYnlwwm+YFEICwUDelqPEbpaYoWtNn7rnhXmBFzEyhGrpYP9Z1
         t8k8UUPyKvQOvVeZR6XaJPRp7zllGTf0xyjxtvwenRe3gAdRuvVL11PGeH5V/1s/4eXv
         N5eg==
X-Forwarded-Encrypted: i=1; AHgh+RpfdPqXymwrNOwFG6eYbA6WnBOcU3w3eer3rsgWaOtMYRk5SviHsX6823tp2Y+TnQxujTAxky/RefZ5FitZcvxl@lists.infradead.org
X-Gm-Message-State: AOJu0YzXLEvAfevGYWcDmZ38SyvUUpEbv076/V3K+RWfaDWwVe4VOB0S
	3DgzhXQNGWMQfU+4d4OyUxCuxiLI3eOhgjlGG9O6Yeyp9wRtsTmE0ILcinkNNypqpccNorhKguv
	uVIAgiU05GyFhYf8VT9giFny8Q7IneO3fYYZN/dLSXiRTAfgK5CI4mLz52p358xLQEKcrZkluoT
	Av+A==
X-Gm-Gg: AfdE7ckLJOzCvSArKASVZ4YA70eyMDDVQavZQsTc8OMSbduxH62KfrSoq4X2EqZRlH3
	JWutQM65Ch0vzSZBkBC7csa1Y/QEUYFqIkfoW2rtr+dygBtl+5BmOiStHgzMbzdwwKzsEAZsjHy
	qSj5mFHCZghyftiavDrEc8xvXvtGE4B4Qw4qWG3KBv8MMf7V3SXp7jPQSCFEQZW5K2MJaMWplJX
	H9uOib8+oOh4hj5L6AEatI+KJZhEAvpQ3HOvVYLgeNYQ+oDrIRdnmyfNtCW83n88zSzwTu41/0G
	CbgJlKYIMTrtkx84xQ5GW5nQbtJrCWcnWHKxpuC9zaeA7T06mz4SR2DjFzwTD2EwV4opL9ZsTX4
	ASEYNr9WyIXz2NwPvdU9w5pJ7YVzwH0rgBQKnqiAPow==
X-Received: by 2002:a05:7300:430f:b0:30c:9f31:b631 with SMTP id 5a478bee46e88-30ee13a1086mr2218005eec.33.1782810174633;
        Tue, 30 Jun 2026 02:02:54 -0700 (PDT)
X-Received: by 2002:a05:7300:430f:b0:30c:9f31:b631 with SMTP id 5a478bee46e88-30ee13a1086mr2217975eec.33.1782810173961;
        Tue, 30 Jun 2026 02:02:53 -0700 (PDT)
Received: from hu-guptap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee3264f52sm6022612eec.28.2026.06.30.02.02.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:02:53 -0700 (PDT)
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:32:46 +0530
Subject: [PATCH v3] iommu/arm-smmu: Use pm_runtime in fault handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIADaGQ2oC/22Myw7CIBBFf6VhLQ0MfaAr/8O4KI9aEpHKWKJp+
 u/SburCzSRncs+ZCdroLJJTMZNok0MXHhnEoSB66B43S53JTIBBzYFJit5PNI6eSmWa1qijMLo
 jeT5G27v3lrpcMw8OXyF+tnLi63eNNIxDu0cSp5yC7aGvtKwFq88BsXxO3V0H78t8yNpKsPuCi
 x8fsi81gGhUxUCxP/6yLF+i5uQI5wAAAA==
X-Change-ID: 20251208-smmu-rpm-8bd67db93dca
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Pranjal Shrivastava <praan@google.com>,
        Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>,
        Prakash Gupta <prakash.gupta@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-47773
X-Proofpoint-ORIG-GUID: bEH08d69BiNq-_ElDHGQn9ap3P_rV9JE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfXx6M7oAqfI4T2
 uh37GD+dWk7wYN4zSi58niySSprQRj7U6xxtYckmOlfGlzNiX05cA4i0ixBK1G8LMsE1dI8aeck
 1u4yPf8hXRs/o2VlbTggRhJQc2p0puea+sKvwAqtefkGjHWpeY4m+HAIm2YoTt08q9nbgM9sikz
 EdBLzZVLfvjirDZ+EIuVWLoKB2V+dzRtD+QCvTB3pKxtwso6egRdFzKKoHAm0zWX7Q6duP9oHv0
 1H4SWBgbtKVFHiUnvPsTlznsP1FyssZ4Irmqgp+ktchnRTJCHpd2TiqQKenJXqSk+nP8NAtIud1
 0MeyYRb2JwwYL5ztfoZyQ4PZ0X1hAsJzYUAohG9lJqx5o6EyA/+NBAHqWWUpNA0DJqVKUKyNGNP
 ZXlHLMPzesTgusOEV48MmYdKG1RDyqpNigdCszz2lh5+P+yPAUNmmt4xc71SCCGwehDtZCIrnFu
 QrFcLx2J0mK4e5na3aQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA4MCBTYWx0ZWRfX4+OlZvOA8XZq
 mHg2oZnxOmyQwPAq4KAmMikuWTZkewrc+SHBpw6T1nKCYVHoFGHRB9jPEITZhG77rrEhbMEWr7d
 ZJwb1mmB2ChMX+txFEMbJH1AKOotiXA=
X-Proofpoint-GUID: bEH08d69BiNq-_ElDHGQn9ap3P_rV9JE
X-Authority-Analysis: v=2.4 cv=PcXPQChd c=1 sm=1 tr=0 ts=6a43863f cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=44HM8yHCulYeUOODjvgA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 clxscore=1015 impostorscore=0 bulkscore=0
 adultscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_020257_401599_C75B853A 
X-CRM114-Status: GOOD (  24.21  )
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
device is runtime active to avoid unclocked register reads and
potential NoC errors.

So far, this has not been an issue for most SMMU clients because
stall-on-fault is enabled by default. While a translation fault is
being handled, the SMMU stalls further translations for that context
bank, so the fault handler would not race with a powered-down SMMU.

Adreno SMMU now disables stall-on-fault in the presence of fault
storms to avoid saturating SMMU resources and hanging the GMU. With
stall-on-fault disabled, the SMMU can generate faults while its power
domain may no longer be enabled, which makes unclocked accesses to
fault-status registers in the SMMU fault handlers possible.

Guard the context and global fault handlers with
arm_smmu_rpm_get_if_active() and arm_smmu_rpm_put() so that all SMMU
fault register accesses are done with the SMMU powered. If the SMMU is
not runtime active, the fault can be safely ignored as
arm_smmu_device_reset() clears fault registers on resume.

Additionally, disable fault reporting in arm_smmu_runtime_suspend()
before powering down. pm_runtime_get_if_active() returns 0 during
RPM_SUSPENDING, so without this, level-triggered fault interrupts would
cause an interrupt storm while the device is being suspended.
arm_smmu_device_reset() re-enables fault reporting on resume.

Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
---
Changes in v3:
- Add arm_smmu_rpm_get_if_active() wrapper that returns 1 when pm_runtime
  is disabled, ensuring fault handlers work on non-pm_runtime systems
- Disable fault reporting in arm_smmu_runtime_suspend() before powering
  down to prevent interrupt storms during RPM_SUSPENDING state
- Use pm_runtime_put_autosuspend() in arm_smmu_rpm_put() instead of
  private __pm_runtime_put_autosuspend()
- Link to v2: https://patch.msgid.link/20260313-smmu-rpm-v2-1-8c2236b402b0@oss.qualcomm.com

Changes in v2:
- Switched from arm_smmu_rpm_get()/arm_smmu_rpm_put() wrappers to
  pm_runtime_get_if_active()/pm_runtime_put_autosuspend() APIs
- Added support for smmu->impl->global_fault callback in global fault handler
- Remove threaded irq context fault restriction to allow modifying stall
  mode for adreno smmu
- Link to v1: https://patch.msgid.link/20260127-smmu-rpm-v1-1-2ef2f4c85305@oss.qualcomm.com
---
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 92 +++++++++++++++++++++++++----------
 1 file changed, 67 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..045389e89484 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu.c
@@ -79,11 +79,16 @@ static inline int arm_smmu_rpm_get(struct arm_smmu_device *smmu)
 
 static inline void arm_smmu_rpm_put(struct arm_smmu_device *smmu)
 {
-	if (pm_runtime_enabled(smmu->dev)) {
-		pm_runtime_mark_last_busy(smmu->dev);
-		__pm_runtime_put_autosuspend(smmu->dev);
+	if (pm_runtime_enabled(smmu->dev))
+		pm_runtime_put_autosuspend(smmu->dev);
+}
 
-	}
+static inline int arm_smmu_rpm_get_if_active(struct arm_smmu_device *smmu)
+{
+	if (!pm_runtime_enabled(smmu->dev))
+		return 1;
+
+	return pm_runtime_get_if_active(smmu->dev);
 }
 
 static void arm_smmu_rpm_use_autosuspend(struct arm_smmu_device *smmu)
@@ -462,10 +467,20 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 	int idx = smmu_domain->cfg.cbndx;
 	int ret;
 
+	if (!arm_smmu_rpm_get_if_active(smmu))
+		return IRQ_NONE;
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
@@ -480,7 +495,12 @@ static irqreturn_t arm_smmu_context_fault(int irq, void *dev)
 				  ret == -EAGAIN ? 0 : ARM_SMMU_RESUME_TERMINATE);
 	}
 
-	return IRQ_HANDLED;
+	ret = IRQ_HANDLED;
+
+out_power_off:
+	arm_smmu_rpm_put(smmu);
+
+	return ret;
 }
 
 static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
@@ -489,14 +509,25 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
 	struct arm_smmu_device *smmu = dev;
 	static DEFINE_RATELIMIT_STATE(rs, DEFAULT_RATELIMIT_INTERVAL,
 				      DEFAULT_RATELIMIT_BURST);
+	int ret;
+
+	if (!arm_smmu_rpm_get_if_active(smmu))
+		return IRQ_NONE;
+
+	if (smmu->impl && smmu->impl->global_fault) {
+		ret = smmu->impl->global_fault(irq, dev);
+		goto out_power_off;
+	}
 
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
@@ -513,7 +544,11 @@ static irqreturn_t arm_smmu_global_fault(int irq, void *dev)
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
@@ -683,7 +718,6 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
 	enum io_pgtable_fmt fmt;
 	struct iommu_domain *domain = &smmu_domain->domain;
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
-	irqreturn_t (*context_fault)(int irq, void *dev);
 
 	mutex_lock(&smmu_domain->init_mutex);
 	if (smmu_domain->smmu)
@@ -850,19 +884,14 @@ static int arm_smmu_init_domain_context(struct arm_smmu_domain *smmu_domain,
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
@@ -2125,7 +2154,6 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 	struct device *dev = &pdev->dev;
 	int num_irqs, i, err;
 	u32 global_irqs, pmu_irqs;
-	irqreturn_t (*global_fault)(int irq, void *dev);
 
 	smmu = devm_kzalloc(dev, sizeof(*smmu), GFP_KERNEL);
 	if (!smmu) {
@@ -2205,18 +2233,13 @@ static int arm_smmu_device_probe(struct platform_device *pdev)
 		smmu->num_context_irqs = smmu->num_context_banks;
 	}
 
-	if (smmu->impl && smmu->impl->global_fault)
-		global_fault = smmu->impl->global_fault;
-	else
-		global_fault = arm_smmu_global_fault;
-
 	for (i = 0; i < global_irqs; i++) {
 		int irq = platform_get_irq(pdev, i);
 
 		if (irq < 0)
 			return irq;
 
-		err = devm_request_irq(dev, irq, global_fault, IRQF_SHARED,
+		err = devm_request_irq(dev, irq, arm_smmu_global_fault, IRQF_SHARED,
 				       "arm-smmu global fault", smmu);
 		if (err)
 			return dev_err_probe(dev, err,
@@ -2306,6 +2329,25 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
 static int __maybe_unused arm_smmu_runtime_suspend(struct device *dev)
 {
 	struct arm_smmu_device *smmu = dev_get_drvdata(dev);
+	int i;
+	u32 reg;
+
+	/*
+	 * Disable fault reporting before powering down to prevent unclocked
+	 * register accesses in the fault handlers if an interrupt races with
+	 * the suspend callback (e.g. device in RPM_SUSPENDING state).
+	 * arm_smmu_device_reset() re-enables fault reporting on resume.
+	 */
+	reg = arm_smmu_gr0_read(smmu, ARM_SMMU_GR0_sCR0);
+	reg &= ~(ARM_SMMU_sCR0_GFRE | ARM_SMMU_sCR0_GFIE |
+		 ARM_SMMU_sCR0_GCFGFRE | ARM_SMMU_sCR0_GCFGFIE);
+	arm_smmu_gr0_write(smmu, ARM_SMMU_GR0_sCR0, reg);
+
+	for (i = 0; i < smmu->num_context_banks; i++) {
+		reg = arm_smmu_cb_read(smmu, i, ARM_SMMU_CB_SCTLR);
+		reg &= ~(ARM_SMMU_SCTLR_CFIE | ARM_SMMU_SCTLR_CFRE);
+		arm_smmu_cb_write(smmu, i, ARM_SMMU_CB_SCTLR, reg);
+	}
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 

---
base-commit: ba3e43a9e601636f5edb54e259a74f96ca3b8fd8
change-id: 20251208-smmu-rpm-8bd67db93dca

Best regards,
--  
Prakash Gupta <prakash.gupta@oss.qualcomm.com>


