Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45EACC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 10:31:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TnTJYFd3ykPUbgMhCghpq45CT2aJ0C3b7XhF03Le8p8=; b=R+onfIidKeqx4e9vna5R34tXnU
	lmHfNu1VYMaKq4XDqkMHTTPpg/NGsOp70dETJ8m+RHTNI0wbkkKOFtOBX5nU8dotyqZ7vbTOdrHxt
	1dOaZO/JTYdRFW+qNS6Aw2fIKqmyF0ZzHCJFzpbrBZcP0GNlVfxC+FikWyOIPlDZJPnzcH1/nCfTz
	H89J2Gm0wFIlqZ8YgWCvdLT9WBWkzuzzFgfOuAt9k9HCru2p94BNUteQaDVpz+zuEV0HX3eO7ZNSQ
	qhGKGAk1yaw8Dev9rZNnLUHYClLhZ63sCXFKX6C2/ZMSHvdxw1wowOACqECpgkdRHdcLn8LaGJCG+
	icoV+2KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDwT-00000008tUO-2epM;
	Mon, 13 Jul 2026 10:31:17 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjDwQ-00000008tTO-06o0
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Jul 2026 10:31:16 +0000
Date: Mon, 13 Jul 2026 12:31:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1783938669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TnTJYFd3ykPUbgMhCghpq45CT2aJ0C3b7XhF03Le8p8=;
	b=S6P/q8Mz5yWsNUY5WzF0O+VnLj1I1ew+amkReHeJKEUerqSdIMEz4nWCu1mytvMQU1yKMX
	g1VSUTT4rGQqWc7FJiGY7/aYfpYGEVWj0v51mYXEgmHXsMaqKQxZ4bxXx7TkE5VyOrTh/F
	ZxcVGRs4gixKNXFo5mnKT8uqKf5uA2KBpSSSudNcT947IQNs2MXhRCkZMEFpJZ/+nLQL0Z
	6AaHEROInIKVwtyGFY4iizezFZoJrtvkRFd11nMcKW1AS+tj0qNfGZh0m/dlnCYrOBYWxy
	aZ9fnW7b3CWmgCm3/cQYr+Mu9QMmsZlqIqOpR0dKP1F4FWAmozYsZusya13x7g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1783938669;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TnTJYFd3ykPUbgMhCghpq45CT2aJ0C3b7XhF03Le8p8=;
	b=oW662zGaP8R/BKUNGQf5ru8cvBBiUuVwpzd3+LGgmrof7ZHUE82UmEhFCNSCZRuOqnB+0N
	Mfkzbp8VobvzFnDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	"Uwe Kleine-K.nig" <ukleinek@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH] clocksource/drivers/samsung_pwm: switch to
 raw_spinlock_t type
Message-ID: <20260713103107.Yc-I0-xh@linutronix.de>
References: <CGME20260713085705eucas1p26616e64d55f903a6f87dd67e8f8da1a9@eucas1p2.samsung.com>
 <20260713085653.1145015-1-m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260713085653.1145015-1-m.szyprowski@samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_033114_214313_668A999E 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
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

On 2026-07-13 10:56:53 [+0200], Marek Szyprowski wrote:
> Samsung PWM timer might be used as a clock source on some legacy systems.
> When PREEMPT_RT is enabled on ARM, regular spinlock is converted to a
> sleeping lock (mutex-based), which must not be used in atomic context
> such as hard interrupt handlers. Switch the samsung_pwm_lock to the
> raw_spinlock, which remains a true non-sleeping spinlock even
> under PREEMPT_RT.
> 
> Fixes: 7aac482e6290 ("clocksource: samsung_pwm_timer: Make PWM spinlock global")
> Fixes: f11899894c0a ("clocksource: add samsung pwm timer driver")
> Signed-off-by: Marek Szyprowski <m.szyprowski@samsung.com>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian

