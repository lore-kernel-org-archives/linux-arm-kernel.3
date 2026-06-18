Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2590CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 09:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=J7loy4oJZrVcAl0ueTjUqecmfUXmsIWHQZh/olYXMIo=; b=UHSSUQvvKbuoZfVII+Eox5fj2A
	px4oONX4RhM5KmRVX3ZTFMrhnjuA6W+mE5i7PPMo0m9CBcrVuCSrDC1BdDSI+7RPZKzotuFddC9FP
	7BDhGrYmW79BDFE0Fm1S618BbDZ17oGLX6ov8tmwYztv7CZ5k/1x3TH4Y6UlM1hLy9AEcLATrOQRg
	dMWlxXNpT2C51H3EJa6M/EbFLB7TmSeC8toiMeV6bTij/DIMQeqMQ/SGln8HfsSFVrvkRRVM6kMYX
	OyoPjzKVnbhf8TU0Ms0AF5/uMVNn89UM8IbxYfAdPm0pO3j3GKcPVCU15PC9XW5TR0YQnp+I4PLph
	wl4G08pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9NE-000000010Ve-2879;
	Thu, 18 Jun 2026 09:49:24 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa9N7-000000010Rs-0eIy;
	Thu, 18 Jun 2026 09:49:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2E445601FD;
	Thu, 18 Jun 2026 09:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C9C9BC2BCF5;
	Thu, 18 Jun 2026 09:49:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781776155;
	bh=NuY8O2IqRQE61M1abMdjWGK6rCEZPWKvjWWEW9TDJ2o=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=I9ZPR8fhsijqnMJJvIPbZqm/l5civFLkDi2s2LTsmIsmMaGgsIbRGU0rW4r8PQAhp
	 DG46qBavGm2INrre9RUyhO6hXpiUi0t69fVDm+vlr9DqbhWgERpRq0XrHNaNOgOUw6
	 ag89rN6+GMWG5XorO/dslzqOfNli7uATesqHP8mDUdmLGhqoW4EKWwVt0qi79/IEz9
	 PhyQnyzuEXunp24Un9VD2czlFmEgR9u1IoezQYEOgmaik2mgxtNQMLnqExmRDnwit2
	 M3lBgE/vPsBMgcVKzNpWyYRkZvb/ToEOL/Pp6MqH5/knd556gWm2bbU771ascKtMai
	 VIcbEsrVqKadw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8D8ECD98F5;
	Thu, 18 Jun 2026 09:49:15 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v4 0/2] clk: amlogic: Add A9 AO clock controller
Date: Thu, 18 Jun 2026 17:49:10 +0800
Message-Id: <20260618-a9_aoclk-v4-0-569d0425e50c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABa/M2oC/22Myw6CMBQFf4V0bU0fUMSV/2GMacsFbgRqWtNoS
 P/dwgoTl3NyZhYSwCMEci4W4iFiQDdnKA8FsYOee6DYZiaCCcUUk1Q3d+3s+KDGdJXkRrdWSZL
 vTw8dvrfU9ZZ5wPBy/rOVo1jXP5EoKKNdWYNWXAHUp4ueRtejPVo3kTUT5U7lbKfKrJq6akSrr
 OQgftWU0hc/244P3QAAAA==
X-Change-ID: 20260603-a9_aoclk-bbf531badc63
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781776153; l=1755;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=NuY8O2IqRQE61M1abMdjWGK6rCEZPWKvjWWEW9TDJ2o=;
 b=Bfb8JABqNzm9/UBrYWasHh19P9TmDIDa+q7JuflrTMmikeS4rtp77FgEmXhDeGm4AkNL2Ff5H
 suqKcTN6TjDDr4uZUZXlvhi+dsBaBA4UrsGhEP7FuKxDdFh2ArEn+WE
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

This series adds Amlogic A9 AO clock support, including dt-binding and AO clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v4:
- Drop CLK_IS_CRITICAL for ao_xtal_in clock.
- Drop CLK_HW_INIT* and revert to explicit clock declarations.
- Link to v3: https://lore.kernel.org/r/20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com

Changes in v3:
- Move COMPILE_TEST after 'depends on ARM64' reported by sashiko-bot.
- Rename i2c3 to i3c reported by sashiko-bot.
- Reword the comment describing ao_xtal_in's flags.
- Use struct clk_init_data to describe ao_xtal_in's hw.init.
- Link to v2: https://lore.kernel.org/r/20260603-a9_aoclk-v2-0-f47ea616ee78@amlogic.com

Changes in v2:
- Split the A9 clock driver and send the AO clock separately.
- Rename aobus to soc.
- Use CLK_HW_INIT_FW_NAME to describe clk_init_data.
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data.
- Use a9_ao prefix for MESON_COMP_SEL.
- Correct duandiv name.
- Fix pwm b reg.
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 AO clock controller
      clk: amlogic: Add A9 AO clock controller driver

 .../bindings/clock/amlogic,a9-aoclkc.yaml          |  76 ++++
 drivers/clk/meson/Kconfig                          |  13 +
 drivers/clk/meson/Makefile                         |   1 +
 drivers/clk/meson/a9-aoclk.c                       | 488 +++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
 5 files changed, 654 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_aoclk-bbf531badc63

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



