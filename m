Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA8F7C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 11:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dUOTQd2Y7PCemDG7JvpnXIlrwoqDMSo7ZKdcUhAmjUI=; b=mzEIEyO//vBBrvwKxEbRZKWB6V
	AEKctz2ZAvscVPAEZREYd+LLQhzZ9+VypxqnWVv53t/aWUnsyf5jbR/PCyat7UNFKvO6qNQG/Qgei
	NCKsFw1V0bqOG+MiNtJXlZ/fo6XQeV1UUNPJ7OslzaoBATYZJr75U+Udo1+39jW4sJu+CcZ7Xhuho
	lXbiP5Q0NTlZ/q3qQmrKaDejXKB5b6BplR+dNXei8o/t5KRbQlHuRkk+iQxbWcqd6lj7+ldSxTV5A
	1wJNzH/qZDEAOjKuiUSE7FopX0FyhUAusDbGANI3L+/aDgO3Wn8djme3CNorX6BFVfG9QnGc9dcRc
	Iooo8v9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmix-0000000DG9w-3Rln;
	Wed, 04 Jun 2025 11:56:03 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMmcw-0000000DFCN-46cz
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 11:49:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4C1A6A504C2;
	Wed,  4 Jun 2025 11:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBF65C4CEE7;
	Wed,  4 Jun 2025 11:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749037790;
	bh=4YpqR/oThvhMVs76qJVATQq41r8mEVz6PYiOWFGh/YM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OKmA8j3aqZqMYW/5etm/6Hiz6awLlctbEnfKCJCTDzZeqyZPzXLSy2T4SQDxa9tPE
	 iLmNZdWyH6x8TMX8uy4SNSuS6yzo88UX14S/Jb3NBnzVDN+ELVxmlAF2M6K3pfKdmc
	 NtgdF0vCrmPJEpIgHxk/OGvcVplASDKXXt0Hk5PQ4XgQmH+IsZCvAtEdi7beoVrHoW
	 kXNfUOsUHqQNvZ5Ypv3sPs0M5TRhGnqc9kYV0/d1LKLxREoMuJSCaNXQcLL1jyUUNC
	 xhiLytOqFE5rKQdkjTbqnP9ZuCXELq7nHVCJCS+pFQAsbeM7e0aK+DbwDEVr7P50WI
	 MagB1am6SDJ4Q==
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
Subject: [PATCH AUTOSEL 6.14 3/8] watchdog: stm32: Fix wakeup source leaks on device unbind
Date: Wed,  4 Jun 2025 07:49:38 -0400
Message-Id: <20250604114944.208828-3-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604114944.208828-1-sashal@kernel.org>
References: <20250604114944.208828-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.9
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_044951_146578_E6D2D8AC 
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


