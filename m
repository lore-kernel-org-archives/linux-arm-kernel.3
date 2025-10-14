Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7F1ACCD192
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 15:04:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=; b=mw0z9r7vxIly07
	B3nA3JjmsU7gt7WqHtb4n0oLJ2FagwMELHXCCvQji/zSHICL5VS7czRAJCEByb/7u+MegXppBP8mb
	Gb7WUvpKahRX/A9vYcOwhDTFoAJH4bx6A/du/MTPbpJgW926i2CAJU0OCiZzpo77WU8yeMgpF4nGa
	EKV44703iT+inEtCjZtVqKEvbD5NOF/qi4DJAThpnhayI8HunWP+gbzDDv5uR9E5FGemj9eAEx+yr
	FwlXLtR91L5KOXQTSgD+kVaST+szhCCn3VgIkPDB+xhMFEErchMJ2PyEC7uR9o8GrggLwlNaV9n2N
	DqL+FOJ/7JeVPct2PHfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZa-0000000GiYl-3n1e;
	Tue, 14 Oct 2025 15:04:22 +0000
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8gZY-0000000GiY1-3Snk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 15:04:22 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-3322e63602eso7311187a91.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 14 Oct 2025 08:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760454259; x=1761059059; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=ADt567g6pMuxn4tJujPAkORvy+UlMeHHzP+Qaq/mfC9azbuyG3khywLucT6284Gj7n
         6mn/jEbOSLBFV1VS24++iqwrtvmeJW8lhTw2HrZ2APKbztUHF4b5LPjieqMt/ofhHFq6
         3A3o8K475yawZ8Qe4bGTQb6uLLlp/znLeRL+cY5yB/v/YCAnAhi3ar9yTzS0s0MHVIzY
         GM2Pb92bBS1xs/cjYiJ2fD5DezogR22+UHzc3Q77ugCjGijCb4wQfznOESpAm3UCF+Ry
         u1pliTCuk20XAvylBxus8yHWAfCpdsoTF3kF8Qedkbu6aBcUG3alP1h6bOYkxIq7C81I
         g5Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760454259; x=1761059059;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=rqRdLALGx0ffjdrF1fF4DXMlc0gTtso40WX7y7ASZS8LPUOwHEHJsEnjTTCFkgPiSt
         00uipv1UzlqEnnFU0rGWkcmdR6nE3qPSL+ruM5QqsGk2u6zVv9lsdodmT04Tp83FF05K
         Q7VB6lxCmPMeVVO0lCDNJLMV57PdpMau4dKKpkrYyKUsjWq+MYozsV0k+nqqSEgTDOP+
         AEcd8z5RpZYCYoPH440RzZ6yNm+vSLq4EqZ1zfkADCgTS2QSuY9FsbcleJ0bxrWrE+h9
         tsIMhcBhRiPtBM/h18JSNv1yoWrXKzOXnm1CzaDw8SBxXGnd1lwBB27PwzrYC2yPjmc+
         sj9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVe6+JXNuswbwSj+/3dUfoKUAHpcIRwaqdWgbw99YJiVVeZubiKn5Mgmas5Y1vLwIud7DJPdIQo5yXv+PSY25bD@lists.infradead.org
X-Gm-Message-State: AOJu0YwTSRkHTicCN8TZK2Pev+4LBI5CvQUgp+6unNjFBN4rN5Ts4XGs
	29TVOHnVwmt4yp45VraIjx4/PmrPVkRqoxfeBl9ajmYKAdfVUZvOZ62f
X-Gm-Gg: ASbGncvcLbJhiSUcogTOaY+X5f/6rhtybt8Rr3ONvMNPT7va0fDYIBeILcIQX48lZ9i
	1maYvYNKRIGdTYBcs5pIA5pU8MbJtEdAXez0LQUxWzbrvAkN5isPjVd72peQyDHgGlKL2xzhbPY
	QElz8H4sND/bHYX4RrOvaNAEWs9EQN3o17XbhkXfe2PzyFCpURMf0yOeFlP68r3+zutlsK4AlWt
	jq1dJRtTdTzXUnnX+F/LNYNOvWxhvLTf5WnFGZci5PV9a3UTcldZPfMFvVPielIAGphLXvzGkOv
	KRY+XdnGAvqixkvUeExLgQwnybFiMfEx9wuiDvRKNgj8nkr3txu5/AZyvBXjIQzba2WpJXqAsOZ
	pU0RYv4z2yXl+mt5h982GP7hAbPWUVk+l+uCqV746Vtr9YSp2pCiLHg==
X-Google-Smtp-Source: AGHT+IE+ErcXbwTZcmHrpt9vXdMDhxxBi8n4fGgsjBr4Oe2R65kjMNzjkJiv6etQPJqpr8mgUcHrpg==
X-Received: by 2002:a17:90b:4fcc:b0:33b:6612:67ee with SMTP id 98e67ed59e1d1-33b6612716fmr19725254a91.26.1760454259092;
        Tue, 14 Oct 2025 08:04:19 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id 98e67ed59e1d1-33b61a1d3cfsm16258161a91.2.2025.10.14.08.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 08:04:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v8 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
Date: Tue, 14 Oct 2025 23:02:33 +0800
Message-Id: <20251014-apple-cpmu-v8-0-3f94d4a2a285@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4373; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=+LAKu174f1xhSbC2VdiHkWIZYXz3wYKQPJAQC4FzNig=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBo7mZpudLIC0ztBCR7veCzHpSumy3IXrkXmK+WF
 shTYDMipyeJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaO5maQAKCRABygi3psUI
 JBpbD/9zBv/huVKZJ8IpyeFgjJjZmiHx/3KJRuMcQFwhivibfox60KC8x+1heW/D3HwX4LW/Czj
 xQugtm39kAArMmFQc+zz+yKSM+HdmHS5ay3cgBiL/MZngarp6b2NtWJkPrbTrphEMWpJGRGFKNy
 H7k8Pq09SArzR2ByrdW5JsZeg3Y1t9LFozaTKcS5TxxjN2/14UGlH72Cdi2t4m90ejluBVqJAWm
 llDdiqoz42+8ws6PE5JIW9/oo3J5MbE82arkjAwoVSnamu6uG4OM3zdrYRFk3e6VLrgx5PxVlIq
 EKf2LP/Ei9QKvoF2Eg458VIOTHWeXeqrcIwlFl6Xnc7Ohq7SKVe+Sif2xRrHDsV4fDKsagSL93B
 XTGEdpjbFus7FPdei2OZWjr5CK8d22frrttrMPd52UBR7Ln0C83jI9oJpwKpYIm9grGe/Lvy5h5
 CqPcKEOiI/qoGK5jR63J61ZRgEtnHxbGXvtSY831JqpndFQbeBnfbAjvA7N/dG4BWbxn7Rzj+lT
 sy/eQB1W12OfV/bW3Kt7PLCHGF+42BGc2/Xt07HFVpPQLriHeWlF0AbhCPp+HOLnwzKSET8JSZF
 0gu5+lTvn/Wo2B9JazUvGpS0FMpQVizhOoBtWdNceYsYcGQRuhxL1IEFS1AIxI4mw/0Y8OQtoc2
 QyxW5EWmFHVV3WQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_080420_887706_5B0F6F63 
X-CRM114-Status: GOOD (  15.19  )
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

This series adds support for the CPU PMU in the older Apple A7-A11, T2
SoCs. These PMUs may have a different event layout, less counters, or
deliver their interrupts via IRQ instead of a FIQ. Since some of those
older SoCs support 32-bit EL0, counting for 32-bit EL0 also need to
be enabled by the driver where applicable.

Patch 1 adds the DT bindings.
Patch 2-7 prepares the driver to allow adding support for those
older SoCs.
Patch 8-12 adds support for the older SoCs.
Patch 13-21 are the DT changes.

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v8:
- Rebased on top of v6.17-rc1
- Collect Ivaylo's Tested-by
- Drop #define PMCR1_COUNT_A64_EL3_0_7
- Reword reason to not initialize PMUv3 remap in EL1
- Link to v7: https://lore.kernel.org/r/20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com

Changes in v7:
- Fix a W=1 compile warning in apple_pmu_get_event_idx() as appearently using GENMASK()
in a function prototype causes a warning in GCC.
- Link to v6: https://lore.kernel.org/r/20250407-apple-cpmu-v6-0-ae8c2f225c1f@gmail.com

Changes in v6:
- Rebased on top of v6.15-rc1 (Conflict with FEAT_PMUv3 support for KVM on Apple Hardware)
- Add patch to skip initialization of PMUv3 remap in EL1 even though not strictly needed
- Include DT patches
- Link to v5: https://lore.kernel.org/r/20250228-apple-cpmu-v5-0-9e124cd28ed4@gmail.com

Changes in v5:
- Slightly change "drivers/perf: apple_m1: Add Apple A11 Support", to keep things in
chronological order.
- Link to v4: https://lore.kernel.org/r/20250214-apple-cpmu-v4-0-ffca0e45147e@gmail.com

Changes in v4:
- Support per-implementation event attr group
- Fix Apple A7 event attr groups
- Link to v3: https://lore.kernel.org/r/20250213-apple-cpmu-v3-0-be7f8aded81f@gmail.com

Changes in v3:
- Configure PMC8 and PMC9 for 32-bit EL0
- Remove redundant _common suffix from shared functions
- Link to v2: https://lore.kernel.org/r/20250213-apple-cpmu-v2-0-87b361932e88@gmail.com

Changes in v2:
- Remove unused flags parameter from apple_pmu_init_common()
- Link to v1: https://lore.kernel.org/r/20250212-apple-cpmu-v1-0-f8c7f2ac1743@gmail.com

---
Nick Chan (21):
      dt-bindings: arm: pmu: Add Apple A7-A11 SoC CPU PMU compatibles
      drivers/perf: apple_m1: Only init PMUv3 remap when EL2 is available
      drivers/perf: apple_m1: Support per-implementation event tables
      drivers/perf: apple_m1: Support a per-implementation number of counters
      drivers/perf: apple_m1: Support configuring counters for 32-bit EL0
      drivers/perf: apple_m1: Support per-implementation PMU startup
      drivers/perf: apple_m1: Support per-implementation event attr group
      drivers/perf: apple_m1: Add Apple A7 support
      drivers/perf: apple_m1: Add Apple A8/A8X support
      drivers/perf: apple_m1: Add A9/A9X support
      drivers/perf: apple_m1: Add Apple A10/A10X/T2 Support
      drivers/perf: apple_m1: Add Apple A11 Support
      arm64: dts: apple: s5l8960x: Add CPU PMU nodes
      arm64: dts: apple: t7000: Add CPU PMU nodes
      arm64: dts: apple: t7001: Add CPU PMU nodes
      arm64: dts: apple: s800-0-3: Add CPU PMU nodes
      arm64: dts: apple: s8001: Add CPU PMU nodes
      arm64: dts: apple: t8010: Add CPU PMU nodes
      arm64: dts: apple: t8011: Add CPU PMU nodes
      arm64: dts: apple: t8012: Add CPU PMU nodes
      arm64: dts: apple: t8015: Add CPU PMU nodes

 Documentation/devicetree/bindings/arm/pmu.yaml |   6 +
 arch/arm64/boot/dts/apple/s5l8960x.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s800-0-3.dtsi        |   8 +
 arch/arm64/boot/dts/apple/s8001.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7000.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t7001.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8010.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8011.dtsi           |   9 +
 arch/arm64/boot/dts/apple/t8012.dtsi           |   8 +
 arch/arm64/boot/dts/apple/t8015.dtsi           |  24 +
 arch/arm64/include/asm/apple_m1_pmu.h          |   2 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 870 insertions(+), 35 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


