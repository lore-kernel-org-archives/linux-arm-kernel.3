Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 123ADCA0EE8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 14 Sep 2025 21:19:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:From:To:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=sJdatwuItQDKsBxIYrlY3ZlspqT7UZOXCVPAjQosROw=; b=btd2+JGY+1KPMD+RVPpu7IkzkJ
	xGuTtJwZHHDHLa/m5fD0sEIltkKUIsOFdi2xdFmHc7SBXxHL4lRxCKZLAXCs342xS4KK/8P+D344+
	vKYXBhxAwiYIMQEDX4guP/3EuFGHjUdH6l7JDVIpe2LzHG20pYbY55vZ69x14E+xeo8Z+Ryxi9ktF
	mVDFd7G1W/xuUnW2S03pM6Z8z2PYpdKsYNb4l3dBv8eUe3K46MyTatSWx8XS1XwAsqwIL1dxjiBqZ
	sEbIEViQnabcP94j+TxuPh/c9UDOmTWna5JvNSxNCwH7D+MM6Rn9iNgvVyyoUcvdFupBOXvyulqvt
	h2/Z2wPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu83-00000002EGv-28yC;
	Sun, 14 Sep 2025 21:19:23 +0000
Received: from mail-4317.protonmail.ch ([185.70.43.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uxu80-00000002EGX-2IYs
	for linux-arm-kernel@lists.infradead.org;
	Sun, 14 Sep 2025 21:19:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chimac.ro;
	s=protonmail; t=1757884755; x=1758143955;
	bh=sJdatwuItQDKsBxIYrlY3ZlspqT7UZOXCVPAjQosROw=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=pjRdCZxZYjv593LAaJYmmeAdRJYgbg4+m8zmgYUrZnk1HfnCX+zVZy5r516/ukeR5
	 HRyNQ1XTojQVzmtmxIbFZMEJz8hjyyPZ8SK/oy/caVDpGBqSliy0EBZWXTJb7WDdVc
	 /X6uGiLa7wje4dhrAZviuEebtrh3msO7WlgQp5NGRwOABM25CMAF72dqzsCbA2+gaS
	 bqZXHsKzBvJJIELK0BrD3O1bhVhcF4R/Dz5qgYZgSHuBGAQRxxjlo9mXEH/eu9NbtT
	 FccXs+6ZT4t3gZtcrC8uiZahoL74B62FTNss2rbvzkB4WAIeAJ21QwPsvlejEH8NsF
	 WMGN9I9MW5sKw==
Date: Sun, 14 Sep 2025 21:19:10 +0000
To: Krzysztof Kozlowski <krzk@kernel.org>, Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Alexandru Chimac <alexchimac@protonmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>
From: Alexandru Chimac <alex@chimac.ro>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Alexandru Chimac <alex@chimac.ro>
Subject: [PATCH 0/8] clk: samsung: Introduce support for Exynos9610 clocks.
Message-ID: <20250915-exynos9610-clocks-v1-0-3f615022b178@chimac.ro>
Feedback-ID: 139133584:user:proton
X-Pm-Message-ID: 7100008c38a354ce31d7f13b8a0b76ba06752ed9
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250914_141921_198838_608381BD 
X-CRM114-Status: UNSURE (   6.66  )
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

This patchset adds partial support for clocks (no SHUB, USB, MIF0/1, ISP,=
=20
VIPX1/2, MFC) on Exynos9610.

Signed-off-by: Alexandru Chimac <alex@chimac.ro>
---
Alexandru Chimac (8):
      dt-bindings: clock: samsung: Add Exynos9610 CMU bindings
      clk: samsung: clk-pll: Add support for pll_1061x
      clk: samsung: Introduce Exynos9610 clock controller driver
      arm64: dts: exynos9610: Enable clock support
      dt-bindings: soc: exynos-sysreg: Add Exynos9610 SYSREG bindings
      arm64: dts: exynos9610: Add SYSREG nodes
      arm64: dts: exynos9610: Assign clocks to existing nodes
      arm64: dts: exynos9610-gta4xl: Assign clocks to existing nodes

 .../bindings/clock/samsung,exynos9610-clock.yaml   |  344 ++
 .../soc/samsung/samsung,exynos-sysreg.yaml         |   20 +
 arch/arm64/boot/dts/exynos/exynos9610-gta4xl.dts   |    2 +
 arch/arm64/boot/dts/exynos/exynos9610.dtsi         |  277 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos9610.c               | 3652 ++++++++++++++++=
++++
 drivers/clk/samsung/clk-pll.c                      |   29 +-
 drivers/clk/samsung/clk-pll.h                      |    1 +
 include/dt-bindings/clock/samsung,exynos9610.h     |  720 ++++
 9 files changed, 5039 insertions(+), 7 deletions(-)
---
base-commit: 48c4c0b684f394721b7db809e1cc282fccdb33da
change-id: 20250914-exynos9610-clocks-2fba704e6030
prerequisite-message-id: <20250914-exynos9610-devicetree-v1-0-2000fc3bbe0b@=
chimac.ro>
prerequisite-patch-id: fb1e2f83c03a3b3a330c72d5d9c9fd8cd95ef2ce
prerequisite-patch-id: b42a7c0c72b1bfe33bb65fb911bf28e3e101fa55
prerequisite-patch-id: 4c5c21cf62e50db603fe4e2df17ee664ff0b243e
prerequisite-message-id: <20250914-exynos9610-pinctrl-v1-0-90eda0c8fa03@chi=
mac.ro>
prerequisite-patch-id: 27e949ada132a43ba3dbf880af3e6168ec94eaf9
prerequisite-patch-id: f446d396d0258709db47aef69e68821eb72582dc
prerequisite-patch-id: e3bf016be9509ee79beb3d51907ef6cd58fb98b1

Best regards,
--=20
Alexandru Chimac <alex@chimac.ro>



