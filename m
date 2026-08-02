Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57947C55182
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Aug 2026 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=j+cZ37TDJBMZ9L167vXN8x67B74o3YUUPAA7LEgjGp0=; b=myFkfIrMcg4meTmgZeXHPcf/s5
	wLzQoMayOuFVAecuLOsP/ecASIhNc7n/00xZG7/V07k+O2a3j0zS9pi7ws+97/BJ61r3fKXSvDRe2
	wOHQ38YcJjN3EozJ+yFyTirbnbL2IxfiuZrJQ5yMrLW0/ChM+9FWwR0LBqgbHA8BUZkwI3m0dOWGi
	Z+D0RXEY0De/ADBtNISw7CP32STSHtIr4qDHhopMR6mOWTdS4+3XQINY8okKk7LEKDveYJKAneVOx
	EFF8c1g7ODL33TpFLi0zGrbKxHa8i6BffB0nTV+wK1t+u3v3iW+ReL43OheCpGMXq4RUQzDZW9hQU
	GTAXeEmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRW-0000000FqlT-37v9;
	Sun, 02 Aug 2026 16:53:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqZRV-0000000Fqkv-3yBI
	for linux-arm-kernel@lists.infradead.org;
	Sun, 02 Aug 2026 16:53:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 687B360DF8;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AACA1F00A3D;
	Sun,  2 Aug 2026 16:53:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785689621;
	bh=j+cZ37TDJBMZ9L167vXN8x67B74o3YUUPAA7LEgjGp0=;
	h=From:To:Cc:Subject:Date;
	b=bm/rX2FeQ8cnaJx/sM6cwOuREMnd3mBcGuLu7xUnvxAq2ia/ZmZWDRXJcRswHZn5W
	 erJFxBZ0k+U7wJlqfTMTvDvYslyMUe0JQQHUow929tkYK8X9272cfErHRyiZ6A0v+U
	 bberUa2JiLdBibcO5FqrbjFaTMlKW3kyWVzdMDQxNzxcj18pFaBMxsQofy3ZLft/7w
	 ZMLeqiSrcMcJnnwUIMpgzO7QAzD0c0iyoI77+loQgEThLZUizITUOkUVOKM76jfoSU
	 BPks4YbMYKfkfFWsDLnI2RCCZRqR1K8tCgLruEtNBxQ8pJwMbW4D0zrCz4kMEfmR3f
	 LYk8LwyX3wO1g==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1wqZRS-0000000BVIZ-2wd1;
	Sun, 02 Aug 2026 16:53:38 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH v3 0/8] arm64: arch_timer: Improve errata handling
Date: Sun,  2 Aug 2026 17:53:19 +0100
Message-ID: <20260802165327.385217-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
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

This is the third version of this series addressing a couple of
embarrassing bugs in the prolific arm64 timer errata handling
department. See below for the changes since v2.

Time is hard. Timers are harder. As a consequence, we have plenty of
broken counter/timer implementations in the wild, and an
infrastructure to deal with them.

However, what we have today suffers from a number of issues:

- if, on an heterogeneous system, affected CPUs are secondaries, we do
  record their broken state but don't correct anything

- we always play games with preemption in order to access per-CPU
  state, irrespective of the presence of broken CPUs

I hear someone saying "just use a static key to enable the errata and
be done with it". Good call, except that we need to do that from a
CPUHP callback, and that's deadlock central. We can't do it later,
because this could affect the CPU before the workaround is enabled.

However, not everything is lost if we turn the logic on its head:

- always start with the mitigations enabled, even if we don't know of
  any affected CPU

- once all CPUs have been seen once, and that we still haven't
  enabled any workaround, disable the mitigations globally.

With that, a normal kernel boot with all CPUs will quickly switch to
no mitigation on decent HW. If you're booting with CPUs disabled, this
will only kick in once you have booted them all.

Patches on top of 7.2-rc4.

* From v2 [1]:

  - Added a fix for the PMUv3 driver that really wants to know whether
    it is operating with the architected timer. This has been broken
    for some time (since 24ee7607b286b ("arm64/arch_timer: Provide
    noinstr sched_clock_read() functions"))

  - Make arch_timer_read_counter a function, and not just a function pointer

  - Added a command-line option to allow the user to promise that no
    erratum is required (Will)

  - Dropped the internal CPU mask and iterate over the existing
    per-cpu variable (Will)

  - Picked Catalin's Ack, with thanks

[1] https://lore.kernel.org/all/20260508094203.2913880-1-maz@kernel.org/

Marc Zyngier (8):
  clocksource/drivers/arm_arch_timer: Add
    read_sched_clock_is_arch_counter() predicate
  clocksource/drivers/arm_arch_timer: Add a static key indicating the
    need for a runtime workaround
  clocksource/drivers/arm_arch_timer: Convert counter accessors to a
    static key alternative
  clocksource/drivers/arm_arch_timer: Drop the
    arch_counter_get_cnt{p,v}ct_stable() accessors
  clocksource/drivers/arm_arch_timer: Turn arch_timer_read_counter into
    a function
  clocksource/drivers/arm_arch_timer: Add command-line control over the
    counter errata management
  clocksource/drivers/arm_arch_timer: Expose a direct accessor for the
    virtual counter
  arm64: Convert __delay_cycles() to arch_timer_read_vcounter()

 .../admin-guide/kernel-parameters.txt         |  13 ++
 arch/arm64/lib/delay.c                        |   5 +-
 drivers/clocksource/arm_arch_timer.c          | 156 ++++++++++++------
 drivers/perf/arm_pmuv3.c                      |   2 +-
 include/clocksource/arm_arch_timer.h          |  11 +-
 5 files changed, 131 insertions(+), 56 deletions(-)

-- 
2.47.3


