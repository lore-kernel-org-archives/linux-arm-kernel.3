Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8E9DF99344
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 10:02:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SBrLvxov8RzEUMj28YZTWGQ4HpP1x3kOvuEW3FT/Sd0=; b=ppEL8NhLytOiDJA5SqjIZLjl4E
	WftqLfds0raUSOFEost0KY75HLZVjWOoVp+TLl0dSGKyZ27wqkZb5WUBC1YCrc3cQiP+Hng9lZyd0
	nU29pvY6bZ52tQ0cfeMiuPdVsgCAoopeaEenu3epGEoXcJTbMKIbUInsPHjNs0/XgQJKtxs7J9aat
	ikgidWaMW7961ZwwQch0X4G6zyQ2RMeOCXIvZS01vv4AnvB7a4llqOQ/3z1a5HqtX9zXw0dUxiHVs
	IE6kRrDrbRcBRgf1ZFQt4PaEuJbYM18vfh/1PTgJlAJRnWmZXqRo91+oiWtZtTxV6lqhW4L0pbHqJ
	+rNZ4vZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqtT-0000000BRxX-1cYj;
	Thu, 23 Apr 2026 10:02:47 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFqtN-0000000BRwg-3tGS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 10:02:46 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63N96WEn1204784
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:02:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SBrLvxov8RzEUMj28YZTWG
	Q4HpP1x3kOvuEW3FT/Sd0=; b=CeovaRx0W4fRn0yj0D2XxEzfbE1KXzM/O4ffBb
	Hb+QxupCo1yNxcE86lPBaxlv8yaWj6M+xYt3Tc3HB3jUqftPbNLQi6UCG4/zJfTQ
	C32Z75wwVZOq2JE+1zfemivU4/+6WkgqeE2c3losG+WYkMa0hoENGfM/nI7Gel6j
	g3CiVD9zjvm8jnskQNK3nAhea3I/6Qf5aUZk4HMn8o10lFYdLut3mQ83MDw/nZtW
	NueTtlTpKd92qLEIaJSB94pqxvMGM6Eg1IvsIeNBCM9g+l+7UrHLKC+hlX74OABK
	yRKUL7CfRGSjOTtk2m9BZqA7Hk0JiGB5C66yX3/9iUxr0qJg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dqggn87jv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 10:02:40 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b458add85aso65724195ad.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 23 Apr 2026 03:02:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776938560; x=1777543360; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SBrLvxov8RzEUMj28YZTWGQ4HpP1x3kOvuEW3FT/Sd0=;
        b=aSyGOAZMD8Q9KQ8/8qK1l5u5nt9buZ1EOLwj4ozdCGLCHiTJg2eOBkBt/aEet4ppEk
         YfJ59+FaDAGLXpjRxhXXGWOg6ZDkENkA8PuUjz2MuAoTDM7yAjJZj/mydS1wSmvgw4eh
         tyUM1qE8QyXVDFUurQmD98yaPiFLtQLDi5eO54gQ8g9r5oXYwpJehPF7DynF//5mPsQH
         qM3PdbhNUvBBdP9c1BnKniC6wdIlA5Gwcye+R2GsooySF5OqmsPRMu7ZQFOqjE4YUi2+
         aOEAi37pkLrhjj/iNyJbg7MeBGiPa3aHKbYw6bItz00mrQ3aiuBM6I6+VB9a6RmL81lr
         lXqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776938560; x=1777543360;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SBrLvxov8RzEUMj28YZTWGQ4HpP1x3kOvuEW3FT/Sd0=;
        b=aiPw48MIfqfS/JMH9Pn3WmNZcc6PkdkGAUkD2sJpNYdod2OfTx9TP925lYHusP7teN
         UwDVHnBdvCeyJ/6Ny4i7vdHwawMruAFrBW4DJ3Uc5iIzvqpobT+nhGXBodhvSOlhAHVl
         S0VODKgk57ZXOfuIgcaWZGsFJN4/OEA8ylq4waCMzf/4ESNOxrWYAkp0cGFItp3MVzNz
         ijhvw8/0SYD3mpD/brZ2GijYnMeKL13QogW3jpO/EpOFCIRkrONBwKSB26t3G3JaJjne
         kRKErpcU1vtkecBlgMJ+uvh312BBkl790gRAMAjYm+nq7HGaFvAwaBG6Rudj4FA3uECt
         bwmw==
X-Forwarded-Encrypted: i=1; AFNElJ8gXUO0ynu9E9Bvz3kghlXTWmmlSzsgEpnd44vGPkCCky2FPApOgFAUoYL9cPbpPjIRhUEOGLbBsVpU850xVaQX@lists.infradead.org
X-Gm-Message-State: AOJu0YyFbYAytTsQsEccYZ/UM5/ZaomYV4HImFsBIY99Jm4tz9cZEqoE
	Sp4CT110yWeSaQQsQVtehqs0Op13Jiaoo7t94eryzE7J5tQnlwUNIeBqoYTWvgOrKbWQmGaqOL8
	3C9/+FkbecGR8gg09h/eacylNd6awZk6I3v44idGYpS/Jyx2vtRyAa0F1ku2Q9+tudSPRvIb3fi
	wayg==
X-Gm-Gg: AeBDievS2GH+rOVoYy1SBxxnGj2LuDk0N9KV6zGEe78q7zQOeld446/7I6A5iciLWdU
	bs2J8SblfNQ2YB0wnr/uTR3q1qX2W9tjEQ64jV1MsgRqy4QJ6gvjNHhBe1/8FFs3N3grXDkwvbe
	mRZmhPZhRcYAmMNzaRJeOsYqf+N4KDvEQnJsHJDwF8yxjPqL7NOLAFfwxB9G4nR8p6WYm1nrMH/
	w0C3JjCVycXxRipHn375tCkvh0vi5OIVRZT4oqj7HfxUcSxhPOg2k2yv7MwJOn1ftHOnDnOcpOi
	MrxwbPdyjR95T1pOFKoyKwV/1kFEee6NAho6KAzXNul6Or98B0WkyQSPuLDdEvFVS8psEAQG/SR
	FLeXLSKE0HdadcwnWvNacrnhEyyBJBw6kCeV8M+Z9YJ6A/Qj0Z+CFp6VvN9mGgpE=
X-Received: by 2002:a17:903:3204:b0:2b7:895f:407b with SMTP id d9443c01a7336-2b7895f4214mr101857855ad.21.1776938559976;
        Thu, 23 Apr 2026 03:02:39 -0700 (PDT)
X-Received: by 2002:a17:903:3204:b0:2b7:895f:407b with SMTP id d9443c01a7336-2b7895f4214mr101857205ad.21.1776938559257;
        Thu, 23 Apr 2026 03:02:39 -0700 (PDT)
Received: from hu-bibekkum-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fab29398sm194785095ad.66.2026.04.23.03.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Apr 2026 03:02:38 -0700 (PDT)
From: bibek.patro@oss.qualcomm.com
To: Rob Clark <robin.clark@oss.qualcomm.com>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>
Cc: Dmitry Baryshkov <lumag@kernel.org>, iommu@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, srinivas.kandagatla@oss.qualcomm.com,
        Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] iommu/arm-smmu-qcom: Fix fastrpc compatible string in ACTLR client match table
Date: Thu, 23 Apr 2026 15:32:30 +0530
Message-Id: <20260423100230.3462214-1-bibek.patro@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: GcmS7PRGoPOr6pYAOgyHhuvgYFoKen40
X-Authority-Analysis: v=2.4 cv=YZeNIQRf c=1 sm=1 tr=0 ts=69e9ee40 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bCvnzbEyROO2_-PIDOgA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDIzMDA5OCBTYWx0ZWRfX4PK4qMkXzW4v
 GX2FK4U//2yuvu100Y0xaEyr147kAB66euDi5yhz00nJrS0KiXLYtI4hvlWmkzaruj1J1eTA63V
 UeTGS2yF1x7fe+j297TLwn9m7xgSjY25sTCT7X58irs4bpbHlObvIC7gKXiVipbk3BH9KyG13EI
 XG9ezcGqHWU9HYtjsju4tJcUA+vn9h/z8nAIYTV6byXtCJqcVpZMyTWB6eL3ZRxkZiGRzG3CNcL
 ton/Ee5PQPIW5ArfcxlfEepsVGtUKv3EMKy5lQTZVlLttFQ21fJjJwATcwp5BWIOQKcgzn+ysBH
 Nw/F04amKwqsxQ7SiOyt7Nfo8nacC6pr+B9JHNXczZ3NFUYPjGttpjKqSL/QvPhfakBWi0nf/Cp
 cJ9CIVO4O8ELHiQJhSbl57lKWsUWyU03KHK4nNrI7s+r4Ki7NjsgRdptcLVFiKzA/Ytu8xugcnM
 H6D+L+8cAkIT0UZN8Lw==
X-Proofpoint-GUID: GcmS7PRGoPOr6pYAOgyHhuvgYFoKen40
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-23_02,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 malwarescore=0 impostorscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2604230098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_030241_975941_8E0045A3 
X-CRM114-Status: GOOD (  18.89  )
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

From: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>

The qcom_smmu_actlr_client_of_match table contained "qcom,fastrpc" as
the compatible string for applying ACTLR prefetch settings to FastRPC
devices. However, "qcom,fastrpc" is the compatible string for the parent
rpmsg channel node, which is not an IOMMU client — it carries no
"iommus" property in the device tree and is never attached to an SMMU
context bank.

The actual IOMMU clients are the compute context bank (CB) child nodes,
which use the compatible string "qcom,fastrpc-compute-cb". These nodes
carry the "iommus" property and are probed by fastrpc_cb_driver via
fastrpc_cb_probe(), which sets up the DMA mask and IOMMU mappings for
each FastRPC session. The device tree structure is:

  fastrpc {
      compatible = "qcom,fastrpc";        /* rpmsg channel, no iommus */
      ...
      compute-cb@3 {
          compatible = "qcom,fastrpc-compute-cb";
          iommus = <&apps_smmu 0x1823 0x0>;  /* actual IOMMU client */
      };
  };

Since qcom_smmu_set_actlr_dev() calls of_match_device() against the
device being attached to the SMMU context bank, the "qcom,fastrpc"
entry was never matching any device. As a result, the ACTLR prefetch
settings (PREFETCH_DEEP | CPRE | CMTLB) were silently never applied
for FastRPC compute context banks.

Fix this by replacing "qcom,fastrpc" with "qcom,fastrpc-compute-cb"
in the match table so that the ACTLR settings are correctly applied
to the compute CB devices that are the true IOMMU clients.

Assisted-by: Claude:claude-sonnet-4-6
Fixes: 3e35c3e725de ("iommu/arm-smmu: Add ACTLR data and support for qcom_smmu_500")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Signed-off-by: Bibek Kumar Patro <bibek.patro@oss.qualcomm.com>
---

While there is an ongoing discussion [1] on how to differentiate ACTLR
prefetch settings between compute DSP and audio DSP fastrpc devices, it
is necessary to first fix the compatible string to
"qcom,fastrpc-compute-cb".
Both compute DSP and audio DSP fastrpc nodes use this compatible string,
so both will receive the ACTLR settings after this fix. However, for
audio DSP devices the effect remains the same as the current
state since they do not actively use prefetch — the write is effectively
a NOP for them. The fix is meaningful for compute DSP devices, which
actively use prefetch and were previously being silently skipped.

[1]:
https://lore.kernel.org/all/9b4c895a-c822-40e6-bb92-8fdcd09c82d3@oss.qualcomm.com/


v1->v2:
  - Collect "Reviewed-by" tags.
  - Address nit on "Assisted-by" tags format.
  - [v1]:
    https://lore.kernel.org/all/20260408130825.3268733-1-bibek.patro@oss.qualcomm.com/

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index edd41b5a3b6a..2d006049dd61 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -39,7 +39,7 @@ static const struct of_device_id qcom_smmu_actlr_client_of_match[] = {
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,adreno-smmu",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
-	{ .compatible = "qcom,fastrpc",
+	{ .compatible = "qcom,fastrpc-compute-cb",
 			.data = (const void *) (PREFETCH_DEEP | CPRE | CMTLB) },
 	{ .compatible = "qcom,qcm2290-mdss",
 			.data = (const void *) (PREFETCH_SHALLOW | CPRE | CMTLB) },
--
2.34.1


