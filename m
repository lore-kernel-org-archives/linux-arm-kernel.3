Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E446F589D4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 13:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4XEdIRO7bn6KGtF5i8gLxF5Bjo0q4vcIn20B8kZnyPM=; b=T5FyjZ7sW3EIkRqMOoZyQ5Mjvp
	MBWZgrDzYBaEvM3r/ApUbGPJPfTcpLP7HBgiJEPoz4Tm/i60iAOqg0xw2WtK9BJoHfh2H0Tff5X83
	4aX5S4niNr48kSUqpL0gEJt5F+2CjHUFGro3OIeyZuKe5ptu06En5FXVl0WOySXBfXhX3B2z+ae1B
	W2qhbgn48B4a9ceahAuD3u0nFMBxE6NkHs05aEnHRK8waAUJI/yVnnx7Re0+xFG6RoXP1nmsKp4fo
	npPjT6QI0bGGaVucPQBViMu0k2cNdt5sYeipYH0m9p/C5NKLF+hq8me82qFSRlmK7SWuDLxCnAexi
	UGRRzTvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuOi-0000000BloZ-08Qg;
	Thu, 23 Apr 2026 13:47:17 +0000
Received: from canpmsgout11.his.huawei.com ([113.46.200.226])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFuOc-0000000Bln6-39IB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 13:47:14 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=4XEdIRO7bn6KGtF5i8gLxF5Bjo0q4vcIn20B8kZnyPM=;
	b=nj1rsFqDdOUgqFcqa53ZcI4JJPNEcZtl+e8EnnvLYH9cL0/vL+aZZPlVk1I6QgphYNULR1W3n
	9TNuigPH+CJ4EA6bf1Af3Q3omTCTS//gs92iKsPSqS1/5b6ZdgHjDgxXmU9yG+5AD4kNGhOwZgL
	CrktkJTYr6lyGSXP7fRPiH0=
Received: from mail.maildlp.com (unknown [172.19.163.200])
	by canpmsgout11.his.huawei.com (SkyGuard) with ESMTPS id 4g1cfk19shzKm4w;
	Thu, 23 Apr 2026 21:40:30 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 5C8D54055B;
	Thu, 23 Apr 2026 21:46:55 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 23 Apr
 2026 21:46:54 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>
CC: <maz@kernel.org>, <timothy.hayes@arm.com>, <lpieralisi@kernel.org>,
	<mrigendra.chaubey@gmail.com>, <arnd@arndb.de>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<zhanjie9@hisilicon.com>, <zhenglifeng1@huawei.com>, <lihuisong@huawei.com>,
	<yubowen8@huawei.com>, <linhongye@h-partners.com>, <linuxarm@huawei.com>,
	<zhangpengjie2@huawei.com>, <wangzhi12@huawei.com>
Subject: [PATCH v2] arm64: smp: Do not mark secondary CPUs possible under nosmp
Date: Thu, 23 Apr 2026 21:46:54 +0800
Message-ID: <20260423134654.4178271-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_064711_291889_40849B40 
X-CRM114-Status: GOOD (  12.87  )
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

Under nosmp (maxcpus=0), arm64 never brings up secondary CPUs.

However, arm64 still enumerates firmware-described CPUs during SMP
initialization, which can leave secondary CPUs visible to
for_each_possible_cpu() users even though they never reach the
bringup path in this configuration.

This is not just a cosmetic mask mismatch: code iterating over
possible CPUs may observe secondary CPU per-CPU state that is never
fully initialized under nosmp.

Return early from smp_init_cpus() when nosmp/maxcpus=0 is in effect
so that secondary CPUs are not marked possible on arm64.

Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
Changes in v2:
- Drop the arch_disable_smp_support() approach.
- Handle nosmp/maxcpus=0 directly in smp_init_cpus().
- Update the changelog accordingly.
Link to v1:https://lore.kernel.org/all/20260422095831.2926775-1-zhangpengjie2@huawei.com/

---
 arch/arm64/kernel/smp.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/kernel/smp.c b/arch/arm64/kernel/smp.c
index 1aa324104afb..1b63846f646a 100644
--- a/arch/arm64/kernel/smp.c
+++ b/arch/arm64/kernel/smp.c
@@ -745,15 +745,21 @@ void __init smp_init_cpus(void)
 	else
 		acpi_parse_and_init_cpus();
 
-	if (cpu_count > nr_cpu_ids)
-		pr_warn("Number of cores (%d) exceeds configured maximum of %u - clipping\n",
-			cpu_count, nr_cpu_ids);
-
 	if (!bootcpu_valid) {
 		pr_err("missing boot CPU MPIDR, not enabling secondaries\n");
 		return;
 	}
 
+	/*
+	 * For the nosmp/maxcpus=0 case, do not mark the secondary CPUs
+	 * possible.
+	 */
+	if (!setup_max_cpus)
+		return;
+
+	if (cpu_count > nr_cpu_ids)
+		pr_warn("Number of cores (%d) exceeds configured maximum of %u - clipping\n",
+			cpu_count, nr_cpu_ids);
 	/*
 	 * We need to set the cpu_logical_map entries before enabling
 	 * the cpus so that cpu processor description entries (DT cpu nodes
-- 
2.33.0


