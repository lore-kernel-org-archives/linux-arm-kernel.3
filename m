Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420FCCDB47F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Jun 2026 07:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=optLbU79fsFYP8qRGm+YcbhR39r3nfkhczlKBdhAWSE=; b=Bz46TIkgu+iPmV6wQjslnw1pVD
	QnC89/i8OiP5vweR5YT6bayt9H/7q8iN4k/XBI4MLEGqA8NCRcmRzDhmGCQomoVYLkD9kQEFH6tak
	HIvIXtswxC8HamSohod9zo5AHCcNDxw8S2QuunIrc50UOSBH7sgPMr5+PO1CJ9kEsXtvFL6oI2O+K
	PpVSFmk9WlJ20Ynjw/NYFo35RXwS2m2N5rmai+SboYCUPHoGulq3DAZaLxLFRRGYWMWXPQSGOXUgD
	z8zdIwXkhYmQGyReeoYpZ4sTWL+5Mqv1AZTZKOhP63hZRPM7a65hav+QOqeE0sCDzPzGRe1X9wtVz
	w265r4ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcecy-00000008lvh-2OTh;
	Thu, 25 Jun 2026 07:36:00 +0000
Received: from canpmsgout08.his.huawei.com ([113.46.200.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcecu-00000008ltN-3F54
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Jun 2026 07:35:59 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=optLbU79fsFYP8qRGm+YcbhR39r3nfkhczlKBdhAWSE=;
	b=LTqNkGrxOZqExbQfTmhbs7niHOm9yGbQNIcwLsXnrRracOZfteo2HbiNJZYjbzCGE8DiBnqL0
	eurfwO6Q0knDiasek63sL9uRsrccTplZHjpdTMM61VHYsoZF8oMVFs2JFGbxH5ZvO712Ybz1b/M
	bRaOxQmc0ry+asRSHps+R98=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout08.his.huawei.com (SkyGuard) with ESMTPS id 4gm9N25gLSzmV6t;
	Thu, 25 Jun 2026 15:26:26 +0800 (CST)
Received: from kwepemj100009.china.huawei.com (unknown [7.202.194.3])
	by mail.maildlp.com (Postfix) with ESMTPS id DCE7F4056E;
	Thu, 25 Jun 2026 15:35:32 +0800 (CST)
Received: from DESKTOP-A37P9LK.huawei.com (10.67.109.17) by
 kwepemj100009.china.huawei.com (7.202.194.3) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 25 Jun 2026 15:35:32 +0800
From: Xie Yuanbin <xieyuanbin1@huawei.com>
To: <linux@armlinux.org.uk>, <bigeasy@linutronix.de>, <clrkwllms@kernel.org>,
	<rostedt@goodmis.org>, <rmk+kernel@armlinux.org.uk>, <linusw@kernel.org>,
	<arnd@arndb.de>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<linux-rt-devel@lists.linux.dev>, <liaohua4@huawei.com>,
	<lilinjie8@huawei.com>, Xie Yuanbin <xieyuanbin1@huawei.com>
Subject: [PATCH] ARM: enable interrupts when arm_notify_die() is handling user mode errors
Date: Thu, 25 Jun 2026 15:35:22 +0800
Message-ID: <20260625073522.182503-1-xieyuanbin1@huawei.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.109.17]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemj100009.china.huawei.com (7.202.194.3)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_003557_419263_EF08B458 
X-CRM114-Status: GOOD (  10.07  )
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

For lastest linux-next kernel, with default multi_v7_defconfig, and
setting CONFIG_PREEMPT_RT=y, CONFIG_DEBUG_ATOMIC_SLEEP=y, and
CONFIG_PERF_EVENTS=n. When the user program executes bkpt
instruction, the following WARN will be triggered:
```log
[    3.677825] BUG: sleeping function called from invalid context at kernel/locking/spinlock_rt.c:48
[    3.678002] in_atomic(): 0, irqs_disabled(): 128, non_block: 0, pid: 84, name: test
[    3.678036] preempt_count: 0, expected: 0
[    3.678078] RCU nest depth: 0, expected: 0
[    3.678864] CPU: 0 UID: 0 PID: 84 Comm: test Tainted: G        W           7.1.0-next-20260623 #45 PREEMPT_RT
[    3.679067] Tainted: [W]=WARN
[    3.679088] Hardware name: Generic DT based system
[    3.679198] Call trace:
[    3.679695]  unwind_backtrace from show_stack+0x10/0x14
[    3.680363]  show_stack from dump_stack_lvl+0x50/0x5c
[    3.680377]  dump_stack_lvl from __might_resched+0x160/0x174
[    3.680393]  __might_resched from rt_spin_lock+0x38/0x138
[    3.680425]  rt_spin_lock from force_sig_info_to_task+0x1c/0x11c
[    3.680438]  force_sig_info_to_task from force_sig_fault+0x44/0x64
[    3.680450]  force_sig_fault from do_PrefetchAbort+0x94/0x9c
[    3.680461]  do_PrefetchAbort from ret_from_exception+0x0/0x20
[    3.680513] Exception stack(0xf0ab5fb0 to 0xf0ab5ff8)
[    3.680653] 5fa0:                                     00000000 bed32e94 bed32e9c 00037954
[    3.680672] 5fc0: 00000002 00000001 bed32e94 0009d590 00000000 bed32e9c 00000002 00000000
[    3.680682] 5fe0: bed32d48 bed32d38 00037a00 00037958 60000010 ffffffff
```

When PREEMPT_RT is enabled, force_sig_info() requires interrupts to be
enabled. Enable interrupts when arm_notify_die() is handling user mode
errors to fix the issue.

Fixes: c6e61c06d606 ("ARM: 9463/1: Allow to enable RT")

Cc: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Signed-off-by: Xie Yuanbin <xieyuanbin1@huawei.com>
---
 arch/arm/kernel/traps.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/kernel/traps.c b/arch/arm/kernel/traps.c
index afbd2ebe5c39..6aa205a92920 100644
--- a/arch/arm/kernel/traps.c
+++ b/arch/arm/kernel/traps.c
@@ -375,6 +375,7 @@ void arm_notify_die(const char *str, struct pt_regs *regs,
 		unsigned long err, unsigned long trap)
 {
 	if (user_mode(regs)) {
+		local_irq_enable();
 		current->thread.error_code = err;
 		current->thread.trap_no = trap;
 
-- 
2.53.0


