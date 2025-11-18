Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF46ECCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 08:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SRkkuilcPUAjhzRDejyYePxyyLFNh/VPNPEY8WYMKsg=; b=gy2JBnhnJWQwcP
	x+DDrSnrYJtYM69bHpeMYjo7JcQZbKdpn/knoS8lBA8QO8EWFk6O5BcfGhdavDbWgefvT3ZGL+626
	faF6KUNUR1SjR0cd4/9y/MYoqSG/1gQU0uW2qhnFudtv6JCkJy6sDxtOzPYhJTp/UFm3yXFm5iQ+L
	xF0wyWRhkmwrLHKUHqapLxrQK1L5+u5/Sr5JQYN68KFO60tmB/qA6cE9KN0QjKvNcXZ/2X/dXwQIC
	GEPkuzC12oZnzwUIoPTKY0cEeaoKp/6UAdmKEYrYDu/ufSxXW3CMd2TIGLUv2JoFCO/UEZx8o8uZv
	+20oSOvjjfVGy4Dqt60A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHQo-00000000563-1LDg;
	Tue, 18 Nov 2025 08:51:22 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLHQm-0000000055c-06GW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 08:51:21 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AI6YLEm623776
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SRkkuilcPUAjhzRDejyYeP
	xyyLFNh/VPNPEY8WYMKsg=; b=NC0WQNA66fUeDTOPjoVAVfv3es0rzYbJzjlwDi
	pAoq9As2AV1NFx/XCjolVXN92siVFAiAEElFCfqfH1dSFAZgUhKfa2XpdhkumKiR
	V0DHqYOopOm7mcbncKO/cuBw2RFou56fQUKZAG/KFKH3Mwmye7V8WtchSJ2iMKl2
	F5IRf0sUS+4bA97i4EIOyzSFo2XPIyAKtl6iTzRSIn/hkPHJ0LndoJBSHlBuQsFJ
	lvXhqKKyhLW5L1IiAVVnZ9lpZEbm3KnlEOYGdkRQubz0A1cp1LFMRYkt++0w13Ti
	NqVRk+GnBRtxKWqHM4cdx46GDnbRA2qS+ccNUtnglJvOB8Fg==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahf9sg3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 08:51:18 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-297fbfb4e53so94959855ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Nov 2025 00:51:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1763455877; x=1764060677; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SRkkuilcPUAjhzRDejyYePxyyLFNh/VPNPEY8WYMKsg=;
        b=kkvz73BlaOJKtkZkZExtRNElJnHUUnXQ2tNevt1r/QesmgtSI3Cl0vNnWMoiXDqyul
         1CPP1UhnzBRvjR1qs4OoPurSOV7UwRHqo5MkczbChLtkwJFxj6GaiiE1FGzUwWaSUYQm
         HmBss6Ajw3s8fko0Z600x6CPN8uMx3WJCOSygRC4rzke+vOnzud1bORKlEjoSVjk2Ouy
         ZEy+c5MQ0ai0X0Kpxdhraa2xAxiF8VBSNBF+rDvmMphtfe+K4Bicfd4mENNn7VN8eTlc
         k1rd/k8SrPpWmZugYXZ4n3pNeLCMnJHvLD2ZJZnLg62Da3Haa/lfE60t+Jqw8rUE5yPO
         +lMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763455877; x=1764060677;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SRkkuilcPUAjhzRDejyYePxyyLFNh/VPNPEY8WYMKsg=;
        b=NgIYV2ekbyIbUDd/9h7j7ZAAUVkR12E9G0y00gF91yiTEB9G3tKEFWZ3WbxDdqyLOt
         d9DUiI1u9MuLw3QGFA5LUfIz4iBhbpGAisi0/2oYDqcXccMg6b6bcQA97kJcsBXCGDSw
         aEyisAUzwyUIqVveu1t6kTn8bQ39tiC+JSNfzHMNOO1Ehhd8vIXFNbHxVJ9UduKzXVFP
         bxpG1C5bQTAm5bt8ilZ6RUmAHctOmc579UksenDBdZ+6ecMh4AN9xHEj4qQX9GsJ/QAA
         YAmCEd3mzWJaHQ6GQYYGacvun8ERthHTp/24qzagl/e3W9KGI07PPzjFPhTLhCzKup1P
         kT/A==
X-Forwarded-Encrypted: i=1; AJvYcCW+if+Y2DBXpPD79qA+L/6bN8tWfVuVPIaxyhdEmyfrtAQyLB/W8B6jOCT5r2JcquZuWRmVv9eVnHlz5NLgNwo/@lists.infradead.org
X-Gm-Message-State: AOJu0YygN10kpf/MEbIuK/9zKy33B/e8eZ1HiJ9J+fIfwUK6rGF6QZmH
	Thc2JVPcP9E0PVBKAMV8d7OVjlkJqSA5fYrOm+OHhTCCeb6sd4r08bh8o77HGw/amHa1vqduwMP
	jyeiv7dwA4dkXE4ONN2fyoEN6BgsCRooeJErXVlY3vUJPJCkAWaGO3QiB6C4StJKZzRb8/1kgcv
	B2Xw==
X-Gm-Gg: ASbGncs58izBfmUIYD3UNw+iNAUctkueyr7Qv+Dzf2uy3lyTkSNntdZBL3ciSkyIicz
	9atnWMZfBfrvd7QhKQQqLMEO9f36wxhgJPCfYYBjTf8E9LQEB6IrUxLM0V5vsnkNvGxAMAqNSCS
	/GkPnAZVDV9PDqlqWeO7u8vZIlSh1M1n4dXYTHhEa0wBN3guPfhYMAaL+JnUNQM11evN8A8JFfm
	ZEX/8s/rqwReqxikMjjcek93IH37yhw0kqsv6x2iUBzDZI3sm7gOQN+758c/uHnWYBnoJgRo+Je
	ELhNc8s+Uw52kVaj2h2Y1fSrd8IXHw92y9TY1vel4R6x5outQMn6hKooGYAujnWYpPeSQkMxMIG
	LypuyaqremNpoVOSdw5pV1Oo=
X-Received: by 2002:a17:902:f68e:b0:296:217:33ff with SMTP id d9443c01a7336-2986a74b123mr185486105ad.48.1763455877227;
        Tue, 18 Nov 2025 00:51:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHYYYhbl132uZmTkXE/2ietVevW1XydVKATVhI8QMWfD22oOohwN7WRKOFoGbfJdJDmskWADw==
X-Received: by 2002:a17:902:f68e:b0:296:217:33ff with SMTP id d9443c01a7336-2986a74b123mr185485645ad.48.1763455876671;
        Tue, 18 Nov 2025 00:51:16 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2985c2568c1sm162910695ad.47.2025.11.18.00.51.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 00:51:16 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v4 00/22] drm/msm/adreno: Introduce Adreno 8xx family
 support
Date: Tue, 18 Nov 2025 14:20:27 +0530
Message-Id: <20251118-kaana-gpu-support-v4-0-86eeb8e93fb6@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFQzHGkC/33QwYqDMBAG4FeRnDclkyhWKcu+R+khJmMbdqM2o
 9Kl+O4bIyx7cHsJ/IH5fmaejDA4JFZnTxZwduT6Lob8LWPmprsrcmdjZlLIQlSy4p9ad5pfh4n
 TNAx9GDmAlWCOrQZrWJwbArbukczzZcsB71Okx+2TNZqQm957N9aZJ887fIzrqEcinTrr7LRVK
 rFTOQMHXqpCiUaUQqD96IkO90l/reohPu9srb45GvvwnbabIXW/VsVrNaGz/IUAYBeSEWqwhaM
 2tsAq/wdSf6F8D1IRqqQSwpQYT9zuQMuy/ADBqwWgxgEAAA==
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
        stable@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Rob Clark <rob.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763455868; l=9653;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=UFF8oQMxcaD0GgqaF/ebE2x2xvKFCkvuU6Qn6dDSTEE=;
 b=DlL0N9F/+fnn/Htox9AmbWYWj9jhuEgWRpocf3vH1plZpfPAu15H5LRKwVGjeKxu113eoyehw
 hwCLsvmg+dCA8heY7f9qQpGg4+vlIGLBa9V7Dah7WUklZBqFuxZu4kp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDA2OSBTYWx0ZWRfX9VEyAonq4p1a
 krsTQlfDI7eWOFk5VjPtqVAlLvej23EsAh8caK9tYIolqmA+KtZ4e+8aX1hjXSZD/B/k/3r08gG
 dqgL0kcxY6QP43sM/rFhXMdyYyIGAt/S0o8EKl982ncJEkZ0sE+HFLBrSz7SbOXEi6Icp4KIdhL
 vvdzv9PDbGzDSjU1bSCfPbLdE0KqNpDVzlbYoZ+5/dcpXRlZn8oLWTpeUfoJ0WaqQioCUq//Jja
 ZOkJl4mRZYGg3Zz70mdhN6amVdX1oAQ2aPWTUWQDW/KO32AiKCePt9+cHK17XmW8Vf4iUEQqLXr
 RVP+7R9gWimwa2E0+Uah4vFuaCPUj1uL9J0huZcTy22J61DbSnB4OTTPGHZ9CAmjoJvnSsMEAmT
 U1nCAwouJ17AZmrg39kR6T84TvVDnw==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c3386 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=qC_FGOx9AAAA:8
 a=yBg-79ffRpHudLaTDJsA:9 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-ORIG-GUID: DtS09hzicqgvobMi9geNEwxiPGJtEsp5
X-Proofpoint-GUID: DtS09hzicqgvobMi9geNEwxiPGJtEsp5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-17_04,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180069
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_005120_088824_06713763 
X-CRM114-Status: GOOD (  28.65  )
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

The last patch in the series ("drm/msm/a8xx: Add UBWC v6 support") has a
compile time dependency on the below patch from the qcom-soc tree
("soc: qcom: ubwc: Add config for Kaanapali"):
https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

[1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapdragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
[2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb72c27909d56660db6afe8e3e08a09bd83a284

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Changes in v4:
- Rebase on top of msm-next
- Clean up AQE bo during a6xx_destroy (Konrad)
- Split out UBWC v6 support into a separate patch to ease merge (Rob)
- Rebase gmu register list's offsets in a6xx_gpu_state
- Add a new patch#1 to fix Out of boud register access
- Link to v3: https://lore.kernel.org/r/20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com

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
Akhil P Oommen (22):
      drm/msm/a6xx: Fix out of bound IO access in a6xx_get_gmu_registers
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
      drm/msm/a8xx: Add UBWC v6 support

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
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  371 +++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  287 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  399 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   31 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c        |    2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   74 +-
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
 37 files changed, 5043 insertions(+), 1684 deletions(-)
---
base-commit: 50a0b122cfc8a7dc35009ef9bf33cf6034c7bd69
change-id: 20250929-kaana-gpu-support-11d21c8fa1dc
prerequisite-message-id: <20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com>
prerequisite-patch-id: f15bd99b078d228da892fb1224e10cac31f4a5c2
prerequisite-patch-id: 5b3d152595fbcce7c118d42c00f89160bbf03d41
prerequisite-patch-id: 4387aff0073a3217132ae5da358e5d4b2cb23cb3
prerequisite-patch-id: e047a6ea27db881db0089923af688c38729a7dad
prerequisite-patch-id: e686f7f592194f7d5e943858ce4dab49da6f4d18
prerequisite-patch-id: 638bc6f946cb2c1a2c68c3713a1ce7e6839c3465
prerequisite-patch-id: a85a264e87f79e9ac34dc22124153b050f97dded
prerequisite-patch-id: 8bba83cdb88cb7a8851978590cb24033d95c21de
prerequisite-patch-id: 9f08bcf9e33501478a2312e7a317f730f167652d
prerequisite-patch-id: 65a2884909f6f0e3f111412388fde0c18a4a3334
prerequisite-patch-id: 3e9a011409f3461e3de7b1a8a4e99de6fbf02abf
prerequisite-patch-id: 0ae4c8dc17fd54c84d903badccdf7a2018ec5606
prerequisite-patch-id: 6e0829024fb62bfc4510ef4c5472392dc76efcbf
prerequisite-patch-id: 5e5e177cb37fd1c0151568744565483809f357ba
prerequisite-patch-id: c2236f76a9fda88c41ea535708be1b51fd4d444c
prerequisite-patch-id: 6e26922186365d994987026b674baa66f9ac0139
prerequisite-patch-id: 784df303a9e75f062c1e069d2bdb88578a76ba0e

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>


