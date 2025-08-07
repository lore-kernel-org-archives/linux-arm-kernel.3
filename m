Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60531C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 16:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FqbYUVSAbJPljwEAE246g9/jDw2Sq47orfNPoCfi+c8=; b=gJCcWp/TMKb9CLDyIAp+r1IzcC
	+Uq/VTx167HPxPmgQZzxRiavSJL7FiywktDBSwRORro+OS+K7wTUVi8+uS+Z2zaERzls7irf7ufTk
	V+t5idmkX89+RlcnWVwtZNdRsNhxmjjMLw5KnspSbv5EhTo3t5UyAMi3ynduqJYf+TiW/No7/V8IF
	D5Ua/bdothPulyjFw+3l/Ba08H9QXfAs7Jq+7Qo4LMoNMQ+77+ttKDvydMDEvMc/jTgQN8DJfvPYf
	sCNEUBTGAU1zpEKQNIh008GNNeoI+PTZUoeOmMRZRynXmJgJG5ma3Rn0AOaIP7VY2tViPlqC9WkXy
	brUsw5ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk39u-000000015Cz-2zsr;
	Thu, 07 Aug 2025 16:08:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uk34r-000000014TJ-3Eng
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 16:02:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4DC0043518;
	Thu,  7 Aug 2025 16:02:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28387C4CEEB;
	Thu,  7 Aug 2025 16:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754582569;
	bh=3JhWBhxd2u70kwy8Fen3Rx2vHh8BecM7RUudztSQYwM=;
	h=From:To:Cc:Subject:Date:From;
	b=UBU4NeT60VIIRgJIaHmZJrxCXiGEDs0rTAOjkkvGNBHiMCwfi5y+xN6dQ2WC+tN+z
	 uKQ18YQQLngICsSV2A764i+YeYeYewuyQLmSkikL8V66E4iyiGk2i3bvfnTQMgw96E
	 9uLSo1wUAUC+fC4a+Y9wNbcsKzili1JXadhgxtvbg7TyIBPlf9vTmGOa6SxckIQhPP
	 d+cE1c+BzvOfUqipMk2p3NQlTgE2o6xaSOQGPJv5vgnu4muUJb90H3//faatTTfzYQ
	 v1ps+0foHb2ZrlwSmYVgv50yKHGaHUOinEF/3/aowQVAdry3z6MxQLEAFnD2yLpEaq
	 tNeeFle/pynBA==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uk34o-004zf7-JQ;
	Thu, 07 Aug 2025 17:02:46 +0100
From: Marc Zyngier <maz@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Hanjun Guo <guohanjun@huawei.com>,
	Sudeep Holla <sudeep.holla@arm.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Mark Rutland <mark.rutland@arm.com>
Subject: [PATCH 0/4] clocksource: Add standalone MMIO ARM arch timer driver
Date: Thu,  7 Aug 2025 17:02:39 +0100
Message-Id: <20250807160243.1970533-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_090249_827919_0D00DB62 
X-CRM114-Status: GOOD (  15.45  )
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

For the past 10 years, both Mark and I have been lamenting about the
sorry state of the badly named "arch_timer" driver, and about the way
the MMIO part is intricately weaved into the system-register part.

The time has finally come to have a stab at it.

This small series simply creates a new timer driver for the MMIO arch
timer, and only that. It is an actual driver, and not some kludge that
has to run super early (that's what the per-CPU timers are for). This
allows, in turn, a pretty large cleanup of the per-CPU driver, though
there is more to come -- one thing at a time.

As an added bonus, we get a clocksource, which the original code
didn't provide. Just in case it might be useful. The end-result is far
more readable, and about 100 lines smaller.

Patches on top of 6.16.

Marc Zyngier (4):
  ACPI: GTDT: Generate platform devices for MMIO timers
  clocksource/drivers/arm_arch_timer: Add standalone MMIO driver
  clocksource/drivers/arm_arch_timer_mmio: Switch over to standalone
    driver
  clocksource/drivers/arm_arch_timer_mmio: Add MMIO clocksource

 MAINTAINERS                               |   1 +
 drivers/acpi/arm64/gtdt.c                 |  29 +-
 drivers/clocksource/Makefile              |   1 +
 drivers/clocksource/arm_arch_timer.c      | 686 ++--------------------
 drivers/clocksource/arm_arch_timer_mmio.c | 439 ++++++++++++++
 include/clocksource/arm_arch_timer.h      |   5 -
 6 files changed, 531 insertions(+), 630 deletions(-)
 create mode 100644 drivers/clocksource/arm_arch_timer_mmio.c

-- 
2.39.2


