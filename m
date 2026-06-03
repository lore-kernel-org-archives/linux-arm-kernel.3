Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4EC6CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 12:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7Gco6D5tJETaB2LNB3Y3mnVgH2iKMYLhwldY3WY4Qes=; b=oN7Vj8ZO8QCnMEYyU1GUns/uOB
	l49wg24hMZrQFt3AcKn3DVAJzvKaVK/OX55s2IYzQzeK/7D0UIpDOf/gY1KUwVXlVvHchxB+uFjQb
	SaeQZPuvZYXPtLt4uRuD6OlPcSWHXK5BuKLnln6mHyeMc+9NHwWcDhZlUkrzWhwdTQ7Q6XRImmuPq
	C6jvlZodOFM/NOFr0jsh+ZJrtu5kOwSAh0apIR1tKsG0nwIaWeClE8geJGy+Lbe1n9tSYdyAkuktY
	ednIBvLt1V5+EmIS+nvVsuQQi/C0v0XXcjq7LMZJEl2/NvgtQat94OzLH0TLBVua5ChxOEuHLAXXt
	kuCub97g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkKO-0000000F1RV-2xkm;
	Wed, 03 Jun 2026 12:04:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUkKL-0000000F1Q9-29XQ;
	Wed, 03 Jun 2026 12:04:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 36BB24038F;
	Wed,  3 Jun 2026 12:04:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0E2D7C2BCC4;
	Wed,  3 Jun 2026 12:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1780488244;
	bh=JkDzMQd2L4L6r0Yr9fg6b/1lXleiCN8jZ/P5N4eWY4I=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=odbLhLXlpLtSuhUtJ9DKV+ldHHwJAbutDD0pK4WJTlMzx/LY5wEKpGSmXrg1qrlVc
	 8MIXLRgimKC62P2XdV/VbHhavnQUpBJdvLQsH7xZ1f/cDoiBQmPRrkOZROPh+LwzuP
	 T0d/PjVk8ZT16iiNlzYmwgVZ4ISKvufWHVaDwwD4aDbdUQJPwgy2fjqToxgqPU/BIK
	 BMPUE4jZvopaTLo2F3nOOo/3AIfuX29yjpE31utnsFtHMC/fB6NHS7KDaEEoft1BN4
	 bUM4L4+tIzYMU151B8SB4wig4MYS6DM0AUAhuIixXa/3qeKQm6EsjpWKUlc8Ft+/T3
	 bxJg4DA1j4eSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2821CD6E56;
	Wed,  3 Jun 2026 12:04:03 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v2 0/2] clk: amlogic: Add A9 peripherals clock controller
Date: Wed, 03 Jun 2026 20:03:55 +0800
Message-Id: <20260603-a9_peripherals-v2-0-ee1b8c0a1e6c@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACsYIGoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIzMDMwNj3UTL+AKgloKM1KLEnGJdEyNDk1RzS3MD05RkJaCmgqLUtMwKsIH
 RsbW1AFtuaQ9gAAAA
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
 linux-arm-kernel@lists.infradead.org, Jian Hu <jian.hu@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780488242; l=1319;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=JkDzMQd2L4L6r0Yr9fg6b/1lXleiCN8jZ/P5N4eWY4I=;
 b=2JsWtytZuobV0Qw7gQcvTiZipvvm8BxQ3CILqhIjANBz/nZlWHk/xmAvem9fl9NgLWkkR6afE
 2kBATLbGq//C7SIfDiCVJ8u+nqhQSKOYN8Ft7jW7WhUXbJFOFsHccgg
X-Developer-Key: i=jian.hu@amlogic.com; a=ed25519;
 pk=zHUE+rNtH9z+Sb8au1/elWknjFQmy5QDVkBoxleuOIA=
X-Endpoint-Received: by B4 Relay for jian.hu@amlogic.com/20260415 with
 auth_id=735
X-Original-From: Jian Hu <jian.hu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_050405_626995_F81CB6F6 
X-CRM114-Status: UNSURE (   8.17  )
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
Reply-To: jian.hu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

This series adds Amlogic A9 peripherals clock support,
including dt-binding and peripherals clock driver.

Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
Changes in v2:
- Split the A9 clock driver and send the peripherals clock separately.
- Add COMPILE_TEST in Kconfig
- Drop the 'optional'
- Rename apb4 to soc
- Sort the header file
- Rename hifi to hifi0
- Use CLK_HW_INIT_PARENTS_DATA to describe clk_init_data
- Use CLK_HW_INIT_HW to describe clk_init_data
- Use CLK_HW_INIT_PARENTS_HW to describe clk_init_data
- Link to v1: https://lore.kernel.org/all/20260511-b4-a9_clk-v1-0-41cb4071b7c9@amlogic.com/

---
Jian Hu (2):
      dt-bindings: clock: Add Amlogic A9 peripherals clock controller
      clk: amlogic: Add A9 peripherals clock controller driver

 .../clock/amlogic,a9-peripherals-clkc.yaml         |  160 ++
 drivers/clk/meson/Kconfig                          |   15 +
 drivers/clk/meson/Makefile                         |    1 +
 drivers/clk/meson/a9-peripherals.c                 | 1927 ++++++++++++++++++++
 .../clock/amlogic,a9-peripherals-clkc.h            |  352 ++++
 5 files changed, 2455 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_peripherals-4214e79705dc

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



