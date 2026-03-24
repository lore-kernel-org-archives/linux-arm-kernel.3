Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B994BE9A779
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 12:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hfr2FSvcInRJN9qnFobwetvq4sqGiHycr5j1Jc1+i+o=; b=hZCfl3fkoC4hDz1eaj0xwq3Evc
	SZYOCCzxif/5WI8cOoIC90CMUzTuZdPORE8yLhICS5lujugITmqiqU9vAvDvumxvEFrrosmf4M0SV
	WKN8rqxEsND/NhVFIW5jahX4VLS8sWQJFr2IfzBZXYFVyhXus1xEZN8EzvBCbDnAquJ1ZnYoTFv6G
	A8lPoatlZqoCkGzEQxoI05hqGRII+uQJfZ0DjzYOU+vcgT2ZayDUZHfpNF9o4ObKu3JA1zCqKM84K
	b687/Tp28Guf3bRf4jwQtTBmEo6PU43ABBwBJs+Az7OM4exOea81l24Qf2J+Z+wqC8eaJigpb0DI5
	MO6QQccg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51Fc-00000001RNi-1LbI;
	Tue, 24 Mar 2026 12:52:52 +0000
Received: from canpmsgout01.his.huawei.com ([113.46.200.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w51FZ-00000001Qze-0cK6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 12:52:50 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Hfr2FSvcInRJN9qnFobwetvq4sqGiHycr5j1Jc1+i+o=;
	b=qtcwuOjJEI0S9j8Duh43tRWfbwcFbVbsbuYhiyuXFS4K1t+mmQkX7j1IxRvlDFODrZSlmvcsK
	SUML5n1IFriJX+MTl/UUKlgmMaGjX0h7lexGMQ8yQ6pUclVmoATAYLUFWT2F9DTGdY6jYD8UTG6
	h2rrqX/8dfwAYpWEL3s4s2c=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout01.his.huawei.com (SkyGuard) with ESMTPS id 4fg8rd6SLnz1T4Hm;
	Tue, 24 Mar 2026 20:45:05 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id BB07D2012A;
	Tue, 24 Mar 2026 20:50:35 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Mar
 2026 20:50:34 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <tony.luck@intel.com>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <babu.moger@amd.com>, <shuah@kernel.org>,
	<tan.shaopeng@fujitsu.com>, <fenghuay@nvidia.com>, <ben.horgan@arm.com>,
	<jonathan.cameron@huawei.com>, <zengheng4@huawei.com>,
	<wuyifan50@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kselftest@vger.kernel.org>,
	<linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH 0/3] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Tue, 24 Mar 2026 20:50:31 +0800
Message-ID: <20260324125034.1509177-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_055249_390738_BFFDCAE7 
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

Hi all,

This patch series adds dynamic linked list management for the IMC
counters, which can work based on the actual number of counters instead of
an upper limit, without the need for array out-of-bounds access check.

This patch series is based on the Reinette's patch series aimed at fixing
the resctrl test and can be found at:
https://lore.kernel.org/lkml/cover.1773432891.git.reinette.chatre@intel.com/

Yifan Wu (3):
  selftests/resctrl: Introduced linked list management for IMC counters
  selftests/resctrl: Replace array-based IMC counter management with
    linked lists
  selftests/resctrl: Add cleanup for MBM/MBA test

 tools/testing/selftests/resctrl/mba_test.c    |   1 +
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 159 ++++++++++--------
 4 files changed, 95 insertions(+), 68 deletions(-)

-- 
2.33.0


