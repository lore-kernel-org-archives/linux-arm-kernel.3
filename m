Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15470EF99EA
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 01:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EYxsW2y+Ba72N45DIKbU3b1z/5MpxlqFpe3dAS5bkXU=; b=erDwuaGtxsuTImjA1Oa22w+ZsQ
	1nxWMIF3GBGZHtNqoJ4FiF73eSXjRr6OhxfkyFa8W9pb3fK0+ESXbEogABpK3OeNFHOdqWiDpDMos
	njPeSZ8rq7UFKkx+N8Z4nyqDDmwL7Txhh0IDxu9kV4hc6eHGbFolurMqKr6TcdM8wWq9a3gOFy3tk
	IQduTTatkTls2Rbw/6So5JVb25uMI8aKDY7FAZvkhWl8EUT5U9NmAmBrE3gZBEedPn17U96co9tFy
	rDgfGRGW7+y7avOVE2CRhn1n2ZYF56S8BJW9KWXSaShOpmEeZAjXsCxZ8VQ50BfNfT2v1eq7T0NHW
	vaaAw4Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr48G-0000000473Z-42XM;
	Sat, 14 Feb 2026 01:07:36 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vr48E-0000000472u-3g6C
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 01:07:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80E9C4071F;
	Sat, 14 Feb 2026 01:07:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FB41C16AAE;
	Sat, 14 Feb 2026 01:07:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771031254;
	bh=AOhoK7iaQfSvFBn6Bfj98kL+WvUmkWg8zJklNjmc44Q=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rTSGFlUHO7aysFGIXp3gp93nKV5Vz/UYi2M/nKEVwHhI/SeUKhKTODmsX0ZYmaoV7
	 M6Fbn0HJraaByjgDS7WaAJRyiIbp9fk0hAR4EH79e3tJ/icis2NudwMJy3+gYy1Hd8
	 i6lwheJsrhmL2fdgkBMnZKCXX+KyKDr3pc/EPQY85ReRZLE03TpQYiU+mR4evSPKt/
	 iXj322sHsKvxNAUn+/8ZPLYBDr3g8CFIlaif1xT/xL5gxkqw2xLSncox5LkYpo1fga
	 oP0nXjtlUAiub8ixd/sVxGDp6AFAqFvdZV21L4CZAZUpJKHMY5kyoLi8bNMCQa0iS6
	 7vo2MkSGag8vA==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Chen Ni <nichen@iscas.ac.cn>,
	Mark Brown <broonie@kernel.org>,
	Sasha Levin <sashal@kernel.org>,
	fengzheng923@gmail.com,
	wens@kernel.org,
	jernej.skrabec@gmail.com,
	samuel@sholland.org,
	linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH AUTOSEL 6.19-6.1] ASoC: sunxi: sun50i-dmic: Add missing check for devm_regmap_init_mmio
Date: Fri, 13 Feb 2026 20:00:02 -0500
Message-ID: <20260214010245.3671907-122-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260214010245.3671907-1-sashal@kernel.org>
References: <20260214010245.3671907-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260213_170734_958952_9D2B878B 
X-CRM114-Status: GOOD (  18.39  )
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

From: Chen Ni <nichen@iscas.ac.cn>

[ Upstream commit 74823db9ba2e13f3ec007b354759b3d8125e462c ]

Add check for the return value of devm_regmap_init_mmio() and return the
error if it fails in order to catch the error.

Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
Link: https://patch.msgid.link/20260127033250.2044608-1-nichen@iscas.ac.cn
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis

### Commit Message Analysis

The commit adds a missing error check for `devm_regmap_init_mmio()` in
the sun50i-dmic audio driver's probe function. The message is
straightforward - it's adding a return value check that was missing.

### Code Change Analysis

The change is a 3-line addition:
```c
if (IS_ERR(host->regmap))
    return dev_err_probe(&pdev->dev, PTR_ERR(host->regmap),
                         "failed to initialise regmap\n");
```

This is inserted right after `devm_regmap_init_mmio()` returns into
`host->regmap`. Without this check, if `devm_regmap_init_mmio()` fails,
`host->regmap` will contain an ERR_PTR value. The driver then continues
execution and eventually uses this regmap pointer in subsequent
operations (regmap reads/writes), which would cause a NULL pointer
dereference or other crash since the ERR_PTR would be interpreted as a
valid pointer.

### Bug Mechanism

If `devm_regmap_init_mmio()` fails (e.g., memory allocation failure
inside regmap), the error pointer gets stored in `host->regmap`. Later,
when the driver tries to use regmap APIs with this invalid pointer, it
will crash. This is a real bug - a missing error check that leads to use
of an error pointer as a valid pointer.

### Severity Assessment

- **Trigger**: `devm_regmap_init_mmio()` would need to fail, which is
  uncommon but possible (memory pressure, internal regmap errors)
- **Consequence**: Kernel crash/oops when the invalid regmap pointer is
  subsequently used
- **Likelihood**: Low probability but non-zero, especially under memory
  pressure

### Stable Kernel Criteria

1. **Obviously correct and tested**: Yes - this follows the exact same
   pattern as all surrounding error checks in the same function. It's a
   textbook missing error check fix.
2. **Fixes a real bug**: Yes - missing error check on a function that
   can fail, leading to use of an ERR_PTR as a valid pointer.
3. **Important issue**: Moderate - it's a potential NULL deref/crash,
   though the trigger condition is uncommon.
4. **Small and contained**: Yes - 3 lines added, single file, no
   behavioral change on success path.
5. **No new features**: Correct - purely defensive error checking.
6. **Applies cleanly**: The change is self-contained with no
   dependencies.

### Risk Assessment

- **Risk**: Extremely low. The change only affects the error path. On
  the success path, behavior is identical.
- **Benefit**: Prevents a kernel crash if regmap initialization fails.
- **Pattern**: This is a very common type of stable fix - adding missing
  error checks in driver probe functions.

### Concerns

This is a fairly minor fix for an uncommon failure path in a specific
ARM SoC audio driver. The user base is limited to Allwinner sun50i
platforms. However, the fix is trivially correct, has zero risk of
regression, and prevents a real (if unlikely) crash.

### Decision

The fix is small, obviously correct, follows existing patterns in the
same function, prevents a potential crash from using an ERR_PTR, and has
essentially zero regression risk. It meets all stable kernel criteria.

**YES**

 sound/soc/sunxi/sun50i-dmic.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/sound/soc/sunxi/sun50i-dmic.c b/sound/soc/sunxi/sun50i-dmic.c
index bab1e29c99887..eddfebe166169 100644
--- a/sound/soc/sunxi/sun50i-dmic.c
+++ b/sound/soc/sunxi/sun50i-dmic.c
@@ -358,6 +358,9 @@ static int sun50i_dmic_probe(struct platform_device *pdev)
 
 	host->regmap = devm_regmap_init_mmio(&pdev->dev, base,
 					     &sun50i_dmic_regmap_config);
+	if (IS_ERR(host->regmap))
+		return dev_err_probe(&pdev->dev, PTR_ERR(host->regmap),
+				     "failed to initialise regmap\n");
 
 	/* Clocks */
 	host->bus_clk = devm_clk_get(&pdev->dev, "bus");
-- 
2.51.0


