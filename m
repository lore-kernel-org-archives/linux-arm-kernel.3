Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE75EE87846
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 16:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Gh6K8uzGpu07akesHYxtytk8Fu2WBHrOKhUBMvlkqGk=; b=KbjDSfzt7ESBZCkQYmUITyR3hi
	TGU61lnujCCC4ZevnuOzMOgdvLz6IVq761Vv2Y9bXbjHzBc1QHv/RnkOuH54fY8JYMBxEEuCzCvTW
	dxG+r+QRvZTqvSGVewL3WFLHSCz9AVUJxGBEFZEiN5P+qrgIppNIT4mU/XRPq39m3sen2xwG2xs68
	aspbzsLpmb8SBChzYESuFKjsqFRu5+La1XvIYr/whZ7yNC/1Hn9Fje1IaaPRp3FlUvTzXqj6egkjq
	7q/GZv+YPbailKfD/LTx6pctWm2TKj38sSXpSQvMZxpKZXd3OljbKZA2lraHQWz9O2xriweJziJyv
	a3JPPfIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ7B-00000006uXg-1KoC;
	Tue, 03 Feb 2026 16:18:57 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnJ78-00000006uVP-1iWs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 16:18:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Gh6K8uzGpu07akesHYxtytk8Fu2WBHrOKhUBMvlkqGk=;
	b=ruTunpaG+rhFgL8aPS72iBwO3hSKpfYoai0IsJt3ZCouseaQnnjQA78uKffbLGNdgcEIXMu0e
	BDGGjIkAQNsp7z/Z1FqrxOwIGhpmorvN2+L0RyLWvK7FrmpNmQZdj0aDGGFAVgb69p+c+UQTTHv
	F5oEUU2oY0x3EeTrTahRO8E=
Received: from mail.maildlp.com (unknown [172.19.162.144])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4f57pz6xRkzpSvR;
	Wed,  4 Feb 2026 00:14:35 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 5BEC940567;
	Wed,  4 Feb 2026 00:18:45 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 4 Feb 2026 00:18:45 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 4 Feb 2026 00:18:44 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <alexandre.belloni@bootlin.com>, <arnd@arndb.de>, <fustini@kernel.org>,
	<Jonathan.Cameron@huawei.com>, <krzk@kernel.org>, <linus.walleij@linaro.org>,
	<will@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <fanghao11@huawei.com>, <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <wangzhou1@hisilicon.com>,
	<xuwei5@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH 0/3] soc: Enable cache lockdown for HiSilicon L3 cache
Date: Wed, 4 Feb 2026 00:18:40 +0800
Message-ID: <20260203161843.649417-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_081854_759477_C439D193 
X-CRM114-Status: GOOD (  11.72  )
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

Provide support for L3 cache lockdown on HiSilicon L3 caches.

Cache lockdown means to make a memory region locked inside the L3 cache
for better access latency. The data stored in L3 cache will behave like
any other data (i.e. it still follows cache coherency protocol etc.)
except it won't be evicted unless explicitly asked to by deallocation.
This way a process may have an option to maintain QoS even with noisy
neighbors sharing the same L3 cache.

Ideally locked data will have stable low access latency despite high
background stress. It is also useful for scenarios that have especially
high cache miss penalty. However, while enhancing some processes,
reserving cache resource will raise the performance problem to other
processes running on the CPUs that share the L3 cache that carries
locked data, users should be careful to do so.

---

Changes since RFC v2:
- Fixed compile errors for x86 building.
- Link to v2: https://lore.kernel.org/all/20251217102357.1730573-1-wangyushan12@huawei.com/

Changes since RFC v1:
- Fixed compile errors of types specified in uapi header files.
- Changed ioctl numbers to avoid confliction.
- Link to v1: https://lore.kernel.org/all/20251125080542.3721829-1-wangyushan12@huawei.com/

Yushan Wang (3):
  soc cache: L3 cache driver for HiSilicon SoC
  soc cache: L3 cache lockdown support for HiSilicon SoC
  Documentation: soc cache: Add documentation to HiSilicon SoC cache

 Documentation/driver-api/hisi-soc-cache.rst   |  64 ++
 Documentation/driver-api/index.rst            |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   7 +
 drivers/soc/hisilicon/Kconfig                 |  11 +
 drivers/soc/hisilicon/Makefile                |   2 +
 drivers/soc/hisilicon/hisi_soc_l3c.c          | 883 ++++++++++++++++++
 include/uapi/misc/hisi_l3c.h                  |  28 +
 8 files changed, 997 insertions(+)
 create mode 100644 Documentation/driver-api/hisi-soc-cache.rst
 create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c
 create mode 100644 include/uapi/misc/hisi_l3c.h

-- 
2.33.0


