Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AD63CD13D2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 01:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wuX5r28VaexWnYhOLnt7f93j+3rz9YK+PcJBP/DbyyY=; b=aNkFu30DG+SQkO/H11S5Zeasj7
	LJZ09aotVwZkeYfM02NSazsFGm0hEzGjo0NNHeratb9A0e282Ha/bxZyRersJxNEGkOCeOTT83+Yi
	bhFH9XUNmAMjdmlouhoOprC3EsmDuH58iTCZu3aTvb5D+aYGX62dz0gy/uFbrIkgj0ue/qrTcqzkK
	vooma5DFEumHytNhVGjssFOLZq8ei4Tr85CrxiwrfyvZ1BZvGDll+2/K9MyZ081IfQ9gZ/IEQHe2X
	kUnI5/kScadlrkAl3e1ixF+thx7pwcgeB4lxsUW9mr85QuPeOUgyOdmaYTS9ezRcftwdIKsKSRAQ0
	eAbbCrQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08X-00000007zD9-0Oey;
	Wed, 12 Nov 2025 01:59:05 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJ08R-00000007z9r-2HmC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 01:59:01 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=wuX5r28VaexWnYhOLnt7f93j+3rz9YK+PcJBP/DbyyY=;
	b=nf6racO2ksupU9wnn7MfavGg5x+g9M7INfJAy2o3q9Itvw5SbuaeUa0L2xgDo5LTzma7YBj6a
	2tOcS8MpWNvVWvo7OTjD4FW4TnG/HXjnAciTL84eHGp7WasyyJ5J8KwQhG85pKW6pHTMaVNMc9N
	aNat5F8LjTaYTJ9S9WAzOkE=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4d5mjy0VhLzKm7C;
	Wed, 12 Nov 2025 09:57:10 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 00E0A1A0174;
	Wed, 12 Nov 2025 09:58:50 +0800 (CST)
Received: from kwepemq200001.china.huawei.com (7.202.195.16) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:48 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemq200001.china.huawei.com (7.202.195.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 12 Nov 2025 09:58:48 +0800
From: Chenghai Huang <huangchenghai2@huawei.com>
To: <arnd@arndb.de>, <catalin.marinas@arm.com>, <will@kernel.org>,
	<akpm@linux-foundation.org>, <anshuman.khandual@arm.com>,
	<ryan.roberts@arm.com>, <andriy.shevchenko@linux.intel.com>,
	<herbert@gondor.apana.org.au>, <linux-kernel@vger.kernel.org>,
	<linux-arch@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-crypto@vger.kernel.org>, <linux-api@vger.kernel.org>
CC: <fanghao11@huawei.com>, <shenyang39@huawei.com>, <liulongfang@huawei.com>,
	<qianweili@huawei.com>
Subject: [PATCH RFC 0/4] Introduce 128-bit IO access
Date: Wed, 12 Nov 2025 09:58:42 +0800
Message-ID: <20251112015846.1842207-1-huangchenghai2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemq200001.china.huawei.com (7.202.195.16)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_175859_795600_213D59F3 
X-CRM114-Status: GOOD (  12.46  )
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

These patches introduce 128-bit IO access functionality. The reason
is that the current HiSilicon cryptographic devices need to
maintain atomic operations when accessing 128-bit MMIO across
physical and virtual functions.

Currently, 128-bit atomic writes have already been implemented in
the device driver, and the driver also depends on a 128-bit atomic
read access interface. Therefore, we have introduced a generic
128-bit IO access interface to replace the implementation of
128-bit read and write IO interfaces using instructions in the
device driver. When the architecture does not support 128-bit
atomic operations, non-atomic 128-bit read and write interfaces can
be used to make the driver functional.

Weili Qian (4):
  UAPI: Introduce 128-bit types and byteswap operations
  asm-generic/io.h: add io{read,write}128 accessors
  io-128-nonatomic: introduce io{read|write}128_{lo_hi|hi_lo}
  arm64/io: Add {__raw_read|__raw_write}128 support

 arch/arm64/include/asm/io.h                  | 21 +++++++++
 include/asm-generic/io.h                     | 48 ++++++++++++++++++++
 include/linux/io-128-nonatomic-hi-lo.h       | 35 ++++++++++++++
 include/linux/io-128-nonatomic-lo-hi.h       | 34 ++++++++++++++
 include/uapi/linux/byteorder/big_endian.h    |  6 +++
 include/uapi/linux/byteorder/little_endian.h |  6 +++
 include/uapi/linux/swab.h                    | 10 ++++
 include/uapi/linux/types.h                   |  3 ++
 8 files changed, 163 insertions(+)
 create mode 100644 include/linux/io-128-nonatomic-hi-lo.h
 create mode 100644 include/linux/io-128-nonatomic-lo-hi.h

-- 
2.33.0


