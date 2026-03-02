Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFBFE9B35A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 10:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FAMVLtvKQhNoJSBHUjQqL98x198MdbMFzyo1v8BwXkA=; b=H79L7mt9qLzio43Cl7fJ/yKZDT
	l+nnbhJeMKhdKgn7GiTX7DXR1B17FRhzB1jUpGDt3tyM8WKw4rXLX9YYrRN7xHJiu9UYY1+TR4MFI
	t+6Dm62QTcBC5PsQ3mgzwabfLSvfOfZbGKU4VC6YTiL0rbz+H2wPNrHCfznzkD5PLF1gIdb7E3OXy
	ahUnUNEs9zM4hZoFnZFehGXYoFVRoXFfoJBHpp6ccTBEanMc3BImrVmJp8HGjx+QO7xd7LcJY04Ca
	bkpT2XuPvHckB4TTjpitL91prIQX3Vn2E9OeHg1Ed+5gmPB+ex4wF3NLmcutXuaTrNCSWvHYfSA1A
	IAdIV2qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X3-0000000Chps-2Dvq;
	Mon, 02 Mar 2026 10:29:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx0X1-0000000Cho2-2Qd3
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 10:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4BEE8405C0;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27130C19423;
	Mon,  2 Mar 2026 10:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772447382;
	bh=q5rEAAcDAHNSoL5x2HuQbTFqfz/wCZgOHdPSY7jfs1Q=;
	h=From:To:Cc:Subject:Date:From;
	b=lPYdN+wZUC5cd9FpB4O/Yj/YvOEML7sp4pku7ILW4RyMaw8+w7MZfq+Lwigdw45Aa
	 s5CA827FtoepI/+/7K9c6Gt5CZQBe0jmpaauI2I/p3RDiCPEkvefSI0GHiYMOBa5Qt
	 t0dT4du/hMzHY6pVevJLot9+jsV2Qiawr/i97cSwJH5G8wvv/WFfJkFDeL9AZz9yTC
	 EF84mVwbz9H8RHKkpMkjO3K6570R0CWDTj5/JL2bUPctpREnsdmLYnjVuwtwH9tIFm
	 33hODYR0zL8K46DJohf546Q+/iu14j4tL3WoOJMUSO9vukVSbc/jKDMUmlgirjVn3S
	 DGrKuEYuiiWgA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.98.2)
	(envelope-from <maz@kernel.org>)
	id 1vx0Wx-0000000FBCc-3syL;
	Mon, 02 Mar 2026 10:29:40 +0000
From: Marc Zyngier <maz@kernel.org>
To: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ben Horgan <ben.horgan@arm.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>
Subject: [PATCH 0/5] arm64: arch_timer: Improve errata handling
Date: Mon,  2 Mar 2026 10:29:32 +0000
Message-ID: <20260302102937.1516059-1-maz@kernel.org>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com, tglx@kernel.org, ben.horgan@arm.com, daniel.lezcano@linaro.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_022943_640995_9A8E464B 
X-CRM114-Status: GOOD (  12.87  )
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

Patches on top of -rc2.

Marc Zyngier (5):
  clocksource/drivers/arm_arch_timer: Add a static key indicating the
    need for a runtime workaround
  clocksource/drivers/arm_arch_timer: Convert counter accessors to a
    static key alternative
  clocksource/drivers/arm_arch_timer: Drop the
    arch_counter_get_cnt{p,v}ct_stable() accessors
  clocksource/drivers/arm_arch_timer: Expose a direct accessor for the
    virtual counter
  arm64: Convert __delay_cycles() to arch_timer_read_vcounter()

 arch/arm64/lib/delay.c               |  5 +-
 drivers/clocksource/arm_arch_timer.c | 99 +++++++++++++++++-----------
 include/clocksource/arm_arch_timer.h |  1 +
 3 files changed, 64 insertions(+), 41 deletions(-)

-- 
2.47.3


