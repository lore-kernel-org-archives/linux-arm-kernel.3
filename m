Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87B51EA3C4E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 12:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Co/4Ve9n6VtY3ahQ6O+ULQzOFl8L54M5+KbBmDwRrjk=; b=VzIP5ymZRtMKGKaSZPUZcCp8oE
	kedZIh3RfxBXOqLn3b46eVqdXPDzxCqFd8TIZZW7fOWwCzqmC1wdDNs62CjZ8vuIrG/l773+h7RPg
	VgjKO4fx2gNpmg0YqhGnJ0w9vn/PPNJ90wcvuIgkaS8HtANUrSdaRjI8KTLeX6vtAMaVV2CFPQZwf
	wyIYksdNourXslZKB0VtJpVT1FGS24j7NhSbOi5l2LH4RX5uMuuZbDBFHxOkdtttGD0jvdfFj3VDP
	YDSsTVHqzT/RGNWeyOPSwvSTda0oe9DXQxcs3xUI+MGOioHUPRhaWtcBadsbJ4wLh1zE9zoXN6ZDA
	6gtCMKWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoRg-0000000AND2-29Ac;
	Thu, 09 Apr 2026 12:25:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAoRe-0000000ANCZ-0gcP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 12:25:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5BA104341F;
	Thu,  9 Apr 2026 12:25:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E696BC4CEF7;
	Thu,  9 Apr 2026 12:25:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775737513;
	bh=PzGc744IfLosoYW/4TYIUb0+vQyy/eIOqkVjcY5usVM=;
	h=From:To:Cc:Subject:Date:From;
	b=D+mBCCTm9aFfhSUlUFqw7wrHppv2f4W7eKSm69uxuv5Z2uuExwh2/9eCTIjI6xH0m
	 28Hmy03nH48fD8BLpZeHYWQgRV2z9yHvvNL+A7Xj9CQAJY7VTnkehdsCEK8SlQ/dXN
	 8SanpPUp8lKo713jj0QT4nvCvTMxbBwnQJS8M5GYFNAW0yVt7ixghSjhYLA0X2C71X
	 zxAupitBEFW/QW2bKOhuwAbQ8AsGI7ive/vhGkvWOywiAQlBsI+FUWfUCAdl1RV+gR
	 lL+r8hNCTYz90ZpdUgejiQ0ufQxoWP5uKarpT/pyxot/ETPyd0BV3bPjGgQxpYaRsn
	 todkMfrFJn0dg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	linux-clk@vger.kernel.org,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk: samsung: drivers for v7.1
Date: Thu,  9 Apr 2026 14:25:03 +0200
Message-ID: <20260409122504.71017-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2759; i=krzk@kernel.org; h=from:subject; bh=PzGc744IfLosoYW/4TYIUb0+vQyy/eIOqkVjcY5usVM=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBp15qggmUZ3kZpp2bVcyGYL99GjodD8u7JOCp85 BWyWyjGyHqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCadeaoAAKCRDBN2bmhouD 1x8vD/47Otrj+RkgOUhE4x6o4gLRbj8uIwUT1Kl/+IvbYl1Zb0h0m9JVQSHu9Dljpqa8sZsLBLI +0bARVU4n5OaCpQ6gcVaGYB8TRwdiuopLwICEi6UApL0Uz9FCgtZuz6PIw/a5jo2SggD0WRAs6V n3mA6/fIs0KMoMgWnjV6ouWUib7yl/SFE8tk2H2GvyHODv3+0ZCemLCmWjjx9KlrE1UrZHlO5M5 HOO/WoRiDF5D+so1M5reTEiVdnR0KFcBcIt3SZwy1BS60mZxiodcNp2zLv50afP8l/VVAoabEP3 Ijlua8KJB+sGC3lRcNnfp6s//0APB0XZFRTMDUAadjAdz2XSc5NigHP6YZFBPThfZYJuSxIfIiF lLGQ6lxuoacmmLngyYHk41mRUOW7Ee5u/KeIB9B2u54seHTbFAq/2V+6cx7/wM08tM72/LFCqTk Lb3pIBMJnmF1iDcYMhbjJ3YqrHQsVyXcKtuF/nIecqbReLvs5B05eKl1WndGkq2JZLf6XHxbOPx CBXckWYBJesypbiIYOdqZhoSiPv6tyeaQL0Q+g/BUKxvizbMLdZlgtbEBHs2yjvpAtgYrWqSZCl hfr5lDegZpnDOkHoL92dIjv3tVZSEd+Bd4cFErlmN4z+Hc1XHOtKznZFRPRrEkD6dxqWW9P/ceD n4wloye2NfPGYZQ==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_052514_246725_CB930CE0 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.1

for you to fetch changes up to e57c36bc1a3e459239ead492ebce731a88a264b1:

  clk: samsung: exynos850: Add APM-to-AP mailbox clock (2026-03-24 13:43:19 +0100)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.1

1. Axis ARTPEC-9: Add new PLL clocks and new drivers for eight clock
   controllers on the SoC.
2. ExynosAutov920: Add G3D (GPU) clock controller.
3. Exynos850: Define missing clock for the APM mailbox.
4. Few compiler warning fixes cleanups.

----------------------------------------------------------------
Alexey Klimov (2):
      dt-bindings: clock: exynos850: Add APM_AP MAILBOX clock
      clk: samsung: exynos850: Add APM-to-AP mailbox clock

André Draszik (1):
      clk: samsung: gs101: harmonise symbol names (clock arrays)

GyoungBo Min (3):
      dt-bindings: clock: Add ARTPEC-9 clock controller
      clk: samsung: Add clock PLL support for ARTPEC-9 SoC
      clk: samsung: artpec-9: Add initial clock support for ARTPEC-9 SoC

Krzysztof Kozlowski (3):
      clk: samsung: pll: Fix possible truncation in a9fraco recalc rate
      clk: samsung: Use %pe format to simplify
      Merge branch 'for-v7.1/dt-bindings-clk' into next/clk

Raghav Sharma (2):
      dt-bindings: clock: exynosautov920: add G3D clock definitions
      clk: samsung: exynosautov920: add block G3D clock support

 .../bindings/clock/axis,artpec9-clock.yaml         |  232 ++++
 .../clock/samsung,exynosautov920-clock.yaml        |   21 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-artpec9.c                  | 1224 ++++++++++++++++++++
 drivers/clk/samsung/clk-exynos850.c                |    7 +-
 drivers/clk/samsung/clk-exynosautov920.c           |   52 +
 drivers/clk/samsung/clk-gs101.c                    |   52 +-
 drivers/clk/samsung/clk-pll.c                      |  185 ++-
 drivers/clk/samsung/clk-pll.h                      |   17 +
 drivers/clk/samsung/clk.c                          |    4 +-
 include/dt-bindings/clock/axis,artpec9-clk.h       |  195 ++++
 include/dt-bindings/clock/exynos850.h              |    1 +
 include/dt-bindings/clock/samsung,exynosautov920.h |    6 +
 13 files changed, 1960 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/axis,artpec9-clock.yaml
 create mode 100644 drivers/clk/samsung/clk-artpec9.c
 create mode 100644 include/dt-bindings/clock/axis,artpec9-clk.h

