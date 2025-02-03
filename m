Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2965C02193
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 20:59:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aUJcd7I38heggXEJkasSpkVFtCQp8NrCY3kgSxyMWNM=; b=gZ49n0QACaxtTktSmVSXu6V53c
	exDqnH9Pri6C2LgWrlourr2aNH8D4ylPfQkNnmEjeNRN1eomGDDO9D9olWqse2qmdu8T+r7Hy57Nq
	kAh8iqnS14UIBT64u2QLe4L8tyHTfxRN3TkSUid1DRWCrN4bIXMExJx/FmH3V0fYWCMe+FL7X3JcS
	R+NAZBur8GI8wUyVVl12YCLp/+9vwg5kC+gdmsiPofRrzQEx0f8/3Z7BZlUEG/Gk0rlAnDeBBHkUL
	WjY03qUGM/e0h3jQOZOrBVXUEpXTLjeEagkiDZNzxe/y1CTJyKP5dssgTJokDW5TV4vcXdtWsJdU7
	pdvkw6qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3XN-0000000GbGN-3GVL;
	Mon, 03 Feb 2025 20:59:21 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tf3DI-0000000GYRZ-4AkN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 20:38:38 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 072FC25BAE;
	Mon,  3 Feb 2025 21:38:35 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aSRCLVZYH8JC; Mon,  3 Feb 2025 21:38:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1738615114; bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=H5QU1+b/tjAtTbo+RrauiaOIV4b9XflTzv/+CN0wgHDuvfDcPJQiljknbswgyRCXp
	 Q3q8SkHVJA0ycTpXrRRl8n0qLSEYjCcOnGkL18xXzEasjf+LC5ZuEowCaVd2y7+CVh
	 vAMh8YLe4kwb6SlY1wGhiTgJiOAlQdEw/5RiBBqZZU79e2qjeacZMnHmCmuII/QVbP
	 VKOh3thlUQCmvtZIDfGDy5repPgAVKy7LtMlyAKhBzVV51OuT6TccFcE1B1Fpf5IAp
	 X+YC5hxcLKIGlbAuI+mwzPGN0EyF4qyWgKQ6apuVgKklSZJw1lergBlodd37AMn5AO
	 mGgZrE0A6OYKg==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Tue, 04 Feb 2025 02:07:33 +0530
Subject: [PATCH 5/5] clk: samsung: add exynos7870 CLKOUT support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-exynos7870-pmu-clocks-v1-5-a3030ae5bb53@disroot.org>
References: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
In-Reply-To: <20250204-exynos7870-pmu-clocks-v1-0-a3030ae5bb53@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738615054; l=841;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=lAxk04RlD+P8Ozzai5gybNotO8RPm2IxU0A+S7knrzg=;
 b=ewtZ+O/aop7T+/sUN2yesRNovWh0Zxea8fWsw49izRwtFbjGMLlSax4wGDt8yN0mPjO2vfRjs
 9Edh/+2JkmPCILpMppxoVjmjJUQHF1jkQxT7swteg9tII9hsOS5MWtk
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_123837_166609_903F28C7 
X-CRM114-Status: GOOD (  10.76  )
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

Exynos7870's CLKOUT registers are the same as Exynos5's. Add the PMU
compatible to the existing CLKOUT ID list.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
 drivers/clk/samsung/clk-exynos-clkout.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/clk/samsung/clk-exynos-clkout.c b/drivers/clk/samsung/clk-exynos-clkout.c
index 2ef5748c139b37ca5429b9071ee0e06f44fcf28e..9a31b1c311b45096f1d680b6724571854c08725c 100644
--- a/drivers/clk/samsung/clk-exynos-clkout.c
+++ b/drivers/clk/samsung/clk-exynos-clkout.c
@@ -75,6 +75,9 @@ static const struct of_device_id exynos_clkout_ids[] = {
 	}, {
 		.compatible = "samsung,exynos5433-pmu",
 		.data = &exynos_clkout_exynos5,
+	}, {
+		.compatible = "samsung,exynos7870-pmu",
+		.data = &exynos_clkout_exynos5,
 	}, { }
 };
 

-- 
2.48.1


