Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBC88D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:24:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DsAJPnMMJIor0UH4pSGnvhOrCV/pSw8vsbbtpOgb/Uw=; b=zD0Kw9JaTHYJ4chryK9cfiqtMY
	0Vpdnw7YssQcF4CJkQHvnsp8djd02QyQwU8fpoYVAzBg84fd/dBm2NYJpSiamr9GZ67aBGx55FSJA
	3pQ9QIBiLUkJOVxRuB0YMyIPpXQSTpwZNHVRbL7lM/iGxG04idDnaPHtD/K5d5yKW5IQYNZAScE6H
	pRwI2q26OyKwZBjMCMV96/iM0tdiRxuRZHT1U0J4b5sj3QelestrgZ+cx+hM3IzzyKn8c+mpt3Mum
	G3vf9S/EOIsvm9aJSH+nh385uRyNpBpBBdZeMuR31jroxn8wxW0dCPINzjfgaYLRxh1uqlixjPTYl
	MFTTFhyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVoha-00000006dRj-2oS9;
	Wed, 17 Dec 2025 10:24:14 +0000
Received: from canpmsgout12.his.huawei.com ([113.46.200.227])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVohW-00000006dQE-3kjZ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Dec 2025 10:24:12 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=DsAJPnMMJIor0UH4pSGnvhOrCV/pSw8vsbbtpOgb/Uw=;
	b=P6iVMMHH9/fxb+X8q5ScFXhbDMNSF48TJunfe1nBbfy31pU+EoVe1SQiiBFiW4A+ILeF3m1uV
	XT2dm8gPEtkEMErZL400OmZDVQn+Xk6lB2AgxXPi+lu1jbJYkUwbz+AJ/W1zBLqsoT/FOFNN2L8
	uF60hby0Ql2CzBTj10Dhvnw=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout12.his.huawei.com (SkyGuard) with ESMTPS id 4dWVG12JPDznTVZ;
	Wed, 17 Dec 2025 18:21:45 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id BAFAD1A016C;
	Wed, 17 Dec 2025 18:23:58 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 17 Dec 2025 18:23:58 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Wed, 17 Dec 2025 18:23:57 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<xuwei5@hisilicon.com>, <linuxarm@huawei.com>, <wangzhou1@hisilicon.com>,
	<Jonathan.Cameron@huawei.com>
CC: <liuyonglong@huawei.com>, <prime.zeng@hisilicon.com>,
	<fanghao11@huawei.com>, <alexandre.belloni@bootlin.com>, <arnd@arndb.de>,
	<fustini@kernel.org>, <krzk@kernel.org>, <linus.walleij@linaro.org>,
	<will@kernel.org>
Subject: [PATCH RFC v2 0/3] soc: Enable cache lockdown for HiSilicon L3 cache
Date: Wed, 17 Dec 2025 18:23:54 +0800
Message-ID: <20251217102357.1730573-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_022411_242228_DFFF8942 
X-CRM114-Status: GOOD (  12.39  )
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
kernel.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

---

Changes since v1:
- Fixed compile errors of types specified in uapi header files.
- Changed ioctl numbers to avoid confliction.
- Link to v1: https://lore.kernel.org/all/20251125080542.3721829-1-wangyushan12@huawei.com/

Yushan Wang (3):
  soc cache: L3 cache driver for HiSilicon SoC
  soc cache: L3 cache lockdown support for HiSilicon SoC
  Documentation: soc cache: Add documentation to HiSilicon SoC cache

 Documentation/driver-api/hisi-soc-cache.rst   |  62 ++
 Documentation/driver-api/index.rst            |   1 +
 .../userspace-api/ioctl/ioctl-number.rst      |   1 +
 MAINTAINERS                                   |   7 +
 drivers/soc/hisilicon/Kconfig                 |  10 +
 drivers/soc/hisilicon/Makefile                |   2 +
 drivers/soc/hisilicon/hisi_soc_l3c.c          | 877 ++++++++++++++++++
 include/uapi/misc/hisi_l3c.h                  |  28 +
 8 files changed, 988 insertions(+)
 create mode 100644 Documentation/driver-api/hisi-soc-cache.rst
 create mode 100644 drivers/soc/hisilicon/hisi_soc_l3c.c
 create mode 100644 include/uapi/misc/hisi_l3c.h

-- 
2.33.0


