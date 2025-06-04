Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D43EC5AE59
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:24:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z67MK2hw8CYmHfza51Qkzzmlb7JinHhu5hknHP4NwvU=; b=zTaKo+CaDJEOTRnbc/U8PKPZrF
	SnGHO+JWLeDdGXpunUfm4P8LjZF8v9wgGQj5np3L6RzXq/Q3qT0BKWTl7n+WxaTe8swSi6vUt/vqa
	StZULd6FmoO/ZCphntb1JEuMBtr86CKtBeuxTyG8mBJk6HOmLo8sLFOKQNH4LBZ0wpImq/qJJha2D
	P+UFlGHrWzD3CgEXEYrEfC8UNfZTMQZpWB0m8hsU8NKUS/3sML9Fauc1I6W681mKtyyzEt2JqCfar
	2CYiu/GG7YRuw6LIbxajKjwknfmQ3e2JKaDGqCDXtc9VGGlDBbza8n3VGNStYjXMSi/AyQcbWQdTF
	zvpZySlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMejL-0000000CR0w-4B7m;
	Wed, 04 Jun 2025 03:23:55 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcZp-0000000C8yh-3HMF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 01:05:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 15393A4FE56;
	Wed,  4 Jun 2025 01:05:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E585C4CEED;
	Wed,  4 Jun 2025 01:05:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999156;
	bh=a37kPB8cwJkxU5UlrgoMGSghFo/IlFgSk/EJtJ0MBvs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IEOCamwFaaalZb2RchasJchnMcshyOgQncq2d3hE79CgdCEl9KDvS/8reSldjnyxV
	 IVmiX/GUSkARQq75WsvSxURIPL4Zypatn5TTaT1GwRzyVJQjn7Hqqpm8Si+mdmbrDa
	 hCK2jORkL1HsWeRxsureaqzrDFSJZ1JDF+JDnawYKHNdkpMfooybGnbySzSmD68/Kk
	 l7tx7Aa/Mnr8E9CTI8Kupzz/5NKLiDw/rSnUEdB9dk1QvDb0YBNsvg/YcFDNNrxSsB
	 Ry70TVeM6qfGAx0LsqK/Ch3cApwmuo1vO2jKXZD2gwRZiz2QJrNZPTtBAwpNiWdkHC
	 bqoHPTiZ5irOQ==
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
Subject: [PATCH AUTOSEL 5.15 18/33] pinctrl: armada-37xx: propagate error from armada_37xx_gpio_get()
Date: Tue,  3 Jun 2025 21:05:09 -0400
Message-Id: <20250604010524.6091-18-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010524.6091-1-sashal@kernel.org>
References: <20250604010524.6091-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.184
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180557_959828_36506DDF 
X-CRM114-Status: GOOD (  19.03  )
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

[ Upstream commit 57273ff8bb16f3842c2597b5bbcd49e7fa12edf7 ]

The regmap_read() function can fail, so propagate its error up to
the stack instead of silently ignoring that.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-4-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my comprehensive analysis, here is my determination: **YES**
This commit should be backported to stable kernel trees. Here's my
detailed analysis: ## Analysis of the Code Change The commit fixes a
clear bug in the `armada_37xx_gpio_get()` function in
`drivers/pinctrl/mvebu/pinctrl-armada-37xx.c`. The specific changes are:
1. **Before**: `regmap_read(info->regmap, reg, &val);` - ignores return
value 2. **After**: `ret = regmap_read(info->regmap, reg, &val); if
(ret) return ret;` - properly handles errors ## Backport Suitability
Assessment ### ✅ **Meets Stable Tree Criteria:** 1. **Bug Fix**: This
clearly fixes a real bug where regmap read failures are silently
ignored, potentially returning garbage data to userspace. 2. **Small and
Contained**: The change is minimal (3 lines added) and extremely
focused, affecting only error handling in a single function. 3. **Low
Regression Risk**: The change only adds error checking where none
existed before. It cannot introduce new bugs - it can only prevent
incorrect behavior. 4. **No Architectural Changes**: This is purely
error handling improvement with no changes to the driver's architecture
or interfaces. 5. **Important Subsystem**: GPIO operations are
fundamental and used by many kernel subsystems and userspace
applications. ### ✅ **Follows Established Kernel Patterns:** My analysis
of other GPIO drivers shows this error handling pattern is **universal**
across the kernel: - `gpio-arizona.c`, `gpio-bd71828.c`, `gpio-
madera.c`, `gpio-max77620.c`, `pinctrl-axp209.c`, and many others -
**Every examined driver** checks `regmap_read` return values in GPIO get
functions - The armada-37xx driver was an outlier in ignoring these
errors ### ✅ **Real-World Impact:** This fix addresses scenarios where:
- **Hardware communication failures** (I2C/SPI bus errors, device power
issues) - **Device disconnect events** (hot-plug scenarios, power
management) - **Timing/electrical issues** causing intermittent regmap
failures Without this fix, `gpio_get()` would return potentially garbage
values (using uninitialized `val`) when hardware communication fails,
leading to incorrect GPIO state reporting to userspace. ### ✅
**Reference Similar Commits:** Looking at the provided examples, this
commit closely resembles: - **Similar Commit #3 (Status: YES)**: "Fix
irq_of_parse_and_map() return value" - fixes incorrect error handling -
**Similar Commit #1 (Status: YES)**: "Convert to use dev_err_probe()" -
improves error handling patterns Both are small, focused error handling
improvements that were deemed suitable for backporting. ## Conclusion
This is a textbook example of a stable tree candidate: it's a small,
safe bug fix that brings the driver in line with kernel-wide error
handling standards, addresses real hardware failure scenarios, and has
zero risk of regression while providing tangible benefits for system
reliability.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 85b37f1b8a4ec..ff293f962d170 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -437,11 +437,14 @@ static int armada_37xx_gpio_get(struct gpio_chip *chip, unsigned int offset)
 	struct armada_37xx_pinctrl *info = gpiochip_get_data(chip);
 	unsigned int reg = INPUT_VAL;
 	unsigned int val, mask;
+	int ret;
 
 	armada_37xx_update_reg(&reg, &offset);
 	mask = BIT(offset);
 
-	regmap_read(info->regmap, reg, &val);
+	ret = regmap_read(info->regmap, reg, &val);
+	if (ret)
+		return ret;
 
 	return (val & mask) != 0;
 }
-- 
2.39.5


