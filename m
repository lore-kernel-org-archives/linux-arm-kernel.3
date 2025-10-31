Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E813CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 08:10:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=St0yUF1ubFRRpauHGszUzEJtQJJkvKnkbRTzEOrWIvo=; b=ZY1dQ0nlaLUm3KMp2FaDPrxLYD
	lMoOsYU0mGGLjdEfVpR7eEZGXjUjg+2h5WwoJVthQ91FUTvOsRrUeoxH3FBLXoUng6kxFhREh37e2
	4CiygvsPkuggwwbODRtdx+/44ALkx7Qy4WiRSmRQX/JG48CX3WH8Y6utDB6MkODMW4j4AJ5MEEQYz
	ZmgtLBVOdX+WRT4S+I0L178ai+7viPQqewVl1OIjO4is8qAQjthZ6K/8e0qGelwLHe0y5EDPWQ6e7
	ZO2oKQH2Pe4YI4XhFHPm/koGxdmMKpnEEdsBRQHLXlE1IKxkxs5PIqN9g1x+d5p0xyUWuXjpmGa0Q
	JVSIAhmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDY-00000005bgs-0Nhp;
	Fri, 31 Oct 2025 08:10:40 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEkDR-00000005ben-15Pe;
	Fri, 31 Oct 2025 08:10:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 21C466123F;
	Fri, 31 Oct 2025 08:10:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id C230AC116C6;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761898231;
	bh=1nwGVO3Zcpwv2pMSFVgY8O3SNOwGFq6oSEOulqqDP4g=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=OCjhTnB7jSnhLcmJ7VtvvseYnBLme3xRFIwGaVusZkch//5kW/wh8rfiA8SkwHoE6
	 a9S6E8NuavPmKYq9WR/KlEutmjvCmSvQCYHd+JtLr/2LuG7IVjNxZii1Ryu9Tk9JPn
	 mIi3KzMUNZ7HtkWKeEV7VYVlc2Lw9r1iXziqI+D23YUk1z+kvAG3Bjuy8EtFeOeLEH
	 Fh8DINuV09NA2PpsRMGsKCZQUJY9M2+NtseMUN5dXChkM+7wkQr9BUYTHihiWMNqT4
	 jdvdXbJg2Dlc/cDgJxJB762tStticMvzAm8ndPoD6TbhfN5Hw8+RXiC9RQZOG8MobY
	 ySg0YMJBwU45A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8343CCFA00;
	Fri, 31 Oct 2025 08:10:31 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Fri, 31 Oct 2025 16:10:09 +0800
Subject: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock
 failures
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
In-Reply-To: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
To: Neil Armstrong <neil.armstrong@linaro.org>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Chuan Liu <chuan.liu@amlogic.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761898227; l=1398;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=D0Ch0klWiiVBvP2nT1dWsPIBdVptw/u95TcZFxvGJ48=;
 b=DFTPIpZdSO64xPMi6d1dN9YKt56tCq1oo7YedKHM2Vk59/bE+owHEUbdaDAlE8itMPMMh1Xdy
 t1Z8vWX+hKYDRPWTkbvGi2VhLlPZnlaiFKx/mnKCdN2qQMzjD8T7dGO
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
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
 drivers/clk/meson/clk-pll.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 629f6af18ea1..70c8c7078046 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -369,10 +369,17 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 
+	/* Wait for Bandgap and LDO to power up and stabilize */
+	udelay(20);
+
 	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
+	if (MESON_PARM_APPLICABLE(&pll->rst)) {
 		meson_parm_write(clk->map, &pll->rst, 0);
 
+		/* Wait for PLL loop stabilization */
+		udelay(20);
+	}
+
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
 	 * is newly added for A1, keep the new power-on sequence to enable the

-- 
2.42.0



