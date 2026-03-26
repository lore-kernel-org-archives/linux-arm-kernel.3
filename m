Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9904410A3D8E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:40:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F+ffTU+y3w3+pXZHzULtwEIHSb9rKuypmVDtPYty/Fo=; b=jij/ztwryr781b4du2ELa8hKVR
	gK9Gtq4kqiNUCIqyljfFBk7+Vg+Uym+wTQem+mV5SNcKqPqzKmZhEvHe8GReDis162HUD66hzXSfc
	K7NbkYI7I9ZKpNp6OzBh39Cd2U/S50Bclpkz63kNlkwMe06ZzdDMAVxBw8TgGgGJRSt+tgVF4C5tj
	nW02nkvlTz8R0b0e0RpQ4hBhPUiLxspNG/wrDzW3dcB7RQqvkCafmxR8HXjFme+oh3p9yOURVpgV0
	QliZhauLv2mUaBK675TXCdlVYQ/nMigHgdgUkouJTv4nk0HVfktaItA35GcmFo07IqfQOsR61pdJn
	s0OlamZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k0M-00000005Svj-0D4S;
	Thu, 26 Mar 2026 12:40:06 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5k02-00000005SkE-3d22
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Mar 2026 12:39:49 +0000
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4fhNVn3jzQzpSvx;
	Thu, 26 Mar 2026 20:33:53 +0800 (CST)
Received: from kwepemf200017.china.huawei.com (unknown [7.202.181.10])
	by mail.maildlp.com (Postfix) with ESMTPS id 53B0740567;
	Thu, 26 Mar 2026 20:39:31 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemf200017.china.huawei.com (7.202.181.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 26 Mar 2026 20:39:30 +0800
From: Jie Zhan <zhanjie9@hisilicon.com>
To: <cw00.choi@samsung.com>, <myungjoo.ham@samsung.com>,
	<kyungmin.park@samsung.com>, <tianyaxiong@kylinos.cn>
CC: <linux-pm@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linuxarm@huawei.com>, <zhanjie9@hisilicon.com>,
	<jonathan.cameron@huawei.com>, <zhenglifeng1@huawei.com>,
	<zhangpengjie2@huawei.com>, <lihuisong@huawei.com>,
	<prime.zeng@hisilicon.com>
Subject: [PATCH v1 00/10] devfreq: Fix NULL pointer dereference when a governor module is unloaded
Date: Thu, 26 Mar 2026 20:34:18 +0800
Message-ID: <20260326123428.800407-1-zhanjie9@hisilicon.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemf200017.china.huawei.com (7.202.181.10)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_053947_090755_09A83824 
X-CRM114-Status: UNSURE (   8.44  )
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

When compiled as a kernel module, the governor module can be dynamically
inserted or removed.  'devfreq->governor' would become NULL if the governor
module is removed when it's in use, and NULL pointer dereference would be
triggered.  A similar issue was also reported in [1].

To address this issue:

Patch 1-5 rework mutex, factor out a common governor setting function, and
clean up some unreachable code.

Patch 6-8 prevent a governor module in use from being removed (except for
force unload) by getting/putting a refcount of the governor's module when
switching governors.

Patch 9-10 allow 'governor' and 'available_governors' to work normally even
when a governor module in use is force unloaded.

Note that this series is based on [1] or devfreq-next, otherwise code
would conflict.

[1] https://lore.kernel.org/all/20260319091409.998397-1-tianyaxiong@kylinos.cn/
[2] https://lore.kernel.org/all/20251216031153.2242306-1-zhangpengjie2@huawei.com/

Jie Zhan (8):
  devfreq: Use mutex guard in governor_store()
  devfreq: Use mutex guard in devfreq_add/remove_governor()
  devfreq: Add a dedicated mutex for the governor list
  devfreq: Factor out devfreq_set_governor[_locked]()
  devfreq: Remove dead code in devfreq_add_governor()
  devfreq: Add module owner to devfreq governor
  devfreq: Get and put module refcount when switching governor
  devfreq: Allow find_devfreq_governor() to get module refcount

Zhi Wang (2):
  devfreq: Allow showing available_governors when device governor is
    NULL
  devfreq: Allow setting governor when device governor is NULL

 drivers/devfreq/devfreq.c        | 287 +++++++++++++------------------
 include/linux/devfreq-governor.h |  26 ++-
 2 files changed, 143 insertions(+), 170 deletions(-)

-- 
2.43.0


