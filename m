Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70041CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bTCLuufxhoNPpgQih0HdCBaRDJ9/Cd/aLSVqKGpjgGo=; b=ME3RPhoKObgFfFjcC9tmki9pJo
	xRkn5lTvCH7f94pmdnsrUoJdEZHuUgVT0X9rgSCSe4LiZXG1T19VZajYBxUnTHwWtrl3aQg2WASWR
	BH8HF4Ilh5xOErj+eBeeE+4DPJ/ZLWTO7RZH9PQ0id04QrYwtb9EOaBRYMcf0GzT8POL9F7ZQ0kbV
	PgoYV7jtWSNpSV858HBWVPx3IcanLKfTnkwfCPYaLNeK8EYyKMpmSOKikDOor83NwG/aGS80gSc8a
	l5ljAWcqmP6fE0yxpTWd7xyG+6ftW7qktBXrxko2osHbZEVuIwnLZkv4gfoZzHwXNmM/ZctZVwkD5
	iSwHYEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umahX-000000003UK-421S;
	Thu, 14 Aug 2025 16:21:15 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uma9v-0000000HWjU-1RHa
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 15:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C380545D7C;
	Thu, 14 Aug 2025 15:46:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5EE6C4CEEF;
	Thu, 14 Aug 2025 15:46:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755186390;
	bh=LU2AjF6g6ffItPa2bvywFmHrveZHplbThPGtNa1fwAo=;
	h=From:To:Cc:Subject:Date:From;
	b=fkxLPkezxMG4OBdKPxcNEBpXusbQ7qOGmM2EiRkXvhQR7LyxzwdZiL7HdnRWb6dWJ
	 +XHnm2qQgm6HhprZGb8trsrlEz+JQ1DQ7CewnIoq9lrldAP6WhjKycbCTI1ETtcGXl
	 BesJOehqWCxLeTTicF02poMMI+3Nm2C8u0BbyttBnrnGwQVv0q1YqZi9uxhtn2jae/
	 sPxJhjHM14ZaN7ojpydEK2AIX+ZfTBlDBB3i9NhXAmiqmXkG9c/eHJdGhy91AhRn7m
	 oKMzcbYCmYlu6mcmqEb1m9gpQ096oFhYxF7iU25Ratbpo7QE0rBkgX4UeUm97Q7XNL
	 f+R4r8DpQwbGQ==
Received: from sofa.misterjones.org ([185.219.108.64] helo=valley-girl.lan)
	by disco-boy.misterjones.org with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <maz@kernel.org>)
	id 1uma9p-007VqB-Gu;
	Thu, 14 Aug 2025 16:46:25 +0100
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
	Mark Rutland <mark.rutland@arm.com>,
	Alexandru Elisei <alexandru.elisei@arm.com>,
	Steven Price <steven.price@arm.com>
Subject: [PATCH v2 0/4] clocksource: Add standalone MMIO ARM arch timer driver
Date: Thu, 14 Aug 2025 16:46:18 +0100
Message-Id: <20250814154622.10193-1-maz@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 185.219.108.64
X-SA-Exim-Rcpt-To: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, lpieralisi@kernel.org, guohanjun@huawei.com, sudeep.holla@arm.com, rafael@kernel.org, daniel.lezcano@linaro.org, tglx@linutronix.de, mark.rutland@arm.com, alexandru.elisei@arm.com, steven.price@arm.com
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org); SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_084631_422587_D9EB3EF9 
X-CRM114-Status: GOOD (  16.25  )
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

The time has finally come to take a stab at it.

This small series simply creates a new timer driver for the MMIO arch
timer, and only that. It is an actual driver, and not some kludge that
has to run super early (that's what the per-CPU timers are for). This
allows, in turn, a pretty large cleanup of the per-CPU driver, though
there is more to come -- one thing at a time.

As an added bonus, we get a clocksource, which the original code
didn't provide. Just in case it might be useful. The end-result is far
more readable, and about 100 lines smaller.

Patches on top of 6.17-rc1.

* From v1 [1]:

  - Narrow the max delta to something that fits an unsigned long, as
    the core code doesn't deal with 64bit quantities on 32bit CPUs.

  - Collected RBs and TBs from Sudeep, with thanks.

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
 drivers/clocksource/arm_arch_timer_mmio.c | 440 ++++++++++++++
 include/clocksource/arm_arch_timer.h      |   5 -
 6 files changed, 532 insertions(+), 630 deletions(-)
 create mode 100644 drivers/clocksource/arm_arch_timer_mmio.c

-- 
2.39.2


