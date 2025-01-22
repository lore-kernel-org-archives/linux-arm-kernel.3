Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3BBAC02181
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jan 2025 07:02:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=x6o0B/mABlYNetR8Yrdio0jBp79xBeavOzkwWl0sd0Q=; b=35R1ZWCkumbapWfDEmM3gsApnP
	jWuwIGyJ48iz3xuScmUnRdZ4c8UCru3m+UyTjJuAVOQ8mgZD2LtHtb6Lvo/o1UdYWP2o2fSrr3M+k
	y5SlI5VaiU7q4aE9iMDuA+4C3lku5o1e+c6Abr7vxZezSVU00a01aGz5DZlWptoaG+Xl4vze2uw5I
	tgLG8iTC3h9vphitRvFvZKbsTYmug9jRjhGZp9+0/CgMg8fg8J6ORnwVcA+wpbPuVeYB+vTQ9vr8A
	1Lzkx6bP8Y7pffTWsEzVErs4IgFLTxwA2NigvK2TX8eGE5dq0B+d2YgDoEiWHPrgtKQ6bAKLqjufk
	zA1pkIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taUkd-00000009ZAr-2nwP;
	Wed, 22 Jan 2025 07:02:11 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taUgr-00000009YXi-3KZM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jan 2025 06:58:19 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4YdFHh6x2mz1JHv7;
	Wed, 22 Jan 2025 14:57:04 +0800 (CST)
Received: from dggpemf100016.china.huawei.com (unknown [7.185.36.236])
	by mail.maildlp.com (Postfix) with ESMTPS id 3EE2314013B;
	Wed, 22 Jan 2025 14:58:05 +0800 (CST)
Received: from localhost.huawei.com (10.50.165.33) by
 dggpemf100016.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jan 2025 14:58:04 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <xuwei5@hisilicon.com>, <yangyicong@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>, <wangjie125@huawei.com>,
	<wanghuiqiang@huawei.com>, <christophe.jaillet@wanadoo.fr>
CC: <prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangyushan12@huawei.com>, <linuxarm@huawei.com>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 0/2] soc cache: Add support for HiSilicon L3 cache
Date: Wed, 22 Jan 2025 14:58:01 +0800
Message-ID: <20250122065803.3363926-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggpemf100016.china.huawei.com (7.185.36.236)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_225818_017374_DAF8EFAC 
X-CRM114-Status: GOOD (  11.58  )
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

This series adds support for HiSilicon SoC cache lockdown and cache
maintenance operations.

Cache lockdown feature prevents cache entries from being evicted from L3
cache for better performance.  It can be enabled by calling mmap
function to the file (`/dev/hisi_soc_cache_mgmt`).  This feature is
implemented in the driver hisi_soc_l3c.

L3 cache and L3 cache PMU share the same memory resource, which makes
one fails to probe while another is on board.  Since both devices
rely on distinct information exported by ACPI, their probing functions
should be unrelated.  Workaround the resource conflict check by
replacing devm_ioremap_resource() to devm_ioremap() instead.

Changes in v2:
  - Save unnecessary iterations when performing cache lock. (Christophe)
  - Other minor style changes. (Christophe)
  - Link to v1: https://lore.kernel.org/all/20250107132907.3521574-1-wangyushan12@huawei.com

Jie Wang (1):
  soc cache: Add framework driver for HiSilicon SoC cache

Yushan Wang (1):
  soc cache: L3 cache lockdown support for HiSilicon SoC

 drivers/soc/hisilicon/Kconfig                 |  22 +
 drivers/soc/hisilicon/Makefile                |   2 +
 .../soc/hisilicon/hisi_soc_cache_framework.c  | 534 ++++++++++++++++++
 .../soc/hisilicon/hisi_soc_cache_framework.h  |  77 +++
 drivers/soc/hisilicon/hisi_soc_l3c.c          | 527 +++++++++++++++++
 5 files changed, 1162 insertions(+)
 create mode 100644 drivers/soc/hisilicon/hisi_soc_cache_framework.c
 create mode 100644 drivers/soc/hisilicon/hisi_soc_cache_framework.h
 create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c

-- 
2.33.0


