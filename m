Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB85AC44536
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 20:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xbt7lg6ASnf6yol7TditJ/E15XiSCMl2qVhsdgt6Qyw=; b=N4uRW7CK363x6A
	aux8ci/oJ+1kyVCoFoOBzuvyP65Voqh/J93jcQbZuxi6t+uO6DepNHlVPNb9UlBlP/7jzjC1jYrLW
	qUGCBc6cil1Jvefxr22m6JK+jHVwOG/LiHA64/8A6tKZXsgtxX6zx46dOo4OioJyoHvKxolIn8owm
	mV9AA5k98LecHTsRZKnZln564085iPrWkLqi2ptDD3dSU//FsYyiugP2gYUsu5cIqOq5uJiTpfX7P
	/gCf/pRNtqu8FYOxpUEG3BcgU0DEI93nG3MqbVoT0dlHLkN7PfZo+lD0vTrCyD7NXJasl1aR7QZk6
	wAvibpHPl1Pp/cPee9GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnf-0000000Ckkx-1Y8x;
	Wed, 22 Jul 2026 20:44:19 +0000
Received: from mail-106112.protonmail.ch ([79.135.106.112])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmdnb-0000000CkjU-1KG4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 20:44:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail3; t=1784753047; x=1785012247;
	bh=xbt7lg6ASnf6yol7TditJ/E15XiSCMl2qVhsdgt6Qyw=;
	h=From:Subject:Date:Message-Id:To:Cc:From:To:Cc:Date:Subject:
	 Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YbaHimZl+IzyFfkoTPAKbFfhsyueZIAgmp5oPPeGQ+y4qmAstME7f5MIex0LRY+pr
	 X6PsKb7supMtDtGXqd90ySBUxC1th2pDQtqffWXoIOzyWYpEfGBq2Lx+M7WtKo9/xd
	 lVo+DY2HfgXPTQlCKOvb9+n21CwlFaLGEEcMS4Dc8oOHMsdanHCcrycPgABc8ej4Wt
	 nH/SuZ4c+JrpJCnAkjs6ji1uqezVDUf5/A7ZY1u3O800JBmab5IyT/M/GZzY8QSdhq
	 dl/a199V7lGeKXivTSpYRzOlBWHVcThR/FuaXSu1n/GheUeaCXf5bT+rwR+77b8kdT
	 57gY1OTm+WU0A==
X-Pm-Submission-Id: 4h55nw6NWyz1DDp6
From: Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH v3 0/5] clk: samsung: Introduce support for Exynos9610
 clocks
Date: Wed, 22 Jul 2026 23:44:01 +0300
Message-Id: <20260722-exynos9610-clocks-v3-0-c672a2a30889@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/23PwQ6CMAwG4FchOzuzFhnIyfcwHmYtsihMNyQQw
 7s7ISYeOP5d/q/rWwT2loMok7fw3NtgXRtDukkE1aa9srSXmAUq1CqHTPIwti7sNShJd0e3IE2
 BZkc7rNCkIvYenis7zObxtGTPz1eku2UoziawJNc0tiuTlodOLjyi+BZqGzrnx/lPPcyN+J6p/
 er6HqSSaaUhU4hnyIsD1bYxtPVu1nr8Cd8D9JqAUSBIiQuuoNDwL0zT9AF7gkfzJQEAAA==
X-Change-ID: 20260715-exynos9610-clocks-a82a4c42f2a3
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Alexandru Chimac <alex@chimac.ro>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784753044; l=1722;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=QCFLtqrjxaxKo+IkPyPzKNyVJbZKAG++zQnBYytxjyk=;
 b=YtVdMQqvrw3I9oyj8Kv0aIb3Z90Md0KX+PV/sky+lp+sLS6ZfR7kEWanv0kEu3C35wtcCf/zD
 RB6g7IF0d+oDHYvzzq+VEun9JYFnM6YXZCl4HPiKV9s8IqUnO9V+RKB
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_134416_148725_D5567CBA 
X-CRM114-Status: UNSURE (   8.62  )
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

This patchset adds partial support for clocks (no SHUB, MIF, ISP, VIPX
or MFC) on Exynos9610.

---
Changes in v3:
- Use correct DRCG_EN offset for dispaud
- Fix improper clock assignments

- Link to v2: https://lore.kernel.org/r/20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro

Changes in v2:
- Remove device tree node commits
- Fix binding formatting / example build issues
- Enable auto clock gating
- Add USB CMU
- Remove CPUCL1 CMU (PLL initialization fails with ACG enabled)
- Update maintainer e-mail, copyright year

- Link to v1: https://lore.kernel.org/r/20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro

---
Alexandru Chimac (5):
      dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
      dt-bindings: soc: exynos-sysreg: Add Exynos9610 SYSREG bindings
      clk: samsung: clk-pll: Add support for pll_1061x
      clk: samsung: Introduce Exynos9610 clock controller driver
      MAINTAINERS: Add entry for Exynos9610

 .../bindings/clock/samsung,exynos9610-cmu.yaml     |  335 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   20 +
 MAINTAINERS                                        |    9 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos9610.c               | 3715 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   29 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos9610-cmu.h |  722 ++++
 8 files changed, 4825 insertions(+), 7 deletions(-)
---
base-commit: 06a508eb73747a8a71bed89f5766226e433594c5
change-id: 20260715-exynos9610-clocks-a82a4c42f2a3

Best regards,
-- 
Alexandru Chimac <alex@chimac.ro>


