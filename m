Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9C78C28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 18:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=; b=c6ZN+4ptVEAfV0BhORiDPYnHRq
	Wixe/sZ5oD6qcDysBtmuPPG39cru87oHzROxQX8w0CiCVszF5Snw72W3LbktPhSXEBYqUgEGZmm70
	+Ai4kY08nYC1z6QGlsNyX26PnqLRi4/s3tyz7Dq+bgmFJioM2AY2dAUD8n9jrROyy1aGw/HmjTWxc
	Q9arHCs9kQQa1HMWsOwo1rV3wNouuaC4elC26b/2jslkqv35o3bCdpDiGp9fxkgcx/uAiLAx42JVJ
	RRm47lheVV9jJaXK8jYUjRazKhTvS0aPOq+iO8XlJVLxmkOgLMA7lS49lp2e98Jh8YTqzuxAz+13A
	o2OR1BoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trKxP-00000000um4-0L63;
	Sun, 09 Mar 2025 18:00:59 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trKob-00000000tC8-0myU
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 17:51:54 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-38da6a1a20bso193081f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Sun, 09 Mar 2025 10:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1741542711; x=1742147511; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=;
        b=pqPokU4KcufEy3wRYFGUaL1WHq1iVk76uYE0zoikNWHE0ZGMuHvP3uF0VHeFKQHgpC
         GG5oY1XJNR1R1Dq18Aj8FgbT7IBJTAT7JCBqJc/jtxHbcflPdhoBB/U9scye4+5xCK6t
         YUB1qmgK+8GEMxHGequTj/GFjq/MdhszqZ9ZvJAIWh7uErPQon0KfuFxzGXrR0TULDif
         7uqyqdySWSBGCg5yoA437rDG8iYczjDxM4Ujfm40r8c9h8cihy+XSmwmjjawVTJflJ+5
         Zi9adJ5CREbnh2Fe8Dqcs4oHt+ZoGFYUoknW4ZV7UQrIbx5KrUUKtUD09NiqUuTxp5ye
         vVmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741542711; x=1742147511;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ag3e+knRyg8hgi6gCn3CC6P74JcStlCkhKaiz35snmc=;
        b=sUiZWjmyS2V9Qt1D3XOHVqiDqxxHPPXMm5raTaAKKdTaN/WvSS96VHz6tgVmkUBnB5
         obAFAgYSbMYNiuX/702ud9NvfCnOgK5arMxkHmyKznvFo/qAwHk3MXDbNvW2XRHGrZhx
         fVrJVwnAdu5v9j/7ZFN2pc/wYQDeh25NHqNHwvGZVxx0HzZUSECbFzR1HtIraDpfUEHJ
         b+iT5kHN8gDo86kCUQV2yrKKOCvF5cfo5JHCAr9b0ZSLdv22j/dpE4eKz1O1dC113Syu
         KlUjL1Tmct6OEspapxku1nAr7ycMVWkWNQOXClgWibniG80BowdQ9m8yIhHmKtCB33Kg
         fTHg==
X-Forwarded-Encrypted: i=1; AJvYcCVio32mLWfinKOHHbrgSrd7LIoH89XXYOrTQozxTgFgcW1nCvnp4BatSdyAFWxTo2EhEqdwVhBM5UKIClHTZUgD@lists.infradead.org
X-Gm-Message-State: AOJu0YxS/USI8LsIx/Y33IJljieHjn4DfRLh/c+eecN+4RzQtHjclVJg
	gRazITlR4gjCo7I60jOG1VaOPkvewZpeVKVFm6KiDLShKOgIGFQVbqTD3lCG7aU=
X-Gm-Gg: ASbGncsJIp4q2CBfgcmesUaig3rL+7liEJnm0ytMxOUwJeWBVtXsYAd/O6hlh287vem
	HhTSYYSLeuNOPfNyMzK8moqfE1y1YWz+cA92jJmiXK0ANt2gcxTIq4927C6rXJr55a6HsZsGyZn
	M/BD1GJr7yvm8lJcPSEC47UlNS7Uwjs71hYZq3IkZUKc2fln4mjdMq5o8zfULRolcf9FmVNclap
	spgxSKRc/TkryQf2apWixlSVxIaNEVOMsJKYaKiHgyfFBmm6VN+NiRd1nAamDkysILJLg6PmO+p
	/rg9zt56pToglSETntJxbX2zvSiC35V9Uk04xdaAuZxkKqnCF1Puoxrhly+VAlX7ccxtBQ==
X-Google-Smtp-Source: AGHT+IFa08ql7h89Y752Zvu7Rau8znLYoWC3F6Ls9EZuW63PkjYBwc7RN80jzLbibjKC9dFckabhWw==
X-Received: by 2002:a05:6000:4021:b0:390:d8ec:1779 with SMTP id ffacd0b85a97d-3913bbd20d1mr1460637f8f.12.1741542711124;
        Sun, 09 Mar 2025 10:51:51 -0700 (PDT)
Received: from krzk-bin.. ([178.197.206.225])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ceeb34904sm39156975e9.30.2025.03.09.10.51.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Mar 2025 10:51:50 -0700 (PDT)
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
Subject: [GIT PULL] clk: samsung: drivers for v6.15
Date: Sun,  9 Mar 2025 18:51:47 +0100
Message-ID: <20250309175147.6672-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_105153_244791_162F4878 
X-CRM114-Status: GOOD (  15.95  )
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

Hi,

New clk drivers for Samsung SoC.  This pull includes drivers which you
commented later and pointed out few issues.  Pointed issues are in all Samsung
clk drivers and the ones here just copy existing patterns:

1. Headers: I fixed it for new and existing drivers and this pull request
includes the fixes.
2. device_get_match_data(): I still wait for contributors response. If they do
not respond, I will fix it for next cycle.
3. refdata and platform_driver_probe: I tried fixing it, but incomplete and
need to investigate more.

Best regards,
Krzysztof


The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.15

for you to fetch changes up to 017bbc922a09630579ff7b5b314fb186b8c0efcf:

  clk: samsung: Drop unused clk.h and of.h headers (2025-03-07 16:01:22 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.15

1. Exynos990: Add support for the PERIS clock controller in existing
   driver.
2. Exynos2200: Add new driver for several clock controllers (Alive,
   CMGP, HSI, PERIC/PERIS, TOP, UFS and VFS).
3. Exynos7870: Add new driver for several clock controllers (Alive,
   MIF, DISP AUD, FSYS, G3D, ISP, MFC and PERI).
4. Correct undefined behavior / runtime array bounds check of flexible
   array member (last 'hws' element in 'struct clk_hw_onecell_data').
   The code was logically correct for normal case, but not for the
   clang/GCC runtime bounds checking of flexible array member.
5. Few cleanups: spelling, header inclusions.

----------------------------------------------------------------
Colin Ian King (1):
      clk: samsung: Fix spelling mistake "stablization" -> "stabilization"

Igor Belwon (2):
      dt-bindings: clock: exynos990: Add CMU_PERIS block
      clk: samsung: exynos990: Add CMU_PERIS block

Ivaylo Ivanov (3):
      dt-bindings: clock: add Exynos2200 SoC
      clk: samsung: clk-pll: add support for pll_4311
      clk: samsung: introduce Exynos2200 clock driver

Kaustabh Chakraborty (2):
      dt-bindings: clock: add clock definitions and documentation for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

Krzysztof Kozlowski (3):
      Merge branch 'for-v6.15/samsung-clk-dt-bindings' into next/clk
      clk: samsung: Add missing mod_devicetable.h header
      clk: samsung: Drop unused clk.h and of.h headers

Will McVicker (1):
      clk: samsung: Fix UBSAN panic in samsung_clk_init()

 .../bindings/clock/samsung,exynos2200-cmu.yaml     |  247 ++
 .../bindings/clock/samsung,exynos7870-cmu.yaml     |  227 ++
 .../bindings/clock/samsung,exynos990-clock.yaml    |   19 +
 drivers/clk/samsung/Makefile                       |    2 +
 drivers/clk/samsung/clk-cpu.c                      |    2 +-
 drivers/clk/samsung/clk-exynos-audss.c             |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    1 +
 drivers/clk/samsung/clk-exynos2200.c               | 3928 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynos3250.c               |    4 +-
 drivers/clk/samsung/clk-exynos4.c                  |    2 +-
 drivers/clk/samsung/clk-exynos4412-isp.c           |    2 +-
 drivers/clk/samsung/clk-exynos5-subcmu.c           |    1 +
 drivers/clk/samsung/clk-exynos5250.c               |    1 +
 drivers/clk/samsung/clk-exynos5260.c               |    3 -
 drivers/clk/samsung/clk-exynos5410.c               |    2 -
 drivers/clk/samsung/clk-exynos5420.c               |    1 +
 drivers/clk/samsung/clk-exynos5433.c               |    4 +-
 drivers/clk/samsung/clk-exynos7.c                  |    1 -
 drivers/clk/samsung/clk-exynos7870.c               | 1829 +++++++++
 drivers/clk/samsung/clk-exynos7885.c               |    2 +-
 drivers/clk/samsung/clk-exynos850.c                |    2 +-
 drivers/clk/samsung/clk-exynos8895.c               |    2 +-
 drivers/clk/samsung/clk-exynos990.c                |  182 +-
 drivers/clk/samsung/clk-exynosautov9.c             |    2 +-
 drivers/clk/samsung/clk-exynosautov920.c           |    2 +-
 drivers/clk/samsung/clk-fsd.c                      |    2 +-
 drivers/clk/samsung/clk-gs101.c                    |    2 +-
 drivers/clk/samsung/clk-pll.c                      |    1 +
 drivers/clk/samsung/clk-pll.h                      |    1 +
 drivers/clk/samsung/clk-s3c64xx.c                  |    1 -
 drivers/clk/samsung/clk-s5pv210-audss.c            |    1 +
 drivers/clk/samsung/clk-s5pv210.c                  |    1 -
 drivers/clk/samsung/clk.c                          |    4 +-
 drivers/clk/samsung/clk.h                          |    1 +
 include/dt-bindings/clock/samsung,exynos2200-cmu.h |  431 +++
 include/dt-bindings/clock/samsung,exynos7870-cmu.h |  324 ++
 include/dt-bindings/clock/samsung,exynos990.h      |   21 +
 37 files changed, 7231 insertions(+), 28 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos2200-cmu.yaml
 create mode 100644 Documentation/devicetree/bindings/clock/samsung,exynos7870-cmu.yaml
 create mode 100644 drivers/clk/samsung/clk-exynos2200.c
 create mode 100644 drivers/clk/samsung/clk-exynos7870.c
 create mode 100644 include/dt-bindings/clock/samsung,exynos2200-cmu.h
 create mode 100644 include/dt-bindings/clock/samsung,exynos7870-cmu.h

