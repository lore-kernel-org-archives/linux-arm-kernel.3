Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BB2AC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 02:37:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YYTCxj9qJPgek61hT+KOwTgMNeinrJ0W9pgixD9Zykc=; b=P6nZQTDfszmnaVMQzsm1BPaXR4
	8ZZTdPzMJ7OBqnLnw9SJkwGNRVXxnSGw2XuygAqtQZ+O4ZmOIHJegb5D5ZoxJxOXkiRSZcmUgeRyF
	eSV0KkAAwi8GNYtCwRHhj0dMRUVqi40cRzWzG8CisUpgBDSsvzzk1KIVKt43UTdkYpdqClKf6t0Hq
	XAkJMCv1SVO8HTnXHPEJ8k9uoOA5aDlbTyJ52wMWI8JUo/hHhcs0tUiLm1bCeV4p4CQNJGKpglu1f
	RB/ycrw0hwBiM5Haeg35hL6fss8a0E5o9b5chPwtMnHOUw5N3Ur8G8269ft2OrMfnTrJ4hPNnhBbJ
	NokmWfQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weOLH-0000000FiS9-0cRq;
	Tue, 30 Jun 2026 02:36:55 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weOLF-0000000FiRc-2HBE;
	Tue, 30 Jun 2026 02:36:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A43E060008;
	Tue, 30 Jun 2026 02:36:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 4B9B9C19425;
	Tue, 30 Jun 2026 02:36:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782787012;
	bh=zKhPqDASnTI0/BJz6iMX5RR+f5ilxmRBxE8PYsuk2Js=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ml7Kem8CcP2yo2ycdlzBrFSXqZvUr/3+ZCRrAsCgO3b2rg189V5s0g71f6GcmMXl+
	 ZlIkDhLXlAhAPMdCeycd/mHWjvPErx4VLaiUL+QTSyh6Wj8T3nBcSxMwUSJ1PTPUHg
	 /8ZM4BuRwUCKsKGCNJ8geqF6VZ+IkTM/twdXGDH2QR0hmV4Qh7l7u6piech6g3s0ML
	 zB2PZHrEbQSCrBIFVolIq64uBIWqBLzBlonTvSMAdKvGwKe0hBwTw9rxEKvsliMnnx
	 wYWJK52U2u9iKqBA/ZXBSLATMHGW8aA/wBHMMRshWot9viQcqmv2Vtf85wRw11J701
	 YPLI9p9E4k5nQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32336C43458;
	Tue, 30 Jun 2026 02:36:52 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v5 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Tue, 30 Jun 2026 10:36:47 +0800
Message-Id: <20260630-a9_peripherals-v5-0-bc4019730354@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL8rQ2oC/3XP0QqDIBTG8VcJr+c4mmXtau8xxnB6KqEydMhG9
 O6zrhqxy/+B7wdnJgG9xUAu2Uw8RhusG1MUp4zoTo0tUmtSEw68hBJyqurHlCZTh171gQrOBMp
 aQmE0SaPJY2PfG3i7p+5seDn/2fzI1+tfKnIKFJE9Kw2KYamvauhda/VZu4GsWMx3AIMDkCfAg
 FSygqpoJDsCYg9UB0AkoEHGwaBIb8lfYFmWL4HrEfswAQAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782787009; l=2655;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=zKhPqDASnTI0/BJz6iMX5RR+f5ilxmRBxE8PYsuk2Js=;
 b=XtN/aCd/urNFmmo7mfVr+3xALfNzvK2Gm1IYfdwvK3tcJeOrWxbPLk/eQ0gF4Sd0DuxhVVkE1
 2xmMundgxahBEW2P7rImFlTOX8dodGYINd+5q1IjjpJTeIT6GNkqw6s
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
Changes in v5:
- Include <linux/module.h>.
- Add missing '0' suffixes to some clocks.
- Fix typo: "encorder1" -> "encoder1".
- Fix the parent clock for a9_hdmitx1_pixel.
- Link to v4: https://lore.kernel.org/r/20260618-a9_peripherals-v4-0-fe120de44e77@amlogic.com

Changes in v4:
- Expose channel 3 for gen_clk.
- Add missing '0' suffixes to somes.
- Use helper macro for vclk clocks definitions.
- Drop forward declaration.
- Drop CLK_HW_INIT* and revert to explicit clock declarations.
- Fix can clock channel number comment.
- Rename enc clocks to encoder0/encoder1.
- Link to v3: https://lore.kernel.org/r/20260610-a9_peripherals-v3-0-d07a78085f71@amlogic.com

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

 .../clock/amlogic,a9-peripherals-clkc.yaml         |  164 ++
 drivers/clk/meson/Kconfig                          |   15 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/a9-peripherals.c                 | 2095 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  351 ++++
 5 files changed, 2626 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



