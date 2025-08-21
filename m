Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 054AECA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 19:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CnZErLQMG8GrqoZsiDD3ZBU+dUwVNSpi5xq1RleW2m8=; b=OqmC6T4CqRSh5IvfzQ9/cjiZ6C
	83HmW9ekkuFRotYD9azNMX5L8/FZH9N8/QyJF1UPF+uQs/LkAGQrOlQwctkuov+czZJZsLTl+8C8q
	c4DqhsG3W5fukhS6xzmWcgUTPrPmhRVmg86iYovLW10IH3EqKTrM1/qg78FEqcgwUXC+E2NrmjC9t
	6tP0hXYduRvcAcUF+UpXyDRDWlKhTEb9tCr94jYGYV6V+/szEof8mZ8evq6w25yxoZMGiwg78FeJM
	zQ4t1RNun0J+/RehuCBLAOs8c58SsADHvrt26gFc83n3MlmLOBAbgouYamUUJGPJujOLVKeCOoiRd
	WtiXhx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAhs-00000000EXH-24UJ;
	Thu, 21 Aug 2025 19:12:16 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5hC-0000000H7Um-0xWX
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 13:51:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=CnZErLQMG8GrqoZsiDD3ZBU+dUwVNSpi5xq1RleW2m8=; b=iSWADMKCOpM4TTdXHHNeCeRSVS
	6Ih0XJoh2oRgXJP/4VoGcc6prK1YbFZWSV5JjqLr/e1QScMWO9bpOGd5SCW8PaDvBLE1+AgTMM70m
	WGkaMnDCPT2VfTdQoXHXKVvoR1icUixjA3aVeKlGvnLilBjZXsBD+QEFqbJ4w4y4pigbZZD9gWraP
	gpLudYaxxPke01suy8ayKH1B7E9Eds+KFdHJlvKVPdtbMSFjeNitKtBwmr38oiLVRhX+cTsHszbBz
	0EzUI9pt87ahmtCyOqMtVId8DVNKuLVWG+cAww1sinZrIfwARswQnyRwRz7NZKLq+/oWF5B6BwxA5
	1T5vaong==;
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up5h8-00000000a4p-04i7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 13:51:12 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4c74NR0SqVzPpKf;
	Thu, 21 Aug 2025 21:46:15 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 03B27180087;
	Thu, 21 Aug 2025 21:50:51 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:50 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 21 Aug 2025 21:50:49 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <robin.murphy@arm.com>, <yangyicong@huawei.com>,
	<Jonathan.Cameron@huawei.com>, <liuyonglong@huawei.com>,
	<wanghuiqiang@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v2 0/9] Updates of HiSilicon Uncore L3C PMU
Date: Thu, 21 Aug 2025 21:50:40 +0800
Message-ID: <20250821135049.2010220-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_145110_956240_910513FF 
X-CRM114-Status: GOOD (  15.06  )
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

---

Changes:

v1 -> v2:
  - Don't call disable_irq() and simply return success when there is no
    CPU available for irq migration.
  - Documentation patch split.
  - Fix of a few other issues etc. per Jonathan.

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
  Documentation: hisi-pmu: Add introduction to HiSilicon

 Documentation/admin-guide/perf/hisi-pmu.rst  |  43 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c | 520 +++++++++++++++----
 drivers/perf/hisilicon/hisi_uncore_pmu.c     |   5 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h     |   6 +-
 4 files changed, 477 insertions(+), 97 deletions(-)

-- 
2.33.0


