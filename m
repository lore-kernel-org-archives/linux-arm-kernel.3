Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CA9ACA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 13:37:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1/QbjgNh/EIraHQr5qpy/oDQHqj7R4FnMNTm+SlsF9A=; b=V1nZHkm9Ct7kGt2famLohlS1os
	PsH3O2whCRuLWR2ZOZj8mzA0HPghcQCcXoxcssqrdm5fGSHtSFUkgN5nrkwDiUxN30VTuuqyCIV13
	EZklI56P8EGH+kjxOTsvDaabvRgz6NvAo1mvqY06UfLJtma5A/IHguviROzt0NsY24PDGTRy2Z4T/
	OtGWeR9GQ6SwCRxnUrYNsD1H+fCddIGwJhnhJ8vwTyKMIy2XSUMxfnPkikP6vaRzBCLUEdO4ck9Ds
	xUjP/+u1krvxvHBjeUUn4ZkAodH2OEk461Vu/MuMakWAzAv1/7u6hhcpozcFOtl22MDCIXnEZLSIb
	oyI9f7hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo03D-00000007TtJ-1rcx;
	Mon, 18 Aug 2025 13:37:27 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unusw-00000006uOA-2KRr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 Aug 2025 08:06:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.44])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c54tD1Bh8z2CgG7;
	Mon, 18 Aug 2025 16:01:40 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 051621400CB;
	Mon, 18 Aug 2025 16:06:02 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:01 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Mon, 18 Aug 2025 16:06:01 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>,
	<anshuman.khandual@arm.com>, <leo.yan@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v3 0/3] Coresight TMC-ETR some bugfixes and cleanups
Date: Mon, 18 Aug 2025 16:05:57 +0800
Message-ID: <20250818080600.418425-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_010630_746124_4E5C1350 
X-CRM114-Status: UNSURE (   8.80  )
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

This patchset builds upon Yicong's previous patches [1].

Introducing fix two race issues found by using TMC-ETR and CATU, Two
cleanups found when debugging the issues.

[1] https://lore.kernel.org/linux-arm-kernel/20241202092419.11777-1-yangyicong@huawei.com/

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

 .../hwtracing/coresight/coresight-tmc-etr.c   | 110 ++++++++----------
 drivers/hwtracing/coresight/coresight-tmc.h   |   2 +
 2 files changed, 53 insertions(+), 59 deletions(-)

-- 
2.33.0


