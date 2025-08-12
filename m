Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2B3CA0EDB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Aug 2025 12:36:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dv4fLrK0UOHhQkLWBMb22z6/gxmtyVbH/9nqZ3efXTQ=; b=veT73G6+BVAs6gdT6Y+AKdfk7t
	irbN/aaFAexDaBC03Y40NwNE77EdS1wbpX6tSuYQXnnv9/TVGCdqlkiW+OCnYmZiHpe/u7WXlF+NH
	YfmESSSrryGV2/GWF0IM3Spkcqpkce1uho7YGzVCYWAnA2nMqOttQ1hpidwS+cp2J5G26ETfWOxKl
	07eAeU7eR5+Q+xMKdoQQSK0/dRebUSbLzFKA4yu6HSFHKUmc164B3yfRz+zbR0KpbQBWB9rCKEB6U
	bJkpmQaY2PDUC+stYVCnqGvbZEhMZRGnQpo4h5DUbG5qV/d/JS5jAPCGwOEP5Pqcxywe6iKPBmBBZ
	jEeKKVBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uloEn-0000000Ahuw-0nPC;
	Tue, 12 Aug 2025 12:36:21 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulk3j-0000000ACai-2htp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Aug 2025 08:08:41 +0000
Received: from mail.maildlp.com (unknown [172.19.162.112])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4c1PFr71hTz2TT3c;
	Tue, 12 Aug 2025 16:05:52 +0800 (CST)
Received: from dggemv705-chm.china.huawei.com (unknown [10.3.19.32])
	by mail.maildlp.com (Postfix) with ESMTPS id CB220140230;
	Tue, 12 Aug 2025 16:08:31 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv705-chm.china.huawei.com (10.3.19.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 16:08:31 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 12 Aug 2025 16:08:30 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <james.clark@linaro.org>, <robh@kernel.org>, <anshuman.khandual@arm.com>,
	<jonathan.cameron@huawei.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<prime.zeng@hisilicon.com>, <xuwei5@huawei.com>, <wangyushan12@huawei.com>,
	<yangyicong@hisilicon.com>
Subject: [PATCH 0/2] perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
Date: Tue, 12 Aug 2025 16:08:28 +0800
Message-ID: <20250812080830.20796-1-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250812_010839_832169_D6DC0D5D 
X-CRM114-Status: UNSURE (   6.73  )
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

Yicong Yang (2):
  perf: arm_pmuv3: Factor out PMCCNTR_EL0 use conditions
  perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores

 drivers/perf/arm_pmuv3.c | 39 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 37 insertions(+), 2 deletions(-)

-- 
2.24.0


