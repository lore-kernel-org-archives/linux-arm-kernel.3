Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12AD5E8782A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Feb 2026 13:39:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ons0IhYAi+tEtZUFK+VtoCYghx5q1a+Q3OdvFvSt4HA=; b=j42MEn6Sz9jxc6aMKWmzyB6shm
	ZVgXfekGCzvLxJ9p9C6o+4gCaX3XF8hU5f0Vi1vrsWfrsLTkZNwGxZ9HKKqRIncI0rpq79bj03m4y
	Kp0pGTKt/cewEPyTOLxfFjlvATiElVY/t7I3c3BT86Rz+EAoJTTjKISO0u/tpW9SvpLYwAcLYJ6y2
	Mjri7njEOz7D3buwwBH0nzybYv0Lqz0xxYWk8ll907aMqs6hfYFhIE0q/d/nGznqmypFl662Gvz9i
	L4Sbk96ArAaJiytQ4HAFspYn9aZlUMhoYY6KAJ5V3UsXFOCI4fh9qBDOHk5iqMNPQyeTCsP/GON44
	aRXPYD/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGd2-00000006hJd-3Alv;
	Tue, 03 Feb 2026 13:39:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGd2-00000006hJQ-0imu
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 03 Feb 2026 13:39:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Ons0IhYAi+tEtZUFK+VtoCYghx5q1a+Q3OdvFvSt4HA=; b=B6kaWnG4xnR4tnJnjcMbzD23Ic
	HDQXFoaZAxhn1hcM1gcG0pEl3UxQvD38BRzMKe5US9BWF51Y8M2g/vufl0XuDitr7eKEQS8vwS9jk
	Uz7ikGCznG/FfV2k0aoN3YctsWtkVKjzT8QuLFFAs/dR29LLmjAO2iGC7bHN4QDmvHmND3C0D4Law
	L6NvRra3g+Qsia5YFLEeLx1Kd9Ah8Zuv24DQ9csiRO/gAhduy8bowjlt71X8uosJWPLZ+UZCBH2jR
	kcDcZTtc0GjhfzLjjI6wupAhbqmjkAWUmK9EFZbqT/4MMLLU316U/pVLwxB42JNOsLZQ2BeAoyhw5
	0cmcRKhg==;
Received: from canpmsgout07.his.huawei.com ([113.46.200.222])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnGcy-0000000GKMG-42sB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Feb 2026 13:39:39 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Ons0IhYAi+tEtZUFK+VtoCYghx5q1a+Q3OdvFvSt4HA=;
	b=0w4EcgaxjWXO4fx3WCpCxX5bgqbHY2Orz6MhI0dStAiNMe69vkFa7eMtJkrFlU9OkS/q8CrRd
	G2oyHfRDPxmBgUK5Y1N9uLOBQQCERW6gSillJ9Exev/JzmoBFwO2aCHW3EBRtQSH0BSqPRh4Dka
	tRlr6UdpRmasAjEEiWqInyU=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout07.his.huawei.com (SkyGuard) with ESMTPS id 4f54DH6SwdzLlwZ;
	Tue,  3 Feb 2026 21:32:47 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 625C640565;
	Tue,  3 Feb 2026 21:37:21 +0800 (CST)
Received: from huawei.com (10.90.53.73) by dggpemf500011.china.huawei.com
 (7.185.36.131) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 3 Feb
 2026 21:37:19 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <catalin.marinas@arm.com>, <will@kernel.org>, <oleg@redhat.com>,
	<shuah@kernel.org>, <kees@kernel.org>, <luto@amacapital.net>,
	<wad@chromium.org>, <kevin.brodsky@arm.com>, <akpm@linux-foundation.org>,
	<charlie@rivosinc.com>, <ldv@strace.io>, <anshuman.khandual@arm.com>,
	<mark.rutland@arm.com>, <ryan.roberts@arm.com>, <thuth@redhat.com>,
	<song@kernel.org>, <ada.coupriediaz@arm.com>, <broonie@kernel.org>,
	<pengcan@kylinos.cn>, <liqiang01@kylinos.cn>, <kmal@cock.li>,
	<tglx@kernel.org>, <dvyukov@google.com>, <reddybalavignesh9979@gmail.com>,
	<richard.weiyang@gmail.com>, <linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH v12 10/13] arm64/ptrace: Do not report_syscall_exit() for PTRACE_SYSEMU_SINGLESTEP
Date: Tue, 3 Feb 2026 21:37:25 +0800
Message-ID: <20260203133728.848283-11-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260203133728.848283-1-ruanjinjie@huawei.com>
References: <20260203133728.848283-1-ruanjinjie@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: kwepems200002.china.huawei.com (7.221.188.68) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_133937_628018_1295D4D3 
X-CRM114-Status: GOOD (  14.82  )
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

The generic report_single_step() always returns false if SYSCALL_EMU
is set, but arm64 only checks _TIF_SINGLESTEP and does not check
_TIF_SYSCALL_EMU, which means that if both _TIF_SINGLESTEP and
_TIF_SYSCALL_EMU are set, the generic entry will not report
a single-step, whereas arm64 will do it.

As the man manual of PTRACE_SYSEMU and PTRACE_SYSEMU_SINGLESTEP said,
"For PTRACE_SYSEMU, continue and stop on entry to the next system
call, which will not be executed. For PTRACE_SYSEMU_SINGLESTEP, do the
same but also singlestep if not a system call.". And as the generic entry
report_single_step() comment said, If SYSCALL_EMU is set, then the only
reason to report is when SINGLESTEP is set (i.e. PTRACE_SYSEMU_SINGLESTEP).
Because this syscall instruction has been already reported
in syscall_trace_enter(), there is no need to report the syscall
again in syscall_exit_work().

In preparation for moving arm64 over to the generic entry code,

- Add report_single_step() helper for arm64 to make it clear.

- Do not report_syscall_exit() if both _TIF_SYSCALL_EMU and
  _TIF_SINGLESTEP set.

Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 arch/arm64/kernel/ptrace.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/kernel/ptrace.c b/arch/arm64/kernel/ptrace.c
index e68aa386ea48..6e86aec8d607 100644
--- a/arch/arm64/kernel/ptrace.c
+++ b/arch/arm64/kernel/ptrace.c
@@ -2453,14 +2453,25 @@ int syscall_trace_enter(struct pt_regs *regs, unsigned long flags)
 	return ret ? : syscall;
 }
 
+static inline bool report_single_step(unsigned long flags)
+{
+	if (flags & _TIF_SYSCALL_EMU)
+		return false;
+
+	return flags & _TIF_SINGLESTEP;
+}
+
 static void syscall_exit_work(struct pt_regs *regs, unsigned long flags)
 {
+	bool step;
+
 	audit_syscall_exit(regs);
 
 	if (flags & _TIF_SYSCALL_TRACEPOINT)
 		trace_sys_exit(regs, syscall_get_return_value(current, regs));
 
-	if (flags & (_TIF_SYSCALL_TRACE | _TIF_SINGLESTEP))
+	step = report_single_step(flags);
+	if (step || flags & _TIF_SYSCALL_TRACE)
 		report_syscall_exit(regs);
 }
 
-- 
2.34.1


