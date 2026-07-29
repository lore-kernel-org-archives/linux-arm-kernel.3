Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 747A5C54F52
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZolJusffMpH1IrOjZcAyCcbj1nmmus6GaNhSnz2Mgno=; b=JsJ1iwMvE4mxQR3xMGn2xFKNwN
	KrhYBE/qBkI/5hd6C1/ZsG6hOYEKKsVduKNd3lTKP9CMdZ+gCJLifTMBDlffCTT2ng4U+AqFmbqQd
	x7bgaDEEJxF+sRYwJQ0nsW9jOzVYyjUQgr9N6V2fs17npzOtBPsHpzzGiDdH3nlWAL2iF8/X2BidF
	0SOegK+isv6KL8daFZbh/RT9LsQvNNkF4Cr6mzFI6uCbfCuU3syT8dIFszg9XFcevLY8uHsIpRWGy
	FURDowD3DyXJYGnwVt/02Sq5ucsvBxqQlkIE92SKvQ8PZL89CbOAwG1txxz7heF5TmbO9WZSn6cVV
	kWVT2rvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1ZH-00000007YNL-0Sp6;
	Wed, 29 Jul 2026 10:31:19 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1Yz-00000007YF6-2viT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:31:05 +0000
Received: from mail.maildlp.com (unknown [172.19.163.0])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4h97fJ0HllzRhQt;
	Wed, 29 Jul 2026 18:21:28 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id D56DF40561;
	Wed, 29 Jul 2026 18:30:53 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 29 Jul 2026 18:30:53 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v4 0/4] devfreq: Add refcounts for governor modules
Date: Wed, 29 Jul 2026 18:23:44 +0800
Message-ID: <20260729102348.3857779-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_033102_048344_F5590D2C 
X-CRM114-Status: GOOD (  13.14  )
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

A governor module can be dynamically inserted or removed if compiled as a
kernel module.  'devfreq->governor' would become NULL if the governor
module is removed when it's in use.

For user-friendliness, get and put the module refcount of a governor module
when it's in use.  As a result, unloading a governor module in use returns
an error, e.g.:

$ cat governor
performance
$ rmmod governor_performance
rmmod: ERROR: Module governor_performance is in use

Note that this can't stop force unload, so it's more of a
user-friendliness improvement rather than strict protection.  The
existing code that keeps devfreq working when 'devfreq->governor' is
NULL should still be there.

Patch 1-3 clean up mutex with guards and factor out a common governor
setting function, so as to prepare for implementing governor reference
counting.  They can be applied separately.

Patch 4 adds the reference counting mechanism for devfreq governor
modules.

This set is based on devfreq-next of 7.1-rc1.

Changelog
---------
v4:
- Patch 3: Return an error if starting new governor fails and restoring
  old governor succeeds, such that the caller won't get misled.

v3:
- Link: https://lore.kernel.org/all/20260519113251.3745140-1-zhanjie9@hisilicon.com/
- Rework patch 4 to make the 'owner' field assignment optional in the
  governor code.  This prevents device-driver-bundled governors (such as
  those in hisi_uncore_freq and tegra30-devfreq) from causing
  self-reference issues that block module removal. Additionally, merge
  patches 4 and 5 to clearly present the new 'owner' member alongside
  its usage.
- Drop patch 6 because it's no longer needed since v2.
- Update commit logs of patch 3 and 4 to clarify background and
  motivation.
- Pick up 2 tags from Yaxiong (thanks!).
- Trivial cleanups.

v2:
- Link: https://lore.kernel.org/all/20260513093832.1645890-1-zhanjie9@hisilicon.com/
- Rebase on devfreq-next of 7.1-rc1.
- Drop the patches related to the NULL pointer deference issue of
  'devfreq->governor', which has been solved and merged recently.
- Remove the dedicated mutex for 'devfreq_governor_list' because the
  refcount changes don't depend on that.
- Some minor cleanups and fixes.

v1:
- Link: https://lore.kernel.org/all/20260326123428.800407-1-zhanjie9@hisilicon.com/

Jie Zhan (4):
  devfreq: Use mutex guard in governor_store()
  devfreq: Use mutex guard in devfreq_add/remove_governor()
  devfreq: Factor out devfreq_set_governor()
  devfreq: Refcount governor modules while in use

 drivers/devfreq/devfreq.c                 | 185 +++++++++++-----------
 drivers/devfreq/governor_passive.c        |   1 +
 drivers/devfreq/governor_performance.c    |   1 +
 drivers/devfreq/governor_powersave.c      |   1 +
 drivers/devfreq/governor_simpleondemand.c |   1 +
 drivers/devfreq/governor_userspace.c      |   1 +
 include/linux/devfreq-governor.h          |  11 ++
 7 files changed, 112 insertions(+), 89 deletions(-)

-- 
2.43.0


