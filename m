Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0210ACFD364
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Nov 2025 08:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CLDn6xO7nFEDRhFsp4Eh7VRjGjgxGX7lP/jACykz7gc=; b=1cu+xSoyhxIYVd9gcdyGHFxvLT
	tuueg6EysXW96k7H3v2B44Vp8PKuKckYQLdUpK9vf2CH4WL1YunYb6+duV4rz8qYLs7gIJ2qrlZXN
	k4bgtULHyKZbCwN1Xk9EwayeGCOL+e12ETQWUpOEB3HipItKB15Gkg+DwICpdNdvnzWQh0EoXiMCW
	4Yl69/K9D5TlwW7x0xD+SA6XvBHQP1dukIXFrpHlhTKkNN5rVFegBziaAb3cwAnexOII+2oGOTy0h
	0i49s1unuzgUOzGXXCD/FAKzIJdNc/d0ieMdFo8d5CJBTiTqtgeOT1wTeCVaaWqv1dfykHlZImLsV
	hxA9u9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNo3r-0000000CxGO-45hz;
	Tue, 25 Nov 2025 08:06:07 +0000
Received: from canpmsgout06.his.huawei.com ([113.46.200.221])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vNo3h-0000000CxCD-4BCf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Nov 2025 08:06:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=CLDn6xO7nFEDRhFsp4Eh7VRjGjgxGX7lP/jACykz7gc=;
	b=3dNMfQZqxEHUB/GrQaltwq/Rje+VubEpC0/sT2V0QJBOwnLACameyNGKBc2YFUPFFhdk3i63Y
	5SIAc8ZcbDL3+sXTuRK+gLcjUFKGWETBz46V2TiYxy55m56L5w6R13Y19Q3DseB2FbIq4I13bws
	oohWm/cbsdBfJ11bVAm1GVU=
Received: from mail.maildlp.com (unknown [172.19.163.252])
	by canpmsgout06.his.huawei.com (SkyGuard) with ESMTPS id 4dFwF85N4PzRhQv;
	Tue, 25 Nov 2025 16:03:56 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 0D3A6180B36;
	Tue, 25 Nov 2025 16:05:44 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 25 Nov 2025 16:05:43 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Tue, 25 Nov 2025 16:05:43 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <xuwei5@hisilicon.com>, <Jonathan.Cameron@huawei.com>,
	<wanghuiqiang@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linuxarm@huawei.com>
CC: <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangyushan12@huawei.com>
Subject: [RFC PATCH 0/3] soc: Enable cache lockdown for HiSilicon L3 cache
Date: Tue, 25 Nov 2025 16:05:39 +0800
Message-ID: <20251125080542.3721829-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251125_000558_226341_32305773 
X-CRM114-Status: GOOD (  13.05  )
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

Cache has been playing the transparent yet crucial role of performance
for modern computers. To fully exploit the potential of SoC cache, we
made an attempt to lockdown the HiSilicon L3 cache.

Cache lockdown means to make a memory region locked inside the L3 cache
for better access latency. The data stored in L3 cache will behave like
any other data (i.e. it still follows cache coherency protocol etc.)
except it won't be evicted unless explicitly asked to by deallocation.

Ideally locked data will have stable low access latency despite high
background stress. It is also useful for scenarios that have especially
high cache miss penalty. However, while enhancing some processes,
reserving cache resource will raise the performance problem to other
processes running on the CPUs that share the L3 cache that carries
locked data, users should be careful to do so.

I would like to ask for opinions about the possibility to make this
driver upstream, and the possible usecase of L3 cache lock within
kernel. Further tests are needed to obtain the performance benefits and
impact we get from L3 cache lock on such usecases.

Yushan Wang (3):
  soc cache: L3 cache driver for HiSilicon SoC
  soc cache: L3 cache lockdown support for HiSilicon SoC
  Documentation: soc cache: Add documentation to HiSilicon SoC cache

 Documentation/driver-api/hisi-soc-cache.rst   |  62 ++
 Documentation/driver-api/index.rst            |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 drivers/soc/hisilicon/Kconfig                 |  10 +
 drivers/soc/hisilicon/Makefile                |   2 +
 drivers/soc/hisilicon/hisi_soc_l3c.c          | 877 ++++++++++++++++++
 include/uapi/misc/hisi_l3c.h                  |  28 +
 7 files changed, 981 insertions(+)
 create mode 100644 Documentation/driver-api/hisi-soc-cache.rst
 create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c
 create mode 100644 include/uapi/misc/hisi_l3c.h

-- 
2.33.0


