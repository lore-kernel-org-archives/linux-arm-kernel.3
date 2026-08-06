Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 986D1C55ABF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 08:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=g/COYdqDrg8vdSyAwJS5nvJ2rFgUpbSAtTvf3IC0+cc=; b=Lh/gi/QDUkxMCuwYAShcAGx847
	XXliQ3mmpYd4JC9ONLIO0x3RlfHZc1tr5jNxkjnQRpD8GhDwWZVm+A4qDYXlQRAh/rUDbXaMLdTUP
	HbK7WVCLOvPIWbOjqK2IgWwv2klPEUHAgYgXioPlivz6+UX5f+0nLtpdKcHNe808bNGK5ae7y7vyr
	i5KEt+GGJ7rHwSwvLbH77qIt/X0McE/TJzyJXG4TTtS0vCv3ihcBCtzDOqVx9jJVz3tmKegLW7QgA
	B+R+3f8VP/kzBmKw1WT/tNnRAaOdM2eK7shNyHhktTCSbzgqHwJ34TvY4zWiMq9Jq1RjpTN6gjF3P
	9Y+mJZbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtMD-00000005DKU-1vwE;
	Thu, 06 Aug 2026 08:21:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrtMB-00000005DJw-3qGH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 08:21:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9C13A4376C;
	Thu,  6 Aug 2026 08:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414981F000E9;
	Thu,  6 Aug 2026 08:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786004499;
	bh=g/COYdqDrg8vdSyAwJS5nvJ2rFgUpbSAtTvf3IC0+cc=;
	h=From:To:Cc:Subject:Date;
	b=fLtQqpYCCxvUJ2zcj4FlNtTJg6wNoGDhfI6kxbeW7JuX6H6W552j3du8+x3+CAxnI
	 xKm1ff8aEvKlWw/QV6swlN4QfPepRWMq6Iez9IxTJ7Gr0vtI29hUawiI3JtjO2dbtm
	 fBfBNVPr6LfWd/fodwfzDzHbC2AFbIjfBAItiFyQFRUDuHbh3n/Hmc0UVdq2Tsu6XX
	 y6/3bgiHt+DLgAJYI6f/tNhBSQP0IOl1CbU6X+v3wps5Xl5TTKFjPoSfXnQEfD/FS/
	 szreDRBM79igYxD6qCRTRU+Rub3w+hJc+VUH+LsYO22E1SN/ufCogGZk63MpJaP0Tb
	 /QUBiKiooMJog==
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
	linux-kernel@vger.kernel.org,
	Brian Masney <bmasney@redhat.com>
Subject: [GIT PULL] clk: samsung: drivers for v7.3
Date: Thu,  6 Aug 2026 10:21:30 +0200
Message-ID: <20260806082130.165665-2-krzk@kernel.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=krzk@kernel.org; h=from:subject; bh=ZlNCp8dIjmyd81ZPzno5nW4rK5IDcbFp975B+dvP4ic=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBqdEQKqxPuEQFxgqwExDsX10r70tiur91j6tXjt C9sZZxyEP+JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCanRECgAKCRDBN2bmhouD 1xAkD/9GLsSNKKVQlcJ2lcpIwAtD74N6L7W2W/AmAR7VWt4lH9ZAepKjJ8GcXiW8pbGxaOzxGC2 KhOFvrKrjRU+7KES8rUbidBE7dGuNoklt2hwp0H+mFr3T4t7O/cgCTfVSr7rHmUmpNfOjzaMnJJ wtv5BqFJ/5V59tKDNA4VRmj640fC96m3oL1bONDPJi0DyJAZkZBwHowBwWD+lKrt1KHiUSbVkrZ rw4p6GoMZi1SkB15b2TW5guYkLaKjw0Oiferlzi5S4idxti18jYcwD/q8Ksa3CVZDzG7EQhUJS0 ofC6ayb1mJ3KEV6wLFwiWrUQ548tXkofKexFJ0qC5S0MR3iOvn0yicWW/Kcct2s3x6uQ1VpgMlX 5ZO5iNE+hciNQBZKMZXyoS/7RaqPh8/dnSXqdTnoS/NrC2fn6XdXkBkxuth7ctXbdOI63byAJXB aqvf1EiQi2PXhJbA0AZbnzwmgJUtnCHSvh+BGCP22K+My3JPPYDCRYgYNzwnnKyKQ6dfXAtFxLS 29sEunqF5ZqBWbPbvRjXjf6431AwVqix8gn2rj4owPj4+bNHHyCgniQYFY8uEI8u2KBfLDveDO5 hY5fLmOHUHTp2wl6YJTCIRvGwkpmqbjks/bP4OsEmKsRUQrb09Y27G0Rj0hnQtPn0Kba0TAyM1c 0E7W7LaqUGxXKmw==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-7.3

for you to fetch changes up to 6d32ae6403694035896cbf0436088fca4c6a35f1:

  clk: samsung: pll: use kzalloc_flex (2026-07-18 18:21:13 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for v7.3

1. Exynos990: Add few missing clocks and correct the gate clock parents
   in the PERIS clock controller.

2. Cleanup - Use kzalloc_flex for __counted_by checks.

----------------------------------------------------------------
Denzeel Oliva (3):
      dt-bindings: clock: exynos990: Add CLK_GOUT_PERIS_TMU_SUB_PCLK
      clk: samsung: exynos990: Add PERIS TMU_SUB_PCLK gate
      clk: samsung: exynos990: Fix PERIS gate clock parents

Rosen Penev (3):
      clk: samsung: use kzalloc_flex
      clk: samsung: cpu: use kzalloc_flex
      clk: samsung: pll: use kzalloc_flex

 drivers/clk/samsung/clk-cpu.c                 | 34 +++++++---------
 drivers/clk/samsung/clk-exynos990.c           | 24 +++++++-----
 drivers/clk/samsung/clk-pll.c                 | 56 +++++++++++++--------------
 drivers/clk/samsung/clk.c                     | 11 +++---
 drivers/clk/samsung/clk.h                     |  4 +-
 include/dt-bindings/clock/samsung,exynos990.h |  1 +
 6 files changed, 63 insertions(+), 67 deletions(-)

