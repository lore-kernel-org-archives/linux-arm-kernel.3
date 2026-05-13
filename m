Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2243CD4F35
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 09:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wn7xYzWSG8wiyndNgJv10tvhfIP9hUWpD1DA/ViRN4A=; b=FYvfkYWpitXBKwoFHQ2yWW5d9e
	4n66jnlyqxibVFMxYdQA9jqOQpgctMyyDz8iknm2rZoff3jRUWzfz6VU9kXO01Pfve3QlB3k6Tpvo
	SJfsdC+GSmXPuhAYy8syrv5I2etJc0+Ue0p7qs1Kf/G1sSvXL3l6BCPeTz0HEHYIfFM8AOpCL5gzM
	Ggo3uXoE7D5M3jKQkMwgW8DNorL64/nXiKjB6JcphGlx7dKBjqOAY4nxYqd8496Slh8ltw6oVnWyr
	1NJL3IdRKo6JCX/IbXQL6HplXzCsSmcoeEfdwsaoB3zypZ7NAaUo/6SBT3TUCZ6oZhgsS+P9Zv4Bu
	9vyQ5qyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN67p-00000001xlx-039j;
	Wed, 13 May 2026 09:43:33 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wN67l-00000001xhA-0eaD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 09:43:30 +0000
Received: from mail.maildlp.com (unknown [172.19.163.104])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4gFpHh3494zpSwH;
	Wed, 13 May 2026 17:36:16 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id E14A14048F;
	Wed, 13 May 2026 17:43:17 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 13 May 2026 17:43:17 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cwchoi00@gmail.com>, <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <linux-pm@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <tianyaxiong@kylinos.cn>, <zhanjie9@hisilicon.com>,
	<zhenglifeng1@huawei.com>, <zhangpengjie2@huawei.com>,
	<lihuisong@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v2 0/6] devfreq: Add refcounts for governor modules
Date: Wed, 13 May 2026 17:38:26 +0800
Message-ID: <20260513093832.1645890-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_024329_343640_47E86423 
X-CRM114-Status: GOOD (  10.66  )
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

Patch 4-6 add the reference counting mechanism for devfreq governor modules.

Changelog:
v2:
- Rebase on devfreq-next of 7.1-rc1.
- Drop the patches related to the NULL pointer deference issue of
  'devfreq->governor', which has been solved and merged recently.
- Remove the dedicated mutex for 'devfreq_governor_list' because the
  refcount changes don't depend on that.
- Some minor cleanups and fixes.

v1:
https://lore.kernel.org/all/20260326123428.800407-1-zhanjie9@hisilicon.com/

Jie Zhan (6):
  devfreq: Use mutex guard in governor_store()
  devfreq: Use mutex guard in devfreq_add/remove_governor()
  devfreq: Factor out devfreq_set_governor()
  devfreq: Add module owner to devfreq governor
  devfreq: Get and put module refcount when switching governor
  devfreq: Get module refcount in try_then_request_governor()

 drivers/devfreq/devfreq.c        | 210 +++++++++++++++----------------
 include/linux/devfreq-governor.h |  26 +++-
 2 files changed, 127 insertions(+), 109 deletions(-)

-- 
2.43.0


