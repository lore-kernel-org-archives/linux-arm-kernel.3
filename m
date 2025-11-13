Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A0F9CD98F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 23:30:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SyFk5zcqS7Ph8XKnWlZh2ubVnnsYVplPvWIOQ6aWBiU=; b=AniPG67IKUIgUA
	8r+4yqeQN8FV82KyLfPFOdLWG5jO+udajPagoDeQN6vurk7N/5423ovqw3JBShsOOvUpkk6UaGw37
	PW1S4Aew9aEfutUR6Q6b/UsYaszgrDJRgUt6vp4f0oAD2W8Ol0ovRkNY3KkfusnkTDwWtvNLuXg8d
	XhzvL+5ZqCFZ8Xk2NEPazLlZRlLoxxoVGtof+gg6J+T0yCVTidZM1mUirGCh2xTfU/P9OJHusIdu9
	Od6iRpmUIznTEceEchv6Xd7SZ7oW5eZPPns/JRQ4P5wktQCIE+DCssz7ZSoqv5k9+zgMCOwZ5a7Ow
	xMiIC7wHQ9xWUFwfN7mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJglB-0000000BGTU-1sC9;
	Thu, 13 Nov 2025 23:29:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJgl8-0000000BGSq-3Jni
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 23:29:48 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5ADMaaVJ1484477
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:29:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SyFk5zcqS7Ph8XKnWlZh2u
	bVnnsYVplPvWIOQ6aWBiU=; b=HZtJVv3Jh1HkaZRkLJlJberqZysyyYId0dCyI8
	rAlx1V3ZNjax9rPJO4yOImknFW86sBWiQMNT6Q0XiKiwtgHutZKzxkiNeWnjFkrE
	wAB0AOBl4eB712bD0nL2bsBFmLr9SQE3f1R1ekxK/nh5BqwFRzIyVeToHgfn4Um6
	8RPf5V1PcrlWiJrAM8ehSsly5gFIZe8Ej/laEL+VGNozs9/VG0zdxqj35lPlzAov
	6lI5alCvJK9i5ClfVZRNGLQKtjso+4/iobMiFYMiiSKIcajtD6oaShrwOK6UkMD7
	hf8RZDIB/AlXcegl19UON30vLIp157rQql+irVbUlDUsSprQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cg427-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 23:29:44 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2955f0b8895so29643395ad.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 13 Nov 2025 15:29:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763076584; x=1763681384; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SyFk5zcqS7Ph8XKnWlZh2ubVnnsYVplPvWIOQ6aWBiU=;
        b=j5azg2tqdLdWP5Z2jbv4Ql8nwaZ2CJox18cwwbXnrroZS2TzFdz6YmKy5ACuMzCCMI
         4yLNL/NI5q298oFTTiiwyo+bdQLXDL4LWtxe3IaqmJnQL9dQm/4cBzOMIeap6ydY2DNk
         0Gu3WElK5rvQavt9uLxhVcoEEcXgu8xliYUntKtIp0fZtQ3+EyjaIEWB0fFoWdLxXKMI
         aqZik5ghCF0Uz1+2ocHLXWrvlIf6UF5IZezhpgsmE9aOawyaMW/6NmXWaGUa4UfzkzXL
         mMyi2NpZDJrioD+O5z3+88ZeAiHv1IXyM1aQra7r2cxx8rO8ZGlZoX1gH9aAWNIYCNbh
         83Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763076584; x=1763681384;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SyFk5zcqS7Ph8XKnWlZh2ubVnnsYVplPvWIOQ6aWBiU=;
        b=TyEVGiFy3nxSC0Z3SN3rnJFAKJfHjmr/bhZtLJ2HTo6zKmfksMRUh8RRhQ6ddlmDxF
         F4RaT67g6mksCp7Hb6vkl2MMw/iDKMYip8s8dVBMkdH4Mgtlg5UyXj2L43pRW9SXIWso
         hOEebI1xYEWNtFjZ6CbqFb+TCK6SJ9PcAYPUx5PXR8oaa+cXvvfllH5/BeYavtEt5whD
         Ew6jnKG4cWwBmkNJDDhOddGpqpf7ZaPoIKoqSJ9heMIBpqlHknRjCw0xhawHiEi85Xi3
         xbeikxUhK3lfYUZjrAoN+tdfldIyxtJQ2CO2+quuj1Bc/6Lz3ItXAkmqkGxOEyprZHX+
         G05g==
X-Forwarded-Encrypted: i=1; AJvYcCUL0AKPUFwZjjdlBFIvlCHwkZbRK41WwQBz/BEkQV/giYSmJZpXkTyE4xeb4liW179uR2rl6vcxu1roTeLtX66Z@lists.infradead.org
X-Gm-Message-State: AOJu0YyhmkcBOYSsKBuBEmPQfOn1C2ZjoGZO3oeRb7Fd/fTbEVw9R705
	Ow8L4nxVL+cDzq8Ha6VlGpt6+E8gNBirpcou71BywhX/Jb5mnlyxMNl37s7RaI5uC9KR8LPdtEs
	iFcT7JD36g5WLR3IoIclORfKqGDhNTW5QMaU9GG72f08lyk5vX7+z/FT3ErrL6BvocAkM5iKRE2
	nyqg==
X-Gm-Gg: ASbGncvLJ3uuVnHOSJIo7bcqH2BLSW6BGdf7pmjj/2XtvYYFO4jBwII+4PrU5kw4q99
	BN6j5AaOW0mVykdB1pCw37Njiqv2NcI9WysyVooOOuzso7ZKL5FbNUBKFyp7sr+7/zS6raFgh8W
	SGFOs+lXSh03GFOnUMxwrCsIGIVPhKK3/eufX97WxEaIf9qBneopCb4B47DdwxJXa0zGtRkISt+
	rp5HtKnnl/ANvFq7CKL1fJPldc1GxiNLK7s36M7AFWARsqh0xu6JMoDMUK+onaTeBkreRHN2noM
	G4+Lv3MKslbbeMXKa2chsv0R8f2X14zdF3NAArir24dmnG2xmwXRJlnmV08fgVfE5oQlGR9QA4g
	pIA5+u510Z+zntY+6Uy0aSm0=
X-Received: by 2002:a17:903:11c7:b0:281:fd60:807d with SMTP id d9443c01a7336-29867ec97d1mr13571675ad.2.1763076583745;
        Thu, 13 Nov 2025 15:29:43 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0JoKSqTMESiDKuWUM4M75A1GvjOSZKSKBeYjatr/BGas5j9pizj/bo7phZeFbq/ZDKNvORg==
X-Received: by 2002:a17:903:11c7:b0:281:fd60:807d with SMTP id d9443c01a7336-29867ec97d1mr13571265ad.2.1763076583020;
        Thu, 13 Nov 2025 15:29:43 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Nov 2025 15:29:41 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v3 00/20] drm/msm/adreno: Introduce Adreno 8xx family
 support
Date: Fri, 14 Nov 2025 04:58:57 +0530
Message-Id: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALlpFmkC/23OQQ6CMBAF0KuQrh0yUySKK+9hXJR20Eal2BaiI
 dzdAokrNk3+JP/9jiKwtxzEKRuF58EG69oUil0m9F21NwZrUhYSZYmVrOChVKvg1vUQ+q5zPgK
 RkaSPjSKjRep1nhv7WczLdc2e332i43oUtQoM2r1eNp6ylj8RZp6IUMyFuw3R+e/yp4GWxjpf4
 Mb8QIBwKMoCazwgsjm7EPJ3r57zQp6eBR3kH5qHtiCZoJobOiptSq72G9A0TT/Bv30cMwEAAA=
 =
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=7615;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=J+VkJjrkoaNRlDaKnTG93cqZ7QXfLD1gOTCZPhZm8Z4=;
 b=8p7XjN3Y1LQcpmECcDL5FAlQrwIXhy+O+Jxm62gGRbKGs6Mgoe2vlW3Mos1mEnGrJBx0avjHI
 PotaQrfxNXSAUUHFflb3gEMXobClbU70XJydWwa0baHKjJF+/oYLlR4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: -z5kTKKdrO2DFOV3inPGnWmmheitu027
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX/nooU8pv1NQ0
 mbfmoR53VnRWnfPF5ZS2dWOpHKeSzxZk51YS28EnAaWDV2ovChhto7D49ga7Oqc+CSsRpFvwHaW
 rmVilY63Ec+datkdBnbVMl8/7air+FBdu4fpbT2M4DMTror6xJkvGIlaP3crSh9zh77uGlTuC2s
 cP2y26NJ83Ogwd4OAd3Ds2q2XC3AFaUtkuo3yQcsiT8fo45jcbuoG5Ef0mxs9/VmQSYVzxKenoZ
 Mwvohe1zYuUw/vNICgThS2tz3td18YVnjnUlci6TVqY8Qh79JO84JX8gGPiB1Z9dYAE+43yaSXB
 /H7JPNeOLHXbiMK9VFj96sGaarFghyDCBVsijD8XJtrPKkm9YMtsV+FKXMclx0a9ELlvhieU4kx
 r0P4vqzvOGrSRRgUm85O0z9OGMGsHw==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=691669e9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8
 a=XQ7dgq76HTNx6dD4gTwA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: -z5kTKKdrO2DFOV3inPGnWmmheitu027
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_152946_878543_3E3C9E7E 
X-CRM114-Status: GOOD (  26.58  )
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
Changes in v3:
- Squash gpu smmu bindings patches for Kaana and Glymur (Krzysztof)
- Reuse a6xx_flush() and drop the patch that added submit_flush callback
- Fix GBIF configs for a640 and a650 family (Konrad)
- Add partial SKU detection support
- Correct Chipids in the catalog
- Add a new patch to drop SCRATCH reg dumps (Rob)
- Read slice info right after CX gdsc is up
- Don't drop raytracing support if preemption is unsupported
- Drop the unused A840 pwrup list (Konrad)
- Updates to A840 nonctxt list (Rob)
- Capture trailers
- Link to v2: https://lore.kernel.org/r/20251110-kaana-gpu-support-v2-0-bef18acd5e94@oss.qualcomm.com

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
Akhil P Oommen (20):
      drm/msm/a6xx: Flush LRZ cache before PT switch
      drm/msm/a6xx: Fix the gemnoc workaround
      drm/msm/a6xx: Skip dumping SCRATCH registers
      drm/msm/adreno: Common-ize PIPE definitions
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
      dt-bindings: arm-smmu: Add Kaanapali and Glymur GPU SMMU
      dt-bindings: display/msm/gmu: Add Adreno 840 GMU
      dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU

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
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  369 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  287 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  393 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   31 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   18 +-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
 drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1205 ++++++++++++
 drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
 .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
 .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
 .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   38 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1954 +++++++++++++++-----
 .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
 drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
 .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
 .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
 .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
 .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
 36 files changed, 5008 insertions(+), 1653 deletions(-)
---
base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


