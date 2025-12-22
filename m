Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87083E6749B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Dec 2025 11:48:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sde7CMqad4MudR5Jd+IXLkECaEABP+JRMCA+DT9KOB4=; b=OtW6u2MicpnymtOlvy5Q1twe2n
	KPJc7cfrYkiCuvXvlG3fzV4VdYHBzgNdCbBO9uHYLqZ+WL61/YcITYDdK0pUftjbcz3QumUhrnKnx
	p+H8dmCuo6zZhl8rnqjI1ktyeOXgAOp/NMLA8i3RDsBbCiGXNXL53aBirQ5DVB0rIK4eJSvohXgcE
	Wcj9oHlERrIpKEJhvq8UJgfjYx/Z1WTSI3WkHbuE0IKxOhH3XY4VyCaUAW7bbMLA38U45cxTb8Atr
	VictnEUzQxORgrQJttDblHgMgD0yCOKJna/VDm3RjbkaGNrSjuQe4o/L+t+ZRpGUWiK/gUNDkfMoG
	uVe/YvUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXePE-0000000Dgm8-3fNY;
	Mon, 22 Dec 2025 11:48:52 +0000
Received: from canpmsgout03.his.huawei.com ([113.46.200.218])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vXeOs-0000000DgYU-3ApR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 22 Dec 2025 11:48:34 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sde7CMqad4MudR5Jd+IXLkECaEABP+JRMCA+DT9KOB4=;
	b=xPs06yj3mTcRkpRgDd4jfclYERlGEN3F/fY0JBYc3/FMKcu+f2TeRWGEqH0q0671TTazyV1r7
	IPLOb/3Y84yNtv9mujOunZJlLkKoovplXrrC0iiesidcfjqpgBO0+5Savo4Ob+0118AnXeF2K3x
	D6ewwjWohJ/p12Kd6cx23jc=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout03.his.huawei.com (SkyGuard) with ESMTPS id 4dZbtR5M9SzpSy3;
	Mon, 22 Dec 2025 19:45:35 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id DF0D940363;
	Mon, 22 Dec 2025 19:48:28 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 22 Dec
 2025 19:48:27 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<tglx@linutronix.de>, <peterz@infradead.org>, <luto@kernel.org>,
	<shuah@kernel.org>, <kees@kernel.org>, <wad@chromium.org>,
	<ruanjinjie@huawei.com>, <kevin.brodsky@arm.com>, <macro@orcam.me.uk>,
	<charlie@rivosinc.com>, <akpm@linux-foundation.org>, <ldv@strace.io>,
	<anshuman.khandual@arm.com>, <mark.rutland@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ryan.roberts@arm.com>, <ada.coupriediaz@arm.com>,
	<broonie@kernel.org>, <liqiang01@kylinos.cn>, <pengcan@kylinos.cn>,
	<kmal@cock.li>, <dvyukov@google.com>, <richard.weiyang@gmail.com>,
	<reddybalavignesh9979@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
Subject: [PATCH v10 11/16] entry: Split syscall_exit_to_user_mode_work() for arch reuse
Date: Mon, 22 Dec 2025 19:47:32 +0800
Message-ID: <20251222114737.1334364-12-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222114737.1334364-1-ruanjinjie@huawei.com>
References: <20251222114737.1334364-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251222_034833_868458_625E915C 
X-CRM114-Status: GOOD (  13.95  )
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

In the generic entry code, the beginning of
syscall_exit_to_user_mode_work() can be reused on arm64 so it makes
sense to split it.

In preparation for moving arm64 over to the generic entry
code, split out syscall_exit_to_user_mode_work_prepare() helper from
syscall_exit_to_user_mode_work().

No functional changes.

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
Reviewed-by: Thomas Gleixner <tglx@linutronix.de>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 include/linux/entry-common.h | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 87efb38b7081..0de0e60630e1 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -121,20 +121,11 @@ static __always_inline long syscall_enter_from_user_mode(struct pt_regs *regs, l
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
+static __always_inline void syscall_exit_to_user_mode_work_prepare(struct pt_regs *regs)
 {
 	unsigned long work = READ_ONCE(current_thread_info()->syscall_work);
 	unsigned long nr = syscall_get_nr(current, regs);
@@ -155,6 +146,24 @@ static __always_inline void syscall_exit_to_user_mode_work(struct pt_regs *regs)
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
+	syscall_exit_to_user_mode_work_prepare(regs);
 	local_irq_disable_exit_to_user();
 	syscall_exit_to_user_mode_prepare(regs);
 }
-- 
2.34.1


