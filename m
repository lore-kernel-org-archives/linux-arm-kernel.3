Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23980CCF9F9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AbxFxIfNMcDLUxon0XuK+pqcgnxdOxgnC+pxMrOK0U=; b=rjDXW3ISMyf4kUpLNZERdF/llj
	4jrYABs4QQ6MjuCMbqt4jjfWxx7VOO8puIqgR9gAwTxX1VKuHCDisdwtwvLfbWQojMZEpCq2XRzpp
	ZySwqlf+v4s0UrmUxrh8u45ILpGtu8xH4Hlco/txkE5+bCGZ4nD3I+c+V1WPiIP5gCVTJvKqjCuFQ
	2M56rEw4Qve8SSdJnyeiaUcPGp2LE+fRecVNKVnqqrgtcqe2ueP4waaI9KZqAN8ofmvTlo2DHigGR
	gtpf5e/5zQZ5Lhn6OdU/bcSRULLHrXQnnK/Fn2sw6ebRCnRZ8PPauYOyngwVx5N8i/kB9o8cgXewz
	RBgwJgbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL9J-00000003V3v-0HEP;
	Thu, 30 Oct 2025 05:24:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL93-00000003Uvd-2Vq2;
	Thu, 30 Oct 2025 05:24:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 260BC44378;
	Thu, 30 Oct 2025 05:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C27FCC4CEFB;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801857;
	bh=2jU1k23psQLoti835WJhUi8hPO5zOMCVn1KLTW6Gx7o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Fqct62npqZNU+7aZwsQZWh1JWHKkBg0YVUWAGL+i6XEbL232ekVUazCOU0HaAR0BD
	 fYn8Zp9ku2mPyqXsQ7ga1lJPG1sQuWmBb7U5Ct0cRa7lq8pf7w5swmYJE/k5gNz/BM
	 YhO9IS/JzLvmVvjE6VVBiAzz1RrbYlWudw4yeIC9+YEUWq8n4DegFGe5cMjCMb/fqh
	 8f4VYoV9BU/WxYmvCQOLj1dnLobZJ/Aim7AueiiF2q+D4+O9FqFQ/dCKKwFslC43uD
	 /rl+FO5cWp/+8hT9quRlpMAj3Sbb74Ip7NZIz4bD3zWIByIxmdW4pEFuRWoqznm8nm
	 ybfwXVyuNfiEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE968CCF9F6;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 30 Oct 2025 13:24:12 +0800
Subject: [PATCH v2 2/5] clk: amlogic: Improve the issue of PLL lock
 failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251030-optimize_pll_driver-v2-2-37273f5b25ab@amlogic.com>
References: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
In-Reply-To: <20251030-optimize_pll_driver-v2-0-37273f5b25ab@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>, da@libre.computer
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=1329;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=By36+5Xc3F4ZCx2+oODMEZ/7arVOVHo8uzE39j79UAI=;
 b=uZ6pe/g6+Kcpzahmm37OY/aCUYb8QAGsQ9XhgLK57CE/ZIYOWn0w0solOn5GWD1DFWNqs20OZ
 DbfMN8DGCptAdPPnCDKIoA1yjDdyQRO7hVdZKe6PPNqGayQVvll6NrY
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_222421_690758_DC258EFE 
X-CRM114-Status: GOOD (  11.23  )
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
Reply-To: chuan.liu@amlogic.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Chuan Liu <chuan.liu@amlogic.com>

Due to factors such as temperature and process variations, the
internal circuits of the PLL may require a longer time to reach a
steady state, which can result in occasional lock failures on some
SoCs under low-temperature conditions.

After enabling the PLL and releasing its reset, a 20 us delay is
added at each step to provide enough time for the internal PLL
circuit to stabilize, thus reducing the probability of PLL lock
failure.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 629f6af18ea1..f81ebf6cc981 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -368,11 +368,16 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
+	/* Wait for Bandgap and LDO to power up and stabilize */
+	udelay(20);
 
 	/* Take the pll out reset */
 	if (MESON_PARM_APPLICABLE(&pll->rst))
 		meson_parm_write(clk->map, &pll->rst, 0);
 
+	/* Wait for PLL loop stabilization */
+	udelay(20);
+
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
 	 * is newly added for A1, keep the new power-on sequence to enable the

-- 
2.42.0



