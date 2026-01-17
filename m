Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF6D5C98330
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 18:06:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DAV+rbgh38vDvyqyoZv6o+XmUCkitU/RENmeK0ksnD4=; b=VUOU9vgLoJtBJuPUEIeAXMytVi
	zMrHAYkz/NEF/raipSuj4yMSKr081+1sl/7tp4K2J2xifI4S0vJclCBndgNIPzbE/FQXhXxFYFpgN
	o1dTjnQOy5rgg3J/fwaYWFhBDtD3h1p52uv4dA4AIOd8njZ7zEAd2CX42qQJ9CyboTQFf/wj+LKYy
	PL6nJosJ+oU0/8pNHjlAsentd4HSL+0cQMZX+ZPiPg0K4xzzMwN9aNb2shMc1Pkuq/GNBgKhdcyzF
	Ap03EfoyqOaj9c3MrMsd9n/sLotMQYo51SPwd0h+h9rpCVdKSE26jqL479zAnTguZyBeFPCmobJPh
	r4EHaOWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAgq-0000000Fi76-1Tnj;
	Sat, 17 Jan 2026 18:06:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAgp-0000000Fi6x-1d6E
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 18:06:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 64A1460127;
	Sat, 17 Jan 2026 18:06:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5976C4CEF7;
	Sat, 17 Jan 2026 18:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768673182;
	bh=cl98fRzJpx1Su3BC+gmPlPuSNkWthTt3oj+5x7t/7DU=;
	h=From:To:Cc:Subject:Date:From;
	b=kgYncbykMcF1jvhmNLFnXIsNhn5CZWJbTmTXOY4+wrmAFJbJzQN7DPc8lfrxHCt4y
	 B6zpf3RanWbHy6jvcN/YNTwXU9KL9MMf45kMTMyl+iJfB8cHPq922imklZ9EBTDQvK
	 AZGepiFCPGTcf7iqVjxIaUnrdbUDmRYoM0ygCjpxXsZ4Pi6bBLXXS/97s5PrSq/a2t
	 14boQaloACuGrI68COv2ekyHIh5zhU15i09y6Iyx5ZES48q1Wi1LAWNbjP9k34i+RL
	 KtuscY2a4/3Bwg8hXMmI3FKX7gn+kCil3NP2Ob4SMQkMEskVlx/Lv7PcDJf47w4N0U
	 I1Q+opm+B9uVg==
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Sylwester Nawrocki <snawrocki@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org
Subject: [GIT PULL] pinctrl: samsung: drivers for v6.20/v7.0
Date: Sat, 17 Jan 2026 19:06:15 +0100
Message-ID: <20260117180615.10368-2-krzk@kernel.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1257; i=krzk@kernel.org; h=from:subject; bh=cl98fRzJpx1Su3BC+gmPlPuSNkWthTt3oj+5x7t/7DU=; b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpa8+XzZHT/lR+wC8U0JISMdTDJIkzsXC+2RQSk LBSNLOI5OWJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaWvPlwAKCRDBN2bmhouD 18zKEACS0U4pf1JKunVpsA0p55oezfS35LSRATldmi+acFrp4YhmUjE7PKnDEf6Ko+lNj3a0/c9 306WnPjhTR3qZ5BMdD2gEAcG5qgsEv+haz3MLq82bEgA4Jc2ndNd9ehekqa0JCnUgsJzilKZdP4 DMpRALCHWgw6FTesiNSrKRkA2GJ5RnxtBSuXPYYfZwgiNBENrOhk5XLszAMWAsyrBZZ+yhLuA/I /CwzoKI0mvCnzgwPTaFw9uFtgvretoKeCLlruCL1AUK9mCg3fPDmWi/uiDtoJbmevtliBhsqTWR ZbVpcaq44JaF2YxQtDG/3vNJeJbNz/CHho8EbHNNNUmdUInV6Eln5elZ/KJKOyUETTvWwi8M9aI fFvlVPpbDnLtZ8hyvmvZUy/QobQnGuaxrFcMHa/zs43K5jiXdh12vIgb1jjvK++I4upLyEvC3KQ quwI3q7PHgOFlh5K32rGbexiWsb1IBsQN+uUw1qcYZmuOdl7QBQfEWcDal/6KKch9Gz6Oe/ZUP0 oUy5tvH8Z4f9bYGxEHZt+Og2zNeAVn94AmQmJZXZLrsIGJ4epRqLmnI9hm7wggkHcxIoeTEDj9d XYZAKqK1o5HRRMaNaVGpJu9RSrYsTQxlUgHmuZzMh/sjPdYrVjXWscn55DUNVyfvgcExpnQvSwR 5zLvajZfwQd4UtQ==
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/samsung.git tags/samsung-pinctrl-6.20

for you to fetch changes up to 8c483209a6fc71a555fec4a0c99b05e46a5bd38c:

  pinctrl: samsung: Add Exynos9610 pinctrl configuration (2026-01-11 12:10:29 +0100)

----------------------------------------------------------------
Samsung pinctrl drivers changes for v6.20

Add new pin controllers for Samsung Exynos9610 SoC.

----------------------------------------------------------------
Alexandru Chimac (3):
      dt-bindings: pinctrl: samsung: Add exynos9610-pinctrl compatible
      dt-bindings: pinctrl: samsung: Add exynos9610-wakeup-eint node
      pinctrl: samsung: Add Exynos9610 pinctrl configuration

 .../pinctrl/samsung,pinctrl-wakeup-interrupt.yaml  |   1 +
 .../bindings/pinctrl/samsung,pinctrl.yaml          |   1 +
 drivers/pinctrl/samsung/pinctrl-exynos-arm64.c     | 117 +++++++++++++++++++++
 drivers/pinctrl/samsung/pinctrl-samsung.c          |   2 +
 drivers/pinctrl/samsung/pinctrl-samsung.h          |   1 +
 5 files changed, 122 insertions(+)

