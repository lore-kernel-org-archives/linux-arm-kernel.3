Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF1FBCE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 15 Nov 2025 01:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0qRv7D69CzuYjO3j1EhxqH/ct/yNh/3IP2tz5K1Gqw=; b=UK/SkAnP6id8lG8gE4aCjCMu5u
	kQ4XMHQwt4IPS8CbQMxs1c2121/7B8ls76NSnWl0SoMNRyHHiAfIaPKv0xc63Xqjw42QhA2PixMOo
	Y2gf/R9BYn43qVoorL7ZcD46z/8iUkW5qrhtVQPNc7BiuQtNUPXiRhdo6NaG/dBuKssUQ46YnGlRa
	2qYxrI4kThXOmhm8LndIChcJxc8UYtaPmMkvXsAUvbpB4jVBCfjucCQ3AdjJuQoyKUo4LVo5B/+WA
	rRbmkPV/x4EYYQ2SmB0GD1fBczs72aq9L8YvcRHAFFNrRY9m3HQ3J3e/rFRXzzoQCD9nQLyFkxdG9
	Uls1VNeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4ni-0000000DJuc-45t4;
	Sat, 15 Nov 2025 01:10:03 +0000
Received: from mail-il1-x12e.google.com ([2607:f8b0:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vK4ng-0000000DJtl-1nCr
	for linux-arm-kernel@lists.infradead.org;
	Sat, 15 Nov 2025 01:10:01 +0000
Received: by mail-il1-x12e.google.com with SMTP id e9e14a558f8ab-433261f2045so11302945ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 14 Nov 2025 17:09:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763168999; x=1763773799; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o0qRv7D69CzuYjO3j1EhxqH/ct/yNh/3IP2tz5K1Gqw=;
        b=h1Mmjx6LMAC4aZR11LaBac0UbGpifjowW2x3ouAsAKtdWUKrRPvvSTBR8Ysv6Hi9Ki
         G2wrUX+jac4Q85Zsv8Apr+wl9ntZZ+c0m5tfrMo0f9eR2mBBylqavPaKZeOJmanMjKUr
         O1gTfcjbVDbTafCkK16/v69kJc5rGSO9SKOVoyaYq4A3nsRor7/XIUSl6BQeI7svzo5g
         +NGYC+jIw/6oybBHzMpTJ38OA3AOaXWS3vMUCh0WgllyN+K7xT9Vny5ENoRqmPHoIhsw
         Y1B3CfXiNLbthGsxj/67Q0ObxTEouhLJp3KveVvdDlB0bZPhQpcDczPr7gxPX61P+Cbb
         jdWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763168999; x=1763773799;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=o0qRv7D69CzuYjO3j1EhxqH/ct/yNh/3IP2tz5K1Gqw=;
        b=uxIGzTnXB9dS0Hsy//uIIcFHNa+gyhLFKp5hUSlU3m9QqYCb6Bxam6gyrf0ZlDQ/cp
         StBg+aixLQFeyrMcRIxnGAMQRNEVgzO6j0/3HYtet5/dXG2DaD2MhmF8o/LKqxI/LzWP
         +9TCRZe3cBJQqEN//WxIuAOqWQZUAjsc513lPArw4UrHh9hGugacEPjxgqjWAtWfzoxT
         5kpExKdOElilTakcj0Jm2Tq6ZEHt/FDsmATFF6gRdBnjfjF7Gnp8BWwxV6Nf/hrdOgD3
         +vaqmDEl8bEeOindJphjIRfncnsM9MAtGn5hmcIGjm303OA7nflGVSVEC03S1WUHdlJ+
         4qsw==
X-Forwarded-Encrypted: i=1; AJvYcCWzMje0gy4GUo2e9DB9DI4FNok0UghKSkSmNplaAkz58IeYBwqyS7dRcvQvuS7ndxCP+RpVld9KYRuIvwJTnGcl@lists.infradead.org
X-Gm-Message-State: AOJu0YzEV8YaC2QhrUUcAboeMhEJ/VdvAsb4zWbrrMOibkWaNXh7qD/J
	wYVOdf3+wFm7SBDBAG/qE2QriNLrv0g7CtjMPmgZgnVmOopWa/9a1tuOylQvnbqbO1nb83vzGUp
	xJWokdcu5jt+rapuPGakDpnISHFUJutg=
X-Gm-Gg: ASbGncvAHOHid84RUGBgGZkPO9ekV1ecO9lnSkhWWQ04k63Kc7lx4rE6VUNXYLumcvT
	/phdZUvnZFA+gW21hAKCS5bjkErlNER+JNT9dJdZUfW2OfcNNLt9Z9zFmA6YxICRDfCxPL5kcIM
	2fnanAxlzUQdv8j2bBXvTq6eX3IACiDm5t14wNo90w9m4S8jrQB3KQHrklRI8wE47FfoU7vw21j
	T57HTEVQLPGIzwf8VpR64kAmsZzbID0dFcvloW+1Ax+3y/KsYmfqsf3Tbyde0h5vVU2Pis02o9q
	ICTLcg==
X-Google-Smtp-Source: AGHT+IGKr+SF3i4IMqwtFmH1LrnsWvseLPJ1eP5fnws2PS56tgVe0SFilID5gX/syOfN/2tpbyjVHNc8lJjWhGJSBeY=
X-Received: by 2002:a05:6e02:3784:b0:433:2812:8066 with SMTP id
 e9e14a558f8ab-4348c91b9ecmr67887805ab.23.1763168998948; Fri, 14 Nov 2025
 17:09:58 -0800 (PST)
MIME-Version: 1.0
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
From: Rob Clark <robdclark@gmail.com>
Date: Fri, 14 Nov 2025 17:09:47 -0800
X-Gm-Features: AWmQ_blMGRjNwnGFGy7X8EnS3-0DGpK0qt7AurVAQy8ubC4mlk6tdicKfSfYn9U
Message-ID: <CAF6AEGt=qUeEcNbyETriZLnpwt+Zg7K2N7SUsc4Riu5z54VaoQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/20] drm/msm/adreno: Introduce Adreno 8xx family support
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>, 
	Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>, 
	Jessica Zhang <jesszhan0024@gmail.com>, Marijn Suijten <marijn.suijten@somainline.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jonathan Marek <jonathan@marek.ca>, 
	Jordan Crouse <jordan@cosmicpenguin.net>, Will Deacon <will@kernel.org>, 
	Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Connor Abbott <cwabbott0@gmail.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
	iommu@lists.linux.dev, devicetree@vger.kernel.org, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>, Rob Clark <rob.clark@oss.qualcomm.com>, 
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, Krzysztof Kozlowski <krzk@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_171000_485828_848665BE 
X-CRM114-Status: GOOD (  37.15  )
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

On Thu, Nov 13, 2025 at 3:29=E2=80=AFPM Akhil P Oommen <akhilpo@oss.qualcom=
m.com> wrote:
>
> This series adds the A8xx HWL along with Adreno 840 GPU support to the
> drm-msm driver. A8x is the next generation in the Adreno family,
> featuring a significant hardware design change. A major update to the
> design is the introduction of 'Slice' architecture. Slices are sort of
> mini-GPUs within the GPU which are more independent in processing Graphic=
s
> and compute workloads. Also, in addition to the BV and BR pipe we saw in
> A7x, CP has more concurrency with additional pipes.
>
> From KMD-HW SWI perspective, there is significant register shuffling in
> some of the blocks. For slice or aperture related registers which are
> virtualized now, KMD/crashdumper has to configure an aperture register
> to access them. On the GMU front, there are some shuffling in register
> offsets, but it is manageable as of now. There is a new HFI message to
> transfer data tables and new power related features to support higher
> peak currents and thermal mitigations.
>
> Adreno 840 GPU is the second generation architecture in the A8x family
> present in Kaanapali (a.k.a Snapdragon 8 Elite Gen 5) chipset [1]. It
> has a maximum of 3 slices with 2 SPs per slice. Along with the 3-slice
> configuration, there is also another 2-slice SKU (Partial Slice SKU).
> A840 GPU has a bigger 18MB of GMEM which can be utilized for graphics
> and compute workload. It also features improved Concurrent binning
> support, UBWC v6 etc.
>
> Adreno X2-85 GPU present in Glymur chipset is very similar to A840
> architecturally. So adding initial support for it requires just an
> additional entry in the catalog with the necessary register lists.
>
> This series adds only the driver side support along with a few dt binding=
s
> updates. Devicetree patches will be sent separately, but those who
> are interested can take look at it from the Qualcomm's public tree [2].
> Features like coredump, gmu power features, ifpc, preemption etc will be
> added in a future series.
>
> Initial few patches are for improving code sharing between a6xx/a7xx and
> a8x routines. Then there is a patch to rebase GMU register offsets from
> GPU's base. Rest of the patches add A8x HWL and Adreno 840/X2-85 GPU
> support.
>
> Mesa support for A8x/A840 GPU is WIP and will be posted in the near
> future.

mesa support: https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/384=
50

BR,
-R

> [1] https://www.qualcomm.com/products/mobile/snapdragon/smartphones/snapd=
ragon-8-series-mobile-platforms/snapdragon-8-elite-gen-5
> [2] https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/commit/5fb7=
2c27909d56660db6afe8e3e08a09bd83a284
>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---
> Changes in v3:
> - Squash gpu smmu bindings patches for Kaana and Glymur (Krzysztof)
> - Reuse a6xx_flush() and drop the patch that added submit_flush callback
> - Fix GBIF configs for a640 and a650 family (Konrad)
> - Add partial SKU detection support
> - Correct Chipids in the catalog
> - Add a new patch to drop SCRATCH reg dumps (Rob)
> - Read slice info right after CX gdsc is up
> - Don't drop raytracing support if preemption is unsupported
> - Drop the unused A840 pwrup list (Konrad)
> - Updates to A840 nonctxt list (Rob)
> - Capture trailers
> - Link to v2: https://lore.kernel.org/r/20251110-kaana-gpu-support-v2-0-b=
ef18acd5e94@oss.qualcomm.com
>
> Changes in v2:
> - Rebase on top of next-20251110 tag
> - Include support for Glymur chipset
> - Drop the ubwc_config driver patch as it is picked up
> - Sync the latest a6xx register definitions from Rob's tree
> - New patch to do LRZ flush to fix pagefaults
> - Reuse a7xx_cx_mem_init(). Dropped related patch (Connor)
> - Few changes around cp protect configuration to align it with downstream
> - Fix the incorrect register usage at few places
> - Updates to non-ctxt register list
> - Serialize aperture updates (Rob)
> - More helpful cp error irq logging
> - Split A8x GMU support patch (Dmitry)
> - Use devm_platform_get_and_ioremap_resource in GMU init (Konrad)
> - Link to v1: https://lore.kernel.org/r/20250930-kaana-gpu-support-v1-0-7=
3530b0700ed@oss.qualcomm.com
>
> ---
> Akhil P Oommen (20):
>       drm/msm/a6xx: Flush LRZ cache before PT switch
>       drm/msm/a6xx: Fix the gemnoc workaround
>       drm/msm/a6xx: Skip dumping SCRATCH registers
>       drm/msm/adreno: Common-ize PIPE definitions
>       drm/msm/adreno: Move adreno_gpu_func to catalogue
>       drm/msm/adreno: Move gbif_halt() to adreno_gpu_func
>       drm/msm/adreno: Add MMU fault handler to adreno_gpu_func
>       drm/msm/a6xx: Sync latest register definitions
>       drm/msm/a6xx: Rebase GMU register offsets
>       drm/msm/a8xx: Add support for A8x GMU
>       drm/msm/a6xx: Improve MX rail fallback in RPMH vote init
>       drm/msm/a6xx: Share dependency vote table with GMU
>       drm/msm/adreno: Introduce A8x GPU Support
>       drm/msm/adreno: Support AQE engine
>       drm/msm/a8xx: Add support for Adreno 840 GPU
>       drm/msm/adreno: Do CX GBIF config before GMU start
>       drm/msm/a8xx: Add support for Adreno X2-85 GPU
>       dt-bindings: arm-smmu: Add Kaanapali and Glymur GPU SMMU
>       dt-bindings: display/msm/gmu: Add Adreno 840 GMU
>       dt-bindings: display/msm/gmu: Add Adreno X2-85 GMU
>
>  .../devicetree/bindings/display/msm/gmu.yaml       |   60 +-
>  .../devicetree/bindings/iommu/arm,smmu.yaml        |    2 +
>  drivers/gpu/drm/msm/Makefile                       |    2 +
>  drivers/gpu/drm/msm/adreno/a2xx_catalog.c          |    7 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.c              |   50 +-
>  drivers/gpu/drm/msm/adreno/a2xx_gpu.h              |    2 +
>  drivers/gpu/drm/msm/adreno/a3xx_catalog.c          |   13 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.c              |   52 +-
>  drivers/gpu/drm/msm/adreno/a3xx_gpu.h              |    2 +
>  drivers/gpu/drm/msm/adreno/a4xx_catalog.c          |    7 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.c              |   54 +-
>  drivers/gpu/drm/msm/adreno/a4xx_gpu.h              |    2 +
>  drivers/gpu/drm/msm/adreno/a5xx_catalog.c          |   17 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.c              |   61 +-
>  drivers/gpu/drm/msm/adreno/a5xx_gpu.h              |    1 +
>  drivers/gpu/drm/msm/adreno/a6xx_catalog.c          |  369 +++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.c              |  287 ++-
>  drivers/gpu/drm/msm/adreno/a6xx_gmu.h              |   25 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c              |  393 ++--
>  drivers/gpu/drm/msm/adreno/a6xx_gpu.h              |   31 +-
>  drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h        |   18 +-
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.c              |   53 +
>  drivers/gpu/drm/msm/adreno/a6xx_hfi.h              |   17 +
>  drivers/gpu/drm/msm/adreno/a8xx_gpu.c              | 1205 ++++++++++++
>  drivers/gpu/drm/msm/adreno/adreno_device.c         |    4 +-
>  .../gpu/drm/msm/adreno/adreno_gen7_0_0_snapshot.h  |  420 ++---
>  .../gpu/drm/msm/adreno/adreno_gen7_2_0_snapshot.h  |  332 ++--
>  .../gpu/drm/msm/adreno/adreno_gen7_9_0_snapshot.h  |  470 ++---
>  drivers/gpu/drm/msm/adreno/adreno_gpu.h            |   38 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx.xml      | 1954 ++++++++++++++=
+-----
>  .../gpu/drm/msm/registers/adreno/a6xx_enums.xml    |    2 +-
>  drivers/gpu/drm/msm/registers/adreno/a6xx_gmu.xml  |  283 +--
>  .../gpu/drm/msm/registers/adreno/a7xx_enums.xml    |    7 -
>  .../drm/msm/registers/adreno/a8xx_descriptors.xml  |  120 ++
>  .../gpu/drm/msm/registers/adreno/a8xx_enums.xml    |  289 +++
>  .../gpu/drm/msm/registers/adreno/adreno_common.xml |   12 +
>  36 files changed, 5008 insertions(+), 1653 deletions(-)
> ---
> base-commit: edf57d8dafc63f9298a209e518ea6a2e0df78ed0
> change-id: 20250929-kaana-gpu-support-11d21c8fa1dc
>
> Best regards,
> --
> Akhil P Oommen <akhilpo@oss.qualcomm.com>
>

