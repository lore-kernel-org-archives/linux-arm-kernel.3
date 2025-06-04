Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C678FC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:58:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JLG6mY6MrSnv/kBCuQ7TAdZ7qyo8oybZ29TJ3XnXLTk=; b=ynwruEeqdQHbMfdSfm5e7yaVgx
	3g5woHPGZTOAcSQMN1L+CHRgYxZpSbvQEwhx9ihMUodI7igSgjlY/rmuIfBdZ5NH9FjsyGJV+470n
	GvkKD88ka9+5TgQ21QEPqWqkAXFwTfc9kEP6nZZlKZ/cN9uMcwGAN+0FO47OPMdo4tuACLnpMy6lc
	MfjY2IZY7mN6JPYWnAMNjnVkHaAY0pi9lxMHWOYB+TkYsedBu33tnENES/EN28iBv0P2vL5hxnPtx
	fO18MvmXXAz/oEn/XKl74+uKn2vKHRlj+3c92dP9QuBOMDgc8Vz/4xX+dB8PmEhmp86zOTMWtNywz
	3A/Uzttg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMml1-0000000DGLg-2cmI;
	Wed, 04 Jun 2025 11:58:11 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmd2-0000000DFDI-1H6y
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:49:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B09764A7B9;
	Wed,  4 Jun 2025 11:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2792AC4CEF0;
	Wed,  4 Jun 2025 11:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037795;
	bh=/7QKGrTwN7WFNPqZXaHQRNv6Glm9M4Hd1rhi/yG9yGA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OouUBZqBnZ11/PX1HGKh/rUSdNc0kHO3I4LROhi2zbIXDawEHlbvk3INdbWVJ6c6n
	 87psT19drbWDK1j6qGM6qkqSjr64PePb1h8bAm39gzbvvrgX7HHE4tV4HmjLRjtGjv
	 p8vF4e8xBWutG7SP2efmKneORB8tNa/H7em/ke3tSr3riuBipTsmIFTRfUNdZ8tKey
	 bJqseEAV8z2bvrHqfLcih9ezgIubaWryhgEc11VlejdCLgLpiMTfAFayirvaCy69pZ
	 DXXdaRXt5t8NFvkMFt15Y0ylBOPUWnb3U12jy5bb+DdRYM4Cm5Gsg2bMVYfBsHIYT9
	 /yt6EQinQuL2w==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Sukrut Bellary <sbellary@baylibre.com>,
	Judith Mendez <jm@ti.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Sasha Levin <sashal@kernel.org>,
	paul@pwsan.com,
	aaro.koskinen@iki.fi,
	andreas@kemnade.info,
	rogerq@kernel.org,
	tony@atomide.com,
	linux-omap@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 6/8] ARM: OMAP2+: Fix l4ls clk domain handling in STANDBY
Date: Wed,  4 Jun 2025 07:49:41 -0400
Message-Id: <20250604114944.208828-6-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604114944.208828-1-sashal@kernel.org>
References: <20250604114944.208828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_044956_374723_E26C5191 
X-CRM114-Status: GOOD (  19.01  )
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

From: Sukrut Bellary <sbellary@baylibre.com>

[ Upstream commit 47fe74098f3dadba2f9cc1e507d813a4aa93f5f3 ]

Don't put the l4ls clk domain to sleep in case of standby.
Since CM3 PM FW[1](ti-v4.1.y) doesn't wake-up/enable the l4ls clk domain
upon wake-up, CM3 PM FW fails to wake-up the MPU.

[1] https://git.ti.com/cgit/processor-firmware/ti-amx3-cm3-pm-firmware/

Signed-off-by: Sukrut Bellary <sbellary@baylibre.com>
Tested-by: Judith Mendez <jm@ti.com>
Link: https://lore.kernel.org/r/20250318230042.3138542-2-sbellary@baylibre.com
Signed-off-by: Kevin Hilman <khilman@baylibre.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** This commit should be backported to stable kernel trees. Here's
my detailed analysis: ## Analysis of the Bug Fix **Critical Power
Management Issue**: This commit fixes a fundamental system hang
condition where the AM33xx SoC cannot resume from standby mode. The l4ls
(L4 Low Speed) clock domain is being incorrectly put to sleep during
standby, which prevents the CM3 PM firmware from communicating with the
MPU to wake it up. ## Code Changes Analysis **1. Minimal and Targeted
Changes**: - Adds a single new flag `CLKDM_STANDBY_FORCE_WAKEUP` in
clockdomain.h - Applies this flag only to the l4ls clock domain in
clockdomains33xx_data.c - Modifies am33xx_clkdm_clk_disable() to check
for standby state and avoid sleeping this specific domain **2.
Conservative Approach**: The fix only prevents the problematic behavior
(putting l4ls to sleep during standby) rather than changing the overall
power management architecture. It follows the existing pattern already
documented in the codebase for similar GFX_L4LS workarounds. **3. Well-
Contained Risk**: - Changes are limited to AM33xx-specific code paths -
No changes to external APIs or device tree bindings - The conditional
check `pm_suspend_target_state == PM_SUSPEND_STANDBY` ensures the change
only affects standby mode ## Backport Justification **Meets Stable Tree
Criteria**: 1. **Important Bug Fix**: Resolves critical system hang
during suspend/resume 2. **Minimal Risk**: Surgical change with very low
regression potential 3. **No New Features**: Pure bug fix with no
architectural changes 4. **Platform-Specific**: Contained to AM33xx
SoCs, no cross-platform impact **High Impact for Users**: This affects
fundamental system reliability for devices using AM335x chips
(BeagleBone, industrial IoT systems). The current bug makes standby mode
unusable, requiring users to avoid this power saving feature entirely.
**Low Regression Risk**: The only potential side effect is marginally
higher standby power consumption from keeping one clock domain awake,
which is acceptable given the critical nature of the fix. This is
exactly the type of targeted, low-risk fix that stable trees are
designed for - addressing a critical functional issue with minimal code
changes and clear benefit to users.

 arch/arm/mach-omap2/clockdomain.h           |  1 +
 arch/arm/mach-omap2/clockdomains33xx_data.c |  2 +-
 arch/arm/mach-omap2/cm33xx.c                | 14 +++++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/arch/arm/mach-omap2/clockdomain.h b/arch/arm/mach-omap2/clockdomain.h
index c36fb27212615..86a2f9e5d0ef9 100644
--- a/arch/arm/mach-omap2/clockdomain.h
+++ b/arch/arm/mach-omap2/clockdomain.h
@@ -48,6 +48,7 @@
 #define CLKDM_NO_AUTODEPS			(1 << 4)
 #define CLKDM_ACTIVE_WITH_MPU			(1 << 5)
 #define CLKDM_MISSING_IDLE_REPORTING		(1 << 6)
+#define CLKDM_STANDBY_FORCE_WAKEUP		BIT(7)
 
 #define CLKDM_CAN_HWSUP		(CLKDM_CAN_ENABLE_AUTO | CLKDM_CAN_DISABLE_AUTO)
 #define CLKDM_CAN_SWSUP		(CLKDM_CAN_FORCE_SLEEP | CLKDM_CAN_FORCE_WAKEUP)
diff --git a/arch/arm/mach-omap2/clockdomains33xx_data.c b/arch/arm/mach-omap2/clockdomains33xx_data.c
index 87f4e927eb183..c05a3c07d4486 100644
--- a/arch/arm/mach-omap2/clockdomains33xx_data.c
+++ b/arch/arm/mach-omap2/clockdomains33xx_data.c
@@ -19,7 +19,7 @@ static struct clockdomain l4ls_am33xx_clkdm = {
 	.pwrdm		= { .name = "per_pwrdm" },
 	.cm_inst	= AM33XX_CM_PER_MOD,
 	.clkdm_offs	= AM33XX_CM_PER_L4LS_CLKSTCTRL_OFFSET,
-	.flags		= CLKDM_CAN_SWSUP,
+	.flags		= CLKDM_CAN_SWSUP | CLKDM_STANDBY_FORCE_WAKEUP,
 };
 
 static struct clockdomain l3s_am33xx_clkdm = {
diff --git a/arch/arm/mach-omap2/cm33xx.c b/arch/arm/mach-omap2/cm33xx.c
index acdf72a541c02..a4dd42abda89b 100644
--- a/arch/arm/mach-omap2/cm33xx.c
+++ b/arch/arm/mach-omap2/cm33xx.c
@@ -20,6 +20,9 @@
 #include "cm-regbits-34xx.h"
 #include "cm-regbits-33xx.h"
 #include "prm33xx.h"
+#if IS_ENABLED(CONFIG_SUSPEND)
+#include <linux/suspend.h>
+#endif
 
 /*
  * CLKCTRL_IDLEST_*: possible values for the CM_*_CLKCTRL.IDLEST bitfield:
@@ -328,8 +331,17 @@ static int am33xx_clkdm_clk_disable(struct clockdomain *clkdm)
 {
 	bool hwsup = false;
 
+#if IS_ENABLED(CONFIG_SUSPEND)
+	/*
+	 * In case of standby, Don't put the l4ls clk domain to sleep.
+	 * Since CM3 PM FW doesn't wake-up/enable the l4ls clk domain
+	 * upon wake-up, CM3 PM FW fails to wake-up th MPU.
+	 */
+	if (pm_suspend_target_state == PM_SUSPEND_STANDBY &&
+	    (clkdm->flags & CLKDM_STANDBY_FORCE_WAKEUP))
+		return 0;
+#endif
 	hwsup = am33xx_cm_is_clkdm_in_hwsup(clkdm->cm_inst, clkdm->clkdm_offs);
-
 	if (!hwsup && (clkdm->flags & CLKDM_CAN_FORCE_SLEEP))
 		am33xx_clkdm_sleep(clkdm);
 
-- 
2.39.5


