Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F5BBC5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Aug 2026 19:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qj1LpBLHaPSKpBBQikx2X5MWB+eO+B4IPml/AHn48RM=; b=uoEsAi2oERHGstiTcEKfiKt6KA
	8Q/3hWLxFE1xgGxf3D5Dp/C+MfeaT7w0pe7MKkXdX6QNSKlfwAOX9A5wJmpagt2565mE0dU7vA2Ka
	Nt7rXzYnkOWcBqQ8HleDQMMX+guZ5AXRtpE1HWKGueQNbwkAg2RcgIwNaGagKsPoPG2ZjkCtTqezb
	81YWe9mgt0aHHEkTduuV3saZ/ULkFlktCpngYJNip7RroRmwtEvQDRka1FTuNhk9Vppe6Med655IS
	FMJj4tkxi5Mof2SSLBaRIU2nNPp002ii3Nn1PbA1Vby/GSJawHGcCJ7Fe5X7Nn2fBx8EbnLpdY1to
	ps8PmPjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2sb-00000006iKc-2p68;
	Mon, 17 Aug 2026 19:20:17 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww2sZ-00000006iKU-2aiW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Aug 2026 19:20:15 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E12914348D;
	Mon, 17 Aug 2026 19:20:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 091221F000E9;
	Mon, 17 Aug 2026 19:20:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786994414;
	bh=qj1LpBLHaPSKpBBQikx2X5MWB+eO+B4IPml/AHn48RM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QpDMikdxPODQRdzqbNH1qCaPrpy3zSeaUC8wDRyuxujKTmdbnguxSNFyvijWJwZ9L
	 /UieoRZhAI9/4/xAXALDev67NgIXWwSqAKnX2YQRV0BHO71cPtUD2Bhyj4jaiFqoj5
	 sTn8zH8HmCvyhTz+aGsy+dhQQRgcq23CIRLkOU5oBIL+etqg5TfMGPNBCDxkLsax7W
	 91g4Fycr+zFyL+gxK4POUtoXznqlmYNhYw1bH6S22i7wlFg6sHfimpJYD7rcMcW6Uu
	 yQ5PrYcwTvTaVr8cvn0zLl43v0ZG9xjJspc44odGIw5daBR2/X8HLl53l7iZp1IO0+
	 06yZZUkSittsQ==
Date: Mon, 17 Aug 2026 21:20:11 +0200
From: Andi Shyti <andi.shyti@kernel.org>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Michal Simek <michal.simek@amd.com>, 
	Andy Shevchenko <andriy.shevchenko@intel.com>, linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] i2c: xiic: restore runtime PM teardown in remove to
 fix clk WARN flood
Message-ID: <aoNdskB_y8mOj5qr@zenone.zhora.eu>
References: <20260814-i2c-xiic-restore-runtime-pm-teardown-v2-1-7ae5d0c30ff2@nexthop.ai>
 <aoHf6UDxD68YxLYm@zenone.zhora.eu>
 <DKQN4CNOESWV.2XRL8DIC87HYA@nexthop.ai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DKQN4CNOESWV.2XRL8DIC87HYA@nexthop.ai>
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

Hi Abdurraham,

> On Sun, Aug 16, 2026 at 06:14:08PM +0200, Andi Shyti wrote:
> > isn't devm_pm_runtime_set_active_enabled() calling
> > pm_runtime_disable() + pm_runtime_set_suspended() +
> > pm_runtime_dont_use_autosuspend() at teardown?
> 
> It does call all three, but the ordering defeats it, in two places:
> 
> 1. Within the helper's own release, pm_runtime_disable_action() calls
>    pm_runtime_dont_use_autosuspend() *before* pm_runtime_disable() --
>    i.e. while runtime PM is still enabled.
> 
> 2. devres is LIFO, and devm_clk_get_enabled() is registered before
>    devm_pm_runtime_set_active_enabled() in probe(), so the clock's
>    clk_disable_unprepare() release runs *after* the runtime-PM releases.
> 
> pm_runtime_put_sync() in remove() leaves the device RPM_ACTIVE with the
> autosuspend timer armed: rpm_idle() falls through to
> rpm_suspend(RPM_AUTO), the delay hasn't expired, so it just re-arms the
> timer -- runtime_status stays ACTIVE and the clock stays enabled.
> 
> Then the devres teardown runs. pm_runtime_dont_use_autosuspend() clears
> use_autosuspend; update_autosuspend() takes the else branch and calls
> rpm_idle(RPM_AUTO), but now pm_runtime_autosuspend_expiration() returns
> 0, so rpm_suspend() no longer defers and suspends immediately --
> xiic_i2c_runtime_suspend() clk_disable()s the clock, all while runtime
> PM is still enabled. A moment later, further down the LIFO chain,
> devm_clk_get_enabled()'s release does clk_disable_unprepare() on the
> already-disabled clock and clk_core_disable() WARNs, once per device.
> 
> Calling pm_runtime_disable() in remove(), before any devres release
> runs, closes that window: with runtime PM disabled the helper's
> dont_use_autosuspend() can no longer trigger a suspend, so the clock
> stays enabled and the clk release balances it cleanly.
> 
> You're right that set_suspended() and dont_use_autosuspend() are then
> redundant with the helper -- pm_runtime_disable() is the only call that
> has to happen early. So for v3 I'll drop those two and keep just
> pm_runtime_disable() (with a short comment, and the full reasoning in
> the commit log). Does that work for you?

I understand the logic, but this still leaves runtime PM
unbalanced. The explicit pm_runtime_disable() is followed by the
managed cleanup calling pm_runtime_disable() again.

A solution would be to drop the managed runtime-PM helper and
restore the non managed runtime PM setup and teardown. Otherwise,
this ordering issue needs to be addressed in the runtime-PM/clock
framework.

Does that work?

Andi

