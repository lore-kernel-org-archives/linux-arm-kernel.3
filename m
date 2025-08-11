Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A874DC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 14:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=; b=bh7sKe4t77Cilh
	+jlg+x/AtpuXcNdvPR4OJvCGUi6aLSVJghJ/AbjeMqVCy+ZWyARMh1A34q9VEeFudQPHf5eZbPgTk
	91SeZPbzJJVq8IAW5WL082AD2dagI0tc6sczT0KfOopIxgYAy6UWH5Am/JkQuYlwhjLnUIgXC/rxg
	xisviCMCVeduT/gK74RkOUEgmzGVCkFOCe4mx/gIH3XoDKYbmOX2fgLbp0ARk/oIOcA9ChLZ7eNjJ
	tuWBool6DN1IzWZDhGOwkIBlqVFTlAuWUkTiQaSlrnuoB4/zzwSJHpKl54Q4kwDlV+Yh7ANshpg2V
	87TnIdnWG7feECKxiyDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulTnH-000000085EM-2EHl;
	Mon, 11 Aug 2025 14:46:35 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulSzh-00000007tuR-39NJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Aug 2025 13:55:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-76bd2b11f80so3878570b3a.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 11 Aug 2025 06:55:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754920521; x=1755525321; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=jlThqrAfWDUe4IEDVpNY5/q1cJdYX0p78SzuoXtwzNvRFbGIsv0raaRd8p9WdW8EH0
         J1TDm+o85mWOqsV83F9H5cEyugF8xGBQ7QrYhxYmMT24nrQDAhixhI4Bhjx44hGtBmYV
         ocqPjqFfy4byU5SoMsAi8CZLG+ufKFVcrgqQrmEmOLN7HiOep1wn1MhsLjRvumRZoGK9
         whrQSLCqIt4rT5NBoF00sn0UBrXgkD3WtM8Wz2UjxRaiNfbSnP9IzVonQspzpNtHskY3
         RDkHN0tLaBUZ+cykfNGfoDVJGIKCbPtTn/P00igAxhY5K3KYf9Mgy9leWciy4yMsHxxy
         U0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754920521; x=1755525321;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=JxD4tCkhkQJyNIYD/uaRI0qXy8Fj/1Dzer2wv7cgg8EuF57jlnk9zZGDrT6O2XKylZ
         +q/2rin43+j29kBRM1PETI+eiJJtHRTUmCLr9v3wNDdCp9VLB1CuGwrBKJCKxLEb315s
         5y6bX6NrPOHa0X4paUdReLjTCtYY1QszOAgIc8xCVKKbWjORbPFqeK7AwPX6saEn16Zk
         QPaEhIlEUmQEerRwZN8vvmz4xoBsXoyxZ7xBFuERYEzCPKcCgqW+YH5S40nkFo2xcIZy
         e2TEFJKQ48VH2EJiOEBn3fhrGcPIzDgSHNgNcCDe3aczxlnjgQCYWUa9GxWdBRwjOCGT
         TJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCVUDIt3kx0F8rGqUSxNwT3gsHOw1u7rKbhdcRLb3cFi7VOeOVdg08Pf7RKCOSzcmKuWY+9YLNpDX78OkwhVBTWt@lists.infradead.org
X-Gm-Message-State: AOJu0YyrsfDmtLmyD1arqdirzQYCZbY0a7dxOJrouoOTLn903HsFso43
	WpYUsNPLljf2hihA7qvRnQGmtVO6xdTMx0prvbLygq3mJfDxzB40gc7Z
X-Gm-Gg: ASbGncuaVBaYk29kTRvF4JwXk2qd5ZQsCxuYmakRgXa0tEAM2gXW9PYYnvMdg2JZg0f
	RPBjZk6p4jr4k8Xiiw+w0qM2WkgAKCmt+f9H3eKGl1RyvUBmrc6sjVs+A2mp+rjVmwZH83EOMpi
	EyjAMDhwg9Ln7tWncqNmgrX6KYT/+/gkhzJoznkawi6LkPvVPT7qRBScpsCXe+yj+wqh5UEnfPk
	Bi19wMkG/wg7iAvLgkNrE6fADn5r1aQCKEzMku5yYXHMNy4+y6ySLYg+XrwKZcnfjeGqcsnu42J
	bJQYD+ONbEytpnT6p2cy3vPlfUrojta6zuPG/VkOKtUxaQdQJk4jYmpizb+VMe02beD1azhdSq+
	c4JRYptq1Jy20ATYwh8LkLqhQ8Ecl0wbzeBZx87rQ66tjjD9G4iEw3Yb6eg==
X-Google-Smtp-Source: AGHT+IENxJyKg8e2tAP2l4pvGlyIwFK3L3UGuIA5zM1QHUrPj8V2EFyRgxWPSC9CGd+swIwok6HwCQ==
X-Received: by 2002:a05:6a20:6a0a:b0:23d:cf88:e31e with SMTP id adf61e73a8af0-2405500e280mr21954086637.8.1754920520924;
        Mon, 11 Aug 2025 06:55:20 -0700 (PDT)
Received: from [127.0.1.1] (061092221177.ctinets.com. [61.92.221.177])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b422bb1133fsm23585496a12.56.2025.08.11.06.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Aug 2025 06:55:20 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v8 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Mon, 11 Aug 2025 21:54:32 +0800
Message-Id: <20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABj2mWgC/3XPQWrDMBAF0KsErasijSRr3FXvEbqQR6NEEMfGb
 k1K8N0rB0psly7/wPv8uYuRh8yjeDvcxcBTHnN3LQFfDoLO4XpimWPJAhQ4BVrL0PcXltS3X9I
 FF0wMprZoRAH9wCnfHmXHj5LPefzshu9H96SX628NrGsmLZVMSD5BIO2teT+1IV9eqWvFUjPBm
 poNhULRN6bStQFG3FPzPzWFNuwThsgRddpTu6Z2Q+0yOFFQbJ22nvfUrSjghrpCa9ZgKQJytHt
 aPalVfkOrQgMjQQJw9Hewf1Kn1Yb65ddY7tRU5ECt6TzPP8dqajwGAgAA
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBomfZAzeYECu3q9NXPYbpcYcvwUCODSxZ5a4119
 wtG+Jdk0MSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaJn2QAAKCRABygi3psUI
 JIh2EACPm7iZczQOtNsl2grpezfen4As7n0d//LN0qy3Ld3fMEkyBoW9c5vVIsSm7X03a35pPtq
 3a3dIbo5xCsN61OmqliYDNotIpnMXzslz+7jtgdfTdM/qygjXB0q/ZEUQpSUO/Eg/G1JeV5QsAI
 iBdrY0BaokZnPbg13soaR9dO9r8rWlEpHkzj4XOwiD3gvZ/sFjKSJGnMEsm0MQgxpFVc7cty2sz
 9C2QXBvMXSUjFVzQCIPsrj50Y08lfpL72kadxbGolxpe2x4/zfTIGS7oJhz4smU54IMakcwznjl
 VebELeykl8bm4BDv/m/RPz9KgebuabPPi4/WyQGYkMfj2WTY8RObTmg9l8gbneuM2D132ZruiON
 QxNcXSlseDl5TBIWRcXkrw0DlHvxAsw+OTqIY/EOV0+ih81PSQHtVxx1IfgKPY7P/U/v0M1GioU
 FG6UxNVff6odUQu7OLONzY0Twmc7tCgOiwm2BQDHnDLmSgsxHeeVbPmLKrxmQ0mg6QAfNLT1Hcu
 TEPOsKAm8CR5EO6d6ERkN1hYsrWGOqOR3dPU4fINpCdEkBbt+CouNYtPkdZE5SSL5KKYezyDaOb
 XPUA3ZpMxMKYaAD7FZEHxwj3kOf39SJxxZ/KMsSRn+T1WkXqR4hZ65wmcz5W4894H9poMX4T6sV
 aiBYe2hh5qgTWXw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_065521_803882_D8FE5E6B 
X-CRM114-Status: GOOD (  15.03  )
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


