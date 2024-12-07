Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51FA2E7717B
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  7 Dec 2024 09:28:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fLUB39bwm0qqH9FRJpLW5EFk9tO2bFtPO1Z8TODeM7s=; b=i8CwxWhrNNYaPg
	Jkp7A6jfkX9bHafRYKWDqW0ZrHfjpz668bK6M+9ZQf6Dh4CsVRBtCbYV1pC5pr3RKx96JDnPpPklq
	7eFngUrQXO7nuYZ60bv2M9oRedqFXOdD/6zTCuaSRNia/PibEHvR1FbIlijoiS6LYa8inj2bfG3It
	QvAGPpgFAJQ8OXhkVOnmyMC8WHheMBlQ9imyJydKt6ZUHqqxUpB7xPCqG/R4Rxclv3yXKshRk+dXN
	cKTTouQ7a1/3f33rxgbpqlutLCHBEHAAtZsLjxR8VAh+dX7cPtn1ae8df6v5UsQFSXm0b/FF0rRgz
	ER8m4+BSkfmXPjTaipTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJr7E-00000003mMj-3WOj;
	Sat, 07 Dec 2024 09:28:44 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJr6C-00000003mB7-08QN
	for linux-arm-kernel@lists.infradead.org;
	Sat, 07 Dec 2024 09:27:41 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=kpA3bEpyz0oEBU5XERXpI1f/66ReLFXxxZSr0Lw6I22tRJiAOAi7MCNktGkTbqs8giuw4F/NkYjbCf9fdVQd0QhWOPpGHidex1DrfB81Al/IkJxLq3D0St1jSdBib7Z/vJk+Pop0uIxD2lc3q6Em8aXPnL/JdoJesXU6Y6MFtcB6ZfgjWMSYS2C2el+7MR0fLjMcQ9PFqIibhOGEPLrMivVy90ORpfBBBJBJutUVUs2hWRl9+sVFNhahbI+2kkWS1Kvr7mPO2L6dn5Yssqu6PEv6hwzlTE64Szaysic/yGUkPRBzZrlBPkRJ52xz+qqtHkmkMFwi5JGmMZ+FgB5Sgg==; s=purelymail2; d=purelymail.com; v=1; bh=Ro6MhyKNk1l+AXdNKlQl0/0Lye7Oy37t+emvxlOs2+A=; h=Feedback-ID:Received:From:Subject:Date:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 830824762;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Sat, 07 Dec 2024 09:27:19 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v3 0/3] clk: samsung: Introduce Exynos990 clock support
Date: Sat, 07 Dec 2024 10:25:37 +0100
Message-Id: <20241207-exynos990-cmu-v3-0-20c0f6ea02f0@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJEUVGcC/3XMQQ6CMBCF4auQWVtTK22sK+9hWIwwwCTQmg4SC
 OHuVvYu/5e8bwOhxCRwLzZINLNwDDmupwLqHkNHipvcYLQpL0Y7RcsaonivVT1+lL1hg1Zbh42
 F/Hknank5vGeVu2eZYloPfja/9Z80G6VV6ZxrW43a+9djpDDhMKyCgUbkMHCgJOeYOqj2ff8CE
 ZZ1sLsAAAA=
X-Change-ID: 20241206-exynos990-cmu-58ada5056ad5
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733563563; l=1623;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=Ro6MhyKNk1l+AXdNKlQl0/0Lye7Oy37t+emvxlOs2+A=;
 b=hGpyVIrPLp4ffp2d87s/yShUwtjq5nAmovf1IBQ9e2hrhB/Pk62YPxVYL+M5QwPkFkKES2DGu
 uyfi9fZacYMAEF8aABhLY/RQnVScMqKlt36/jykwOdtutjTxitCWOsU
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241207_012740_139147_E2D470BC 
X-CRM114-Status: UNSURE (   9.55  )
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

Hi all,

This patchset adds support for the Clock Management Unit found in the
Exynos990 SoC. This CMU allows for clocking peripherals such as USB, UFS,
MCT, et cetera.

Currently there are two blocks implemented, CMU_TOP which
generates clocks for other blocks, and CMU_HSI0, which generates clocks
for USB. More blocks will be added (hopefully soon), like HSI1 for UFS.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
Changes in v3:
- Reordered "required:" item in bindings (Ivaylo, thank you!)
- Changed clock-names for the HSI0 block to conform with other Exynos
  platforms clock drivers. (Ivaylo, thank you!)

- Link to v2: https://lore.kernel.org/r/20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org

---
Igor Belwon (3):
      dt-bindings: clock: Add Exynos990 SoC CMU bindings
      clk: samsung: clk-pll: Add support for pll_{0717x, 0718x, 0732x}
      clk: samsung: Introduce Exynos990 clock controller driver

 .../bindings/clock/samsung,exynos990-clock.yaml    |  120 ++
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos990.c                | 1343 ++++++++++++++++++++
 drivers/clk/samsung/clk-pll.c                      |   14 +-
 drivers/clk/samsung/clk-pll.h                      |    3 +
 include/dt-bindings/clock/samsung,exynos990.h      |  236 ++++
 6 files changed, 1715 insertions(+), 2 deletions(-)
---
base-commit: ebe1b11614e079c5e366ce9bd3c8f44ca0fbcc1b
change-id: 20241206-exynos990-cmu-58ada5056ad5

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


