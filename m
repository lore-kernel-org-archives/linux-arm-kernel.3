Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E7CED11183
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5Dqh1/ZwDt2FOZnFxUGnYOMEzfM7bVg75Vg41Zs839w=; b=T207znLFVoRcsqx/JjXq2TFGvQ
	d4GXIwJge/y4trnom92pD8U86U9bRiNFtUy3ULfMc4Y06Ki4UQl1OPQQS6w/LI2eh11vBfxbtIpiz
	usyTu2V+R3OckyNaJ5FTZru8Wjt7t0Vbaq96apEEFijrNzHH1NyLH6Kp7w6HW7W/qYPBrqfQDbMXL
	DsSbmoGnlEeXLhpfTHL1e3b7k6+j0i3/eD4zvQNiDn6eOg66bJELGYcj6yXekFKStF0eu33t0h1t8
	6tZ2xf9k0OtmChmWB2TMv6qrJj0zvwcfgxVY5XZizr5T6JLYCY2GsfCxJSMGIPUyRrT7PqG93qp7S
	il7QPROA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcZ7-0000000Gj9S-1T7y;
	Thu, 27 Nov 2025 14:01:45 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcZ3-0000000Gj8B-2bbR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:01:43 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=5Dqh1/ZwDt2FOZnFxUGnYOMEzfM7bVg75Vg41Zs839w=;
	b=BrKKm1DqDzeaPEp+Ht6Vp/QY+ceSXm0RUwkjGBSqqCOPFcoSOx/71e0Mm1DqOC4+FFZh1hLY7
	DeUshsfdhtVNukB5sNmzhb4QBQ8AfnDJggNB9pw+skQQpKsXxsvzSyPat63XJ8AQU5aBvI3TFWH
	MPAJn5/2Zab6HVX1/S+Pimk=
Received: from mail.maildlp.com (unknown [172.19.162.254])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dHJ2l63Lrz1prLQ;
	Thu, 27 Nov 2025 21:59:43 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id 981F21804F6;
	Thu, 27 Nov 2025 22:01:33 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 27 Nov 2025 22:01:32 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <viro@zeniv.linux.org.uk>, <will@kernel.org>, <nico@fluxnic.net>,
	<rmk+kernel@armlinux.org.uk>, <linux@armlinux.org.uk>,
	<david.laight@runbox.com>, <rppt@kernel.org>, <vbabka@suse.cz>,
	<pfalcato@suse.de>, <brauner@kernel.org>, <lorenzo.stoakes@oracle.com>,
	<kuninori.morimoto.gx@renesas.com>, <tony@atomide.com>, <arnd@arndb.de>,
	<bigeasy@linutronix.de>, <akpm@linux-foundation.org>,
	<punitagrawal@gmail.com>, <hch@lst.de>, <jack@suse.com>, <rjw@rjwysocki.net>,
	<marc.zyngier@arm.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-mm@kvack.org>,
	<linux-kernel@vger.kernel.org>, <linux-fsdevel@vger.kernel.org>,
	<wozizhi@huaweicloud.com>, <liaohua4@huawei.com>, <lilinjie8@huawei.com>,
	<xieyuanbin1@huawei.com>, <pangliyuan1@huawei.com>,
	<wangkefeng.wang@huawei.com>
Subject: [RFC PATCH v2 2/2] ARM/mm/fault: Enable interrupts before sending signal
Date: Thu, 27 Nov 2025 22:01:09 +0800
Message-ID: <20251127140109.191657-2-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251127140109.191657-1-xieyuanbin1@huawei.com>
References: <20251127140109.191657-1-xieyuanbin1@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_060142_097330_B9FE7C4E 
X-CRM114-Status: GOOD (  10.54  )
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

From: xieyuanbin1 <xieyuanbin1@huawei.com>

Sending a signal requires to acquire sighand_struct::siglock which is a
spinlock_t. On PREEMPT_RT spinlock_t becomes a sleeping spin lock which
requires interrupts to be enabled. Since the calling context is user
land, interrupts must have been enabled so it is fine to enable them in
this case.

Signed-off-by: xieyuanbin1 <xieyuanbin1@huawei.com>
Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
---
This patch depends on patch
Link: https://lore.kernel.org/20251029155918.503060-6-bigeasy@linutronix.de

The commit message is copy from:
Link: https://lore.kernel.org/20251029155918.503060-3-bigeasy@linutronix.de

Maybe I should add:
Signed-off-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Or something else? Thanks!

 arch/arm/mm/fault.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/arm/mm/fault.c b/arch/arm/mm/fault.c
index 5c58072d8235..f8ee1854c854 100644
--- a/arch/arm/mm/fault.c
+++ b/arch/arm/mm/fault.c
@@ -184,10 +184,13 @@ __do_user_fault(unsigned long addr, unsigned int fsr, unsigned int sig,
 	struct task_struct *tsk = current;
 
 	if (addr > TASK_SIZE)
 		harden_branch_predictor();
 
+	if (IS_ENABLED(CONFIG_PREEMPT_RT))
+		local_irq_enable();
+
 #ifdef CONFIG_DEBUG_USER
 	if (((user_debug & UDBG_SEGV) && (sig == SIGSEGV)) ||
 	    ((user_debug & UDBG_BUS)  && (sig == SIGBUS))) {
 		pr_err("8<--- cut here ---\n");
 		pr_err("%s: unhandled page fault (%d) at 0x%08lx, code 0x%03x\n",
-- 
2.51.0


