Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55EBCA1000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 12:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CKi8T1regw3NzXOy9AgZJWwfxYsdTwZexXsyiaxEHRo=; b=xql83I+RULobTvUSZ+3JYlqAD7
	pMePPrmMXn/XNy0PKhwj6jnzh4pEfA3FvW4Onm/e3zM5q0eswy0RErNwKWO/BhHrgfxbnjNlGMUR4
	RqqBmAHPWttbT7fzlE4o3ZuK/+FA+eYECrju5DakB7ESk29oYLojB2Fwqe9Qx03IrW8ngKOqMqw0/
	tMm2eiV+dd7VxiutXc5PlNHAKI/9EfLl6vGmkO9undLyk1vllMzv49qiXNSzXdt+YP+0PlSotgZDQ
	3PZCL/Cr7CLSp704gX0piK0pf1519OSpLUeAorEikGB3wQ0whyrmA81ztPs54/dUkJc0dw+JMqrKv
	TS4HLlfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uryHW-00000005ffR-39VV;
	Fri, 29 Aug 2025 12:32:38 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urw7v-00000005HRr-2NlM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 10:14:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4cCvDw34WXz2VRRD;
	Fri, 29 Aug 2025 18:11:28 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 0FB7B1402CC;
	Fri, 29 Aug 2025 18:14:29 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 29 Aug 2025 18:14:28 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 29 Aug 2025 18:14:28 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>, <linuxarm@huawei.com>,
	<fanghao11@huawei.com>
Subject: [PATCH v3 0/9] Updates of HiSilicon Uncore L3C PMU
Date: Fri, 29 Aug 2025 18:14:18 +0800
Message-ID: <20250829101427.2557899-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_031436_041899_4DEA2501 
X-CRM114-Status: GOOD (  14.71  )
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

Support new version of L3C PMU, which supports extended events space
which can be controlled in up to 2 extra address spaces with separate
overflow interrupts.  The layout of the control/event registers are kept
the same.  The extended events with original ones together cover the
monitoring job of all transactions on L3C.

That's said, the driver supports finer granual statistics of L3 cache
with separated and dedicated PMUs, and a new option `ext` to give a
hint of to which part should perf counting command be delivered.

The extended events is specified with `ext=[1|2]` option for the driver
to distinguish:

perf stat -e hisi_sccl0_l3c0_0/event=<event_id>,ext=<ext>/

Currently only event option using config bit [7, 0]. There's still
plenty unused space. Make ext using config [16, 17] and reserve
bit [15, 8] for event option for future extension.

With the capability of extra counters, number of counters for HiSilicon
uncore PMU could reach up to 24, the usedmap is extended accordingly.

The hw_perf_event::event_base is initialized to the base MMIO address
of the event and will be used for later control, overflow handling and
counts readout.

We still make use of the Uncore PMU framework for handling the events
and interrupt migration on CPU hotplug. The framework's cpuhp callback
will handle the event migration and interrupt migration of orginial
event, if PMU supports extended events then the interrupt of extended
events is migrated to the same CPU choosed by the framework.

A new HID of HISI0215 is used for this version of L3C PMU.

Some necessary refactor is included, allowing the framework to cope with
the new version of driver.

Depends-on: drivers/perf: hisi: Add support for HiSilicon NOC and MN PMU driver
Depends-on: Message-ID: <20250717121727.61057-1-yangyicong@huawei.com>

---

Changes:

v2 -> v3:
  - Refactor made for better readability.
  - Fixed failure examination in cpu offline callback.
  - Some minor reword of documentation, and droped subsection titles as
    suggested by Yicong.
  - Link to v2: https://lore.kernel.org/all/20250821135049.2010220-1-wangyushan12@huawei.com/

v1 -> v2:
  - Don't call disable_irq() and simply return success when there is no
    CPU available for irq migration.
  - Documentation patch split.
  - Fix of a few other issues etc. per Jonathan.
  - Link to v1: https://lore.kernel.org/all/20250729153823.2026154-1-wangyushan12@huawei.com/

Yicong Yang (7):
  drivers/perf: hisi: Relax the event ID check in the framework
  drivers/perf: hisi: Export hisi_uncore_pmu_isr()
  drivers/perf: hisi: Simplify the probe process of each L3C PMU version
  drivers/perf: hisi: Extract the event filter check of L3C PMU
  drivers/perf: hisi: Extend the field of tt_core
  drivers/perf: hisi: Refactor the event configuration of L3C PMU
  drivers/perf: hisi: Add support for L3C PMU v3

Yushan Wang (2):
  Documentation: hisi-pmu: Fix of minor format error
  Documentation: hisi-pmu: Add introduction to HiSilicon V3 PMU

 Documentation/admin-guide/perf/hisi-pmu.rst  |  38 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 528 +++++++++++++++----
 drivers/perf/hisilicon/hisi_uncore_pmu.c     |   5 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h     |   6 +-
 4 files changed, 481 insertions(+), 96 deletions(-)

-- 
2.33.0


