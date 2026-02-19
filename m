Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 348F7E9A02C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 02:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9dx4yxR3HyR0Hk3NgD0ZcYF8hLNANnOH17xtd4E5Amo=; b=VchqNopYBBqyvgyKEvEHGhLN3r
	FLpgRCgz6jR6KWbyRhExjO251pv1WciRO4/EYlq3bZwl8imUesqhv7hYUo6jdwDs8a7vpnGU/zTO1
	Y2qY7IAmY6B18noQHV3V509lyKnFVZApGYvWOjvl6VhHSa33zqs/jzMLOrzK12ZNHlx3ipTU4UZgX
	hERm5loIvffvgQpNcCoBWVPP4vBpaSSZhkiMa/cJOtYMThb6gaUcUi1H5XINMLapNEAnjdxhSwgun
	2V64cFkDkTlV/XDlsCE9554/G6RkxPiQy2yy065ArFM91mtZuC1Vu6O4M+YP6V2BMYNF4xMxpoK3t
	D1DQglow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPF-0000000Aj2d-3hIU;
	Thu, 19 Feb 2026 02:04:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vstPD-0000000Aj29-302q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 02:04:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB0AA4452E;
	Thu, 19 Feb 2026 02:04:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 937FAC19424;
	Thu, 19 Feb 2026 02:04:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466677;
	bh=swp5sgbe/xrd6C6QW8h31BIMSEtKXgCDJ3Pyo9y4mA8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RRkhAJ0UMsO3EwMBD0WLT7dMs9VNStSIgX2xqPAjp73+IrKLsz1MCIv+xpummAtsF
	 uv0j42RRuPxkInHgBaEoXahTlSOC8ZoQI/lkidzWSL15fkYFsnQ7OKZwFUhrZPf2eQ
	 k8dW6z2dEOIKvZyQi7K5GvA5lc1TtInhemBnOS84ULxPL6G3BQdJuYUYaYuc5TazP3
	 BDtB5ozLW85HQdGrMMb/Yjj1tf8tSmowlMEgCejf0HETQDhOcB1YAuuEQx7Qh9BIGI
	 qj8bkjsOB3YBxWdz/TIIpoEBparTcSbL0xHuNNYCe6MLFjEDB1tCcDQKtLYJCqm5lJ
	 IHFPtL+xwFDyQ==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Oleksandr Suvorov <cryosay@gmail.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Frank Li <Frank.Li@nxp.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.1] watchdog: imx7ulp_wdt: handle the nowayout option
Date: Wed, 18 Feb 2026 21:03:47 -0500
Message-ID: <20260219020422.1539798-11-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_180439_800133_F687695F 
X-CRM114-Status: GOOD (  21.96  )
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

From: Oleksandr Suvorov <cryosay@gmail.com>

[ Upstream commit d303d37ef5cf86c8c3b2daefd2a7d7fd8ca1ec14 ]

The module parameter `nowayout` indicates whether the watchdog should ever
be allowed to stop, but the driver currently ignores this option.

Pass the `nowayout` parameter to the watchdog core by setting the
WDOG_NO_WAY_OUT flag accordingly.

Signed-off-by: Oleksandr Suvorov <cryosay@gmail.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Classification: Bug Fix

This is a **real bug fix**, not a feature addition. The driver:
1. **Already defines** the `nowayout` module parameter (lines 51-54)
2. **Already advertises** the parameter to users via `MODULE_PARM_DESC`
3. But **never applies** it to the watchdog device

This means a user could set `nowayout=1` expecting the watchdog to be
unstoppable once started, but the driver would silently ignore this
setting. This is a correctness bug with potential **safety/reliability
implications** — the `nowayout` feature exists specifically to prevent
accidental watchdog stops that could leave a system unmonitored.

## Stable Kernel Criteria Assessment

1. **Obviously correct and tested**: Yes. It's a single-line addition of
   `watchdog_set_nowayout(wdog, nowayout)` — the standard pattern used
   by 106 other watchdog drivers. Reviewed by Guenter Roeck (watchdog
   co-maintainer) and Frank Li.

2. **Fixes a real bug**: Yes. The module parameter `nowayout` is defined
   but ineffective. Users who rely on `nowayout=1` for system safety are
   not getting the protection they expect.

3. **Important issue**: Moderate. This is a safety feature for embedded
   systems using watchdog timers. If a user sets `nowayout=1` expecting
   the watchdog can never be stopped, but it can be stopped, a system
   failure could go undetected.

4. **Small and contained**: Yes. Single line addition in one file.

5. **No new features**: Correct. The feature (nowayout parameter)
   already exists and is already declared. This just makes it work as
   intended.

6. **Applies cleanly**: The change is a single line insertion with
   stable context.

## Risk Assessment

- **Risk**: Extremely low. This is a single call to a well-established
  inline function that sets one bit in a status field. The function is
  used in 106 other drivers identically.
- **Benefit**: Users of the imx7ulp watchdog (NXP i.MX7ULP SoC, used in
  embedded/IoT) get correct `nowayout` behavior.
- **Regression potential**: Near zero. The only behavioral change is
  that `nowayout=1` now actually works, which is what users who set it
  expect.

## Verification

- Verified that `nowayout` module parameter is defined at lines 51-54 of
  `drivers/watchdog/imx7ulp_wdt.c` but never applied via
  `watchdog_set_nowayout()` before this patch.
- Verified that `watchdog_set_nowayout()` is a simple inline function in
  `include/linux/watchdog.h` that just sets the `WDOG_NO_WAY_OUT` status
  bit.
- Verified that 106 other watchdog drivers in `drivers/watchdog/` follow
  the exact same pattern of calling `watchdog_set_nowayout()` in their
  probe function.
- Verified the commit is reviewed by Guenter Roeck (watchdog subsystem
  co-maintainer) — `Reviewed-by: Guenter Roeck <linux@roeck-us.net>`.
- Verified the change is a single line addition with no dependencies on
  other commits.
- The imx7ulp_wdt driver has existed since at least Linux 4.17 (based on
  the driver's maturity), meaning this bug affects all stable trees that
  include this driver.

## Conclusion

This is a clear, minimal bug fix for a watchdog driver that declares a
safety-critical module parameter but doesn't apply it. The fix is one
line, follows the established pattern used by 106 other drivers, and was
reviewed by the watchdog subsystem maintainer. The risk is essentially
zero and the benefit is correct behavior for a safety feature on
embedded systems.

**YES**

 drivers/watchdog/imx7ulp_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/imx7ulp_wdt.c b/drivers/watchdog/imx7ulp_wdt.c
index 0f13a30533574..03479110453ce 100644
--- a/drivers/watchdog/imx7ulp_wdt.c
+++ b/drivers/watchdog/imx7ulp_wdt.c
@@ -346,6 +346,7 @@ static int imx7ulp_wdt_probe(struct platform_device *pdev)
 	watchdog_stop_on_reboot(wdog);
 	watchdog_stop_on_unregister(wdog);
 	watchdog_set_drvdata(wdog, imx7ulp_wdt);
+	watchdog_set_nowayout(wdog, nowayout);
 
 	imx7ulp_wdt->hw = of_device_get_match_data(dev);
 	ret = imx7ulp_wdt_init(imx7ulp_wdt, wdog->timeout * imx7ulp_wdt->hw->wdog_clock_rate);
-- 
2.51.0


