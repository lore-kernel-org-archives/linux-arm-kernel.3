Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BC41C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Aug 2025 13:14:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xZFtem5ebUjYfHi+i54eZiZFM2KXuBAa+LchkumXljE=; b=vPLqcHSBBxzm6hqGDnqtPQ4xKc
	P6KRVRPtwzt/rgJcDL0b8fcBWwQoGz0r5C41SaVQ3mMWHOpWV9YDr7tb6WoptK4w2mY+nf+95boVR
	qh1szbs1okicBgBUIocCod9IL5lm1yZogo0E9rHdn6ksNJKsNXD0mqshCzQK/miAY061v+ENECyde
	Pyzs4payyCqyp1wIqtboDrRaubFhuUrSLfurfd2hA9WfqJe5ctxIX0JZtQsW2R4bKl6hjuwnHh2Rz
	Re5fBHiKmpvR/emAH/LXzFJBi0QZc2FAcPlK+nxGqTrCawnEcZPxRerUF/Q0J5e6lPQn7v+bo8L1o
	4D7G3KVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHVC-0000000CoFg-04s5;
	Tue, 05 Aug 2025 13:14:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujHQT-0000000CnQR-4BQs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Aug 2025 13:09:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 18B3A601D9;
	Tue,  5 Aug 2025 13:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 396ACC4CEF0;
	Tue,  5 Aug 2025 13:09:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399396;
	bh=Qyw2Seyv99FKHqkQGzgzhkf96Afcfp/hz1VcHx8L4aU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oa90mp6nH2jmdGDeDx1W6U4hN+VoFrpFYw8lSlcVrLD7Kstvd5GNfHl2W+ARRl/Ga
	 55iTAvlm8ApdzRQ+/YVnX8SVLD5+zeItIpXqmnm9PHBhyo6w6VD0e7isyWKeAhvnmL
	 b9mkh/z15OXSaT1aXtGJXO4bEYanDb6m5SHhIQ8r0gRg6EW8HjdXG1s7WY+JBf5oPv
	 gKkXplf0G9px9l1bT0u/WECjJcj3mJnKuUtAt1UuMeUdulH0Tt1NBglRnjfG5DcT0n
	 /ZHhp79srmnIb7ZleUdNF+3WYWlbreS9Kv58xWxnJCOq30ArtYOqmiSiEW9hIEC/QS
	 DBUCEBVdOEDxw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Cheick Traore <cheick.traore@foss.st.com>,
	Antonio Borneo <antonio.borneo@foss.st.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH AUTOSEL 6.16-5.4] pinctrl: stm32: Manage irq affinity settings
Date: Tue,  5 Aug 2025 09:08:40 -0400
Message-Id: <20250805130945.471732-5-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit
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

From: Cheick Traore <cheick.traore@foss.st.com>

[ Upstream commit 4c5cc2f65386e22166ce006efe515c667aa075e4 ]

Trying to set the affinity of the interrupts associated to stm32
pinctrl results in a write error.

Fill struct irq_chip::irq_set_affinity to use the default helper
function.

Signed-off-by: Cheick Traore <cheick.traore@foss.st.com>
Signed-off-by: Antonio Borneo <antonio.borneo@foss.st.com>
Link: https://lore.kernel.org/20250610143042.295376-3-antonio.borneo@foss.st.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

Based on my analysis, here's my assessment:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

1. **Fixes a real bug**: The commit message explicitly states "Trying to
   set the affinity of the interrupts associated to stm32 pinctrl
   results in a write error." This is a functional bug that affects
   users trying to configure IRQ affinity on STM32 platforms.

2. **Small and contained fix**: The change is minimal - just adding a
   single line:
  ```c
  .irq_set_affinity = IS_ENABLED(CONFIG_SMP) ?
  irq_chip_set_affinity_parent : NULL,
  ```
  This is a one-line fix that adds the missing callback to the irq_chip
  structure.

3. **Follows established patterns**: My analysis shows that other
   GPIO/pinctrl drivers already implement this callback in the same way:
   - `drivers/pinctrl/renesas/pinctrl-rzg2l.c`
   - `drivers/gpio/gpio-thunderx.c`
   - `drivers/gpio/gpio-msc313.c`

   The STM32 driver was missing this standard callback that other
similar drivers have.

4. **No architectural changes**: This is purely a bug fix that enables
   existing kernel functionality (IRQ affinity setting) to work
   properly. It doesn't introduce new features or change any
   architecture.

5. **Minimal regression risk**: The fix uses the standard
   `irq_chip_set_affinity_parent` helper function that's already well-
   tested in the kernel. The conditional compilation with
   `IS_ENABLED(CONFIG_SMP)` ensures it's only enabled on SMP systems
   where it's relevant.

6. **Related to known issues**: My search found related commits like
   `3e17683ff4a8` ("irqchip/stm32-exti: Fix irq_set_affinity return
   value") showing that the STM32 platform has had IRQ affinity issues
   that needed fixing.

7. **Clear user impact**: Without this fix, users cannot set IRQ
   affinity for GPIO interrupts on STM32 platforms, which can impact
   system performance optimization and interrupt load balancing on
   multi-core STM32 systems.

The commit meets all the stable tree criteria: it fixes an important
bug, is small and self-contained, has minimal risk, and doesn't
introduce new functionality. This is exactly the type of fix that should
be backported to ensure stable kernels have proper functionality.

 drivers/pinctrl/stm32/pinctrl-stm32.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/stm32/pinctrl-stm32.c b/drivers/pinctrl/stm32/pinctrl-stm32.c
index ba49d48c3a1d..e6ad63df82b7 100644
--- a/drivers/pinctrl/stm32/pinctrl-stm32.c
+++ b/drivers/pinctrl/stm32/pinctrl-stm32.c
@@ -411,6 +411,7 @@ static struct irq_chip stm32_gpio_irq_chip = {
 	.irq_set_wake	= irq_chip_set_wake_parent,
 	.irq_request_resources = stm32_gpio_irq_request_resources,
 	.irq_release_resources = stm32_gpio_irq_release_resources,
+	.irq_set_affinity = IS_ENABLED(CONFIG_SMP) ? irq_chip_set_affinity_parent : NULL,
 };
 
 static int stm32_gpio_domain_translate(struct irq_domain *d,
-- 
2.39.5


