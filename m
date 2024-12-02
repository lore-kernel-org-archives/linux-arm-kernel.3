Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 016F6D10DDD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Dec 2024 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xDo53sRToS3Oqod4PT26cC1RE5TW7V+qPTtywAFWYM4=; b=nM+uw7oZbXLxGYv/IQatsHHdRB
	O5s+bdgNbQSopacJCxCvaPSivksyx62/5vouUic89Hdh8VELD2N9PgoF7yo2f92Mmu387//oDLJ9s
	HQF2D81+LO3DkllqH//eSBEGOVSCQotqLippq/7WwqdPure4rq+b6S6d/jHw8HRmqwnlopmqsVTp4
	oDb5aBJfaEnQLGCKT1Q/m5tZ0l5PV7PKGM5nLSSK3yYoTWUzdb0xWbeE+o6QWdgznhcC9Hs0bKxGt
	4Ac3cKFX8Psieop7KlzdQz50Ka5kgeY8D8EuLd59Xn/xjifGQCzijH6Ir9Lq1OqVNtag/4Hddwxtl
	P3m/Iw6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2l0-00000005Zln-44A7;
	Mon, 02 Dec 2024 09:30:18 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI2gC-00000005YhE-296g
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Dec 2024 09:25:22 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Y1yxX0gsNz11PWH;
	Mon,  2 Dec 2024 17:22:56 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id E38A818007C;
	Mon,  2 Dec 2024 17:25:10 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Mon, 2 Dec 2024 17:25:10 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <suzuki.poulose@arm.com>, <mike.leach@linaro.org>,
	<james.clark@linaro.org>, <coresight@lists.linaro.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH 0/4] Coresight TMC-ETR some bugfixes and cleanups
Date: Mon, 2 Dec 2024 17:24:15 +0800
Message-ID: <20241202092419.11777-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_012520_714383_4E93BECC 
X-CRM114-Status: UNSURE (   7.09  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Fix two race issues found by using TMC-ETR. Two cleanups found when
debugging the issues. Patch 1/4 is suggested by Suzuki in [1] and
tested to solve the original issue.

[1] https://lore.kernel.org/linux-arm-kernel/20241114081653.24328-1-yangyicong@huawei.com/

Suzuki K Poulose (1):
  coresight: tmc: Don't reallocate the sysfs_buffer if it's in use

Yicong Yang (3):
  coresight: tmc: Add missing doc of tmc_drvdata::reading
  coresight: tmc-etr: Fix race condition between sysfs and perf mode
  coresight: tmc-etr: Decouple the perf buffer allocation from sysfs
    mode

 .../hwtracing/coresight/coresight-tmc-etr.c   | 65 +++++++++++++------
 drivers/hwtracing/coresight/coresight-tmc.h   |  1 +
 2 files changed, 45 insertions(+), 21 deletions(-)

-- 
2.24.0


