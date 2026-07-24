Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC742C53200
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jul 2026 17:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JSq4QqdlwCc0TWwj4faYjN9NY7rYsJqtYJ7HiwCSAOw=; b=HyN0frfYKvm8v9JOZ1Fuv786RQ
	VVnL0+2KqRMmOPNvTZDor+J03t9JU+66OR/UiK7QZB3MVGn4lPdCF1O0Sux3f5MAU9LkmRwlg5QqV
	oC+zW8yRg54Maxi3htooGd5NkP1cdqrGWK9Zp3iCN/WqCCc6KqttySE4wpPeuK6LZN9cJm29k6Qiq
	jUwA4MxHq133jvax98f3F8lCwx6sX4c2f/wpxHwh/oTwdnayCjcb82qMpUIVpWBFKTXT/sU3GFLZ/
	CNrIi7mFtxoNXjs4TSDilsglkfv255Al8iytuAzcol74eBEfDU03kaB/R/BZHqF54X5u4X8Z+lNiW
	mcSRc6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK1G-0000000GzBk-1JmS;
	Fri, 24 Jul 2026 17:49:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wnK1D-0000000GzB1-2Ohk
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jul 2026 17:49:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D68A339;
	Fri, 24 Jul 2026 10:49:01 -0700 (PDT)
Received: from e121345-lin.cambridge.arm.com (e121345-lin.cambridge.arm.com [10.2.212.23])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E0E473F59E;
	Fri, 24 Jul 2026 10:49:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784915345; bh=BfRf4tstKQfdBZ2mTIhCZTKbr44ScN8NGYw5YXn8tQA=;
	h=From:To:Cc:Subject:Date:From;
	b=StK6VLRXUI8uaU5lynj0dOuCM4zHrCRH2DZQYRRNbFJG+dJLsagwdsU9yhT3pBeuB
	 axwu9QUaLa2l6c+L0ctHyrAng3VMLtJOVlkUe5cMD2w20eEzuDwuaVbeEMwBiGtIfU
	 zXOe8lJJ1ZvySgELLHi91qJAstRbSrtCpi+e71ZY=
From: Robin Murphy <robin.murphy@arm.com>
To: will@kernel.org,
	mark.rutland@arm.com,
	peterz@infradead.org,
	mingo@redhat.com,
	acme@kernel.org,
	namhyung@kernel.org
Cc: alexander.shishkin@linux.intel.com,
	jolsa@kernel.org,
	irogers@google.com,
	adrian.hunter@intel.com,
	james.clark@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] perf: Generic hotplug/cpumask for system PMUs
Date: Fri, 24 Jul 2026 18:48:57 +0100
Message-ID: <cover.1784911757.git.robin.murphy@arm.com>
X-Mailer: git-send-email 2.54.0.dirty
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260724_104907_658386_F88D4B37 
X-CRM114-Status: GOOD (  13.66  )
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

v1: https://lore.kernel.org/linux-perf-users/cover.1784653319.git.robin.murphy@arm.com/

Hi all,

Here's my take on finally trying to clean up the longstanding PMUs vs.
CPU hotplug can of worms. Patch #1 is the thing to look at; patch #2
is included as an example of how it simplifies my "favourite" driver
(in fact arm-cmn actually gets one of the least-negative diffstats on
offer, but it's the one I can test on a box under my desk). I'll save
the remaining bulk-conversion noise for a follow-up if and when.

For simplicity I've framed this around the system PMU use-case, since
consolidating their whole cpumask/migration business is the big win
here, and isn't all that easy to do in separate stages. However, the
design does also allow for any driver to now benefit from implementing
the init_cpu/exit_cpu ops in place of managing their own cpuhp state;
only the automatic filtering and context migration is tied to the new
cpumask-specific scope.

v2 fixes the definite functional mishaps from v1; as for the comments
and other subtleties I'd rather know what real human maintainers think.
I'm still not entirely sure about trying to put ->exit_cpu() calls in
perf_pmu_free() for the sake of symmetry - it looks like it would be a
little fiddly to get right, and as far as the system PMU drivers go,
the ones which aren't already using _nocalls variants for remove/
probe-failure teardown anyway look to be just wrong and making
exactly the mistakes I'm trying to clean up: doing a bunch of busywork
chasing around the affinity of an IRQ that's about to be freed, plus
calling perf_pmu_migrate_context() with an unregistered PMU! I do see
at least arm-spe, coresight-trbe and riscv-sbi actually doing some kind
of vaguely meaningful per-CPU disable, so perhaps the question of
whether it's common enough to be generic or simple enough to open-code
can wait for a future generic hotplug conversion of those?

Thanks,
Robin.


Robin Murphy (2):
  perf: Generic hotplug/cpumask for system PMUs
  perf/arm-cmn: Switch to generic cpumask

 drivers/perf/arm-cmn.c     | 96 +++++++++-----------------------------
 include/linux/perf_event.h | 19 ++++++++
 kernel/events/core.c       | 78 +++++++++++++++++++++++++++----
 3 files changed, 110 insertions(+), 83 deletions(-)

-- 
2.54.0.dirty


