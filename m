Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8B44CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 12:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dTCgwwGpCsX1eoq9BlzwM04EmE962CsxPEITUwNKSpY=; b=XDVp8Heymk7la6oRHnJ4ZMpffG
	rXGAAKNcTEUXd1uRE1IkiPXdc37GG2/yfvyBR3kdgwNkQo944X9ZAZEBr+yOiWXgbcDs5Ak9iepv1
	ldEm1zPmcvjDUJwC02qwjh7IN9Xlc+UJEau7QCcOiIXQsjZxIB6VUB2ivAWF7MS9vb5ZRD4EpccfK
	JH85Qc4UHsgYnfdUqRQvNvQxRMSaTtcUsR7+qyLR4RpnBUos/0ZgIpHVm0NBD9xUFsuc/bSyAG50p
	KWfaGep79/hWPo8ka8gwqm3jIRI5eO4LtmMRY2sMXlR6bfmj/Mf6V5eSKkrSurkHF3BWuMfMDB10e
	jDfB6XbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInNx-000000079qj-2QAE;
	Tue, 11 Nov 2025 12:22:09 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vInNu-000000079pE-1fK8
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Nov 2025 12:22:08 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dTCgwwGpCsX1eoq9BlzwM04EmE962CsxPEITUwNKSpY=;
	b=J6YgRveNzqFh1OijyD9n24NyS5wX3sYcoofYldF+MsuOpCqDuNjonPgnfHkVRfK5TZbnnEkM9
	luBjahgjKnuU+fNk1mUfrLtYCCDjTBnYArIYgW9qgI3TsRUGRAGu2OwM21qGEImeE2wR8gDk+L8
	FRf+MNohA4c10IIkxUgvzXc=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4d5QbL4XC5z1prlV;
	Tue, 11 Nov 2025 20:20:14 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 3553E180B5A;
	Tue, 11 Nov 2025 20:21:54 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Nov 2025 20:21:51 +0800
Received: from localhost.localdomain (10.50.163.32) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 11 Nov 2025 20:21:51 +0800
From: Junhao He <hejunhao3@h-partners.com>
To: <suzuki.poulose@arm.com>, <james.clark@linaro.org>,
	<anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>, <mike.leach@linaro.org>,
	<leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@h-partners.com>
Subject: [PATCH v4 0/3] Coresight TMC-ETR: refactor the tmc-etr mode and some cleanups
Date: Tue, 11 Nov 2025 20:21:46 +0800
Message-ID: <20251111122149.1981162-1-hejunhao3@h-partners.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_042206_896022_430C5F24 
X-CRM114-Status: GOOD (  10.01  )
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

This patchset builds upon Yicong's previous patches [1].

Patch 2 introducing fix race issues found by using TMC-ETR.
Patch 1 & 3 introducing two cleanups found when debugging the issues.

[1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/

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

Junhao He (1):
  coresight: tmc: refactor the tmc-etr mode setting to avoid race
    conditions

Yicong Yang (2):
  coresight: tmc: Add missing doc including reading and etr_mode of
    struct tmc_drvdata
  coresight: tmc: Decouple the perf buffer allocation from sysfs mode

 .../hwtracing/coresight/coresight-tmc-etr.c   | 136 +++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 2 files changed, 66 insertions(+), 72 deletions(-)

-- 
2.33.0


