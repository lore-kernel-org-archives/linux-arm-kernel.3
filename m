Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70875C87FC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Jul 2025 15:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3JrcF6ifMGOHkXw3DSyi+4dlIwgS9TPXkfwWC0VfgKQ=; b=nUnNTQ3NerKQcMmdvDheGc/2k/
	h5/xD8jC8bRdDNPy+rt08fJFEZbAnLclCLVDSg/+kNtISsRc3ERgMhkZ+gdLiVwA1M3OWjGEislqP
	BmpVT2tA2cyJgv4VDrqxrTho0KKjZl5UyBeVqYzjStEK+OERUL/Xn//buu1saMcG1yJqy8bxRZQA3
	zleaHG0IoVy+2wA5zhW8fqGA3/KwMRRhEcoC88d/uw49XQHHDD+Ebqg5KQ2PCwNG6JZmDphua46dY
	ajogCydg6rqH/hqQw/7dBeQmMBhV2z7Z1vdXlxKnDDq9n40OUYedhfmvSDfOZBG+bE7spHIkpPQiI
	qhVM9cqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmfF-0000000HC9G-10oS;
	Tue, 29 Jul 2025 15:54:53 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugmPS-0000000H9r9-2HQJ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Jul 2025 15:38:37 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4brztv6db8z13MlL;
	Tue, 29 Jul 2025 23:35:19 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 08614140203;
	Tue, 29 Jul 2025 23:38:25 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:24 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 29 Jul 2025 23:38:24 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH 0/8] Updates of HiSilicon Uncore L3C PMU
Date: Tue, 29 Jul 2025 23:38:15 +0800
Message-ID: <20250729153823.2026154-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_083834_938351_48FDD2AD 
X-CRM114-Status: GOOD (  13.64  )
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
with separated and dedicated PMUs, and a new operand `ext` to give a
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

Yicong Yang (7):
  drivers/perf: hisi: Relax the event ID check in the framework
  drivers/perf: hisi: Export hisi_uncore_pmu_isr()
  drivers/perf: hisi: Simplify the probe process of each L3C PMU version
  drivers/perf: hisi: Extract the event filter check of L3C PMU
  drivers/perf: hisi: Extend the field of tt_core
  drivers/perf: hisi: Refactor the event configuration of L3C PMU
  drivers/perf: hisi: Add support for L3C PMU v3

Yushan Wang (1):
  Documentation: hisi-pmu: Add introduction to HiSilicon V3 PMU

 Documentation/admin-guide/perf/hisi-pmu.rst  |  43 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 527 +++++++++++++++----
 drivers/perf/hisilicon/hisi_uncore_pmu.c     |   5 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h     |   6 +-
 4 files changed, 484 insertions(+), 97 deletions(-)

-- 
2.33.0


