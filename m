Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D15DD2E9D4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 10:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZOTFPbMSW8MnyRvOa2vC4H8I90RWySx7PLSazkbNPgw=; b=YVU+sZkNZioIKlFTqwj4ZXuyq8
	bPNYv39nDGLSp7ABdlWe9Cwwll1gv0oBklRSyTwxkh+Jvhzbdsl8g/VIRR+YWVpTgkuBBVAsyZ13N
	TXpyQspGK4vEQrQzRGKoq3pkNs5R/z4ez9Xr4lvBOdG0quxodE9LFWeE/kuCzc3DMaii6KPAs1OWW
	M+8Y2Z0Bl9zx4pr07qRHK8Q7aJOrnZM/1xetQvZ3b2EqMhlhRYEffUGOLhOWb+EB+rQBzSSRBnmUX
	5oIfsHN+lo3LTSv0l5bofz5DxBqHG0o0e0TTXUln5hi6zWkXRN1W0ciohH619BJXp3gyUgMR3OL9N
	XNvQNKhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tARho-0000000HHlP-2dCY;
	Mon, 11 Nov 2024 10:31:36 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tARfw-0000000HHB0-1C3v;
	Mon, 11 Nov 2024 10:29:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8D5CEA413A5;
	Mon, 11 Nov 2024 10:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C47B6C4CECF;
	Mon, 11 Nov 2024 10:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731320978;
	bh=uIZqmnuRJS8ekHv7lZsq7+XDiS0vhUubfUCwr80FMvs=;
	h=From:To:Cc:Subject:Date:From;
	b=Cr+3CDdQv65miQSVhu73OzxU7prbdWiB+XY946y6RQnMjnOJ1OLbUHIaruK/paf3+
	 q98U5nppe0SlsmjqxQkSki0TzfPSMh2UNKl3wl4uBNY27XyeqIPsS7t0yzMxPcPIMp
	 ikWcV5f06UsXxinaJRfgyFmKjpwJt2TZ5mQ4msOR/EUfkQUoLisXvXfgcFEnHXdTdn
	 GPF9Oc3K/Ao+FYHBCXIbN4ptWMaW4+qXS1diuhVKM9HeNh2h5h1qjqMGMJj4iFb7Ky
	 Z+aS3MQKDbCIAgfDi+zjsi+rToZ4OGJf/TzTmO9RllH4mmkGCMg8lnQynn++RFsSMk
	 9yzOG8HxwMUdw==
From: Arnd Bergmann <arnd@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Kevin Hilman <khilman@baylibre.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Chuan Liu <chuan.liu@amlogic.com>,
	Xianwei Zhao <xianwei.zhao@amlogic.com>,
	linux-amlogic@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] clk: amlogic: axg-audio: fix Kconfig dependency on RESET_MESON_AUX
Date: Mon, 11 Nov 2024 11:29:21 +0100
Message-Id: <20241111102932.3209861-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_022940_408707_BE232CD4 
X-CRM114-Status: GOOD (  11.35  )
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

From: Arnd Bergmann <arnd@arndb.de>

As in most cases, using 'imply' is wrong here and does not prevent
build failures since that code may not be visible to a built-in
clk driver:

axg-audio.c:(.text+0x15c): undefined reference to `devm_meson_rst_aux_register'

Replace the incorrt 'imply' with the necessary 'depends on'.

Fixes: 664988eb47dd ("clk: amlogic: axg-audio: use the auxiliary reset driver")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/clk/meson/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
index 7cb21fc223b0..febb5d7348ff 100644
--- a/drivers/clk/meson/Kconfig
+++ b/drivers/clk/meson/Kconfig
@@ -106,7 +106,7 @@ config COMMON_CLK_AXG_AUDIO
 	select COMMON_CLK_MESON_SCLK_DIV
 	select COMMON_CLK_MESON_CLKC_UTILS
 	select REGMAP_MMIO
-	imply RESET_MESON_AUX
+	depends on RESET_MESON_AUX
 	help
 	  Support for the audio clock controller on AmLogic A113D devices,
 	  aka axg, Say Y if you want audio subsystem to work.
-- 
2.39.5


