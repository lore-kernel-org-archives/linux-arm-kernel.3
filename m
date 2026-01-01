Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAA3EEB56D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Jan 2026 09:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hihZBSA6ypcKPzQIvhGDpg48Y7yieDYcaYuDOCtFxfc=; b=YlS1oWKQvdfxrO
	++JGYcGfLgHp4Ku3HIMQKB+oeDkxtTAq1kCi322c5JpcFxhYUVN+2SKOONHETyQVviZEB0OG+4lll
	lQZANWae+V2goJEVXFnABw8pbmq5XPdWkqmYIKA3ACP+W1kI22RgpiymZ96fttlqAWRQG1TMr1wZz
	1O56wmtmr3j4Ks5G0hR8POgTPc0gYCo2FrrRaDb92mtIzME/yXdvDGGyf8c0Eky5HEylUvLXi7TL1
	i+c7GW1zYheLJ0puvBiN3C2UmvlJrJSXlgeoFLqOvRCVEH30fxjk5Vy9wyTD+TPxWJH7oDPdaAyMH
	ZLskiTJO/oFr6EIoRM2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZs-00000006iVf-3Qcq;
	Thu, 01 Jan 2026 09:02:40 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbEZq-00000006iVF-22qI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Jan 2026 09:02:40 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7b8bbf16b71so11384412b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Thu, 01 Jan 2026 01:02:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767258157; x=1767862957; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hihZBSA6ypcKPzQIvhGDpg48Y7yieDYcaYuDOCtFxfc=;
        b=FAtBAarzW7aqIWAfIoo4Ih5QzMDJmXLhYu/c1f2AFt8FWojBDzC0VPYRmATzIfEJ25
         lHTSbgfUQrsk806+QPOUPVCx6pe9pSvRhbaC4Gs7OW0BsUbv0tCEjQiZC6/jSLsYIRsf
         EuM5X5tdfqdDO+FmdRjhyjZeGYTj2c0k1MRczfrjUSFOAJOlm2OVdqbO8/IAKHxg9cBS
         INItspObkgbSPEnkfZeTdr79Tqt20Ach3DGg14ZazCp5rDnRmm9m1cQF3cK4c39ikbl6
         U4X2Xh28dW3zNXpCWAp4I4vFXX9ZcdcixRkofNB9qkrhr0SsV+FN2spCslxg4DWPFB6N
         LgHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767258157; x=1767862957;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hihZBSA6ypcKPzQIvhGDpg48Y7yieDYcaYuDOCtFxfc=;
        b=clEBZ488FjTmAUtvxrHXQxqWPVaD8yApuxiQIwt3axFbZpc5Kb3W4cYgmM0SOnKp6K
         DOjV0yXY2+hTQpbZaPI/0PYa8dxNJwpMDJSuVRZx4VKvw9lBtVOKRc0o2sgMilDu53w1
         pnvaC3yfvpYUTN63by9PBT/kwyrKu+4hbZZ1d6FpBzbaDCHEe/bXYuUSbKR6eY7A5tWp
         cUMbyzdR7RiAll6EAj9G9Be+rlcHeRnvaSYpM5A0uk+lTUgsXnwSYG6eO6s8nuxlVOsP
         B1wAI2hGdiapFkWf836pLnmUqnIJZiyyvKBe1mnvpcwWxqccGgWtfo1CXnwTIUUiSsRd
         SBiA==
X-Forwarded-Encrypted: i=1; AJvYcCX+OwfcqPCVEFH1J0lg49/FDPieoqyWuXYJ61T4IBqFHxp19ry/y7DdyRSZp/CrthSMpsq2LvHuaM2m9UtbQWgm@lists.infradead.org
X-Gm-Message-State: AOJu0YzXV8BatEFDB01MAZFWr5c++dCxWXpFbcAfOAFCnzt0So+iBrAA
	cNpqTlER59oS5FGqtb5SjnlyL3TFiCwfMcp9ksKrPlOUIWiDtVqYVQXZ
X-Gm-Gg: AY/fxX7c/qRMtPX9n4q07Lye2FQ1TTNNX72MihgMTg17+RE7qMAbXdtIkmP+GjRUyvw
	lYYtHMvF2gGrxzCiVROtVuXySE63WB+/21ct2sg+gZjSKUOi7KzVgmkv46sUH/TbXudvaozGuTr
	TUh7acNk24AOimrDjcoCvGIlwcjWQ2kXtGm/zGTB05OW5i5viJtVAvxLF+x0TlADx5aBItbd+Go
	5i9mm4gIKe4zK07IWC55fNJvt+7DEcP7oPcdHu015i0lqKy+p1/Su0KrO+HzJdKqgGgbyXDix+B
	vThteSB3TIWYsy5/fsdas5Y5v0UlBiDqOGRFXwld8PQcDM+kgtqQdvgdOTdnsf+Tmd/+gXf0eo/
	c4cSRVaPOHZ4w2w8M2EPXwd2pHJe/3thNHSk4avjvSffN844+1WDbOfiuhAAIbyQcMPKiTLUdXG
	Ijq+mfrxXexh5e
X-Google-Smtp-Source: AGHT+IGaOzY6wshAcbbeVkzC3Qr2Y9GtbIIPSO/l6MCiYeY7h9AAOipH+K9CNz+QNORa7BFGihwSWw==
X-Received: by 2002:a05:6a00:b902:b0:7b8:9d86:6d44 with SMTP id d2e1a72fcca58-7ff644012e2mr30833268b3a.9.1767258156940;
        Thu, 01 Jan 2026 01:02:36 -0800 (PST)
Received: from [127.0.1.1] ([59.188.211.98])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7ff7dfac29bsm37182957b3a.39.2026.01.01.01.02.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Jan 2026 01:02:36 -0800 (PST)
From: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v10 00/21] drivers/perf: apple_m1: Add Apple A7-A11, T2 SoC
 support
Date: Thu, 01 Jan 2026 17:01:36 +0800
Message-Id: <20260101-apple-cpmu-v10-0-48812c529ffc@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPA3VmkC/3XR3WrDMAwF4Fcpvl6GJf+mV3uPsQtHlltD24RkC
 xul7z6nsDXO2KUOfAcJXcXEY+ZJ7HdXMfKcp9xfygDyaSfoGC4HbnIsgUCJRiJAE4bhxA0N54/
 GBBNUDKrVXokChpFT/ry3vb6V+Zin9378upfPsKQ/NbiumaGRTfLkEgYCp9XL4Rzy6Zn6s1hqZ
 lxTVVEs1LtOWWgVsvdbqv6nqtCOXfIhcvSQtlSvqa6oXhZOFCRrA9rxlpoVRV9RU2jLgJoieo5
 6S+2DaukqagsN7AkToqG/C7sHNSAr6pZbY8mps2RQbql/UF//ePaFkrGSu9hS0HZL218KCPWtb
 aE6cogdWxNl9dfb7fYNUba2qn0CAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5031; i=towinchenmi@gmail.com;
 h=from:subject:message-id; bh=EQFY3VpkRGJAmRC+3usD9WjCbbVU82Myoged0+CY6HY=;
 b=owEBbQKS/ZANAwAKAQHKCLemxQgkAcsmYgBpVjgDKe7KDF0MQ7xXnBNenpOX0XfR5VF7q+6wr
 B1bkRk3I4mJAjMEAAEKAB0WIQRLUnh4XJes95w8aIMBygi3psUIJAUCaVY4AwAKCRABygi3psUI
 JJxQD/9ZOl2Lpn7EgE7JzPylfWJeOYnwx5opMAFwVgmFgdtoDeWwW17v48KMrfWxcJtVncwBHzX
 UmpwvnLyBO7v/+5gK/RVnES48YNgw0WtURWsUrFddKU/qDw6UnS8Oz+xkr1ra0tNFN2pB0TdkF+
 FqnsDx5Sej3oQ6I/Gw08urmNSS92o3+Oe7I9G/qhHUNrK3mSJ507iMFqFRCWyGx/OR1L0lBKQ9k
 MLzPIlTtgzV2h0tT0463MzrZgRtwUCv5bqsNG5ycPo6DTOntQ+MfxRXkufG28XDbPkza4KGQVhF
 7uq5eGKFh0x5zZIH/v23EgI/MpowpeiSBopKQ58tr8Q0grmR99E2J5zHqlro6G4RA38FhokG5W2
 Rtoei/rcwg6PV756cdTeumCXm9HXEtdOwupUJBT2aZ0qB7nr13gTnCZRRvjBoF1va0AvP3v3dmV
 qmWlFdtIegWoNnLfgK4d+yEAMZne/+miJO0+H4vAixZG9ErDl3HiogEjc9JHSi97ej2QUYpTv/7
 50CqRe03HpCcwtD7bBf04BaPbz5ht2u54EAUoZ2xI2QYQXsGCKRUAy67sbNS/Xy46ybi24YnWUu
 /OHGVhQdypJby7Dz+PK4mHIYRJ3dRjIHztVFESW5boTVRNsW2DnPGUuoovJ7AharLoCHIPXfTWh
 mdNeBUHo0XlxYew==
X-Developer-Key: i=towinchenmi@gmail.com; a=openpgp;
 fpr=4B5278785C97ACF79C3C688301CA08B7A6C50824
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260101_010238_547192_11DC3710 
X-CRM114-Status: GOOD (  16.13  )
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

Happy new year 2026!

Signed-off-by: Nick Chan <towinchenmi@gmail.com>
---
Changes in v10:
- Modify apple_pmu_get_event_idx() to take the number of counters supported
  on the current PMU, which allows `perf record` to work correctly on A7-A9
  with 8 counters in the PMU.
- Rename the added counters to nr_counters in apple_pmu_init()
- Link to v9: https://lore.kernel.org/r/20251218-apple-cpmu-v9-0-4deadbe65d03@gmail.com

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
 drivers/perf/apple_m1_cpu_pmu.c                | 820 +++++++++++++++++++++++--
 12 files changed, 883 insertions(+), 35 deletions(-)
---
base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
change-id: 20250211-apple-cpmu-5a5a3da39483

Best regards,
-- 
Nick Chan <towinchenmi@gmail.com>


