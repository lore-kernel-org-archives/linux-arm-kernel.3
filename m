Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2683DCD8CB2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 08:23:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6cWpHAvbdKWc8Y/KbVnf01PjoIkkWpoGpwXgQEaYuN4=; b=jHUHf/cZvaeQwQev56zKMsPDVJ
	0hvLI/JcbJiI9mSA7L0Y/sp2FDY9tE7PHieb1njAQAWbKFdUpX4eWVwOFuMUvCRBTymQZum/zsV7M
	dyA639a5FIt3ydL4sfV4IHlMa947AS6sdi8qt9YtssvxYYq72IsR2IplK7XbJCQBbImJDu0m5ZU1y
	Iez/jAtKa85CfuZlPOPlWu1hGMu3gVthXsMPfoOo9fPvz7wk2jUjNbLplhTiIlTPyZRv8ccp42Vwo
	opagM9M1KYsWseGBhWfVWHBIXYZCyEEP7BP0G7T8OJUSQx2nCggp0NH2z21uhttIJRBXHxWhe0DJD
	Uz2/q3xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEE3-0000000740Q-3g5I;
	Wed, 10 Jun 2026 08:23:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXEE2-000000073zm-2s88;
	Wed, 10 Jun 2026 08:23:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 708B340AC6;
	Wed, 10 Jun 2026 08:23:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 48432C2BCB9;
	Wed, 10 Jun 2026 08:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781079830;
	bh=Zgoan1qkve3jFX7ew5iB3DDfZ6cSZUSi+kxWrLmfLWg=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=foIe/pQp7IF40BftiSXd3+CBRsq3BtS0bTv4e9TvKdrBRj4vMMbRmFAx1ScmtNfIV
	 kSLyt59QvlbVL4UnORoRAy6sTFUdUzKIgIjZOctulV1X9caIBjOPHFkJpeZhBvxWoJ
	 +03CkypzxCvH4dG858X+BzCH+1LmwGEYuehFsApWlk5m6X92NG1WPa3Co5cBQWM9c0
	 tVmez9i5j6XzyNAwmSjFtXJ23z0n9hjMLqG1SW/t5BXPr6LNGv6knekYaVhURc0/zG
	 9orT2Rho2f6XTKbg6L3Vg8HnlB9JchMRbgkLkpmvJVUXl0gzfnmY9/vVCcopPw819q
	 pficTvXn6tpQw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E640CD8CB2;
	Wed, 10 Jun 2026 08:23:50 +0000 (UTC)
From: Jian Hu via B4 Relay <devnull+jian.hu.amlogic.com@kernel.org>
Subject: [PATCH v3 0/2] clk: amlogic: Add A9 AO clock controller
Date: Wed, 10 Jun 2026 16:23:46 +0800
Message-Id: <20260610-a9_aoclk-v3-0-b7592d6c31e2@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABIfKWoC/23MQQ7CIBCF4as0sxZDQam68h6mMQMd2oltMWAaT
 cPdxa5d/i8v3wqJIlOCS7VCpIUTh7mE3lXgBpx7EtyVBiWVkUZqgec7Bjc+hLX+qGuLnTMayv0
 ZyfN7o25t6YHTK8TPJi/qt/5BFiWk8IeG0NSGqDldcRpDz27vwgRtzvkLXc7uXqIAAAA=
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781079828; l=1538;
 i=jian.hu@amlogic.com; s=20260415; h=from:subject:message-id;
 bh=Zgoan1qkve3jFX7ew5iB3DDfZ6cSZUSi+kxWrLmfLWg=;
 b=CLkLsMQLmlqwr6kDr8q7H1tb3ZOnINqYZhuW13gL8m2ym+RDe4VzCIJBGhvdfJ3/MG1WPYHHh
 p20GYSQZEtBBCZsG+W52kgdH0fgI2ci3/o5GUqb8k4pMrXm1vgATIYp
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
 drivers/clk/meson/a9-aoclk.c                       | 431 +++++++++++++++++++++
 include/dt-bindings/clock/amlogic,a9-aoclkc.h      |  76 ++++
 5 files changed, 597 insertions(+)
---
base-commit: ca89c88bcf69daca829044c638a8163d5ce47af0
change-id: 20260603-a9_aoclk-bbf531badc63

Best regards,
-- 
Jian Hu <jian.hu@amlogic.com>



