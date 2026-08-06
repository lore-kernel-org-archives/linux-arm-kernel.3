Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6B5C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 10:23:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=gWhfiMx2w5cOtpnBFaw016s4+kUO8dNkcA9O8SsxAjQ=; b=jByoQrv2BOTF6zoDX3h6nIPnLJ
	H1Fm3TSchRwxUREqYDPrDSj8QVzixCbi7UYwzNLr5rGJNKAkXhEHQzoRAHXIL86Rsu48zm+TZ1h/0
	3+IOlU/X/9WbEX0TNEyJ2mQoGIjqC64AS4HyWNQf/m+wQQxcilVN223I9Ys2ZI5G+tDY5V4G7BoFd
	PqHl4KIJPKOmlOIBx29iGh3Afs8j+kJHfztURBSWpb7vK4etirBo05eudn26tIzEzrXXpORC2bUjE
	0HujNJeh+/zMSsVxPyCJvuruXUxARlyK4TbpN8qIc6FaXvum5PNi0fGUuXwGbXTN5NdwHP5abBRh8
	MczzY5dQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvFU-00000005XVS-2fmx;
	Thu, 06 Aug 2026 10:22:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrvFR-00000005XTo-3Uht
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 10:22:51 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nxZa1278191
	for <linux-arm-kernel@lists.infradead.org>; Thu, 6 Aug 2026 10:22:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=gWhfiMx2w5cOtpnBFaw016
	s4+kUO8dNkcA9O8SsxAjQ=; b=Ik4U82jdxbFNz5LF+BlfJY8pG86xTQtGpNGjVg
	doQgD9ibeMoOjH+Be+3IWWNSepV/dniCVDXZcM+d+05K/aPLXQAleBRCaJjVZBrF
	N6kiG/4ZhdfpZjQmHv/N6eMGeVA7nFgzZK0q/93MMhHLb7qFWbN47TT2cmcJpoGC
	1SshvUvC9ErajcFH6FrMWqEYlcHe8+EYutxwlgTEWzpRC73A3dr6Pz49j48H2kUT
	0QsFjzBBPjxJFy0PJUzB7hpX5Gm6Rhx/BdlHq5zI/mKsw+5UQA9vicZvMnwpRC8Z
	tt+20OtlnsGJP/aaSS7PQLmOQ4N/5BkUfCRg2CPkUSj8ny7A==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvjuehgwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 10:22:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-38e2f61c09dso2537313a91.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 06 Aug 2026 03:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786011768; x=1786616568; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=gWhfiMx2w5cOtpnBFaw016s4+kUO8dNkcA9O8SsxAjQ=;
        b=X9fZ23/Vmg+sbUWz8YUEoJwG26V7FnvdkTyoQ1z+c9ZMoXPqi4Tzfwp8FqnWINGa0b
         iqjy8a/nAT6JXp+urcYBxdjNIT+i9EPF2MsWT70BkZKG4nULXVk3eayUVgJj0J60v/FV
         YYAy1S+Mkes4bp6SxTZaJTgyLyaYd5NbvPMRex3Ew5kP4qxR0bPvzlTcU7tsZXuc5Xi3
         KbuaS63tsNeOTcE1QrB5iWQzpbW2DTOrOoEwACSL1wQl5V4BRba559Irj4DmZiLP2AGf
         4dCgjWwZ2vFwJpku0EwUjlIJpj1yz2tnHpERvuHLUGX3sPsS4UShkxVB/jyPcSZq9eST
         Gbiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786011768; x=1786616568;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=gWhfiMx2w5cOtpnBFaw016s4+kUO8dNkcA9O8SsxAjQ=;
        b=ea6dyorP5G59ppHrEzteESVzwsGh+b/fCvHZL360lmQb/9Q4WdDRbEofVXQitOV3wc
         KGhHdHwJvPtrcbBIG+nA5Z13cJ6zu1c+wEQtFGSsaIA7X20H6DaNMrMIPcL10H6YsuIK
         25dFFgVn+JEaQLIbBg+fe14pJmG1WjfDO3cstgh89CqJRL+wHbQ9sc65KVlYx/YDnVgP
         RvcKyLeuuLqfIdp5RZUskqbuxKyEj9KcSg+ZDKLlSWEFxW2+MrFA1Fz1FLpxbP8MVns4
         M6RCQQ8UzAVHaUi0ZO+ub/wfeTlBq72SFLg2FSxLgbiz8IbS7aqLDfOt23U3CTQG8E+f
         FluA==
X-Forwarded-Encrypted: i=1; AHgh+Rrn/7ubG39Qxn3S/Yi9I6tXoKN9Js3X01Vfy5gJCIThn3JRhJS8hg39+6TwfPYEwCjcdbS0uA7sJHJnyE7NU6PJ@lists.infradead.org
X-Gm-Message-State: AOJu0YxKdyG5gfau7CpIL9o5COt6DpYfuCgSkuoHWgaHAUSkTOaaZvC6
	VDU41Wg9wCkQSBeaZAajCUpqYQaXKAhWdc5T/VrGoJWdg64LQm/yUaTHXyib1OSoA8qNT6hy29o
	yvVo4PWfp9yf9slNxV5LWGT3aW4VjDPufnC4pmc5EWd1h9qezyL1J5BtBnQUEuYor0zXj6S3vOA
	qnRQ==
X-Gm-Gg: AR+sD10vT51dmCtgMuNRDcjhEotYg4g/m1hQKH7YpFdfXH9xsRIlfQah7/Z+TfDTGnJ
	p0NH9EA+vcEkLaVn8nX/5K8Uz+LlzpapiNltpeUCRZgq1/rp3ZgBDMdxC2lHQ4mHYiRGsKa9uBG
	0jqQvGq1kMTue0/3fSRqSG9Ed9H5QFp+T3BdGT/G7IYqF+E+B4JVtWBOBH5qG3aQ6MF3PTk0CoU
	Au6JSPGRdCpbm+PlU5blKFL+ooH9SDOZS31zT2NZWGi7asXDFJvSKq41hqkvg8wCBKlmqh+474J
	AD9GD8jWuBwHHYRkLkNYsopIdDq21xygkAx4RYgGbzDc5Na7983pYjf8SyW5EZqLeHu63bWNgbD
	c9wcWFLJC3Es+uH+Ux7Q39V9EW0icOKQ=
X-Received: by 2002:a17:90b:5447:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3903c66b3bfmr15056832a91.21.1786011767936;
        Thu, 06 Aug 2026 03:22:47 -0700 (PDT)
X-Received: by 2002:a17:90b:5447:b0:380:83fc:4315 with SMTP id 98e67ed59e1d1-3903c66b3bfmr15056788a91.21.1786011767428;
        Thu, 06 Aug 2026 03:22:47 -0700 (PDT)
Received: from hu-guptap-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3158644a195sm24605621eec.13.2026.08.06.03.22.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 03:22:46 -0700 (PDT)
From: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 15:52:41 +0530
Subject: [PATCH v4] iommu/arm-smmu: Use pm_runtime in fault handlers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-smmu-rpm-v4-1-8183d007331c@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAHBgdGoC/3XMsQ6DIBSF4VcxzMXARRE79T2aDohQSYpYqKaN8
 d2LLjq0C8kh9/tnFHWwOqJzNqOgJxut79MoThlSnezvGts2bQQESgpE4OjciMPgsGhaXrVNzVo
 lUTofgjb2vaWut7Q7G18+fLbyRNffNcIJhWqPTBRTDNqAKZQoGSkvPsb8OcqH8s7l6UFra4LdM
 8oOHpIXCoDxpiDQkD+e7Z4zcvAsecNrURWyFMTIH35Zli87rUebJwEAAA==
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
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=aNzAb79m c=1 sm=1 tr=0 ts=6a746078 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=EVyLOO7RdM4CSD-C3s8A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: 7w2bkeSeeGpFaaMeL-iMmE7qma5O-_XJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDA4MSBTYWx0ZWRfX+KKRJRynV+Qm
 A3WvRcFghTIsE8CBZjF2pIfZZARtYyMNu59WeqlcAATqqo/FfXBWOCNpVlWEgXa1iPIzAiZt1QU
 GWl7hbZQRW9V4UYYH7wZfyqlUPcvZE+M/Yvxo2L1h8c4pY8DLh+r6+g0EzBLgQwUPIf6mkzaH7O
 H7vqJepNaeCHgRgdpsLpOzqZ2stzG2pYU30Ce1yQUxTV6d5uGsvxtFfl2FegKRM5p+/nbVEjsWy
 Wa/uqO48WW6YLbxWfgzrNkkVeLrZ14R/K5cqTJT2rttKqC/CejdCrRwFUB0ZHtxK7V9dcm5i4eT
 BXzjqt3LQ5SxEXjuizdT/vJj08/3MJaB1P7CNe8uEjgvrwjTDXl5CSV+0xdlIxiKvy0ZAaC+XrP
 MRXdR84mAaUZ9gDqRl2UKwlyFbiq0Xv9B63tbFfCJ8l6Ia0InTPntca6Y6YpVoimwsiV3rn1ryd
 Cei4n71Li7lfsZNp7Gw==
X-Proofpoint-ORIG-GUID: 7w2bkeSeeGpFaaMeL-iMmE7qma5O-_XJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDA4MSBTYWx0ZWRfX43WOimyiUyas
 4n4OB1/4C9V2yMZNdRPJVLpX1ho1Fbst+ZVFnfBCs5fHsurJpZkQWfrTzmM3M3woGkmXwQLJViL
 4BJNmXiIRoX4LvqloGv7GhS/CcVdJxM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 impostorscore=0 suspectscore=0 adultscore=0 clxscore=1011 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608060081
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_032249_882921_E277D68D 
X-CRM114-Status: GOOD (  22.80  )
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

Also call synchronize_irq() for each context IRQ after masking fault
reporting but before clk_bulk_disable(). This closes a race where a
fault handler that passed arm_smmu_rpm_get_if_active() before the IRQ
was masked could still be executing MMIO accesses after the clocks are
cut.

Fixes: b13044092c1e ("drm/msm: Temporarily disable stall-on-fault after a page fault")
Co-developed-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Pratyush Brahma <pratyush.brahma@oss.qualcomm.com>
Signed-off-by: Prakash Gupta <prakash.gupta@oss.qualcomm.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
---
Changes in v4:
- Add synchronize_irq() loop in arm_smmu_runtime_suspend() after masking
  fault reporting but before clk_bulk_disable(), closing a race where an
  in-flight fault handler could access MMIO registers after clocks are cut
- Link to v3: https://patch.msgid.link/20260630-smmu-rpm-v3-1-f69874a580fa@oss.qualcomm.com

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
 drivers/iommu/arm/arm-smmu/arm-smmu.c | 101 +++++++++++++++++++++++++---------
 1 file changed, 76 insertions(+), 25 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu.c b/drivers/iommu/arm/arm-smmu/arm-smmu.c
index 0bd21d206eb3..2b692a5293a2 100644
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
@@ -2306,6 +2329,34 @@ static int __maybe_unused arm_smmu_runtime_resume(struct device *dev)
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
+
+	/*
+	 * Wait for any in-flight fault handlers to complete before cutting
+	 * the clocks. Without this, a handler that passed rpm_get_if_active()
+	 * before the IRQ was masked could still be accessing MMIO registers
+	 * after clk_bulk_disable().
+	 */
+	for (i = 0; i < smmu->num_context_irqs; i++)
+		synchronize_irq(smmu->irqs[i]);
 
 	clk_bulk_disable(smmu->num_clks, smmu->clks);
 

---
base-commit: 0d839570765118029aa8bf4a95444c6a11aacf85
change-id: 20251208-smmu-rpm-8bd67db93dca

Best regards,
-- 
Prakash Gupta <prakash.gupta@oss.qualcomm.com>


