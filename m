Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B69E77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 16:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ouW2LPH6PauQZg2DUk39u2DRzqSm/NCoRJSKfMXgry8=; b=0xntVnZGTSAwRI
	M1WtAtTnNxwCokVC5/H4xLORPYf5GT2KB6gb79j/iKhW4nqo2MMoSIfvQm8v+haXkeEgQv481+ijI
	orlAFtB7Uq1dKYm5RDG61BJ8lp6PJprBz7JH3+wrM7ykK3zAmd8N6wjhuPoOeK35qrICw3ns7XTYk
	NjqiCSA5aJGRianelCPTJ4ALpbCJ5Qe8tll1Hobw+nAz5PmNOoNXhTv99r3ZlNJbhuqwbrull2gQ7
	srrfaHBJKcgb7PZcF0q6OCOXQOnDv50Ajj4+xnyFvd3uSHQVfJQYTI86mNPt1ygJiT7KcAYy5+xZ9
	FEHyU7PpV02ulLNwIH9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJayy-000000027GP-3VYh;
	Fri, 06 Dec 2024 16:15:08 +0000
Received: from out-02.smtp.spacemail.com ([63.250.43.87])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJaxp-000000026qR-2WkS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 16:13:59 +0000
Received: from prod-lbout-phx.jellyfish.systems (unknown [198.177.122.3])
	by smtp.spacemail.com (Postfix) with ESMTPA id 4Y4bsr4hzpz4wRg;
	Fri, 06 Dec 2024 16:13:52 +0000 (UTC)
Received: from [127.0.1.1] (83.21.102.241.ipv4.supernova.orange.pl [83.21.102.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail.spacemail.com (Postfix) with ESMTPSA id 4Y4bsh4khYz2x99;
	Fri,  6 Dec 2024 16:13:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=mentallysanemainliners.org; s=spacemail; t=1733501627;
	bh=C8ZUvyDK/liK+O5PSjiupnuJWNIGEJ028E5VI/EvwKI=;
	h=From:Subject:Date:To:Cc:From;
	b=clMCC+Y+efcXfWO23YnMIGTg/lvJB9blKRbyCZDOq6MEpVSv8sdveXU2MU6RX4xrM
	 yl9Bc5THfSZE/Ppa2qoMMO9QVj25rRoMw1GT4KLrpAEOzmCoEq0TWLak33Io9mr9r7
	 1whf1EAojBTx4+xoAjfeQI6Xdeb8GCii9b3t8liK3uNitorW9Ww4RG2ykNuCY4Hs+y
	 sKmchK/DgFyRXUDo9kTwdgxH7NXnIVk+zdfAGLTP88+WVGhv/IO6C/X3mPYIR5EKYy
	 kk4G9pBnQvU/wDNeAuAOHLsSfR4O2XZNhFSHML5ua/HcY12w0ZcSZN3y3tPmxXAuea
	 wHj0eEWevO81g==
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Subject: [PATCH v2 0/3] clk: samsung: Introduce Exynos990 clock support
Date: Fri, 06 Dec 2024 17:12:17 +0100
Message-Id: <20241206-exynos990-cmu-v2-0-4666ff0a099b@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGEiU2cC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDIwMz3dSKyrz8YktLA93k3FJdU4vElERTA1OzxBRTJaCegqLUtMwKsHn
 RsbW1AGylCihfAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733501552; l=1306;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=C8ZUvyDK/liK+O5PSjiupnuJWNIGEJ028E5VI/EvwKI=;
 b=XJ05RlLwlH1Hp9sM1jYNxcMvMmBVTe36X4bmaOuUeArZSJK1Jk5wAk46F0i8DqhlW7y1Ar9to
 Qx8oWcNT9ieDKhbzXF3L5xeHxtfPUPTZkH9QCsYM3N4IEwR0opuY3qS
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_081357_732799_605098B9 
X-CRM114-Status: UNSURE (   9.87  )
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


