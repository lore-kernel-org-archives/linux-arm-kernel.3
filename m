Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F218CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 05:24:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7fN/CRzQO0oBCrTSHEG35WCiJ7lyuMwADUC75oMt1JA=; b=GMlwAsvNuk0b36tJiU+tvgAHXc
	flAe+1lsdiXT7LhSs3/HGTHVhl6a24zqT3ofkaCCEuJi39n4gQPH+1lg/XmGD7hQiUIiTF51fZ4zX
	mEEd4eKjgZC0xtYwuiovDyua92iDshU1bTKvSDnijFpn3wBC/4vwei4SDfwNzWEyIBposPeY7BxUG
	2wRoa14YmyywHD4GHitABlT6P6MOm9Z7+I8ktpZLW92XDo7pHQJqn3aCEep5fQBettdYgT/Cpef1c
	PXQUr2IdKZ9gVxqTSj1+tuVWv9BH99RicCWbqSaJLScVwzzflvDuq8fPniioEaNeJdB0gLQalW76u
	BB+mX1qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL9J-00000003V4O-1ZAS;
	Thu, 30 Oct 2025 05:24:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEL93-00000003Uvf-2W4X;
	Thu, 30 Oct 2025 05:24:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4916944953;
	Thu, 30 Oct 2025 05:24:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id D7FC5C116D0;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761801857;
	bh=ITtznf4V3PEOG09w+PdAv94v0LkRnn8G5sFFZCmhyck=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=ZVSYNWZPkLnDYVbMBDi9vqQ7BEnDOH5Xdx1ZOQaQln6Nu62mSuMvbRO1LuGPraB8E
	 bhV8LVHREktlWtCPSAyukwhAQ48l0W8txy7SqyOSkf84xTn8EH3qBGYaq9m4WlO22W
	 9HS/mzufrkEdWTX4JtrJ3T8FC1eqe2uXty/T4P5OSvo8tlnzN3X9SwxJm0bbiNCI4M
	 oDHBhF78/5UnaJV4emf/FCMimW87bhsj24rQTjUEpkWgt7MvaKtaNnXUnTbfXHvkSU
	 PAODCMtoFvaTG14g74vpbuBYBCO7tT/udVPAKKx0XfAbdn9YCWZuNdJzPqNRsMMIoZ
	 27wFX4Ox0TFSQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD02FCCF9F9;
	Thu, 30 Oct 2025 05:24:17 +0000 (UTC)
From: Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Date: Thu, 30 Oct 2025 13:24:14 +0800
Subject: [PATCH v2 4/5] clk: amlogic: Optimize PLL enable timing
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251030-optimize_pll_driver-v2-4-37273f5b25ab@amlogic.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1761801855; l=2564;
 i=chuan.liu@amlogic.com; s=20240902; h=from:subject:message-id;
 bh=DjnEanujLZY4RuGc42rl8hj7g33ffwSvffDuoLJcxso=;
 b=sTga/WVc91PpMaP5RpP+aJzcq1fHbdkptD2tzxJ/anIj6LHmeSDy9p2tUGqkohJmzO2ldf8Bk
 OsA0vBqz2nqDsOLShEcZFUKNQw3jhmY3tuftag8o15yNCYsVdSJ+jvT
X-Developer-Key: i=chuan.liu@amlogic.com; a=ed25519;
 pk=fnKDB+81SoWGKW2GJNFkKy/ULvsDmJZRGBE7pR5Xcpo=
X-Endpoint-Received: by B4 Relay for chuan.liu@amlogic.com/20240902 with
 auth_id=203
X-Original-From: Chuan Liu <chuan.liu@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_222421_700483_A297F442 
X-CRM114-Status: GOOD (  14.35  )
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

l_detect controls the enablement of the PLL lock detection module.
It should remain disabled while the internal PLL circuits are
reaching a steady state; otherwise, the lock signal may be falsely
triggered high.

Before enabling the internal power supply of the PLL, l_detect should
be disabled. After the PLL’s internal circuits have stabilized,
l_detect should be enabled to prevent false lock signal triggers.

Currently, only A1 supports both l_detect and current_en, so this
patch will only affect A1.

Signed-off-by: Chuan Liu <chuan.liu@amlogic.com>
---
 drivers/clk/meson/clk-pll.c | 28 +++++++++++++++-------------
 1 file changed, 15 insertions(+), 13 deletions(-)

diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
index 6c794adb8ccd..c6eebde1f516 100644
--- a/drivers/clk/meson/clk-pll.c
+++ b/drivers/clk/meson/clk-pll.c
@@ -383,36 +383,38 @@ static int meson_clk_pll_enable(struct clk_hw *hw)
 	if (MESON_PARM_APPLICABLE(&pll->rst))
 		meson_parm_write(clk->map, &pll->rst, 1);
 
+	/* Disable the PLL lock-detect module */
+	if (MESON_PARM_APPLICABLE(&pll->l_detect))
+		meson_parm_write(clk->map, &pll->l_detect, 1);
+
 	/* Enable the pll */
 	meson_parm_write(clk->map, &pll->en, 1);
 	/* Wait for Bandgap and LDO to power up and stabilize */
 	udelay(20);
 
-	/* Take the pll out reset */
-	if (MESON_PARM_APPLICABLE(&pll->rst))
-		meson_parm_write(clk->map, &pll->rst, 0);
-
-	/* Wait for PLL loop stabilization */
-	udelay(20);
-
 	/*
 	 * Compared with the previous SoCs, self-adaption current module
 	 * is newly added for A1, keep the new power-on sequence to enable the
 	 * PLL. The sequence is:
-	 * 1. enable the pll, delay for 10us
+	 * 1. enable the pll, delay for 20us
 	 * 2. enable the pll self-adaption current module, delay for 40us
 	 * 3. enable the lock detect module
 	 */
 	if (MESON_PARM_APPLICABLE(&pll->current_en)) {
-		udelay(10);
 		meson_parm_write(clk->map, &pll->current_en, 1);
-		udelay(40);
+		udelay(20);
 	}
 
-	if (MESON_PARM_APPLICABLE(&pll->l_detect)) {
-		meson_parm_write(clk->map, &pll->l_detect, 1);
+	/* Take the pll out reset */
+	if (MESON_PARM_APPLICABLE(&pll->rst))
+		meson_parm_write(clk->map, &pll->rst, 0);
+
+	/* Wait for PLL loop stabilization */
+	udelay(20);
+
+	/* Enable the lock-detect module */
+	if (MESON_PARM_APPLICABLE(&pll->l_detect))
 		meson_parm_write(clk->map, &pll->l_detect, 0);
-	}
 
 	if (meson_clk_pll_wait_lock(hw)) {
 		/* disable PLL when PLL lock failed. */

-- 
2.42.0



