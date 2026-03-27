Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E648C10F2865
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 18:06:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYmY5H3PxVEnFHktRsXL2YretB/76NHotHaZd7cN5MU=; b=kNfx4HuGSriGCw15qxa9I85+Wy
	38LlLTsYkSUpYcEQzpkdUGHRtoFsuuLysxEwP2x2ozqpaK+7NDtoFM4yKJIBpWdsZYsh/YUxTJUXd
	0dU7R4MGRlgjyk8l3Fbm1/7eOMARtX2Lu1hSLmYveAb+02rEOk/FpwlLzJbAwK8QwA/zzyPrRZFQ8
	h5AB6kOxr98RR+C2R1AxXhLT75su8WEOl0fFnBvl0l/SY6q12muMO84aY7hxz+jomt1DgYYOTdNV1
	EseNYVxG+9GZIsGvkOtC2Uj77IrnEIU7dRyoCFxLcOsCs+wzz5kHsjP2kylZjktFTSHObmr5QUa0n
	Iq2L92Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BZS-00000007uZr-3trZ;
	Fri, 27 Mar 2026 18:06:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BZQ-00000007uZS-183n;
	Fri, 27 Mar 2026 18:06:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9164E40E20;
	Fri, 27 Mar 2026 18:06:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E870C19423;
	Fri, 27 Mar 2026 18:06:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634767;
	bh=LqR+u200/5OsrAE9eGvzjxPTbZvISbaS/6quzxERjFI=;
	h=From:To:Cc:Subject:Date:From;
	b=rOHw05omIM3a+jptu/Jw5KHZpS7VQ+5L5HrPbJydkd0OEpZ2iVhYOFsZA6rbSAEQc
	 UoV4+KHy9LA7525e0ScoE+AP3bmYliC/rVK6YWEp1meSnNPI138DwjAuIAkiQyMtsX
	 c7l1Mh96IM39Hr+wNVLt3RijuhRm8K2RXyhChw8cgSR9n2WcjOco4/bAld72FaKH1u
	 lm033F9oNxX2GStKgCG+N3gddFkg3UaLTGoVJx6ug45Oy+JniWIkq7RAPmxHFnXqIq
	 FqFTQ6hbsBF7fHa6TS3ZOjYBWR0GjTs/JjyaMZSvnvhZanaRwlbesr++UKH8Iwkyjk
	 1vlLWYRzijUng==
From: Daniel Lezcano <daniel.lezcano@kernel.org>
To: daniel.lezcano@kernel.org,
	tglx@kernel.org,
	zhipeng.wang_1@nxp.com
Cc: shawnguo@kernel.org,
	jstultz@google.com,
	linux-kernel@vger.kernel.org,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	linux-arm-kernel@lists.infradead.org (moderated list:ARM/Mediatek SoC support),
	linux-mediatek@lists.infradead.org (moderated list:ARM/Mediatek SoC support)
Subject: [PATCH v1 resend 0/7] Timer driver module support
Date: Fri, 27 Mar 2026 19:05:52 +0100
Message-ID: <20260327180600.8150-1-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_110608_363996_8774E891 
X-CRM114-Status: GOOD (  20.84  )
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

Converting the timer driver modules requires a particular care
because, depending on the platform, that may be not supported.

A previous study showed we are safe regarding how the module refcount
is held and if THIS_MODULE is set for the clockevent and the
clocksource when they are registered.

It won't be possible to unload a module if a clockevent is registered.

It will be possible to unload a module if only a clocksource is
registered and it is not the current one.

However platforms without architected timers may need the timer driver
to be initialized very early and others can be initialized later. The
former can not be a module and the init function receives a
device_node pointer, there is no device associated and devres is not
used. That results in a lot of rollbacking code where usually it is
where we find bug and resource leaks. The latter can be converted to a
module and uses a module_platform_driver(), thus the init function is
a probe function receiving a struct platform_device pointer parameter.

We end up with two approaches and duplicate code for the init
functions. This is not optimal.

Finally, we have the driver having to be initialized very early on
some platforms and be built as a module on other platforms, resulting
on having two init functions co-existing in the same driver.

This series provides what is needed to move to the same probe function
for early init, builtin and module timers.

A new macro is introduced: TIMER_PDEV_DECLARE() and a new Kconfig
option is added CONFIG_EARLY_TIMER. TIMER_PDEV_DECLARE() will have
different behavior depending on the context:

 - The driver is a module and CONFIG_EARLY_TIMER=no
   --> the driver is a module

 - The driver is builtin and CONFIG_EARLY_TIMER=no
   --> the driver is loaded later

 - The driver is builtin or a module but CONFIG_EARLY_TIMER=yes
   --> the driver is initialized through the timer-probe function

The different timer driver framework functions have their __init
sections removed and the symbols exported in order to be compatible
with the drivers converted into modules.

The series provides a couple of drivers changed. The Mediatek as a
recent requested target which is only compiled-tested. The Rockchip
timer which was tested on a rk3588 in the three different
configurations.

Daniel Lezcano (7):
  clocksource/drivers/timer-probe: Create a platform_device before the
    framework is initialized
  drivers/clocksource/rockchip: Use the TIMER_PDEV_DECLARE() macro
  clocksource/drivers/mmio: Make the code compatible with modules
  clocksource/drivers/timer-of: Make the code compatible with modules
  clocksource/drivers/timer-probe: Add the module support for the
    TIMER_PDEV_DECLARE() macro
  clocksource/drivers/rockchip: Add rockchip timer module support
  clocksource/drivers/mediatek: Convert to module support

 drivers/clocksource/Kconfig          |   7 +-
 drivers/clocksource/mmio.c           |  11 ++-
 drivers/clocksource/timer-mediatek.c |  29 ++++++--
 drivers/clocksource/timer-of.c       |  24 ++++---
 drivers/clocksource/timer-of.h       |   5 +-
 drivers/clocksource/timer-probe.c    |  69 ++++++++++++++++--
 drivers/clocksource/timer-rockchip.c | 101 ++++++++++-----------------
 include/asm-generic/vmlinux.lds.h    |  10 +++
 include/linux/clocksource.h          |  31 ++++++++
 9 files changed, 194 insertions(+), 93 deletions(-)

-- 
2.43.0


