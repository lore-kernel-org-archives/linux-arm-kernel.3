Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A68DCCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 07:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TUtKpYDIHuKRFyrLUMsfR7FjJX4crrKYSXgptWij7qo=; b=T1M3I5uS9KNQ2+ocw8SRElt3Cq
	IpmKOD+l632mRA8RieOGtKBQiaXPYZzQTTXxz5srST7qHTd65gfKymTBNIAtcJKTxDWUi6PDXtpce
	Ls9OdtCMiF7uV7VWqMvE69Ul0AT6ZlEbtsLxhVHrDi35AYMx+Ay2t2kLeP6kUEUl0kC3WcNKCtY+N
	5UCkVf/jQ38u9/5/N+ZS3qreIES1UHlzmqoxL1SP5sXwMw/mYPmd8GdnchYRllWfOrWXO/8YPqv+P
	GgWiXiNC3hVkUQOhMpibnA6/tx3V4MtGpTiu1GwjCd8bUdwQCGJTj9DlbgHKZtpT1Kxq3aV/1KSpo
	d+zWfTgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtX-0000000BMa9-1ncv;
	Tue, 04 Nov 2025 07:55:59 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGBtT-0000000BMYT-44GV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Nov 2025 07:55:57 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=TUtKpYDIHuKRFyrLUMsfR7FjJX4crrKYSXgptWij7qo=;
	b=M0DKv6WGTzPX1EkgHOmhX1DzI0XAzT54raZYRJee3MH/syyLn+W1+g9BnucvYimGZjtiE2nHH
	ovureVHhfPs7MNPmDI3YpJJ8+jTCnQJmbXo88Tn+PVlNG/85H2bl00UAW3Ryx/Zzyqvx+1aTRSC
	5kvXGpSSal7dvLaQQOurgcY=
Received: from mail.maildlp.com (unknown [172.19.88.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4d111b0rcPz1cySR;
	Tue,  4 Nov 2025 15:54:11 +0800 (CST)
Received: from kwepemk500012.china.huawei.com (unknown [7.202.194.97])
	by mail.maildlp.com (Postfix) with ESMTPS id 0829F1A016C;
	Tue,  4 Nov 2025 15:55:46 +0800 (CST)
Received: from localhost.localdomain (10.50.163.32) by
 kwepemk500012.china.huawei.com (7.202.194.97) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Tue, 4 Nov 2025 15:55:45 +0800
From: Bowen Yu <yubowen8@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<catalin.marinas@arm.com>, <will@kernel.org>, <beata.michalska@arm.com>,
	<ptsm@linux.microsoft.com>, <linuxarm@huawei.com>,
	<jonathan.cameron@huawei.com>
CC: <zhanjie9@hisilicon.com>, <prime.zeng@hisilicon.com>,
	<wanghuiqiang@huawei.com>, <xuwei5@huawei.com>, <zhenglifeng1@huawei.com>,
	<yubowen8@huawei.com>, <zhangpengjie2@huawei.com>
Subject: [PATCH 0/3] arm64: topology: Improve cpuinfo_avg_freq for ARM64
Date: Tue, 4 Nov 2025 15:55:41 +0800
Message-ID: <20251104075544.3243606-1-yubowen8@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk500012.china.huawei.com (7.202.194.97)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_235556_176100_235E829D 
X-CRM114-Status: UNSURE (   6.19  )
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

This series addresses several issues in CPU avgfreq reporting:

Patch 1:
- Implements direct frequency calculation using AMU counters:
  freq = (core_cycles_delta * timer_freq) / (const_cycles_delta 
  * HZ_PER_KHZ)
- Eliminates precision loss from SCHED_CAPACITY_SHIFT bit-shifting

Patch 2:
- Resolves unreliable cpuinfo_avg_freq behavior during idle periods
- Replaces invalid returns with governor's current frequency as fallback
  value when all CPUs in policy are idle

Patch 3:
- Removes redundant housekeeping_cpu() check

Bowen Yu (3):
  arm64: topology: Improve AMU-based frequency calculation
  arm64: topology: Use current freq in governor for idle cpus in
    cpuinfo_avg_freq
  arm64: topology: Remove redundant housekeeping_cpu() checks in
    arch_freq_get_on_cpu

 arch/arm64/kernel/topology.c | 40 +++++++++++++++---------------------
 1 file changed, 17 insertions(+), 23 deletions(-)

-- 
2.33.0


