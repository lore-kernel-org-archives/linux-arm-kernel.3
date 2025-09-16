Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FF3CCAC59E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Sep 2025 08:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7VSQzrso9GSPLc8m0QenwYICMxW9oDwCZBjF11X5ag=; b=RYsABYymMYaPAWtLNyyqM0qthM
	Pu0RBS+ntGO3SQGg1TDbUrF4pifrYJwskfnyeCvisvdc/O+5Y34FV/TfvuLoa6Dm83qE4C8MhKIfL
	TqS7WO5Ka6+/JyBxA+szcpuvQcDsKvEDBih1q2B7i1tVd4Ct8kQkjgfRjmzhIfmLfrJ8ol+8uTwkL
	DQn5Y+iuBpvwSlr0ZWt62U+jhNiunfL/sXWrjA6zOE0xz3Fo2FTrjo8mZdV1YDJSApExfuytzngMu
	1BgHUkQ+OCmcgk+7Ds8OmL1wde3kE+npWlTxfyBvBH1qjw1bZW4PXIRyRdZXUAqQHhxBUId+NC8aD
	vWr4goDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0q-00000007B5o-0AhS;
	Tue, 16 Sep 2025 08:26:08 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyR0R-00000007AjX-3p4v
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Sep 2025 08:25:47 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4cQw1T0KFGztTYX;
	Tue, 16 Sep 2025 16:24:45 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 30963180087;
	Tue, 16 Sep 2025 16:25:39 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 16 Sep
 2025 16:25:38 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<kees@kernel.org>, <wad@chromium.org>, <charlie@rivosinc.com>,
	<macro@orcam.me.uk>, <deller@gmx.de>, <akpm@linux-foundation.org>,
	<ldv@strace.io>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH -next v6 04/10] entry: Extract syscall_exit_to_user_mode_prepare() helper
Date: Tue, 16 Sep 2025 16:26:05 +0800
Message-ID: <20250916082611.2972008-5-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250916082611.2972008-1-ruanjinjie@huawei.com>
References: <20250916082611.2972008-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250916_012544_279557_429AACD4 
X-CRM114-Status: GOOD (  12.09  )
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

In the generic entry code, the part before
syscall_exit_to_user_mode_work() calls syscall_exit_work(), which
serves the same purpose as syscall_exit_to_user_mode_prepare()
in arm64.

In preparation for moving arm64 over to the generic entry
code, extract syscall_exit_to_user_mode_prepare() helper from
syscall_exit_to_user_mode_work().

No functional changes.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 7177436f0f9e..cd6dacb2d8bf 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -137,20 +137,11 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
  */
 void syscall_exit_work(struct pt_regs *regs, unsigned long work);
 
-/**
- * syscall_exit_to_user_mode_work - Handle work before returning to user mode
- * @regs:	Pointer to currents pt_regs
- *
- * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
- * exit_to_user_mode() to perform the final transition to user mode.
- *
- * Calling convention is the same as for syscall_exit_to_user_mode() and it
- * returns with all work handled and interrupts disabled. The caller must
- * invoke exit_to_user_mode() before actually switching to user mode to
- * make the final state transitions. Interrupts must stay disabled between
- * return from this function and the invocation of exit_to_user_mode().
+/*
+ * Syscall specific exit to user mode preparation. Runs with interrupts
+ * enabled.
  */
-static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+static __always_inline void syscall_exit_to_user_mode_prepare(struct pt_regs *regs)
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	unsigned long nr = syscall_get_nr(current, regs);
@@ -171,6 +162,24 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
 	 */
 	if (unlikely(work & SYSCALL_WORK_EXIT))
 		syscall_exit_work(regs, work);
+}
+
+/**
+ * syscall_exit_to_user_mode_work - Handle work before returning to user mode
+ * @regs:	Pointer to currents pt_regs
+ *
+ * Same as step 1 and 2 of syscall_exit_to_user_mode() but without calling
+ * exit_to_user_mode() to perform the final transition to user mode.
+ *
+ * Calling convention is the same as for syscall_exit_to_user_mode() and it
+ * returns with all work handled and interrupts disabled. The caller must
+ * invoke exit_to_user_mode() before actually switching to user mode to
+ * make the final state transitions. Interrupts must stay disabled between
+ * return from this function and the invocation of exit_to_user_mode().
+ */
+static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
+{
+	syscall_exit_to_user_mode_prepare(regs);
 	local_irq_disable_exit_to_user();
 	exit_to_user_mode_prepare(regs);
 }
-- 
2.34.1


