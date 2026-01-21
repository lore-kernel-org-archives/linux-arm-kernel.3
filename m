Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99822C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Jan 2026 10:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=HoLSQNKJGeycECcOUEjcwDX9vSGBUFRa5zOBOGIA7rE=; b=W0784veKH2xD2gPAxQD27hZZZe
	+xDwItVsHYdPL9KpJwuWtQ49woBebKP/MaqbVqAXNYTv+6faSE0TnR6E22YNt7eE2+6RvmZ40thIj
	amwXOyX8D8IjSB0/1XiPUGnpqoCiB6wNr9ZNjGMsyANunqJZxAWINJLqIx+x/UY5COFEpOcSW/qt0
	1uGhzR5UZlllHYpJ+FXMe5a0btzrDuyJwSVmyBPapkvgydm0UdzHzppVuHhTZRYXdZjY0kKeHniTx
	pQw0hnR/8AB+qXp5IDDGZnPqrviu/jNFAQh315aWaY8aTCV6xDWSmKox5wZ4MTZFn2oWMPL5Q0Px3
	3A0dquLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVFk-00000005Fms-16R0;
	Wed, 21 Jan 2026 10:15:56 +0000
Received: from canpmsgout10.his.huawei.com ([113.46.200.225])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viVFh-00000005FkN-2mpK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Jan 2026 10:15:55 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=HoLSQNKJGeycECcOUEjcwDX9vSGBUFRa5zOBOGIA7rE=;
	b=vwcuBFzvEtgieL1+kmzIoudJfiGfsUn/6r86O4uH2ExGF2TjLN+JBABqCiwhRvmaMmCxNEyRQ
	PQzku/bpN34+KWQeDm8MMjoUadh/k39PRQBbtG3esP6tW57wdV+Zb/cnfczwUZ9AN4k6KymSj3B
	xn69WP9YOGuZ5KZFa+ZSHuc=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout10.his.huawei.com (SkyGuard) with ESMTPS id 4dx0P3096Qz1K96y;
	Wed, 21 Jan 2026 18:12:23 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id C445F40563;
	Wed, 21 Jan 2026 18:15:44 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 21 Jan 2026 18:15:44 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 21 Jan 2026 18:15:43 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@linaro.org>,
	<anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>, <mike.leach@linaro.org>,
	<leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@h-partners.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH v5 0/3] Coresight TMC-ETR: refactor the tmc-etr mode and some cleanups
Date: Wed, 21 Jan 2026 18:15:40 +0800
Message-ID: <20260121101543.2017014-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260121_021554_038002_4447078D 
X-CRM114-Status: GOOD (  11.07  )
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

From: Junhao He <hejunhao3@h-partners.com>

This patchset builds upon Yicong's previous patches [1].
I rebase the patchset onto coresight for-next branch.

Patch 2 introducing fix race issues found by using TMC-ETR.
Patch 1 & 3 introducing two cleanups found when debugging the issues.

[1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/

---
Changes in v5:
 - a) Rebase the patchset onto coresight for-next branch.
 - b) Drop the refactoring of the mode handling, retain only the essential fix
Link: https://lore.kernel.org/linux-arm-kernel/20251111122149.1981162-1-hejunhao3@h-partners.com/

---
Changes in v4:
 - a) Add comment at the context of set etr to sysfs mode.
 - b) Move the check on drvdata->read to the start of enable etr.
 - c) Add checks to prevent multiple sysfs processes from simultaneously
 competing to enable ETR.
 - d) Fix the issue with the guard used.
Link: https://lore.kernel.org/linux-arm-kernel/20250818080600.418425-1-hejunhao3@huawei.com/

---
Changes in v3:
 - Patches 1: Additional comment for tmc_drvdata::etr_mode. Update
 comment for tmc_drvdata::reading with Jonathan's Tag.
 - Patches 2: Replace scoped_guard with guard with Jonathan's Tag.
 - Patches 2: Fix spinlock to raw_spinlock, and refactor this code based
 on Leo's suggested solution.
 - Patches 3: change the size's type to ssize_t and use max_t to simplify
 the code with Leo's Tag.
Link: https://lore.kernel.org/linux-arm-kernel/20250620075412.952934-1-hejunhao3@huawei.com/

Changes in v2:
- Updated the commit of patch2.
- Rebase to v6.16-rc1

Yicong Yang (3):
  coresight: tmc: Add missing doc including reading and etr_mode of
    struct tmc_drvdata
  coresight: tmc-etr: Fix race condition between sysfs and perf mode
  coresight: tmc: Decouple the perf buffer allocation from sysfs mode

 .../hwtracing/coresight/coresight-tmc-etr.c   | 43 ++++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h   |  2 +
 2 files changed, 24 insertions(+), 21 deletions(-)

-- 
2.33.0


