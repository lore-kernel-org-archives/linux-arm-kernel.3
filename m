Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37FADD111B0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 07:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=; b=PKED3sXK0rU76Q1wrJBDUnJB5S
	oqAff4sA6sAufH74W13MsNNGDLwYBUV2i1ysiiFQ3bIchs2XXKf/bALp85Vv0DAISYv2ZJ8dhJVK3
	Zpp6ELQ/JVG1g5EIzlfYpnU2E5oMv42sYB+0YCcbnrE8bG2Bb3HBjJOa0Wblq14uPIlpRS/t4k4UA
	tAAZGJicE2+hwLYeecSuEwbA9cr1foQo8DEuFes7myX5tmB4UDGhEBIxxQ8q1gEfrCaylCCWELbgV
	PYlCiZQGwGz1mKg3QVBUJFl+84LLVpy6TuDqGgsEA8DsqbMWKrs0ITXi0QhaKRoqBDGaldo/OkcZ4
	fonIM1vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rsy-0000000CtmZ-0WKW;
	Mon, 04 Nov 2024 07:52:28 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7rrH-0000000CtcJ-3gvw
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 07:50:45 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-a9a2068f348so74238066b.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 03 Nov 2024 23:50:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1730706642; x=1731311442; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=;
        b=M5Ww27MtJahrCq1q0hlka/vxWt3IvJ1QnmOW31MpanwjyMyNr4qwxvsqVTKPJBPI6C
         6/LQ8GR2J7xKrV9AiquH+nNIB4Q+OYY81ev41/FJSHo64ip5EyzhzUgNcLIdf9Ml7mNc
         fTQlx9Wnvu2FHidHULsSViPQKCSNJvLIA2/swZ4LbXfrO5l9GXPha+KSkGfjEpIzEhUr
         1ZTopcgt1uGWz+0Ht0pLvmrM7AWrQH8TwNlS+Zp2TjOi38cvdHBeaQDKGrSjab/On7EF
         GvvtKt1ITzUyeKaxuJzWLL0K9Y7bPpnEhPjjsmC/c9OqScXQdnBf5hHFudfKAEi8F0P9
         hOuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730706642; x=1731311442;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A9nHH1n8ZLYE4cUy1f03ZslOc8OPqBEHgE84YmFhawg=;
        b=VMgFU+VYMyzdnJGysBh9SmdawFCO6eNweRN5ix93ArX/jUnP2jjF+MjE5O7RNIxC0l
         +wsKwfpDXb7leWxcbL2NZDXljrBrERHhl/EGwdn+OLX5DOtr44E/Vf67aUUfyXLabm7o
         S7hkCb+e+I+6ogu3ztc4NulfTckxl15W9BK9zAMFdSI26CT7S7GurDr25oOk3CyvoLPg
         cm8URreHUkFrMZSvl0qGoBBeb1GvjKhB70Ohu9j0PndG7WcYnAJ0lf9jNjMYCw2D09VK
         Che138HF4KZ+5xxjDFqhj4fIEDie0liPU4zVY/2/A4ZT97u9DZ8IAJSEVOHxrSi87VbM
         JRaw==
X-Forwarded-Encrypted: i=1; AJvYcCVZG1Ddm7uiu6GDTN2MP/xkkLBxqKS5JHya+lBMy7na9LYQC7wDF6WhJLzBtbafZGWQmkPAuv2D1gaxiYeSYELx@lists.infradead.org
X-Gm-Message-State: AOJu0YxQYW2Y51SH00axpIUbmAUMZGxjZoDb88tccHUdH0vBy9fAoVp0
	x9V3w/VKvJnXFXe9OmIQSEESDqAXgzpg5bDrsdEkwyTnwqhKs7iFzjD1PeVmwrg=
X-Google-Smtp-Source: AGHT+IEbIfNzeLwZgrrpPLLaSv5bOleyHd6msDt353EA2HHUzNhF9o9Fa5Cuz6VIqVTylhnb+z1K8g==
X-Received: by 2002:a17:907:74b:b0:a99:fbb6:4956 with SMTP id a640c23a62f3a-a9de6175f57mr1477251366b.10.1730706641496;
        Sun, 03 Nov 2024 23:50:41 -0800 (PST)
Received: from krzk-bin.. ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9e5668499esm517640966b.219.2024.11.03.23.50.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 23:50:40 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL] clk: samsung: drivers for v6.13
Date: Mon,  4 Nov 2024 08:50:36 +0100
Message-ID: <20241104075037.13323-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241103_235043_969832_5A588D86 
X-CRM114-Status: GOOD (  12.69  )
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.13

for you to fetch changes up to 9174fac3b302a853b78c78f2f5ad11462b0c54b0:

  clk: samsung: Introduce Exynos8895 clock driver (2024-10-26 14:00:12 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.13

1. Tesla FSD: Move number of clocks from DT binding headers to driver,
   because these are not an ABI and might change while finishing support
   for the hardware.

2. ExynosAutov920: Add clock controller drivers for PERIC1, MISC, HSI0
   and HSI1.  Context of patch depends on a fix from fixes branch, thus
   pull in my earlier pull request with fixes.

3. Google GS101: Do not disable UFS host controller clocks, ever,
   because gating them does not work well with UFS sleep/power savings.
   Downstream does not gate them via OS, but uses hardware feature -
   Automatic Clock Gating - which is not yet supported in upstream.

4. Exynos8895: New SoC with initial support for clock controllers:
   FSYS0/1, PERIC0/1, PERIS and TOP.

5. Few code style improvements.

----------------------------------------------------------------
Inbaraj E (2):
      clk: samsung: fsd: do not define number of clocks in bindings
      dt-bindings: clock: samsung: remove define with number of clocks for FSD

Ivaylo Ivanov (3):
      dt-bindings: clock: samsung: Add Exynos8895 SoC
      clk: samsung: clk-pll: Add support for pll_{1051x,1052x}
      clk: samsung: Introduce Exynos8895 clock driver

Jinjie Ruan (1):
      clk: samsung: Fix out-of-bound access of of_match_node()

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.13/clk-dt-bindings' into next/clk
      Merge tag 'samsung-clk-fixes-6.12' into next/clk
      Merge branch 'for-v6.13/clk-dt-bindings' into next/clk

Peter Griffin (1):
      clk: samsung: gs101: make all ufs related clocks critical

Sunyeal Hong (2):
      dt-bindings: clock: exynosautov920: add peric1, misc and hsi0/1 clock definitions
      clk: samsung: exynosautov920: add peric1, misc and hsi0/1 clock support

Varada Pavani (2):
      clk: samsung: Fix block comment style warnings reported by checkpatch
      clk: samsung: Fix errors reported by checkpatch

 .../bindings/clock/samsung,exynos8895-clock.yaml   |  239 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-audss.c             |    2 +-
 drivers/clk/samsung/clk-exynos3250.c               |    2 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5250.c               |    2 +-
 drivers/clk/samsung/clk-exynos5260.c               |    4 +-
 drivers/clk/samsung/clk-exynos5410.c               |    2 +-
 drivers/clk/samsung/clk-exynos5420.c               |    6 +-
 drivers/clk/samsung/clk-exynos7.c                  |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               | 2803 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynosautov920.c           |  290 ++
 drivers/clk/samsung/clk-fsd.c                      |   23 +-
 drivers/clk/samsung/clk-gs101.c                    |   10 +-
 drivers/clk/samsung/clk-pll.c                      |    2 +
 drivers/clk/samsung/clk-pll.h                      |    2 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    2 +-
 drivers/clk/samsung/clk-s5pv210-audss.c            |    2 +-
 drivers/clk/samsung/clk.c                          |    2 +-
 include/dt-bindings/clock/fsd-clk.h                |    7 -
 include/dt-bindings/clock/samsung,exynos8895.h     |  453 ++++
 include/dt-bindings/clock/samsung,exynosautov920.h |   47 +
 23 files changed, 3873 insertions(+), 34 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos8895-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos8895.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos8895.h

