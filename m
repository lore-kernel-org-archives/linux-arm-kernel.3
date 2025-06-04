Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49017C5AD49
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Jun 2025 03:06:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FycR57ukiuEOmX0Va3Y/4gfWylE6tM7oBosR6mjtS3M=; b=U5tZERthcpyb7I5ysgcb03Fw8I
	Om8YeqqyqyFABrT0JTfqN03tRLQ0fnz10fao0RyohHpFSv6FmKTWBFBmR87yBak9cZcMFj0yl5XAe
	vtsdZgyEtOvK1VL5CsP3JBYCMeqggW+euem1p46UqOhQ5Bdp7WUQBH3xANKUE6TyR+jg/gayRP65w
	jPEdDIotGgSWPqYDuAc28oRl+FGMA9wquv3SuIzJwO3O0VcO/N3vFMufTj7pZkuJHGDDI9ovvs7ps
	QNF6KoxswhszVGGHtWOs7vFafaE5QXF6M0PX4N7oSs4Oi3wIoF0Thual62TzUt9CjR934HqLKemv4
	G7oRmZsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMeS0-0000000CPOs-0oFZ;
	Wed, 04 Jun 2025 03:06:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uMcYh-0000000C8nn-3SRT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Jun 2025 01:04:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 30C9044DC1;
	Wed,  4 Jun 2025 01:04:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B767DC4CEEF;
	Wed,  4 Jun 2025 01:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748999087;
	bh=X7cQAjTYtYTr/Jc7q5G7JsSl0ou3tjoDS9lu+kuPXnM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XeiwTU1J06mpAOVIJP7RsX1AduP4aS7ZGYJMtUjyM2nCL2uvd9rNghmgei6lzz4RN
	 qSCNYgkFMIwgrivORlKWRHiUlr585QV8tKcn+tqIU7iX6bi5L7SQ5IX7GVsYEjVtT4
	 O39xiDIdKtUvcy9s5aN2ErItXwC20eLhd4/b8SSO/KRnypb/ECeUN5W4YrpmNJhz5i
	 CqABQg6uCQtCV7z0sp32D6sNFm1bNcmOI4TMAz4yAsqdG5c7jLNn2thq2NzYElZBeO
	 ysn3Cpb5lilQ35TBfQgGfkveTSypQKpJG8TFidccV9HPQdNOD9AFwauVOux6Zego3E
	 JnI+t1zQ1xQJQ==
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
Subject: [PATCH AUTOSEL 6.1 23/46] pinctrl: armada-37xx: propagate error from armada_37xx_pmx_gpio_set_direction()
Date: Tue,  3 Jun 2025 21:03:41 -0400
Message-Id: <20250604010404.5109-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250604010404.5109-1-sashal@kernel.org>
References: <20250604010404.5109-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.1.140
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250603_180447_910309_349C8750 
X-CRM114-Status: GOOD (  20.09  )
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

[ Upstream commit bfa0ff804ffa8b1246ade8be08de98c9eb19d16f ]

The armada_37xx_gpio_direction_{in,out}put() functions can fail, so
propagate their error values back to the stack instead of silently
ignoring those.

Signed-off-by: Imre Kaloz <kaloz@openwrt.org>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>
Link: https://lore.kernel.org/20250514-pinctrl-a37xx-fixes-v2-5-07e9ac1ab737@gmail.com
Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

Based on my comprehensive analysis, here is my determination: **YES** ##
Extensive Analysis for Backport Recommendation ### 1. **Bug Severity and
Real User Impact** This commit fixes a **genuine bug** where the
`armada_37xx_pmx_gpio_set_direction()` function silently ignores errors
from GPIO direction setting operations. The current code at lines
476-481 shows: ```c if (input) armada_37xx_gpio_direction_input(chip,
offset); // Return value ignored else
armada_37xx_gpio_direction_output(chip, offset, 0); // Return value
ignored return 0; // Always returns success regardless of actual result
``` This silent failure can cause **real user-visible problems**: - GPIO
pins may remain in the wrong direction (input vs output) without any
indication - Hardware peripherals controlled by these GPIOs may
malfunction - Applications believe GPIO operations succeeded when they
actually failed - No error reporting prevents proper debugging of
hardware issues ### 2. **Code Change Assessment - Small and Contained**
The fix is **minimal and surgical**: - Adds only one variable
declaration (`int ret`) - Changes two function calls to capture return
values - Replaces `return 0` with `return ret` - **No architectural
changes or new features** - **No changes to external APIs or data
structures** This precisely matches the stable tree criteria for small,
contained fixes. ### 3. **Comparison with Historical Similar Commits**
Looking at the provided examples: - **Similar Commit #1** (Status: YES):
Also fixes GPIO direction callback behavior in the same driver - this
establishes precedent for backporting armada-37xx GPIO fixes - **Similar
Commits #4 & #5** (Status: NO): These fix similar error propagation
issues in different drivers, but the "NO" status appears to be due to
them being newer cleanup patches rather than fixing actual bugs ### 4.
**Pattern Recognition from Kernel Tree Analysis** My examination of the
kernel repository reveals this is **part of a systematic fix series**
addressing error propagation throughout this driver. I found related
commits: - `4229c28323db`: "propagate error from
armada_37xx_pmx_set_by_name()" (marked YES in autosel.txt) -
`6481c0a83367`: "propagate error from armada_37xx_gpio_get_direction()"
(marked YES in autosel.txt) This indicates the kernel maintainers
consider these error propagation fixes important enough for stable
backporting. ### 5. **Risk Assessment - Minimal Regression Risk** The
change has **very low regression risk**: - Only affects error handling
paths that were previously broken - If the underlying GPIO operations
were succeeding before, they continue to succeed - If they were failing
before (but silently), now they properly report the failure - **No
functional behavior changes when hardware operates correctly** - The
worst case is that previously silent failures now get reported (which is
the desired behavior) ### 6. **Critical Subsystem Impact** This affects
the **pinctrl/GPIO subsystem**, which is critical for: - Hardware
initialization and control - Board-specific functionality - Device
driver operation - Embedded system reliability Silent failures in this
subsystem can cause hard-to-debug issues that affect system stability.
### 7. **No Explicit Stable Backport Indicators** While the commit
message lacks explicit `Cc: stable@vger.kernel.org` or `Fixes:` tags,
this doesn't disqualify it. Many important bugfixes lack these tags, and
the automated selection process (as evidenced by autosel.txt) is
designed to catch such cases. ### 8. **Meets All Stable Tree Criteria**
✅ **Fixes important bug**: Silent GPIO failures can cause real hardware
issues ✅ **Minimal risk**: Only improves error reporting, no functional
changes ✅ **Small and contained**: 4-line change in a single function ✅
**No architectural changes**: Pure error handling improvement ✅
**Affects critical subsystem**: GPIO/pinctrl is fundamental to hardware
operation ### Conclusion This commit should be backported because it
fixes a genuine bug where hardware failures are silently ignored,
potentially causing real user issues. The fix is small, safe, and aligns
with similar commits that have been marked for stable backporting. The
change only improves error handling without modifying functional
behavior, making it an ideal candidate for stable tree inclusion.

 drivers/pinctrl/mvebu/pinctrl-armada-37xx.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
index 536166b78e377..1d26fd6c5665b 100644
--- a/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
+++ b/drivers/pinctrl/mvebu/pinctrl-armada-37xx.c
@@ -472,16 +472,17 @@ static int armada_37xx_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 {
 	struct armada_37xx_pinctrl *info = pinctrl_dev_get_drvdata(pctldev);
 	struct gpio_chip *chip = range->gc;
+	int ret;
 
 	dev_dbg(info->dev, "gpio_direction for pin %u as %s-%d to %s\n",
 		offset, range->name, offset, input ? "input" : "output");
 
 	if (input)
-		armada_37xx_gpio_direction_input(chip, offset);
+		ret = armada_37xx_gpio_direction_input(chip, offset);
 	else
-		armada_37xx_gpio_direction_output(chip, offset, 0);
+		ret = armada_37xx_gpio_direction_output(chip, offset, 0);
 
-	return 0;
+	return ret;
 }
 
 static int armada_37xx_gpio_request_enable(struct pinctrl_dev *pctldev,
-- 
2.39.5


