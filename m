Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF718C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oEPdaNKB6YIsTkM2uRuihyEBLUAqJZ7I+1wHKiIfC0I=; b=W+M41rbJC5uoD+vHDb/2KLpq8z
	sVCmOgATxx40veBaiMcYG+M0Cxhpb7MJJFBVR4FyfC5pkEuu7HW4hoeTdZ5vfDcOfWGA5C1gZkKPF
	k/8+q1pFgFKy5p2lsAptorXvWJn5TQ4lqvS3XFRsCAfsdNrYp6tGC+yZ2g/4yewpmGpj1gHY3/ZF2
	py5DJ0ciVhaTYlt8C2rH7BOiLYFfJ8L0sR1VLpPDPitYwm/CEM8VMXEdBSK2TkfTO+vt8kZdL0tMR
	1LXQcJQ1L+uPvgsHiJukgwf4axRpmqrLf6f2P27ZtHkKKAVDvtZV6VdgP9ZLz5+w4bY0I31S8A2in
	n5PX1ueA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZa4p-00000009bmQ-3gYY;
	Wed, 09 Jul 2025 19:03:31 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZUQ9-00000008igq-3z09
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 13:01:11 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4bcdMv2ktmz2FbNY;
	Wed,  9 Jul 2025 20:59:07 +0800 (CST)
Received: from kwepemk200017.china.huawei.com (unknown [7.202.194.83])
	by mail.maildlp.com (Postfix) with ESMTPS id 62EC0180044;
	Wed,  9 Jul 2025 21:01:02 +0800 (CST)
Received: from DESKTOP-8RFUVS3.china.huawei.com (10.174.178.219) by
 kwepemk200017.china.huawei.com (7.202.194.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 9 Jul 2025 21:01:01 +0800
From: Zenghui Yu <yuzenghui@huawei.com>
To: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <maz@kernel.org>, <tglx@linutronix.de>, <wanghaibin.wang@huawei.com>,
	Zenghui Yu <yuzenghui@huawei.com>
Subject: [PATCH] irqchip/gic-v3: Fix GICD_CTLR register naming
Date: Wed, 9 Jul 2025 21:00:46 +0800
Message-ID: <20250709130046.1354-1-yuzenghui@huawei.com>
X-Mailer: git-send-email 2.23.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.178.219]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 kwepemk200017.china.huawei.com (7.202.194.83)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_060110_180718_1BB94C04 
X-CRM114-Status: GOOD (  10.62  )
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

It was incorrectly named as GICD_CTRL in a pr_info() and comments. Fix
them.

Signed-off-by: Zenghui Yu <yuzenghui@huawei.com>
---
 drivers/irqchip/irq-gic-v3.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index efc791c43d44..dbeb85677b08 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -190,12 +190,12 @@ static void __init gic_prio_init(void)
 
 	/*
 	 * How priority values are used by the GIC depends on two things:
-	 * the security state of the GIC (controlled by the GICD_CTRL.DS bit)
+	 * the security state of the GIC (controlled by the GICD_CTLR.DS bit)
 	 * and if Group 0 interrupts can be delivered to Linux in the non-secure
 	 * world as FIQs (controlled by the SCR_EL3.FIQ bit). These affect the
 	 * way priorities are presented in ICC_PMR_EL1 and in the distributor:
 	 *
-	 * GICD_CTRL.DS | SCR_EL3.FIQ | ICC_PMR_EL1 | Distributor
+	 * GICD_CTLR.DS | SCR_EL3.FIQ | ICC_PMR_EL1 | Distributor
 	 * -------------------------------------------------------
 	 *      1       |      -      |  unchanged  |  unchanged
 	 * -------------------------------------------------------
@@ -223,7 +223,7 @@ static void __init gic_prio_init(void)
 		dist_prio_nmi = __gicv3_prio_to_ns(dist_prio_nmi);
 	}
 
-	pr_info("GICD_CTRL.DS=%d, SCR_EL3.FIQ=%d\n",
+	pr_info("GICD_CTLR.DS=%d, SCR_EL3.FIQ=%d\n",
 		cpus_have_security_disabled,
 		!cpus_have_group0);
 }
-- 
2.33.0


