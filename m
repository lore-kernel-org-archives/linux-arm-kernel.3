Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF06CC71155
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Jun 2025 08:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lToURr6a2h4pCbz0cfLE1iILhrx8BpVDu00qgQAIKN4=; b=cRPbBMT0PAwOTR1Nt13h8acvxy
	kV4awbcmlBQFhuWosj/3qHp6Dw7qSxKFUR010fxc87vO1qa6ZHm968gKwjvMGL0YTZb2YLa4E61Qz
	s1nY3iE7FvuK5fsnUUGPKemcNM/q38qTIh5cTBBSgRZVM+Kzb7l0qMK3j+xAb3TvwAdNCRfND/dMI
	7Z9VL7nIN4oFPZ32kw0GS7BMCFd04NYPAy+N2d1a1JwqM1xg4PBb/uOdwnBV34XiTxymYFygH2MsA
	5jqiYr8vYdk7WMZ9qwsi+XflJtlH3OMjmjdO3Zum/tWTz9FE9n4Y5ivzCrGu+GkTyvLQ41mo8B+pS
	fJWeuQ5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWhT-0000000Ezjp-0ugM;
	Fri, 20 Jun 2025 08:02:15 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSWZy-0000000Ez0B-1qMC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Jun 2025 07:54:32 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4bNqT84g57z2TSrB;
	Fri, 20 Jun 2025 15:52:44 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 71CBF1A0190;
	Fri, 20 Jun 2025 15:54:15 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:13 +0800
Received: from localhost.localdomain (10.50.165.33) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 20 Jun 2025 15:54:13 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <suzuki.poulose@arm.com>, <james.clark@arm.com>, <leo.yan@arm.com>,
	<anshuman.khandual@arm.com>
CC: <coresight@lists.linaro.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>, <yangyicong@huawei.com>,
	<prime.zeng@hisilicon.com>, <hejunhao3@huawei.com>
Subject: [PATCH v2 0/3] Coresight TMC-ETR some bugfixes and cleanups
Date: Fri, 20 Jun 2025 15:54:09 +0800
Message-ID: <20250620075412.952934-1-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250620_005430_637203_03B8D50F 
X-CRM114-Status: UNSURE (   6.12  )
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
Changes in v2:
- Updated the commit of patch2.
- Rebase to v6.16-rc1

Junhao He (1):
  coresight: tmc: refactor the tmc-etr mode setting to avoid race
    conditions

Yicong Yang (2):
  coresight: tmc: Add missing doc of tmc_drvdata::reading
  coresight: tmc: Decouple the perf buffer allocation from sysfs mode

 .../hwtracing/coresight/coresight-tmc-etr.c   | 102 +++++++++---------
 drivers/hwtracing/coresight/coresight-tmc.h   |   1 +
 2 files changed, 53 insertions(+), 50 deletions(-)

-- 
2.33.0


