Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739CBC4451B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 20:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sVH+YK2y1vG4lsBrivCXnDTuyI7sx5ytr7WDEkhCxnA=; b=cEbCaw6abC5HJa
	P/v6OGGc8wqb56Q0dJ9tqxvxLBRg1AbTv6q0P/LqPCHhKaYvLBAEG9J4Sf7tU/j20py+1HGRVc4e0
	Cct6COltUEvobFjd8BR0K848yVm0tLqoDEMJPRVnqFEY6Pa+/mm0j5yW9+CzHbVwAWYftlQOOqW7o
	cX7+KhZh14aczU6HAht70MCfZvqQS/3OUyMktl1rignfiBD9Pq7R8zQurXIar9I+1dwXpkesh30hZ
	Lthw5hTkiRYG9Qjs0P4m6FeeWN4e3RpIi6QwuTkDFPGf0MUKS1MfE78V2ll6mhOa/LFW8WJaagymW
	sFgOa65tQFcaHK1MLRSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpNZ-00000003DFD-14Kc;
	Fri, 17 Jul 2026 20:41:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkpNW-00000003DEl-31s6
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Jul 2026 20:41:52 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtSj82449812
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sVH+YK2y1vG4lsBrivCXnD
	TuyI7sx5ytr7WDEkhCxnA=; b=HW0ZOYY2FpGcSHpEnfmuVuVyl9JGzmftZEOCaD
	DsPsngIbXbdhA2BGmz7sYPEGS85X8TT+PrP63hasVtmNBcfIrxQPKe1OweE6cB0y
	UZBkk5VqbXoAgBUN8f3zGdBpQbzwVtlQjeys1cqOQKK6iK82SMb2vtBoSUARukYE
	VZ6uWk/mf6YOPdDbB0Jv4SMQbE19eWNZFdLlGrlSGH/Nkd+eqw5FqyjJOgPo5DIG
	tza7D2JwV9v9GT/hcX2om3TNECdCCoBXVMFRKPOcvMhja9Mzo+blHVySnLrNJX0/
	VUM9EzkUB6lDaCNV7mzpqoLH+CGgXAbepodZX/stvLNr//OA==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffj78tf9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 20:41:49 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dad28e86eso12191040a91.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 17 Jul 2026 13:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784320909; x=1784925709; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=sVH+YK2y1vG4lsBrivCXnDTuyI7sx5ytr7WDEkhCxnA=;
        b=LaEmrBd93Oe37AvcTmsMstgwUTvhJK3b0R+ZZ/bORjwm0FJI0pIn0qcs6xYCa4Gd9h
         U18vkbBpu9Z2XvV0WMFGDyFiPeIYg6mA80tjT5qH9D/kJaAQNPFQSitV/u0zP+Uf2fRb
         n6Ex1sKfmgNIUOzinFpBa4Hxg/rtAB71dZyymhj9zBqVN5zMU5sRJ6ZTxVVbIu8acwwC
         0D1ga0RzqA9WddbIObvQzoXMOWRW7+9n/DgEWlndFS3nIQyBzZgEDiqlDsRA4MPQRvNK
         91b4t7lHs7huZsTWKNTrFpLZbvnfPGpTedGFsUU/9kFVk1pr0rY86dIGBNYHe6Rm/DJo
         rQUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784320909; x=1784925709;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=sVH+YK2y1vG4lsBrivCXnDTuyI7sx5ytr7WDEkhCxnA=;
        b=Im1scSIZyuRJfyADCCE7fW4GiLv6p0x/cT4pt3W56xkQpQf3Fppyr+cTkSvAZ/vqNc
         o+iBwGOBE0VztsVE2rkhkbjdxbRUsAbOPmzjoYfHXwXFRICLr0v/HKyK6GfhJZywObWN
         fdCdwq8ErRwu6T4wyBfCVmbpyvtQJpHHAqiOFh3+B0Eu1ak/J2EiUz2brlyknYDA9LTz
         VKBjdKM+zlvnXCcUvGbNnsibo/kDA3iFBE9MVSnpO3jLV1dNwA633ofkFIm0c7XXnS4M
         gorJh2Jgrr81glAYKSdiqsr/stTO4A5nrR0sgxAZCbfIIjc8eVlTYmG5OSpTenX/ZV2W
         A6fA==
X-Forwarded-Encrypted: i=1; AHgh+Ro+jPdfkpB+UboBd2dLyipcv1uYU12vtmeUSFX1ojwJwaPlCw2Takw5ukDhymA/6bZJaKHR2ChJ9z5GMzgX3nMQ@lists.infradead.org
X-Gm-Message-State: AOJu0YyGsmKnHHunwlCr2HMgYTG+/+P1ztYUFSB4O45g9LAMIHSvtgs5
	RpGW8r6fqdUhSN6GqAdAjr+wWaqSPrIWyK460jaKHPDamxQoORJmPSBUhlYvzVqqjhvhSmnqosT
	T40QZv1JVQkPRG9iYfI4WanhamZqLOw0XZJy+8tpEVdTqZxeUzp9Wf8LMSOj1z59lP4u2Eh/qAW
	G+cLfmGLDttA==
X-Gm-Gg: AfdE7cm4BnQjPoEnpewv7UDer8qeoOR2nSZj7/CfLVMRkvtrLPwKR1SxkvXmcWYIgVk
	pV4z9cLEH21MWEJVsp3S7lr1DfyfJPg3uH9XEBaIzmtD1J85GsD+AdrZ46BYAs8UmAaiQp+A5Lx
	7SzzHsH/qQa91WLsUX8E9rHMyqW9Z9aFvyaphaZvEi0hgPDyWKaUfe47T/VOGeZKH8+eKpqumRJ
	7brfrXBhirE+e6FHHq277Q7r4pMNss7gb//Dyxrc70MszOcNsPPWaFCCXlZLaeiP2T1oxFN/k7e
	d1QE1LpoCs5c/8P+YcvBc37VSYmtN8ucCUc8tTU1tKMTHDFyXI5yS82yWicucd5aoTuIYvc9SHd
	ej/nTbPiLFElJ2/WAb9PSLnJY
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38e4b454d1cmr4623528a91.10.1784320909241;
        Fri, 17 Jul 2026 13:41:49 -0700 (PDT)
X-Received: by 2002:a17:90b:1dca:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38e4b454d1cmr4623483a91.10.1784320908803;
        Fri, 17 Jul 2026 13:41:48 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a1e348bsm11322997eec.25.2026.07.17.13.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 13:41:48 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/9] drm/msm: Support for Eliza GPU
Date: Sat, 18 Jul 2026 02:11:25 +0530
Message-Id: <20260718-eliza-gpu-v2-0-64379dbebd7a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHWTWmoC/2WP22rDMAyGXyXoei62m6Q4jLH3GCU4itIa6qS1k
 tADefc5bi4GAyH4dfh+6QVMwRFDlb0g0OzYDX0U+iMDPNv+RMK1UYOWupQHmQu6uKcVp+skCLF
 TJi+x2SPE+Wugzt0T6+f41oFuU0SO7yI0lkng4L0bq6yn+yg2rF73PTHbZFhln6lRSiOazbL2v
 kas51LEkEId2k4aKkwu8Xtg3t0me1nRu5i+YPU/Ox6H8EivzSodsNkVf76YVaSh6dS+yNum1eY
 fDY7LsvwCx3XanCkBAAA=
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
        Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784320899; l=3090;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=6VEjrqVhr7MezwfVHfIVDsIN0YyS4xKPQEXFGvXAkd4=;
 b=SNwxy/SDmWuwEjIaqCpTdLVsE7jZE/sH0Uta1x17D2avioGP0wvW5JmMtKbo/r0IwoMsTchaW
 sdJOBpo6jhuBxTd0mN2Iwym1w7M71JU8qdNIuLFrokRXTF7MmACLhLE
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX/VdU16gu6AHq
 uUTKhHpw1Gq68YAHPwpzaUFKERe7YfJy+9GFUdzNnEUYP3BHgd1gGLMZ2ThkIDjBZu7BDekx5Of
 gK3iGuWGQMPA4nLRNtBAWHAoHtAGlvF7W/2d9hoIihI3R5afGMAsNr2qDGJqfQa+JfEpGjMhG2w
 LfS3G0aDJ0wIKZZVlAVa6S0CcbtIS+1GQEU2VFj5KLp9vBZsbzIqPb9Jb+GcwLPy+oTH/T/GJEq
 KtlHCJkxSD1+b7BRbx4ptV4DlbVahFIG0N4y3p2l+Wme/Rng4/VFG0H3eBnt2sQ8ISXBXLV6YGz
 QWR6NklWJbHWjSNOkcUkr+CU7KWmTC5l9E6IIsm4hmafJDd7rVv/H5DYpLAgIjoE2l3SS8KHTEx
 x910RB5oMP/a5uNaQiOf54f6umAsy8D7PhyzOygn8fEB8LRhYYJLOjpR/N2wR86xM0Ui0FsN12j
 ONL7fa29pKqPLGBSEYA==
X-Proofpoint-ORIG-GUID: 3LckfDt5cTGuB0-IR3klUtKQY1J2nBur
X-Authority-Analysis: v=2.4 cv=U9Ciy+ru c=1 sm=1 tr=0 ts=6a5a938d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=VR85YU2tW1KY0NdMjCQA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: 3LckfDt5cTGuB0-IR3klUtKQY1J2nBur
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIxMiBTYWx0ZWRfX3aMie4Gl5slQ
 sPCr614pyGUJ+tFFbURV3P53id/O8gQCYAyX7r5Xg5CX3UA/i0PKtaGX14wdaHEoky7AM256DNF
 3qCVkL6hzVQFcUFjS5GKG0fpGRTpKcs=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170212
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_134150_788687_51341E07 
X-CRM114-Status: GOOD (  13.07  )
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
Changes in v2:
- Add a new patch for GPU passive cooling
- Rename firmwares to gen717*
- Capture trailers
- Link to v1: https://lore.kernel.org/r/20260705-eliza-gpu-v1-0-c9f1354dbd29@oss.qualcomm.com

---
Abel Vesa (1):
      arm64: dts: qcom: eliza: Add GPU SMMU node

Akhil P Oommen (2):
      drm/msm/a6xx: Rename GBIF_CX_CONFIG to a A6XX- variant register
      dt-bindings: arm-smmu: Document GPU SMMU for Eliza SoC

Gaurav Kohli (1):
      arm64: dts: qcom: eliza: Add GPU cooling

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
 arch/arm64/boot/dts/qcom/eliza.dtsi                | 209 +++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  38 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  17 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |  81 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   5 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              |   2 +-
 .../gpu/drm/msm/adreno/adreno_gen7_17_0_snapshot.h | 428 +++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   5 +
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      |   2 +-
 14 files changed, 773 insertions(+), 30 deletions(-)
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


