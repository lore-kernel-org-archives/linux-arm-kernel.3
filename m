Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76E07D65C7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 16:24:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=JsPcnAXX0HxXZqnB4n6Iu8u5L4r6zw595gJ+705EC+s=; b=FY59HjDAlQq01/
	LnM7HVE75/xXwJ8GoEmerDIy0E6+TOmKUEBYc/Cfw/pwtQAIXoTKJcvb8o/IKyvdzk2SiIpdrpVxT
	YMYSCt73/JZkmMFwG0Zog+n0KMM4IWmnWw0re/SsiNMHGefUVOO2p+Ds1U27UGSeBzXmwnhz+oxfg
	pC5/wP9XbzrbhQ7UnuhW0dEXdbdGTbRCowifNFDjHjtEH4khwjizCsilVZq46YODjSYOeXmZREmkH
	UPYYl1k7aWiwnlcfpDyWiyEzr65EAY4/BX0Dp+UOhnhLnm8373e3IYtcs14ZNr7ab6D99ih8T3q85
	zD6VbnkqGTlW1bYK8UJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKQ-000000074iZ-1bKz;
	Wed, 17 Dec 2025 16:24:42 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVuKO-000000074iA-1Wfr
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 16:24:41 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-2a0c09bb78cso5863295ad.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 17 Dec 2025 08:24:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765988679; x=1766593479; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JsPcnAXX0HxXZqnB4n6Iu8u5L4r6zw595gJ+705EC+s=;
        b=nflNxFLPgJQdmnIn0/aojLpzRh3KMJvoo17WEtAJgrKKBTUhqIounPI3I3O6AygKZf
         YtC82kxskkiiO4aGfV8DsqIJ8gXLzvFwTM7XfhdzncuzhTGUatr5XyFM/h6/mVqX2QBI
         CiVQm6A5kWnTsvmB63rZwmWN/RZA8dGGHiUhKoMdSaGe1Jr7w9j9z9lRBE2PTzqzUqn3
         qwH9UbnRbo4Mnu8J5r4Qiq9ftiXvpSGWs2EBfJAK62PA4xkxLWSnrLeulD9HlUrm/2H9
         wFpU+sD1nS8+Y08uw2yCcNH1vkrryreVXa3eSte/C0Wvre9LhoMWpdfCqivazaSF2BwH
         xKVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765988679; x=1766593479;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JsPcnAXX0HxXZqnB4n6Iu8u5L4r6zw595gJ+705EC+s=;
        b=G6FmPwxeej5QxvQnthkgGoMvNzXOBzvmPbLw316y2Tehsi9C1Oxl9AmK/yfwCBccqx
         upf++TylTJj8KEeYXHbV0uO20Yu/Zlx+msGf13Y9BS6330ggA/4IOFWLLvHux+qb6MBn
         m3/QuQJ5nGqbyNHqq1TKJho9jc6jipzmfk8kCDo/8582XEd73iVgIjh8SrcyK9pbmYbV
         6XxO3auSmF2wZMxuXV6gbFJxZPUzgx7hNXjzCD1dTIZhp6gcvP5S55aexFEYIxoftLd/
         avMZf+9ia+ihO72zra5xk0Eg/SiEZ0HkJiu9CAh1Ef73VbPbwBP1MNTqbX0vqsQTtB9y
         P0UA==
X-Forwarded-Encrypted: i=1; AJvYcCVCLkb5T/wf/jZQZI4d8NHVLXKGgSwXXG8r/kuptAcYCyPpuBLpLwNPzlhcOneQdIjJs5EBBy1YWYUXVX4pJYmh@lists.infradead.org
X-Gm-Message-State: AOJu0YwCRSzT9fkPOC7Q4imofetlWH7+GdHhISNckF4LAF5aYyHV1SWj
	koHq59pMc8YLz3ttpHSIVFIM6ABLYJjgXkUsfGewRTj6cSqYoyWrnGGH
X-Gm-Gg: AY/fxX5wno5CjE2gzpaAPJ5kcYOdn34MOHPWvPABo6+KFckswY8uF4G2gXNn+Uc6etD
	9AWvfHDOgiN5DQcR1+wB6GJHYRbME40CegoPQ9DUovxTCKCrgfj0aa26P49BdYIE9n04ZEY1ald
	UyNUNWAxURFPRPxqy3AFnNvjiwE7vl6u1gTALZCNuF5xXn6vP3cLlq5jbi6xOhlirHFd2CxtZbE
	6PUmBe5BUv+PTimpiinCoL9GGJVPQd5EFi3TQvU/+F1MZwsWeLJW6aN8ZLwt6op0ZGK+TUY79Pm
	1aufw8y5WZdPE/Io6jwj7pWen8GZeHVNdFYvwc7IHQWwLBsAKiSv3MSVcunAYbU+AEefRm1naig
	d5FwRhjLhmLDWJQA9eAmQKWYHeMGzeLkgjq6Fr79Ln/SEv+IK03y9Goh1j3kl309rHsf47wapqW
	IcN2yVokus0cuy
X-Google-Smtp-Source: AGHT+IHAwxj6DzdDy4Ktf3Hya1n9fwX45F2bVkRoYmLdBMFbognAoioKTp23w8/kQbJXYMZiXIS1HA==
X-Received: by 2002:a17:903:1a0e:b0:2a0:c92e:a378 with SMTP id d9443c01a7336-2a0c92ea624mr148009915ad.7.1765988678823;
        Wed, 17 Dec 2025 08:24:38 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d9443c01a7336-2a0b0687c62sm122980415ad.88.2025.12.17.08.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 08:24:38 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v9 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 18 Dec 2025 00:23:13 +0800
Message-Id: <20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPLYQmkC/3XRy2rEMAwF0F8ZvG6KLb+UrvofpQtHlmcMk0lI2
 tAy5N/rDJQ8SpdXcC4SuouRh8yjeDndxcBTHnN3K6F+Ogm6hNuZqxxLFiDBSlCqCn1/5Yr69rO
 ywQYdg64NalFAP3DKX4+yt/eSL3n86IbvR/eklulvDWxrJlXJKiH5BIGUN/r13IZ8faauFUvNB
 FuqdxQKRd9op2oNjHik+n+qC23YJwyRI6p0pGZLzY6aZeFEQbKxyng+UruhgDtqC61ZgaEIyNE
 cqVupkX5HXaGBkSABWPq7sF+pVXJH/XJrLHNqHFmQR4orxf2PJyyUrJPcxJqCcVs6z/MPeEsny
 0ECAAA=
X-Change-ID: 20250211-apple-cpmu-5a5a3da39483
To: Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Sven Peter <sven@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-perf-users@vger.kernel.org, devicetree@vger.kernel.org, 
 asahi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nick Chan <towinchenmi@gmail.com>, 
 Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4650; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=PgTQRT+gLvYaLCi8qjd1aU/cyiFqcrVhwIPj3U+4edM=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpQtk73F6rEAOyEA3wyqqf8KFEkTZ/0x9ysNapI
 uazbrtOdV+JAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaULZOwAKCRABygi3psUI
 JFh1D/9eIav9eVp8eoDrGgQhSCtAnDqdHRYJkeC0ulHs3A/Ks3x+GmU7fFqCBmnZOeZv91UPI+m
 VVsJT7Z/8aNJzCsG8/l+rr0any70TKr3Ke+tV409k8s95gKkNHJ2OyH+6hP10VJQ4YnPl3ou32o
 OxHQk2kh9AWH9gfUR1HnfvJP/p5Hd40lrcyw4HQFBPecPTOTv/moettZMyl4VbnyIduhXMKJq9+
 gmYMDKZACjN3yYmSrvUbmy4Y8uOMGzCKr77HTQe69jicpoXwY+D0jbvzuvBqw616pWXKPty6QIx
 W4tEsIb8gOZN1pb5AtMect3T4CxZF6rJV6DFBLKu6kyqtcqxjnx+7i/hLAQrCMkPuw+NihqverH
 jKLffRvah01OZSuS5LB6FaFa4a5KUz8kV79XKvmjgakp4g3IF4fMCX794es24VQ3a718dyvqXTp
 68bI9Yot8ZFD78UDUfzzSH/J8KkNDIVBrZMU7hSpEa1T3rEhjcDQxQFeqDdPuDBT7SbsSJj28yQ
 RUKnhIQwHj+WsDLQtqM+mqFEpAU7kyturFvrOne4wmb/LraaucJVyNCAtYA0WZxBVdYI8CTBO5U
 qpLqAQU3+t87Nvro4etxRgvx2+YPFhf8CNaPzL/VBUtDFqeQXo4PQfBQ3dhJgfWWe/y1UtcXsTv
 wjPHAiSQW7yLVGQ==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_082440_415899_9CD4614C 
X-CRM114-Status: GOOD (  14.45  )
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
Changes in v9:
- Rebased on top of v6.19-rc1
- Removed non-existent "INST_A32" and "INST_T32" events from Apple A11
- Added "INST_A32" and "INST_T32" event affinities for A9 and A10
- Link to v8: https://lore.kernel.org/r/20250811-apple-cpmu-v8-0-c560ebd9ca46@gmail.com

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
 drivers/perf/apple_m1_cpu_pmu.c                | 813 +++++++++++++++++++++++--
 12 files changed, 876 insertions(+), 35 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


