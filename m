Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5EBFE8306E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 09:54:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BDF2DW3c4vO9l9QFri8rWZh+AWRNDC7L4+8DdH24+1I=; b=M2kraHNtZNg1ytrIn7uUAYnXGC
	SdQwZJi/14LsR8Sb+nBM6LogTAAQYMYs97m7HJya7O88God+TY74YgtABXUXRCI59ZUwrh/oFaa2u
	icprnZBsAh7grmur4RXP2waXgJXyzGzh8A39G3dqehowoOVqKfRb//ACKB1GPenamxdlxLmwrIO8B
	hgp9TDL6GgukgsqH49m/QrGONxRnROF3IuEQcoI+pQTUrCaYi/RjacjMN/il1exwTGFq3SOuOG2TJ
	MOaP7FOerrN+Wkht9oY2WKVpOmTUjeo6MAWGE7Ne+V9BJ5T2eOOBtPiEqXJL8J20bOLsEwFNdYWaL
	Cd3yxHgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD7E-00000006QG7-1hzY;
	Tue, 03 Feb 2026 09:54:36 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnD7B-00000006QEQ-25Ad
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 09:54:35 +0000
dkim-signature: v=1; a=rsa-sha256; d=h-partners.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=BDF2DW3c4vO9l9QFri8rWZh+AWRNDC7L4+8DdH24+1I=;
	b=pxQHVQ1ARrHDMN2p2DooiNN3v4BHCdIYcY7Eh/Xx/ne9zymI45MdXBd/Mmcb7pVHmkMcann9q
	bw72+dg5E6H5Lv6OCEz2073gwipGAQ9/TFYyJt8vFuF304mzDrdfCH+ttR34MjtxEe3sjSWRHCw
	nZ9rcLkMFAgrZx/3fcA3Vk0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4f4zGz3m1dzKm9P;
	Tue,  3 Feb 2026 17:49:47 +0800 (CST)
Received: from kwepemf100008.china.huawei.com (unknown [7.202.181.222])
	by mail.maildlp.com (Postfix) with ESMTPS id 9E3784055B;
	Tue,  3 Feb 2026 17:54:21 +0800 (CST)
Received: from huawei.com (10.50.87.109) by kwepemf100008.china.huawei.com
 (7.202.181.222) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.36; Tue, 3 Feb
 2026 17:54:20 +0800
From: Zeng Heng <zengheng4@huawei.com>
To: <xry111@xry111.site>, <catalin.marinas@arm.com>, <maz@kernel.org>,
	<ardb@kernel.org>, <yang@os.amperecomputing.com>, <ryan.roberts@arm.com>,
	<kevin.brodsky@arm.com>, <reinette.chatre@intel.com>,
	<miko.lenczewski@arm.com>, <will@kernel.org>, <suzuki.poulose@arm.com>,
	<thuth@redhat.com>, <ben.horgan@arm.com>, <james.clark@linaro.org>,
	<james.morse@arm.com>, <lpieralisi@kernel.org>, <broonie@kernel.org>,
	<oupton@kernel.org>, <anshuman.khandual@arm.com>, <yeoreum.yun@arm.com>,
	<leo.yan@arm.com>, <mrigendra.chaubey@gmail.com>, <fenghuay@nvidia.com>,
	<ahmed.genidi@arm.com>, <mark.rutland@arm.com>
CC: <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<wangkefeng.wang@huawei.com>
Subject: [PATCH v2 0/2] arm_mpam: Add support for the MPAM v0.1 architecture version
Date: Tue, 3 Feb 2026 17:54:04 +0800
Message-ID: <20260203095406.6437-1-zengheng4@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.87.109]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemf100008.china.huawei.com (7.202.181.222)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_015433_996010_7612EEC9 
X-CRM114-Status: UNSURE (   9.89  )
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

According to the MPAM spec [1], the supported architecture versions are
v1.0, v1.1 and v0.1. MPAM versions v0.1 and v1.1 are functionally
identical, but v0.1 additionally supports the FORCE_NS feature.

ID_AA64PR | ID_AA64PR | MPAM Extension | Notes
F0_EL1.   | F1_EL1.   | Architecture   |
MPAM      | MPAM_frac | version        |
---------------------------------------------------------------------------
0b0000    | 0b0001    | v0.1           | MPAM v0.1 is implemented.
          |           |                | MPAM v0.1 is the same as MPAM v1.1
          |           |                | with FORCE_NS which is
          |           |                | incompatible with MPAM v1.0.
---------------------------------------------------------------------------
0b0001    | 0b0000    | v1.0           | MPAM v1.0 is implemented.
---------------------------------------------------------------------------
0b0001    | 0b0001    | v1.1           | MPAM v1.1 is implemented.
          |           |                | MPAM v1.1 includes all features of
          |           |                | MPAM v1.0.
          |           |                | It must not include FORCE_NS.

[1] https://developer.arm.com/documentation/ddi0598/db/?lang=en

Changes in v2:
- Add new patch 2 to check the MPAM MSC version.

v1: https://lore.kernel.org/all/20260104133434.1887677-1-zengheng4@huawei.com/

Zeng Heng (2):
  arm64: cpufeature: Add support for the MPAM v0.1 architecture version
  arm_mpam: Update architecture version check for MPAM MSC

 arch/arm64/include/asm/cpufeature.h |  7 +++++++
 arch/arm64/include/asm/el2_setup.h  |  4 +++-
 arch/arm64/kernel/cpufeature.c      | 15 +++++++++++----
 drivers/resctrl/mpam_devices.c      | 16 +++++++++++++---
 drivers/resctrl/mpam_internal.h     |  5 ++++-
 5 files changed, 38 insertions(+), 9 deletions(-)

--
2.25.1


