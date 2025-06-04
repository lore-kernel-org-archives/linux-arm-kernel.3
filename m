Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E69FC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kClIJ3JUqLS7YW9p+3bI32jmPiGOsaJfmEHVOWOlol8=; b=JUVvr+nG4yc9XKr8a5bkj3bbyr
	FND3dbkZXSV6CdDWRDPsXH1u/PUQ8cO2QI88m6pnNTByfaZm8XRm1QjGB+lpsnOWNk/Wko8tMMfYK
	BhWtmvZAhlXlg3aOP6qUPl8PO1Lz1yEilDvDwe+GF9RHTmaTlMYuo73eBqbbmWwH+ag4yqW6cdA1K
	nto9Km2CkM9Vtfot94EF6/VeKnvOrfvowopxGIS5WJLYjui35edLof4fMvQ+R3wKUnFC9Aw6M926U
	SYDSReMAELvtXkBPn/Hh1p3rrwySD5ZgbOI3ZevR2q+Joh2MzMXqnLYt+Lfsm+v/Jsa3YtYnChtbj
	MsX+127A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMepl-0000000CRzH-37EM;
	Wed, 04 Jun 2025 03:30:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcac-0000000C96k-40MX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 01:06:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A9515C3897;
	Wed,  4 Jun 2025 01:04:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44598C4CEED;
	Wed,  4 Jun 2025 01:06:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999205;
	bh=42m6U2aC7xOBQPY5211IT4cf4IJj/Yjxtb+F8ulvFWk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PExc1m+4pEtbUoXDLXkyAyYtxnpm/FYTuhWpYZWPcRJiY+8HILnM/u/xAyKP/pnox
	 0fZMGiwGY8F5Ikv25dIedhNJZb9Fd446YGgJZ/MzFf8ECKOd+gi6qrqwvIgpd/IjVA
	 8qvaIWv0Mt3yoFsGoAAE8fkWhWyKcileUwrj9l5VUtUKrguQgewULXGbA/ljkPtcxi
	 frQxvN3ZldcUi+izq998J0halm2rmSs42+UyRQ3hpWgu9ncVNkf0o5PHChxpBIIS2Y
	 BcSs5Qp5JkSHGtSXGz0zTnhwGhqEfnl95jou5/grJQQCKjBFnPFyvGtt/7pZjzk8vs
	 AiK2wN4O66FCQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Gabor Juhos <j4g8y7@gmail.com>,
	Imre Kaloz <kaloz@openwrt.org>,
	Andrew Lunn <andrew@lunn.ch>,
	Linus Walleij <linus.walleij@linaro.org>,
	Sasha Levin <sashal@kernel.org>,
	gregory.clement@bootlin.com,
	sebastian.hesselbarth@gmail.com,
	brgl@bgdev.pl,
	linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 14/27] pinctrl: armada-37xx: propagate error from armada_37xx_pmx_set_by_name()
Date: Tue,  3 Jun 2025 21:06:07 -0400
Message-Id: <20250604010620.6819-14-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010620.6819-1-sashal@kernel.org>
References: <20250604010620.6819-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.10.237
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180647_078420_730A0411 
X-CRM114-Status: GOOD (  13.98  )
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

From: Gabor Juhos <j4g8y7@gmail.com>

[ Upstream commit 4229c28323db141eda69cb99427be75d3edba071 ]

The regmap_update_bits() function can fail, so propagate its error
up to the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-7-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my analysis of the commit and the code context, here's my
assessment: **YES** This commit should be backported to stable kernel
trees. Here's my extensive analysis: ## Code Analysis The commit changes
`armada_37xx_pmx_set_by_name()` function from: ```c
regmap_update_bits(info->regmap, reg, mask, val); return 0; ``` To: ```c
return regmap_update_bits(info->regmap, reg, mask, val); ``` ## Why This
Should Be Backported 1. **Bug Fix Nature**: This is a clear bug fix that
addresses silent error handling. The `regmap_update_bits()` function
returns an integer error code (0 on success, negative on failure), but
the original code was ignoring this return value and always returning
success (0). 2. **Error Propagation Impact**: The function
`armada_37xx_pmx_set_by_name()` is called from: -
`armada_37xx_pmx_set()` - the main pinmux set function -
`armada_37xx_gpio_request_enable()` - GPIO request handler that already
checks return values 3. **Consistency with Similar Fixes**: Looking at
the historical commits provided: - **Similar Commit #2** (Backport
Status: YES) shows the exact same pattern where
`armada_37xx_gpio_request_enable()` was updated to check return values
from `armada_37xx_pmx_set_by_name()` - This current commit completes
that fix by ensuring the function actually returns errors when they
occur 4. **Critical Subsystem**: This affects the pinctrl subsystem
which is fundamental to GPIO and pin configuration. Silent failures in
pin configuration can lead to: - Hardware not being configured correctly
- GPIO requests appearing to succeed when they actually failed -
Difficult-to-debug hardware issues 5. **Minimal Risk**: The change is
extremely small and contained: - No new functionality added - No
architectural changes - Simple error propagation fix - Maintains
existing API contract 6. **Stable Tree Criteria Compliance**: - ✅ Fixes
an important bug affecting users - ✅ Small, contained change - ✅ No new
features - ✅ Minimal regression risk - ✅ Affects critical kernel
subsystem 7. **Real-World Impact**: Without this fix, regmap failures
(which can occur due to hardware issues, power management problems, or
I2C/SPI communication errors) would be silently ignored, leading to
unpredictable system behavior where pin configurations appear successful
but are actually failed. The commit follows the pattern established in
the historical commit #2 which was marked for backporting, and
represents the completion of proper error handling in this driver's
critical path.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 85a0052bb0e62..da83f188351d3 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -354,9 +354,7 @@ static int armada_37xx_pmx_set_by_name(struct pinctrl_dev *pctldev,
 
 	val = grp->val[func];
 
-	regmap_update_bits(info->regmap, reg, mask, val);
-
-	return 0;
+	return regmap_update_bits(info->regmap, reg, mask, val);
 }
 
 static int armada_37xx_pmx_set(struct pinctrl_dev *pctldev,
-- 
2.39.5


