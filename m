Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1C17D3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 06:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OZvqaRfjVz2VAdK9pA6LL2oGvyQwtugAzVB5bxI7HEQ=; b=HQlQH8ceaPoQb5GmaEGtIDzRiI
	BVe143tuuady0bvTOH2w3nc32LArN/gngGgueT5TpSnWepaFBjqdjcfk2bGABo0mAQEJwxLtzeSJu
	YwJIOORmJwIZNOjlQjsputyigPYtk4EeZlDSmFGXtoXWyN0xh1W0mjFgvLEylO6nJhRQOqpPQ9Ikh
	KRAXxKcqbJ5JwQATSd8EhgRSn0UA/O7kjDLEAc2mHFNyZ+ctBvQZwfDayrvzATykS45QlehTjsXqo
	EMhZwHrW0e48KyiLc8Mk+tFky9jsgFHZCFCM+ECfkfuXUw5QsW6HCXt9MABPzpRWXoOy2iBgEQQFB
	tI9D/SsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZke2-00000002YkH-1HEQ;
	Sun, 28 Dec 2025 06:52:50 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZke0-00000002YkA-3b5j
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 06:52:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 88DA360055;
	Sun, 28 Dec 2025 06:52:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 436C6C4CEFB;
	Sun, 28 Dec 2025 06:52:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766904767;
	bh=uXXoCbWj+ft3G+bbeyfRGBLWRRFRoHtxxL0vn/VevBo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B2L+Z5OHw3Hd1gGt0E756UjXsqxG8RhwILE1aNPwgIQXC0rK6KeMfUyQmktUja8os
	 bbjyLS3qPSL2ZDi9DkY7SHSNC2x/P76EJRw68nWV5d8rKpqTZ/FxSGWYLsHkq49Hkm
	 LNjIQHEv1gEcMRy6ftiW1g+4ZlGVnRzqj0Imem4WYNL9AJNAMEylRD5WIr2OgVV7nN
	 xPb0W697Zq0lHCMYmgvsp9e74pEDcBrdkHVFRuKK0ZBl+zEgp08u2cZgXyulSSsTzZ
	 Z338+nSqrne2lBAvIHTtuF+JW2Ix+85u99QmaY+bknGr3tyTOX/BiTC3B1n2ljkEd0
	 HO6vtHLspJQ6w==
From: William Breathitt Gray <wbg@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: William Breathitt Gray <wbg@kernel.org>,
	robh@kernel.org,
	conor+dt@kernel.org,
	krzk+dt@kernel.org,
	s32@nxp.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/3] counter: Add STM based counter
Date: Sun, 28 Dec 2025 15:52:40 +0900
Message-ID: <20251228065241.21144-1-wbg@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
References: <20251217075000.2592966-4-daniel.lezcano@linaro.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114; i=wbg@kernel.org; h=from:subject; bh=uXXoCbWj+ft3G+bbeyfRGBLWRRFRoHtxxL0vn/VevBo=; b=owGbwMvMwCW21SPs1D4hZW3G02pJDJkBl5eV3nC/Oe0pY83T8hc6BcdPKfLm9+5mFD+035VV+ kJtXqRjRykLgxgXg6yYIkuv+dm7Dy6pavx4MX8bzBxWJpAhDFycAjCRaB1Ghs1TzRb95zCbxpir seOwT8ghvW/5s1aLfzTbkFv5Y0VSUhHDP3uzJrP45bUXa/adLkhWex/S6BOXfnXF1lOSr0113Nf MYAcA
X-Developer-Key: i=wbg@kernel.org; a=openpgp; fpr=8D37CDDDE0D22528F8E89FB6B54856CABE12232B
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

On Wed, Dec 17, 2025 at 08:49:57AM +0100, Daniel Lezcano wrote:
> The NXP S32G2 automotive platform integrates four Cortex-A53 cores and
> three Cortex-M7 cores, along with a large number of timers and
> counters. These hardware blocks can be used as clocksources or
> clockevents, or as timestamp counters shared across the various
> subsystems running alongside the Linux kernel, such as firmware
> components. Their actual usage depends on the overall platform
> software design.
> 
> In a Linux-based system, the kernel controls the counter, which is a
> read-only shared resource for the other subsystems. One of its primary
> purposes is to act as a common timestamp source for messages or
> traces, allowing correlation of events occurring in different
> operating system contexts.
> 
> These changes introduce a basic counter driver that can start, stop,
> and reset the counter. It also handles overflow accounting and
> configures the prescaler value.
> 
> Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>

Hi Daniel,

It sounds like you're trying to implement a clock for timestamping.
Although the Generic Counter interface is flexible enough to shoehorn a
a clock into its representation, I don't believe it's the right
abstraction for this particular device. Perhaps reimplementing this
driver under the Linux common clock framework would be a better approach
to achieve what you want.

Regardless, if you do pursue a Counter driver you'll need to follow the
Generic Counter paradigm[^1] and define at least three core components:
a Signal, a Synapse, and a Count. Resetting the Count is typically
implemented by defining a struct counter_ops counter_write()
callback[^2], while overflows are typically implemented by pushing
COUNTER_EVENT_OVERFLOW Counter events[^3] that can be watched by
userspace.

William Breathitt Gray

[^1] https://docs.kernel.org/driver-api/generic-counter.html#paradigm
[^2] https://docs.kernel.org/driver-api/generic-counter.html#c.counter_ops
[^3] https://docs.kernel.org/driver-api/generic-counter.html#counter-events

