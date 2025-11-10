Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E0CCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 15:13:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dRX2sm4MDVXRTJlbRBX2N2s7POdpJhVxc/NfgviDk2c=; b=2T2QqGupyZ7UjrrnLqVuQgwLd5
	cUlGwtro9RbtblVDqXUEgnRRh2DOCWKq+elT9JDLGJ2hsStfKFWim4EsbqkBSQqDZPbZlHTTwG6DL
	dRREr9Fg28QpDHwROufT15V8E2SUsioDlB7zcFQ39FvbuKBdLKM8z9F/HTtS9BdkMVwNA6lijuABW
	br+F5qo0vO8VgRqHpJ5kHkm8AbjSdNzvo2fiE0vLLPTN3m0reSkzXpENQf6rVQ/pAjTvcbUBGBxBh
	LBxq1fziDMMAq8iUHe3L/HCvbcIw8IJpIQq3AKzAgiAV9HcqVInTVeAe9kPlwiEyQRWeMOgpVzMg9
	Ww0rCTdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITaG-00000005fGN-02B4;
	Mon, 10 Nov 2025 15:13:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vITaE-00000005fG6-16Ef
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 15:13:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 650BD601AE;
	Mon, 10 Nov 2025 15:13:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81911C113D0;
	Mon, 10 Nov 2025 15:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762787609;
	bh=v+WhwaNQxNmGiOc1Ncd79H143hIDikEV7iSCtMGSUSs=;
	h=From:To:Cc:Subject:Date:From;
	b=LiUDi3t4vRd8VWatHnlVRBRwc+wUM+x+VJ129NqHQliqbXiDbnYtKkQM0rO2nbXO3
	 MTtKngRvz5i00KeGbOUn8supigGQx1UZaLJ2dzMIJILD31SeI9/E33zBvsPrfrAziY
	 p+370/fG3Erg/1e4VAGDbJ1oJy3Je+W+HbC1rsvp0n+zl9XEZ7uR691FXpNps36cE5
	 RwGVaw1UjdPZZLhFceUF//lYWuRXeVhdp2U9Wnr+UpyP7zbrB80gDQYXaipqQ33Om2
	 MDr1Hy/5xJ4oO2N2cfFQkS6nfbaVDCeXrdn3JD5RaRPp/mmkqptj+lc+wDUqRi1coR
	 4t2BPB1xiOckw==
From: Krzysztof Kozlowski <krzk@kernel.org>
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
Subject: [GIT PULL] clk: samsung: drivers for v6.19
Date: Mon, 10 Nov 2025 16:12:42 +0100
Message-ID: <20251110151242.136508-2-krzk@kernel.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1558; i=krzk@kernel.org; h=from:subject; bh=NMFi2ddzD9bgrisS/6TQO0TkyBRAyNYFx94+jZwEbr0=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpEgDqC/UaGCPFd7MoHs5A4cH0wd5gAMIivlI5p hrkjXr4tYmJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaRIA6gAKCRDBN2bmhouD 13YWD/oD6VZLjGViUOEIYqWSweEQOKX6GoKvMVmCpjo8GyspDLo1rHZl7tc8s/RE2Cyud0u91dv 9vY+pxlKCr8TVLhLI1aK/0xtWcoXXPwYyjcsOrhl/QbWctQm6Yu8GHj0Yvkdf6ZYSEeKshxwiNK NR0mcDrRqoXXVOAahvPETM+ppkJBT8mDB5oDU+GL/m8FCaCJxdLa0kZbMgPyKIvHWtlMKGj3dIg faN0D0bGx1txnOy1QPS5XErhQFCz4yHc1yb2wq8ag1YFAUIvtUsuxt73/OcYrPMMnHulGnrdyQ7 5y12NM5sDfIDFHBMpAbm0KOzQkoOL8a5F3rIHIpnBqnA/w4/2ykZ0bfwdaIx9kfEc9/u/tgLz63 Nqi1I/GoPkkdP1On0jtnKgZ2D4qg8mD/rLIz95xAWf0IFer2I9OQcG+oS/ZPsDBcbVeVsTLT+Nu RAQTTaFaVZK3G06XiDWJfhlKtivbF+6SFlpvSENaYx+akM6i/6tCWmvkMspKQsgI4Sx+uOf0Syy EYjMMl8rgnEaTT1lf0HRDKz4AUzg7FGQ72QpYAcFNEcszVCGh42omri6ECDIJZVwrhN6ErdxPhV x9ApiYlrbRbEECA4ugdPBQ9aUtMNGlLm2jhcOndSDcPkFz6IIeiHSSMdj0BsyLFGvSccVEHAUPA Vf2PkaUDVLGtbRg==
X-Developer-Key: i=krzk@kernel.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Type: text/plain; charset=UTF-8
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-clk-6.19

for you to fetch changes up to d669ec6be0b1965c67248407d87c848b1b7c12ae:

  clk: samsung: clk-pll: simplify samsung_pll_lock_wait() (2025-10-18 18:12:41 +0200)

----------------------------------------------------------------
Samsung SoC clock drivers changes for 6.19

1. ExynosAutov920: add support for additional clock controllers (M2M and
   MFC).

2. Few more cleanups and new bindings.

----------------------------------------------------------------
André Draszik (2):
      dt-bindings: clock: google,gs101-clock: add power-domains
      clk: samsung: clk-pll: simplify samsung_pll_lock_wait()

Raghav Sharma (4):
      dt-bindings: clock: exynosautov920: add m2m clock definitions
      dt-bindings: clock: exynosautov920: add mfc clock definitions
      clk: samsung: exynosautov920: add clock support
      clk: samsung: exynosautov920: add block mfc clock support

 .../bindings/clock/google,gs101-clock.yaml         |  3 +
 .../clock/samsung,exynosautov920-clock.yaml        | 42 ++++++++++
 drivers/clk/samsung/clk-exynosautov920.c           | 90 ++++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      | 41 +++-------
 include/dt-bindings/clock/samsung,exynosautov920.h | 10 +++
 5 files changed, 155 insertions(+), 31 deletions(-)

