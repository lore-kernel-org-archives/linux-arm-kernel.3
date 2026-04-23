Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1099AFDEE4D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 21:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YGJ5Nro12qoDdt+AG8mAm5DSZJ2kFgbCEuEoFBR7U8M=; b=294Ui9rntlCnglCzU/3x/W1Tud
	nTKGuiQNeo2JGJUhZte3CL4G651V0WjUmL+HXNxxooqf4nlB6OFdZadtd4AQmSw8037mx5KS1ANqF
	9PFAUwjMYNMOxAcuWrL2+oIuwlq2/5g8X3qJfcd+EQCS2QMSgHTi2XQKtxGUZ6MLg1Ew9oT/WhahK
	VVgLJTBsq1npo0qYnQb61GQXJyzSYhU5mKpnGnzUunCUgYbzuXY4RJKor444Cn5/VI0zWWKrz0O+H
	C/VZ3Am0z3f9IHApvRBNox1nrUs3siD7fj3NzwjQR4svR5HT/zfpDwafb0W1DIiiLwVHyUdelYIwn
	kw5G/tEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1OR-0000000CKOh-0EDB;
	Thu, 23 Apr 2026 21:15:27 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG1ON-0000000CKLX-3wF4
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 21:15:25 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4g1plY2qWhz9tPg;
	Thu, 23 Apr 2026 23:15:21 +0200 (CEST)
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of linux@timmermann.space designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=linux@timmermann.space
From: Lukas Timmermann <linux@timmermann.space>
Date: Thu, 23 Apr 2026 23:14:40 +0200
Subject: [PATCH 4/5] clk: samsung: exynos5250: Define more clocks
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-manta-display-v1-4-196f80c5673a@timmermann.space>
References: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
In-Reply-To: <20260423-manta-display-v1-0-196f80c5673a@timmermann.space>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jesszhan0024@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Douglas Anderson <dianders@chromium.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Lukas Timmermann <linux@timmermann.space>, 
 Alexandre Marquet <tb@a-marquet.fr>
X-Rspamd-Queue-Id: 4g1plY2qWhz9tPg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_141524_206633_EF9535B2 
X-CRM114-Status: GOOD (  11.41  )
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

Add defines for mout_fimd1 and mout_vpll to enable display support for
exynos5250-manta boards.

Signed-off-by: Alexandre Marquet <tb@a-marquet.fr>
Signed-off-by: Lukas Timmermann <linux@timmermann.space>
---
 drivers/clk/samsung/clk-exynos5250.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/samsung/clk-exynos5250.c b/drivers/clk/samsung/clk-exynos5250.c
index e90d3a0848cb..a43d05d3014f 100644
--- a/drivers/clk/samsung/clk-exynos5250.c
+++ b/drivers/clk/samsung/clk-exynos5250.c
@@ -102,7 +102,7 @@
 #define PWR_CTRL2_CORE1_UP_RATIO		(1 << 0)
 
 /* NOTE: Must be equal to the last clock ID increased by one */
-#define CLKS_NR					(CLK_MOUT_VPLLSRC + 1)
+#define CLKS_NR					(CLK_MOUT_VPLL + 1)
 
 /* list of PLLs to be registered */
 enum exynos5250_plls {
@@ -283,7 +283,7 @@ static const struct samsung_mux_clock exynos5250_mux_clks[] __initconst = {
 
 	MUX(0, "mout_cpll", mout_cpll_p, SRC_TOP2, 8, 1),
 	MUX(0, "mout_epll", mout_epll_p, SRC_TOP2, 12, 1),
-	MUX(0, "mout_vpll", mout_vpll_p, SRC_TOP2, 16, 1),
+	MUX(CLK_MOUT_VPLL, "mout_vpll", mout_vpll_p, SRC_TOP2, 16, 1),
 	MUX(0, "mout_mpll_user", mout_mpll_user_p, SRC_TOP2, 20, 1),
 	MUX(0, "mout_bpll_user", mout_bpll_user_p, SRC_TOP2, 24, 1),
 	MUX(CLK_MOUT_GPLL, "mout_gpll", mout_gpll_p, SRC_TOP2, 28, 1),
@@ -304,7 +304,7 @@ static const struct samsung_mux_clock exynos5250_mux_clks[] __initconst = {
 	MUX(0, "mout_gscl_wa", mout_group1_p, SRC_GSCL, 24, 4),
 	MUX(0, "mout_gscl_wb", mout_group1_p, SRC_GSCL, 28, 4),
 
-	MUX(0, "mout_fimd1", mout_group1_p, SRC_DISP1_0, 0, 4),
+	MUX(CLK_MOUT_FIMD1, "mout_fimd1", mout_group1_p, SRC_DISP1_0, 0, 4),
 	MUX(0, "mout_mipi1", mout_group1_p, SRC_DISP1_0, 12, 4),
 	MUX(0, "mout_dp", mout_group1_p, SRC_DISP1_0, 16, 4),
 	MUX(CLK_MOUT_HDMI, "mout_hdmi", mout_hdmi_p, SRC_DISP1_0, 20, 1),

-- 
2.53.0


