Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B21510F2862
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Mar 2026 17:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZYmY5H3PxVEnFHktRsXL2YretB/76NHotHaZd7cN5MU=; b=N+stQUIeTf5OFwb8U0fj+OXFpI
	1o9cIf+LnS0MGLjIGym/lC6RXak/BNZ4rBqAWClAeQ16lmqUjG51bdgvEnTzlqkkI0tdP8mYodh+5
	yFZ3Gt5WGt4VgxsrFCFeNuHAZxVDDZW5Zea0tD69s+nuHcUufY/TG3xM7o+jLTt+FuugpRdFPEONU
	AiA889l4FuS0+DLxJdyo2baK83zn/rrMwiuFJU+GvI8SP3uUvYfnjoOW8hdaBYyoy43Dw+sdR075a
	cokDRLD2B3xmdTD/pHGtyDD3VZkUGOKoIzkNgBD71EbnFzhb8ySxNqGjJnK33WutGxwRNesC3TRLS
	4wIEga0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BPY-00000007tMe-0fQs;
	Fri, 27 Mar 2026 17:55:56 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6BPV-00000007tM9-2AKr;
	Fri, 27 Mar 2026 17:55:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E42C4374D;
	Fri, 27 Mar 2026 17:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43C46C2BC9E;
	Fri, 27 Mar 2026 17:55:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774634152;
	bh=LqR+u200/5OsrAE9eGvzjxPTbZvISbaS/6quzxERjFI=;
	h=From:To:Cc:Subject:Date:From;
	b=rJPl/pZx8GWcHnd9AOmoucWKzz9IF7MPr5K+HaU4FwkUKlypEIVWS1JnRdslBhJzh
	 +dd84oifSTwM8/RrqvapKJ/Gglr1Ln5F6m793G8IIFbx8TK6doz6NMSFzw4Z4S/lLu
	 I1gfEFgYIFZScGozkoMh/aKC6fYnAKulPVEhqoso5kppLpv4EHjTN72t7kptrju4HB
	 llUFyVw4Jyq0P9icENJXvrde8/AKhAMM4oSB5dfzDnbrP6At3Jgnq+AzP+JqisJVNP
	 ycoyFcOm3l4QhZ/zg/H/LmWf/vqSGMkvv1V7aPS094WKj4uSmgPbwz1WrxtI1W7jWb
	 N1tHboxFcZC1w==
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
Subject: [PATCH v1 0/7] Timer driver module support
Date: Fri, 27 Mar 2026 18:55:21 +0100
Message-ID: <20260327175533.3044-1-daniel.lezcano@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260327_105553_597436_F4C5D30E 
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


