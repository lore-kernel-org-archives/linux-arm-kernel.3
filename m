Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F6ECAC5AE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 15:11:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KggF4AzFkPnQi9cWSb9T0cD1sb2eqqa5TYT3EEF8Bgw=; b=i6fk5fFrh/B9fY
	wm28dZU2NE61JzC44Ayvma3GL/a12N34TOnrLIwagLM0WrYTHghfc/hO2ev5tQshY2DHVrTXdcO9h
	h8kv2PL4XgsY3SPsfcr0SmnwBZQdiBbHdigp7XI2AwJVa3P7nHEjbCPgW2561PN9s2bvaEDT+eaqj
	PsKGoWmekQIj8hlrDca7rh0/Tkl6V800c3s5ykCGR3Tk0/5NHaFvFravJPEyAhEJ7X2Nc8Q/zxJ0r
	AWvZhS39S0WOp0JqhsbFycGq3ouOYG13MkDp4ymZfJuoB+/6w6KSf5d6aKCRZk02Pz5sqx/O/a4M8
	HGl8Cg6n+ueoHHhR20+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9F-000000015SS-3km1;
	Wed, 24 Sep 2025 15:11:13 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1R9D-000000015PK-251W
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 15:11:13 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-46e2c3b6d4cso6663875e9.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 24 Sep 2025 08:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1758726669; x=1759331469; darn=lists.infradead.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KggF4AzFkPnQi9cWSb9T0cD1sb2eqqa5TYT3EEF8Bgw=;
        b=qVMui7iZ551OXT1Z3IhOZza52T9rzDaQhE+awu2KzPu4sT/4kR8NH3GOpxm2ZGt0S+
         cknaXfEeC2imZZG/ytBEYxD8tK6KwwOQrBbWMqC6r6qFMf5Rt3azV+oF7YUpLN3n608R
         S8LtMzyLhtcFzbS61xGT2/6mZIBOX/79b8DyiiEfIRMgEHioHtPPY71tkMPxpykjHve5
         Db8etEYAMldiLbb0MdIDR8rm3YvB5gs911CenrkUlNNOldqGdAE/DAW1WuRFSHQUs3dV
         0WpS+PJ8YsCzxDTGUwMzd+8XK6jGF4pT3dt7gCUrwUtoBPyJHUrBAqKTwDypD0DGV6Cq
         mZXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758726669; x=1759331469;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KggF4AzFkPnQi9cWSb9T0cD1sb2eqqa5TYT3EEF8Bgw=;
        b=FwL0l3NeZBioWqH3giYt0hn15S8tYR3pdnjMo7h8Vx7YCP1xkmpWsktxCmgZXi3yc1
         kGiKVhAqOIElvsPFtlp5VqIZfs+mMaPRei5BB+eosYHmy+7CVgNxXPspc5aEIOOHYAKZ
         pGrDUNP6MukbZlu1G8NXu7hoiaUEM0bumU03Z5coJmfweQ3UGCUDE8pwWGqIZPGbbkNg
         gzwY2y8ZJoupwXppy2yVTUFa3cP7HdF7T8vP7oxs/i2s19My9DHJODWIhJ1rZlvXA279
         CdRGvZSl10asw7wXXzPre4w8PYc1G2sJKDNXApzUOnIANxCCyZW3iUbzwsK7j7nG/SUO
         UHpg==
X-Forwarded-Encrypted: i=1; AJvYcCXKxoYY5da41/Xd0fvkpPUM13ZPBfdOeGjgoLyc8jKUmEiRfXidVGZ+gveExlWXoDOswmhHiaJLWGe5Mzd8uyOL@lists.infradead.org
X-Gm-Message-State: AOJu0YyWodRamiRBqI6bduP8xP5CGktZoXRXHZWJHa42gEiE4ScvlOcN
	OUOhXld8vjIVn5fbypPAL/heYbgDwkqbPEokMwKT9Zz4oSZacbEWeT/9jXRkmniy6rw=
X-Gm-Gg: ASbGncvbXR5ZhbiFq2sBeabxb7BtmaMM49gKrBbuwG6sRQJhcBudZpQYTEyz18SOlse
	Bm17dAAaKF8MVqezEizy+fg/96867pKmFZCanawn2GG1e/mKkYGO87lb2B2S1ALWwzZgekviC9J
	kZopB9u3dpWUfFV3wrPVxK89b3bg+0K3z7ev0EHa3311lIwOOoC+2QUTjD/W7J0nhOXSKPvvxhj
	YpSIMnlZiECwyHIfBIx7FH8NWSh/Q9t599FRHoQkL5UJiwK1Lm2w6T29PO9UW8PR9g/6J1oQwxz
	wFLEXvDj4gQSDrTeySkXiuEwgx1WJKNDFPTW2BsyVXbI5h5X9cczyiNljegyOYeYPoneBWrKpvI
	XEMRVrgYMOu/FPj8Snq2ISK/P3e67q6rGMXFvD0xwcfkwgHK3spVi3ypO622cNY4Rbl8WUqCPjd
	s=
X-Google-Smtp-Source: AGHT+IHGeGSg7hWYaClMwyJxTZdmSKbwm2O/TRWj6tWRYvpwU8Qj5GI4vawvnTrp+TRppDIVHbfFJQ==
X-Received: by 2002:a05:600c:3586:b0:46e:2079:f50 with SMTP id 5b1f17b1804b1-46e329f8180mr2184925e9.20.1758726669193;
        Wed, 24 Sep 2025 08:11:09 -0700 (PDT)
Received: from ta2.c.googlers.com (213.53.77.34.bc.googleusercontent.com. [34.77.53.213])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-46e2a7c8531sm36045145e9.0.2025.09.24.08.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:11:08 -0700 (PDT)
From: Tudor Ambarus <tudor.ambarus@linaro.org>
Subject: [PATCH v5 0/5] exynos-acpm: add DVFS protocol and clock driver
Date: Wed, 24 Sep 2025 15:10:59 +0000
Message-Id: <20250924-acpm-clk-v5-0-4cca1fadd00d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAQK1GgC/23Oyw7CIBAF0F9pWIvhWagr/8O4KA9bYi0NmEbT9
 N+FbsTUsLpkzp1ZQLTB2QhO1QKCnV10fkyBHyqg+3bsLHQmZUAQ4UjiBrZ6ekA93CGRhrRCWkS
 RAGl8CvbmXlvV5Zpy7+LTh/fWPOP8+6dkxhDBWinTCCZYLfB5cGMb/NGHDuSWmRSSiEKSJI3lW
 taKNapmO0m/skG0kDTv5FYbRoyUWuwkK6UsJMuSUsqRTk/9Xruu6wfOFp2ATwEAAA==
X-Change-ID: 20250819-acpm-clk-28d2a78e0307
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, willmcvicker@google.com, kernel-team@android.com, 
 Tudor Ambarus <tudor.ambarus@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726667; l=5145;
 i=tudor.ambarus@linaro.org; s=20241212; h=from:subject:message-id;
 bh=cwMIlE3GkPC64JAJSB4aokfZYWK2EOhyiJo/gkpirXM=;
 b=JswpE2Fv9zQL+B0aWcWNPjlcR8GXvjFyMyJtyOMkhrL+FjesIZla+MV0mvbJLlPGWWLWAITHj
 dKeYFRzgUIsA+PiGYjWz7mNesCsEIUXC9A6yUTQUjXDhfEuPl/UzWPN
X-Developer-Key: i=tudor.ambarus@linaro.org; a=ed25519;
 pk=uQzE0NXo3dIjeowMTOPCpIiPHEz12IA/MbyzrZVh9WI=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_081111_580018_3DE99C8B 
X-CRM114-Status: GOOD (  25.21  )
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

Dependencies description:
All patches should go through the Samsung SoC tree.
The acpm-clk driver (#4) depends on the ACPM DVFS ops (#2).
If the clock subsystem needs to merge the new clock driver, it will
need an immutable tag with the 2 patches.
No dependecies for #1, #3, #5 here. The DT patches that will follow will
depend on the bindings from #1.

The Alive CLock and Power Manager (ACPM) firmware exposes clocks that
are variable and index based. These clocks don't provide an entire range
of values between the limits but only discrete points within the range.
The firmware also manages the voltage scaling appropriately with the
clock scaling. Make the ACPM node a clock provider.

Add support for the ACPM DVFS protocol. It translates clock frequency
requests to messages that can be interpreted by the ACPM firmware.
Add an ACPM clock driver to model the clocks exposed by the ACPM firmware.

Thanks,
ta

Signed-off-by: Tudor Ambarus <tudor.ambarus@linaro.org>
---
Changes in v5:
- acpm-clk: address Stephen's comments:
  - drop of.h unused include, add devres/devres.h and container_of.h
    to avoid implicit includes.
  - r/acpm_clk_ops_init/acpm_clk_register.
  - remove period from error messages, drop comma after sentinel in
    platform_device_id.
- collect Peter's R-b and T-b tags.
- Link to v4: https://lore.kernel.org/r/20250908-acpm-clk-v4-0-633350c0c0b1@linaro.org

Changes in v4:
- clk-acpm:
  - remove GS101_ACPM_CLK_ID type handling. Dead code, it should be
    introduced with next devices.
  - remove runtime check on clock IDs. Instead add a comment about the
    assumptions the code is making: the clock IDs start from zero, are
    sequential and do not have gaps. Slight changes based on this
    assumption: s/hws[id]/hws[i], remove the inclusion of
    dt-bindings/clock/google,gs101-acpm.h and the use of the clock IDs.
    The clocks are defined solely by name in the driver.
- move firmware patches close to each other, in between the bindings and
  the clock driver
- update the description of dependencies in the cover letter.
- Link to v3: https://lore.kernel.org/r/20250903-acpm-clk-v3-0-65ecd42d88c7@linaro.org

Changes in v3:
- dt-bindings:
  - move clock bindings to a new bindings header
  - update commit's subject, s/add #clock-cells/add ACPM clocks.
    It also suggests that the bindings are added.
  - prepend "GS101_" on clocks binding name. The bindings name are the
    same for GS201 and the acpm-clk driver will likely include both.
  - collect Rob's R-b
- clk-acpm:
  - move clock definitions here instead of keeping them into the
    ACPM protocol driver
  - use platform_driver.id_table to differentiate device type
  - fix Kconfig dependency, || (COMPILE_TEST && !EXYNOS_ACPM_PROTOCOL)
  - update commit subject, s/dev/pdev
- exynos-acpm:
  - move clock definitions to clk-acpm
  - use devm-action to unregister clk-acpm platform device
- Link to v2: https://lore.kernel.org/r/20250827-acpm-clk-v2-0-de5c86b49b64@linaro.org

Changes in v2:
- dt-bindings: clocks are not longer a child of ACPM protocol. Instead
  make Alive Clock and Power Manager (ACPM) node a clock provider.
  Update commit message.
- firmware: exynos-acpm: register by hand the ACPM clocks dev (new
  patch)
- firmware: exynos-acpm: use defines intead of enum
- acpm-clk:
  - switch to determine_rate
  - drop __init, __refdata, __initconst, this is a module, we need those
    methods and data, after boot as well.
  - fix the assumption that the clocks are defined by ID in ascending order.
    There's still an assumption that the clk_id < nr_clks, but this is
    now covered by a sanity check in the clock driver.
- arm64: defconfig: enable Exynos ACPM clocks (add patch together with
  this patch set) 
- Link to v1: https://lore.kernel.org/r/20250819-acpm-clk-v1-0-6bbd97474671@linaro.org

---
Tudor Ambarus (5):
      dt-bindings: firmware: google,gs101-acpm-ipc: add ACPM clocks
      firmware: exynos-acpm: add DVFS protocol
      firmware: exynos-acpm: register ACPM clocks pdev
      clk: samsung: add Exynos ACPM clock driver
      arm64: defconfig: enable Exynos ACPM clocks

 .../bindings/firmware/google,gs101-acpm-ipc.yaml   |  11 ++
 arch/arm64/configs/defconfig                       |   1 +
 drivers/clk/samsung/Kconfig                        |  10 ++
 drivers/clk/samsung/Makefile                       |   1 +
 drivers/clk/samsung/clk-acpm.c                     | 185 +++++++++++++++++++++
 drivers/firmware/samsung/Makefile                  |   4 +-
 drivers/firmware/samsung/exynos-acpm-dvfs.c        |  83 +++++++++
 drivers/firmware/samsung/exynos-acpm-dvfs.h        |  21 +++
 drivers/firmware/samsung/exynos-acpm.c             |  26 +++
 include/dt-bindings/clock/google,gs101-acpm.h      |  26 +++
 .../linux/firmware/samsung/exynos-acpm-protocol.h  |  10 ++
 11 files changed, 377 insertions(+), 1 deletion(-)
---
base-commit: bf2602a3cb2381fb1a04bf1c39a290518d2538d1
change-id: 20250819-acpm-clk-28d2a78e0307

Best regards,
-- 
Tudor Ambarus <tudor.ambarus@linaro.org>


