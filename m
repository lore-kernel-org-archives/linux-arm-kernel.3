Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55545C44516
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 17:15:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vfm/hwNGRmfI9kTiLeHY87KKn3ADbk1XVoDgDJ7yoOA=; b=t5e3X6Ba0KstgQCNu5Q5BXGHHm
	yshzrl6eNXwLQz/kR2fdCoaZy5fk+DFZ0bVplmj1qaOZHEtjOBJD2p4vBhu/La87DYd4pq2y0fNyp
	pCkfym03W50Z+lPkDE9pTTJPawVjZWEU27OaRhNZVGhlX1s2yrRT63ADrmdkLOV6R54xJMLT1OSWF
	/jUqYXh7CwX5Ljz/9Zecqdmw+o+DVc97Telnm0zGtX8Dm+/c0p2Hon0bRZB0I8a8kIpLdToEAWRRA
	cAwCyT3zBFTHMr5hDzbY6wURTILVRS3RPfXVOJpAwDULT5m/HEBz50krl9msNWHL0kmX4aZRGzT+q
	9rur4F6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPfu-00000000F4x-2lSu;
	Thu, 16 Jul 2026 17:15:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkPft-00000000F4N-1U4v
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 17:15:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D30C040726;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A61C8C19425;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784222104;
	bh=X1Fos9kKkDy2zbBIakV8ZOCZ9DAxzYNhdLDz5n9bfc8=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=d1PoNS3p1omkUfGI1w2iv3gGCNsp93/DFmr/f+F7moJKUymE77LtLAlIYXeCLQIwF
	 vozvGwtDSiako27rGiUFnl+duvEzdka8QW5/VLVu6wlGvrUJeWwZrKPWbRxiTEPslS
	 xr1AgIKbDSJktzV/Iue+xGQCCuiSv4n4CchDT+J7YAGT/7g6931agErVar+Wzt9ce1
	 KytYsH1m6XEWKlbBGWQqclrxi/cN1lu57Oj+tZpAdTr0UZrd7Q5tfjr6c6OX2CJHIN
	 nvqmFXR+17Yrq0ZMhNaqnq9yjE8D6si5zAa6puGeguwdMW72rG2Rzt6IwQCfA2/SHt
	 D/fZCQl4z48ww==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80432C44501;
	Thu, 16 Jul 2026 17:15:04 +0000 (UTC)
From: Alexandru Chimac via B4 Relay <devnull+alex.chimac.ro@kernel.org>
Subject: [PATCH v2 0/5] clk: samsung: Introduce support for Exynos9610
 clocks
Date: Thu, 16 Jul 2026 20:14:54 +0300
Message-Id: <20260716-exynos9610-clocks-v2-0-c13ce8ef1861@chimac.ro>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22OSw6CMBBAr0Jm7Zi2fGXlPQyLUgdplFbbSiCEu
 1vBpcs3k/dmFvDkNHmokwUcjdprayKIQwKql+ZGqK+RQTBRsJLnSNNsrD8VnKF6WHX3KCshM5W
 JTsgUovd01Olpa16anR293jEd9iG00hMqOww61ImhKeAvX8BX6LUP1s3bTyPfjLjP2env+ZEjw
 7QreM6EaHlZnVWvB6mOzkKzrusHHo8JseMAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784222102; l=1530;
 i=alex@chimac.ro; s=20250914; h=from:subject:message-id;
 bh=X1Fos9kKkDy2zbBIakV8ZOCZ9DAxzYNhdLDz5n9bfc8=;
 b=oe/N4QjcY7RjD90vVYaAfx7OOis561uo4+mAZaidGEwmABp72QNciImjaCS4G+mDFyOSXERlo
 MCwY7fXqfuAAEyE43juQm34lCyjnH1AGWI27t2iG4NioxCFnI2S7Bkn
X-Developer-Key: i=alex@chimac.ro; a=ed25519;
 pk=OKD+X09b7uEsyw05zyuqq14SLGg8B/X4xey5tJeYCig=
X-Endpoint-Received: by B4 Relay for alex@chimac.ro/20250914 with
 auth_id=877
X-Original-From: Alexandru Chimac <alex@chimac.ro>
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
Reply-To: alex@chimac.ro
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This patchset adds partial support for clocks (no SHUB, MIF, ISP, VIPX
or MFC) on Exynos9610.

---
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
 drivers/clk/samsung/clk-exynos9610.c               | 3716 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   29 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos9610-cmu.h |  722 ++++
 8 files changed, 4826 insertions(+), 7 deletions(-)
---
base-commit: ce28329fef089fc63dbaadcc4c1fbf9c287e57e0
change-id: 20260715-exynos9610-clocks-a82a4c42f2a3

Best regards,
-- 
Alexandru Chimac <alex@chimac.ro>



