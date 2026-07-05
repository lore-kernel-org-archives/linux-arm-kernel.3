Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94855C44500
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 08:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=; b=sXZeRStMUjg7dh
	WNkzKlfqWy4xQUA5UUjMCG0FMIuMzOC4qhLjDyeLOwqf3FnxvODMZm1G23z0H+/kz0yIaDEs5/IfM
	TQPjw9/2xIxftx+RnKsnC3Cp8MKAVPtScYQvMZAwU4QT3L/O7H4FwS2vYckIB7juXSUJD56+PXM3t
	r/0KioIwSHnqGmKuCv9/YvrF7qiE3tprQvg5YVUxOxHsSlMn27XcyoGDiqZSWFjdnQmnOdQD/yCVH
	4ro/jccxcQv1XsUW0Us8nWnksWBt3NSs1WJtO3ruh1Eb0eNRa50hqB8BpxRL61U/+HoSFFPklxfYG
	xN7JRhOL5WbNIlF9ErwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHzr-000000096CL-1hIB;
	Sun, 05 Jul 2026 08:14:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgHzo-000000096Bv-2Imc
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 08:14:37 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6650q8Kp297726
	for <linux-arm-kernel@lists.infradead.org>; Sun, 5 Jul 2026 08:14:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Mmu9NS1f13WBdz/LPDqPCJ
	b63FFDMcYOR5yWaGxSv4I=; b=KsFB6ywt4epudRYYTWTMSQw8+mpUkjXrF+Lfvw
	QpVQMQhh7zKPQ+GD7fcYQF4MdsQGJwDBrZx0zZ96jaj/PvF2/hQov+NVHrybgudb
	th7LHRztP7xVnZ56IiCLaDuXkYDjDAUK9Afij97RvN+E2MF49DV2ENABIUHX7JBl
	tgK3JBHvr7RAc36R+Cs20MQH1ZV8MdvoRabm0JPmnBP+6Wc4xjnlaTf/oXJ5TD8f
	0wxIw6Jbgr7in4Mm7QWFdry8lwhmC9bI2iUlUEwFhFFStbtPP57hSrAUwa2pavhm
	UG+yFV0hVUEJCk4wMr/Xa0H7Pp/oC3xRtR5C6+PWlxM6rDsA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f6td3aamx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 08:14:35 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2c9a700dc0eso14544585ad.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 05 Jul 2026 01:14:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783239275; x=1783844075; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=;
        b=SUh/jByYYuQ3mvHqhjHpL9qX6drwk4fyz0u13bCLNl+sMCT9KmbY0CGMlnHzyZzrrw
         zEP1f4eww4769AiTUGTeGpY+V64wH8nPby8u5De2W7k/rENziuHszEvExmzm7S5D381y
         vD68ufRZJPtnP6RMLPg6e5eTFxsyJaMS5BEEprexjm343P8iGc4kslYsuYaI57Igeb8Y
         Nu1G19dglDLtuieLVKU4nk8myXteLbVj7Kw4GxfpK9zo48+FKdTeQo09tMcerlU+JI8G
         BQvssSEMkrmbgnP/g/AYdSzaUHeSn5JZb/+INpUU8Ab2fDUDK2caPlChGTkjAHIFXvgx
         Kzug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783239275; x=1783844075;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mmu9NS1f13WBdz/LPDqPCJb63FFDMcYOR5yWaGxSv4I=;
        b=CbcEGqsGKq6PqAxVDmc2zwJfmbj3OYDuHlQWrla+dReUEmckfAK5w1Rc5dSBwwYkGN
         QKzy3k0BKvzAzNw+cjPuseVcqj1MKieCxhq5dmnNnWTgobjzQxxXkf4YAiZICEnXOQxu
         IVCYDabo5WWkAH/eLFQi+34l1JkkLtLMdp8LOGzcT2Swp3GOzawJuP8HqIHbTvd3LZ1a
         4csDGRkuFhFt6Q7wF2ETMKzwoo+3sN2qgOWp9efO9SmsSfd3t5248RYPcGlOw6CxFX/n
         mm79GFM6zJYtjbX1xw/A23bUNH0h0/bLipm/YBOxgwP9l+ghLFDq50BE3QYd4i2r2Jto
         8Aiw==
X-Forwarded-Encrypted: i=1; AHgh+Rov3TVPzgtw9LoNjc4oBZ33gdzqdoC3+vaC6pOzHi5f2uZEg94xJjzn0sToBCiwu61RjTDKyaN+1goVMdlm578L@lists.infradead.org
X-Gm-Message-State: AOJu0Yx3VchXhZb16Lqyyq5buj+GU8pF5Kp1PaKjUWHw1l8OiLY5LB6r
	gvO5kZqB0SpsX3f010dhoWWITy6dvoUnzB/aKt8Y1ybxivwMhXJpS4CNl0aJotDVJM/e0RBvpZx
	E526LX1vxqBdzqtnTbiFERHdf0hsCXAmWmdX4bpMHoHamJISnz5GzVoSgzhPdmtVruVrzkmPADl
	b6Eg==
X-Gm-Gg: AfdE7cmwfsvgryt2rm07rUbXgqORet64WDemRv56IDHd/7GeNoA/Lhkiohy3DNuy9hx
	m+QkHx2r2yOSV6kqf/PeSOZyp+ThD1yqX3seeSFGqTlpjVT2n+kCKvu16dIv4ueCVCB0EfZTgm6
	+bkpWRQSA+6Viq/+QSZh9Ii4TrDoyKGJ50qFXOxRkvf4MTvVOm86yBioHtnTAMeNKPrx1vigOLO
	9gJuTzYHRFEWrBRkUTx57adF9E3W70rxdBYw3bjbcu6H8huzSx7pAVIbh+wudjUqpVxLjDrtKvi
	AcnxLtP2Y7PEHB5zUQeYu0YEbdvNdJbDg5zky6Vmx6hEdTcCVWL5L0Mx6C7jeD+v6bJHqLVd49B
	mTQL/Y1DTSSqcu2w2nO3CSojd/TOOV7r+9pI=
X-Received: by 2002:a17:903:2cd:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cbb9eeb474mr55795705ad.42.1783239275122;
        Sun, 05 Jul 2026 01:14:35 -0700 (PDT)
X-Received: by 2002:a17:903:2cd:b0:2c9:97a7:b1eb with SMTP id d9443c01a7336-2cbb9eeb474mr55795445ad.42.1783239274618;
        Sun, 05 Jul 2026 01:14:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c85d4fesm36403980c88.11.2026.07.05.01.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 01:14:33 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/8] drm/msm: Support for Eliza GPU
Date: Sun, 05 Jul 2026 13:44:15 +0530
Message-Id: <20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFgSSmoC/y2NaQqDMBBGryL53ZFobUQppfcoInEcbcC4JCpS8
 e6NCwwDb5b3rcySUWRZ6q3M0Kys6loHwc1j+JVtTaBKxyzkoeAxj4Aa9ZNQ9xMQYhUkkcDijsz
 d94YqtRyuT3ayoWFyyvEcskJaAuy0VmPqtbSMcGnD/V+TtfIITL3nsRA8geKKzLXOEfNZgCsOQ
 VxWPKFHEnF8d9b6wySbXe279mLZtv0BUyuNi9sAAAA=
X-Change-ID: 20260704-eliza-gpu-eccf1946cb3c
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>
Cc: Puranam V G Tejaswi <puranam.tejaswi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783239265; l=2808;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=ze1VllbOqZnKEAM3Tp176IzqqLnZ/N83LBmJnq4dOkM=;
 b=9a9GOk9tVX4B1OGU6WAqIUkEf1RpZhendeSNrLU98rnIfNAxFU45RsIYy6SGBU1u/wg9t8oic
 STHhe5reKfWAdXRtit78WKmncVmmgtFAsoHhpnTcMDyGfm8Scoe32zi
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfX9nBaqWJFvZDR
 h3l76T3IVaYMtZx0h8PXcH4QPkb35oCYnqgs30w5O2vXHB9+0LWciy0lYjr6rF5hhyFOLIxE7vp
 ohj7xazC+OsuXSLw5k0jYgorC4bqLAw=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA1MDA4MiBTYWx0ZWRfXxH7I8BM38wUI
 qOtqEiBvCQe+DNKCSocVKZCimeHFHb5VsdbUK2/nVlpmOBpPOznrxp/wPU39GDKh28YAyPq6zIv
 v4NSiYEw2SZyIgi/6+gkOyt2wIETXnCDAPHokVV9/s2V1BrC4HGmO5gxrJlG2+JSXqi37pkM4GU
 6DSSchxcgAe61b72DlZHqAmc2bNP9/Ys1wFhKB/oK8yWu76AcU7RcSHb2DJzFs/2nbi7DFd6C2S
 kQ71jm3G7EjLgmMynutvpMuhLe79Wj0smVKg0m4jJ2Gla2uuNnaRnTyoRtiO+dWiMmtRKgY7Mav
 2M8KcfWO5tuMDOys5dBDUv8vNcQ1VyB5WmAJ5BEX7tWCw7fOCWzFNQas2HKB6yvTMePblOOYciG
 MNOeUlsbS8zOCY6qejKmX7IXAj9xIRARnne/ZZuMiGgP93wSiIycvgYAJ249wGa8OChqZB98J77
 QK2txUvP+o+UpRyzSSg==
X-Proofpoint-GUID: -OCkmlXm13rjicMT2GMeiQoI5a6V0Y0E
X-Proofpoint-ORIG-GUID: -OCkmlXm13rjicMT2GMeiQoI5a6V0Y0E
X-Authority-Analysis: v=2.4 cv=b9GCJNGx c=1 sm=1 tr=0 ts=6a4a126b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=bIsOEyWjDz43KqZfDzYA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-04_03,2026-07-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607050082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260705_011436_601697_5A962219 
X-CRM114-Status: GOOD (  12.24  )
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

Adreno 722 found in Eliza chipset belongs to the A7x Gen1 family. It is
derived from A730 and shares the same IP-level configurations: HWCG
registers, protected registers, GBIF CX registers and gmu_cgc_mode.
Major differences include smaller cache/core counts, 1MB GMEM, no
Concurrent Binning & LPAC support. Some of the peripheral blocks like
RSCC are from A740 that resulted in updates to RSC layout.

The first few patches that updates driver and dt binding docs are for
Rob Clark and the remaining devicetree bits are for Bjorn to pick up.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Abel Vesa (1):
      arm64: dts: qcom: eliza: Add GPU SMMU node

Akhil P Oommen (2):
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Puranam V G Tejaswi (5):
      drm/msm/a6xx: Fix RBBM_CLOCK_CNTL3_TP0 value in a730_hwcg
      drm/msm/a6xx: Add Adreno 722 support
      dt-bindings: display/msm: Document Adreno 722 GPU and GMU
      arm64: dts: qcom: eliza: Add GPU nodes
      arm64: dts: qcom: eliza-mtp: Enable Adreno A722 GPU

 .../devicetree/bindings/display/msm/gmu.yaml       |   1 +
 .../devicetree/bindings/display/msm/gpu.yaml       |   1 +
 .../devicetree/bindings/iommu/arm,smmu.yaml        |   2 +
 arch/arm64/boot/dts/qcom/eliza-mtp.dts             |   8 +
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 190 +++++++++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  81 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   5 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 14 files changed, 756 insertions(+), 28 deletions(-)
---
base-commit: a9498e40e3e314ade387d3ab0d5cb14f0f3aa1ad
change-id: 20260704-eliza-gpu-eccf1946cb3c
prerequisite-message-id: <20260609-b4-eliza_mm_cc_v6-v6-0-17df09e5940c@oss.qualcomm.com>
prerequisite-patch-id: ecae5e45a33a79ec3f500e3f318e3a0129fddfb7
prerequisite-patch-id: 19fe32e5af810250eef42dab488c982ef70c055c
prerequisite-patch-id: 60dde5421adbc86f355b4899bedd0d7a1a0c4e5e
prerequisite-patch-id: 58c9dbb18795c662ea22c3a82b07d6465f604e08
prerequisite-patch-id: 0c6e220ecf2b42776f990ea5b98ba4ee97d229ee
prerequisite-patch-id: 0e0bed1091d12c102e2542b1c2931f61a543f2b0
prerequisite-patch-id: c0f22b4ff0bb79935848dde50c524f6063011ebb

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


