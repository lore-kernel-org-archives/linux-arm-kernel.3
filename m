Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12CB5C3ABC3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 May 2025 15:13:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=; b=wOiENVlKO8bq2Z
	r5CYZu95D8/sU1lIZ/mHPT1nVMcUAZaGI7wehqffWk+ml2qyKwCDyosVNquv703iUjingp2NITvSu
	HhQj9IYkjQFuW2J4K0y/PfKNBdajWA7hTq3VNA3t4lNQsGQ6hoBNHIBz9mA0U4rHqV8gAp4qhlhb9
	/IwfUqrkwXcwNd3xuTtLvpXL3OvkJUEHzeuk0+0NtMoV/4PMZYS4TobgTCfmUt48bi8+QttdewHzm
	VkpbKgZKfMDcGU1YTVK4cnWHG6exk6rHhVHSy9+H+eS4G+zL9914do0TVogJjpBU51QW/5f5v2e+j
	xvq1qeKYtp4c86Iues4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDltT-000000064Sr-0HsR;
	Sat, 10 May 2025 15:13:39 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDlrN-0000000643W-2tAV
	for linux-arm-kernel@lists.infradead.org;
	Sat, 10 May 2025 15:11:31 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso3058990b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Sat, 10 May 2025 08:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746889889; x=1747494689; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=;
        b=ecVynSijW7BEfjbciGSR3o05uS6cSI0iY7KrBVMTiPestcX3r8sJ+JqrzmDnHvZT9n
         tjvEtOXVM98sxtDIVwqwmMefySahWP3PK/M6y1MieA6pK7gwi77qXyzGwWYGDzRSsCxf
         UtjN+aB5emSnmwLCd0Piw0JDU8HeOWoxJiFjeD9x7ekhy8dhsf2hPdr1zybmfkSCalCB
         88Yefv2kQiD4FOYFYQJKuBfGNi+axSG2/r78SxvpB72+qBAdomXVccudrTyWS+tOtIQ0
         mx7jEtaz92qCt7wrfiNYBxFPiA8VgDLt7AJRMVAtcYAgGYzMi9hF5O5Jzvu8hHUcSRQA
         awRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746889889; x=1747494689;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sR6qkQWtty2THn9HV/oPVYY8q0oy4myszmIk0XskAD4=;
        b=WWXhqmYhVAb3DYABdlT2T+i6RFOULrrIoJJHtwvNxbqH+1U9VMNGcmxfGltLpj1xOc
         +yDGOTrJ/WJkfVubt2HMifuePQX/j22gbtAACKLuNZ5/S357GLCroIg0wU8ptO1zgYGC
         yJupDR0QqCa4d69ke7MJNZy1NcWt4X+cpAZkqD/QcUqWBSIPfKl80r0UhE1PQPP16Sog
         tQZQGNSOnGJMwHQGX+jFqj6+Y5hy9WQM0NJ60lhxEKxYGuL9UNE2ADtzRKZjIUyI9lUa
         g5Ly958xVtkeOReT3etRZ5FbeXaIsVt53OMejT9yw+69NqmRhCj5Jy7xVH8RAka2hv7k
         skyA==
X-Forwarded-Encrypted: i=1; AJvYcCVJHtE9Yx0OxBhQ4yTBo3I3z9cYHM2rt7d61tO6IblR+O686jS/793B2YJD0n/YZqyZZ+gsjvlnGyKyE7ju+5XG@lists.infradead.org
X-Gm-Message-State: AOJu0YzAK29G9YcI7Vjt/GaXQ4sB1CW+W55EjXpaMoX8gCJ+TsLBmxM6
	7lGw8eSQhpcxuia02v86UN8M5gt/eIl4jSN3JHF6KjnHsTpPWPObriVkZg==
X-Gm-Gg: ASbGncvf2yBAwBUlaCiuEaCM2ZJW9U2+faVg2fCQbcHv7xIRopXrLoECUwxKkiSydkV
	2U/OQrnIiV6SLfLyepTrv0twezu75wSeWTF8h+ki06TqWrqXdnksnJK7ih67xbV1wVk5DtQy9hz
	uB/V+WiJRWYQhFfeVBt3qwrr7QB65HDDk8JoSR7eM3NYBD/IRI5/TWhcYUqELIJfw+hNwezp4gh
	ofJHHIb0AmpAmhEPqEt6KmLGLn2VS7aA6RQkkdM0Yt758QaZjZS2fLWW9H0+kbHl45BcN03D85L
	REzRna/sHMm4NpwGXwQgPH/3bPVwkI9Xm2HeuEcY8ienEwJ0bB2sEA==
X-Google-Smtp-Source: AGHT+IFqdmSlPKPteFj6aFoaXv53VGI6hMJqHMy/+z2wasnrmqyzjdM63pzuW5ZpYok0awQTBpZ+xg==
X-Received: by 2002:a05:6a20:c6c8:b0:1f5:7873:304f with SMTP id adf61e73a8af0-215abcb169cmr11920239637.37.1746889888698;
        Sat, 10 May 2025 08:11:28 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id 41be03b00d2f7-b2350ddca3asm2990493a12.58.2025.05.10.08.11.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 10 May 2025 08:11:28 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v7 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Sat, 10 May 2025 23:10:41 +0800
Message-Id: <20250510-apple-cpmu-v7-0-bd505cb6c520@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHFsH2gC/3XOQWrDMBCF4asErasijSRr3FXvEbqYSKNEEMfGb
 k1K8N0rB0otQ5dv4PuZh5h4zDyJt8NDjDznKfe3MvzLQYQL3c4scyxbgAKnQGtJw3BlGYbuSzp
 yZCKZ1qIRBQwjp3x/xo4fZV/y9NmP38/2rNfrbwa2mVlLJRMGn4CC9ta8nzvK19fQd2LNzLClp
 qJQKPqTaXRrgBH31PxPTaEn9gkpckSd9tRuqa2oXR9OgRRbp63nPXUbClhRV2jLGmyIgBztnjZ
 /1Cpf0aZQYgyQAFyoH16W5QdDpCuiywEAAA==
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Sven Peter <sven@svenpeter.dev>, 
 Janne Grunau <j@jannau.net>, Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Neal Gompa <neal@gompa.dev>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4111; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=IImZvUkpMAnwhvmBNPBZuUuP3+ZC7bdMT4Tj48zkB6M=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBoH2yHw4CuFivJusE7hlGbbgqG9szRqZ0CujA+7
 0Cf7L4U69mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaB9shwAKCRABygi3psUI
 JPFFEACjXZ1zkTpXhVHIBbRagB67W1YYYd1s69NMFjN6J086u6h0kJPWk9bwFUXgVaemwUZMZBV
 AEcyPcPPaSI0suoozIWe4JQb2Gg/dp/m+/T2XApZGAZRiilFi+QNnKOO0Sobgkt6iXvrRZ3KRXp
 u9FXdsXxxoabckir6nvpH72iE9f3W0V0Z9Hn5wdmVExSPtq0eudWTMEtH3VkncU/4kD96uK2hrn
 hAe+BpWQQZt+AOiqa6fRgtcuWWLt+sYGQgidT2zXWXFiYmZ+gPGH2SqqqEbk1vpm+QsrGXsmL/J
 MGjgXR4ziP4qsoW5Ma3cdKfrpP21hcmqIDh1cKCCsX6ZlJtpwhjrTjKu6s/+o4FrWdRBirggO3A
 whENu/e8sEX/EcwzwYamt0bNQuweGptXfB4nAope7nVo0O7NrtYDoVSotGgxMYnyK1dzGkUPDNc
 N4I6veIVcn+MsiERtigpbeBLW33lmJvcEqcQ3NQXuO7j3al91tbABzQ2LC8KMYUgKoeYj+4bqiN
 HKkOk0fQonVU5JVruGDE4BlJQNHWlfPen+44A2ioNGQPJ4B2lB5f7rK/I2iOM6PLf6Tn49CHs0E
 g4q9XSgp5Cs4gc7Uz7+wkflr+ceIg2xQLFKZwp2Vvzy7Mc3L2gULSGdYjxRNqXV1X7iJsBtIpxO
 Vpaaq8ZLrM/OYFA==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250510_081129_736489_DDCF1BBF 
X-CRM114-Status: GOOD (  14.37  )
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
 arch/arm64/include/asm/apple_m1_pmu.h          |   3 +
 drivers/perf/apple_m1_cpu_pmu.c                | 807 +++++++++++++++++++++++--
 12 files changed, 871 insertions(+), 35 deletions(-)
---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


