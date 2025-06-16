Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4AEEDC71135
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 10:21:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QyIJw42bLVYC1qcn4Rgc4aSobkAPjVXS0kJvM4KjVSE=; b=J/R5GOnHfJLjnVelDIq+LKi0f6
	fuHwbG7uXBwpQFXFMC0Z9BJ1RXeG2lK3yzmD8UMflr/rKMG6LD+wVJOD/L/5VhOeZRyOTr3qsWUx7
	B8vDh/DxUgAOOGwOr2BNGW0kVSfl+vP5x+Qy04kp1ckw7MNQt87M7Vv9A9sYMhpFqKg/z7eFFjE0r
	JOHCv+SpTmpDrzp3v+RzY2ASz7w6aJ4LuqbHYcBy88/AAHnHMm6VYJqpGKKnNtbtC/hX8WVhzK20E
	z0k5lg4BOLWKk907kBXBA6tMl7sxFJrvQ8NhMEOml+fHgV4H8eMTom+wB5QmceJGTEsbB7qytto+P
	9NpNPZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6xf-000000043Q8-10eu;
	Mon, 16 Jun 2025 10:21:07 +0000
Received: from mail-il1-x136.google.com ([2607:f8b0:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR6GV-00000003w0J-0K9n
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 09:36:32 +0000
Received: by mail-il1-x136.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so331075ab.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Jun 2025 02:36:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750066590; x=1750671390; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QyIJw42bLVYC1qcn4Rgc4aSobkAPjVXS0kJvM4KjVSE=;
        b=TWDZIoeHIajGoXlknkx9nvAq+LEbiiYnM9h1yD8Ut+RPTD7Tk9oQBMnjXbFRrcp8bd
         t2M7xYsbvNgBfVgIm2+opmzg5S1c5jhgxYr1ZYHPYTmCjYAFZ1h2pqm/fA5gMKznPWsc
         FQPQOu+pGO/Ubw3hF2qSjs4CqYGa8MU0y7AqN8ocrvtMZG9OXlm59E+nxTL2wl7oV3VK
         ETfpnJY+c1x0zo2+9EPkL7DtlOEppz8VdlmpKJ4EaoL9RgpFrLnN2hZwipjmcoQYcMQi
         Ef2woKx//L5nHzMQ7UXMoitWnrE0Dhsb5gygSt252fdeGVgpFv8SbgvbFPWXv7AYsqg1
         slaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750066590; x=1750671390;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QyIJw42bLVYC1qcn4Rgc4aSobkAPjVXS0kJvM4KjVSE=;
        b=hTCfCkiqzITFs+8vn08HgMDkSoh9+bmwOj8eS8BLCbGnyJY2OkvAc2PVASLeoIyrag
         Sn72gMEMGoSh26PErn85BxdENSdyZebzIaNTQfzhLq4vMFXWQeetr5ySXnMbrbNHm+oc
         9Jr/6dqxXoTEb5AYnsr2nKjySN+PEnxGQwpqM1ZDiKvAjZRh9xBoUsQSOkN4vzPE6oQA
         TaHC0g6IUxlW59tdVFBM44vyzvJuCTdwVYOwDPYUPxghJOKCeX4SDRniRLWiJW34rGkp
         KA+zGmU/toizMJvdW5GEE0Ge8bUhBPBhAh7NRT4EN3OQD7giWcgQGiv2vnmqWPMvykq4
         SmzQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5RLj1M1SeJoKAdEqVLGdVLmyLghJ8YsllnD76XEakzDWHGdB3ANJuWRaiTf0Idwa/cyjgpkCnheKnzL9nuTNX@lists.infradead.org
X-Gm-Message-State: AOJu0Yzc4OT32IBpT+WPTwy74bV/j+Gd6CwG+EZbQ9GwRaGIq3PH5GGZ
	FcKa73fvVAHz6fZcqdl21QPrvAIwokUUgWJuT+/fy0SEycSm2dr0sTn9Oqmoa4vspHKRPw4HNVi
	hv9ytEc4sojMg1yZNjQHFFc6EvgKtCSV2Rf7wSOZK
X-Gm-Gg: ASbGncuDP5zdjzlA3l4cj8bY4FRaq6Q9Yu6Pna9fvL8ccYFibsVU8afhjj/fTQrsWsI
	QbAi/9/3tDFbHKL8aJGJwnBguNW7ACZVY/JeKdd8c/SFNaxZ4tGi02R+Z3E2fkXvx32MIyfoD20
	3Ks/Yi8kodDxE0Zc3wCgC9YhTm39MH9R6uLmL1ZrKgtm6dGPhuKlmVCe8=
X-Google-Smtp-Source: AGHT+IExfs1Lq6bAplJAKpnyknLozpvmj2f++NKi/uCJl7EYtWLFqXP60HhaEqVs4L7q3T5Sh2zeIsfSjUd+hwvQ/JE=
X-Received: by 2002:a05:6e02:1d9b:b0:3dd:a4b7:c737 with SMTP id
 e9e14a558f8ab-3de09fc2b9emr4321945ab.19.1750066589976; Mon, 16 Jun 2025
 02:36:29 -0700 (PDT)
MIME-Version: 1.0
References: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
In-Reply-To: <20250616-apple-cpmu-v7-0-df2778a44d5c@gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 16 Jun 2025 02:36:18 -0700
X-Gm-Features: AX0GCFtd-Ymhas6vUanWJK_PcvegJqPI2_88M-JzDIHqHHA6qrjOwNHCJCZ3ZL4
Message-ID: <CAP-5=fXSwgxMc+uh=PBAFh4Zm96tL5RDyKPOJ8Q40O4s=EaArA@mail.gmail.com>
Subject: Re: [PATCH RESEND v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
To: Nick Chan <towinchenmi@gmail.com>
Cc: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>, 
	Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
	asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_023631_141759_DAC04CD8 
X-CRM114-Status: GOOD (  26.02  )
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

On Sun, Jun 15, 2025 at 6:32=E2=80=AFPM Nick Chan <towinchenmi@gmail.com> w=
rote:
>
> This series adds support for the CPU PMU in the older Apple A7-A11, T2
> SoCs. These PMUs may have a different event layout, less counters, or
> deliver their interrupts via IRQ instead of a FIQ. Since some of those
> older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
> be enabled by the driver where applicable.
>
> Patch 1 adds the DT bindings.
> Patch 2-7 prepares the driver to allow adding support for those
> older SoCs.
> Patch 8-12 adds support for the older SoCs.
> Patch 13-21 are the DT changes.
>
> Signed-off-by: Nick Chan <towinchenmi@gmail.com>

Hi Nick,

This is substantial work and it looks good to me. Do you know why
there's been little progress on landing these patches? Buggy Apple ARM
PMU support in the kernel has led to reworking the perf tool. It seems
best that we can have the best drivers possible.

Thanks,
Ian

> ---
> Changes in v7:
> - Fix a W=3D1 compile warning in apple_pmu_get_event_idx() as appearently=
 using GENMASK()
> in a function prototype causes a warning in GCC.
> - Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f22=
5c1f@gmail.com
>
> Changes in v6:
> - Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM o=
n Apple Hardware)
> - Add patch to skip initialization of PMUv3 remap in EL1 even though not =
strictly needed
> - Include DT patches
> - Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd2=
8ed4@gmail.com
>
> Changes in v5:
> - Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to kee=
p things in
> chronological order.
> - Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45=
147e@gmail.com
>
> Changes in v4:
> - Support per-implementation event attr group
> - Fix Apple A7 event attr groups
> - Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8ade=
d81f@gmail.com
>
> Changes in v3:
> - Configure PMC8 and PMC9 for 32-bit EL0
> - Remove redundant _common suffix from shared functions
> - Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b36193=
2e88@gmail.com
>
> Changes in v2:
> - Remove unused flags parameter from apple_pmu_init_common()
> - Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac=
1743@gmail.com
>
> ---
> Nick Chan (21):
>       dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
>       drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
>       drivers/perf: apple_m1: Support per-implementation event tables
>       drivers/perf: apple_m1: Support a per-implementation number of coun=
ters
>       drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
>       drivers/perf: apple_m1: Support per-implementation PMU startup
>       drivers/perf: apple_m1: Support per-implementation event attr group
>       drivers/perf: apple_m1: Add Apple A7 support
>       drivers/perf: apple_m1: Add Apple A8/A8X support
>       drivers/perf: apple_m1: Add A9/A9X support
>       drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
>       drivers/perf: apple_m1: Add Apple A11 Support
>       arm64: dts: apple: s5l8960x: Add CPU PMU nodes
>       arm64: dts: apple: t7000: Add CPU PMU nodes
>       arm64: dts: apple: t7001: Add CPU PMU nodes
>       arm64: dts: apple: s800-0-3: Add CPU PMU nodes
>       arm64: dts: apple: s8001: Add CPU PMU nodes
>       arm64: dts: apple: t8010: Add CPU PMU nodes
>       arm64: dts: apple: t8011: Add CPU PMU nodes
>       arm64: dts: apple: t8012: Add CPU PMU nodes
>       arm64: dts: apple: t8015: Add CPU PMU nodes
>
>  Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
>  arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
>  arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
>  arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
>  arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
>  arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
>  arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
>  arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
>  drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++=
++++--
>  12 files changed, 871 insertions(+), 35 deletions(-)
> ---
> base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
> change-id: 20250211-apple-cpmu-5a5a3da39483
>
> Best regards,
> --
> Nick Chan <towinchenmi@gmail.com>
>
>

