Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B452BE99062
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Apr 2026 09:34:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U7aexDBYjzFhqpIUVgOryHwFMOm26RrjCXdTykrO8Hw=; b=gCYefS/BpiThg5AlfPM5aOsPGF
	ThhLPUr64SvU7teJ9rg4C0rw76nzlfSvx7cRKzyzVjJcdE6uY33+DK2HSSMgWEnMqtsKySc7aNmfV
	Rcus3ubvGmI8UCsZKgMeCNoEau+x0QzceHbFE9KdcohFVRiEBnJcjDRFnqziKxkqJpRc+705WZcAN
	df4lP6tUwywNxfT2st/mIpziawlTeDrTDei5VzYwuGmVQj+9ebWSWQVCUdF5GpxrGHV5/dM/Ekm44
	P6X9Fl2f0BhNZWF/v/OU5F+k0qvXPXWSmJuOYBHXUd2SWJn3BvS+LN34ycPqSCM5+tp0rx4Vuq6jx
	2KwsfhcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fn-0000000BvBf-2Ywu;
	Fri, 10 Apr 2026 09:34:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fn-0000000BvB0-0PfI
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 10 Apr 2026 09:34:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=U7aexDBYjzFhqpIUVgOryHwFMOm26RrjCXdTykrO8Hw=; b=nxuk8Bgp7E7yCVbU+eBb5VOjJV
	bVloWTyL5Df77b/xfyife1l493nJFLr1ctm/dWESqF/p2/ZI9KY7pKytocehZ1CzFCQHM6Xew8Ups
	cCdmn9nJPpal69nqmBKNPJbBk3HOWqFXgpQbbyHbPkRy1SbrX7QvFgnYNibFwYCe0F/9YQ/G8Chjg
	xiVCON9iPKRazlhI3TqymWpK5ltZF/c7L5dPB8rxaDcWiZ/7xyppmM82N0moEGSgDl7RBM/M36O5B
	hg0G5o9RkOpqc/sdCwbbOvZAXCiiYCrVuW8Nj7FFuNojrNZf1qvIl0FN5DqVVuU+P3v+D7t4PpJUK
	ZL8GWKlA==;
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wB8Fj-0000000DBg5-2xGw
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Apr 2026 09:34:17 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=U7aexDBYjzFhqpIUVgOryHwFMOm26RrjCXdTykrO8Hw=;
	b=AuAYrJSb31WeikXdnSgxza+xhTGfOJO2HxJpcbzACfeGZPt5VlzMKdhnj2Z66jbv9ExyJsg8R
	FNyH24RDrKfRxaHTz6SVckuObDPqjmjyz+lB+DvndDRHRyvHGlzO90nx54DF5eJG9dwZm2rARRC
	VcMRWvM+FQgJPBT5tjO6wOA=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4fsWfw4LQlzKm4w;
	Fri, 10 Apr 2026 17:27:36 +0800 (CST)
Received: from kwepemk500005.china.huawei.com (unknown [7.202.194.90])
	by mail.maildlp.com (Postfix) with ESMTPS id B8FA640563;
	Fri, 10 Apr 2026 17:33:53 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemk500005.china.huawei.com
 (7.202.194.90) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 10 Apr
 2026 17:33:52 +0800
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
Subject: [PATCH v2 0/6] selftests/resctrl: Add dynamic linked list management for IMC counters
Date: Fri, 10 Apr 2026 17:33:46 +0800
Message-ID: <20260410093352.3988125-1-wuyifan50@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk500005.china.huawei.com (7.202.194.90)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_103416_067143_E438C16B 
X-CRM114-Status: UNSURE (   9.79  )
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
https://lore.kernel.org/lkml/cover.1775266384.git.reinette.chatre@intel.com/

changelog:
1. Fixed the code style and variable naming.
2. The initialization and cleanup of the linked list are integrated in patch 1.
3. The use of arrays is refactored to linked list split in the remaining patches.
4. The IMC count and global variable imcs are removed.
For more details, see the commit message.

v1 can be found at:
https://lore.kernel.org/all/20260324125034.1509177-1-wuyifan50@huawei.com/

Yifan Wu (6):
  selftests/resctrl: Introduced linked list management for IMC counters
  selftests/resctrl: Refactor the discovery of IMC counters using linked
    list
  selftests/resctrl: Refactor the initialization of IMC's perf_event_attr
    using linked list
  selftests/resctrl: Refactor perf event open/close using linked list
  selftests/resctrl: Refactor reading from IMC using linked list
  selftests/resctrl: Remove the definition of the IMC counter config
    array and imcs.

 tools/testing/selftests/resctrl/mba_test.c    |   1 +
 tools/testing/selftests/resctrl/mbm_test.c    |   1 +
 tools/testing/selftests/resctrl/resctrl.h     |   2 +
 tools/testing/selftests/resctrl/resctrl_val.c | 147 ++++++++++--------
 4 files changed, 82 insertions(+), 69 deletions(-)

-- 
2.43.0


