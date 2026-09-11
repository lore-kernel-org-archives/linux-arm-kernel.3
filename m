Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4F0CC88E50
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 22:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=; b=xs+DdhYpuxCs5efLcWpaOoA6CO
	M8qK6eHA3Tsygs8xxe3ZoyGF2/1sUZ5CHCcBJWnzjoBTrEafEIEASUul4/bEWWk/0Xi2lZtI9ESDI
	CiP6jMluznm5UXm4Q3c9P9kyntTWPvKVSGTgSZSvVKw5XPmUU3Hx8AZ9vNvXx37GgP2rF3ogSg5iu
	V7da6ejjP6GQrjOIf3t0ab6G2aWqAJaF9duS+oFjb5I+gZS41ahwJKESkudIg4XlxGGdwl/vkuVTB
	UOhk/RWq1ssZIH9TIsVvR7Q6EarPwcHiqQpskWBTIx98WZns/5Rk/kRk5NLQEn0woUnBxMqEF7SWM
	o8WXWOeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59gt-00000000GNR-2Zee;
	Fri, 11 Sep 2026 22:25:51 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x59gr-00000000GN0-3jwo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 22:25:51 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68BHWVl2972042
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 22:25:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=zrkXTFmlVQPcnpPC8U/nG2
	oDFHYiPrW26FCuVN6FIbM=; b=Nz4fFmc+3q+4nYFt4RGFkV8rHsuq9n7y0j/sT9
	6RBjPxeI7LETEmQx0wMaKjK5zN9HbHV3qWtGgXdaQweVtAvJkoy4jfQfBPurC9OE
	D4TGEi930v87yr864sGf8EI6Q/b8ssQ3er447C2YMnr6PoLar8y6GbBe2vUWIBZd
	U56U7UP7axarq8JU/UwW12/Hl84C2Fv5RAhwkmxmaCUBAo3PVdTWR64T0ZCuodKv
	xUcth9ZfBDiqv14PkaEVnDycK8PVEVVrGSCQNCLXi2gtaEZtiGZisYXhOO2jatss
	ZvV32ym29jvOUiMKwHMtmnzqPov8GqH/aWsI+9SAzEZ+XJlA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmm22sj7e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 22:25:48 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cc21bc2923fso1481168a12.2
        for <linux-arm-kernel@lists.infradead.org>; Fri, 11 Sep 2026 15:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789165547; x=1789770347; darn=lists.infradead.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=;
        b=VOhgPt+c2CQKvWBxyopt4i6DuqpngecyIMI93N3vwy6yzwItA69ZCuL1vgfC4xi8Po
         5SYH8l7UDRn/K1f1hcgHQZHPl4eAG+WJ5TPmo2ZbxVDcbx4VL5fovd1QcJFOCKAn48XM
         CL7Scpq8G/g7FKnn12pCTD2J1CBrnGsHLHOEYrb5irJA1BjXSqrgXY7OHGRn+XvBJnbD
         cXYFFeDY2nhwtKDt+owj+jMTavIzzayOD3vak3bqiyI9VvaUyFI0rz0AKMyIwaEEU/M5
         TpWiiUVNDWugiwU+YqG/htYQqxxJK4vjefOoeIlHX6HZnEu5xI0DPvBpOpdGWJEUCDr4
         1bow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165547; x=1789770347;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=zrkXTFmlVQPcnpPC8U/nG2oDFHYiPrW26FCuVN6FIbM=;
        b=e2szIk13hI0VohmWWtA4VkWG+FOexoce2js208NT8W1pM/R8JhglUA8+W2dpc4smsR
         1RyT1cFQPH6hpN6f/sQ4g2Bis6XSi5WABYycZtJ35adHz+3Jo3VWkgqTrfOVVEOevypq
         30nNuXbVBRFixfd8KLINUD+U6HCPqWz+wrfG47VK5/qmR1wgHWF2CiSa+oJBb6/6RMTn
         eyHtoumBtuQ4juOWsNQunssg/ue3zx3XoE2ORtlDq6jnmGBU0AjebF1mANjXc6V9XJz+
         nn95kZcm7+qZRH7tiCvnHlP5ZwnzvrEcP9lhaG5PU2O0QU4P6y+NorqxpeI0BnBJYJCn
         904A==
X-Forwarded-Encrypted: i=1; AKwUvBzF5iakNzG76Tq1N3rZ27ncnHEClM8qOgo02r+wEoSSMXUj2P8ST11ZxgAnRLSXKpKHYI7tRtKfLrcz1hItMv9l@lists.infradead.org
X-Gm-Message-State: AFuF++lknJAxoDSzv/ttoKcufcVXAYqScuVGEUykjNTfgptvwv1dA3Vg
	jrnW+coDHyVWlszqqCrYlArdh+P6sg1WCk2Pb/fHni0zYrPW5N3lw0y48E3Pwn2ePjd80VVnKLH
	JwvcwJ+3pbcGDvf2qCgJsKiaG7h+08joUvUpY7psz5u+baAl2LvOroCoVGYv8WMd+4Icnd2lk2X
	9KQA==
X-Gm-Gg: AYBFou1Ix3LiQqT0aU4xSapU36ABkeFMqqDBxd7XOakqWHSMj0Fhgl13x9Md2nRUqwH
	USQe5SQGzigQsx28S+3B+IXXiOjXRISPvi+zIh2uSMiw9tRXtHk/+qvQvGbdIzfjMDFgQc1CO0V
	+TcbzCZ5jgJDFbLYKS0sJlileSnNAd3c92u4WA4ts/hGZtsp7sYV0ccEsuWPuK5r2gDKaliNaf+
	nnSzcnzAv+4gW4uplmCIrFfojreGX4AdbsMlb1fVPZEiuf/y0Ca8lHgNZoB6X/lT4tMMt+L7VBR
	QMqFVTuGQrDb5TQQWFLwTfPwio76UUbDa/lrI0yV2CCCJC3xCuxYsZ5+qD6tnTAUXJYmcts12FT
	vCpdzumWBYjMAhbMYQZQC8+g3XWNn7ew=
X-Received: by 2002:a05:6a21:138e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3db0e48256bmr382368637.28.1789165546951;
        Fri, 11 Sep 2026 15:25:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:138e:b0:3d3:b00a:7082 with SMTP id adf61e73a8af0-3db0e48256bmr382332637.28.1789165546468;
        Fri, 11 Sep 2026 15:25:46 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f739b5sm9213321eec.25.2026.09.11.15.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 15:25:45 -0700 (PDT)
From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
Date: Sat, 12 Sep 2026 03:55:38 +0530
Subject: [PATCH] iommu: arm-smmu-qcom: Skip fault-info reads when suspended
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260912-priv_call_runtime_handlers-v1-1-fc0c3a17523f@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAOF/pGoC/yXMQQqDMBBA0avIrA3EGCt6FZFg49hOiVFmVAri3
 Zu2yweff4IgEwq02QmMBwktMaHIM/DPIT5Q0ZgMRpubbgqjVqbD+SEEx3vcaEaXsjEgi6qnsrJ
 1Za22GtJgZZzo/Zt3/d+y31/ot+8RrusDGsMagn4AAAA=
X-Change-ID: 20260912-priv_call_runtime_handlers-7f3547544040
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789165542; l=3706;
 i=bibek.patro@oss.qualcomm.com; s=20260617; h=from:subject:message-id;
 bh=ZL2A2cFHlRhAKSuQ9oyrYwVIfm2ZzCci0b8JvPtYKrc=;
 b=wtl28Fbdd6qYisueH5Nk753b3YTVUJyX0jmUcgObLW99BpkEMzkerPCmXfpJNlpCsF2blsOhf
 aSlOmE9xVBnB3e3iXcUCRaQvOyaulsDfn9heSVcHUyAhbNIgn7IHefe
X-Developer-Key: i=bibek.patro@oss.qualcomm.com; a=ed25519;
 pk=DkrbE5dhskZJmBAKR5LygWRsAydEOSN+T0/YxNYxDLM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTExMDMxNyBTYWx0ZWRfXxDABBwyo3uF4
 5v55Oc8xJEi/ZsGkfg7e3oNu3e9sZrDNiJ35ezN0JlnAQVzxqEgu+OTeNRMh0Oxy8NEa0TCjVbO
 ZvCTFxZp9kIFp+jX7YLIvahKB2UQGM2t5eE6AzhWYok/nAw6H+gz6M1Pmq5Ti8roznJhIFryLZq
 1wgznchBRrL2TplPa5iHqwbaBPvjv8n0QDon4h7Y6nfQN/JFpYRPM106/oD5x+OtVgt9HyzB71H
 w4/Zj9Y1Ljko4p6pfAKb1HBkveI9CRvCOaCZ17uxFQo4L7jB8uGy28iX0mLXKRCqIgNoMWY3V1a
 v3PJpqSomyUX+jWzq1AcDACWLdOv/3j3PFtKhqqY4ux66Mm9w6QPoJVrVyfk+guqUXwFE9toge1
 9ZpbxcwlvuQtNxSYmmujx80R63D0cB/iJQ29TwKF0MmJjzPWiXREGAVnsXz/xfyDnlTqMqYFZy/
 KXLs2K0z8BcdUE5uwEg==
X-Authority-Analysis: v=2.4 cv=LPDz05W9 c=1 sm=1 tr=0 ts=6aa47fec cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=FyyklSoAK86a5T4BgM4A:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: ZGfpIh_w4Pv2pWPuhPV8UJ1MZZOCpm-2
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTExMDMxNyBTYWx0ZWRfX1axlVIeSDFrQ
 eVlo+9PpaFiHVSHPwlvI410YfeeCEKW/pcqX4YEAsctP55gZlCCbF7cGBW6j1bN/gxdy2D9dePZ
 xpKEgYra0n5QWF8D/6d8WsqOZ8CsRO4=
X-Proofpoint-GUID: ZGfpIh_w4Pv2pWPuhPV8UJ1MZZOCpm-2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-11_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 malwarescore=0 spamscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609110317
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260911_152549_998145_B9EB39A2 
X-CRM114-Status: GOOD (  16.80  )
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

qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
holding a runtime PM reference. A fault is raised while the SMMU is
active, but the GPU may drop its power vote before the threaded fault
handler reaches the callback, allowing the SMMU to runtime suspend.

Accessing the SMMU registers after suspend has started is unsafe and
may cause subsequent register accesses during runtime resume to fail
with a NoC error and an asynchronous SError.

Use pm_runtime_get_if_active() to keep the SMMU active while collecting
the fault information, and skip the register reads if suspend has
already started.

Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---
qcom_adreno_smmu_get_fault_info() accesses SMMU registers without
holding a runtime PM reference. A fault is raised while the SMMU is
active, but the GPU may drop its power vote before the threaded fault
handler reaches the callback, allowing the SMMU to runtime suspend.

The failure sequence:

  GPU context fault
          |
          v
  qcom_adreno_smmu_get_fault_info()
          |
          | GPU drops its power vote
          | SMMU starts runtime suspend
          v
  SMMU register access without an active RPM reference
          |
          v
  later Adreno PRR private-interface operation
          |
          v
  pm_runtime_resume_and_get()
          |
          v
  arm_smmu_runtime_resume()
          |
          v
  arm_smmu_device_reset()
          |
          v
  SMMU register access
          |
          v
  NoC error / asynchronous SError

Use pm_runtime_get_if_active() to keep the SMMU active while collecting
the fault information. If suspend has already started, skip the register
reads instead of accessing the SMMU while it is being powered down.
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 795e8ec7e8fa..b1787a4ba0d3 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -129,6 +129,18 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	struct arm_smmu_cfg *cfg = &smmu_domain->cfg;
 	struct arm_smmu_device *smmu = smmu_domain->smmu;
 
+	/*
+	 * A fault can only fire while the SMMU is active (GPU is issuing
+	 * transactions). Use get_if_active so that if by a rare race the
+	 * device has already suspended, we skip the register reads rather
+	 * than triggering a cold resume which would call device_reset and
+	 * destroy the fault state we are trying to capture.
+	 */
+	if (pm_runtime_get_if_active(smmu->dev) <= 0) {
+		dev_warn(smmu->dev, "get_fault_info: device not active, skipping\n");
+		return;
+	}
+
 	info->fsr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSR);
 	info->fsynr0 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR0);
 	info->fsynr1 = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_FSYNR1);
@@ -136,6 +148,8 @@ static void qcom_adreno_smmu_get_fault_info(const void *cookie,
 	info->cbfrsynra = arm_smmu_gr1_read(smmu, ARM_SMMU_GR1_CBFRSYNRA(cfg->cbndx));
 	info->ttbr0 = arm_smmu_cb_readq(smmu, cfg->cbndx, ARM_SMMU_CB_TTBR0);
 	info->contextidr = arm_smmu_cb_read(smmu, cfg->cbndx, ARM_SMMU_CB_CONTEXTIDR);
+
+	pm_runtime_put_autosuspend(smmu->dev);
 }
 
 static void qcom_adreno_smmu_set_stall(const void *cookie, bool enabled)

---
base-commit: f61bb3920fa8cb44b84d32e0fa9fbaab4eb00c80
change-id: 20260912-priv_call_runtime_handlers-7f3547544040

Best regards,
--  
Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>


