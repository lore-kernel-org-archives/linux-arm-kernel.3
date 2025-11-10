Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D06CCFA1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rwQclgvLFFMg1Jy3+mU8x46Ud/t9TZacyJBkgEpno+w=; b=I30/GfI40PiUSE
	JO8jBX8dYCDTRGaDSwtrRExKHt7nGqiUdqHwGLIpfhyZH/wqcuhJ/DRSLSKJmHWtvP9EC/7I23uWr
	1DmEoMz0LAu82LhDwNJVDbdYUCG+RRljA40DtcpORgdTPXiWq4JzGqL5/MBaf/sb3PotM1AguARvT
	GFCoKgqh2jK1jRVNEyqtQIKanupqXYsaJJQkl2Azn0GZlv50dN9TOkxnXHrnOT/ay98oIS1f7Hz0r
	fiAvwQOvNe91YHDh6IUCiG+1mL9ru+mE760tUJY7zNVqbs0Ib/fMfrCHfeZWXAj+W00iTjD7Trpyu
	XbAE+/YrFARJ91ovNrAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuE-00000005oWp-2qgR;
	Mon, 10 Nov 2025 16:38:14 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUuA-00000005oUt-2lxj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:38:13 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AAD14ID3676944
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=rwQclgvLFFMg1Jy3+mU8x4
	6Ud/t9TZacyJBkgEpno+w=; b=X8N2pLnUTC9Ptbm/vLB/XQBvnei0ixlF0SPXPX
	ywzCxZOwRktZhx474x9ic3XOOwU4OExZ7zOja0aKgqsD2A5JLyy8Hwegv2L1hdd0
	7kJv9CWKmzHc346dKmSv7UG2ZBLY6AnUs5LcL9nIL+mnk8rHO75pdEvgJwO1fvVX
	lgQKq0uwbqJeQQ57EBTtSJ+gLQ4MnV/5+taFr6g68X5OwQ7NJsZV8NJjbvHhxrH8
	UU23HURK8c5c0wmNIEcc2xxzD04Fhsd0Y5ldiJ+tvBiwJnUsx2S5niTM3pf62n3T
	RIPjJQ1ymraR/EDGzkp3qBB2S82GYE7ZCLa7I9x+f9zE5p1g==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abgjh8pwh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 16:38:09 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-34377900dbcso2477632a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 10 Nov 2025 08:38:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762792688; x=1763397488; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rwQclgvLFFMg1Jy3+mU8x46Ud/t9TZacyJBkgEpno+w=;
        b=LBYeAAOEz+ZSyXprSSM72xi5Pc4Z5HZaftf7h+WdCMYdmHDKC3D/uaxCcQd4Iwsyzs
         l94CN9n3TQuP5X3hRsIPzgZ2GrdKKkWUZGhHBIqPSIJlwY/CUtPgSD6iiOd0VOxn2Y+b
         SjEH6zx06mJ0sTKYP1puhmLTWhDXnDlcipLPq1o8ZjqLz+xxfgTZA1KHcjVRX0Qhc4Uv
         zmmP1SUOu9STiSg3xSqA25ezaeoXoWNr2mwXuv4vZ/AnCSYoNt15LwUosMkxylEEBcZL
         /fjHJZOG4984S1Ump4phHfOC1yrMmFhyM8FcLC7YUV8D/+A3FfeIxgN4UKIgLJbF5oXb
         yTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762792688; x=1763397488;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rwQclgvLFFMg1Jy3+mU8x46Ud/t9TZacyJBkgEpno+w=;
        b=ZNNDKWauQZ2Zk7uFg9qAo0nP2LWa84IwQDQefpP1dS+AxxROPwmxgC468NlQZPYhj4
         piMRrmYYhgYwCacKx+2ZuYOVa3g6lExaL9jmSTNVN0KetuJk7huAdFcvh9Lp98Pu1UJh
         v6DpPnbW0xuz/yH+LKPf4I313AkG5VOQ5T2LXsNbpVWmgr5vQ4p9ICHtfdw6xbUFaIwz
         TRDG7TW/g6x3u61N+pjtIQfJjWdbq7LRBmLFqBiaCCEIWyd+69MnhZbi1ot/kLwisy80
         HLHCImJHa6xpmGvMhn4MlwNU1yGPqBFAGbu4DY1RZvwp9GI7879qAfZdjR3iumZoRmw1
         XIgg==
X-Forwarded-Encrypted: i=1; AJvYcCWZAF0+jv/H7jVqB4wDEwTCHziAOptlkCChv8i1NxY83n5uAXm+QPPldc86XMnGRnf0PzAFx/TLDjX5+iOKOj6N@lists.infradead.org
X-Gm-Message-State: AOJu0YxwSmOFfV35UvMbH767v4X9/6ffotlp/SxlVjhbyTF3gPSmdD+S
	x4btE0q6PD1S0TRjeQ9QZ+mvoHxdYrzDKUTZ9ajt2cEVt795jWKPL+4CeVAKWoQE/8Tf8jaOEGs
	1q5K5Bj2pzrUPZGLiiEvxV3jPNYeICyS/NpQnXxxYxSxiRW1BEscHqD+2db+/s/lilgHdCVUk6j
	TxOg==
X-Gm-Gg: ASbGnctbzXJqAB9kNSAIgcsVEzBHTKyUIJ1SyDCWkYrm+kJD4TJ/XlnQ2tPlVzhgYfI
	MZISF60nlTffjWxBxSdP1TlhEm9/wopiZVhyitw5yJoxvET9TvXV3pMT40QXC2pQJfgCjNi5uYf
	lrKbUPoug3zggUoEMFoWzaJC9nzQNsUGM20GoiZ/tYvVFzHB11aI1rbsTeDDiHE9iiRoqHRVHRo
	30dR2xIXRqhDSjgIVkbKmV8KSo4gWhJZgFOiKyvYhKW+RjGTBJCa3cW3prBVqGtpI5BEVDIva25
	DrFCyLhk0hxUCJAoV/r+IaFEkOTDnyhNsIhmWBD576Pab2ldud2hVexW7Bd91Ma3wqW1mYaU4af
	HcoeL1AV0g6dKeoXMbsVFiPc=
X-Received: by 2002:a17:90b:2709:b0:341:8ac6:2244 with SMTP id 98e67ed59e1d1-3436cb8a1aamr11833537a91.9.1762792688194;
        Mon, 10 Nov 2025 08:38:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF9IR983tQ7jp/h61keZWyTMidbuW/Wa4ZsFytaus/HLT/avC1cbjo9J24JLLOBJbusejEWtg==
X-Received: by 2002:a17:90b:2709:b0:341:8ac6:2244 with SMTP id 98e67ed59e1d1-3436cb8a1aamr11833481a91.9.1762792687642;
        Mon, 10 Nov 2025 08:38:07 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3434c337b20sm11468922a91.13.2025.11.10.08.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:38:07 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 00/21] drm/msm/adreno: Introduce Adreno 8xx family
 support
Date: Mon, 10 Nov 2025 22:07:06 +0530
Message-Id: <20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALIUEmkC/22OQQ6CMBBFr0Jm7ZiZEoOw8h6GRYVBGoVCWwjGc
 HcLbN1M8n/y35sveHFGPBTJF5zMxhvbx6BOCVSt7p+Cpo4ZFKkL5SrHl9a9xucwoZ+GwbqAzLX
 i6tporiuIu8FJY5adeS+P7GScIjocJTy0F6xs15lQJL0sATc8MxNsg9b4YN1n/2nmfXHoU/qjn
 xkJs/SS0oMyIqlv1vvzOOn3ZjjHA+W6rj//TXMz6gAAAA==
X-Change-ID: 20250929-kaana-gpu-support-11d21c8fa1dc
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jonathan Marek <jonathan@marek.ca>,
        Jordan Crouse <jordan@cosmicpenguin.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1762792679; l=7012;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=e0tZjP7Qe9N4wBToPl6vw0GlMvFY4M8fG8jNcxK8i14=;
 b=ilcPLfSac+bNgXXBl9ND3EE9MqO4taFpOdgLspJm2dJRHhG6w1+8UJbKjba5daSTwh4bWbowD
 KgDJEXKrrXCDjgQZtHYnvEGotJleuyw7ZFUZJINGSN2j54Y/ZzBODgW
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDE0MCBTYWx0ZWRfXwrG2Y5gZteG2
 KXG38Z8R64Q2F0B3AENAG9HP3uoM4i2+J5ZEj2Ncp+Bi9ovmknBvvnic6O7lme4r376+WbRRvzu
 7NEg9jiUyY9UbJNwiKWgJ1bH8j5HU/pfESheXEYTG9ALN5sB0Rn7efNlszIRb0uhLn5vgpAvygQ
 W2ym5WsKJhM88pxldurRkgpF0eiChE8n/gIqYygSBWvnN23VeKVuLgwnHYB9x5F6AKzrLwCv69r
 GoB13k4Y2A8T4g5J+ZLAv0AAaddf4fQmHMUwEbF0q/hPXaDadwtzW/okNCfaPVGeI5a6UotpWFA
 jKYblnC8StqSgne1uWL7vpUKHiuY95aLNLuoM4obXzHkf1UqyxondcYOf+6cqdn2NG4GhkfkoZS
 968C287JNuUKR8ra9qT4MdX9bfxPZA==
X-Proofpoint-GUID: Fa3xewdy3AyvD81pgtAiUSoBpvFGekCy
X-Proofpoint-ORIG-GUID: Fa3xewdy3AyvD81pgtAiUSoBpvFGekCy
X-Authority-Analysis: v=2.4 cv=La8xKzfi c=1 sm=1 tr=0 ts=691214f1 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=3aah4hanITsq5OUIlK8A:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_06,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 phishscore=0 priorityscore=1501
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_083810_846281_24E37445 
X-CRM114-Status: GOOD (  26.21  )
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

This series adds the A8xx HWL along with Adreno 840 GPU support to the
drm-msm driver. A8x is the next generation in the Adreno family,
featuring a significant hardware design change. A major update to the
design is the introduction of 'Slice' architecture. Slices are sort of
mini-GPUs within the GPU which are more independent in processing Graphics
and compute workloads. Also, in addition to the BV and BR pipe we saw in
A7x, CP has more concurrency with additional pipes.

From KMD-HW SWI perspective, there is significant register shuffling in
some of the blocks. For slice or aperture related registers which are
virtualized now, KMD/crashdumper has to configure an aperture register
to access them. On the GMU front, there are some shuffling in register
offsets, but it is manageable as of now. There is a new HFI message to
transfer data tables and new power related features to support higher
peak currents and thermal mitigations.

Adreno 840 GPU is the second generation architecture in the A8x family
present in Kaanapali (a.k.a Snapdragon 8 Elite Gen 5) chipset [1]. It
has a maximum of 3 slices with 2 SPs per slice. Along with the 3-slice
configuration, there is also another 2-slice SKU (Partial Slice SKU).
A840 GPU has a bigger 18MB of GMEM which can be utilized for graphics
and compute workload. It also features improved Concurrent binning
support, UBWC v6 etc.

Adreno X2-85 GPU present in Glymur chipset is very similar to A840
architecturally. So adding initial support for it requires just an
additional entry in the catalog with the necessary register lists.

This series adds only the driver side support along with a few dt bindings
updates. Devicetree patches will be sent separately, but those who
are interested can take look at it from the Qualcomm's public tree [2].
Features like coredump, gmu power features, ifpc, preemption etc will be
added in a future series.

Initial few patches are for improving code sharing between a6xx/a7xx and
a8x routines. Then there is a patch to rebase GMU register offsets from
GPU's base. Rest of the patches add A8x HWL and Adreno 840/X2-85 GPU
support.

Mesa support for A8x/A840 GPU is WIP and will be posted in the near
future.

[1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
[2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb72c27909d56660db6afe8e3e08a09bd83a284

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v2:
- Rebase on top of next-20251110 tag
- Include support for Glymur chipset
- Drop the ubwc_config driver patch as it is picked up
- Sync the latest a6xx register definitions from Rob's tree
- New patch to do LRZ flush to fix pagefaults
- Reuse a7xx_cx_mem_init(). Dropped related patch (Connor)
- Few changes around cp protect configuration to align it with downstream
- Fix the incorrect register usage at few places
- Updates to non-ctxt register list
- Serialize aperture updates (Rob)
- More helpful cp error irq logging
- Split A8x GMU support patch (Dmitry)
- Use devm_platform_get_and_ioremap_resource in GMU init (Konrad)
- Link to v1: https://lore.kernel.org/r/20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com

---
Akhil P Oommen (21):
      drm/msm/a6xx: Flush LRZ cache before PT switch
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/adreno: Common-ize PIPE definitions
      drm/msm/adreno: Create adreno_func->submit_flush()
      drm/msm/adreno: Move adreno_gpu_func to catalogue
      drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
      drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
      drm/msm/a6xx: Sync latest register definitions
      drm/msm/a6xx: Rebase GMU register offsets
      drm/msm/a8xx: Add support for A8x GMU
      drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
      drm/msm/a6xx: Share dependency vote table with GMU
      drm/msm/adreno: Introduce A8x GPU Support
      drm/msm/adreno: Support AQE engine
      drm/msm/a8xx: Add support for Adreno 840 GPU
      drm/msm/adreno: Do CX GBIF config before GMU start
      drm/msm/a8xx: Add support for Adreno X2-85 GPU
      dt-bindings: arm-smmu: Add Kaanapali GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU
      dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU
      dt-bindings: arm-smmu: Add Glymur GPU SMMU

 .../devicetree/bindings/display/msm/gmu.yaml       |   60 +-
 .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
 drivers/gpu/drm/msm/Makefile                       |    2 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   50 +-
 drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   13 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    7 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |    2 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   17 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    1 +
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  411 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  286 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  410 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   32 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   18 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1198 ++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   39 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1951 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 36 files changed, 5056 insertions(+), 1655 deletions(-)
---
base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


