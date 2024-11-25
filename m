Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EA2CD3B7F5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 Nov 2024 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=7cZMijM0HOle3YpSwj8X5Gj3Rcf4rXAd+BgVTrKgAdU=; b=DG0Vnh1tiFfScG7pYO/vxks2Zd
	WTJbRNKHjl1Eub+tbvNss41iuxAfAoH9CxKLPWGciwuzxs6U9NKtEMQtp1IDbscYsorWmGO9B4sXW
	0hM7KxKv1q1m1UGxUI8qYvkclP7rz4yPZYDTgHAfApLBB4nCV4uaoohVeQ+C3WO/Ld0V4KMXjMc1k
	/40D8cGOH1/h/PCH7m2S+Rx0keQ8XD01GjBseA7AxeM8MnxqSVeRRpcXHt+l9AM46oG7ril4SyW6B
	oYyUOgoST1Ok3w6MzKik1KwCAWpUCQSHP4TadBq/29KOZQyj1nnbMBRfMnNFxShgj33EFaSb6LhEd
	ukZVZtXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFW9r-00000007hji-2Mi9;
	Mon, 25 Nov 2024 10:17:31 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFVhf-00000007dhq-3oom
	for linux-arm-kernel@lists.infradead.org;
	Mon, 25 Nov 2024 09:48:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF6F41692;
	Mon, 25 Nov 2024 01:48:50 -0800 (PST)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id B92CF3F66E;
	Mon, 25 Nov 2024 01:48:18 -0800 (PST)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	nd@arm.com,
	Yeoreum Yun <yeoreum.yun@arm.com>
Subject: [PATCH 0/9] coresight: change some driver' spinlock type to raw_spinlock_t
Date: Mon, 25 Nov 2024 09:48:07 +0000
Message-Id: <20241125094816.365472-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241125_014823_988299_5371E678 
X-CRM114-Status: UNSURE (   7.66  )
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

In some coresight drivers, drvdata->spinlock can be held during __schedule()
by perf_event_task_sched_out()/in().

Since drvdata->spinlock type is spinlock_t and
perf_event_task_sched_out()/in() is called after acquiring rq_lock,
which is raw_spinlock_t (an unsleepable lock),
this poses an issue in PREEMPT_RT kernel where spinlock_t is sleepable.

To address this,change type drvdata->spinlock in some coresight drivers,
which can be called by perf_event_task_sched_out()/in(),
from spinlock_t to raw_spinlock_t.

Levi Yun (9):
  coresight: change coresight_device lock type to raw_spinlock_t
  coresight-etm4x: change etmv4_drvdata spinlock type to raw_spinlock_t
  coresight: change coresight_trace_id_map's lock type to raw_spinlock_t
  coresight-cti: change cti_drvdata spinlock's type to raw_spinlock_t
  coresight-etb10: change etb_drvdata spinlock's type to raw_spinlock_t
  coresight-funnel: change funnel_drvdata spinlock's type to
    raw_spinlock_t
  coresight-replicator: change replicator_drvdata spinlock's type to
    raw_spinlock_t
  coresight-tmc: change tmc_drvdata spinlock's type to raw_spinlock_t
  coresight/ultrasoc: change cti_drvdata spinlock's type to
    raw_spinlock_t

 .../hwtracing/coresight/coresight-config.c    |  21 +-
 .../hwtracing/coresight/coresight-config.h    |   2 +-
 drivers/hwtracing/coresight/coresight-core.c  |   2 +-
 .../hwtracing/coresight/coresight-cti-core.c  |  65 +-
 .../hwtracing/coresight/coresight-cti-sysfs.c | 135 +++--
 drivers/hwtracing/coresight/coresight-cti.h   |   2 +-
 drivers/hwtracing/coresight/coresight-etb10.c |  62 +-
 .../coresight/coresight-etm4x-core.c          |  71 ++-
 .../coresight/coresight-etm4x-sysfs.c         | 566 +++++++++---------
 drivers/hwtracing/coresight/coresight-etm4x.h |   2 +-
 .../hwtracing/coresight/coresight-funnel.c    |  34 +-
 .../coresight/coresight-replicator.c          |  36 +-
 .../hwtracing/coresight/coresight-syscfg.c    |  75 ++-
 .../hwtracing/coresight/coresight-tmc-core.c  |   9 +-
 .../hwtracing/coresight/coresight-tmc-etf.c   | 195 +++---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 199 +++---
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +-
 .../hwtracing/coresight/coresight-trace-id.c  |  93 ++-
 drivers/hwtracing/coresight/ultrasoc-smb.c    |  12 +-
 drivers/hwtracing/coresight/ultrasoc-smb.h    |   2 +-
 include/linux/coresight.h                     |   4 +-
 21 files changed, 751 insertions(+), 838 deletions(-)

--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


