Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F6F3C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=m0OP/im5xDcHi3FNDkksIcdeEADKAG1QDwBDCL5cPiQ=; b=BW60yjnqPud7di
	Aekf4CJRg4uTWdmNYsmLlDhKOQ/XVPU/PioicYaQogNgeM1slt/B7qX0xGhFP+28Yq1bs18kZWQAm
	LzKBsSn5Ojoj8+Wnx96NZCAZlYV7yGzNAaSUHZWxw2YUvGjCxfpogsSGiAwg9BDB7Em2r3vpBvvy/
	+VHXRHS+LKXtYAn425+iIwLbeBIwGFDCmrNeuVD2g5WpVE3AEGORzL+S+9P1/5QW9JwLx5lrUd+gS
	qKb+xgNdAhxZ0x/ulj9N1kEl+zuUi48TURIw2HmZsMYVr1l8EvqbDeVxMWUJwKicNVsLERJxVosgF
	VKZz9mXMH8URVetSfNiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3Qy-0000000GakS-1nlP;
	Mon, 03 Feb 2025 20:52:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3CU-0000000GYHH-2r1p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:37:47 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id E483D25B8F;
	Mon,  3 Feb 2025 21:37:44 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hm_wKjRRSMgf; Mon,  3 Feb 2025 21:37:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615064; bh=UOdlW/B5f7UyeRQyINQBWwmZXqqYBsym7EwJVm9wZFM=;
	h=From:Subject:Date:To:Cc;
	b=Zt8GS/88Cfkl0ztoKt1rcl+Prdo0NIC2Jp8TIYWayM9RqioUrK2cgR3HO7+ucFlXm
	 +GtWsUFxt7BuAnHfYHwihFZivNezu7WvFO43nhjngLyhoUwsR6opY4EnEBskVWbFqV
	 yKq2zRGKJiZKg1vHzRGa2XAGYa45AK93jb2HkQK9G3ujz48r/rdmtpPtDZn0BzB04Q
	 o6jztToSnTaZFGQ29bNhaACQx8uWZWG1nM8CuZSmyMB5YrC8UcCQ/cUEvvvT1jcpmU
	 OKDcg5jhuFSfap+9cC9/kApo0+D0GEubsuj6PPSdL/r4GjN3bYlI5onx0+YNOnI9Kr
	 sMzMvpVyxYz0w==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH 0/5] Introduce support for Exynos7870 clocks and PMU
Date: Tue, 04 Feb 2025 02:07:28 +0530
Message-Id: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAkpoWcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDIwNj3dSKyrz8YnMLcwPdgtxS3eSc/OTsYt0UgyRjYwNLc4PURHMloN6
 CotS0zAqwudGxtbUA8ZNRCWcAAAA=
X-Change-ID: 20250203-exynos7870-pmu-clocks-d0b330970ea7
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor@kernel.org>, Tomasz Figa <tomasz.figa@gmail.com>
Cc: Sergey Lisov <sleirsgoevy@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=1455;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=UOdlW/B5f7UyeRQyINQBWwmZXqqYBsym7EwJVm9wZFM=;
 b=Wd6SgxBY6MpmKjGF60sKQhCVMjPZIXG0ikzab0iWnyaGKGbqvukvR19AEl6Qzg+BoZQyujYlw
 7khlksWWCBCCtohWfL8dTsrqLL1hZRxePuxNeuDMU10hIvLpvWb1Xjd
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123746_854691_8195DB64 
X-CRM114-Status: UNSURE (   9.14  )
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

Add a CMU driver for Exynos7870 devices. It handles the following
clock banks:
 * CMU_MIF
 * CMU_DISPAUD
 * CMU_FSYS
 * CMU_G3D
 * CMU_ISP
 * CMU_MFCMSCL
 * CMU_PERI

It also documents Exynos7870 PMU's compatible, and adds a CLKOUT driver
which depends on the compatible. The CLKOUT driver manages clocks from
PMU_DEBUG.

This patch series is a part of Exynos7870 upstreaming.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Kaustabh Chakraborty (3):
      dt-bindings: clock: document exynos7870 clock driver CMU bindings
      dt-bindings: soc: samsung: exynos-pmu: add exynos7870-pmu compatible
      clk: samsung: add exynos7870 CLKOUT support

Sergey Lisov (2):
      dt-bindings: clock: add clock definitions for exynos7870 CMU
      clk: samsung: add initial exynos7870 clock driver

 .../bindings/clock/samsung,exynos7870-clock.yaml   |  246 +++
 .../bindings/soc/samsung/exynos-pmu.yaml           |    1 +
 drivers/clk/samsung/Makefile                       |    1 +
 drivers/clk/samsung/clk-exynos-clkout.c            |    3 +
 drivers/clk/samsung/clk-exynos7870.c               | 1830 ++++++++++++++++++++
 include/dt-bindings/clock/exynos7870.h             |  324 ++++
 6 files changed, 2405 insertions(+)
---
base-commit: df4b2bbff898227db0c14264ac7edd634e79f755
change-id: 20250203-exynos7870-pmu-clocks-d0b330970ea7

Best regards,
-- 
Kaustabh Chakraborty <kauschluss@disroot.org>


