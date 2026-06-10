Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68147CD98CB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9XFFazFliTSNEPJBfPuLuY7+E86yhsoYXPXNZoRR1Hg=; b=4hGlCtiQ6xT/OEChmwS7je3+Zd
	o0DRzgsc45kxbi2lstg8JI2DxiX8ErSvxaENOktSMihQE9Qk09qOyGUr54jxD0TwlzREsRGLSnsYA
	ynsGDOcquFgWd+HQlwIhmWXC6A3x19kDPasePh9PpIUelktl7Cj4aOsCAYJq26g4+ionjL5QLCyup
	Sh0anLFwFsWRmyeg6UiAAEHDkE/3Lza/h6HmDcDuFpmIlpiTVKe7TkVhfbRkfV+2VZt6gp0UGqIsl
	XiYIhb1UVNC3GCcQ3F9F+3d51fK8ol3feO4MgH2L/FKmrLFR5eHnBSWgFuj1Hv/6Pb070MVXPz6yl
	51uOxEGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE5Z-000000072df-1JfV;
	Wed, 10 Jun 2026 08:15:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXE5Y-000000072d0-1Xm2;
	Wed, 10 Jun 2026 08:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1BBD5444FF;
	Wed, 10 Jun 2026 08:15:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id DF82DC2BCB8;
	Wed, 10 Jun 2026 08:15:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781079304;
	bh=zbqOoMcHfvoA4jobdCXSeR8psyrC1HWfG49UiZtEOgA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=WVliarnE9qzYCC5JSsOceME++GeR8LENSyaCnSDfMnUnwUKpygzbfZgmVlBtWILmg
	 1xg/9Pp9ehc3lmZhImYZgsCQ34lLzZpm0QHxIc7wr4V3m1dMkCVesWHJ9dQx+uJBo2
	 kFT9Ng8KJX/K3/rbeuz4jmBCEKzBgsVGIgCOCnA7qR0peQQ/ikySfImOYEy1/h5has
	 Y+UyZcIXB6Rnm9pn4hkxxxpPI2ZJVH2vWZJykbtcPUVtejKOOqm+zuWOaT4Do8jbHk
	 p/RmZ1r8vQdG+XyWyFwgtYjkNiDRwndzwgCFCyteWiGC3fsBrMl+z5bYr/CdN6zn56
	 iXLHmW4VVAn2A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2780CD8CB9;
	Wed, 10 Jun 2026 08:15:03 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Wed, 10 Jun 2026 16:14:53 +0800
Message-Id: <20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAP0cKWoC/3WMQQrCMBAAv1L2bCRJa2o9+Q8pErdrs9A2IZGgl
 P7d2LvHGZhZIVFkSnCpVoiUObFfCtSHCtDZZSTBQ2HQUhtpZC1sdw8lCY6inZJotGqo7Vp5GhB
 KFCI9+b0Pb31hx+nl42f/Z/2zf1dZCymI1OOM0ioyeLXz5EfGI/oZ+m3bvrwlE0OuAAAA
X-Change-ID: 20260603-a9_peripherals-4214e79705dc
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Xianwei Zhao <xianwei.zhao@amlogic.com>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781079301; l=1973;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=zbqOoMcHfvoA4jobdCXSeR8psyrC1HWfG49UiZtEOgA=;
 b=XTRwIOdCoz0uS9hAn0/t60goTMKKStNMxXoYQUSRMnTL988Q1uD5xZ55OUpuyolRIeRSJ5z4e
 Ubj6G/gAPYxAPyIXmYmNZgNZ5zH/KFEPZsoQjwrTzmNsKo5OTaB4j+h
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds Amlogic A9 peripherals clock support,
including dt-binding and peripherals clock driver.

Note that this driver depends on the A9 PLL driver, which is not yet
upstream. The Meson PLL framework is currently undergoing refactoring,
and the A9 PLL driver will be submitted as a follow-up series after
that work has been completed.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v3:
- Add "depend on A9 pll" instructions in the cover-letter.
- Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
- Fix usb_48m_pre_sel's parent reported by sashiko-bot.
- Fix gen_div width reported by sashiko-bot.
- Fix hdmitx1_pixel's parent reported by sashiko-bot.
- Link to v2: https://lore.kernel.org/r/20260603-a9_peripherals-v2-0-ee1b8c0a1e6c@amlogic.com

Changes in v2:
- Split the A9 clock driver and send the peripherals clock separately.
- Add COMPILE_TEST in Kconfig.
- Drop the 'optional'.
- Rename apb4 to soc.
- Sort the header file.
- Rename hifi to hifi0.
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
- Use CLK_HW_INIT_HW to describe clk_init_data.
- Use CLK_HW_INIT_PARENTS_HW to describe clk_init_data.
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

 .../clock/amlogic,a9-peripherals-clkc.yaml         |  160 ++
 drivers/clk/meson/Kconfig                          |   15 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/a9-peripherals.c                 | 1925 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 ++++
 5 files changed, 2453 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



