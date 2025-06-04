Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD86DC5B549
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUOTQd2Y7PCemDG7JvpnXIlrwoqDMSo7ZKdcUhAmjUI=; b=sYpZFNtjO9C17Hs8jpd8Cv0WW9
	BzUL4OkoREiwKyR6u+SIIj1ZL8k74FdAjZ0AilWnGA4k0XbAZ1yUiJEmEUSRGW3q5LjDwiBjKtPNB
	zNBjDy7eRloihHu+GOtj3Cxhi2S2og9xaSn2AjH4eQMnEYLWgxGWsSqxOWetkoZGw3dH+keYywcu0
	9TiVpP7ztDE16lB1ZQt4zcTzU59m0CcOA8r1dDLhfvw2hm5OMWT3kBrSGlBGb5VD4TCDFQePK4YbD
	VLqZKjai+2aG00Xa3tmUFqozMQMVDmOsrbe2ZrHoToaCvZDjHFaw6GUgV/b4UgTeVb2iLCbcx8SGK
	oQeIa7cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmeo-0000000DFZS-1YGj;
	Wed, 04 Jun 2025 11:51:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmch-0000000DF7r-205x
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:49:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 968F4A50460;
	Wed,  4 Jun 2025 11:49:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1699FC4CEE7;
	Wed,  4 Jun 2025 11:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037774;
	bh=4YpqR/oThvhMVs76qJVATQq41r8mEVz6PYiOWFGh/YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ipDwMw2KIHeut7SfDYdFnV7kuraDOosTSSqj7googBlS16KunQrGqQcTKOW7wOn1X
	 q4FSZkIO+7lXbOblr0hHvlVRk7tXmmeMTg8/0YmAY35ErAIz32TA6jUzwNmDTxtq0w
	 jOu03DRMysDHYYd6YdTsdqaTkuWZzfdC+ngoKFLa2YWsEQ41WuTDDk0ebVoi8UrjI8
	 Y1PXEr1x3n/pQQIbCLiBdkiz2iPKet8WxDeibHQo8shBYeaVMXHHgBs+uhlPTrOwHi
	 DObHV0hnZB2BocEtDeDcQnNiCxfJsJZYZIyUlVjaopu2b/mvcFePF/RszTgZkHv6ET
	 GTSM5OfO0N9Xw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-watchdog@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.15 4/9] watchdog: stm32: Fix wakeup source leaks on device unbind
Date: Wed,  4 Jun 2025 07:49:17 -0400
Message-Id: <20250604114923.208380-4-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604114923.208380-1-sashal@kernel.org>
References: <20250604114923.208380-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.15
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_044935_643256_361CF7FA 
X-CRM114-Status: GOOD (  18.94  )
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

From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

[ Upstream commit b6f8a417e17f1929bb8e7e6ba9f4677f1f3ce364 ]

Device can be unbound or probe can fail, so driver must also release
memory for the wakeup source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250406203531.61322-1-krzysztof.kozlowski@linaro.org
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

**YES** Based on my comprehensive analysis of the commit and examination
of the Linux kernel repository, this commit should be backported to
stable kernel trees. ## Analysis of the Commit ### Nature of the Bug Fix
This commit addresses a **memory leak** in the STM32 watchdog driver's
wakeup source handling. The change is minimal but important: ```c //
Before: ret = device_init_wakeup(dev, true); // After: ret =
devm_device_init_wakeup(dev); ``` The original code creates a wakeup
source using `device_init_wakeup()` but never properly releases it when
the device is unbound or the driver is removed. The fix uses
`devm_device_init_wakeup()`, which automatically handles cleanup through
the device-managed resource framework. ### Strong Alignment with Similar
Backported Commits This commit follows **exactly the same pattern** as
the similar commits #1 and #2 that were marked as **"Backport Status:
YES"**: - **GPIO mpc8xxx commit**: Also changed `device_init_wakeup(dev,
true)` to `devm_device_init_wakeup(dev)` and was explicitly marked for
stable with `Cc: stable@vger.kernel.org` - **GPIO zynq commit**: Added
proper cleanup with `device_init_wakeup(&pdev->dev, 0)` in the remove
function, also marked for stable ### Key Factors Supporting Backporting
1. **Clear Bug Fix**: Fixes a definitive memory leak - each time the
device is unbound, wakeup source memory (struct wakeup_source, device
name strings, sysfs entries) is not freed 2. **Minimal Risk**: The
change is extremely low-risk: - `devm_device_init_wakeup()` is just a
wrapper that provides automatic cleanup - No functional behavior changes
during normal operation - Only adds proper resource management on device
removal 3. **Small and Contained**: Single line change with no
architectural implications 4. **Part of Systematic Cleanup**: My
analysis of the kernel repository revealed this is part of a larger
cleanup effort with 10+ similar fixes across different subsystems in
2024-2025 5. **Real Impact**: While not critical, the leak affects: -
Embedded systems with limited memory - Development environments with
frequent driver loading/unloading - Systems that dynamically bind/unbind
devices 6. **Stable Tree Criteria Compliance**: - Fixes an actual bug
affecting users - Extremely minimal regression risk - Confined to a
single driver - No new features or architectural changes ### Risk
Assessment The technical risk is **extremely low**. The
`devm_device_init_wakeup()` function is a simple wrapper around
`device_init_wakeup(dev, true)` that adds automatic cleanup via
`devm_add_action_or_reset()`. There are no functional changes to the
watchdog or power management behavior - only proper resource cleanup is
added. This commit exemplifies an ideal stable backport candidate: it
fixes a real bug with minimal code change and virtually no risk of
introducing regressions.

 drivers/watchdog/stm32_iwdg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/stm32_iwdg.c b/drivers/watchdog/stm32_iwdg.c
index 8ad06b54c5adc..b356a272ff9a0 100644
--- a/drivers/watchdog/stm32_iwdg.c
+++ b/drivers/watchdog/stm32_iwdg.c
@@ -291,7 +291,7 @@ static int stm32_iwdg_irq_init(struct platform_device *pdev,
 		return 0;
 
 	if (of_property_read_bool(np, "wakeup-source")) {
-		ret = device_init_wakeup(dev, true);
+		ret = devm_device_init_wakeup(dev);
 		if (ret)
 			return ret;
 
-- 
2.39.5


