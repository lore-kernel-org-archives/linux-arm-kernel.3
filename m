Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0074DC87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 00:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yw1VPgMBgAwGTCcaQICaDn9HZX+xFRXrKg6AtEO7n8E=; b=fmaDOvd0DKdyr3qN4jDTM6H34I
	l7bIRxYjWq0s0Eschsl/s+Wfx8kaYh49DrcLDbkhEUPKBWrJ5PMYHexluKrjwcw2XV/nvlaSXTUVN
	gwilb7bddfU+62Kp1znEhnBxvn3T6BYAda5HsS3xxMefjKzJnd72fYikM5tYJ/aLOEQh2z2QGkGp9
	kel49WWzAp0AWX53vTMvByfnAfft30eIJU/eJTyFmOrfBbZoYBFB/A9r7zMO+qQm7cI98b6u/N9/N
	u4j8kxCFSrpSewOFnGgxMrwYexlvqWHyPM0m/9HIq3ByJLZ36sp6tt8FQ7NNxXh47J9ruYXkJ7RlV
	sztu6DPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uijFB-00000009MXb-0hVL;
	Mon, 04 Aug 2025 00:40:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uij2D-00000009Ksl-0pYx
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Aug 2025 00:26:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1FD2A5C58AC;
	Mon,  4 Aug 2025 00:26:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE53AC4CEEB;
	Mon,  4 Aug 2025 00:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754267195;
	bh=Ai7ovGIQerXkAsNVRPPimO6sukyYoDbm6mm8ZOgM/W0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GHD45dBKJLgQ6lyZqW2gNYhZ5/A6DBoietAwwAleoZr3SlU7VNMzz+ztVb4UfvAEA
	 pfzqncVFv1GwkCJSczJ44Hl8Y4xjemp9jPdn+bXS4PRqiTgX1xB2yNnSX/FT2+i/RV
	 jTfZqq2qn/U9GOYPgAnZpymc43VhufBKHnZ+GK3lOxLPNIqpC8HcMaYI/cNiheUsfc
	 RJXn2OfIWb0lucshH30oLsWckPryhOGA/jvX/1lstkQYuKq+DUJCmT1mPh0+OfdiQy
	 uauZn082j5WR0rTDtVQEl40r60msO64T1jIx/gKfwG8CzfcPA73u7hFwmhF9dWJstB
	 WucbDAagp4MgA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Haibo Chen <haibo.chen@nxp.com>,
	Luke Wang <ziniu.wang_1@nxp.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	adrian.hunter@intel.com,
	shawnguo@kernel.org,
	linux-mmc@vger.kernel.org,
	imx@lists.linux.dev,
	s32@nxp.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16 58/85] mmc: sdhci-esdhc-imx: Don't change pinctrl in suspend if wakeup source
Date: Sun,  3 Aug 2025 20:23:07 -0400
Message-Id: <20250804002335.3613254-58-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250804002335.3613254-1-sashal@kernel.org>
References: <20250804002335.3613254-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_172637_404265_24BF4CFF 
X-CRM114-Status: GOOD (  22.66  )
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

From: Haibo Chen <haibo.chen@nxp.com>

[ Upstream commit 031d9e30d569ca15ca32f64357c83eee6488e09d ]

The pinctrl sleep state may config the pin mux to certain function to save
power in system suspend. Unfortunately this doesn't work if usdhc is used
as a wakeup source, like waking up on SDIO irqs or card-detect irqs. In
these cases, we need pin mux to be configured to usdhc function pad.

The issue is found on imx93-11x11-evk board, where WiFI over SDIO with
in-band irqs fails to wakeup the system, because the DATA[1] pin has been
set to GPIO function.

To fix the problem, don't change the pinctrl state in suspend if there is a
system wakeup enabled.

Signed-off-by: Haibo Chen <haibo.chen@nxp.com>
Signed-off-by: Luke Wang <ziniu.wang_1@nxp.com>
Link: https://lore.kernel.org/r/20250521033134.112671-1-ziniu.wang_1@nxp.com
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real user-impacting bug**: The commit fixes a regression
   where SDIO WiFi devices fail to wake up the system from suspend. This
   is a functional regression that directly impacts users' ability to
   use WiFi wake-on-WLAN functionality on i.MX platforms.

2. **Small and contained fix**: The change is minimal - it simply moves
   the `pinctrl_pm_select_sleep_state()` call inside the else block of
   the wakeup check. The logic change is:
   - Before: Always switch to sleep pinctrl state during suspend
   - After: Only switch to sleep pinctrl state if the device is NOT a
     wakeup source

3. **Low risk of regression**: The fix is conservative and only affects
   the suspend path when the device is configured as a wakeup source.
   The normal suspend behavior (non-wakeup case) remains unchanged.

4. **Fixes a specific regression**: The bug was introduced when wakeup
   support was added in commit f62f7bcc827f ("mmc: sdhci-esdhc-imx:
   Enable support for system wakeup for SDIO") in v5.14. The original
   implementation didn't account for the conflict between pinctrl sleep
   states and wakeup functionality.

5. **Clear problem description**: The commit message clearly explains
   that on imx93-11x11-evk board, the DATA[1] pin being reconfigured to
   GPIO function during suspend prevents SDIO interrupts from waking the
   system.

6. **Subsystem-specific fix**: The change is confined to the i.MX-
   specific SDHCI driver and doesn't touch core MMC/SDHCI code,
   minimizing the risk of broader impacts.

The fix addresses a fundamental incompatibility between power-saving
pinctrl configurations and wakeup functionality - a common issue in
embedded systems that needs to be properly handled. This makes it a
strong candidate for stable backporting to ensure SDIO wakeup
functionality works correctly on affected i.MX platforms.

 drivers/mmc/host/sdhci-esdhc-imx.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/drivers/mmc/host/sdhci-esdhc-imx.c b/drivers/mmc/host/sdhci-esdhc-imx.c
index ac187a8798b7..05dd2b563c02 100644
--- a/drivers/mmc/host/sdhci-esdhc-imx.c
+++ b/drivers/mmc/host/sdhci-esdhc-imx.c
@@ -2039,12 +2039,20 @@ static int sdhci_esdhc_suspend(struct device *dev)
 		ret = sdhci_enable_irq_wakeups(host);
 		if (!ret)
 			dev_warn(dev, "Failed to enable irq wakeup\n");
+	} else {
+		/*
+		 * For the device which works as wakeup source, no need
+		 * to change the pinctrl to sleep state.
+		 * e.g. For SDIO device, the interrupt share with data pin,
+		 * but the pinctrl sleep state may config the data pin to
+		 * other function like GPIO function to save power in PM,
+		 * which finally block the SDIO wakeup function.
+		 */
+		ret = pinctrl_pm_select_sleep_state(dev);
+		if (ret)
+			return ret;
 	}
 
-	ret = pinctrl_pm_select_sleep_state(dev);
-	if (ret)
-		return ret;
-
 	ret = mmc_gpio_set_cd_wake(host->mmc, true);
 
 	/*
-- 
2.39.5


