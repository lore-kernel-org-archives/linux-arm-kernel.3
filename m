Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13B78CD5BAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 May 2026 09:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XXZIt/IRMdpz6Q7Qv47k57QVKqhas9hhPMosHbHkOcA=; b=Eu9Yk0/9IZ430fh3KdgzCFipm7
	2zIi7eS9nWw9wrPWn05tOAowQ5W3EFgytqGt0ywdcVC1uWTgz383pqUCPzrSvQJk/5tm+YGUTnW8W
	uPJfW1loj3JofrSNxPqTZt4/IpVvCifKsKZ+UOKAAPjeslj+VRBcZaIJw2GgqP1z/koyEDMk6jRSE
	1LkCaJ2p9Q50dKTnkwi5jR7CHn0Yig7KeYZ4vOXlg2ufddly1JwPf9VkJ+xnSWT8Xx1GhyJVCMstA
	gIa6jlRGImvE3v8+NOp+rqiJsXK0EJB8gKsQHBiRD1QDn+IkxSC+Pc7hF1NpKrKRINXm+KHPySqZu
	AaV+srGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLpK-0000000AGYJ-2z63;
	Fri, 22 May 2026 09:05:54 +0000
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQLpH-0000000AGW4-3TIh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 May 2026 09:05:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=XXZIt/IRMdpz6Q7Qv47k57QVKqhas9hhPMosHbHkOcA=;
	b=FrYcGZtK2Q6waeF8Nok7HXk/4mvM5F/JP+BFiIKa97kb53VUncbbEvCAi9EuzdRKHY8J2OpU0
	huLztcdDLr+AwFgNDvECu6hfxFSgBPCYfjrAZlkIo5YGIone6OBhtXDja7HPwGaFKTPWKhqLYCg
	pbW9uBQn2Icm/cRCFN4UTAQ=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4gMK1M3XmvzLlSh;
	Fri, 22 May 2026 16:57:59 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id A70DA4056C;
	Fri, 22 May 2026 17:05:41 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 22 May
 2026 17:05:40 +0800
From: Yifan Wu <wuyifan50@huawei.com>
To: <wuyifan50@huawei.com>, <tony.luck@intel.com>,
	<reinette.chatre@intel.com>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<babu.moger@amd.com>, <shuah@kernel.org>, <tan.shaopeng@fujitsu.com>,
	<fenghuay@nvidia.com>, <ben.horgan@arm.com>, <zengheng4@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kselftest@vger.kernel.org>, <linuxarm@huawei.com>
CC: <xiaqinxin@huawei.com>, <prime.zeng@hisilicon.com>,
	<wangyushan12@huawei.com>, <xuwei5@huawei.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>
Subject: [PATCH v3 0/3] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Fri, 22 May 2026 17:05:37 +0800
Message-ID: <20260522090540.444554-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260522_020552_343503_2AC2A2E3 
X-CRM114-Status: UNSURE (   8.30  )
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

This patch series introduces dynamic linked list management for IMC
counters, enabling the tests to use all available counters detected by
hardware instead of a fixed upper limit, without the need for array
bounds checking.

This series is based on Reinette's patch series aimed at fixing the
resctrl tests, available at:
https://lore.kernel.org/lkml/cover.1775266384.git.reinette.chatre@intel.com/

Changes in v3:
- Rename functions and update comments.
- Split the patches into incremental changes.
- Explicitly release memory after failing to parse the imc config.

Changes in v2:
- Fix code style and variable names.
- Integrate linked list initialization and cleanup into patch 1.
- Split the conversion from arrays to linked list across the remaining
  patches.
- Remove the IMC count and the global imcs variable.

v2: https://lore.kernel.org/all/20260410093352.3988125-1-wuyifan50@huawei.com/
v1: https://lore.kernel.org/all/20260324125034.1509177-1-wuyifan50@huawei.com/

Yifan Wu (3):
  selftests/resctrl: Introduce linked list management for IMC counters
  selftests/resctrl: Replace counter index references with pointers
  selftests/resctrl: Enable dynamic management of IMC counters via
    linked list

 tools/testing/selftests/resctrl/mba_test.c    |   1 +
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 160 ++++++++++--------
 4 files changed, 91 insertions(+), 73 deletions(-)

-- 
2.34.1


