Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B72E9CA0EF8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 10:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ViWwyk8xA5c8CjACEGnBSfHoir4577hj2jzKqCqnRAw=; b=QLd5lKm1OO7IuGzw7/Jc3aLSPg
	HwbcbrWYupQe65RrufA1iLBZZlhGVqQk5eUI5IlR/wwig3kUm1TaMJHNKirlbA2gMNzVSY/fVdsue
	HjCtPjhKoasFY0Ala5lnd9veIq6XkGSaqmifXcMdVAQrHzqLGIEX8P3XxHP2gzeY6sKW6J7RzQe6W
	miI553hKKB6d3m1IBRVvQUd8BzXG4Y2skTvEF6pv/Tjad/MdICMh/zMnu1AcCtqD4SdpAXvyyt6/w
	tioCICxhVBsXtu67cB0eMY1M7cK1IL6xyjL86tBB7+FBZeA7PVw0RtLVYoDAtyCESHQKIuI80mZkt
	NuNYUd5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uog8a-0000000DBED-32MV;
	Wed, 20 Aug 2025 10:33:48 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoeS1-0000000Cn2p-0jmq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 08:45:47 +0000
Received: from mail.maildlp.com (unknown [172.19.88.194])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c6Klw0kDdz14MgL;
	Wed, 20 Aug 2025 16:45:32 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id DD7A5140123;
	Wed, 20 Aug 2025 16:45:35 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 16:45:35 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 20 Aug 2025 16:45:34 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <sudeep.holla@arm.com>, <james.clark@linaro.org>, <robh@kernel.org>,
	<anshuman.khandual@arm.com>, <jonathan.cameron@huawei.com>,
	<hejunhao3@huawei.com>, <linuxarm@huawei.com>, <prime.zeng@hisilicon.com>,
	<xuwei5@huawei.com>, <wangyushan12@huawei.com>, <yangyicong@hisilicon.com>
Subject: [PATCH v2 0/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Date: Wed, 20 Aug 2025 16:45:32 +0800
Message-ID: <20250820084534.28037-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_014545_375198_740B786C 
X-CRM114-Status: UNSURE (   8.92  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

This patchset fixed CPU_CYCLES counting on SMT system. CPU_CYCLES can use
PMCCNTR_EL0 which will count the hardware processor clock rather than the
PE clock (ARM DDI0487 L.b D13.1.3) on SMT cores which fails the users
expectation as CPU_CYCLES (0x0011) is defined to count on each PE cycles.
Fix this by avoid using PMCCNTR_EL0 on SMT cores when counting CPU_CYCLES.

Changes since v1:
- remove redundant comment and add tags on Patch 1/2
- detect the SMT implementation during PMU probe rather than runtime
Link: https://lore.kernel.org/linux-arm-kernel/20250812080830.20796-1-yangyicong@huawei.com/

Yicong Yang (2):
  perf: arm_pmuv3: Factor out PMCCNTR_EL0 use conditions
  perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores

 drivers/perf/arm_pmu.c        |  3 +++
 drivers/perf/arm_pmuv3.c      | 39 +++++++++++++++++++++++++++++++++--
 include/linux/arch_topology.h | 11 ++++++++++
 include/linux/perf/arm_pmu.h  |  1 +
 4 files changed, 52 insertions(+), 2 deletions(-)

-- 
2.24.0


