Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E664BCAC589
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 12:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=; b=Z9wRhIzuDGBKHy
	AxJx/x0gqF+3e5HYAKFyqZdAFM1irDJk9XNKCrR5URjGC/1eIEmRIQzUnSrBPRucQqtywQRc0HiMe
	KLjl9acnAR9+D1aVgMYyS+q587oXQcd6D7y1ejfSuWjmL0JXTzOOtAfhdydECaLR6L9jFMiElBEn7
	wZyKCAj+zVzoThM+nD7myMJ5uGiJHZU99SyBCiRG3r6TBS+Gms2LCXosvkv4gcewszLBB+eyUu551
	UnVug128FeXjWv6cjmm55kr+AOyEisA4tsAf9XmQJuEo136ifuYS8Kn9sZXgNZgWMnoZ2r2pTpMA/
	JD5hViCyRKUXD14Fxs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvabm-0000000GqJc-3UHN;
	Mon, 08 Sep 2025 12:04:30 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvYg0-0000000GDeN-0Rr1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 10:00:45 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-2445826fd9dso50042235ad.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 08 Sep 2025 03:00:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757325643; x=1757930443; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=JjHyAuA+csb5P+2ZZer1jLwl28ejPsNIU/DFGQQMyy6I1eP7CViK20gCsh4Otu3g64
         M26EL9BGqWsFeoXnVPlS67iJXEKCypIYGrUxOT3KIuwr6rQPwobkGEWtoKSRHtZw/pR6
         /K94HnzNjVS5aZcF8/+ftJmdxCrZ/Kw1ZBQytCrOxm7HVWpGlvIoFy68SV8/jOE2oDAu
         VLOc9QHrND4fv7cJK6y2obeELxxv8ho3fNhXVwSSZKHsP4H4TLzvAvcLIKGrZqCY+j9i
         EtYy/yKNMgol1TS1xBxiJYsOwuHxWUfnwCyYxUKhBwBZmmyeIp60s4fmpCaYYBAYhxgQ
         DoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757325643; x=1757930443;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8imCO2VyYcb1j5phQLrLVVRIepCgCLAAPrEPMDTG34Y=;
        b=ir1fo1lTT8DRPtP/m4+VLvz8ItkC3sxzEtyCbAFw2Bd9iwIVTsymIrVf2nKUjbTgI2
         /wwx6iYabyxS6VmdJEUCT5I0UaePqYd/1jkJ21mc7/v6uier4QSxgMoSVBSHs8/lSsRQ
         NY1nyPZUoh/1xA3EhK9ZFkjVatesEGknrIh6AGw2d9OL5N/0GogwrMmy4944WbJAV0c/
         zZXXfQr7IQEui8/lEtEmd6FlnnAQEUhKrdhwOv4a5tntzAvnMsgl7SpzKBxgvfFBGoWa
         vuQwp2pD/ybVBq2imGyMwJ9BqHu/XbwsQsE7If6c5rdKVw6yrWJ36HWvhKtNJ8s+2cWM
         X5DA==
X-Forwarded-Encrypted: i=1; AJvYcCXC5g+klssGE/cRuhLxvS8bd1yYAllvfnCwkmQqwbYA7tvlMEAQEO+urffMo/9UpbZfN3HgEwSmB0m4bZjuwJT0@lists.infradead.org
X-Gm-Message-State: AOJu0Yxij0CheyAqtUZ+t7wVqEMP6DGh27qjnxWHLv4yJLsC9dbdnKq0
	Rtvp264fcqh0w5RS9zW8R/qPn0g/EgvMgqWzTDoOu2jS9iz6/LXD0TE3M6hV/wazZ6Y=
X-Gm-Gg: ASbGnctE0JqyVMHcfigAU8N+UhMimtqGDRGAJWRV+iWrzk47zb02J1PqZ2x84viaCsR
	6u3b++mFbVh5iw2jrqhQieHT38nnEzPkHZdyStQGHeO/uNchTp8Euo5vsFjm0+m0NxLKu76pXVx
	Al5Stv9v89Fy34bjpkb8jWvyrUb/pGSpjp6xq2Cw7mW16owzjiolMXyzPYvlWqQ8wTk6F2Kxp/r
	ballAM8eTHLK+QYLQE5G4CqJ5sqP/JD0V4SAAb3oMIDD+LVXYEl3OMgd3O8Pti/xxxovhSxvAVp
	NT752QfkBBTBY+xV5RlI56qd8Em1Wh8dyIwzU5+VaeFstlUHDe8gzwbfosrlTs7hK0DyD9HaNmM
	n4HQJUcSCEM01Xnde+86zc2p3x8NpUWEGdffutQ==
X-Google-Smtp-Source: AGHT+IEZb8enaTAgcy3PKy19tewnYb0cV0Lsum67cTjohRrkEFZOPERorSxB/CUny9AKPTfHG4lprg==
X-Received: by 2002:a17:903:18b:b0:24d:37fb:6f38 with SMTP id d9443c01a7336-25170395983mr103298955ad.20.1757325642793;
        Mon, 08 Sep 2025 03:00:42 -0700 (PDT)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-24ccfc7f993sm107826545ad.63.2025.09.08.03.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Sep 2025 03:00:42 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH RESEND v8 00/21] drivers/perf: apple_m1: Add Apple A7-A11,
 T2 SoC support
Date: Mon, 08 Sep 2025 17:58:24 +0800
Message-Id: <20250908-apple-cpmu-v8-0-d83b4544dc14@gmail.com>
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
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBovqkTtL7kDRdJXZf7Bq4gh7VfG/iXETTlRfC+O
 gEURdMqqiSJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaL6pEwAKCRABygi3psUI
 JNzWEACqUePWP9/3y8oeVTH4hpFlV4h5LKJ2MdY/2vUZRXl+Mf7isTGEsrSe+ywZxIzu7iiIz3T
 WwdRaae72juKh+C+JTa5TC8k5pYM4ZzTzl3W+NVoYYQ9Gcy3ej/1EOJc6uSsMsm19m88FYo31IC
 k3gx2LI26i9sCX8gVX4znkZELyRg2LZ1MFHz9wkp/UFH/YWD62jUwe2+EJgOulzNB3qZAWAXuMi
 IoHk5P8ElmEj8kOE/Hy1tSh4Bek5rvAUgaZq9FJDTwnadV5lI7qAg3E2EMfKHsxmMWf/ZjkP/2B
 3WhOJsBT5E/3j+wHMbnxoaV4PXyVFX4qzcjCNAqPOFjfo/neTF+/AwLLr5wt1v7CS0lgXcF3wju
 /T1E8H9wemtsdwTQMPdliJBE9zphWN/fpwtrLbOFDtYUCparvWxDmRue2nVG0gp9AwazwyBGLEO
 luma2Yi0VmpGabZuIDCHjOtaHI0tNj4rjINcq9faeoViOf645MKPNsmUBjvvArMTM2YWyhzgROR
 oH921F5PSJDwzvYUhIwsvYLYDqTru2cXxHN29bgwlxIBbRcB+L5m5lcLi/ysNsvMjy9yJfbpG0a
 joEq3xET3uLp/tJ+zsLjoDqtk6erYCWz5/ExOqUA8OIdpYs2geUoa9xNLb4wqMNBiFxKmr0EzgV
 ZAiSd2w2vwWe/gw==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_030044_151246_0DA2CAAD 
X-CRM114-Status: GOOD (  15.30  )
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


