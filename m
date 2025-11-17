Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03ECCCEBF9A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 13:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLrfgy8TOLZhKOg9TpR8Wk1N6DHgABzMsigfkHUhMuM=; b=z9ag4O7wey5jV7TYC2BByi82AY
	QaSX39wDQf4ATtf2759/Pn1BH3CoqW+/s2tdBC+QMtBz6uXhddWDLuqNloyxvRf4UNNKcgk4mhzR9
	Mx2R6t/RKVHK8UjQ+v7OPnWoPOqtyfWHZGf8yiS0OxhsDAHU7W6H4eNxIqFEcr65pQtIYliRL/OEH
	gP60XEvxIZvtsLBdhe04P10FS5/RMBeMDlOVYeiNhUEpWaagY4rXyqA7PesrzTPh9nNSiFkf4tEuh
	GDkxUcLZi8FPQxiDvDmAH6UHq3LpxvTkbPFJN64Al0umei/7rEnAQVA1ZDmNkk5vE6V4pANLGpttz
	TGuswL5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzKK-0000000GBDv-0EH5;
	Mon, 17 Nov 2025 13:31:28 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKzKC-0000000GB6H-0ozB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Nov 2025 13:31:21 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=dLrfgy8TOLZhKOg9TpR8Wk1N6DHgABzMsigfkHUhMuM=;
	b=l4fE+B9ZcmKRodkU19wgUeoEYbjgTYiJpAhW1gBJsI9B/Gynd68hmIhfHa7TxofVBEQomoGl0
	0PcO+Wqg2f+Vr6G6/uZ2ZiO4UEwEofN8BNdj0lw66KGA6FMeebwcgT0+5ihTjN0L/txrb2caviJ
	N38zBiqZXgCt9kfZz4dPkvE=
Received: from mail.maildlp.com (unknown [172.19.88.105])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4d97rQ2ZghzpTKW;
	Mon, 17 Nov 2025 21:29:26 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 42291140277;
	Mon, 17 Nov 2025 21:31:18 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 17 Nov
 2025 21:31:16 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<akpm@linux-foundation.org>, <ldv@strace.io>, <macro@orcam.me.uk>,
	<deller@gmx.de>, <mark.rutland@arm.com>, <song@kernel.org>, <mbenes@suse.cz>,
	<ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<anshuman.khandual@arm.com>, <broonie@kernel.org>, <kevin.brodsky@arm.com>,
	<pengcan@kylinos.cn>, <dvyukov@google.com>, <kmal@cock.li>,
	<lihongbo22@huawei.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v7 09/11] entry: Add has_syscall_work() helper
Date: Mon, 17 Nov 2025 21:30:46 +0800
Message-ID: <20251117133048.53182-10-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251117133048.53182-1-ruanjinjie@huawei.com>
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_053120_400149_2D2AA054 
X-CRM114-Status: UNSURE (   9.06  )
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

Add has_syscall_work() helper to facilitate reuse of this
function in other places.

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index cd6dacb2d8bf..e0f94e937e84 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -44,6 +44,11 @@
 				 SYSCALL_WORK_SYSCALL_EXIT_TRAP	|	\
 				 ARCH_SYSCALL_WORK_EXIT)
 
+static inline bool has_syscall_work(unsigned long work)
+{
+	return unlikely(work & SYSCALL_WORK_ENTER);
+}
+
 /**
  * syscall_enter_from_user_mode_prepare - Establish state and enable interrupts
  * @regs:	Pointer to currents pt_regs
@@ -91,7 +96,7 @@ static __always_inline long syscall_enter_from_user_mode_work(struct pt_regs *re
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 
-	if (work & SYSCALL_WORK_ENTER)
+	if (has_syscall_work(work))
 		syscall = syscall_trace_enter(regs, syscall, work);
 
 	return syscall;
-- 
2.34.1


