Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97E93FC0340
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 15:30:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oydNtzEt1LRjUCLvgYcUpXfY0tX3l6IxOyq6rWlJJdo=; b=Qh53B91L60q/OFbP1rhCX59pCT
	VALr6+ij8dSXb+7XlVt1uGwawZuMd4YRrUKPzP6AjLwJmVfzI4YqctcvKUcLvZWu08zHaJ0yq5Sm5
	tJgB3NlPYQ1Fy4dxcBCinzKlRUhC3BMZNCTY5dMSWkAbfKHqmXlzbNz15cwJV2i2t2cHpT5CAaqBB
	Vkx+VjQv9/HAqPD+yDWFvVV82s8cRTWDd8sdPfppwYHCsKED4h9lDtQXtAORYcHGTFQuOiWyBRhMl
	wbxnraIhzLjjwHiMPMpgE24Vfs3aNIowghw0lpfJSIdIITsMJi7IPRAm7qUTzsDKC7T9zA4VqpUHu
	H9FfXIsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFw0Q-0000000Btxx-0ZQs;
	Thu, 23 Apr 2026 15:30:18 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFw0N-0000000Btv4-1VFT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 15:30:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=oydNtzEt1LRjUCLvgYcUpXfY0tX3l6IxOyq6rWlJJdo=;
	b=37q95/+1nlLp3jCnWSxNBxI7X3Ux/WOIlxCYN/IpE0ms42+MsvkTC26OGhAPPIGJXUWIA6XLB
	J3usBkINMN1/sVpfXiIzFah0lryRjO9zIrVBIiynfS/uDvZETEix7ml3RuLHW5u7lGyTrTCma0d
	8Gj9fnaWf4mMDOFuH5Q9pG8=
Received: from mail.maildlp.com (unknown [172.19.162.223])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4g1fxj15BHzRhR4;
	Thu, 23 Apr 2026 23:23:37 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8333740571;
	Thu, 23 Apr 2026 23:30:00 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 23 Apr 2026 23:30:00 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 23 Apr 2026 23:29:59 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>, <robin.murphy@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<wangyushan12@huawei.com>
Subject: [PATCH 0/2] drivers/perf: hisi: Updates for HiSilicon uncore PMUs
Date: Thu, 23 Apr 2026 23:29:57 +0800
Message-ID: <20260423152959.1458563-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_083016_244540_BF4C3D1D 
X-CRM114-Status: UNSURE (   7.19  )
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

This patchset added support of ITS PMU, and new version of MN PMU.

ITS PMU supports counting number and latency of interrupts by catagory,
and statistics of micro-ops of ITS.

The new version of MN PMU added cycles event, to be used for MN metric
computing.

Yifan Wu (1):
  drivers/perf: hisi: Add new function for HiSilicon MN PMU driver

Yushan Wang (1):
  drivers/perf: hisi: Support uncore ITS PMU

 Documentation/admin-guide/perf/hisi-pmu.rst  |   6 +
 drivers/perf/hisilicon/Makefile              |   2 +-
 drivers/perf/hisilicon/hisi_uncore_its_pmu.c | 365 +++++++++++++++++++
 drivers/perf/hisilicon/hisi_uncore_mn_pmu.c  |  61 +++-
 4 files changed, 427 insertions(+), 7 deletions(-)
 create mode 100644 drivers/perf/hisilicon/hisi_uncore_its_pmu.c

-- 
2.33.0


